Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F226C83F01
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 17:48:40 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.1281.1693417715931903362
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 10:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cv+6xAGo;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-68a410316a2so4312065b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 10:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1693417715; x=1694022515; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=edo+qgmRYiSRlXtML3EA6E91FzD+MyJ9MXWODvUAbkg=;
        b=cv+6xAGofTgJ9XH86Xa7TQH2ZeV1Y1PrcnVdrX86jiG5gHhsOj40/MfEjj1RuEAPmX
         kmcV6uzS1Iu2lTV5Omrb5iRgprNdIYoe8EOWJPQP+tcOB/++M0yDwOkDsyRVUk2uvy1q
         /9sojRquSWzFsAAIqYQToinvszV4UrlcXAV0/9gF38+oCNcdlu8bmYB+xc2IQxNJ/pjM
         M1U9FtvLIpYAy29yHAg8gRbthZQOZigudE84vd9T79F6siOI09DvSlvUU61f12jc/saT
         ugNzi9N/H0YRkjI5AvmmSKuJ1Sh/MaH7d2IsucC294IAoiuKVuOisl3JHm0Yq/cHuvzA
         r8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693417715; x=1694022515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=edo+qgmRYiSRlXtML3EA6E91FzD+MyJ9MXWODvUAbkg=;
        b=a7vBa0dLbo3TzmukPLjbGyXDDXOrPsWjExKUrgsJBRIkg2/MHz0r2xhf2TuSy3TPZg
         iQDGkBvxJCVv8W/+XzDoQDwfGOzUXfxNzECNKJpFTdcFNqF3WiaWnojwnQPdCk487sZC
         db/7KKBGZq+UWIxkwWrzy432tLIOrJqnegudcJXfyy3MNZvis7ig6tPV/maPB4Q/2Zr1
         /JykJC7fK/lYW2NCA19D6Co+Q+GRYZeoW1xKQQuhhpE2acJ60zyuihEfqLJmYJiK+j/g
         hn03N/W37FMC8DpMahAohHhyDSNRMnY5xTSPumDBBl3ohOO71RV6/+XthdNk00wx3Ve0
         rEjA==
X-Gm-Message-State: AOJu0Yzxw0/C4khxwJb96WmpmVpr/9zYYPCVH0fMqzgZW+k3uGTLaO54
	ulQ8WVIOADUJf5NjyxxSs9A5lyKByEmJCL/jAkU=
X-Google-Smtp-Source: AGHT+IFm0rjKDz/KexyUR1HreABVzA/wCRyXC1TNB6fuZamDM69AVyU0uusp1oUrLU1+uJauZsOUeA==
X-Received: by 2002:a05:6a00:b81:b0:686:fd66:a41c with SMTP id g1-20020a056a000b8100b00686fd66a41cmr2983805pfj.17.1693417714684;
        Wed, 30 Aug 2023 10:48:34 -0700 (PDT)
Received: from xps13.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id fm14-20020a056a002f8e00b006889348ba6dsm10567578pfb.93.2023.08.30.10.48.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 10:48:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 01/20] inetutils: fix CVE-2023-40303
Date: Wed, 30 Aug 2023 07:48:05 -1000
Message-Id: <b8e2dad0650b8a80e3d85e6d87fda1a0e2fb195f.1693417541.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693417541.git.steve@sakoman.com>
References: <cover.1693417541.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 17:48:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186903

From: Yogita Urade <yogita.urade@windriver.com>

GNU inetutils through 2.4 may allow privilege escalation because
of unchecked return values of set*id() family functions in ftpd,
rcp, rlogin, rsh, rshd, and uucpd. This is, for example, relevant
if the setuid system call fails when a process is trying to drop
privileges before letting an ordinary user control the activities
of the process.

Refernces:
https://nvd.nist.gov/vuln/detail/CVE-2023-40303

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...tpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch | 284 ++++++++++++++++++
 ...03-Indent-changes-in-previous-commit.patch | 258 ++++++++++++++++
 .../inetutils/inetutils_2.4.bb                |   2 +
 3 files changed, 544 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/0001-CVE-2023-40303-ftpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/0002-CVE-2023-40303-Indent-changes-in-previous-commit.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/0001-CVE-2023-40303-ftpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch b/meta/recipes-connectivity/inetutils/inetutils/0001-CVE-2023-40303-ftpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch
