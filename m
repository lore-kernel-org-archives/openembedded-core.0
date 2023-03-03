Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 422C0C64EC4
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 16:17:37 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.27598.1677860256132335378
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 08:17:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=K1DdfSOn;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id n6so3189649plf.5
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 08:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1677860255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JrXOFZ3UyPMxvUsPtGIlWJTpLK0dN0uMg9pacr3V9GE=;
        b=K1DdfSOnMtMIiC6qtts4lghx7Z6/QApHUISjPraKzMhBczkk6rrkcjiWHs7vHIILZA
         EzV/pz+YvXHMw8g8ny1UdEZk3Ye8t6UCDchGiwZ70fRQLBmemV4XJGSFmnXO8TBe3oCm
         iFN1N+KsOvsvlItFzlfqusoZH6qhLEPgtHc0UqbdYP5cHviT5zR1U5sJdTKlFgHCtJq3
         6i+xWCVyHkxz+Np8a1mO1D+BF/lTHpis0x9pshGsIZH5fFlRvY+T8Qidl6kZPEhPDxrj
         HcnRK6cEywIk/fCAi4jm61+UYiRAM7mwnhDrcpG3cVS+8FEk4/DCxNzUAWw1VKPInoHQ
         BkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677860255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JrXOFZ3UyPMxvUsPtGIlWJTpLK0dN0uMg9pacr3V9GE=;
        b=3VeXk3B6gzhhKFKfKTnJMhtwpuoLHa0BqC8svN6CcY/bzDMFxb8pQ3507bCcMWS5WH
         My9mG1fa6mB2qi78L88Pyy3mXR3wcuxf+hyqz8iK/77i6DhKYdz85g+YQHVprp+ho3Ki
         lGj3+A3VvPWRjqAEGDBmn6jUCYvT0Ebwl7XerHSsKNA2YOvnpGswUX73+cCk47khHvXd
         J8cXIOXYNthw2lRvICV02OqgTUte0EzkSvDotIJwb9WoN37H7An3ucCsLZJcV2L7mZda
         cEwGWKHz7h0T2p0+sblIHPEim6DAvzQHGRbcSizGW4mcR/V0qa+LcgiVw3zwYJayZoeG
         RxaA==
X-Gm-Message-State: AO0yUKV5gagtwsbvjNlkysf1NTgvWmbIaVh3hW61tKS78NCWYG4UT/xg
	n/byBXPn1aBetJPp68keVuX5kd2apIDzg3JhngQ=
X-Google-Smtp-Source: AK7set/is8PF0QtqJtPYOx9KoPKXTheYUv1f3wE0mAPzl/r/d9Nd3nnlUjT0a01Hzk9cyBd+dCUUwA==
X-Received: by 2002:a17:902:e801:b0:19a:b4a9:9df7 with SMTP id u1-20020a170902e80100b0019ab4a99df7mr2604627plg.53.1677860255005;
        Fri, 03 Mar 2023 08:17:35 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ko4-20020a17090307c400b00186b7443082sm1702474plb.195.2023.03.03.08.17.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 08:17:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/29] harfbuzz: fix CVE-2023-25193 allows attackers to trigger O(n^2) growth via consecutive marks
Date: Fri,  3 Mar 2023 06:17:00 -1000
Message-Id: <9bc6342a9e02e14806903fdb589bf5a854093639.1677859897.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677859897.git.steve@sakoman.com>
References: <cover.1677859897.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 16:17:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177991

From: Vivek Kumbhar <vkumbhar@mvista.com>

[layout] Limit how far we skip when looking back

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


