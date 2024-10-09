Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFDA1CF0454
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 05:49:46 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.9176.1728452984868433192
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 22:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fGgZ8xeL;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728452985; x=1759988985;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=MKLrVnPvNoDPJjU4FRSxHRigPAlK9ch3HpMyNO2xh/A=;
  b=fGgZ8xeL/3OsO2fId0IgV26CettjiEjy0P3lF2icl580C1U9cdP+xTrB
   MFttL7n+UxdTO3FiTkmIRv/P2SXcBQlxzMWL/+1rBW4ENnOzX12QqFCki
   pf2R6s42uksq95y3Vvm4YystWRihsBsOf90OBBxvSZHbQfv+O1PS6Mm/x
   pFAVr5fpvKNJX1PHDNwcV8F8C/kvvLIFoztXNbCDNiE0a3NVbPtEBlk3E
   rcbSdFD6J9bqym30f+/cMPUS4+B+mouOElfYXWOXz/H5O2emSzGcay3SC
   u/d1iFAMVRp0jQLQoXtBnhAbCZQqZaVyId21uVyDAugImstxC88dPL9KI
   A==;
X-CSE-ConnectionGUID: ymUx+P58T+GOkW38PNySpQ==
X-CSE-MsgGUID: Stx0hj/DREmId1M3o1AY8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="176300789"
X-IronPort-AV: E=Sophos;i="6.11,189,1725289200"; 
   d="scan'208";a="176300789"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 14:49:43 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 87B4AC68E7
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:40 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id CA723D50FD
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 69CE020081311
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:39 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 18E731A000A;
	Wed,  9 Oct 2024 13:49:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 21/26] shaderc: upgrade 2024.2 -> 2024.3
Date: Wed,  9 Oct 2024 13:49:10 +0800
Message-Id: <1728452955-25051-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
References: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28718.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28718.005
X-TMASE-Result: 10-2.627200-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrUuVVTCQr62pvKJIOnnDTt+OU
	v0mR5zZDqgSVUPKSwnlgz/Pvx4ih562sJVBkgraFsFSKfGPIprVUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmis1RWeqLGIw4hXJsS++injm5MoGKfGX+6YA3qL69rXq6RY0
	JyfRdA4ufbYRxKtAGdNprcTIaqJcMQnn4qR0Bq7n1JIA4rhsZ/fS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTthUfR2rvBju6iKXyKQ+XCZtxgm9G6bhWqSR0oWDC0RC6X68+7iEV7lC7Rg5EbV9OgLFMV
	uwB1eocLvHZs9t2tjQqLAfvs4/4lKMvYo+D55m0yoB4P7dCh9lPJnXL2yNYdkuo847l05tDEzMy
	Amsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 05:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205331

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Update dependencies: Glslang, SPRIV-Tools, SPIRV-Headers
   - SPIRV-Tools is at v2024.4.rc1
   - This incorporates a SPIRV-Tools fix which was limiting parallelism.
     Validator friendly name generation was serializing on a mutex
     protecting the locale object.
- During HLSL compilation or any optimizing compile, don't tell the
  validator to use "friendly names".  This should save time spent in the
  initial validation step of the optimization recipe.
- Adapt test golden results to Glslang changes which reorder
  decorations by object enum value.
- Fix ndk-build library dependencies: libshaderc_util depends on glslang
- Use Python 3.12 on Linux CI bots
- Fix Python 3.12 warnings for string escapes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../shaderc/{shaderc_2024.2.bb => shaderc_2024.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2024.2.bb => shaderc_2024.3.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/shaderc_2024.2.bb b/meta/recipes-graphics/shaderc/shaderc_2024.3.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2024.2.bb
rename to meta/recipes-graphics/shaderc/shaderc_2024.3.bb
index c658e7df05..0948ba28d6 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2024.2.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2024.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "5dad9194c038702ef20ccabbe4e3c188f2b13cec"
+SRCREV = "7223dc3d5e34bbcc44f3150546dbfa8a5da58c4c"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.34.1