new file mode 100644
index 0000000000..04fd9b1f85
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/0001-CVE-2023-40303-ftpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch
@@ -0,0 +1,284 @@
+From e4e65c03f4c11292a3e40ef72ca3f194c8bffdd6 Mon Sep 17 00:00:00 2001
+From: Jeffrey Bencteux <jeffbencteux@gmail.com>
+Date: Mon, 28 Aug 2023 15:35:19 +0000
+Subject: [PATCH] CVE-2023-40303: ftpd,rcp,rlogin,rsh,rshd,uucpd: fix: check
+set*id() return values
+
+Several setuid(), setgid(), seteuid() and setguid() return values
+were not checked in ftpd/rcp/rlogin/rsh/rshd/uucpd code potentially
+leading to potential security issues.
+
+Signed-off-by: Jeffrey Bencteux <jeffbencteux@gmail.com>
+Signed-off-by: Simon Josefsson <simon@josefsson.org>
+
+CVE: CVE-2023-40303
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/inetutils.git/commit/?id=e4e65c03f4c11292a3e40ef72ca3f194c8bffdd6]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
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
+index 92b2cca..009f3f1 100644
+--- a/ftpd/ftpd.c
++++ b/ftpd/ftpd.c
+@@ -862,7 +862,9 @@ end_login (struct credentials *pcred)
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
+@@ -1151,7 +1153,8 @@ getdatasock (const char *mode)
+
+   if (data >= 0)
+     return fdopen (data, mode);
+-  seteuid ((uid_t) 0);
++  if (seteuid ((uid_t) 0) == -1)
++    _exit (EXIT_FAILURE);
+   s = socket (ctrl_addr.ss_family, SOCK_STREAM, 0);
+   if (s < 0)
+     goto bad;
+@@ -1978,7 +1981,8 @@ passive (int epsv, int af)
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
+index 75adb25..f913256 100644
+--- a/src/rcp.c
++++ b/src/rcp.c
+@@ -345,14 +345,23 @@ main (int argc, char *argv[])
+   if (from_option)
+     {				/* Follow "protocol", send data. */
+       response ();
+-      setuid (userid);
++
++      if (setuid (userid) == -1)
++      {
++	error (EXIT_FAILURE, 0, "Could not drop privileges (setuid() failed)");
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
++	error (EXIT_FAILURE, 0, "Could not drop privileges (setuid() failed)");
++      }
++
+       sink (argc, argv);
+       exit (errs);
+     }
+@@ -537,7 +546,11 @@ toremote (char *targ, int argc, char *argv[])
+	      if (response () < 0)
+		exit (EXIT_FAILURE);
+	      free (bp);
+-	      setuid (userid);
++
++	      if (setuid (userid) == -1)
++	      {
++		error (EXIT_FAILURE, 0, "Could not drop privileges (setuid() failed)");
++	      }
+	    }
+	  source (1, argv + i);
+	  close (rem);
+@@ -630,7 +643,12 @@ tolocal (int argc, char *argv[])
+	  ++errs;
+	  continue;
+	}
+-      seteuid (userid);
++
++      if (seteuid (userid) == -1)
++      {
++	error (EXIT_FAILURE, 0, "Could not drop privileges (seteuid() failed)");
++      }
++
+ #if defined IP_TOS && defined IPPROTO_IP && defined IPTOS_THROUGHPUT
+       sslen = sizeof (ss);
+       (void) getpeername (rem, (struct sockaddr *) &ss, &sslen);
+@@ -643,7 +661,12 @@ tolocal (int argc, char *argv[])
+ #endif
+       vect[0] = target;
+       sink (1, vect);
+-      seteuid (effuid);
++
++      if (seteuid (effuid) == -1)
++      {
++	      error (EXIT_FAILURE, 0, "Could not drop privileges (seteuid() failed)");
++      }
++
+       close (rem);
+       rem = -1;
+ #ifdef SHISHI
+@@ -1441,7 +1464,11 @@ susystem (char *s, int userid)
+       return (127);
+
+     case 0:
+-      setuid (userid);
++      if (setuid (userid) == -1)
++      {
++	error (EXIT_FAILURE, 0, "Could not drop privileges (setuid() failed)");
++      }
++
+       execl (PATH_BSHELL, "sh", "-c", s, NULL);
+       _exit (127);
+     }
+diff --git a/src/rlogin.c b/src/rlogin.c
+index aa6426f..9bf9645 100644
+--- a/src/rlogin.c
++++ b/src/rlogin.c
+@@ -647,8 +647,15 @@ try_connect:
+   /* Now change to the real user ID.  We have to be set-user-ID root
+      to get the privileged port that rcmd () uses.  We now want, however,
+      to run as the real user who invoked us.  */
+-  seteuid (uid);
+-  setuid (uid);
++  if (seteuid (uid) == -1)
++  {
++   error (EXIT_FAILURE, 0, "Could not drop privileges (seteuid() failed)");
++  }
++
++  if (setuid (uid) == -1)
++  {
++   error (EXIT_FAILURE, 0, "Could not drop privileges (setuid() failed)");
++  }
+
+   doit (&osmask);	/* The old mask will activate SIGURG and SIGUSR1!  */
+
+diff --git a/src/rsh.c b/src/rsh.c
+index 2d622ca..7b9cf22 100644
+--- a/src/rsh.c
++++ b/src/rsh.c
+@@ -276,8 +276,17 @@ main (int argc, char **argv)
+     {
+       if (asrsh)
+	*argv = (char *) "rlogin";
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
++	error (EXIT_FAILURE, errno, "setuid() failed");
++      }
++
+       execv (PATH_RLOGIN, argv);
+       error (EXIT_FAILURE, errno, "cannot execute %s", PATH_RLOGIN);
+     }
+@@ -541,8 +550,16 @@ try_connect:
+	error (0, errno, "setsockopt DEBUG (ignored)");
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
+index d1c0d0c..19d9a60 100644
+--- a/src/rshd.c
++++ b/src/rshd.c
+@@ -1847,8 +1847,18 @@ doit (int sockfd, struct sockaddr *fromp, socklen_t fromlen)
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
+@@ -1870,7 +1880,11 @@ doit (int sockfd, struct sockaddr *fromp, socklen_t fromlen)
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
+index 107589e..34be165 100644
+--- a/src/uucpd.c
++++ b/src/uucpd.c
+@@ -252,7 +252,12 @@ doit (struct sockaddr *sap, socklen_t salen)
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
+@@ -261,7 +266,13 @@ doit (struct sockaddr *sap, socklen_t salen)
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
+2.40.0
diff --git a/meta/recipes-connectivity/inetutils/inetutils/0002-CVE-2023-40303-Indent-changes-in-previous-commit.patch b/meta/recipes-connectivity/inetutils/inetutils/0002-CVE-2023-40303-Indent-changes-in-previous-commit.patch
new file mode 100644
index 0000000000..f4252b5f34
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/0002-CVE-2023-40303-Indent-changes-in-previous-commit.patch
@@ -0,0 +1,258 @@
+From 9122999252c7e21eb7774de11d539748e7bdf46d Mon Sep 17 00:00:00 2001
+From: Simon Josefsson <simon@josefsson.org>
+Date: Tue, 29 Aug 2023 06:42:11 +0000
+Subject: [PATCH] CVE-2023-40303: Indent changes in previous commit.
+
+CVE: CVE-2023-40303
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/inetutils.git/commit/?id=9122999252c7e21eb7774de11d539748e7bdf46d]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ src/rcp.c    | 42 ++++++++++++++++++++++++------------------
+ src/rlogin.c | 12 ++++++------
+ src/rsh.c    | 26 +++++++++++++-------------
+ src/rshd.c   | 24 ++++++++++++------------
+ src/uucpd.c  | 16 ++++++++--------
+ 5 files changed, 63 insertions(+), 57 deletions(-)
+
+diff --git a/src/rcp.c b/src/rcp.c
+index 7018e35..e504f8a 100644
+--- a/src/rcp.c
++++ b/src/rcp.c
+@@ -347,9 +347,10 @@ main (int argc, char *argv[])
+       response ();
+
+       if (setuid (userid) == -1)
+-      {
+-	error (EXIT_FAILURE, 0, "Could not drop privileges (setuid() failed)");
+-      }
++	{
++	  error (EXIT_FAILURE, 0,
++		 "Could not drop privileges (setuid() failed)");
++	}
+
+       source (argc, argv);
+       exit (errs);
+@@ -358,9 +359,10 @@ main (int argc, char *argv[])
+   if (to_option)
+     {				/* Receive data. */
+       if (setuid (userid) == -1)
+-      {
+-	error (EXIT_FAILURE, 0, "Could not drop privileges (setuid() failed)");
+-      }
++	{
++	  error (EXIT_FAILURE, 0,
++		 "Could not drop privileges (setuid() failed)");
++	}
+
+       sink (argc, argv);
+       exit (errs);
+@@ -548,9 +550,10 @@ toremote (char *targ, int argc, char *argv[])
+	      free (bp);
+
+	      if (setuid (userid) == -1)
+-	      {
+-		error (EXIT_FAILURE, 0, "Could not drop privileges (setuid() failed)");
+-	      }
++		{
++		  error (EXIT_FAILURE, 0,
++			 "Could not drop privileges (setuid() failed)");
++		}
+	    }
+	  source (1, argv + i);
+	  close (rem);
+@@ -645,9 +648,10 @@ tolocal (int argc, char *argv[])
+	}
+
+       if (seteuid (userid) == -1)
+-      {
+-	error (EXIT_FAILURE, 0, "Could not drop privileges (seteuid() failed)");
+-      }
++	{
++	  error (EXIT_FAILURE, 0,
++		 "Could not drop privileges (seteuid() failed)");
++	}
+
+ #if defined IP_TOS && defined IPPROTO_IP && defined IPTOS_THROUGHPUT
+       sslen = sizeof (ss);
+@@ -663,9 +667,10 @@ tolocal (int argc, char *argv[])
+       sink (1, vect);
+
+       if (seteuid (effuid) == -1)
+-      {
+-	      error (EXIT_FAILURE, 0, "Could not drop privileges (seteuid() failed)");
+-      }
++	{
++	  error (EXIT_FAILURE, 0,
++		 "Could not drop privileges (seteuid() failed)");
++	}
+
+       close (rem);
+       rem = -1;
+@@ -1465,9 +1470,10 @@ susystem (char *s, int userid)
+
+     case 0:
+       if (setuid (userid) == -1)
+-      {
+-	error (EXIT_FAILURE, 0, "Could not drop privileges (setuid() failed)");
+-      }
++	{
++	  error (EXIT_FAILURE, 0,
++		 "Could not drop privileges (setuid() failed)");
++	}
+
+       execl (PATH_BSHELL, "sh", "-c", s, NULL);
+       _exit (127);
+diff --git a/src/rlogin.c b/src/rlogin.c
+index 9bf9645..a0c1237 100644
+--- a/src/rlogin.c
++++ b/src/rlogin.c
+@@ -648,14 +648,14 @@ try_connect:
+      to get the privileged port that rcmd () uses.  We now want, however,
+      to run as the real user who invoked us.  */
+   if (seteuid (uid) == -1)
+-  {
+-   error (EXIT_FAILURE, 0, "Could not drop privileges (seteuid() failed)");
+-  }
++    {
++      error (EXIT_FAILURE, 0, "Could not drop privileges (seteuid() failed)");
++    }
+
+   if (setuid (uid) == -1)
+-  {
+-   error (EXIT_FAILURE, 0, "Could not drop privileges (setuid() failed)");
+-  }
++    {
++      error (EXIT_FAILURE, 0, "Could not drop privileges (setuid() failed)");
++    }
+
+   doit (&osmask);	/* The old mask will activate SIGURG and SIGUSR1!  */
+
+diff --git a/src/rsh.c b/src/rsh.c
+index 7b9cf22..c8f50d3 100644
+--- a/src/rsh.c
++++ b/src/rsh.c
+@@ -278,14 +278,14 @@ main (int argc, char **argv)
+	*argv = (char *) "rlogin";
+
+       if (seteuid (getuid ()) == -1)
+-      {
+-        error (EXIT_FAILURE, errno, "seteuid() failed");
+-      }
+-
++	{
++	  error (EXIT_FAILURE, errno, "seteuid() failed");
++	}
++
+       if (setuid (getuid ()) == -1)
+-      {
+-	error (EXIT_FAILURE, errno, "setuid() failed");
+-      }
++	{
++	  error (EXIT_FAILURE, errno, "setuid() failed");
++	}
+
+       execv (PATH_RLOGIN, argv);
+       error (EXIT_FAILURE, errno, "cannot execute %s", PATH_RLOGIN);
+@@ -551,14 +551,14 @@ try_connect:
+     }
+
+   if (seteuid (uid) == -1)
+-  {
+-    error (EXIT_FAILURE, errno, "seteuid() failed");
+-  }
++    {
++      error (EXIT_FAILURE, errno, "seteuid() failed");
++    }
+
+   if (setuid (uid) == -1)
+-  {
+-    error (EXIT_FAILURE, errno, "setuid() failed");
+-  }
++    {
++      error (EXIT_FAILURE, errno, "setuid() failed");
++    }
+
+ #ifdef HAVE_SIGACTION
+   sigemptyset (&sigs);
+diff --git a/src/rshd.c b/src/rshd.c
+index 707790e..df43edf 100644
+--- a/src/rshd.c
++++ b/src/rshd.c
+@@ -1848,16 +1848,16 @@ doit (int sockfd, struct sockaddr *fromp, socklen_t fromlen)
+
+   /* Set the gid, then uid to become the user specified by "locuser" */
+   if (setegid ((gid_t) pwd->pw_gid) == -1)
+-  {
+-    rshd_error ("Cannot drop privileges (setegid() failed)\n");
+-    exit (EXIT_FAILURE);
+-  }
++    {
++      rshd_error ("Cannot drop privileges (setegid() failed)\n");
++      exit (EXIT_FAILURE);
++    }
+
+   if (setgid ((gid_t) pwd->pw_gid) == -1)
+-  {
+-    rshd_error ("Cannot drop privileges (setgid() failed)\n");
+-    exit (EXIT_FAILURE);
+-  }
++    {
++      rshd_error ("Cannot drop privileges (setgid() failed)\n");
++      exit (EXIT_FAILURE);
++    }
+
+ #ifdef HAVE_INITGROUPS
+   initgroups (pwd->pw_name, pwd->pw_gid);	/* BSD groups */
+@@ -1881,10 +1881,10 @@ doit (int sockfd, struct sockaddr *fromp, socklen_t fromlen)
+ #endif /* WITH_PAM */
+
+   if (setuid ((uid_t) pwd->pw_uid) == -1)
+-  {
+-    rshd_error ("Cannot drop privileges (setuid() failed)\n");
+-    exit (EXIT_FAILURE);
+-  }
++    {
++      rshd_error ("Cannot drop privileges (setuid() failed)\n");
++      exit (EXIT_FAILURE);
++    }
+
+   /* We'll execute the client's command in the home directory
+    * of locuser. Note, that the chdir must be executed after
+diff --git a/src/uucpd.c b/src/uucpd.c
+index 29cfce3..afe24f3 100644
+--- a/src/uucpd.c
++++ b/src/uucpd.c
+@@ -254,10 +254,10 @@ doit (struct sockaddr *sap, socklen_t salen)
+   dologin (pw, sap, salen);
+
+   if (setgid (pw->pw_gid) == -1)
+-  {
+-    fprintf (stderr, "setgid() failed");
+-    return;
+-  }
++    {
++      fprintf (stderr, "setgid() failed");
++      return;
++    }
+ #ifdef HAVE_INITGROUPS
+   initgroups (pw->pw_name, pw->pw_gid);
+ #endif
+@@ -268,10 +268,10 @@ doit (struct sockaddr *sap, socklen_t salen)
+     }
+
+   if (setuid (pw->pw_uid) == -1)
+-  {
+-    fprintf (stderr, "setuid() failed");
+-    return;
+-  }
++    {
++      fprintf (stderr, "setuid() failed");
++      return;
++    }
+
+   execl (uucico_location, "uucico", NULL);
+   perror ("uucico server: execl");
+--
+2.40.0
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.4.bb b/meta/recipes-connectivity/inetutils/inetutils_2.4.bb
index 6519331141..032c0d6b24 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.4.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.4.bb
@@ -21,6 +21,8 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://tftpd.xinetd.inetutils \
            file://inetutils-1.9-PATH_PROCNET_DEV.patch \
            file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch \
+           file://0001-CVE-2023-40303-ftpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch \
+           file://0002-CVE-2023-40303-Indent-changes-in-previous-commit.patch \
 "
 
 inherit autotools gettext update-alternatives texinfo
-- 
2.34.1


