Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41471C54FB3
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 05:09:44 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web10.14082.1748495382112390495
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 22:09:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=A3rMNg3W;
 spf=pass (domain: mvista.com, ip: 209.85.167.178, mailfrom: hprajapati@mvista.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3fbc00143d6so321960b6e.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 22:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1748495381; x=1749100181; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rwgVO0WXZeG5j9HilKKjq+tRMRIAwSyGtJyqoT2VmMs=;
        b=A3rMNg3Wg0Gvz96kMtdzeJJw9CUbxJxxQZE30L1rOpZCCO2QseL6CUwmm9eU9SnmVD
         dCrzbMMHB5BEjK7aEZC85+78qCVWXYVd0gLaUdOSgSw/OAHlR/uwp/3u4SH++HXaY89M
         ZRl/SCYzTo0YLzF8eoEQBCazRrSKntH7eRKAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748495381; x=1749100181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rwgVO0WXZeG5j9HilKKjq+tRMRIAwSyGtJyqoT2VmMs=;
        b=EmQqWbE79djXb14QEhbQJ16N1+wJcDQ3zX7uoVYg63juBFA1guT8sQINCW2Bu9lpSu
         +NVWOh6YR5oq0YRJ42en4jE7zAJV63g/OJ6qgMzIVrEyzEgZ6vBBshjP1n53sUBiQIlT
         nCgYnbe3eeJ8SijdfkGr8mKljihloUONYuu0vFpx7gqykDSOev2UmYCeoIHR5OtAqMJx
         KLJMCSsSTg6qmpsT3XU+B9ficmk3LKZIdFdWqjtPn1eOMxpgsxUz2lRlxt9Usbi8pPQH
         icEI7Ub2RrDJTAdId/Mj3rr7F+y4YGEjxzGcUcJzHmz5bSqaOntijpagX/o0XT4ujD9o
         4HEA==
X-Gm-Message-State: AOJu0YxDAPbvMSVzBjagJXrFboVsrS4vdwk0dh7qrwNaCASG0KU2DR7/
	v1Dx1QjZzHtB8DbDJjX0vGwYfAAJKbp7KZ7SW44bXMBHxR8gcR75dhNR3rqQulyxX5oyoXNTFJi
	4ldjx
X-Gm-Gg: ASbGncu+YD+7uFLRiBqRAab6xYDvGKKyvQYaa5XUOXY8MCqpzfHhIEaVy40l3cgG64E
	GUsWKib1lwziah6+CKLQAtPQY+78/uWjOlku8LOdQ5VULtuqyU6tmbRJiPrW473rTEf3EfEEpps
	BsvTZnMImBXq9hCe357vPPmQ1lUWN39LkW2RoL+sT4NjVasWqnrQ693jEEB8kK/M0eCGv5zQP1c
	6W6ZDpynG1CfPUtX/2gUChnyeZcP3CavK9hnEE1Y9bAgHtUYMoZlShx+kqcFH8ETQ0UKCGCb33B
	mP0V9DqW95WupQ7ua3zLMUbdDRwRwW9XMqL0rAie3fzNL4WuE9nZ/p3wQ+VNiu/U
X-Google-Smtp-Source: AGHT+IFE6H5Zba9CwD7qzrk/Mm1DRIh3fTELxbPb349RgI03eOHL8PmqRc6uRXS0sdKe/NrjBjBksA==
X-Received: by 2002:a05:6871:3781:b0:2bc:7811:5bb8 with SMTP id 586e51a60fabf-2e861fe9f34mr10164861fac.18.1748495370535;
        Wed, 28 May 2025 22:09:30 -0700 (PDT)
Received: from MVIN00016.mvista.com ([43.249.234.190])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2e9067b02f3sm140673fac.15.2025.05.28.22.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 22:09:30 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] screen: Fix CVE-2025-46805
Date: Thu, 29 May 2025 10:39:14 +0530
Message-ID: <20250529050914.19800-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 05:09:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217399

Upstream-Status: Backport from https://cgit.git.savannah.gnu.org/cgit/screen.git/commit/?id=161f85b98b7e1d5e4893aeed20f4cdb5e3dfaaa4

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../screen/screen/CVE-2025-46805.patch        | 121 ++++++++++++++++++
 meta/recipes-extended/screen/screen_4.9.0.bb  |   1 +
 2 files changed, 122 insertions(+)
 create mode 100644 meta/recipes-extended/screen/screen/CVE-2025-46805.patch

