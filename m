Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9710D5AE4A
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 09:59:48 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2951.1765619980066315408
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 01:59:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eb3bTz4w;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a087b2a9c0so8928935ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 01:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765619979; x=1766224779; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uRbr4U0ZX8Vnp88OBxXIr5A61trsNsSBbczJAof0NJE=;
        b=eb3bTz4wfSNZHiYYTAK01FkbSotkk0l55Q/LRe9GcGmyhfbngc+rpHf/2M9x0lQ6sF
         X/wxYhlG2a4vpXK6wKzzJNFqgqx7pPlUd9quPLeGM+Tf24Fyj+Hs48epzGCcW00Q5AFR
         7wG6KtbjsX4lNK/MKdPQwaaT3vyx5ffCKpNGBt7Wl4zg8mb5md/4xKWQupHrFAUNvlGO
         xkjAtDoGkTV3G0xBJtACuKk/VorzXrfL020aIeTHhI893cnyaEPRD1wLCeVVz0EX3W7y
         i/diSYadTLyXzUKTpIkCz+iidSlYoJFlRTodEF2cE1FNACEHMdNq1GjxZe1tRJyhNL7Q
         qUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765619979; x=1766224779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRbr4U0ZX8Vnp88OBxXIr5A61trsNsSBbczJAof0NJE=;
        b=hsvDWROD6H+djlhz1hsg7zN/KYNANhnv8RgPmGJxND/dp893vRrlybWCnWvPRMH1ZK
         RYun1Yvf0q4ZNl4be6QC9MB5KBRYooX2UzqNpPa5FDITkuifSDtFtUZ3bLX4nhygnzJD
         YYghH3J9Hy11y37QizFpRq7VRvlSPk4Y4QWbWMz5/9qlQo1T9kT0Y3b9xNmna/TZg9fz
         IGJsf1K/FR8T7WmubqEEHtXLZm76dfl5krtTv9MjglHrwJcWRsueiZNYiHRwAcF79tgs
         TYtK1DHU3ZNyemyxBdGnCjVa0hkjC1jCd9G9LoTWt4tqXgfE4NUb+oHz0Apj+aLxHQRZ
         wb5A==
X-Gm-Message-State: AOJu0YxzbkJxx79IeTuW+xRx19SMNk30OMVrbRclVVbmr7ywySrbKQc1
	cEkhDcdltPjIrggqU4bDNrfsGNAQhuxeJaydrX4E6imO96dmcE18AwzR8zEoKQ==
X-Gm-Gg: AY/fxX6PYKbKzJo4hM0q9di95QyMuh1tyBNR8vhdGxiG2w1OLGcO603c9SbFekXD2tT
	e/4cJ2ZP3KntLUZKNTQkTmHq3TSKrraZ+eWYK6e3ORRmsg1yM3fHwaDvG8m2uSxKrKEbLsWyPLf
	T01RMiaVy+98qr5DNtgwz9yfzkTD4dIcpykLQ76fMbt/yWa/8z4JKJhFr+xaPonNtTU1U6ocwli
	weGKhDITWRCT3gVmOqa7eWRqdK/jjZ4R7luQXzAhVv/WikgcFW8WNDsqbjBFWieZvNMf5bblbQr
	kgPra5ro2borbp0f9RjcQpuz0YKz5BmsD65E0hK7cwCzP7AD9L2+h1vhF0ywk9sbZYuW6MRvcfe
	rFOfYV4S017+0LX1zQWWa6xJlma1duu30YfJ1KYBHJ7mB/HOQVwa9cM2FdzhRZ8iR9B1u3WP6NV
	EdFc29ZSsf6HyZUGd+Qv/FY/95
X-Google-Smtp-Source: AGHT+IFkye+v8OhXBcmWuHedJb7cN/nubmNn2hAVfRG0vRajrKp45Ol0kSnjUIz3iYzRPcxEhEdt/A==
X-Received: by 2002:a17:903:110e:b0:295:98a1:7ddb with SMTP id d9443c01a7336-29f244d4d15mr43032035ad.61.1765619978962;
        Sat, 13 Dec 2025 01:59:38 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.01.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 01:59:38 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 01/67] bluez5: upgrade 5.84 -> 5.85
