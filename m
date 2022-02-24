Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D03C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 06:30:42 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web08.7260.1645684241176371553
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 22:30:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=RQEpFNx0;
 spf=pass (domain: intel.com, ip: 192.55.52.43,
 mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645684241; x=1677220241;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qwcBBowQ72Wot5OFhDbtLEAPVBbnIpp4w/Guca+BIE0=;
  b=RQEpFNx0XLiNIh+P6PLNpd5mfa8cq/xo9MkZnpoiYmv/xc9W+6zk4TZF
   5ks/KQ8Ddebrdvte+ONQL5BqMXjTGvM0yUqSg/7hny870RaZbHMB2S6Pr
   EzqYOUvCkM7Qdsy5aCVlfkYVYjwR8+tBap9/hjXLXZAncgibd/XPeZzBM
   KAoqB6pMo2d8141sLEgMt/6f/5d83gWxLCnt51yXC0fstVmAwcpo6izek
   /5q5POjDdmDzzZ6Cq84NAhbT4aIHdFq6IfGEzuCffhD5kKiiOxneIpC9M
   mvV5pyUifKu30RI7GkDY4/HEjmsCQhpX1nxDY3N5iEsTBJpIuuG4I1mzT
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="338600474"
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600";
   d="scan'208";a="338600474"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 22:30:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600";
   d="scan'208";a="574101888"
Received: from cheeyang-desk1.png.intel.com ([10.158.87.104])
  by orsmga001.jf.intel.com with ESMTP; 23 Feb 2022 22:30:39 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][honister 1/4] harfbuzz: upgrade 2.9.0 -> 2.9.1
Date: Thu, 24 Feb 2022 14:28:53 +0800
Message-Id: <20220224062856.2249762-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 06:30:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162298

From: wangmy <wangmy@fujitsu.com>

Final subset API is in place and if no issues are discovered,
it will be the stable subset API of HarfBuzz 3.0.0.
Old API is kept to ease transition, but will be removed in 3.0.0.
Various fuzzer-found bug fixes.
hb_buffer_append() now handles the pre- and post-context which
previously were left unchanged in the destination buffer.
hb-view / hb-shape now accept following new arguments:
--unicodes-before/after: takes a list of hex numbers that represent Unicode
codepoints.
Undeprecated API:
hb_set_invert()

(From OE-Core rev: 0a9d19f575fda7db2f768f77701a137da8f73a97)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../harfbuzz/{harfbuzz_2.9.0.bb => harfbuzz_2.9.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_2.9.0.bb => harfbuzz_2.9.1.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_2.9.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_2.9.1.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_2.9.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_2.9.1.bb
index bc91a8c03c..694553beef 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_2.9.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_2.9.1.bb
@@ -12,7 +12,7 @@ UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "3e1c2e1d2c65d56364fd16d1c41a06b2a35795496f78dfff635c2b7414b54c5a"
+SRC_URI[sha256sum] = "0edcc980f526a338452180e701d6aba6323aef457b6686976a7d17ccbddc51cf"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection
 
-- 
2.25.1


