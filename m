Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FCC3C77B7C
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 01:45:05 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.2626.1684979097761699232
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 18:44:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MJug06DB;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34P1iqj7128621;
	Wed, 24 May 2023 20:44:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684979092;
	bh=5CMgbHA94TgOhshr7m7mQQJaoll7DVitisOY3/tfcPc=;
	h=From:To:CC:Subject:Date;
	b=MJug06DBPG+kPuudgC9xQDHp9afFqCmQmKEWn3ejrw2VLeQi4DF6C7fARI1NCHQLP
	 FztyEaNKLpENkU0gRa+fIZ/OzAzUPScp5GiVpZQ9QM06lp0JR39BR4mQZk5p4ahr+j
	 luUDu/EspHW7KS1pzFod5/VEd+ylVi5W9Bn4jzEg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34P1ipKW067937
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 May 2023 20:44:51 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 24
 May 2023 20:44:51 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 24 May 2023 20:44:51 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34P1ipg0030323;
	Wed, 24 May 2023 20:44:51 -0500
From: <rs@ti.com>
To: <steve@sakoman.com>, <reatmon@ti.com>, <denis@denix.org>
CC: <openembedded-core@lists.openembedded.org>, Randolph Sapp <rs@ti.com>
Subject: [OE-core][kirkstone][PATCH 0/3] piglit: backported fixes and configs
Date: Wed, 24 May 2023 20:44:45 -0500
Message-ID: <20230525014448.486619-1-rs@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 01:45:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181697

From: Randolph Sapp <rs@ti.com>

This is a set of patches for piglit from master that are relevant to
kirkstone.

The following patch was lightly modified since it referenced other
patches that were not necessary here:

piglit: Add PACKAGECONFIG for glx and opencl

Tom Hochstein (2):
  piglit: Add PACKAGECONFIG for glx and opencl
  piglit: Add missing glslang dependencies

Zoltan Boszormenyi (1):
  piglit: Fix build time dependency

 ...roper-WAYLAND_INCLUDE_DIRS-variable.patch} |  0
 ...-shader.c-do-not-hardcode-build-pat.patch} |  0
 ...n-t-enable-GLX-if-tests-are-disabled.patch | 32 +++++++++++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb    | 13 +++++---
 4 files changed, 40 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/piglit/piglit/{0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch => 0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch} (100%)
 rename meta/recipes-graphics/piglit/piglit/{0002-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch => 0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch} (100%)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0005-cmake-Don-t-enable-GLX-if-tests-are-disabled.patch

-- 
2.40.1


