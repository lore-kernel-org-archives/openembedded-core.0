Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34A3FC6371B
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:02 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web09.9846.1649532441010993115
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Apr 2022 12:27:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Dk3Rxvf6;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 s14-20020a17090a880e00b001caaf6d3dd1so14758286pjn.3
        for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Apr 2022 12:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aR2ycWGWF5RqtYhLgrQW5V9bCp1iI7NEzCFt55ol7ww=;
        b=Dk3Rxvf6HJjR+5i/Y/V6iP7kcUT2YqIg5eDuFs5W8Le0pjfK9W20EPtHSuaJxVxUir
         iw3BtClt2LTr2KFhwJoUHyvK1/tPb3qgeyjxrH2vabLrdXQ0W7q8bpQIa0oaoJEwzB9y
         qfxnYqTOJwc3L4u0aik0FWpmdEzTqre4u96s66aBB3eXb7lRrq78z/wEmwdDmTH8wXog
         veXcy7M90M4TLuCOxaVMW4GT+m1iZbGKm8RJIb+cMSaT3GcO2N/vod4YdXnr6vEKcOT3
         G+vX4ZB3NF6HIm95VetfgClzAPucW4+TcvUP7MYrumOH+pZd3brW3Sx4YWbNPoKCvoeI
         Jmeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aR2ycWGWF5RqtYhLgrQW5V9bCp1iI7NEzCFt55ol7ww=;
        b=AtdfcDC349j1Rp3X/2Z2ykPjES/lQiTD4G2MbqMCvyf7o+5d2r/GQ4dj7nmi73SzWa
         FG0YFwcBXj4u+GilB4cHE7M62sSrEnes/DCqssEKtnth3AWyEFBUWtyak5CK5NQKSxBp
         /+gm3vntRuk2axgkOrSd3QuS6K1MMVsh/9dSK6xE9F5X4D/iy9Z4WWsLkSZcZt9s8hvp
         ORnWymRcEu3unolLYi8xNoa4h0tRFVYPH9b7V6ORzQKqOinFq2YCYf5Vp7XEgwq/Ksq+
         O2a9e4EyzCwxtCjas1WfZK2wvFHoQ0osLQfqeZ7c9gtFIF0sFSbRrUyhUP25qiTk8Cke
         3CcQ==
X-Gm-Message-State: AOAM532hbjijBKcFXkDkM6GeU3sfDY2EzzsdKQZIxfmwiBWXMhCKenAb
	TiyQ3VEe57SZbQ/2BXtTC5x+ao1fwX1kPA==
X-Google-Smtp-Source: 
 ABdhPJwV8hjmE1ct4GRkfM0gnPqGAQKDBINMzHiCWspvOlceswtuO84LVR/ceJYECjkOIQZrrqFzpw==
X-Received: by 2002:a17:903:2345:b0:157:53f:76fb with SMTP id
 c5-20020a170903234500b00157053f76fbmr14951635plh.161.1649532440217;
        Sat, 09 Apr 2022 12:27:20 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::94ca])
        by smtp.gmail.com with ESMTPSA id
 y13-20020a17090a390d00b001c995e0a481sm15861982pjb.30.2022.04.09.12.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Apr 2022 12:27:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ross Burton <ross.burton@arm.com>,
	Jon Mason <jdmason@kudzu.us>
Subject: [master][kirkstone][PATCH] python3: Do not detect multiarch when
 cross compiling
Date: Sat,  9 Apr 2022 12:27:17 -0700
Message-Id: <20220409192717.1620524-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164192

This was a long standing problem seen on aarch64 build hosts when
compiling python3 with clang cross compiler. The issue is not seen with
gcc because native glibc headers are still compatible with gcc cross compiler

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>
Cc: Jon Mason <jdmason@kudzu.us>
---
 ...detect-multiarch-paths-when-cross-co.patch | 42 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.10.4.bb |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch

diff --git a/meta/recipes-devtools/python/python3/0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch b/meta/recipes-devtools/python/python3/0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch
new file mode 100644
index 00000000000..1844e0efa30
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch
@@ -0,0 +1,42 @@
+From dc966f1278c1077938626d682666767d2c8d0c72 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 9 Apr 2022 18:29:47 +0000
+Subject: [PATCH] setup.py: Do not detect multiarch paths when cross-compiling
+
+add_multiarch_paths() function relies on host tools like dpkg-configure
+to operate, which is not good when cross compiling, since it ends up
+adding native paths in includes in certain cases, e.g. when building
+for aarch64 targets using aarch64 build hosts running debian-like
+distributions e.g. ubuntu, it ends up adding native multiarch paths
+-I/usr/include/aarch64-linux-gnu during cross compile and since arches
+are so similar, cross compiler (epecially clang) is inhererently configured
+with multiarch ends up adding these paths to compiler cmdline which
+works ok with gcc since headers are similar but clang barfs on some gcc
+extentions and build fails due to missing gnu extentions but it silently
+compiles when using cross gcc.
+
+Fixes python3 cross build by not running this funciton when cross compiling
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ setup.py | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 2e7f263..f7a3d39 100644
+--- a/setup.py
++++ b/setup.py
+@@ -840,7 +840,8 @@ class PyBuildExt(build_ext):
+         # only change this for cross builds for 3.3, issues on Mageia
+         if CROSS_COMPILING:
+             self.add_cross_compiling_paths()
+-        self.add_multiarch_paths()
++        if not CROSS_COMPILING:
++            self.add_multiarch_paths()
+         self.add_ldflags_cppflags()
+ 
+     def init_inc_lib_dirs(self):
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3_3.10.4.bb b/meta/recipes-devtools/python/python3_3.10.4.bb
index 522f0d71ee5..7eaafe34ad5 100644
--- a/meta/recipes-devtools/python/python3_3.10.4.bb
+++ b/meta/recipes-devtools/python/python3_3.10.4.bb
@@ -32,6 +32,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://makerace.patch \
            file://0001-sysconfig.py-use-platlibdir-also-for-purelib.patch \
            file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch \
+           file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.35.1


