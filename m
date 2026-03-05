Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3BAEEEF33C
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 08:56:01 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39960.1772700953658821408
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 00:55:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Xl4V8pyY;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4836e3288cdso52072765e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 00:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772700952; x=1773305752; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+TB31dVuFu9Y6y5KipvqBu2vvDXlxF4PNaaTwtjySzM=;
        b=Xl4V8pyY+aCXRaLZYXguoG62KH1RxNIDSh3wgHMdHdten29BUW4KRF0yP8oL4TPZBt
         MiVtwfY/R2ZvyROwy4021BI25Lm7PKfd5SIR+MblL+VuROP5TKiZf/lHEg2bQ1vtW0HG
         bl7g1gaKyrd1ImCssK+jjeNm9fFXHcL0LtuZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772700952; x=1773305752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+TB31dVuFu9Y6y5KipvqBu2vvDXlxF4PNaaTwtjySzM=;
        b=egi3onGGItQAHO4/IlsjqXzewkEjRiPfj7pV9A4CnL+0JFOr90IX0kz/CLqG80jzIq
         hHgvhsTGix0NcieTyyFBJ4vhj9rdLrJuVShf+0X++a8/NK/fdzgIaEt8aNhJ+I3ydzrP
         6mlSo9vRI4NpK9osHW/oauojutJgAEebIcXBbKktGPI4B8+MKES7+Hnb0creN5U+4LQf
         KpW3/Sqic/KkWfLFOqVzwKVionFHLMVzpC54lrNpVTjmw8EQbVIkp5Jy6xSIAAEB5M6s
         z6q0yzSBlFlkLHy8DARk53050bY5RjUeldDCrchtFyA9zqwc9LAq1bAWdiKteHUSmMBt
         Lolw==
X-Gm-Message-State: AOJu0Yx25Qy7LFk2kH5WyX36GgqTYVzSwGGLRuG/WLUJkrKEDql95oAf
	Mazce2JE+NOoBExflpz7Ydu5mJyjPT4j8XIjc87nUer+/vdl5SLRNozyEdH6C+USH+qQdDjP+Qn
	KKLUB
X-Gm-Gg: ATEYQzwXwCmbSsZtISW+OpCqyKenEGFJBecn842o4IpUacPEGh2/XUCSQZegkM6DEqP
	1DDCvFA/2osPQJLY6LuEX5lW9F9q4smiLZFKAExhtgUtnf0pD0ZVCbmR0pQCk++ro6wMLXSIETK
	bV49Jm/sPz8guetsfRBKZY6O1effFRj1GbAu2h9s5PE8LW8vt/3NWiYMW1hlsBbMUWVd2kTjbEi
	6hy9ZaD2/WftFwdcrMfIdbpWYEAmurcfoPwZqyP9m4Xa+xoqQq/XPcNF5/sTJc/Lw5DZUBrZlTQ
	vrTBWTiulJhF80I2HddyA2u3bbuSh8HfDUt3JfetnA89FDcy9C8Ko+BGk+I6hjSXnxLM0wzD7nw
	iYK3Ap6iL0Bmluaz2PYxZ7X5tMD19F7v5xg1dZwpQyae1PHZFlkn5GYMb1HX4tFzefeikt7zR+x
	f/EbAHVlXr1c0grIUYMBpm4Xfi+8v7i32ek4LEHTJBZd1p8WvDW53ByhzFekUCw0TQvWI7jpkXl
	toMCCJFPCMkG3wtM5SjxrLIgPZW
X-Received: by 2002:a05:600c:870c:b0:483:a352:b4e4 with SMTP id 5b1f17b1804b1-4851ee81a6amr25234695e9.6.1772700951755;
        Thu, 05 Mar 2026 00:55:51 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00675b4cbd8c1678f5.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:675b:4cbd:8c16:78f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb27a20sm59405175e9.9.2026.03.05.00.55.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 00:55:51 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 08/12] harfbuzz: Fix CVE-2026-22693
Date: Thu,  5 Mar 2026 09:54:57 +0100
Message-ID: <e9239a18e80e08c2839bad59d3478d578ba0f813.1772700454.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772700454.git.yoann.congal@smile.fr>
References: <cover.1772700454.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 08:56:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232460

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

