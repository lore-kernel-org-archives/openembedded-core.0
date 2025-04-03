Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A922C36014
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 02:56:07 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.4657.1743648963688048160
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 19:56:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=r7gX/d2g;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743648963; x=1775184963;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J9kZg/KSKUSX9+Y49CVTtRY++KUdnbmlxODwEWLBMgk=;
  b=r7gX/d2gdV0HeVXmFcK18VLwTdsO+INMNFwPINTbJr8IR1mdvJv+J4Id
   ZtHvMAwGgSDO3fyHawGBgAACy/IJVxofZkPlGFezsCHx5JYPaIhvoDmxc
   3nhssAUfy3QAzKuD2FRuLjUnT/xEEwVz9I2BBvXweLhvHZS8XErqxSacJ
   sKXTHvCctmeEmfy9Sye9ZDmDHkRPD/3eSTztTgFPkfbY/hnHEbEtzBzZc
   KS8cNmUQRO+s9xYYDtfZ2+Rq6NWFDD9mFNaSJe9j8Wwz1twc6KKJ1ehKf
   zPxgjRNpknsIL97lkJ0GFNB7dmu7w9ifh2JytDCBC4cGkbpsVeyEmc3QH
   g==;
X-CSE-ConnectionGUID: ydi9yDBESHGUPLwVHfDn+g==
X-CSE-MsgGUID: 8pAQwHC8SvmaXhYl8TUBjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="195608348"
X-IronPort-AV: E=Sophos;i="6.15,184,1739804400"; 
   d="scan'208";a="195608348"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 11:56:00 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id DAD4DE9A69
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Apr 2025 11:55:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A2D78BDB63
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Apr 2025 11:55:58 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 25C4A1A009A;
	Thu,  3 Apr 2025 10:55:58 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH v2 2/2] python3-pdm python3-pdm-{backend,build-locked}: move from meta-python
Date: Thu,  3 Apr 2025 10:55:51 +0800
Message-Id: <20250403025551.2159-2-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20250403025551.2159-1-leimaohui@fujitsu.com>
References: <20250403025551.2159-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 02:56:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214298

python3-pdm and python3-pdm-backend are dependencies of python3-webcolors
python3-pdm itself depends on python3-pdm-build-locked

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta/conf/distro/include/maintainers.inc         |  3 +++
 .../python/python3-pdm-backend_2.4.3.bb          | 14 ++++++++++++++
 .../python/python3-pdm-build-locked_0.3.5.bb     | 14 ++++++++++++++
 .../python/python3-pdm_2.22.4.bb                 | 16 ++++++++++++++++
 4 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pdm-backend_2.4.3.bb
 create mode 100644 meta/recipes-devtools/python/python3-pdm-build-locked_0.3.5.bb
 create mode 100644 meta/recipes-devtools/python/python3-pdm_2.22.4.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 2b47d3103c..4c02ee4961 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -665,6 +665,9 @@ RECIPE_MAINTAINER:pn-python3-numpy = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-packaging = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pathspec = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-pbr = "Zang Ruochen <zangruochen@loongson.cn>"
+RECIPE_MAINTAINER:pn-python3-pdm = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-python3-pdm-backend = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-python3-pdm-build-locked = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pefile = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pip = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-python3-pluggy = "Tim Orling <tim.orling@konsulko.com>"
diff --git a/meta/recipes-devtools/python/python3-pdm-backend_2.4.3.bb b/meta/recipes-devtools/python/python3-pdm-backend_2.4.3.bb
new file mode 100644
index 0000000000..46440c9d5d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pdm-backend_2.4.3.bb
@@ -0,0 +1,14 @@
+SUMMARY = "The build backend used by PDM that supports latest packaging standards"
+HOMEPAGE = "https://github.com/pdm-project/pdm-backend"
+LICENSE = "MIT"
+SECTION = "devel/python"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4a564297b3c5b629a528b92fd8ff61ea"
+
+SRC_URI[sha256sum] = "dbd9047a7ac10d11a5227e97163b617ad5d665050476ff63867d971758200728"
+
+inherit pypi python_setuptools_build_meta
+
+PYPI_PACKAGE = "pdm_backend"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-pdm-build-locked_0.3.5.bb b/meta/recipes-devtools/python/python3-pdm-build-locked_0.3.5.bb
new file mode 100644
index 0000000000..c0eee4e97d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pdm-build-locked_0.3.5.bb
@@ -0,0 +1,14 @@
+SUMMARY = "pdm plugin to publish locked dependencies as optional-dependencies"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=19382cdf9c143df4f00b9caa0b60c75a"
+
+SRC_URI[sha256sum] = "ab2f381e00d79841d46be2e6909c265038b9fa951de2bf551ca6adb7f6844201"
+
+inherit pypi python_setuptools_build_meta
+
+DEPENDS += " python3-pdm-backend-native"
+
+PYPI_PACKAGE = "pdm_build_locked"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
+
+BBCLASSEXTEND += "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-pdm_2.22.4.bb b/meta/recipes-devtools/python/python3-pdm_2.22.4.bb
new file mode 100644
index 0000000000..e6f35b3c7a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pdm_2.22.4.bb
@@ -0,0 +1,16 @@
+SUMMARY = "A modern Python package and dependency manager supporting the latest PEP standards"
+HOMEPAGE = "https://pdm-project.org/latest/"
+LICENSE = "MIT"
+SECTION = "devel/python"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
+
+SRC_URI[sha256sum] = "8483f3d2285039cea7e07c5ba6ac7e1fcba358129f8831fb75065a797d27b923"
+
+inherit pypi python_setuptools_build_meta
+
+DEPENDS += " \
+    python3-pdm-backend-native \
+    python3-pdm-build-locked-native \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


