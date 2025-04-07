Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4169BC3601E
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 04:02:06 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.39317.1743998524725281313
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Apr 2025 21:02:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LwTN6pfT;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743998525; x=1775534525;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JVo7B2yOi0RBrEYzBioS0vpEn8OAkrWcoTAtlCTfnN8=;
  b=LwTN6pfTnxhprlEWFSIGd/UFX2quxt4Rr8UCMAI6cHiiehNr2Fg1Q8pB
   DAqDwOty1xDObE8FS23o3cUKoseWddF2Ch5o07cE6TDFDQGYu1isI4oQA
   xUhO6P+uqLBquoihkBLrQzyzqgzlkVd+T4EaMIo5k+i0+hTDCFJVTVBY9
   rYyb37t8uQndXHJEY8IZ/ETnPnYr8GhQgmN7Is4MCeT0l3X0oQ1Mu5uZV
   lCyhAMdH2/y/j1RucsTZpO+arYv7nDFhKVlXIKHn0RVm9aPTeESQjVLka
   5ryFQCItS0OIkaOkuuPl66P4GmnjpVR8JtzMzzt4MJ6q5wwSRtcCJM0wk
   A==;
X-CSE-ConnectionGUID: OY0L03K2TDKBAji134WjNQ==
X-CSE-MsgGUID: WROxaOByRBqQuVqKoKDDDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="198398680"
X-IronPort-AV: E=Sophos;i="6.15,193,1739804400"; 
   d="scan'208";a="198398680"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 13:02:03 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 466D996741
	for <openembedded-core@lists.openembedded.org>; Mon,  7 Apr 2025 13:02:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 06C3DD5079
	for <openembedded-core@lists.openembedded.org>; Mon,  7 Apr 2025 13:02:00 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E86F41A0071;
	Mon,  7 Apr 2025 12:01:58 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>,
	openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH v3 1/2] python3-webcolors: upgrade 24.8.0 -> 24.11.1
Date: Mon,  7 Apr 2025 12:01:48 +0800
Message-Id: <20250407040149.2250-1-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 04:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214394

Fix the issue that:
 | Traceback (most recent call last):
 |   File "/mnt/test/build_auh/tmp/work/core2-64-poky-linux/python3-webcolors/24.11.1/recipe-sysroot-native/usr/lib/pyth on3.13/site-packages/pyproject_hooks/_impl.py", line 402, in _call_hook
 |     raise BackendUnavailable(
 |     ...<4 lines>...
 |     )
 | pyproject_hooks._impl.BackendUnavailable: Cannot import 'pdm.backend'

python3-webcolors has migrated to pdm-backend
 | diff --git a/pyproject.toml b/pyproject.toml
 | index 6fcec77..9f2dfa9 100644
 | --- a/pyproject.toml
 | +++ b/pyproject.toml
 | @@ -1,65 +1,110 @@
 |  [build-system]
 | -requires = ["setuptools>=61.0"]
 | -build-backend = "setuptools.build_meta"
 | +requires = [
 | +    "pdm-backend",
 | +]
 | +build-backend = "pdm.backend"

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 ...n3-webcolors_24.8.0.bb => python3-webcolors_24.11.1.bb} | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-webcolors_24.8.0.bb => python3-webcolors_24.11.1.bb} (70%)

diff --git a/meta/recipes-devtools/python/python3-webcolors_24.8.0.bb b/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb
similarity index 70%
rename from meta/recipes-devtools/python/python3-webcolors_24.8.0.bb
rename to meta/recipes-devtools/python/python3-webcolors_24.11.1.bb
index c5ed4bd7d3..cda63d2a35 100644
--- a/meta/recipes-devtools/python/python3-webcolors_24.8.0.bb
+++ b/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb
@@ -3,10 +3,15 @@ HOMEPAGE = "https://pypi.org/project/webcolors/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cbaebec43b7d199c7fd8f5411b3b0448"
 
-SRC_URI[sha256sum] = "08b07af286a01bcd30d583a7acadf629583d1f79bfef27dd2c2c5c263817277d"
+SRC_URI[sha256sum] = "ecb3d768f32202af770477b8b65f318fa4f566c22948673a977b00d589dd80f6"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
+DEPENDS += " \
+    python3-pdm-native \
+    python3-pdm-backend-native \
+"
+
 RDEPENDS:${PN}:class-target = "\
     python3-stringold \
 "
-- 
2.43.0


