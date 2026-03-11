Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A8D1125895
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 19:27:45 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4762.1773257261773475824
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 12:27:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MA7aCRj5;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439ce3605ecso203749f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 12:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773257260; x=1773862060; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LHRCaDOwucd9lupN/jIIsg49qUyC0732E4CXQAzYVYM=;
        b=MA7aCRj5QmcKU1odD1f+36DipnEYM7519XXTEiY5Iwy7Na0zCaj/C8oSWxTevJ+1kR
         /qSe2y4qUNudR3NMfZzztp5nJlFNwNJwcpRRJb8OxeoBaqc/QEpIBEsGCI/IUSZWzQ0Q
         5C+RbnvOxh61Cr/0r/X9JMDBN9pwspJlGGOcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257260; x=1773862060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LHRCaDOwucd9lupN/jIIsg49qUyC0732E4CXQAzYVYM=;
        b=tkrE4GYcOUSVcKGULHY+bzvUhN0lUZC5IYxHBPifBDWMJsRtmSKgMWVoZ+G9ydG/QH
         Gg+hOrjYTaRbeQm/9aZfqQ4XXrSdxU5MRTLN171LqqP8wm/6TwMc8TPYC8KJw/EOxGSI
         bjOmaero+oTJGmIUd5P3QaQGjfk7QmboSY1V6G4qkDx1osyIKeOS5G6h0FNLF7fmx2Gf
         5cf31Cgv2bOHl3NA2nRqnrbBdaqUBbrbCDQUIAAN9/OZTZ88Qfu5HCj6s4MnJPtQdee1
         oe7b53FZ4j2hFSwHE5KNHKQSVVQ9t/BtQGKqkIPS4u3cSWoAhDENt6DyUWXHeycg/QkA
         KQPQ==
X-Gm-Message-State: AOJu0YwP0NI2N7A14coU/4h5fiLMhpaAk+1kV+lVMxg6ja/QTrIgVuhl
	D3oCMMSdV7kNzSXTMz18xS7oasquiud3p9gR+nT86RHiK79HuZfipYb73omXQllpAgA71Lv1C3f
	kIGNC
X-Gm-Gg: ATEYQzwctp2KdP5PRXlEfLVf7sFLv+f2N87+cHXjksS7ls+1UdSJSqexch8A5/ueuJR
	HRp74vUWasOwxRa+p2tH1/1ASyBr+ftvVVEoavtvCPwzN99sv+IJLS8XJO8dx/aEwNZbtk6wr0d
	Rrod8Q+2Bjg/Bo6ogJrtXXwNxHkPuGAJnuTNK0rlCRbN960xlR5+4Wd1Zg0cV8Bmf3nC9XkQL7F
	gjTbTnxzf/95fSzNjQx2lNBP23P1ZHPCxckxVXfsNbafrmPkXbXs1PAj/qRFUhHGMTjU5MKwhly
	EH9E6DVBWktLzBibwlzP4hcxiemAyImQS+XVvUxF8Dsju1UlhmCt6qUpL3LJCCQ/X/Mw0xa8xXZ
	eSg1Y62JjBPGxgpcbYaaiXgndmEhM9b0UanuOF14iHbgFjntohXrnqsN/T34XAVXudpODvUHwKu
	JQAwwxnghOpfx7BuhM4Rv+EcyggxFDXqsyXkeUaYoUj6UOvGSAZmyVmiBjJeeMEg2BQck26hsKn
	WiVrhnwSIc5u3bAKLtR+qFY9A4=
X-Received: by 2002:a05:6000:1378:b0:439:fcd5:c9bb with SMTP id ffacd0b85a97d-439fcd5cb9emr2102489f8f.34.1773257259805;
        Wed, 11 Mar 2026 12:27:39 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe22f3a4sm1452450f8f.38.2026.03.11.12.27.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:27:39 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 5/6] freetype: Fix CVE-2026-23865
Date: Wed, 11 Mar 2026 20:27:07 +0100
Message-ID: <f29ef5d8a390e1e971385722a19c62aa3d35ca2e.1773257124.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773257124.git.yoann.congal@smile.fr>
References: <cover.1773257124.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 19:27:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232904

From: Vijay Anusuri <vanusuri@mvista.com>

Reference: https://nvd.nist.gov/vuln/detail/CVE-2026-23865
           https://security-tracker.debian.org/tracker/CVE-2026-23865

Picked patch mentioned in NVD

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../freetype/freetype/CVE-2026-23865.patch    | 54 +++++++++++++++++++
 .../freetype/freetype_2.13.3.bb               |  4 +-
 2 files changed, 57 insertions(+), 1 deletion(-)
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
diff --git a/meta/recipes-graphics/freetype/freetype_2.13.3.bb b/meta/recipes-graphics/freetype/freetype_2.13.3.bb
index dbfffdb65fc..1fda9c57e78 100644
--- a/meta/recipes-graphics/freetype/freetype_2.13.3.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.13.3.bb
@@ -13,7 +13,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=843b6efc16f6b1652ec97f89d5a516c0 \
                     file://docs/GPLv2.TXT;md5=8ef380476f642c20ebf40fecb0add2ec \
                     "
 
-SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz"
+SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz \
+           file://CVE-2026-23865.patch \
+"
 SRC_URI[sha256sum] = "0550350666d427c74daeb85d5ac7bb353acba5f76956395995311a9c6f063289"
 
 UPSTREAM_CHECK_REGEX = "freetype-(?P<pver>\d+(\.\d+)+)"

