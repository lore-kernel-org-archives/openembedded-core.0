Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD68EB8FA5
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 08:15:40 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web10.3792.1693988138908044858
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 01:15:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=b1zc0eO6;
 spf=pass (domain: mvista.com, ip: 209.85.210.41, mailfrom: sdoshi@mvista.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6bcb5df95c5so2668942a34.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 01:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1693988138; x=1694592938; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S8fwaL5/pndLdj/Xva0FjCCPzdRJckaNuv9Xr43JP2s=;
        b=b1zc0eO6azgTkTZWP3BAuP8qbxKYo50HP/T2zNo1ZTUXnqI3jhrMlIuvcWmo0dYXVy
         qhfrR7BaVGtouEGqBd4lcGCNgC72NCtKTyoZ89XK0FOngcCH04dvl17cwM0h1FLCSM4t
         o2ZKRV89RcE2TUah+8aWUOsbg9QlcyR1MCo4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693988138; x=1694592938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S8fwaL5/pndLdj/Xva0FjCCPzdRJckaNuv9Xr43JP2s=;
        b=PtzOWeATyBuH6gbtjk05QcAetE8vgVD6MH+KXECZB7LK+N+WNVXDJ6Ec0RGMh3Xsy8
         PoV/Ltq+rRNA53Uvbip2ekifHnzjVBWBg3gWi00XfTVXK0zKOjkslV79iihqR50ozm3Q
         3AwaiuCHBWF5/GHdux/22Xxm7J12Dx39lj6wggZXJAF9T0tw/oJavqSixQehlAOCli3g
         aDc/rE41xoDYHGzSOPJGjl0fRqNcymHCl5tH+RC7xYQmw70mf6Yqsz2pQQ9hL2foAzlx
         HS66wlQ9AzBtydVs4sjFvq1NmatJ3ZTpDZDZH1Wdz7TbG29gqSRihMuXyvZx+mvcIG8D
         IuLw==
X-Gm-Message-State: AOJu0YxTcVQBSfowWE4lVi+KO9wUjiXjn//oSqwqhRqzzyddd6O3MiUa
	WKAsrQIkQqELd0E79XvXeE7/7iMTnlteL/HW9pI=
X-Google-Smtp-Source: AGHT+IHF20jPdhQWTq1d8mw9Bf822Qyl951ayrhIUSZr3LndamrtueFKpwzQTdaXJTW0/yRs+SN4iw==
X-Received: by 2002:a9d:6397:0:b0:6bc:86f1:f24e with SMTP id w23-20020a9d6397000000b006bc86f1f24emr17988613otk.12.1693988137690;
        Wed, 06 Sep 2023 01:15:37 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([49.34.39.115])
        by smtp.gmail.com with ESMTPSA id m185-20020a633fc2000000b005642314f05fsm10542934pga.1.2023.09.06.01.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 01:15:37 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][kirkstone][PATCH] inetutils: Security fix for CVE-2023-40303
Date: Wed,  6 Sep 2023 13:45:30 +0530
Message-Id: <20230906081530.176583-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 08:15:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187285

From: Siddharth Doshi <sdoshi@mvista.com>

