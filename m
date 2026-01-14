Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1DB2D30CF6
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 01:19:10 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.847.1768353549285160932
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 17:19:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ifZq1OLv;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768353549; x=1799889549;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0wQU1Iy10ObNYEw9izuMtc6Cy5hU1O+wPhtKzSHIxgQ=;
  b=ifZq1OLv/hd07Gy8JQLAIjuXbq7D7h22ubpWarsLNCnOMAGH8XPGeQmc
   ilq+wMhLV4am67Q2PM1x2VsemHLU/U6Ba5h4KqVKMRVJEXLVcZgEcYR7U
   SokdI00obBV4YaHCOPJzdZvd4qb6XmgAgpVM8SIcsURT5TKM6VDne+/IZ
   8FkNoU49A22JH/ihVVt/jfVayxTeN9f+1bVelhkW8MlDCsfgk+5d37HBD
   lAMF4+oNA3cFH7qvkrTDCIJBMVs16nUZxN73HBHCNfp4Cqd/vTMTFST4z
   qZ8KploPIhFE9/mOLZLsP1wnLEuB9bJ0IGEsYFML68CUi4KpTUF5Re0Um
   w==;
X-CSE-ConnectionGUID: oTFqM/CcTL2bGvAmCrK34g==
X-CSE-MsgGUID: gZ6rhL9qRR6vU6bi0OuTFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="225095394"
X-IronPort-AV: E=Sophos;i="6.21,224,1763391600"; 
   d="scan'208";a="225095394"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 10:19:07 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 88AB11000345
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 01:19:07 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 3CC191003BE8
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 01:19:07 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id E5D8F1801C7D
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 01:19:04 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] orc: upgrade 0.4.41 -> 0.4.42
Date: Wed, 14 Jan 2026 09:19:00 +0800
Message-ID: <20260114011902.10064-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 01:19:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229300

1.Changelog
 - Initial 64-bit RISC-V support (Maksymilian Knust, Filip Wasil)
 - Add 64-bit LoongArch support (Jin Bo, Hecai Yuan)
 - Implement release and reuse of temporary registers for some targets (Jorge Zapata)
 - x86: Implement EVEX encoding and an opcode validation system (Jorge Zapata)
 - x86: Opcode refactor, improved constant handling and various other fixes (Jorge Zapata)
 - x86: add missing rounding operands for AVX and SSE (L. E. Segovia)
 - x86: Implement 64-bit single move constant load (L. E. Segovia)
 - includes: stop exporting the private compiler and OrcTarget definitions (Jorge Zapata)
 - Use hotdoc instead of gtk-doc to generate the documentation (Jorge Zapata)
 - ORC_DEBUG_FATAL environment variable allows abort on log messages of a certain level (Carlos Falgueras García)
 - Error message improvements and NEON backend clean-ups (Alexander Slobodeniuk)
 - Fix a few valgrind issues (Doug Nazar)
 - Build: enable tools such as orcc and orc-bugreport by default (Nirbheek Chauhan)
 - Various build fixes (L. E. Segovia, Sebastian Dröge)

2.Documentation are no longer built with gtk_doc,it was replaced by hotdoc.
 https://gitlab.freedesktop.org/gstreamer/orc/-/commit/0ad1f5884c654b614cf1ddd114a7ec9140311a3a

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../recipes-devtools/orc/{orc_0.4.41.bb => orc_0.4.42.bb} | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/orc/{orc_0.4.41.bb => orc_0.4.42.bb} (81%)

diff --git a/meta/recipes-devtools/orc/orc_0.4.41.bb b/meta/recipes-devtools/orc/orc_0.4.42.bb
similarity index 81%
rename from meta/recipes-devtools/orc/orc_0.4.41.bb
rename to meta/recipes-devtools/orc/orc_0.4.42.bb
index 60677577b0..f56b9058c2 100644
--- a/meta/recipes-devtools/orc/orc_0.4.41.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.42.bb
@@ -5,17 +5,13 @@ LICENSE = "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
-SRC_URI[sha256sum] = "cb1bfd4f655289cd39bc04642d597be9de5427623f0861c1fc19c08d98467fa2"
+SRC_URI[sha256sum] = "7ec912ab59af3cc97874c456a56a8ae1eec520c385ec447e8a102b2bd122c90c"
 
-inherit meson pkgconfig gtk-doc
+inherit meson pkgconfig
 
 # distinguish from apache:orc
 CVE_PRODUCT = "gstreamer:orc"
 
-GTKDOC_MESON_OPTION = "gtk_doc"
-GTKDOC_MESON_ENABLE_FLAG = "enabled"
-GTKDOC_MESON_DISABLE_FLAG = "disabled"
-
 BBCLASSEXTEND = "native nativesdk"
 
 PACKAGES =+ "orc-examples"
-- 
2.43.0


