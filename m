Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64882F3C260
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 13:31:07 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14207.1773063066555844173
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 06:31:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=YpaMF66a;
 spf=pass (domain: mvista.com, ip: 209.85.216.45, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3597df496f6so5005914a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 06:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1773063065; x=1773667865; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QHtQ4t5OQd7izsxP3kfVVdk5TMmZJSnfe71Eho3n3Xc=;
        b=YpaMF66ay8BNzF1fiPr4GKz7X13AEhvUvo8aukjpy6FIqjiIIeeAe+VoLoyYhQ4HLF
         UREvp7CMpvQRFi4l683woXsNOsPoQRgC6Finzr3vOep3COndWVUxtV0e/GUIqEb5cEhC
         ms4NQmm6eFDHep38Q06plrI9Q28+chFuZ9hRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773063065; x=1773667865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QHtQ4t5OQd7izsxP3kfVVdk5TMmZJSnfe71Eho3n3Xc=;
        b=sOmgJuEef+FpBC52N9I2EtC47fHj2WDZY404gqI2VrU2rLuXEZCY8XshnQrQJrZD04
         dAxOZh2b+cXeeW8vAWMXhKoE8X5njx2pBCnKdLSERO40Zxq1lmel4uld8qzceLDkm4tG
         eXUUr/GSgWYg8dTRSiYtQk63cgyGRbxVC6+jNwpJFrJvvmYSsE6pda7L49kyA13GOQwy
         FxT5IJHhQO99Dg9FjvKW9EAw16lzRo4G331r5OpqD4P7Wwj+zsSZm+y+cS8eZLz53H4r
         lIzSWf/9wB4/hkctfSrtIec9PYspoGpZutppSoVqPbG65nzAUVAizgX0+JZjp068nTQY
         aw/w==
X-Gm-Message-State: AOJu0Yzej0KGvlUWZ38PD9fPu1Nc1QCep7unLXHV1UZEcTGK/L+E/kqu
	8OvY284Uz+Iz9k+2A3VoYEzVsKnQW6YRPYPZ4vyXwhBdg0abVTLkLFhOE5E1WpyfuxZQDY3v/f9
	8hBVK
X-Gm-Gg: ATEYQzwUvJcAsk8AZrHqa3K9vuwegqWaGHDE5ZJf+2nxSGJznun5LgDWAEliLYB6hv9
	scV9QYe9w7qnzIka+UGvHTqyCk6mMlcB9KtrMkSex5x8d7EPtsFGPgqy7PJTd64j8wagsBEnio1
	oSW9oojT+FFfX2CftQY/vKX6uWbSGmvbyy2SDyH//KpHqZvtxaqzT7OYnVVZLaRSaPjubkO+P64
	XcU1gTAExcPWXSfJnQg4XSq3ZtwBgQhZmH4ttzLsh0nuCT5WcwUY42qxBliTcwHqTWZVUHR2gyi
	zCAzFJfwZqyTHk8/Qhg2/8YTMuNkna1C/jc2Tmwz/THwpJelLxcEoepAwfs1ig0F/QXTWose90c
	n+zjjeKHmOXgTy5us9zWZBZkIcBQp/TnuT330fEykIP/gGAIRNSkso2yw4tKesG8Cy6sVTifLMS
	YUn74M2rlL94v70Ps/ZQqMELS+
X-Received: by 2002:a17:90b:2e0c:b0:33b:a906:e40 with SMTP id 98e67ed59e1d1-359be21d409mr9968697a91.2.1773063065346;
        Mon, 09 Mar 2026 06:31:05 -0700 (PDT)
Received: from MVIN00352.. ([2406:7400:54:1b6c:f501:3067:34d0:f6d6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359bc9bd61fsm5872588a91.3.2026.03.09.06.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 06:31:04 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch] freetype: Fix CVE-2026-23865
Date: Mon,  9 Mar 2026 19:00:55 +0530
Message-ID: <20260309133055.2209039-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 13:31:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232717

Reference: https://nvd.nist.gov/vuln/detail/CVE-2026-23865
           https://security-tracker.debian.org/tracker/CVE-2026-23865

Picked patch mentioned in NVD

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../freetype/freetype/CVE-2026-23865.patch    | 54 +++++++++++++++++++
 .../freetype/freetype_2.13.2.bb               |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2026-23865.patch

diff --git a/meta/recipes-graphics/freetype/freetype/CVE-2026-23865.patch b/meta/recipes-graphics/freetype/freetype/CVE-2026-23865.patch
new file mode 100644
index 0000000000..aa0d4326f8
--- /dev/null
+++ b/meta/recipes-graphics/freetype/freetype/CVE-2026-23865.patch
@@ -0,0 +1,54 @@
+From fc85a255849229c024c8e65f536fe1875d84841c Mon Sep 17 00:00:00 2001
+From: Werner Lemberg <wl@gnu.org>
+Date: Sat, 3 Jan 2026 08:07:57 +0100
+Subject: [PATCH] [ttgxvar] Check for overflow in array size computation.
+
+Problem reported and analyzed by povcfe <povcfe2sec@gmail.com>.
+
+Fixes issue #1382.
+
+* src/truetype/ttgxvar.c (tt_var_load_item_variation_store): Do it.
+
+Upstream-Status: Backport [https://gitlab.com/freetype/freetype/-/commit/fc85a255849229c024c8e65f536fe1875d84841c]
+CVE: CVE-2026-23865
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/truetype/ttgxvar.c | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/src/truetype/ttgxvar.c b/src/truetype/ttgxvar.c
+index 2ff40c9e8..96ddc04c8 100644
+--- a/src/truetype/ttgxvar.c
++++ b/src/truetype/ttgxvar.c
+@@ -628,6 +628,7 @@
+       FT_UShort  word_delta_count;
+       FT_UInt    region_idx_count;
+       FT_UInt    per_region_size;
++      FT_UInt    delta_set_size;
+ 
+ 
+       if ( FT_STREAM_SEEK( offset + dataOffsetArray[i] ) )
+@@ -697,7 +698,19 @@
+       if ( long_words )
+         per_region_size *= 2;
+ 
+-      if ( FT_NEW_ARRAY( varData->deltaSet, per_region_size * item_count ) )
++      /* Check for overflow (we actually test whether the     */
++      /* multiplication of two unsigned values wraps around). */
++      delta_set_size = per_region_size * item_count;
++      if ( per_region_size                                &&
++           delta_set_size / per_region_size != item_count )
++      {
++        FT_TRACE2(( "tt_var_load_item_variation_store:"
++                    " bad delta set array size\n" ));
++        error = FT_THROW( Array_Too_Large );
++        goto Exit;
++      }
++
++      if ( FT_NEW_ARRAY( varData->deltaSet, delta_set_size ) )
+         goto Exit;
+       if ( FT_Stream_Read( stream,
+                            varData->deltaSet,
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/freetype/freetype_2.13.2.bb b/meta/recipes-graphics/freetype/freetype_2.13.2.bb
index ce7a615a3c..e053fef3b5 100644
--- a/meta/recipes-graphics/freetype/freetype_2.13.2.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.13.2.bb
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=843b6efc16f6b1652ec97f89d5a516c0 \
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz \
            file://CVE-2025-27363.patch \
+           file://CVE-2026-23865.patch \
 "
 SRC_URI[sha256sum] = "12991c4e55c506dd7f9b765933e62fd2be2e06d421505d7950a132e4f1bb484d"
 
-- 
2.43.0