diff --git a/meta/recipes-extended/screen/screen/CVE-2025-46805.patch b/meta/recipes-extended/screen/screen/CVE-2025-46805.patch
new file mode 100644
index 0000000000..9d9d3e2827
--- /dev/null
+++ b/meta/recipes-extended/screen/screen/CVE-2025-46805.patch
@@ -0,0 +1,121 @@
+From 161f85b98b7e1d5e4893aeed20f4cdb5e3dfaaa4 Mon Sep 17 00:00:00 2001
+From: Matthias Gerstner <matthias.gerstner@suse.de>
+Date: Mon, 12 May 2025 15:38:19 +0200
+Subject: fix CVE-2025-46805: socket.c - don't send signals with root
+ privileges
+
+The CheckPid() function was introduced to address CVE-2023-24626, to
+prevent sending SIGCONT and SIGHUP to arbitrary PIDs in the system. This
+fix still suffers from a TOCTOU race condition. The client can replace
+itself by a privileged process, or try to cycle PIDs until a privileged
+process receives the original PID.
+
+To prevent this, always send signals using the real privileges. Keep
+CheckPid() for error diagnostics. If sending the actual signal fails
+later on then there will be no more error reporting.
+
+It seems the original bugfix already introduced a regression when
+attaching to another's user session that is not owned by root. In this
+case the target sessions runs with real uid X, while for sending a
+signal to the `pid` provided by the client real uid Y (or root
+privileges) are required.
+
+This is hard to properly fix without this regression. On Linux pidfds
+could be used to allow safely sending signals to other PIDs as root
+without involving race conditions. In this case the client PID should
+also be obtained via the UNIX domain socket's SO_PEERCRED option,
+though.
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/screen.git/commit/?id=161f85b98b7e1d5e4893aeed20f4cdb5e3dfaaa4]
+CVE: CVE-2025-46805
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ socket.c | 21 +++++++++++++--------
+ 1 file changed, 13 insertions(+), 8 deletions(-)
+
+diff --git a/socket.c b/socket.c
+index 9d87445..3bbd64e 100644
+--- a/socket.c
++++ b/socket.c
+@@ -826,6 +826,11 @@ int pid;
+   return UserStatus();
+ }
+ 
++static void KillUnpriv(pid_t pid, int sig) {
++    UserContext();
++    UserReturn(kill(pid, sig));
++}
++
+ #ifdef hpux
+ /*
+  * From: "F. K. Bruner" <napalm@ugcs.caltech.edu>
+@@ -911,14 +916,14 @@ struct win *wi;
+             {
+ 	      Msg(errno, "Could not perform necessary sanity checks on pts device.");
+ 	      close(i);
+-	      Kill(pid, SIG_BYE);
++	      KillUnpriv(pid, SIG_BYE);
+ 	      return -1;
+             }
+           if (strcmp(ttyname_in_ns, m->m_tty))
+             {
+ 	      Msg(errno, "Attach: passed fd does not match tty: %s - %s!", ttyname_in_ns, m->m_tty[0] != '\0' ? m->m_tty : "(null)");
+ 	      close(i);
+-	      Kill(pid, SIG_BYE);
++	      KillUnpriv(pid, SIG_BYE);
+ 	      return -1;
+ 	    }
+ 	  /* m->m_tty so far contains the actual name of the pts device in the
+@@ -935,19 +940,19 @@ struct win *wi;
+ 	{
+ 	  Msg(errno, "Attach: passed fd does not match tty: %s - %s!", m->m_tty, myttyname ? myttyname : "NULL");
+ 	  close(i);
+-	  Kill(pid, SIG_BYE);
++	  KillUnpriv(pid, SIG_BYE);
+ 	  return -1;
+ 	}
+     }
+   else if ((i = secopen(m->m_tty, O_RDWR | O_NONBLOCK, 0)) < 0)
+     {
+       Msg(errno, "Attach: Could not open %s!", m->m_tty);
+-      Kill(pid, SIG_BYE);
++      KillUnpriv(pid, SIG_BYE);
+       return -1;
+     }
+ #ifdef MULTIUSER
+   if (attach)
+-    Kill(pid, SIGCONT);
++    KillUnpriv(pid, SIGCONT);
+ #endif
+ 
+ #if defined(ultrix) || defined(pyr) || defined(NeXT)
+@@ -960,7 +965,7 @@ struct win *wi;
+ 	{
+ 	  write(i, "Attaching from inside of screen?\n", 33);
+ 	  close(i);
+-	  Kill(pid, SIG_BYE);
++	  KillUnpriv(pid, SIG_BYE);
+ 	  Msg(0, "Attach msg ignored: coming from inside.");
+ 	  return -1;
+ 	}
+@@ -971,7 +976,7 @@ struct win *wi;
+ 	  {
+ 	      write(i, "Access to session denied.\n", 26);
+ 	      close(i);
+-	      Kill(pid, SIG_BYE);
++	      KillUnpriv(pid, SIG_BYE);
+ 	      Msg(0, "Attach: access denied for user %s.", user);
+ 	      return -1;
+ 	  }
+@@ -1289,7 +1294,7 @@ ReceiveMsg()
+             Msg(0, "Query attempt with bad pid(%d)!", m.m.command.apid);
+           }
+           else {
+-            Kill(m.m.command.apid,
++            KillUnpriv(m.m.command.apid,
+                (queryflag >= 0)
+                    ? SIGCONT
+                    : SIG_BYE); /* Send SIG_BYE if an error happened */
+-- 
+2.49.0
+
diff --git a/meta/recipes-extended/screen/screen_4.9.0.bb b/meta/recipes-extended/screen/screen_4.9.0.bb
index 19070d87d8..d137c85600 100644
--- a/meta/recipes-extended/screen/screen_4.9.0.bb
+++ b/meta/recipes-extended/screen/screen_4.9.0.bb
@@ -22,6 +22,7 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://0001-fix-for-multijob-build.patch \
            file://0001-Remove-more-compatibility-stuff.patch \
            file://CVE-2023-24626.patch \
+           file://CVE-2025-46805.patch \
           "
 
 SRC_URI[sha256sum] = "f9335281bb4d1538ed078df78a20c2f39d3af9a4e91c57d084271e0289c730f4"
-- 
2.49.0


