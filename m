Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F682C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 04:02:06 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.38799.1743998525149577063
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Apr 2025 21:02:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rH6CR5Gj;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743998525; x=1775534525;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MmoMZKbPGwbvpIattUkv85WZ2By3dT7gudiyxJETb7g=;
  b=rH6CR5GjjfbeVVr7St5z1KEanXgYHP540nsMm4nauDDeKJO5ZsesWsMl
   4itLPav7VZ9VW9KvdO8KN5wVqKvtsA12Kzh52+WphZ9n2Lq+YasIdC0Tz
   +CevRaA1uRVlAdA7KBCCdnUAXsr3mLNWN4h5QLekX8qd/aoJltoFqdWeo
   4cc3Lo1/x28FVsPEzRK4pgZL8x0lPfRmNswz4yZtjklmbZs8jsLOc12tQ
   zJizCpgB58pxW7MPCsg+CvOZ0SyhfbatJ4xuLaEvVDOzvTyPaK0ozzIH9
   EgQU0bLimfQPXjjz1buwsCthl4zEwJCVCcV9IgSViSg//HlFqW7UtPTbb
   Q==;
X-CSE-ConnectionGUID: XY8DxrdeQI+hBYfzmHjpXg==
X-CSE-MsgGUID: 4k0coUFpT9WexIedOin1TQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="175080612"
X-IronPort-AV: E=Sophos;i="6.15,193,1739804400"; 
   d="scan'208";a="175080612"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 13:02:03 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id A3FFDC2269
	for <openembedded-core@lists.openembedded.org>; Mon,  7 Apr 2025 13:02:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 662D3D88B6
	for <openembedded-core@lists.openembedded.org>; Mon,  7 Apr 2025 13:02:00 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BD97A1A009A;
	Mon,  7 Apr 2025 12:01:59 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>,
	openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH v3 2/2] python3-pdm python3-pdm-{backend,build-locked}: move from meta-python
Date: Mon,  7 Apr 2025 12:01:49 +0800
Message-Id: <20250407040149.2250-2-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20250407040149.2250-1-leimaohui@fujitsu.com>
References: <20250407040149.2250-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 04:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214395

python3-pdm and python3-pdm-backend are dependencies of python3-webcolors
python3-pdm itself depends on python3-pdm-build-locked

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta/conf/distro/include/maintainers.inc         |  3 +++
 .../python/python3-pdm-backend_2.4.3.bb          | 14 ++++++++++++++
 .../python/python3-pdm-build-locked_0.3.5.bb     | 15 +++++++++++++++
 .../python/python3-pdm_2.22.4.bb                 | 16 ++++++++++++++++
 4 files changed, 48 insertions(+)
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
index 0000000000..12afe8bcf4
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pdm-build-locked_0.3.5.bb
@@ -0,0 +1,15 @@
+SUMMARY = "pdm plugin to publish locked dependencies as optional-dependencies"
+HOMEPAGE = "https://github.com/pdm-project/pdm-build-locked"
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


