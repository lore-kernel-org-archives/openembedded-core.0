Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31466C61CE7
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 16:00:43 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.37097.1749225636749989393
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 09:00:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cX6mPhat;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso1924510b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 09:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749225636; x=1749830436; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O1CgjKfVxjEEk67FKgX+MgXJGosun0FwCukEiGp68Pw=;
        b=cX6mPhatZa8a5P0dzqBU8JCf09wRm0rWUmTwfrnglPTC88COjenpPTgE0aBopl4iDz
         aYlK0HUIdfmcpsH6dL3zlx0WCemFxJQi1EVDcWd9cruK5z4s8QiR7c8jBGwj8rZ2em9B
         Yg8cxwXBKICemmUn0i3hyR/IyCr43lgETt4W3MddefOTPVmGnh8+T4Q3VAb/kCUIo7jW
         zWAAHd9Dww62JkybsibLbtHdrpXHFROF/m9sU5M6q7OFAvRPKr1aJbyL6ruGjrAu76DP
         2Z+vyCMWla9Eevig1OyUufu7CTJ5S7XJg4oqn3wxbCTsjQ5Hi7+AG6pwkqtT4McpONnN
         omPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749225636; x=1749830436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O1CgjKfVxjEEk67FKgX+MgXJGosun0FwCukEiGp68Pw=;
        b=ATX98zBViLAhm9eN1OnB4wQIcmfOe5iU09zwhM3bgSi1Ll/TrUL9uhcbYQpo8u6O2M
         4/V45A29hwCuQZcpc1mXe6xyquxiNN9f8FafWn4+slKdihdvAAkJFPadTozerMz4xFq9
         pm4W/HMXC+45tSgLVeG9b6ieIn5f4DiT603CIwr9Drj/FS9kexWZ2d+GcIZfQaWOM09h
         TosKNW49M6OdaGEr6ADsMti0qypK0F722w3qd8XHtsnmjCnNZ/qCXu4d7xdONp+w9kP8
         OIH37gLgAfU3ASZyKjm9qLwySJB75jme/QkQMhETqYQQ3gsCcQf3GwbAjUBblJkl8m+J
         7ZfA==
X-Gm-Message-State: AOJu0Yy+0oNNKgnu29oCfLaif+JrooFqNZKA+gJ/eohjfycO1gTYM0Ld
	wYrcE4TZMJto9+S3TuncxTb3nFQOBL9hj/z3x4sv0m3jN6og+Ng7kcu2Hz0FlhMKVT6H8d1QXib
	1TEuV
X-Gm-Gg: ASbGncvlnuBNWYdftI805UkPT0hoPCOdYYyBKRI3/w5DKhPOBgMHFU8xWxc2zfzvEyU
	gBEIUG5/hoyKZHUfArRTn9LirU4yh5xK2ByX8DnFuqgA8fMbPWbrmz5aDNNm7jZfkB35k3RZgiy
	hAeXQN0j3InAR/YjjkW1g0PM+2/uO6fWY4TEOoNnOU0861bbmRz81QA3bJyoJom41qJoS/GsOUa
	P42BKPeMhgMHS+gg/f0dxQwBzkNSiecaYcFYpjXkYi7Du3TdyhXmewUo+TlMX+BQsgE/RSdg2HA
	K0fxNP232oRP9zB/35qgZi/HLe+DTUvxVFQ82SI25xFXMH13EB5llAc03E8aTBHD
X-Google-Smtp-Source: AGHT+IFMmvXi9qKgzx59uFi8dCAbdZrU60JQXn7DUraxIxIDcNe2u5+pJBHu3HJKqjYau8ks47Pc6g==
X-Received: by 2002:a05:6a00:1796:b0:742:a334:466a with SMTP id d2e1a72fcca58-74827ea23a8mr5524363b3a.12.1749225633872;
        Fri, 06 Jun 2025 09:00:33 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:742a:4153:2a1f:f028])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b083a9bsm1436489b3a.77.2025.06.06.09.00.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 09:00:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/12] screen: fix CVE-2025-46802
Date: Fri,  6 Jun 2025 09:00:03 -0700
Message-ID: <b17e091eb4681b69c5a050d3fa0f9289f524e205.1749225418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749225417.git.steve@sakoman.com>
References: <cover.1749225417.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 16:00:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218172

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
 meta/recipes-extended/screen/screen_4.9.1.bb  |   1 +
 2 files changed, 147 insertions(+)
 create mode 100644 meta/recipes-extended/screen/screen/CVE-2025-46802.patch

diff --git a/meta/recipes-extended/screen/screen/CVE-2025-46802.patch b/meta/recipes-extended/screen/screen/CVE-2025-46802.patch
new file mode 100644
index 0000000000..e46affc480
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
+index c35ae7a..16b151e 100644
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
+index 7653cd1..1a23e1a 100644
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
diff --git a/meta/recipes-extended/screen/screen_4.9.1.bb b/meta/recipes-extended/screen/screen_4.9.1.bb
index 96f8021255..bc4928ff77 100644
--- a/meta/recipes-extended/screen/screen_4.9.1.bb
+++ b/meta/recipes-extended/screen/screen_4.9.1.bb
@@ -22,6 +22,7 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://0001-fix-for-multijob-build.patch \
            file://0001-Remove-more-compatibility-stuff.patch \
            file://CVE-2025-46805.patch \
+           file://CVE-2025-46802.patch \
            "
 
 SRC_URI[sha256sum] = "26cef3e3c42571c0d484ad6faf110c5c15091fbf872b06fa7aa4766c7405ac69"
-- 
2.43.0


