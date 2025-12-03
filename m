Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 884E7D12D47
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 11:32:46 +0000 (UTC)
Received: from smtp-42ae.mail.infomaniak.ch (smtp-42ae.mail.infomaniak.ch [84.16.66.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13023.1764761562175665646
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 03:32:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.174, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dLwVJ4DQ8zQXd;
	Wed,  3 Dec 2025 12:32:40 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4dLwVH74JszLdr;
	Wed,  3 Dec 2025 12:32:39 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Wed, 03 Dec 2025 12:32:31 +0100
Subject: [PATCH v3 1/2] python3-sphinxcontrib-svg2pdfconverter: add new
 recipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-svg2pdf-v3-1-879d05cb101b@cherry.de>
References: <20251203-svg2pdf-v3-0-879d05cb101b@cherry.de>
In-Reply-To: <20251203-svg2pdf-v3-0-879d05cb101b@cherry.de>
To: openembedded-core@lists.openembedded.org
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 11:32:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227218

From: Quentin Schulz <quentin.schulz@cherry.de>

This will be a dependency for building the Yocto docs soon, so let's add
a recipe for it.

This does SVG to PDF (or PNG) conversion for images used in Sphinx
projects.

It exposes three different Sphinx extensions, each using a different
tool for the conversion:
- cairosvg, a Python module with no available recipe,
- inkscape, only available in seemingly unmaintained 3rd party layer,
- rsvg-convert,

So we'll only support the last extension for now.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/conf/distro/include/maintainers.inc             |  1 +
 .../python3-sphinxcontrib-svg2pdfconverter_2.0.0.bb  | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 9f4e5e2df8..f819a21cce 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -733,6 +733,7 @@ RECIPE_MAINTAINER:pn-python3-sphinxcontrib-jquery = "Tim Orling <tim.orling@kons
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-jsmath = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-qthelp = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-serializinghtml = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-sphinxcontrib-svg2pdfconverter = "Antonin Godard <antonin.godard@bootlin.com>"
 RECIPE_MAINTAINER:pn-python3-subunit = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-testtools = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-trove-classifiers = "Trevor Gamblin <tgamblin@baylibre.com>"
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.0.0.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.0.0.bb
new file mode 100644
index 0000000000..1bf3e55ebd
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.0.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Sphinx SVG to PDF or PNG converter extension"
+HOMEPAGE = "https://github.com/missinglinkelectronics/sphinxcontrib-svg2pdfconverter"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b11cf936853a71258d4b57bb1849a3f9"
+
+SRC_URI[sha256sum] = "ab9c8f1080391e231812d20abf2657a69ee35574563b1014414f953964a95fa3"
+
+inherit pypi python_setuptools_build_meta
+
+PYPI_PACKAGE = "sphinxcontrib_svg2pdfconverter"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
+
+RDEPENDS:${PN} = "python3-sphinx"
+# Only support sphinxcontrib.rsvgconverter for now.
+# sphinxcontrib.cairosvgconverter depends on cairosvg module, no recipe yet
+# sphinxcontrib.inkscapeconverter depends on inkscape, recipe in meta-office,
+# 3rd-party layer not updated in years
+RDEPENDS:${PN} += "librsvg"
+
+BBCLASSEXTEND = "native nativesdk"

-- 
2.52.0


