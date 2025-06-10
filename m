Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C5BC677C4
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 19:38:50 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.96534.1749584326018757921
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 12:38:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=N93r77rm;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso4812365b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749584325; x=1750189125; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7qHfXtNJYhQv+11AqES5hXnxMO7QHIQtuebO4RNfdZg=;
        b=N93r77rmMGNYqzbDoJnZozwaMjiFDw+d9b+nuN5mRciahSsEhl7LleSjns/h4XN4hX
         ywQ/wBGb08s2z5/v67l4h/dQFicp/D/HqDOxPa3tNTo4bYmsalHpJUAn3wpJB00gjSlo
         +McwyOxVtw9EJhyMMMGmTodEumHCmNFBQAGgcx6bRgOPTMS8IawLmzMEte9HCAd7tT4/
         CVxWqPQA4JrHEceYP52wgbQpeZOhoHbAMVTQfpECSuglZr2V+g6XjDMblZKW4hEQMK9j
         svaQFIiXvW0tWmZXDFjWYtmh34O1ABVwPC4huCb8qP/LHPHkgP0qoiaq4oNqFspybR7l
         REuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584325; x=1750189125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qHfXtNJYhQv+11AqES5hXnxMO7QHIQtuebO4RNfdZg=;
        b=TpYPgeb6R+2dQlv3qzH4NNCU5rEf4cFObcxN5MIluyQia4xGGsHPMXSSov+nmMdCux
         Sx5jxfP/5Q99N3eDzLh0UxRB8phN63OIPwsKkK3Ljxtha2l1YiRalRxnUooXlGr92OiF
         W09PCU3FMCgvxwm0DEfQCVXISk3Oe80LENqCcHtDr9Qm2WmK3ZDBufakLuUTewQKAK5m
         hXkx5YBdFIRlzYx5EHzctTDHkIijTHhWZ9D7DQSTBnfHGZi5+EeID/Z4EJZV6JvCzy41
         RLb05m9IrKCxQlIFhBP5/hgl0WlqSpnxWBrRRkFfxRPLWMt5jIvuoH43xtTSJdQe70jA
         M4Xw==
X-Gm-Message-State: AOJu0YyF2luuQCF5Z8rUGWw4YK0ng+zmrWHEd06IG2/JyiwNdO/+ehPG
	xgOO+lEPTn2s99IM301i5zRzlYSbbw24VuZ9g7x6EQQz1EdVoTO1MBCqav7kiRxI+cYVNzxH0jp
	BIyOH
X-Gm-Gg: ASbGnctaVhZneXiN4iAStt/qzwX5yKsbn2oGFpf6/oKUlNxcrcpf/2AnxeTfTqpbQkN
	pqIK85ZyHmD0CR5xROw6VoN5L/O2UvfSp9Mfc7R3vvfcaztmdNpPclz9tL5hthtK4AR3WPoSD+D
	k+NIROVmd6Dg6VHjwJseUfaOcjU5XIEuurByVZg8JYWEejOdATp+r42kLFtfoSiaYzR6IhMEvUu
	ARDNLbvnWU9E+i64PxR6eChHOZWV7ywaSfV+NJ2qA21WttoZmqR0hzjGnKvCeRN97MzoS+oAWGK
	hghKPbiIKSlUYlo+MifzMiV9gPl3jkOvL68pueGkmmPbdGMlO39SjZmMH/xNKESf
X-Google-Smtp-Source: AGHT+IG9OahOQUOAGi0DqH/oZCRTYFsLiqE9BdbpQLIsDciCyo0bCLMkTbQ8+uof5QOSKbujqcFUPQ==
X-Received: by 2002:a05:6a21:689:b0:21d:85c:2906 with SMTP id adf61e73a8af0-21f8660e658mr1170062637.13.1749584325256;
        Tue, 10 Jun 2025 12:38:45 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f7827c0sm7198595a12.62.2025.06.10.12.38.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:38:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/15] screen: fix CVE-2025-46802
Date: Tue, 10 Jun 2025 12:38:17 -0700
Message-ID: <b4074e06ff0531481dbb3788a5c1bf9e013b6239.1749584149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749584149.git.steve@sakoman.com>
References: <cover.1749584149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:38:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218432

From: Divya Chellam <divya.chellam@windriver.com>

For a short time they PTY is set to mode 666, allowing any user on the
system to connect to the screen session.

Reference:
https://security-tracker.debian.org/tracker/CVE-2025-46802

Upstream-patch:
https://cgit.git.savannah.gnu.org/cgit/screen.git/commit/?id=049b26b22e197ba3be9c46e5c193032e01a4724a

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../screen/screen/CVE-2025-46802.patch        | 146 ++++++++++++++++++
 meta/recipes-extended/screen/screen_4.9.0.bb  |   1 +
 2 files changed, 147 insertions(+)
 create mode 100644 meta/recipes-extended/screen/screen/CVE-2025-46802.patch

