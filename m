Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11484C7618A
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 15:20:12 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.16015.1678375208292380096
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 07:20:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hZo6x4L5;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id j19-20020a05600c1c1300b003e9b564fae9so3860470wms.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 07:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678375207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zaWxNHVXGdFYYFF46f95Y2c7gJJJR/36bWcTGU26rag=;
        b=hZo6x4L5Ztv3mRn9hV8/NVuOAtK9Sq6GQ2JPxmqEvGqxfiwGCfmM+vbwzuxcLzhkgu
         oJzJmifbW9pD2XYF32UM5+BjGKgLBEgYzLT5C4Kax6r2zED3ODDkv3RQszC5JZpr9SfA
         1V+r0tGj7gB/lMbYA4OgC1fD2xbTa7Swep4Pvgpbb7JgsrIrE+rtwufyXBGHs3OJV75b
         ADAk8U6xjLKV6Zhoy2+oah+eu/VYAphaHbFJ4Mb/QGyXie6o61uPAkgTpQAh+rYjwn1r
         +T12+ZAMYOF1WnLfm29l8PBnP56/mSdeq8Sz82sAWCvlPO0kxJW0Oj/c7U64Psuy9LQt
         Suaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678375207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zaWxNHVXGdFYYFF46f95Y2c7gJJJR/36bWcTGU26rag=;
        b=NdgafAbmEkBvE1w3YEfeU4fslCCDCeIPglBFICgvtTHLS39xti5qeXeyph5TaI5yDC
         4hWzJhuPBpWqMN7+OEH1hGAZbC1aYOtONdwpc5M2926H7o40T80Y0mPo6ueAgRDSMz28
         PjiTlrjlyEm/YxJOtC6XUXtXxqPFegvfigTegNl/v9Cm+RRr8B/JzJY4560KTf1cUGD6
         Him6E9A/U7GFNcQmjTZHnBQ7voKAgRM6/G5II/9NGhhUwAuft0G4SEDHNuBG8SFonIi8
         IbuCwt/R7AmIzR3Rm76kWKsDMYqKmNOpYU2UEtbFMTPUJKbteikivQk46VEUH1OdWzFS
         NJlQ==
X-Gm-Message-State: AO0yUKW0v8VzYPqXoFloUmNcaCUEu6xOfK7OJUonBX+gHsH5t7jq63+V
	jtW5cxtBbUson81HcwjJu7a2+o6ZiKc=
X-Google-Smtp-Source: AK7set+nbFl4HNgSj8+csSG/lO5/0bOk2mGEVYhaLZyQ/JVEIk84zJk+QmCr8mYvoXo2A37pdza0ug==
X-Received: by 2002:a05:600c:350f:b0:3ea:d620:57a7 with SMTP id h15-20020a05600c350f00b003ead62057a7mr19373682wmq.8.1678375206767;
        Thu, 09 Mar 2023 07:20:06 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s10-20020adfea8a000000b002c7e1a39adcsm18314521wrm.23.2023.03.09.07.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 07:20:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/26] systemd: update 252.5 -> 253.1
Date: Thu,  9 Mar 2023 16:19:37 +0100
Message-Id: <20230309151958.3619193-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230309151958.3619193-1-alex@linutronix.de>
References: <20230309151958.3619193-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 15:20:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178230

Add a musl compatibility patch to systemd-boot.

Backport a patch to address systemctl fails on 32 bit targets.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...md-boot_252.5.bb => systemd-boot_253.1.bb} |  0
 meta/recipes-core/systemd/systemd.inc         |  8 ++--
 ...-string.c-define-wchar_t-from-__WCHA.patch | 40 ++++++++++++++++++
 .../systemd/systemd/fix-32bit.patch           | 41 +++++++++++++++++++
 .../{systemd_252.5.bb => systemd_253.1.bb}    |  2 +
 5 files changed, 88 insertions(+), 3 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_252.5.bb => systemd-boot_253.1.bb} (100%)
 create mode 100644 meta/recipes-core/systemd/systemd/0004-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch
 create mode 100644 meta/recipes-core/systemd/systemd/fix-32bit.patch
 rename meta/recipes-core/systemd/{systemd_252.5.bb => systemd_253.1.bb} (99%)

