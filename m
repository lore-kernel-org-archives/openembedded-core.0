Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7867BC83F15
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 02:58:47 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.9557.1693277919673503830
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Aug 2023 19:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=gZY35Q1C;
 spf=pass (domain: mvista.com, ip: 209.85.214.176, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1c0db66af1bso19207745ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 19:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1693277919; x=1693882719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/AVWSGwpmzcbAziz8NO+GWYwVdSJhNzVNCsZwSdGKFI=;
        b=gZY35Q1CrO+M9ku2se2hDNBzuyMfm6wAvK2BhJwR4t26zvLoqh/cvjDdV6Ud4yjd/Y
         CyB9AsInUdzeOXGtyy33aBoBRSUrblo0d0XJo7fg8Sa1pZkDpJ0onEVZP6fmcGpQs2te
         Jqyq4rjRBMcaoYpvhnjMe23SKXgaViS+LiN7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693277919; x=1693882719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/AVWSGwpmzcbAziz8NO+GWYwVdSJhNzVNCsZwSdGKFI=;
        b=V7DeUZYldLxVWBrasYf2T1ZCsLq+7QmdLHOmdaETOKg3in79Pln8+Tm4rnlge1nJII
         8s/4gwCPcrQ/fpdEfDEKJb1cTXGsScDUJplbPNbjMRRRQv0OPC6TcA/UV2B8hQ9A8kKf
         ySUqaKC61s3KcvvcXYT/owrrNynpYZq4wphT9ALDSK0ncbpTvCkj/2ub1VU9b762O5SJ
         i7JTx/6lKD/JQO/QTiubE5cbkQydNKclQG8NpFJ9KgC23eikZct1Nf2yQoQgC9g5I3jO
         2ZvkKoZ59a6q3pguH1P2SZ6ySrCg6gOJG0h4ZW+n3WUUMfmQQiQ3JLTvGIbjk8+zl8RC
         UNmQ==
X-Gm-Message-State: AOJu0Yz+Bwl1zrztYP5BLOR1Duix0gXCsjEeLbR0NCT1csPLCUgy4g0B
	/bhfN1QzhbFY2A9SLkd7qQUT+MZQVqeYw4TTiCI=
X-Google-Smtp-Source: AGHT+IEb1tC2043SXg/OzxPWsbBRuP35v0lJVlKv2Hjw3r6zpW2gT/J1v8NMn1ZtfsY+N1ZGBCvJrA==
X-Received: by 2002:a17:902:f80d:b0:1c0:c1e4:f09c with SMTP id ix13-20020a170902f80d00b001c0c1e4f09cmr11974957plb.62.1693277918340;
        Mon, 28 Aug 2023 19:58:38 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.37.145.220])
        by smtp.gmail.com with ESMTPSA id q5-20020a170902bd8500b001bdd719874esm8159194pls.168.2023.08.28.19.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 19:58:37 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH v2] inetutils: Backport fix for CVE-2023-40303
Date: Tue, 29 Aug 2023 08:26:23 +0530
Message-Id: <20230829025623.59579-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Aug 2023 02:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186847

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-commit: https://git.savannah.gnu.org/cgit/inetutils.git/commit/?id=e4e65c03f4c11292a3e40ef72ca3f194c8bffdd6
& https://git.savannah.gnu.org/cgit/inetutils.git/commit/?id=9122999252c7e21eb7774de11d539748e7bdf46d

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 ...tpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch | 280 ++++++++++++++++++
 ...03-Indent-changes-in-previous-commit.patch | 254 ++++++++++++++++
 .../inetutils/inetutils_2.2.bb                |   2 +
 3 files changed, 536 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/0001-CVE-2023-40303-ftpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/0002-CVE-2023-40303-Indent-changes-in-previous-commit.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/0001-CVE-2023-40303-ftpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch b/meta/recipes-connectivity/inetutils/inetutils/0001-CVE-2023-40303-ftpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch
new file mode 100644
index 0000000000..7f5baf3637
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/0001-CVE-2023-40303-ftpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch
@@ -0,0 +1,280 @@
+From 703418fe9d2e3b1e8d594df5788d8001a8116265 Mon Sep 17 00:00:00 2001
+From: Jeffrey Bencteux <jeffbencteux@gmail.com>
+Date: Fri, 30 Jun 2023 19:02:45 +0200
+Subject: [PATCH] CVE-2023-40303: ftpd,rcp,rlogin,rsh,rshd,uucpd: fix: check
+ set*id() return values
+
+Several setuid(), setgid(), seteuid() and setguid() return values
+were not checked in ftpd/rcp/rlogin/rsh/rshd/uucpd code potentially
+leading to potential security issues.
+
+CVE: CVE-2023-40303
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/inetutils.git/commit/?id=e4e65c03f4c11292a3e40ef72ca3f194c8bffdd6]
+Signed-off-by: Jeffrey Bencteux <jeffbencteux@gmail.com>
+Signed-off-by: Simon Josefsson <simon@josefsson.org>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
+index 75adb253..cdcf8500 100644
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
+@@ -537,7 +546,11 @@ toremote (char *targ, int argc, char *argv[])
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
+@@ -630,7 +643,12 @@ tolocal (int argc, char *argv[])
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
+@@ -643,7 +661,12 @@ tolocal (int argc, char *argv[])
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
+@@ -1441,7 +1464,11 @@ susystem (char *s, int userid)
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
+index aa6426fb..c543de0c 100644
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
+index 2d622ca4..6f60667d 100644
+--- a/src/rsh.c
++++ b/src/rsh.c
+@@ -276,8 +276,17 @@ main (int argc, char **argv)
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
+@@ -541,8 +550,16 @@ try_connect:
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
+index d1c0d0cd..707790e7 100644
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
+index 107589e1..29cfce35 100644
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
diff --git a/meta/recipes-connectivity/inetutils/inetutils/0002-CVE-2023-40303-Indent-changes-in-previous-commit.patch b/meta/recipes-connectivity/inetutils/inetutils/0002-CVE-2023-40303-Indent-changes-in-previous-commit.patch
new file mode 100644
index 0000000000..4bc354d256
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/0002-CVE-2023-40303-Indent-changes-in-previous-commit.patch
@@ -0,0 +1,254 @@
+From 70fe022f9dac760eaece0228cad17e3d29a57fb8 Mon Sep 17 00:00:00 2001
+From: Simon Josefsson <simon@josefsson.org>
+Date: Mon, 31 Jul 2023 13:59:05 +0200
+Subject: [PATCH] CVE-2023-40303: Indent changes in previous commit.
+
+CVE: CVE-2023-40303
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/inetutils.git/commit/?id=9122999252c7e21eb7774de11d539748e7bdf46d]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/rcp.c    | 42 ++++++++++++++++++++++++------------------
+ src/rlogin.c | 12 ++++++------
+ src/rsh.c    | 24 ++++++++++++------------
+ src/rshd.c   | 24 ++++++++++++------------
+ src/uucpd.c  | 16 ++++++++--------
+ 5 files changed, 62 insertions(+), 56 deletions(-)
+
+diff --git a/src/rcp.c b/src/rcp.c
+index cdcf8500..652f22e6 100644
+--- a/src/rcp.c
++++ b/src/rcp.c
+@@ -347,9 +347,10 @@ main (int argc, char *argv[])
+       response ();
+ 
+       if (setuid (userid) == -1)
+-      {
+-        error (EXIT_FAILURE, 0, "Could not drop privileges (setuid() failed)");
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
+-        error (EXIT_FAILURE, 0, "Could not drop privileges (setuid() failed)");
+-      }
++	{
++	  error (EXIT_FAILURE, 0,
++		 "Could not drop privileges (setuid() failed)");
++	}
+ 
+       sink (argc, argv);
+       exit (errs);
+@@ -548,9 +550,10 @@ toremote (char *targ, int argc, char *argv[])
+ 	      free (bp);
+ 
+ 	      if (setuid (userid) == -1)
+-              {
+-                error (EXIT_FAILURE, 0, "Could not drop privileges (setuid() failed)");
+-              }
++		{
++		  error (EXIT_FAILURE, 0,
++			 "Could not drop privileges (setuid() failed)");
++		}
+ 	    }
+ 	  source (1, argv + i);
+ 	  close (rem);
+@@ -645,9 +648,10 @@ tolocal (int argc, char *argv[])
+ 	}
+ 
+       if (seteuid (userid) == -1)
+-      {
+-        error (EXIT_FAILURE, 0, "Could not drop privileges (seteuid() failed)");
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
+-        error (EXIT_FAILURE, 0, "Could not drop privileges (seteuid() failed)");
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
+-        error (EXIT_FAILURE, 0, "Could not drop privileges (setuid() failed)");
+-      }
++	{
++	  error (EXIT_FAILURE, 0,
++		 "Could not drop privileges (setuid() failed)");
++	}
+ 
+       execl (PATH_BSHELL, "sh", "-c", s, NULL);
+       _exit (127);
+diff --git a/src/rlogin.c b/src/rlogin.c
+index c543de0c..4360202f 100644
+--- a/src/rlogin.c
++++ b/src/rlogin.c
+@@ -648,14 +648,14 @@ try_connect:
+      to get the privileged port that rcmd () uses.  We now want, however,
+      to run as the real user who invoked us.  */
+   if (seteuid (uid) == -1)
+-  {
+-    error (EXIT_FAILURE, 0, "Could not drop privileges (seteuid() failed)");
+-  }
++    {
++      error (EXIT_FAILURE, 0, "Could not drop privileges (seteuid() failed)");
++    }
+ 
+   if (setuid (uid) == -1)
+-  {
+-    error (EXIT_FAILURE, 0, "Could not drop privileges (setuid() failed)");
+-  }
++    {
++      error (EXIT_FAILURE, 0, "Could not drop privileges (setuid() failed)");
++    }
+ 
+   doit (&osmask);	/* The old mask will activate SIGURG and SIGUSR1!  */
+ 
+diff --git a/src/rsh.c b/src/rsh.c
+index 6f60667d..179b47cd 100644
+--- a/src/rsh.c
++++ b/src/rsh.c
+@@ -278,14 +278,14 @@ main (int argc, char **argv)
+ 	*argv = (char *) "rlogin";
+ 
+       if (seteuid (getuid ()) == -1)
+-      {
+-        error (EXIT_FAILURE, errno, "seteuid() failed");
+-      }
++	{
++	  error (EXIT_FAILURE, errno, "seteuid() failed");
++	}
+ 
+       if (setuid (getuid ()) == -1)
+-      {
+-        error (EXIT_FAILURE, errno, "setuid() failed");
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
+index 707790e7..3a153a18 100644
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
+index 29cfce35..fde7b9c9 100644
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
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.2.bb b/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
index d8062e2b21..6f9173dbc1 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
@@ -22,6 +22,8 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://inetutils-1.9-PATH_PROCNET_DEV.patch \
            file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch \
            file://CVE-2022-39028.patch \
+           file://0001-CVE-2023-40303-ftpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch \
+           file://0002-CVE-2023-40303-Indent-changes-in-previous-commit.patch \
 "
 
 inherit autotools gettext update-alternatives texinfo
-- 
2.25.1


