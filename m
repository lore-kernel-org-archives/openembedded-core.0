Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 424F8D25B54
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 03:54:14 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7874.1769658848307879187
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jan 2026 19:54:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=M2a6Kq/s;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769658848; x=1801194848;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=c5Dt6AyJJlq+C70ulagtW7Q008RY7v/ZDrE58qM5BYI=;
  b=M2a6Kq/sj9m4tVj2EWJNwgM9lUNeagYwstJNqUw/21bk8xtop8R/sFY1
   6p90dM3eY5S0kTp0S3x3mRJHhT1F+MY6zhP2rbqLrJBdx7d2R9dNCaBG/
   fJkGBtu3gXJFeTywZ0lGylBqDgMNJhPw/rau84Bb9k34Qqg2rOK8Sf3lg
   kPKBIthPAt4eNAVDZvrgthLCWUXeSg3nDL/fiMXP+bbcTa9tdKuFO/Cff
   KIVgfAJo296I1FVHppCogN3cXrCzcQmrUmTy16oaYv72vB7bdive0tZDF
   vVLCNqSDvuC0rEVLSpfkZzbFKxBoGBrZrQ62iMQN0uhT36J464kOfWExT
   A==;
X-CSE-ConnectionGUID: E0dehf2CTd+uPTyOIAlYEA==
X-CSE-MsgGUID: nbn3sEvTTmuhDykvwR4LoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="215600431"
X-IronPort-AV: E=Sophos;i="6.21,260,1763391600"; 
   d="scan'208";a="215600431"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 12:54:06 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id A677FC0183F
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 03:54:06 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 5C140C06BF0
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 03:54:06 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 27EE11401F00
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 03:54:03 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] Investigate hotdoc and add a recipe to build it
Date: Thu, 29 Jan 2026 11:53:47 +0800
Message-ID: <20260129035353.8982-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 03:54:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230112

Add new recipe hotdoc and its runtime dependence.

Liu Yiding (6):

  [OE-core][PATCH v3] hotdoc : Add new recipe

  [OE-core][PATCH] orc: Enable hotdoc to produce doc
    Make a recipe to use hotdoc

  Add following 4 recipes for runtime dependence of hotdoc.
  [OE-core][PATCH] python3-appdirs: Add new recipe
    Move it from meta-openembedded to openembedded-core as it is required by hotdoc 0.17.4.
  [OE-core][PATCH] python3-schema: Add new recipe
  [OE-core][PATCH] python3-toposort: Add new recipe
  [OE-core][PATCH v2] python3-wheezy-template: Add new recipe

 meta/conf/distro/include/maintainers.inc      |  1 +
 ...ment_scanner-fix-function-prototypes.patch | 32 +++++++++
 ...y-backports-dependency-on-sufficient.patch | 72 +++++++++++++++++++
 .../hotdoc/0003-CMake-4-compatibility.patch   | 44 ++++++++++++
 ...ke-path-to-relative-in-FlexExtension.patch | 34 +++++++++
 meta/recipes-devtools/hotdoc/hotdoc_0.17.4.bb | 27 +++++++
 .../orc/orc/0001-Fix-hotdoc-run-error.patch   | 37 ++++++++++
 meta/recipes-devtools/orc/orc_0.4.42.bb       |  5 +-
 .../python/python3-appdirs_1.4.4.bb           | 11 +++
 .../python/python3-schema_0.7.8.bb            | 10 +++
 .../python/python3-toposort_1.10.bb           | 10 +++
 .../python/python3-wheezy-template_3.2.4.bb   | 13 ++++
 12 files changed, 295 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/hotdoc/hotdoc/0001-c_comment_scanner-fix-function-prototypes.patch
 create mode 100644 meta/recipes-devtools/hotdoc/hotdoc/0002-avoid-third-party-backports-dependency-on-sufficient.patch
 create mode 100644 meta/recipes-devtools/hotdoc/hotdoc/0003-CMake-4-compatibility.patch
 create mode 100644 meta/recipes-devtools/hotdoc/hotdoc/0004-Make-path-to-relative-in-FlexExtension.patch
 create mode 100644 meta/recipes-devtools/hotdoc/hotdoc_0.17.4.bb
 create mode 100644 meta/recipes-devtools/orc/orc/0001-Fix-hotdoc-run-error.patch
 create mode 100644 meta/recipes-devtools/python/python3-appdirs_1.4.4.bb
 create mode 100644 meta/recipes-devtools/python/python3-schema_0.7.8.bb
 create mode 100644 meta/recipes-devtools/python/python3-toposort_1.10.bb
 create mode 100644 meta/recipes-devtools/python/python3-wheezy-template_3.2.4.bb

-- 
2.43.0