diff --git a/meta/recipes-core/systemd/systemd-boot_252.5.bb b/meta/recipes-core/systemd/systemd-boot_253.1.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_252.5.bb
rename to meta/recipes-core/systemd/systemd-boot_253.1.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index df27e01b1c..354cc46e90 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,9 +14,11 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "61f5710d0bfd8f522af6f8eef399a851509946e2"
-SRCBRANCH = "v252-stable"
+SRCREV = "6c327d74aa0d350482e82a247d7018559699798d"
+SRCBRANCH = "v253-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
-"
+           file://0004-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch \
+           file://fix-32bit.patch \
+           "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/systemd/systemd/0004-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch b/meta/recipes-core/systemd/systemd/0004-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch
new file mode 100644
index 0000000000..927f914848
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0004-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch
@@ -0,0 +1,40 @@
+From a4ff7772acf1d983921833aa20ccd7c4d5e59a1c Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 6 Mar 2023 15:24:49 +0100
+Subject: [PATCH] src/boot/efi/efi-string.c: define wchar_t from __WCHAR_TYPE__
+
+systemd-boot relies on wchar_t being 16 bit, and breaks at build time otherwise.
+
+To set wchar_t to 16 bit it is passing -fshort-wchar to gcc; this has the
+desired effect on glibc (which sets wchar_t from __WCHAR_TYPE__) but not on
+musl (which hardcodes it to 32 bit).
+
+This patch ensures wchar_t is set from the compiler flags on all systems; note
+that systemd-boot is not actually using functions from musl or other libc, just their headers.
+
+Meanwhile upstream has refactored the code to not rely on libc headers at all;
+however this will not be backported to v253 and we need a different fix.
+
+Upstream-Status: Inappropriate [fixed differently in trunk according to https://github.com/systemd/systemd/pull/26689]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/boot/efi/efi-string.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/boot/efi/efi-string.c b/src/boot/efi/efi-string.c
+index 22923d60f6..22a8d1ef71 100644
+--- a/src/boot/efi/efi-string.c
++++ b/src/boot/efi/efi-string.c
+@@ -2,7 +2,12 @@
+ 
+ #include <stdbool.h>
+ #include <stdint.h>
++
++#if SD_BOOT
++typedef __WCHAR_TYPE__ wchar_t;
++#else
+ #include <wchar.h>
++#endif
+ 
+ #include "efi-string.h"
+ 
diff --git a/meta/recipes-core/systemd/systemd/fix-32bit.patch b/meta/recipes-core/systemd/systemd/fix-32bit.patch
new file mode 100644
index 0000000000..6b614625c8
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/fix-32bit.patch
@@ -0,0 +1,41 @@
+From c63bfd0884cf20e48befbee49d41f667660a8802 Mon Sep 17 00:00:00 2001
+From: Frantisek Sumsal <frantisek@sumsal.cz>
+Date: Fri, 3 Mar 2023 12:17:27 +0100
+Subject: [PATCH] systemctl: explicitly cast the constants to uint64_t
+
+Otherwise under certain conditions `va_arg()` might get garbage instead
+of the expected value, i.e.:
+
+$ sudo build-o0/systemctl disable asdfasfaf
+sd_bus_message_appendv: Got uint64_t: 0
+Failed to disable unit: Unit file asdfasfaf.service does not exist.
+
+$ sudo build-o1/systemctl disable asdfasfaf
+sd_bus_message_appendv: Got uint64_t: 7954875719681572864
+Failed to disable unit: Invalid argument
+
+(reproduced on an armv7hl machine)
+
+Resolves: #26568
+Follow-up to: bf1bea43f15
+Related issue: https://github.com/systemd/systemd/pull/14470#discussion_r362893735
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/c63bfd0884cf20e48befbee49d41f667660a8802]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/systemctl/systemctl-enable.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/systemctl/systemctl-enable.c b/src/systemctl/systemctl-enable.c
+index 4ebe5888ac69..a9c6f3a742c9 100644
+--- a/src/systemctl/systemctl-enable.c
++++ b/src/systemctl/systemctl-enable.c
+@@ -211,7 +211,7 @@ int verb_enable(int argc, char *argv[], void *userdata) {
+ 
+                 if (send_runtime) {
+                         if (streq(method, "DisableUnitFilesWithFlagsAndInstallInfo"))
+-                                r = sd_bus_message_append(m, "t", arg_runtime ? UNIT_FILE_RUNTIME : 0);
++                                r = sd_bus_message_append(m, "t", arg_runtime ? (uint64_t) UNIT_FILE_RUNTIME : UINT64_C(0));
+                         else
+                                 r = sd_bus_message_append(m, "b", arg_runtime);
+                         if (r < 0)
diff --git a/meta/recipes-core/systemd/systemd_252.5.bb b/meta/recipes-core/systemd/systemd_253.1.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_252.5.bb
rename to meta/recipes-core/systemd/systemd_253.1.bb
index 8b92b2cf42..40a8226b2b 100644
--- a/meta/recipes-core/systemd/systemd_252.5.bb
+++ b/meta/recipes-core/systemd/systemd_253.1.bb
@@ -57,6 +57,7 @@ PAM_PLUGINS = " \
     pam-plugin-unix \
     pam-plugin-loginuid \
     pam-plugin-keyinit \
+    pam-plugin-namespace \
 "
 
 PACKAGECONFIG ??= " \
@@ -715,6 +716,7 @@ FILES:udev += "${base_sbindir}/udevd \
                ${rootlibexecdir}/udev/rules.d/60-drm.rules \
                ${rootlibexecdir}/udev/rules.d/60-evdev.rules \
                ${rootlibexecdir}/udev/rules.d/60-fido-id.rules \
+               ${rootlibexecdir}/udev/rules.d/60-infiniband.rules \
                ${rootlibexecdir}/udev/rules.d/60-input-id.rules \
                ${rootlibexecdir}/udev/rules.d/60-persistent-alsa.rules \
                ${rootlibexecdir}/udev/rules.d/60-persistent-input.rules \
-- 
2.30.2


