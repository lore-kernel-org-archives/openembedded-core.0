Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD1A0F01807
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 07:23:10 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64684.1772781785418913769
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 23:23:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=VoNLe78l;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso96705015e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 23:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772781783; x=1773386583; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+TB31dVuFu9Y6y5KipvqBu2vvDXlxF4PNaaTwtjySzM=;
        b=VoNLe78lO7eqg4UcOfZUY1c4PwIHJoL5PJy+2mKd3WeyNSjDVaqA2Hwceu4SJtLysL
         ZdD7HwzAIxFHUnozaWYtaCHYbwPZqdOO3Y736E0R1i4PicFZj0GVlLEihtjHJ7fNhtxe
         vNpzyFxZQccI4GuvhET4+JBvWcYl9NINYbm/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772781783; x=1773386583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+TB31dVuFu9Y6y5KipvqBu2vvDXlxF4PNaaTwtjySzM=;
        b=LFnND2jOU6D8F99xwtLYxXFkJKsVBNEQ505hbH+lWjpoNP8KHSsKHtYTEI71VMZrwi
         RwQsWUZF4zE1YhWn8C9E5mddjFhLsJe6rY6TKl+GcZAa5dZuialN9YMRp6bL26Zo67TO
         p7mejUFcwLS7abEK449GFvIgZMSCZV0lh8ivClIB8mOxRTTxpoL6ow0YKXP2xITyTB8z
         7EsGK7hYNLhjHeDtd8b0OAQP7S0R8APM1RPKtIV6OrVSu8o3JyyAxue3ytL+9hMgo44N
         8xoVAhT8tQGeGbjlEn2+ksN0tLoHELgVi6SCwZlfbSeIRJ3fbvExiHfEJm1PUF8/5X8Y
         7KOw==
X-Gm-Message-State: AOJu0Yy3c5qX4UnE8A/7n86tB1w9S3fXH5VzurI4Fwn2JkTfZs1GDmXy
	rPVRApSIFkrJEJlHkmT1QMj1Ikix1rQxQBM66nEOFhDa8dG9ZnaesM1/U9RyT10pfzl0ueVGI9S
	rnsUD
X-Gm-Gg: ATEYQzziXFCec9Lux0BfoabVt2LFvGLGDACDNDxAWtJadBQAmind/znvqPG+bmPmlh+
	T0jeLzzRGj5yhznuSlceoaWSTszrXuFwros1pL0RPIc+bpEyjsnovopaCvdcczG8JQ+3sE9bTcx
	8Lz+O4I4FPufk0DcrOBpcAN4JaeGft/ECnm+nTNUsRMgn8ss9ol82HLAT4PdT51IMiew6Zr+VaB
	y1WrTcqOyIdoWaIEVfX6dzfHssw73HAVyUXMMbnNKn7J7h4ulmelGCjZhVAUlmsQj0qfthZpFyI
	AgvJf5FL2zQyYTjHJyNou8eQF5sIKfXbxcLNgc5WkRYDbO2Zo6LSH26LAG4jGai3w1Rlf/dM1n5
	3WQurutTD/I3UHTB7/997nyBBlEEspH+P7h5MfyVKpNjZ5ImKZJhG98cI5tM9qoocbErXc5H6M8
	P+OI6iymI7fajqEVqZYSfMp1XibKiWZ9LMljMcNUtXBf0/QRSy/sR++gIkxopQIO9N+kGMzRaQR
	bYV+ztQUAatnSl9fi8mDpv2VTCc
X-Received: by 2002:a05:600c:500d:b0:47e:e48b:506d with SMTP id 5b1f17b1804b1-4852695b9f7mr16092365e9.16.1772781783318;
        Thu, 05 Mar 2026 23:23:03 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bdeac353f6fa5aa8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bdea:c353:f6fa:5aa8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485276b09casm23106445e9.11.2026.03.05.23.23.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 23:23:02 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 08/16] harfbuzz: Fix CVE-2026-22693
Date: Fri,  6 Mar 2026 08:22:08 +0100
Message-ID: <e9239a18e80e08c2839bad59d3478d578ba0f813.1772780989.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772780989.git.yoann.congal@smile.fr>
References: <cover.1772780989.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 07:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232546

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Pick patch mentioned in NVD report [1]

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-22693

Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../harfbuzz/files/CVE-2026-22693.patch       | 33 +++++++++++++++++++
 .../harfbuzz/harfbuzz_11.4.5.bb               |  4 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/harfbuzz/files/CVE-2026-22693.patch

diff --git a/meta/recipes-graphics/harfbuzz/files/CVE-2026-22693.patch b/meta/recipes-graphics/harfbuzz/files/CVE-2026-22693.patch
new file mode 100644
index 00000000000..bf821bb63ae
--- /dev/null
+++ b/meta/recipes-graphics/harfbuzz/files/CVE-2026-22693.patch
@@ -0,0 +1,33 @@
+From 21c880d1154a5bcef2ef68c1687d286820a274ee Mon Sep 17 00:00:00 2001
+From: Behdad Esfahbod <behdad@behdad.org>
+Date: Fri, 9 Jan 2026 04:54:42 -0700
+Subject: [PATCH] [cmap] malloc fail test (#5710)
+
+Fixes https://github.com/harfbuzz/harfbuzz/security/advisories/GHSA-xvjr-f2r9-c7ww
+
+Upstream-Status: Backport [https://github.com/harfbuzz/harfbuzz/commit/1265ff8d990284f04d8768f35b0e20ae5f60daae]
+CVE: CVE-2026-22693
+
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ src/hb-ot-cmap-table.hh | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/hb-ot-cmap-table.hh b/src/hb-ot-cmap-table.hh
+index 294b2b60d..95a436b54 100644
+--- a/src/hb-ot-cmap-table.hh
++++ b/src/hb-ot-cmap-table.hh
+@@ -1679,6 +1679,10 @@ struct SubtableUnicodesCache {
+   {
+     SubtableUnicodesCache* cache =
+         (SubtableUnicodesCache*) hb_malloc (sizeof(SubtableUnicodesCache));
++
++    if (unlikely (!cache))
++      return nullptr;
++
+     new (cache) SubtableUnicodesCache (source_table);
+     return cache;
+   }
+-- 
+2.43.0
+
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb
index 9e0e42b7174..2364dd7efdc 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     file://src/hb-ucd.cc;beginline=1;endline=15;md5=29d4dcb6410429195df67efe3382d8bc \
                     "
 
-SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
+SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz \
+           file://CVE-2026-22693.patch \
+           "
 SRC_URI[sha256sum] = "0f052eb4ab01d8bae98ba971c954becb32be57d7250f18af343b1d27892e03fa"
 
 DEPENDS += "glib-2.0-native"

