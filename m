Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C11C64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 02:39:09 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.81731.1677465541427596384
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 18:39:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=CID6Ujuv;
 spf=pass (domain: mvista.com, ip: 209.85.214.175, mailfrom: vkumbhar@mvista.com)
Received: by mail-pl1-f175.google.com with SMTP id bh1so5233506plb.11
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 18:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=11/rWRn6lCMacRzSt0v3gh47uxKisiRWkiX4QmCOOf4=;
        b=CID6UjuvY8Qz8i/rTlK7/CvEaecfAWKNZkUtmDT/anMdGVXsXcfJNoW1Fd5Y/BKz98
         zgZe0a5k61O738T3EuudRiwZ3O6vbafRBWlWId6gUHbb7tp7FlMfQO9HDjyy3GhXTDmu
         EyC/XtwvKXzMcfUu5U3oDfHDTnwTEsXfrNYuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11/rWRn6lCMacRzSt0v3gh47uxKisiRWkiX4QmCOOf4=;
        b=EVt1ntZKAcxXIQPgBzYRqQ/IK8Q+p09/DaVopH/R7FZSqj7Cw6nCBiUyi0XXzE3CcS
         8thnkkMbvgXtOW28ACiHG7AYYZTN2bFB1UCnTjNMP2aMpfT3B73piT9NFT/eOvibKJTb
         3GbXe/WcTNrBS+7/2PV/NsihmbuaPNqyyP1LMhugwzQGe3863Ui8f7KuP3s/UvM2tz/y
         0huq2Wemng5ALrJE1SPU6KbvXa5sclPJgl6IgUBaFzgDQvOx4owN0/BL458jYrXx03qD
         R+tS/GONSchw2skxREU5hpLBRfwhsWVE52vG/AIPAHfbRwZlON4XZZELrjcZZEJ+RHB9
         bY0w==
X-Gm-Message-State: AO0yUKVnTipJqZEAV5pjiBcTS+Z852/bEVrX7tKfE4n9veKQBxjm5TEg
	iWI9zeooeL1y5GNqau067Osbe9NhWVexdr1w
X-Google-Smtp-Source: AK7set9twOaJ8Hmr47swYXy8KdayEDJ1VmBQ7D2Cif+O7ol+xEYTlGRimvm7cBSI4ANYjJALav5p5Q==
X-Received: by 2002:a17:90b:3b87:b0:236:6e4f:bc1e with SMTP id pc7-20020a17090b3b8700b002366e4fbc1emr24523827pjb.49.1677465540385;
        Sun, 26 Feb 2023 18:39:00 -0800 (PST)
Received: from vkumbhar-Latitude-3400.mvista.com ([116.75.163.148])
        by smtp.gmail.com with ESMTPSA id c7-20020a17090ab28700b00233acae2ce6sm4955027pjr.23.2023.02.26.18.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 18:38:59 -0800 (PST)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][kirkstone][PATCH] harfbuzz: fix CVE-2023-25193 allows attackers to trigger O(n^2) growth via consecutive marks
Date: Mon, 27 Feb 2023 08:08:42 +0530
Message-Id: <20230227023842.3226-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 02:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177767

[layout] Limit how far we skip when looking back

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../harfbuzz/harfbuzz/CVE-2023-25193.patch    | 71 +++++++++++++++++++
 .../harfbuzz/harfbuzz_4.0.1.bb                |  4 +-
 2 files changed, 74 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193.patch

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193.patch b/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193.patch
new file mode 100644
index 0000000000..54ceebcf93
--- /dev/null
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193.patch
@@ -0,0 +1,71 @@
+From 85be877925ddbf34f74a1229f3ca1716bb6170dc Mon Sep 17 00:00:00 2001
+From: Behdad Esfahbod <behdad@behdad.org>
+Date: Wed, 1 Feb 2023 20:00:43 -0700
+Subject: [PATCH] [layout] Limit how far we skip when looking back
+
+Upstream-Status: Backport [https://github.com/harfbuzz/harfbuzz/commit/85be877925ddbf34f74a1229f3ca1716bb6170dc]
+CVE: CVE-2023-25193
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ src/hb-ot-layout-common.hh   |  7 +++++++
+ src/hb-ot-layout-gsubgpos.hh | 19 ++++++++++++++++---
+ 2 files changed, 23 insertions(+), 3 deletions(-)
+
+diff --git a/src/hb-ot-layout-common.hh b/src/hb-ot-layout-common.hh
+index 60a1906..f7f8d5f 100644
+--- a/src/hb-ot-layout-common.hh
++++ b/src/hb-ot-layout-common.hh
+@@ -72,6 +72,13 @@
+ #define HB_MAX_LOOKUP_VISIT_COUNT	35000
+ #endif
+ 
++#ifndef HB_MAX_NESTING_LEVEL
++#define HB_MAX_NESTING_LEVEL	6
++#endif
++#ifndef HB_MAX_CONTEXT_LENGTH
++#define HB_MAX_CONTEXT_LENGTH	64
++#endif
++
+ 
+ namespace OT {
+ 
+diff --git a/src/hb-ot-layout-gsubgpos.hh b/src/hb-ot-layout-gsubgpos.hh
+index 65de131..891d96a 100644
+--- a/src/hb-ot-layout-gsubgpos.hh
++++ b/src/hb-ot-layout-gsubgpos.hh
+@@ -525,7 +525,10 @@ struct hb_ot_apply_context_t :
+     bool next (unsigned *unsafe_to = nullptr)
+     {
+       assert (num_items > 0);
+-      while (idx + num_items < end)
++      unsigned stop = end - num_items;
++      if (c->buffer->flags & HB_BUFFER_FLAG_PRODUCE_UNSAFE_TO_CONCAT)
++      	stop = end - 1;
++      while (idx < stop)
+       {
+ 	idx++;
+ 	const hb_glyph_info_t &info = c->buffer->info[idx];
+@@ -557,8 +560,18 @@ struct hb_ot_apply_context_t :
+     }
+     bool prev (unsigned *unsafe_from = nullptr)
+     {
+-      assert (num_items > 0);
+-      while (idx > num_items - 1)
++      assert (num_items > 0);      
++      unsigned stop = 1 - num_items;
++      if (c->buffer->flags & HB_BUFFER_FLAG_PRODUCE_UNSAFE_TO_CONCAT)        
++      	stop = 1 - 1;
++      	
++      /* When looking back, limit how far we search; this function is mostly
++       * used for looking back for base glyphs when attaching marks. If we
++       * don't limit, we can get O(n^2) behavior where n is the number of
++       * consecutive marks. */
++      stop = (unsigned) hb_max ((int) stop, (int) idx - HB_MAX_CONTEXT_LENGTH);
++
++      while (idx > stop)
+       {
+ 	idx--;
+ 	const hb_glyph_info_t &info = c->buffer->out_info[idx];
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
index bdbb322e42..2a2ec714d0 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
@@ -13,7 +13,9 @@ UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz \
            file://CVE-2022-33068.patch \
-           file://0001-Fix-conditional.patch"
+           file://0001-Fix-conditional.patch \
+           file://CVE-2023-25193.patch \
+           "
 SRC_URI[sha256sum] = "98f68777272db6cd7a3d5152bac75083cd52a26176d87bc04c8b3929d33bce49"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection
-- 
2.25.1


