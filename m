Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E265C5B543
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 15:40:07 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.8798.1748619604369612732
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 08:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=khxkqF0L;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-234e48b736aso27449545ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 08:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748619603; x=1749224403; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n1jacX++26q5kSvPRFnBqvQNrO/SOihtKj03LHLB708=;
        b=khxkqF0L+VK09NwxsV039NAQYfsM6loXrsurtYMBSB+NOExUsZ8Yd7xyN7RDAG5WWv
         bJalYOX3g/5QBhSO8fymI02+HPH+RtpGIVMse3Zvd/QyunOZu58G+yYg/qEBYEmyuQ2K
         7nyaKo8c61L47BkpwqJ2EjhjcxjYoo5dYaFLmPOhLnJ+RYeZ4S2yo0x9I38qoiLhGbjb
         DgGTypRL6FA2sZnr2qGb+GWE1g8s8X2dbphQJGiaks+6FVj6NdBB8UlZLYjDUq7fndlB
         YavORElt8kd7fsoitQ0aTXizIyQSSRGOwbKgiQXBNTLpGJXYlhcZcnejlWPiub4iro+3
         RD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748619603; x=1749224403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n1jacX++26q5kSvPRFnBqvQNrO/SOihtKj03LHLB708=;
        b=j5xCxShOUiRl1CAtGkyhIpzjvvawgF0/zvq09XKOESIrOEPnwksP7NdvQd5M6RUsWJ
         Z0s+NWMIWPBKQXfRZ01qmAprxqmm75jWdWkojcK0VtQXL4JmT4ienVpNVvzd15HpnMPG
         O5AVw5ztYsKLijGzHH4GYNwIZfpEs8f7rXynsEZYL1jJa02SSWl2Isbw7E8lAcwrxDXt
         pMM4TKWARi8HzlO0vQS7XW0mDxS+WxdCqK91t7C7MIbt20VSGR7fui+Z/M0ZHKxqkTUa
         noBLvDr47/yPaFyxjiYwDmXL7qmrtUAJ3Ulhky1FHBgBXMDVPzBzGQENEhlF4MS5997l
         M8yg==
X-Gm-Message-State: AOJu0YzOI9lZsYt2ldQihXjRz7kblG6hq3yZWfseknXbRUYT+QvEHWBA
	54+WhanGz/6/PXTgw2Q1Yuz5xh6x05fG6dISrdwt5LAXHUcDL2yWSrPNMc+flyrSEbBBrhekEna
	QQ2uE
X-Gm-Gg: ASbGncveJnBzI2kbUFDMFzLBa7epnBTMTKprZ05IAzjK6LPOnEbDMeV33TVbukcQ5Br
	kqFzsu/0kMg0jI/gPNt4ZbryDphClyJNHo15Y2ZB/bXT+1W1IX4LyTu3KMiBox9QQO99OAmSlOE
	CLFobCIebINuYiC79XIJBAlMTRiIqxlBW/z0cK7MUSJVP4sg7e51SAZSBe9khGnGooI4al2Y7H5
	CMTS8QoatLcEkyp+HjM8bgv23jSsajEOb1NR98AxrzqFpbPiIBGYOPw1QzMFHCSY8SF1iOC/45r
	3hGwUl5vJqUUajYIKFkE2UmDd/4ROu8/27BneoWzF1c=
X-Google-Smtp-Source: AGHT+IFVrpYeaKPvFvnV0Be7f6m0uPRlidHZUqP4JkKaO9YrNs1ul+qeZxDxkcQQDgFt/1mIXIIsxw==
X-Received: by 2002:a17:902:e807:b0:234:ba37:87b2 with SMTP id d9443c01a7336-235289fdb73mr63404375ad.10.1748619603484;
        Fri, 30 May 2025 08:40:03 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c9d8:e2d0:bfbc:3a26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf9116sm29903075ad.200.2025.05.30.08.40.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 08:40:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/10] screen: Fix CVE-2025-46805
Date: Fri, 30 May 2025 08:39:45 -0700
Message-ID: <b25b0f785e0b7650e31a45a92be196be6b76ea78.1748619488.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748619488.git.steve@sakoman.com>
References: <cover.1748619488.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 15:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217511

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://cgit.git.savannah.gnu.org/cgit/screen.git/commit/?id=161f85b98b7e1d5e4893aeed20f4cdb5e3dfaaa4

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


