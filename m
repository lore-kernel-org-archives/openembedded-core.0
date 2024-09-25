Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E3FDFC619B
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:55 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.9326.1727246990413115226
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=J19pWqvJ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246992; x=1758782992;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=9/7LxKxpIa6wjafFl5kLCH0dFL71/M35znNpqbRnMsc=;
  b=J19pWqvJ3f/Tu2QV1mUUgwUPh5OYK4S/AiBUDJoQ8H0AHFfJIqS6GA3/
   I424rwTE8UNQvyhwwN/lLvfwlUDRNvrqIdkH9Yv75wvAQvcZVZDbuGd1P
   zY1kptdngj4SBeJsGWrHXGZAZe50Y7NVAJVI/fl+ca2wD5zunNk3rTR5D
   UKv84ZqpqqCuT5dS8BvpUM82BAXmM0EpENgGkO79BZUcsG+0bv2w8wHPo
   83b/8gVWlHWdU/AXV5jOWLGGUnmJmvA63B0lg8+xzcyudmFG5mDBXSmMj
   Ni+bqB5dOrwYMQu5w8vZAPAFrSx+whfVh7uOuLTuAZR3dgTlnR1hlIjTV
   A==;
X-CSE-ConnectionGUID: A/G2cPclRUWsgmdwM2uGNQ==
X-CSE-MsgGUID: KM4GjVnPS1WXnIM7YswLVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="154170425"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="154170425"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:49 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B3038DF1BE
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:46 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3B54BD99AB
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C24AB6B5C3
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:36 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 72BCE1A000A;
	Wed, 25 Sep 2024 14:49:36 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/47] igt-gpu-tools: upgrade 1.28 -> 1.29
Date: Wed, 25 Sep 2024 14:48:44 +0800
Message-Id: <1727246960-20665-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10--3.768500-10.000000
X-TMASE-MatchedRID: PXzrFdFmygGjz0nOeth/yUIIxwDaU5mrNwOFvRc/MEs10hFCwEzEuYtx
	jghoBojm1jypNY0wtaZb6TwGgrVUfiuEYaOxdtLjqhcdnP91eXF5IzfKVROBsxFBDiQWqOMkpWB
	uvDQFBSqON6IF5hDyaxMeM3swr5OtayEoN4AgQiImZusHWPhfCiEEwm0ncLbiVC4aflv2vZlptp
	XlB88qF5V+LIjVX8WFOfKAZfriqPfgH9tOXGgivTllFsU0CXSP+VJ6lZyB0s/+Aw16GgqpOzk36
	vThrq/E4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054ws5GlXF672zo8WM
	kQWv6iXBcIE78YqRWo6HM5rqDwqtAJKCEGSIjYjcAgvj7qYrwtdlymyg6ukgBiPiQL7x9mmVIfO
	M1AsbyDIPhkfZgm1L+fvfi94jnmgdDzI4l6lmX274aH3hQkVsHSbhGbmGylXFJK7yLnZRGZdO3Q
	67ImL8gi4RUz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204925

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Added gcc warns: dangling-pointer, int-conversion
- More guidelines in CONTRIBUTING.
- Reorganized Tests: Moved all vendor specific tests to their own dir
- Fix musl/uclibc build
- New KMS framebuffer stress benchmark.
- Added basic Xe support in gem_wsim.
- Add documentation about cross-builds.
- Improve tests documentation.
- Add Battlemage (BMG) support in xe_pciids.h
- Add amdgpu GFX1152, GFX1150 and gfx12.
- Added inline support for iga64 assembly in GPGPU shader.
- Improved KUnit support.
- Enable igt run on security enhanced distros
- Use blitter as a default for all KMS tests.
- Increased MAX supported pipes to 16 (Pipe-A to Pipe-P)
- Added generic way to reset sysfs/debugfs attrs to default values upon
  exit.
- Added hook scripts to igt_runner.
- Added support for Xe in KMS tests.
- Added new subtests and improvements to VRR.
- Added new subtests to force joiner.
- Added fbdev tests to Xe.
- Added amdgpu fuzzing tests.
- Added syncobj_eventfd test.
- Added basic Single-Root IO Virtualization (SRIOV) test.
- Added prime test for vmwgfx.
- Improved core_getversion.
- Improved kms_atomic on non-mutable planes.
- Added and improved Xe tests.
- New Xe perf/OA tools.
- New intel_tiling_detect tool.
- New option in lsgpu for printing GPU on PCI bus, working also
  in case when no gpu driver is loaded.
- Added sysfs profiling knob to gputop.
- Support for Xe in gputop.
- Improved generating test lists at compilation time.
- Improved code coverage.
- Improved intel_vbt_decode and other intel tools.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{igt-gpu-tools_git.bb => igt-gpu-tools_1.29.bb}            | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/igt-gpu-tools/{igt-gpu-tools_git.bb => igt-gpu-tools_1.29.bb} (96%)

diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_1.29.bb
similarity index 96%
rename from meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
rename to meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_1.29.bb
index 90cd09ea70..323c89ec37 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_1.29.bb
@@ -9,8 +9,7 @@ LICENSE = "MIT"
 
 inherit meson pkgconfig
 
-SRCREV = "31ec677ca24e7ed86e35f367f40a29d3d9f51c06"
-PV = "1.28"
+SRCREV = "fc3113c8c1e99797b2d4769aaf02265be64a7589"
 
 SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https;branch=master"
 
-- 
2.34.1


