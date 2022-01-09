Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01050C433F5
	for <webhook@archiver.kernel.org>; Sun,  9 Jan 2022 22:27:56 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.24046.1641767275282124777
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:27:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EiR6oE2V;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id l10so23331650wrh.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6YPfigs8NsHx4706gHVReR+N4Es/1xB+JYB775pGhZs=;
        b=EiR6oE2VqYSFldtEh+j9XUMStw9KhBE14vZCgSNGefg+Kkaw7v0zyQCg0x50tdDjRb
         1p2TjgqSrF5+QADTJ3ASnKDKR+0KGiBySbNVhPZ3XflVgtwnj2uTdil19FrQ1pYy/cT5
         vJEQjOQTAkgHOE2ky5KioTjq1tkq9Pz+EQsHfoYveXOvev1FZIy8UacbFvyl0qxW8yKB
         b3BdqOQ7gUIWL0jHD3+I/WBIDef3z5azzrNwfPL+WBvUbVYWNuMfBcBeSEDGHdjeztTq
         2k8qXho5sw6R580io4mB9kBpCWQnI6Fm3v5EZ1biiWrOoThKu0yztAAOk1J3+6j/Y2Ja
         oyKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6YPfigs8NsHx4706gHVReR+N4Es/1xB+JYB775pGhZs=;
        b=W0LuYtoQhqwo4V3kKSK/syAxYwIf8cdgGQWfZftp/DSw5g6dyX0sCHl2TRevUtwNZx
         wiqXUj6hTPRCm/d0cRl76Rmuwgt9Q2KD0TnTB6KE1VBCtnOVTqM1A3aQkn+BttfsqSxw
         wiyC4XhqKPVba9zZiL0qP+6Eqla/qB1f4J9tYdEMroIv5CQzNcsMxxA7ZCIZNNjRkogC
         5uTJZ64Vf8xpUe37QYY8LxfhWM0nDR2qZMEM2/ero/P/FNNSLhhJkh1hiOkd8ww6PU+c
         iXpz16g8/n1eoh/xCvICddAAA3coorjXmFwpqP/kIZggd+k1tl5XfdNt1dvdyON5sTnT
         zWHA==
X-Gm-Message-State: AOAM532LxRR8w7QFxhxueH2cA7CvHxFuSvhEWUjUr8S5opt3Q8khGx3K
	EaBJpgqUI0OMRZvlqUkh1cd41xl8SxE=
X-Google-Smtp-Source: 
 ABdhPJyjM6HraUHlRaBMnUciuG5X6qlr61987b/qX9Efbtw+RFj01RX9GiqpR7ma0PsJOIf6i6KxRA==
X-Received: by 2002:a5d:5608:: with SMTP id l8mr52039606wrv.587.1641767273692;
        Sun, 09 Jan 2022 14:27:53 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 l6sm6804319wry.18.2022.01.09.14.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 14:27:53 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/14] systemd: update 249.7 -> 250.1
Date: Sun,  9 Jan 2022 23:27:23 +0100
Message-Id: <20220109222732.2252416-5-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220109222732.2252416-1-alex@linutronix.de>
References: <20220109222732.2252416-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jan 2022 22:27:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160308

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...stemd-boot_249.7.bb => systemd-boot_250.1.bb} |  2 +-
 meta/recipes-core/systemd/systemd.inc            |  4 ++--
 ...install-dependency-links-at-install-tim.patch | 16 ++++++++--------
 ...01-test-parse-argument-Include-signal.h.patch | 14 ++++++--------
 .../{systemd_249.7.bb => systemd_250.1.bb}       |  1 +
 5 files changed, 18 insertions(+), 19 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_249.7.bb => systemd-boot_250.1.bb} (98%)
 rename meta/recipes-core/systemd/{systemd_249.7.bb => systemd_250.1.bb} (99%)

diff --git a/meta/recipes-core/systemd/systemd-boot_249.7.bb b/meta/recipes-core/systemd/systemd-boot_250.1.bb
similarity index 98%
rename from meta/recipes-core/systemd/systemd-boot_249.7.bb
rename to meta/recipes-core/systemd/systemd-boot_250.1.bb
index b3d4e31e08..23a64bf30d 100644
--- a/meta/recipes-core/systemd/systemd-boot_249.7.bb
+++ b/meta/recipes-core/systemd/systemd-boot_250.1.bb
@@ -20,7 +20,7 @@ EOF
 }
 
 # need to use ${HOST_PREFIX} here, otherwise ld.bfd could be used from HOSTTOOLS_NONFATAL
-EFI_LD = "${HOST_PREFIX}ld.bfd"
+EFI_LD = "bfd"
 
 EXTRA_OEMESON += "-Defi=true \
                   -Dgnu-efi=true \
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index b77f847abd..e416f8d64b 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,8 +14,8 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "d4406e94a32d423d8a73deb7757fb09890afe2c4"
-SRCBRANCH = "v249-stable"
+SRCREV = "402280118fe082122437638f53a0019c4aea81aa"
+SRCBRANCH = "v250-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
 "
 
diff --git a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
index d3af734e06..330ad492ba 100644
--- a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
+++ b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
@@ -1,4 +1,4 @@
-From 08cd165f5db0e68a499b80c4b1744a4206948259 Mon Sep 17 00:00:00 2001
+From f9974d7dc289551bfbf823b716fd32b43c54e465 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 21 Feb 2019 16:23:24 +0800
 Subject: [PATCH] binfmt: Don't install dependency links at install time for
@@ -26,10 +26,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  3 files changed, 9 insertions(+), 4 deletions(-)
 
 diff --git a/units/meson.build b/units/meson.build
