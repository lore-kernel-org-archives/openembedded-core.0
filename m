Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55659C4167D
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:39 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.11591.1634657678110200133
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jrvjj8ef;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id
 s198-20020a1ca9cf000000b0030d6986ea9fso3647048wme.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/4c0jyH+pkbSHipL3i0HUCYV2P37F5VC2R8k4rTyUsU=;
        b=jrvjj8efMLQTtmopNZfwJU/A5I43fVLFLd4EgV2cuei8QoQfW4NvaepKvxjJjqPF6I
         0ulh8I67nAEFARxTgtSHNtKv9xL72GY7nF03DshkwcekyfvJi/8aofFOrQCXUoSus/KC
         mg8iKO0K3fZl2EVLR4VUutuwmptcOpRxDbmf1NiYN5ZvYY74VdlhloO94mN8icyp7qHN
         gPL0L9sC8Q3tzyysdF7sry5csXLyCenXw7AVnjvpw/ZtFCQQ7OVLwIJ39TOZCVPvvR7v
         DgeDJp57tKIbtck91Y3sYN6gQx9oE1A+LY2ln0DaQjzI6ahtUpsJopYn4fWg0RfIuMP/
         zLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/4c0jyH+pkbSHipL3i0HUCYV2P37F5VC2R8k4rTyUsU=;
        b=7H9bkxLHOmmxTbt0P17Na6ilQM2yek4PQBeSr1tpi/hrfcxUyw1J0TA7jp26wcACDW
         oNdDbajD06lG06KFxEIutxR+uaZC0x2eYym9mkJnSKY2cEhPQNVbszAebNREauSDB0i7
         e7m69wPyN/1TK6j5tqb0YLAcaqTFAH4nEJcLmP5JOwkVY3jdHzZF9cl1pAZEzO5U85Er
         cluI2wlujdhkSpjfFoV5KaDuPxRtsxplxWFryYvXTV3ftM8NmArkBCic69FtZC3uvN0N
         MDUA4HFNaCFj6HGqAzys6tg5Yd29Nz/meSXHdWYHwpT0QjakxaayTvCwfdcJ/8KRSeHO
         oEkw==
X-Gm-Message-State: AOAM5338mmekV3q8Ko6fgiNH1NPXj1OVSPWqJyhiQ5KmytuGmZ47vE9n
	W3N5DKcFeGdBS/e6bCQeJQKmoqWitos=
X-Google-Smtp-Source: 
 ABdhPJx/mhqPiEU9TFRKXGc8pCFOnv2vEG5Y9GO+sMAZUIFw1EH4LMl5UsrWZ1fVm6aNfIFJ3AVpMQ==
X-Received: by 2002:a7b:c214:: with SMTP id x20mr6644365wmi.103.1634657676762;
        Tue, 19 Oct 2021 08:34:36 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:36 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH 18/65] u-boot: upgrade 2021.07 -> 2021.10
Date: Tue, 19 Oct 2021 17:33:32 +0200
Message-Id: <20211019153419.3319802-18-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157137

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ls-image-host-fix-wrong-return-value.patch | 41 -------------------
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  2 +-
 .../u-boot/u-boot-tools_2021.07.bb            |  4 --
 .../u-boot/u-boot-tools_2021.10.bb            |  2 +
 .../{u-boot_2021.07.bb => u-boot_2021.10.bb}  |  1 +
 5 files changed, 4 insertions(+), 46 deletions(-)
 delete mode 100644 meta/recipes-bsp/u-boot/files/0001-tools-image-host-fix-wrong-return-value.patch
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot-tools_2021.07.bb
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-tools_2021.10.bb
 rename meta/recipes-bsp/u-boot/{u-boot_2021.07.bb => u-boot_2021.10.bb} (99%)

diff --git a/meta/recipes-bsp/u-boot/files/0001-tools-image-host-fix-wrong-return-value.patch b/meta/recipes-bsp/u-boot/files/0001-tools-image-host-fix-wrong-return-value.patch
deleted file mode 100644
index 81687203e4..0000000000
--- a/meta/recipes-bsp/u-boot/files/0001-tools-image-host-fix-wrong-return-value.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 77fe3ad2ab2953ccdf6e9417cbecc060b45d3e55 Mon Sep 17 00:00:00 2001
-From: Ming Liu <liu.ming50@gmail.com>
-Date: Sun, 30 May 2021 10:32:08 +0200
-Subject: [PATCH] tools: image-host: fix wrong return value
-
-The return value '-ENOSPC' of fit_set_timestamp function does not match
-the caller fit_image_write_sig's expection which is '-FDT_ERR_NOSPACE'.
-
-Fix it by not calling fit_set_timestamp, but call fdt_setprop instead.
-
-This fixes a following mkimage error:
-| Can't write signature for 'signature@1' signature node in
-| 'conf@imx6ull-colibri-wifi-eval-v3.dtb' conf node: <unknown error>
-| mkimage Can't add hashes to FIT blob: -1
-
-Upstream-Status: Submitted [ https://patchwork.ozlabs.org/project/uboot/patch/20210531070451.6561-1-liu.ming50@gmail.com ]
-
-Signed-off-by: Ming Liu <liu.ming50@gmail.com>
----
- tools/image-host.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/tools/image-host.c b/tools/image-host.c
-index 270d36fe45..73095461a7 100644
---- a/tools/image-host.c
-+++ b/tools/image-host.c
-@@ -132,8 +132,10 @@ static int fit_image_write_sig(void *fit, int noffset, uint8_t *value,
- 	if (!ret) {
- 		time_t timestamp = imagetool_get_source_date(cmdname,
- 							     time(NULL));
-+		uint32_t t = cpu_to_uimage(timestamp);
- 
--		ret = fit_set_timestamp(fit, noffset, timestamp);
-+		ret = fdt_setprop(fit, noffset, FIT_TIMESTAMP_PROP, &t,
-+			sizeof(uint32_t));
- 	}
- 	if (region_prop && !ret) {
- 		uint32_t strdata[2];
--- 
-2.29.0
-
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 6b9253806f..e41a4b5096 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "840658b093976390e9537724f802281c9c8439f5"
+SRCREV = "d80bb749fab53da72c4a0e09b8c2d2aaa3103c91"
 
 SRC_URI = "git://git.denx.de/u-boot.git \
           "
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2021.07.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2021.07.bb
deleted file mode 100644
index d0c0f30a98..0000000000
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2021.07.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require u-boot-common.inc
-require u-boot-tools.inc
-
-SRC_URI:append = " file://0001-tools-image-host-fix-wrong-return-value.patch"
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2021.10.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2021.10.bb
new file mode 100644
index 0000000000..7eaf721ca8
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2021.10.bb
@@ -0,0 +1,2 @@
+require u-boot-common.inc
+require u-boot-tools.inc
diff --git a/meta/recipes-bsp/u-boot/u-boot_2021.07.bb b/meta/recipes-bsp/u-boot/u-boot_2021.10.bb
similarity index 99%
rename from meta/recipes-bsp/u-boot/u-boot_2021.07.bb
rename to meta/recipes-bsp/u-boot/u-boot_2021.10.bb
index c8dbe477e0..617827ff08 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2021.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2021.10.bb
@@ -4,3 +4,4 @@ require u-boot.inc
 SRC_URI:append = " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch"
 
 DEPENDS += "bc-native dtc-native python3-setuptools-native"
+
-- 
2.20.1


