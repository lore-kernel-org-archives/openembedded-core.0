Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97696C83F14
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 10:32:49 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.14255.1693305160154445669
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Aug 2023 03:32:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Sq5PkszV;
 spf=pass (domain: mvista.com, ip: 209.85.210.178, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-68c3b9f83f4so2194140b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Aug 2023 03:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1693305159; x=1693909959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NcQrwgANSTCBzw0sdFsfEN9Cdvr7g7QYqrC+ERKKV4w=;
        b=Sq5PkszVby3XtVfLAx0f4Q5/Abqxv0/q9BVkPqBwAYwesgMlNDQRdwQE7qZoxoQkwP
         qKfUnG2jm+oI+QrFfAGMfkLqzW2eh6ZgcF+LdBLai9ESmLfeFL0CO+orV/PrULMrw17k
         /uauVhKUpZRsyvlrhnPaeOVkmUWOkx7tRzxu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693305159; x=1693909959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NcQrwgANSTCBzw0sdFsfEN9Cdvr7g7QYqrC+ERKKV4w=;
        b=e/dtrjkuChwibJj2ONny93WWwZJLxdGyUnomrYbiYaoUiEhATAYrXkZezqupLPUiuo
         gmrpzSIY8pkFy7AxD4uijogmEhCEPnWA4UMU17gFtFmw8ftW5gUioWrRKx615QD3Txgw
         NTnKAiy3iA2JFvv0ySxAH7Y7aRLnMyz3xWAHEi2do5jt1WZtsFsoeSHoKmJ1mqvhE1H2
         UinLyJFLNyKZI0C9FnW0C00kYv/qPUDaQclq2mSte0SXa//gvgsbaZde73tiDujQr8xR
         m7R8BDvZmkPsXIUPgPe6YjPHBqLPbftiyLUskyA9+p/LsLP04wWtGQkK+1qv53MUPm4K
         gypg==
X-Gm-Message-State: AOJu0Yz1/BQaSUKosWNPUX1XghO3O3J/9itYOPfSIX/dx5QaTMFn9JUk
	jgJEjzFM5HriLvZACAeyLWtY1BPxKvRYsyY1Zo0=
X-Google-Smtp-Source: AGHT+IGXclL70tLfuBruEyrlGeo7gcVRr1Rd6poHsOZvgoXIFytJ/KTIlNzl2i6Efy3XMfqBRf1j7g==
X-Received: by 2002:a05:6a20:548f:b0:137:23f1:4281 with SMTP id i15-20020a056a20548f00b0013723f14281mr27603614pzk.12.1693305159023;
        Tue, 29 Aug 2023 03:32:39 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c01c:7c68:57c8:5af4:a403:1902])
        by smtp.gmail.com with ESMTPSA id z8-20020aa791c8000000b00689f5940061sm8428910pfa.17.2023.08.29.03.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 03:32:38 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] inetutils: Backport fix for CVE-2023-40303
Date: Tue, 29 Aug 2023 16:02:29 +0530
Message-Id: <20230829103229.1568234-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Aug 2023 10:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186852

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-commit: https://git.savannah.gnu.org/cgit/inetutils.git/commit/?id=e4e65c03f4c11292a3e40ef72ca3f194c8bffdd6
& https://git.savannah.gnu.org/cgit/inetutils.git/commit/?id=9122999252c7e21eb7774de11d539748e7bdf46d

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 ...tpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch | 283 ++++++++++++++++++
 ...03-Indent-changes-in-previous-commit.patch | 254 ++++++++++++++++
 .../inetutils/inetutils_1.9.4.bb              |   2 +
 3 files changed, 539 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/0001-CVE-2023-40303-ftpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/0002-CVE-2023-40303-Indent-changes-in-previous-commit.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/0001-CVE-2023-40303-ftpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch b/meta/recipes-connectivity/inetutils/inetutils/0001-CVE-2023-40303-ftpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch
new file mode 100644
index 0000000000..aea07bd803
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/0001-CVE-2023-40303-ftpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch
@@ -0,0 +1,283 @@
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
+index 5db88d0..b52b122 100644
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
+index bafa35f..366295c 100644
+--- a/src/rcp.c
++++ b/src/rcp.c
+@@ -347,14 +347,23 @@ main (int argc, char *argv[])
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
+@@ -539,7 +548,11 @@ toremote (char *targ, int argc, char *argv[])
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
+@@ -634,7 +647,12 @@ tolocal (int argc, char *argv[])
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
+@@ -647,7 +665,12 @@ tolocal (int argc, char *argv[])
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
+@@ -1453,7 +1476,11 @@ susystem (char *s, int userid)
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
+index e5e11a7..6b38901 100644
+--- a/src/rlogin.c
++++ b/src/rlogin.c
+@@ -649,8 +649,15 @@ try_connect:
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
+index bd70372..b451a70 100644
+--- a/src/rsh.c
++++ b/src/rsh.c
+@@ -278,8 +278,17 @@ main (int argc, char **argv)
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
+@@ -543,8 +552,16 @@ try_connect:
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
+index b824a10..8cdcd06 100644
+--- a/src/rshd.c
++++ b/src/rshd.c
+@@ -1848,8 +1848,18 @@ doit (int sockfd, struct sockaddr *fromp, socklen_t fromlen)
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
+@@ -1871,7 +1881,11 @@ doit (int sockfd, struct sockaddr *fromp, socklen_t fromlen)
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
+index 55c3d44..6aba294 100644
+--- a/src/uucpd.c
++++ b/src/uucpd.c
+@@ -254,7 +254,12 @@ doit (struct sockaddr *sap, socklen_t salen)
+   sprintf (Username, "USER=%s", user);
+   sprintf (Logname, "LOGNAME=%s", user);
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
+@@ -263,7 +268,13 @@ doit (struct sockaddr *sap, socklen_t salen)
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
+2.25.1
+
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
diff --git a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
index fe391b8bce..3a68b34825 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
@@ -25,6 +25,8 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
            file://fix-buffer-fortify-tfpt.patch \
            file://CVE-2021-40491.patch \
            file://CVE-2022-39028.patch \
+           file://0001-CVE-2023-40303-ftpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch \
+           file://0002-CVE-2023-40303-Indent-changes-in-previous-commit.patch \
 "
 
 SRC_URI[md5sum] = "04852c26c47cc8c6b825f2b74f191f52"
-- 
2.25.1