Upstream-Status: Backport from [https://git.savannah.gnu.org/cgit/inetutils.git/commit/?id=e4e65c03f4c11292a3e40ef72ca3f194c8bffdd6]
CVE: CVE-2023-40303
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../inetutils/inetutils/CVE-2023-40303.patch  | 283 ++++++++++++++++++
 .../inetutils/inetutils_2.2.bb                |   1 +
 2 files changed, 284 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2023-40303.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2023-40303.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2023-40303.patch
new file mode 100644
index 0000000000..06f7f2fc00
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/CVE-2023-40303.patch
@@ -0,0 +1,283 @@
+From e4e65c03f4c11292a3e40ef72ca3f194c8bffdd6 Mon Sep 17 00:00:00 2001
+From: Jeffrey Bencteux <jeffbencteux@gmail.com>
+Date: Fri, 30 Jun 2023 19:02:45 +0200
+Subject: ftpd,rcp,rlogin,rsh,rshd,uucpd: fix: check set*id() return values
+
+Several setuid(), setgid(), seteuid() and setguid() return values
+were not checked in ftpd/rcp/rlogin/rsh/rshd/uucpd code potentially
+leading to potential security issues.
+
+Signed-off-by: Jeffrey Bencteux <jeffbencteux@gmail.com>
+Signed-off-by: Simon Josefsson <simon@josefsson.org>
+
+Upstream-Status: Backport from [https://git.savannah.gnu.org/cgit/inetutils.git/commit/?id=e4e65c03f4c11292a3e40ef72ca3f194c8bffdd6]
+CVE: CVE-2023-40303
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+
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
+index 68d41fd..703fbbc 100644
+--- a/ftpd/ftpd.c
++++ b/ftpd/ftpd.c
+@@ -865,7 +865,9 @@ end_login (struct credentials *pcred)
+   char *remotehost = pcred->remotehost;
+   int atype = pcred->auth_type;
+ 
+-  seteuid ((uid_t) 0);
++  if (seteuid ((uid_t) 0) == -1)
++    _exit (EXIT_FAILURE);
++
+   if (pcred->logged_in)
+     {
+       logwtmp_keep_open (ttyline, "", "");
+@@ -1154,7 +1156,8 @@ getdatasock (const char *mode)
+ 
+   if (data >= 0)
+     return fdopen (data, mode);
+-  seteuid ((uid_t) 0);
++  if (seteuid ((uid_t) 0) == -1)
++    _exit (EXIT_FAILURE);
+   s = socket (ctrl_addr.ss_family, SOCK_STREAM, 0);
+   if (s < 0)
+     goto bad;
+@@ -1981,7 +1984,8 @@ passive (int epsv, int af)
+   else	/* !AF_INET6 */
+     ((struct sockaddr_in *) &pasv_addr)->sin_port = 0;
+ 
+-  seteuid ((uid_t) 0);
++  if (seteuid ((uid_t) 0) == -1)
++    _exit (EXIT_FAILURE);
+   if (bind (pdata, (struct sockaddr *) &pasv_addr, pasv_addrlen) < 0)
+     {
+       if (seteuid ((uid_t) cred.uid))
+diff --git a/src/rcp.c b/src/rcp.c
+index 476cbaa..cd84570 100644
+--- a/src/rcp.c
++++ b/src/rcp.c
+@@ -348,14 +348,23 @@ main (int argc, char *argv[])
+   if (from_option)
+     {				/* Follow "protocol", send data. */
+       response ();
+-      setuid (userid);
++
++      if (setuid (userid) == -1)
++      {
++        error (EXIT_FAILURE, 0, "Could not drop privileges (setuid() failed)");
++      }
++
+       source (argc, argv);
+       exit (errs);
+     }
+ 
+   if (to_option)
+     {				/* Receive data. */
+-      setuid (userid);
++      if (setuid (userid) == -1)
++      {
++        error (EXIT_FAILURE, 0, "Could not drop privileges (setuid() failed)");
++      }
++
+       sink (argc, argv);
+       exit (errs);
+     }
+@@ -540,7 +549,11 @@ toremote (char *targ, int argc, char *argv[])
+ 	      if (response () < 0)
+ 		exit (EXIT_FAILURE);
+ 	      free (bp);
+-	      setuid (userid);
++
++	      if (setuid (userid) == -1)
++              {
++                error (EXIT_FAILURE, 0, "Could not drop privileges (setuid() failed)");
++              }
+ 	    }
+ 	  source (1, argv + i);
+ 	  close (rem);
+@@ -633,7 +646,12 @@ tolocal (int argc, char *argv[])
+ 	  ++errs;
+ 	  continue;
+ 	}
+-      seteuid (userid);
++
++      if (seteuid (userid) == -1)
++      {
++        error (EXIT_FAILURE, 0, "Could not drop privileges (seteuid() failed)");
++      }
++
+ #if defined IP_TOS && defined IPPROTO_IP && defined IPTOS_THROUGHPUT
+       sslen = sizeof (ss);
+       (void) getpeername (rem, (struct sockaddr *) &ss, &sslen);
+@@ -646,7 +664,12 @@ tolocal (int argc, char *argv[])
+ #endif
+       vect[0] = target;
+       sink (1, vect);
+-      seteuid (effuid);
++
++      if (seteuid (effuid) == -1)
++      {
++        error (EXIT_FAILURE, 0, "Could not drop privileges (seteuid() failed)");
++      }
++
+       close (rem);
+       rem = -1;
+ #ifdef SHISHI
+@@ -1444,7 +1467,11 @@ susystem (char *s, int userid)
+       return (127);
+ 
+     case 0:
+-      setuid (userid);
++      if (setuid (userid) == -1)
++      {
++        error (EXIT_FAILURE, 0, "Could not drop privileges (setuid() failed)");
++      }
++
+       execl (PATH_BSHELL, "sh", "-c", s, NULL);
+       _exit (127);
+     }
+diff --git a/src/rlogin.c b/src/rlogin.c
+index bdfcfa6..2addf49 100644
+--- a/src/rlogin.c
++++ b/src/rlogin.c
+@@ -650,8 +650,15 @@ try_connect:
+   /* Now change to the real user ID.  We have to be set-user-ID root
+      to get the privileged port that rcmd () uses.  We now want, however,
+      to run as the real user who invoked us.  */
+-  seteuid (uid);
+-  setuid (uid);
++  if (seteuid (uid) == -1)
++  {
++    error (EXIT_FAILURE, 0, "Could not drop privileges (seteuid() failed)");
++  }
++
++  if (setuid (uid) == -1)
++  {
++    error (EXIT_FAILURE, 0, "Could not drop privileges (setuid() failed)");
++  }
+ 
+   doit (&osmask);	/* The old mask will activate SIGURG and SIGUSR1!  */
+ 
+diff --git a/src/rsh.c b/src/rsh.c
+index fa97e2a..6137ba7 100644
+--- a/src/rsh.c
++++ b/src/rsh.c
+@@ -279,8 +279,17 @@ main (int argc, char **argv)
+     {
+       if (asrsh)
+ 	*argv = (char *) "rlogin";
+-      seteuid (getuid ());
+-      setuid (getuid ());
++
++      if (seteuid (getuid ()) == -1)
++      {
++        error (EXIT_FAILURE, errno, "seteuid() failed");
++      }
++
++      if (setuid (getuid ()) == -1)
++      {
++        error (EXIT_FAILURE, errno, "setuid() failed");
++      }
++
+       execv (PATH_RLOGIN, argv);
+       error (EXIT_FAILURE, errno, "cannot execute %s", PATH_RLOGIN);
+     }
+@@ -544,8 +553,16 @@ try_connect:
+ 	error (0, errno, "setsockopt DEBUG (ignored)");
+     }
+ 
+-  seteuid (uid);
+-  setuid (uid);
++  if (seteuid (uid) == -1)
++  {
++    error (EXIT_FAILURE, errno, "seteuid() failed");
++  }
++
++  if (setuid (uid) == -1)
++  {
++    error (EXIT_FAILURE, errno, "setuid() failed");
++  }
++
+ #ifdef HAVE_SIGACTION
+   sigemptyset (&sigs);
+   sigaddset (&sigs, SIGINT);
+diff --git a/src/rshd.c b/src/rshd.c
+index fed6f39..f6e74b9 100644
+--- a/src/rshd.c
++++ b/src/rshd.c
+@@ -1850,8 +1850,18 @@ doit (int sockfd, struct sockaddr *fromp, socklen_t fromlen)
+     pwd->pw_shell = PATH_BSHELL;
+ 
+   /* Set the gid, then uid to become the user specified by "locuser" */
+-  setegid ((gid_t) pwd->pw_gid);
+-  setgid ((gid_t) pwd->pw_gid);
++  if (setegid ((gid_t) pwd->pw_gid) == -1)
++  {
++    rshd_error ("Cannot drop privileges (setegid() failed)\n");
++    exit (EXIT_FAILURE);
++  }
++
++  if (setgid ((gid_t) pwd->pw_gid) == -1)
++  {
++    rshd_error ("Cannot drop privileges (setgid() failed)\n");
++    exit (EXIT_FAILURE);
++  }
++
+ #ifdef HAVE_INITGROUPS
+   initgroups (pwd->pw_name, pwd->pw_gid);	/* BSD groups */
+ #endif
+@@ -1873,7 +1883,11 @@ doit (int sockfd, struct sockaddr *fromp, socklen_t fromlen)
+     }
+ #endif /* WITH_PAM */
+ 
+-  setuid ((uid_t) pwd->pw_uid);
++  if (setuid ((uid_t) pwd->pw_uid) == -1)
++  {
++    rshd_error ("Cannot drop privileges (setuid() failed)\n");
++    exit (EXIT_FAILURE);
++  }
+ 
+   /* We'll execute the client's command in the home directory
+    * of locuser. Note, that the chdir must be executed after
+diff --git a/src/uucpd.c b/src/uucpd.c
+index c8bb460..5b76390 100644
+--- a/src/uucpd.c
++++ b/src/uucpd.c
+@@ -255,7 +255,12 @@ doit (struct sockaddr *sap, socklen_t salen)
+   snprintf (Username, sizeof (Username), "USER=%s", user);
+   snprintf (Logname, sizeof (Logname), "LOGNAME=%s", user);
+   dologin (pw, sap, salen);
+-  setgid (pw->pw_gid);
++
++  if (setgid (pw->pw_gid) == -1)
++  {
++    fprintf (stderr, "setgid() failed");
++    return;
++  }
+ #ifdef HAVE_INITGROUPS
+   initgroups (pw->pw_name, pw->pw_gid);
+ #endif
+@@ -264,7 +269,13 @@ doit (struct sockaddr *sap, socklen_t salen)
+       fprintf (stderr, "Login incorrect.");
+       return;
+     }
+-  setuid (pw->pw_uid);
++
++  if (setuid (pw->pw_uid) == -1)
++  {
++    fprintf (stderr, "setuid() failed");
++    return;
++  }
++
+   execl (uucico_location, "uucico", NULL);
+   perror ("uucico server: execl");
+ }
+-- 
+2.35.7
+
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.2.bb b/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
index d8062e2b21..ee9def528b 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
@@ -22,6 +22,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://inetutils-1.9-PATH_PROCNET_DEV.patch \
            file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch \
            file://CVE-2022-39028.patch \
+           file://CVE-2023-40303.patch \
 "
 
 inherit autotools gettext update-alternatives texinfo
-- 
2.34.1


