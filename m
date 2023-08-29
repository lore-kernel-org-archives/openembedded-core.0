Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7AAAC83F17
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 12:09:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.15731.1693310966681590976
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Aug 2023 05:09:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05E142F4;
	Tue, 29 Aug 2023 05:10:05 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1A2003F64C;
	Tue, 29 Aug 2023 05:09:24 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/3] inetutils: fix CVE-2023-40303
Date: Tue, 29 Aug 2023 13:09:21 +0100
Message-Id: <20230829120923.3982702-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Aug 2023 12:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186857

From: Ross Burton <ross.burton@arm.com>

Backport the patch from upstream.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...rsh-rshd-uucpd-fix-check-set-id-retu.patch | 283 ++++++++++++++++++
 .../inetutils/inetutils_2.4.bb                |   1 +
 2 files changed, 284 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/0001-ft=
pd-rcp-rlogin-rsh-rshd-uucpd-fix-check-set-id-retu.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/0001-ftpd-rcp-=
rlogin-rsh-rshd-uucpd-fix-check-set-id-retu.patch b/meta/recipes-connecti=
vity/inetutils/inetutils/0001-ftpd-rcp-rlogin-rsh-rshd-uucpd-fix-check-se=
t-id-retu.patch
new file mode 100644
index 00000000000..42353d147c6
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/0001-ftpd-rcp-rlogin-=
rsh-rshd-uucpd-fix-check-set-id-retu.patch
@@ -0,0 +1,283 @@
+From 21a6e7be1935c966d7247bdeb7e2a2cec4b63ba9 Mon Sep 17 00:00:00 2001
+From: Jeffrey Bencteux <jeffbencteux@gmail.com>
+Date: Fri, 30 Jun 2023 19:02:45 +0200
+Subject: [PATCH] ftpd,rcp,rlogin,rsh,rshd,uucpd: fix: check set*id() ret=
urn
+ values
+
+Several setuid(), setgid(), seteuid() and setguid() return values
+were not checked in ftpd/rcp/rlogin/rsh/rshd/uucpd code potentially
+leading to potential security issues.
+
+Signed-off-by: Jeffrey Bencteux <jeffbencteux@gmail.com>
+Signed-off-by: Simon Josefsson <simon@josefsson.org>
+
+CVE: CVE-2023-40303
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ ftpd/ftpd.c  | 10 +++++++---
+ src/rcp.c    | 39 +++++++++++++++++++++++++++++++++------
+ src/rlogin.c | 11 +++++++++--
+ src/rsh.c    | 25 +++++++++++++++++++++----
+ src/rshd.c   | 20 +++++++++++++++++---
+ src/uucpd.c  | 15 +++++++++++++--
+ 6 files changed, 100 insertions(+), 20 deletions(-)
+
+diff --git a/ftpd/ftpd.c b/ftpd/ftpd.c
+index 92b2cca5..28dd523f 100644
+--- a/ftpd/ftpd.c
++++ b/ftpd/ftpd.c
+@@ -862,7 +862,9 @@ end_login (struct credentials *pcred)
+   char *remotehost =3D pcred->remotehost;
+   int atype =3D pcred->auth_type;
+=20
+-  seteuid ((uid_t) 0);
++  if (seteuid ((uid_t) 0) =3D=3D -1)
++    _exit (EXIT_FAILURE);
++
+   if (pcred->logged_in)
+     {
+       logwtmp_keep_open (ttyline, "", "");
+@@ -1151,7 +1153,8 @@ getdatasock (const char *mode)
+=20
+   if (data >=3D 0)
+     return fdopen (data, mode);
+-  seteuid ((uid_t) 0);
++  if (seteuid ((uid_t) 0) =3D=3D -1)
++    _exit (EXIT_FAILURE);
+   s =3D socket (ctrl_addr.ss_family, SOCK_STREAM, 0);
+   if (s < 0)
+     goto bad;
+@@ -1978,7 +1981,8 @@ passive (int epsv, int af)
+   else	/* !AF_INET6 */
+     ((struct sockaddr_in *) &pasv_addr)->sin_port =3D 0;
+=20
+-  seteuid ((uid_t) 0);
++  if (seteuid ((uid_t) 0) =3D=3D -1)
++    _exit (EXIT_FAILURE);
+   if (bind (pdata, (struct sockaddr *) &pasv_addr, pasv_addrlen) < 0)
+     {
+       if (seteuid ((uid_t) cred.uid))
+diff --git a/src/rcp.c b/src/rcp.c
+index 75adb253..cdcf8500 100644
+--- a/src/rcp.c
++++ b/src/rcp.c
+@@ -345,14 +345,23 @@ main (int argc, char *argv[])
+   if (from_option)
+     {				/* Follow "protocol", send data. */
+       response ();
+-      setuid (userid);
++
++      if (setuid (userid) =3D=3D -1)
++      {
++        error (EXIT_FAILURE, 0, "Could not drop privileges (setuid() fa=
iled)");
++      }
++
+       source (argc, argv);
+       exit (errs);
+     }
+=20
+   if (to_option)
+     {				/* Receive data. */
+-      setuid (userid);
++      if (setuid (userid) =3D=3D -1)
++      {
++        error (EXIT_FAILURE, 0, "Could not drop privileges (setuid() fa=
iled)");
++      }
++
+       sink (argc, argv);
+       exit (errs);
+     }
+@@ -537,7 +546,11 @@ toremote (char *targ, int argc, char *argv[])
+ 	      if (response () < 0)
+ 		exit (EXIT_FAILURE);
+ 	      free (bp);
+-	      setuid (userid);
++
++	      if (setuid (userid) =3D=3D -1)
++              {
++                error (EXIT_FAILURE, 0, "Could not drop privileges (set=
uid() failed)");
++              }
+ 	    }
+ 	  source (1, argv + i);
+ 	  close (rem);
+@@ -630,7 +643,12 @@ tolocal (int argc, char *argv[])
+ 	  ++errs;
+ 	  continue;
+ 	}
+-      seteuid (userid);
++
++      if (seteuid (userid) =3D=3D -1)
++      {
++        error (EXIT_FAILURE, 0, "Could not drop privileges (seteuid() f=
ailed)");
++      }
++
+ #if defined IP_TOS && defined IPPROTO_IP && defined IPTOS_THROUGHPUT
+       sslen =3D sizeof (ss);
+       (void) getpeername (rem, (struct sockaddr *) &ss, &sslen);
+@@ -643,7 +661,12 @@ tolocal (int argc, char *argv[])
+ #endif
+       vect[0] =3D target;
+       sink (1, vect);
+-      seteuid (effuid);
++
++      if (seteuid (effuid) =3D=3D -1)
++      {
++        error (EXIT_FAILURE, 0, "Could not drop privileges (seteuid() f=
ailed)");
++      }
++
+       close (rem);
+       rem =3D -1;
+ #ifdef SHISHI
+@@ -1441,7 +1464,11 @@ susystem (char *s, int userid)
+       return (127);
+=20
+     case 0:
+-      setuid (userid);
++      if (setuid (userid) =3D=3D -1)
++      {
++        error (EXIT_FAILURE, 0, "Could not drop privileges (setuid() fa=
iled)");
++      }
++
+       execl (PATH_BSHELL, "sh", "-c", s, NULL);
+       _exit (127);
+     }
+diff --git a/src/rlogin.c b/src/rlogin.c
+index aa6426fb..c543de0c 100644
+--- a/src/rlogin.c
++++ b/src/rlogin.c
+@@ -647,8 +647,15 @@ try_connect:
+   /* Now change to the real user ID.  We have to be set-user-ID root
+      to get the privileged port that rcmd () uses.  We now want, howeve=
r,
+      to run as the real user who invoked us.  */
+-  seteuid (uid);
+-  setuid (uid);
++  if (seteuid (uid) =3D=3D -1)
++  {
++    error (EXIT_FAILURE, 0, "Could not drop privileges (seteuid() faile=
d)");
++  }
++
++  if (setuid (uid) =3D=3D -1)
++  {
++    error (EXIT_FAILURE, 0, "Could not drop privileges (setuid() failed=
)");
++  }
+=20
+   doit (&osmask);	/* The old mask will activate SIGURG and SIGUSR1!  */
+=20
+diff --git a/src/rsh.c b/src/rsh.c
+index 2d622ca4..6f60667d 100644
+--- a/src/rsh.c
++++ b/src/rsh.c
+@@ -276,8 +276,17 @@ main (int argc, char **argv)
+     {
+       if (asrsh)
+ 	*argv =3D (char *) "rlogin";
+-      seteuid (getuid ());
+-      setuid (getuid ());
++
++      if (seteuid (getuid ()) =3D=3D -1)
++      {
++        error (EXIT_FAILURE, errno, "seteuid() failed");
++      }
++
++      if (setuid (getuid ()) =3D=3D -1)
++      {
++        error (EXIT_FAILURE, errno, "setuid() failed");
++      }
++
+       execv (PATH_RLOGIN, argv);
+       error (EXIT_FAILURE, errno, "cannot execute %s", PATH_RLOGIN);
+     }
+@@ -541,8 +550,16 @@ try_connect:
+ 	error (0, errno, "setsockopt DEBUG (ignored)");
+     }
+=20
+-  seteuid (uid);
+-  setuid (uid);
++  if (seteuid (uid) =3D=3D -1)
++  {
++    error (EXIT_FAILURE, errno, "seteuid() failed");
++  }
++
++  if (setuid (uid) =3D=3D -1)
++  {
++    error (EXIT_FAILURE, errno, "setuid() failed");
++  }
++
+ #ifdef HAVE_SIGACTION
+   sigemptyset (&sigs);
+   sigaddset (&sigs, SIGINT);
+diff --git a/src/rshd.c b/src/rshd.c
+index d1c0d0cd..707790e7 100644
+--- a/src/rshd.c
++++ b/src/rshd.c
+@@ -1847,8 +1847,18 @@ doit (int sockfd, struct sockaddr *fromp, socklen=
_t fromlen)
+     pwd->pw_shell =3D PATH_BSHELL;
+=20
+   /* Set the gid, then uid to become the user specified by "locuser" */
+-  setegid ((gid_t) pwd->pw_gid);
+-  setgid ((gid_t) pwd->pw_gid);
++  if (setegid ((gid_t) pwd->pw_gid) =3D=3D -1)
++  {
++    rshd_error ("Cannot drop privileges (setegid() failed)\n");
++    exit (EXIT_FAILURE);
++  }
++
++  if (setgid ((gid_t) pwd->pw_gid) =3D=3D -1)
++  {
++    rshd_error ("Cannot drop privileges (setgid() failed)\n");
++    exit (EXIT_FAILURE);
++  }
++
+ #ifdef HAVE_INITGROUPS
+   initgroups (pwd->pw_name, pwd->pw_gid);	/* BSD groups */
+ #endif
+@@ -1870,7 +1880,11 @@ doit (int sockfd, struct sockaddr *fromp, socklen=
_t fromlen)
+     }
+ #endif /* WITH_PAM */
+=20
+-  setuid ((uid_t) pwd->pw_uid);
++  if (setuid ((uid_t) pwd->pw_uid) =3D=3D -1)
++  {
++    rshd_error ("Cannot drop privileges (setuid() failed)\n");
++    exit (EXIT_FAILURE);
++  }
+=20
+   /* We'll execute the client's command in the home directory
+    * of locuser. Note, that the chdir must be executed after
+diff --git a/src/uucpd.c b/src/uucpd.c
+index 107589e1..29cfce35 100644
+--- a/src/uucpd.c
++++ b/src/uucpd.c
+@@ -252,7 +252,12 @@ doit (struct sockaddr *sap, socklen_t salen)
+   snprintf (Username, sizeof (Username), "USER=3D%s", user);
+   snprintf (Logname, sizeof (Logname), "LOGNAME=3D%s", user);
+   dologin (pw, sap, salen);
+-  setgid (pw->pw_gid);
++
++  if (setgid (pw->pw_gid) =3D=3D -1)
++  {
++    fprintf (stderr, "setgid() failed");
++    return;
++  }
+ #ifdef HAVE_INITGROUPS
+   initgroups (pw->pw_name, pw->pw_gid);
+ #endif
+@@ -261,7 +266,13 @@ doit (struct sockaddr *sap, socklen_t salen)
+       fprintf (stderr, "Login incorrect.");
+       return;
+     }
+-  setuid (pw->pw_uid);
++
++  if (setuid (pw->pw_uid) =3D=3D -1)
++  {
++    fprintf (stderr, "setuid() failed");
++    return;
++  }
++
+   execl (uucico_location, "uucico", NULL);
+   perror ("uucico server: execl");
+ }
+--=20
+2.34.1
+
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.4.bb b/meta/=
recipes-connectivity/inetutils/inetutils_2.4.bb
index bcc3a0258e6..9b4c98d63cc 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.4.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.4.bb
@@ -22,6 +22,7 @@ SRC_URI =3D "${GNU_MIRROR}/inetutils/inetutils-${PV}.ta=
r.xz \
            file://tftpd.xinetd.inetutils \
            file://inetutils-1.9-PATH_PROCNET_DEV.patch \
            file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch=
 \
+           file://0001-ftpd-rcp-rlogin-rsh-rshd-uucpd-fix-check-set-id-r=
etu.patch \
 "
=20
 inherit autotools gettext update-alternatives texinfo
--=20
2.34.1