Date: Sat, 13 Dec 2025 15:28:25 +0530
Message-ID: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 09:59:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227619

From: Guðni Már Gilbert <gudni.m.g@gmail.com>

Changelog:
- Fix issue with handling display of battery charge level.
- Fix issue with BASS permissions not requiring encryption.
- Fix issue with handling abort for OBEX SRM operation.
- Fix issue with handling device privacy.
- Add support for HFP call answer support.
- Add support for HFP simple 3-way call support.

Full changelog:
https://github.com/bluez/bluez/compare/5.84...5.85

----
Other notes:
- A new testing tool is added called 6lowpan-tester
- A patch is removed since it is included in the 5.85 release

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 83812b010cf9c8bd022ad9702be2285de21ac67e)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 -
 ...-fix-pac_config_cb-error-code-return.patch | 29 -------------------
 .../bluez5/{bluez5_5.84.bb => bluez5_5.85.bb} |  3 +-
 3 files changed, 2 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-media-fix-pac_config_cb-error-code-return.patch
 rename meta/recipes-connectivity/bluez5/{bluez5_5.84.bb => bluez5_5.85.bb} (93%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index aac38a54a9..24a41f92df 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -64,7 +64,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://init \
            file://run-ptest \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
-           file://0001-media-fix-pac_config_cb-error-code-return.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-media-fix-pac_config_cb-error-code-return.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-media-fix-pac_config_cb-error-code-return.patch
deleted file mode 100644
index a67fd07137..0000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-media-fix-pac_config_cb-error-code-return.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From d7966dbb7bcf39f9615c906c47ef7ad895796756 Mon Sep 17 00:00:00 2001
-From: Pauli Virtanen <pav@iki.fi>
-Date: Thu, 18 Sep 2025 20:19:35 +0300
-Subject: [PATCH] media: fix pac_config_cb() error code return
-
-Fixes: a887b1a1b91f ("audio: Add support for specific error codes for A2DP configuration")
-
-Upstream-Status: Backport [https://github.com/bluez/bluez/commit/6b0a08776ae44a9102d7c6875a77e83dc6a11a37]
-Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
----
- profiles/audio/media.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/profiles/audio/media.c b/profiles/audio/media.c
-index 332f643bb..deb321e6c 100644
---- a/profiles/audio/media.c
-+++ b/profiles/audio/media.c
-@@ -1110,7 +1110,7 @@ static void pac_config_cb(struct media_endpoint *endpoint, void *ret, int size,
- 	if (!transport)
- 		return;
- 
--	data->cb(data->stream, error_code == 0 ? 0 : -EINVAL);
-+	data->cb(data->stream, (error_code && *error_code == 0) ? 0 : -EINVAL);
- }
- 
- static struct media_transport *pac_ucast_config(struct bt_bap_stream *stream,
--- 
-2.43.0
-
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.84.bb b/meta/recipes-connectivity/bluez5/bluez5_5.85.bb
similarity index 93%
rename from meta/recipes-connectivity/bluez5/bluez5_5.84.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.85.bb
index 874db9df64..d8965fef4b 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.84.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.85.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
 
-SRC_URI[sha256sum] = "5ba73d030f7b00087d67800b0e321601aec0f892827c72e5a2c8390d8c886b11"
+SRC_URI[sha256sum] = "ad028e49254bc4551a13f08fe7904c63d02ba650d77be8ae15bb3b0a0ad94a6f"
 
 CVE_STATUS[CVE-2020-24490] = "cpe-incorrect: This issue has kernel fixes rather than bluez fixes"
 
@@ -35,6 +35,7 @@ NOINST_TOOLS_TESTING ?= " \
     tools/iso-tester \
     tools/mesh-tester \
     tools/ioctl-tester \
+    tools/6lowpan-tester \
 "
 
 # noinst programs in Makefile.tools that are conditional on TOOLS

