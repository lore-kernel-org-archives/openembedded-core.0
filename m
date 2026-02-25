Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69750FD3753
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 12:36:53 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44225.1772023012495505386
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 04:36:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Y1Q4Bllc;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 68194C16542
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 12:37:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6BB065FDE6;
	Wed, 25 Feb 2026 12:36:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E30A410368D23;
	Wed, 25 Feb 2026 13:36:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772023009; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7xLK6dvGTmM6ZBn4pxHA+Smeu5BXYsHtbpKNAGsZU7o=;
	b=Y1Q4BllcY6yuh3iQPbf4xSD3YQCBp9I5iR1NLaPn0rh8Mb7TcwjeXBrYl5YOQouc45AS0y
	X3N1g05qXIHp9UpnbIGorWSSOwikOMOVxMfmzuh3TnEs35Zi+MvAbFOfN27jGOexYSMDXd
	j6MDm05KeNVeSZMVQOnzf5U0cRRYcR/Ua2ryaks9cFY6Z1gjepSMGMVAepI9HJfYEGPamu
	wLnH0+UNcm3NmzNW/oXMDQ2bXrQEOhgp1+sx8RQuoh1F/8OnfGc6aWZIslSgOoUXQiBXi2
	IwustAVRCO4bEs11V2CXwqxgV2cPa8jAhgfpW23F7JYaloHoxELTWvPAKV6NYg==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Wed, 25 Feb 2026 13:36:33 +0100
Subject: [PATCH v2 5/6] sbom-cve-check: add recipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-add-sbom-cve-check-v2-5-eeffa285b901@bootlin.com>
References: <20260225-add-sbom-cve-check-v2-0-eeffa285b901@bootlin.com>
In-Reply-To: <20260225-add-sbom-cve-check-v2-0-eeffa285b901@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, peter.marko@siemens.com, jpewhacker@gmail.com, 
 olivier.benjamin@bootlin.com, antonin.godard@bootlin.com, 
 mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com, 
 Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 12:36:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231961

Provide sbom-cve-check (native) executable.

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 meta/conf/distro/include/maintainers.inc                |  1 +
 .../python/python3-sbom-cve-check_1.1.0.bb              | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 3bc1d00bc1c7..c43107ccdccd 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -714,6 +714,7 @@ RECIPE_MAINTAINER:pn-python3-rfc3987 = "Bruce Ashfield <bruce.ashfield@gmail.com
 RECIPE_MAINTAINER:pn-python3-roman-numerals = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-rpds-py = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-ruamel-yaml = "Bruce Ashfield <bruce.ashfield@gmail.com>"
+RECIPE_MAINTAINER:pn-python3-sbom-cve-check = "Benjamin Robin <benjamin.robin@bootlin.com>"
 RECIPE_MAINTAINER:pn-python3-scons = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-semantic-version = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-setuptools = "Trevor Gamblin <tgamblin@baylibre.com>"
diff --git a/meta/recipes-devtools/python/python3-sbom-cve-check_1.1.0.bb b/meta/recipes-devtools/python/python3-sbom-cve-check_1.1.0.bb
new file mode 100644
index 000000000000..3d1c581e9f86
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-sbom-cve-check_1.1.0.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Lightweight SBOM CVE analysis tool"
+HOMEPAGE = "https://github.com/bootlin/sbom-cve-check"
+SECTION = "devel/python"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=570a9b3749dd0463a1778803b12a6dce"
+
+PYPI_PACKAGE = "sbom_cve_check"
+SRC_URI[sha256sum] = "953256ac99851ba59bc8649b8023303007ff2981edbc4ee395011bd91c118095"
+
+inherit pypi python_hatchling
+
+RDEPENDS:${PN} += " \
+    python3-spdx-python-model \
+    python3-pyyaml \
+"
+
+BBCLASSEXTEND = "native nativesdk"

-- 
2.53.0


