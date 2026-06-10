Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34437CD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 14:12:37 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21332.1781100749211460350
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 07:12:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=r3XuluMB;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45eedc94d37so3515282f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 07:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781100748; x=1781705548; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uulGCa1Z5g4Aqx1HxN82440+mLEZ/Gd4n3ygln0qfJg=;
        b=r3XuluMB8Q2fH7lMIuCrmwl5WETnK3bN067qT0n2t7GsQLCItoP6a/Un9PT7pn9KQg
         fPlxI5zWsW7BMLa7gIHrGIMdT8X4rYMQDLBwt2x8v2Eimv0h247Twpgtu+s1FC9IYRJ/
         m3VBjBSdeUznUxZ5GCvky69X3gd/rin93B03bNCUlohLpQfKBmwuaN51QW5kj2NnlYOI
         9KyfB8/MkgeNROrrD7psgUg2rYTvMNNwNImSPYydL4na2C/ex34oW/USjJ2/QGm9/Al9
         og68kX54eYYd9HF/075bP5aOeDU4dRCxOH4rem83ZpkwkU9XIEPcbr9iaOu9/2kyHVM8
         71MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781100748; x=1781705548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uulGCa1Z5g4Aqx1HxN82440+mLEZ/Gd4n3ygln0qfJg=;
        b=nWTsOsyzbFqsQl6/BOLLLpHlhIyzUH0FnU/TRIqovSTLDj0DNM+XdRKjM//TgJBmsU
         goeBGG6yxFkGQfoTM3Is0sgNccFupUaXKtqYAq0kYkwlJ/tCOzEYrEITnhDlhv0SjMao
         fvVvHF3l4WW2qDQKSvqQwfb8D4GcxX693orvSspH0ULfPvBrPXyT03eXXrzog62HBO0w
         KkB8mmU0iTmGdWqOtePzjRNGMODS/Bo6Na8kD4wQcolC6mPHr5fvuZVXf7absWAldX+D
         Ao4AHpHmhVZURMpIumWJPK7u4B9TaI1efNo9Z6ZlUEf16rjI9l0z7XP8IoXZqrOYnRbE
         Kbfg==
X-Gm-Message-State: AOJu0YyX/zZcinwFqSwv+ayLAiEF6J0jU3CA5MrCr1rA4MnznBOZY87w
	JmF2IwSzwGaXIqxY7YXWoc0jHv0yw8v7VxL60bSEopc573KWAiz0irxb1RJxibMs
X-Gm-Gg: Acq92OGBwSPeuSUcHK1nMptD9Jlgkybd6qj0+0TnQ7uUxfYNjKQXz0bwCWSBaq9F05I
	BETvXGvcqMkhMYjA3EK6nBlE6I6LdAooVvR/IAwdwEanH0tlTvNMJ0j5DDqbcZ7ryI0N3zpvIb1
	4ve0GSrVVcgHhvAlqoWDrIF7o+SJOMTO80wzitmmB9zUTy59hsxsifEN9zXCp9V2XlzkK3+PDSf
	pvw92c8w87m7w/9B+OmV40fIugy9wmA/BLvTYYnEj4+4aWKa0ofl8ZTUu84HuV++FcQ9Y7E1GJs
	GzcbMR0In1PATTQ29G+RsWNXck9ou4SSmP76TyVmqHL8VrCsPSZ/X6/X/VOsiS56MdGqI3uD+Os
	YTbGkofNu5vDgD8PFEYYxckF0ogSpptgCLSwnRaS7s3+4qvE1kE2c2D9V/mSy0UDbaBq1zmrRB6
	vzC9Ldz4AeLhNfwNSZKFEZva3ZEHonUdh6gRM4/VwCT+V63BMszM8UJDqRtzid25bwmr3TLQ==
X-Received: by 2002:a05:6000:18aa:b0:45d:817c:b8b2 with SMTP id ffacd0b85a97d-460566c95a6mr10074303f8f.30.1781100747366;
        Wed, 10 Jun 2026 07:12:27 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm73090471f8f.2.2026.06.10.07.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 07:12:26 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/4] qemu: upgrade 11.0.0 -> 11.0.1
