Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CA58C36018
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 02:56:07 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.4654.1743648963204750002
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 19:56:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LmmfcQGz;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743648963; x=1775184963;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JVo7B2yOi0RBrEYzBioS0vpEn8OAkrWcoTAtlCTfnN8=;
  b=LmmfcQGzNLelahhZdovf6VTf1O7d+TFAC/nEZQ7SanA393Q63T33x6gi
   WNgfZ8BLztVO/CrAFTIbVVoKkMmS5qjpo1JXSm25EiW6yTa1yYK7q6PaP
   elBTnmcIOcmtgChwMxdlOn48zISCfcKzsydZgVypOp7OlIb+quYN+KyXz
   tsffQscWTxr0FCe+KS881yi+uFgjFy05nkfO7iM4RL5Ikr6meCXZylqzh
   bMJiuVLMMigBrbcIGekdptpCIlG8ZvijFqsSiEffibCJhm4wWTpcJMCr/
   oenf2FHjMqAiqAout+u9kKzlNFP7CBB5s9ijgCfH+CbIU8w7FuzcY7bwc
   w==;
X-CSE-ConnectionGUID: BbnpsdCEQVanXq0PSBmY3w==
X-CSE-MsgGUID: ouPXcIpETbSBntg4soEXyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="194467408"
X-IronPort-AV: E=Sophos;i="6.15,184,1739804400"; 
   d="scan'208";a="194467408"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 11:56:01 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9D323D6EA5
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Apr 2025 11:55:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6003AEA178
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Apr 2025 11:55:58 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8715F1A0071;
	Thu,  3 Apr 2025 10:55:57 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH v2 1/2] python3-webcolors: upgrade 24.8.0 -> 24.11.1
Date: Thu,  3 Apr 2025 10:55:50 +0800
Message-Id: <20250403025551.2159-1-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 02:56:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214297

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


