Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE594D1171B
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 16:52:40 +0000 (UTC)
Received: from smtp-8faa.mail.infomaniak.ch (smtp-8faa.mail.infomaniak.ch [83.166.143.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.614.1764694351496684053
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 08:52:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 83.166.143.170, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dLRdn555szJCD;
	Tue,  2 Dec 2025 17:52:29 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4dLRdn1Qf5zsY2;
	Tue,  2 Dec 2025 17:52:29 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 02 Dec 2025 17:52:12 +0100
Subject: [PATCH 1/2] python3-sphinxcontrib-svg2pdfconverter: add new recipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-svg2pdf-v1-1-bf4bd322e528@cherry.de>
References: <20251202-svg2pdf-v1-0-bf4bd322e528@cherry.de>
In-Reply-To: <20251202-svg2pdf-v1-0-bf4bd322e528@cherry.de>
To: openembedded-core@lists.openembedded.org
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 16:52:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227177

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
 .../python3-sphinxcontrib-svg2pdfconverter_2.0.0.bb   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.0.0.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.0.0.bb
new file mode 100644
index 0000000000..52f9825210
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.0.0.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Sphinx SVG to PDF or PNG converter extension"
+HOMEPAGE = "https://github.com/missinglinkelectronics/sphinxcontrib-svg2pdfconverter"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b11cf936853a71258d4b57bb1849a3f9"
+
+SRC_URI[sha256sum] = "ab9c8f1080391e231812d20abf2657a69ee35574563b1014414f953964a95fa3"
+
+inherit pypi python_setuptools_build_meta
+
+PYPI_PACKAGE = "sphinxcontrib-svg2pdfconverter"
+
+RDEPENDS:${PN} = "python3-sphinx"
+# Only support sphinxcontrib.rsvgconverter for now.
+# As cairosvgconverter depends on cairosvg module, no recipe available yet
+# As inkscapeconverter depends on inkscape, recipe in meta-office, 3rd-party
+# layer not updated in years
+RDEPENDS:${PN} += "librsvg"
+
+BBCLASSEXTEND = "native nativesdk"

-- 
2.52.0


