Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 999001093164
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 00:28:38 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2628.1773966514016272569
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 17:28:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=aSMqAhfx;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-486fd27754bso6837705e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 17:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773966512; x=1774571312; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DoA9lxObqe1I888ocaQy48TVD+WYT5DaZqo8Gz8zcnM=;
        b=aSMqAhfxe9D3PBhf5sHEQSX7pLbqvG15Sqs16ppc+l9ltZ+MzZTiOwkQ+C0osuSXPb
         GmmMtCR9qg27Q263YodpPjTQJpfw2+J9Kbh07k54te/4iW4GLlvVsUPLPzq3nwXelSRb
         MZvDCQ4qeaKkpYo5BcORmdEBMgVfRvJHMIySM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773966512; x=1774571312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DoA9lxObqe1I888ocaQy48TVD+WYT5DaZqo8Gz8zcnM=;
        b=S6DUC7k3RKHmw8LY+SxsWPS5REK6rzdHsts9F6gZOy4Os3Kdo/P2f3vrJw8NsSpc1R
         w7+8IcM8yz0UZg+801uCIfQ4uLKutM1pp859Ps3ebhVgoH3lxD2JCTfdv5ykWfl6EqN5
         Eu45i8pitO+UxjZWH4GQ7vYFjdgVKxF9AIF+uhnE6itUIAXjqnhepz7iRZRKsqTZJLp5
         L2NeND3wCyD+nbzpMC+PMVoGZgMHNMXnGoX2IEe0zZ4uder0DedPO7/MqGCasptES2JP
         sYtyj2urwXbXE+3WOeanQ657c/+4jViVWXIS7js1KR2UxJ07KM3IyXQqgCHOoCmzap/G
         NlkQ==
X-Gm-Message-State: AOJu0Yw0U1SGe2uV9SbjlNh8W18szN4xsNTDrMN7RkAtUDoOVfpEpIMx
	puSBTU6++BSRwl7PF5VqZmbKvmIGYuqXlNt8i577FLMJ5cDUiA7uxo0+ny7Dv/AxVQQrdOBHAL2
	j12oc
X-Gm-Gg: ATEYQzyCaPSl2nFuxOgXP/f5CZRDgRCwpZPbXZ8zFQ3JAYOpyHaWjRREo10zUKrtETn
	IHrkU4qLROhl6S4S21KYmSWwWEonbr1ZOwfp8nZBKOkiUPz8FzlIMVdRrLatpQxEVfebD99TUav
	X93JqR2F99/yaNUsvbROARs9iXEwlDk4ZOEqfO+opWGepkhmsSRpTYCvixKnadGc82w7bmAWeRB
	eYdC7FPlfXcp98VznRlg+LH5J47dHPhaVOtGfd8awri7LjnHPp+9RfOJPE1Jt51PK0TxuNK0cSn
	8jOhw3+uBowe3g3mL7tlhbxeR9cZ35pzD+3HDovb+4XZMM/1WKFEJs00AsRRTj91W5CRbrotwvu
	+ZxOuC/TitUsipqHpmNSLl27/NVHQor8nmEOgYo2kgVH/m28zZ768+EciTDw3mKEDAUtbW8BhFX
	zQhmOQC7cvHfEEA4bWZQ/bPY+5U/uYETKwPtRXF7lhGFArX1CMWMNkt+lLZbadPZAK0tG6lai26
	VbERvcvzrL7N+qAvlTkDsYEL0g=
X-Received: by 2002:a05:600c:83c8:b0:477:5c58:3d42 with SMTP id 5b1f17b1804b1-486fedbd0a5mr13301515e9.10.1773966512046;
        Thu, 19 Mar 2026 17:28:32 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe8359acsm23850655e9.12.2026.03.19.17.28.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 17:28:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/15] freetype: Fix CVE-2026-23865
Date: Fri, 20 Mar 2026 01:28:15 +0100
Message-ID: <6a33eff7114af1fb3b994f0795f99eebd078d24a.1773966414.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773966414.git.yoann.congal@smile.fr>
References: <cover.1773966414.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 00:28:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233569

From: Vijay Anusuri <vanusuri@mvista.com>

Reference: https://nvd.nist.gov/vuln/detail/CVE-2026-23865
           https://security-tracker.debian.org/tracker/CVE-2026-23865

Picked patch mentioned in NVD

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../freetype/freetype/CVE-2026-23865.patch    | 54 +++++++++++++++++++
 .../freetype/freetype_2.13.2.bb               |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2026-23865.patch

diff --git a/meta/recipes-graphics/freetype/freetype/CVE-2026-23865.patch b/meta/recipes-graphics/freetype/freetype/CVE-2026-23865.patch
new file mode 100644
index 00000000000..aa0d4326f83
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
index ce7a615a3c8..e053fef3b51 100644
--- a/meta/recipes-graphics/freetype/freetype_2.13.2.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.13.2.bb
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=843b6efc16f6b1652ec97f89d5a516c0 \
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz \
            file://CVE-2025-27363.patch \
+           file://CVE-2026-23865.patch \
 "
 SRC_URI[sha256sum] = "12991c4e55c506dd7f9b765933e62fd2be2e06d421505d7950a132e4f1bb484d"
 