Date: Wed, 10 Jun 2026 16:12:08 +0200
Message-ID: <20260610141220.709884-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260610141220.709884-1-alex.kanavin@gmail.com>
References: <20260610141220.709884-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 14:12:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238364

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{qemu-native_11.0.0.bb => qemu-native_11.0.1.bb}     | 0
 ...tem-native_11.0.0.bb => qemu-system-native_11.0.1.bb} | 0
 meta/recipes-devtools/qemu/qemu.inc                      | 2 +-
 ...Add-addition-environment-space-to-boot-loader-q.patch | 2 +-
 .../qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch   | 2 +-
 .../0004-qemu-Do-not-include-file-if-not-exists.patch    | 4 ++--
 ...Add-some-user-space-mmap-tweaks-to-address-musl.patch | 2 +-
 .../qemu/qemu/0006-qemu-Determinism-fixes.patch          | 2 +-
 ...-meson.build-use-relative-path-to-refer-to-file.patch | 2 +-
 ...e-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch | 2 +-
 .../0010-configure-lookup-meson-exutable-from-PATH.patch | 2 +-
 ...Ensure-pip-and-the-python-venv-aren-t-used-for-.patch | 2 +-
 ...-meson-fix-close_range-detection-on-older-glibc.patch | 9 ++++++---
 ...clude-standard-headers-for-vhost-worker-structs.patch | 6 ++++--
 .../qemu/{qemu_11.0.0.bb => qemu_11.0.1.bb}              | 0
 15 files changed, 21 insertions(+), 16 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_11.0.0.bb => qemu-native_11.0.1.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_11.0.0.bb => qemu-system-native_11.0.1.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu_11.0.0.bb => qemu_11.0.1.bb} (100%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_11.0.0.bb b/meta/recipes-devtools/qemu/qemu-native_11.0.1.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_11.0.0.bb
rename to meta/recipes-devtools/qemu/qemu-native_11.0.1.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_11.0.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_11.0.1.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_11.0.0.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_11.0.1.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index f61f43de4b..8efb2370c6 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -41,7 +41,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "c04ca36012653f32d11c674d370cf52a710e7d3f18c2d8b63e4932052a4854d6"
+SRC_URI[sha256sum] = "0d235f5820278d914a3155ec27af8e4258d697ea892895570807d69c0cb8cd64"
 
 CVE_STATUS[CVE-2007-0998] = "not-applicable-config: The VNC server can expose host files uder some circumstances. We don't enable it by default."
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
index 40b08cd247..999d34aa75 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
@@ -1,4 +1,4 @@
-From a84184c98cf296954e0c757604e969b8565eb474 Mon Sep 17 00:00:00 2001
+From ae20f7ba1494b3593761a96b2300a9df9c5f6040 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Fri, 28 Mar 2014 17:42:43 +0800
 Subject: [PATCH] qemu: Add addition environment space to boot loader
diff --git a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
index ad00f24482..5e74abbc8d 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
@@ -1,4 +1,4 @@
-From 0a688e763d91c2e0e11cbe960f405442a9f35417 Mon Sep 17 00:00:00 2001
+From 6a739f00ffa39aaf42545a7d27aa4d696b5b1cf9 Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Tue, 26 Feb 2013 11:43:28 -0500
 Subject: [PATCH] apic: fixup fallthrough to PIC
diff --git a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
index 4b6ac54445..0715261124 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
@@ -1,4 +1,4 @@
-From b38315a5a6f9fc033c72bb94ff258bb4b1ac8dd3 Mon Sep 17 00:00:00 2001
+From d0bbf4a782b7caa452d91bd31512c2c625988670 Mon Sep 17 00:00:00 2001
 From: Oleksiy Obitotskyy <oobitots@cisco.com>
 Date: Wed, 25 Mar 2020 21:21:35 +0200
 Subject: [PATCH] qemu: Do not include file if not exists
@@ -16,7 +16,7 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index f4b74ad35..3da51ea83 100644
+index 65bbeb855..3ed891bd2 100644
 --- a/linux-user/syscall.c
 +++ b/linux-user/syscall.c
 @@ -117,7 +117,9 @@
diff --git a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
index 59236999f9..53675ea4bd 100644
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
@@ -1,4 +1,4 @@
-From e4abb937ba5a6a476d31886e71e67006df22a664 Mon Sep 17 00:00:00 2001
+From 7330a1ed776e5bfb322ecf36a1ee757127289895 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 8 Jan 2021 17:27:06 +0000
 Subject: [PATCH] qemu: Add some user space mmap tweaks to address musl 32 bit
diff --git a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
index 0d7974fcdc..966f78186e 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
@@ -1,4 +1,4 @@
-From e891928d2248e186c65979cf5a2ba0cff9d00824 Mon Sep 17 00:00:00 2001
+From 4f35bc947f61b8cc3af069e236c715a75a13d0f3 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 1 Mar 2021 13:00:47 +0000
 Subject: [PATCH] qemu: Determinism fixes
diff --git a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
index 275c500894..b2237fe05d 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
@@ -1,4 +1,4 @@
-From ac9a866ac807cb1542f26df07b4aad3a06342a99 Mon Sep 17 00:00:00 2001
+From c4e2880b044a96a232d2d362f824c898292197a1 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 14 Jan 2021 06:33:04 +0000
 Subject: [PATCH] tests/meson.build: use relative path to refer to files
diff --git a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
index f6e563ad80..4bd4eafcc1 100644
--- a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
@@ -1,4 +1,4 @@
-From c0bfd2c5556afcf4413c81b3fda54a62f2bdd8c8 Mon Sep 17 00:00:00 2001
+From e3ab7c32d71f35577e8e28ac7cd671174739f435 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 21 Mar 2022 10:09:38 -0700
 Subject: [PATCH] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
diff --git a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
index 430b1aa509..4ce4e8e167 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
@@ -1,4 +1,4 @@
-From e357ac91b04f733148defe8c133ae8b2085a9a23 Mon Sep 17 00:00:00 2001
+From 53b173fd19123b6fdcbfec3c0d458b074db09ced Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
 Date: Wed, 22 May 2024 14:02:55 +0200
 Subject: [PATCH] configure: lookup meson exutable from PATH
diff --git a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
index 040931a941..e379400ea2 100644
--- a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
@@ -1,4 +1,4 @@
-From 70fa360e5bf72b28960747da47d9b85e650ad312 Mon Sep 17 00:00:00 2001
+From 79dbf4d366e322dc544c749679d8a1abbbc91b7e Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 22 May 2024 13:58:23 +0200
 Subject: [PATCH] qemu: Ensure pip and the python venv aren't used for meson
diff --git a/meta/recipes-devtools/qemu/qemu/0012-meson-fix-close_range-detection-on-older-glibc.patch b/meta/recipes-devtools/qemu/qemu/0012-meson-fix-close_range-detection-on-older-glibc.patch
index 3dfc70dad6..6ee3ae52b9 100644
--- a/meta/recipes-devtools/qemu/qemu/0012-meson-fix-close_range-detection-on-older-glibc.patch
+++ b/meta/recipes-devtools/qemu/qemu/0012-meson-fix-close_range-detection-on-older-glibc.patch
@@ -1,4 +1,6 @@
+From b072e3d025da9d5f266683b0b12796796c4208b3 Mon Sep 17 00:00:00 2001
 From: Quan Sun <Quan.Sun@windriver.com>
+Date: Fri, 5 Jun 2026 11:54:57 +0000
 Subject: [PATCH] meson: fix close_range detection on older glibc
 
 The has_function('close_range') check succeeds at link time on hosts
@@ -22,11 +24,12 @@ Signed-off-by: Quan Sun <Quan.Sun@windriver.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index cf634dfcd8..a1b2c3d4e5 100644
+index 51f5f2851..4353200db 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -2632,6 +2632,7 @@ endif
-
+@@ -2637,7 +2637,8 @@ if host_os == 'windows'
+ endif
+ 
  # has_function
 -config_host_data.set('CONFIG_CLOSE_RANGE', cc.has_function('close_range'))
 +config_host_data.set('CONFIG_CLOSE_RANGE',
diff --git a/meta/recipes-devtools/qemu/qemu/0013-hw-scsi-vhost-scsi-include-standard-headers-for-vhost-worker-structs.patch b/meta/recipes-devtools/qemu/qemu/0013-hw-scsi-vhost-scsi-include-standard-headers-for-vhost-worker-structs.patch
index ea37d20d87..25be3c2d08 100644
--- a/meta/recipes-devtools/qemu/qemu/0013-hw-scsi-vhost-scsi-include-standard-headers-for-vhost-worker-structs.patch
+++ b/meta/recipes-devtools/qemu/qemu/0013-hw-scsi-vhost-scsi-include-standard-headers-for-vhost-worker-structs.patch
@@ -1,4 +1,6 @@
+From 6b613dae1eb1bad99fce6ee28f3c67fd0561b527 Mon Sep 17 00:00:00 2001
 From: Quan Sun <Quan.Sun@windriver.com>
+Date: Fri, 5 Jun 2026 11:54:58 +0000
 Subject: [PATCH] hw/scsi/vhost-scsi: fix build with older kernel headers
 
 On build hosts with kernel headers older than 6.0, the system's
@@ -22,12 +24,12 @@ Signed-off-by: Quan Sun <Quan.Sun@windriver.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
-index 699863cc10..10e8fbe503 100644
+index 699863cc1..10e8fbe50 100644
 --- a/hw/scsi/vhost-scsi.c
 +++ b/hw/scsi/vhost-scsi.c
 @@ -15,6 +15,7 @@
   */
-
+ 
  #include "qemu/osdep.h"
 +#include "standard-headers/linux/vhost_types.h"
  #include <linux/vhost.h>
diff --git a/meta/recipes-devtools/qemu/qemu_11.0.0.bb b/meta/recipes-devtools/qemu/qemu_11.0.1.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_11.0.0.bb
rename to meta/recipes-devtools/qemu/qemu_11.0.1.bb
-- 
2.47.3