diff --git a/meta/recipes-extended/screen/screen/CVE-2025-46802.patch b/meta/recipes-extended/screen/screen/CVE-2025-46802.patch
new file mode 100644
index 0000000000..aa2cbeac21
--- /dev/null
+++ b/meta/recipes-extended/screen/screen/CVE-2025-46802.patch
@@ -0,0 +1,146 @@
+From 049b26b22e197ba3be9c46e5c193032e01a4724a Mon Sep 17 00:00:00 2001
+From: Matthias Gerstner <matthias.gerstner@suse.de>
+Date: Mon, 12 May 2025 15:15:38 +0200
+Subject: [PATCH] fix CVE-2025-46802: attacher.c - prevent temporary 0666 mode 
+ on PTYs
+
+This temporary chmod of the PTY to mode 0666 is most likely a remnant of
+past times, before the PTY file descriptor was passed to the target
+session via the UNIX domain socket.
+
+This chmod() causes a race condition during which any other user in the
+system can open the PTY for reading and writing, and thus allows PTY
+hijacking.
+
+Simply remove this logic completely.
+
+CVE: CVE-2025-46802
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/screen.git/commit/?id=049b26b22e197ba3be9c46e5c193032e01a4724a]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ attacher.c | 27 ---------------------------
+ screen.c   | 19 -------------------
+ 2 files changed, 46 deletions(-)
+
+diff --git a/attacher.c b/attacher.c
+index 18ba43c..257bd75 100644
+--- a/attacher.c
++++ b/attacher.c
+@@ -73,7 +73,6 @@ extern int MasterPid, attach_fd;
+ #ifdef MULTIUSER
+ extern char *multi;
+ extern int multiattach, multi_uid, own_uid;
+-extern int tty_mode, tty_oldmode;
+ # ifndef USE_SETEUID
+ static int multipipe[2];
+ # endif
+@@ -160,9 +159,6 @@ int how;
+ 
+       if (pipe(multipipe))
+ 	Panic(errno, "pipe");
+-      if (chmod(attach_tty, 0666))
+-	Panic(errno, "chmod %s", attach_tty);
+-      tty_oldmode = tty_mode;
+       eff_uid = -1;	/* make UserContext fork */
+       real_uid = multi_uid;
+       if ((ret = UserContext()) <= 0)
+@@ -174,11 +170,6 @@ int how;
+ 	    Panic(errno, "UserContext");
+ 	  close(multipipe[1]);
+ 	  read(multipipe[0], &dummy, 1);
+-	  if (tty_oldmode >= 0)
+-	    {
+-	      chmod(attach_tty, tty_oldmode);
+-	      tty_oldmode = -1;
+-	    }
+ 	  ret = UserStatus();
+ #ifdef LOCK
+ 	  if (ret == SIG_LOCK)
+@@ -224,9 +215,6 @@ int how;
+       xseteuid(multi_uid);
+       xseteuid(own_uid);
+ #endif
+-      if (chmod(attach_tty, 0666))
+-	Panic(errno, "chmod %s", attach_tty);
+-      tty_oldmode = tty_mode;
+     }
+ # endif /* USE_SETEUID */
+ #endif /* MULTIUSER */
+@@ -423,13 +411,6 @@ int how;
+       ContinuePlease = 0;
+ # ifndef USE_SETEUID
+       close(multipipe[1]);
+-# else
+-      xseteuid(own_uid);
+-      if (tty_oldmode >= 0)
+-        if (chmod(attach_tty, tty_oldmode))
+-          Panic(errno, "chmod %s", attach_tty);
+-      tty_oldmode = -1;
+-      xseteuid(real_uid);
+ # endif
+     }
+ #endif
+@@ -505,14 +486,6 @@ AttacherFinit SIGDEFARG
+ 	  close(s);
+ 	}
+     }
+-#ifdef MULTIUSER
+-  if (tty_oldmode >= 0)
+-    {
+-      if (setuid(own_uid))
+-        Panic(errno, "setuid");
+-      chmod(attach_tty, tty_oldmode);
+-    }
+-#endif
+   exit(0);
+   SIGRETURN;
+ }
+diff --git a/screen.c b/screen.c
+index 8bce303..f2e8171 100644
+--- a/screen.c
++++ b/screen.c
+@@ -230,8 +230,6 @@ char *multi_home;
+ int multi_uid;
+ int own_uid;
+ int multiattach;
+-int tty_mode;
+-int tty_oldmode = -1;
+ #endif
+ 
+ char HostName[MAXSTR];
+@@ -1009,9 +1007,6 @@ int main(int ac, char** av)
+ 
+     /* ttyname implies isatty */
+     SetTtyname(true, &st);
+-#ifdef MULTIUSER
+-    tty_mode = (int)st.st_mode & 0777;
+-#endif
+ 
+     fl = fcntl(0, F_GETFL, 0);
+     if (fl != -1 && (fl & (O_RDWR|O_RDONLY|O_WRONLY)) == O_RDWR)
+@@ -2170,20 +2165,6 @@ DEFINE_VARARGS_FN(Panic)
+       if (D_userpid)
+         Kill(D_userpid, SIG_BYE);
+     }
+-#ifdef MULTIUSER
+-  if (tty_oldmode >= 0) {
+-
+-# ifdef USE_SETEUID
+-    if (setuid(own_uid))
+-      xseteuid(own_uid);	/* may be a loop. sigh. */
+-# else
+-      setuid(own_uid);
+-# endif
+-
+-    debug1("Panic: changing back modes from %s\n", attach_tty);
+-    chmod(attach_tty, tty_oldmode);
+-  }
+-#endif
+   eexit(1);
+ }
+ 
+-- 
+2.40.0
+
diff --git a/meta/recipes-extended/screen/screen_4.9.0.bb b/meta/recipes-extended/screen/screen_4.9.0.bb
index d137c85600..540a78e04b 100644
--- a/meta/recipes-extended/screen/screen_4.9.0.bb
+++ b/meta/recipes-extended/screen/screen_4.9.0.bb
@@ -23,6 +23,7 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://0001-Remove-more-compatibility-stuff.patch \
            file://CVE-2023-24626.patch \
            file://CVE-2025-46805.patch \
+           file://CVE-2025-46802.patch \
           "
 
 SRC_URI[sha256sum] = "f9335281bb4d1538ed078df78a20c2f39d3af9a4e91c57d084271e0289c730f4"
-- 
2.43.0