-index 17e9ead9c1..e5502be620 100644
+index a9bf28f6d9..11d3644168 100644
 --- a/units/meson.build
 +++ b/units/meson.build
-@@ -59,8 +59,7 @@ units = [
+@@ -63,8 +63,7 @@ units = [
          ['poweroff.target',                     '',
           (with_runlevels ? 'runlevel0.target' : '')],
          ['printer.target',                      ''],
@@ -39,14 +39,14 @@ index 17e9ead9c1..e5502be620 100644
          ['proc-sys-fs-binfmt_misc.mount',       'ENABLE_BINFMT'],
          ['reboot.target',                       '',
           'ctrl-alt-del.target' + (with_runlevels ? ' runlevel6.target' : '')],
-@@ -178,8 +177,7 @@ in_units = [
+@@ -184,8 +183,7 @@ in_units = [
          ['rescue.service',                       ''],
          ['serial-getty@.service',                ''],
          ['systemd-backlight@.service',           'ENABLE_BACKLIGHT'],
 -        ['systemd-binfmt.service',               'ENABLE_BINFMT',
 -         'sysinit.target.wants/'],
 +        ['systemd-binfmt.service',               'ENABLE_BINFMT'],
-         ['systemd-bless-boot.service',           'ENABLE_EFI HAVE_BLKID'],
+         ['systemd-bless-boot.service',           'HAVE_GNU_EFI HAVE_BLKID'],
          ['systemd-boot-check-no-failures.service', ''],
          ['systemd-coredump@.service',            'ENABLE_COREDUMP'],
 diff --git a/units/proc-sys-fs-binfmt_misc.automount b/units/proc-sys-fs-binfmt_misc.automount
@@ -61,7 +61,7 @@ index 172c8757ab..f65d8930c6 100644
 +[Install]
 +WantedBy=sysinit.target
 diff --git a/units/systemd-binfmt.service.in b/units/systemd-binfmt.service.in
-index fdafce7ff7..4efc05e495 100644
+index 96f595ad72..7c010bb224 100644
 --- a/units/systemd-binfmt.service.in
 +++ b/units/systemd-binfmt.service.in
 @@ -14,6 +14,7 @@ Documentation=https://www.kernel.org/doc/html/latest/admin-guide/binfmt-misc.htm
@@ -71,8 +71,8 @@ index fdafce7ff7..4efc05e495 100644
 +Wants=proc-sys-fs-binfmt_misc.automount
  After=proc-sys-fs-binfmt_misc.automount
  After=proc-sys-fs-binfmt_misc.mount
- Before=sysinit.target shutdown.target
-@@ -30,3 +31,6 @@ RemainAfterExit=yes
+ After=local-fs.target
+@@ -31,3 +32,6 @@ RemainAfterExit=yes
  ExecStart={{ROOTLIBEXECDIR}}/systemd-binfmt
  ExecStop={{ROOTLIBEXECDIR}}/systemd-binfmt --unregister
  TimeoutSec=90s
diff --git a/meta/recipes-core/systemd/systemd/0001-test-parse-argument-Include-signal.h.patch b/meta/recipes-core/systemd/systemd/0001-test-parse-argument-Include-signal.h.patch
index 3af1daac9c..898e8af904 100644
--- a/meta/recipes-core/systemd/systemd/0001-test-parse-argument-Include-signal.h.patch
+++ b/meta/recipes-core/systemd/systemd/0001-test-parse-argument-Include-signal.h.patch
@@ -1,4 +1,4 @@
-From 1adde6721ead386ccee6efe48038d6944b96319a Mon Sep 17 00:00:00 2001
+From 93c7e482d39cf7765974b3c729d29c1b120a60e3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 24 May 2021 18:26:27 -0700
 Subject: [PATCH] test-parse-argument: Include signal.h
@@ -8,22 +8,20 @@ src/test/test-parse-argument.c:49:29: error: use of undeclared identifier 'SIGAB
 
 Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/19718]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/test/test-parse-argument.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/src/test/test-parse-argument.c b/src/test/test-parse-argument.c
-index 4081a9f25a..820d69f092 100644
+index cf3d54288a..15104e5282 100644
 --- a/src/test/test-parse-argument.c
 +++ b/src/test/test-parse-argument.c
-@@ -3,6 +3,7 @@
+@@ -5,6 +5,7 @@
  #include "parse-argument.h"
  #include "stdio-util.h"
  #include "tests.h"
 +#include <signal.h>
  
- static void test_parse_json_argument(void) {
-         log_info("/* %s */", __func__);
--- 
-2.31.1
-
+ TEST(parse_json_argument) {
+         JsonFormatFlags flags = JSON_FORMAT_PRETTY;
diff --git a/meta/recipes-core/systemd/systemd_249.7.bb b/meta/recipes-core/systemd/systemd_250.1.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_249.7.bb
rename to meta/recipes-core/systemd/systemd_250.1.bb
index 53e7f6738d..b05905b764 100644
--- a/meta/recipes-core/systemd/systemd_249.7.bb
+++ b/meta/recipes-core/systemd/systemd_250.1.bb
@@ -688,6 +688,7 @@ FILES:udev += "${base_sbindir}/udevd \
                ${rootlibexecdir}/udev/rules.d/60-serial.rules \
                ${rootlibexecdir}/udev/rules.d/61-autosuspend-manual.rules \
                ${rootlibexecdir}/udev/rules.d/64-btrfs.rules \
+               ${rootlibexecdir}/udev/rules.d/70-camera.rules \
                ${rootlibexecdir}/udev/rules.d/70-joystick.rules \
                ${rootlibexecdir}/udev/rules.d/70-memory.rules \
                ${rootlibexecdir}/udev/rules.d/70-mouse.rules \
-- 
2.20.1


