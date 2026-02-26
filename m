Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D83E3FD8FDE
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 17:01:51 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.74835.1772125310226798780
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 09:01:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=b2Te7OQ0;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B1808C4069A;
	Thu, 26 Feb 2026 17:02:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 36CA25FDE9;
	Thu, 26 Feb 2026 17:01:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D1870103693EF;
	Thu, 26 Feb 2026 18:01:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772125303; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gqiibl6dEDMYmVanIu6m/CWDGNbEgcOWef3WIGqk0RI=;
	b=b2Te7OQ0PIl7eSKvhA8vsKTqHIuCMROfMU7Ccldj2QLw1b5iQLjxOEYbK40MJ6ZSYqleKQ
	fasX+9wpzfV6nqTKRcTxIxrAdcAqI9opwlHUwM1nayhem8KiwRXPXt6JVw+o5VGfJChkmb
	4x8rOo2oclYNSC602AhKR1T/eMAfWKaRw5bSyT8iHy9dGwjPaJi383mtLJF9w9BFch/4pi
	WkIpIicTkif0+l2kr/uc6G98dDxdZJ6qfEy5BujW4SQk7lcYDJvxGydaaWbRVX7XVSqhnS
	q4cfUfRrAUWK7iJnWuflqYDppqURjeb8yXWyKCyZgvjHEbRtWLFQXvLMrYGotA==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Thu, 26 Feb 2026 18:01:18 +0100
Subject: [PATCH v3 4/6] python3-spdx-python-model: add recipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-add-sbom-cve-check-v3-4-2e60423f4d35@bootlin.com>
References: <20260226-add-sbom-cve-check-v3-0-2e60423f4d35@bootlin.com>
In-Reply-To: <20260226-add-sbom-cve-check-v3-0-2e60423f4d35@bootlin.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 17:01:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232043

 - Part of the dependency chain for sbom-cve-check

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 meta/conf/distro/include/maintainers.inc           |  1 +
 ...enerate-bindings-allow-to-use-local-files.patch | 58 ++++++++++++++++++++++
 .../python/python3-spdx-python-model_0.0.4.bb      | 37 ++++++++++++++
 3 files changed, 96 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index d65960f8e1bc..3bc1d00bc1c7 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -725,6 +725,7 @@ RECIPE_MAINTAINER:pn-python3-smartypants = "Trevor Gamblin <tgamblin@baylibre.co
 RECIPE_MAINTAINER:pn-python3-smmap = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-snowballstemmer = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sortedcontainers = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-spdx-python-model = "Benjamin Robin <benjamin.robin@bootlin.com>"
 RECIPE_MAINTAINER:pn-python3-spdx-tools = "Marta Rybczynska <marta.rybczynska@ygreky.com>"
 RECIPE_MAINTAINER:pn-python3-sphinx = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-sphinx-argparse = "Antonin Godard <antonin.godard@bootlin.com>"
diff --git a/meta/recipes-devtools/python/python3-spdx-python-model/0001-generate-bindings-allow-to-use-local-files.patch b/meta/recipes-devtools/python/python3-spdx-python-model/0001-generate-bindings-allow-to-use-local-files.patch
new file mode 100644
index 000000000000..ec24d7beb3c5
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-spdx-python-model/0001-generate-bindings-allow-to-use-local-files.patch
@@ -0,0 +1,58 @@
+From 9fb565a0a70c6985fa1efde13cfe7fb4851588ce Mon Sep 17 00:00:00 2001
+From: Benjamin Robin <benjamin.robin@bootlin.com>
+Date: Tue, 24 Feb 2026 10:59:25 +0100
+Subject: [PATCH] generate-bindings: allow to use local files
+
+shacl2code needs to download the following URLs during build time:
+ - https://spdx.org/rdf/3.0.1/spdx-model.ttl
+ - https://spdx.org/rdf/3.0.1/spdx-json-serialize-annotations.ttl
+ - https://spdx.org/rdf/3.0.1/spdx-context.jsonld
+
+There are a lot of package build tools that do not allow to download
+a file during the build. So provide a way to use local file:
+If the environment variable SHACL2CODE_SPDX_DIR is defined, load
+the SPDX model and SPDX context from the directory specified by this
+environment variable.
+
+Upstream-Status: Submitted [https://github.com/spdx/spdx-python-model/pull/19]
+
+Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
+---
+ gen/generate-bindings | 22 ++++++++++++++++------
+ 1 file changed, 16 insertions(+), 6 deletions(-)
+
+diff --git a/gen/generate-bindings b/gen/generate-bindings
+index b963c55a3bc9..bc7041ee3bb9 100755
+--- a/gen/generate-bindings
++++ b/gen/generate-bindings
+@@ -14,12 +14,22 @@ echo "# Import all versions" > __init__.py
+ for v in $SPDX_VERSIONS; do
+     MODNAME="v$(echo "$v" | sed 's/[^a-zA-Z0-9_]/_/g')"
+
+-    shacl2code generate --input https://spdx.org/rdf/$v/spdx-model.ttl \
+-        --input https://spdx.org/rdf/$v/spdx-json-serialize-annotations.ttl \
+-        --context https://spdx.org/rdf/$v/spdx-context.jsonld \
+-        --license Apache-2.0 \
+-        python \
+-        -o "$MODNAME.py"
++    if [ -n "${SHACL2CODE_SPDX_DIR}" ] && [ -d "${SHACL2CODE_SPDX_DIR}/$v" ]
++    then
++        shacl2code generate --input "file://${SHACL2CODE_SPDX_DIR}/$v/spdx-model.ttl" \
++            --input "file://${SHACL2CODE_SPDX_DIR}/$v/spdx-json-serialize-annotations.ttl" \
++            --context-url "file://${SHACL2CODE_SPDX_DIR}/$v/spdx-context.jsonld" https://spdx.org/rdf/$v/spdx-context.jsonld  \
++            --license Apache-2.0 \
++            python \
++            -o "$MODNAME.py"
++    else
++        shacl2code generate --input https://spdx.org/rdf/$v/spdx-model.ttl \
++            --input https://spdx.org/rdf/$v/spdx-json-serialize-annotations.ttl \
++            --context https://spdx.org/rdf/$v/spdx-context.jsonld \
++            --license Apache-2.0 \
++            python \
++            -o "$MODNAME.py"
++    fi
+
+     echo "from . import $MODNAME" >> __init__.py
+ done
+--
+2.53.0
diff --git a/meta/recipes-devtools/python/python3-spdx-python-model_0.0.4.bb b/meta/recipes-devtools/python/python3-spdx-python-model_0.0.4.bb
new file mode 100644
index 000000000000..00c3b3913c2e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-spdx-python-model_0.0.4.bb
@@ -0,0 +1,37 @@
+SUMMARY = "Generated Python code for SPDX Spec version 3"
+HOMEPAGE = "https://pypi.org/project/spdx-python-model/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+
+PYPI_PACKAGE = "spdx_python_model"
+SRC_URI[sha256sum] = "bdec725398babcbdd4bcb7c16cf23497d06a48d0ef3ea1edb19a3b0d431ab8c1"
+
+SRC_URI += " \
+    https://spdx.org/rdf/3.0.1/spdx-context.jsonld;name=spdx1 \
+    https://spdx.org/rdf/3.0.1/spdx-json-serialize-annotations.ttl;name=spdx2 \
+    https://spdx.org/rdf/3.0.1/spdx-model.ttl;name=spdx3 \
+    file://0001-generate-bindings-allow-to-use-local-files.patch \
+"
+
+SRC_URI[spdx1.sha256sum] = "c72b0928f094c83e5c127784edb1ebca2af74a104fcacc007c332b23cbc788bd"
+SRC_URI[spdx2.sha256sum] = "c6a54b51230eb2bf3b31302546af201f303e0b7931c1db404d7f5b72b6f863e6"
+SRC_URI[spdx3.sha256sum] = "30ebb4af2d70a9809044ef46f44cc3dc5125226d70f818a50ed2e1d5f404c593"
+
+inherit pypi python_hatchling
+
+export SHACL2CODE_SPDX_DIR = "${S}/spdx"
+
+do_configure:append() {
+    mkdir -p "${SHACL2CODE_SPDX_DIR}/3.0.1/"
+    cp ${UNPACKDIR}/spdx-context.jsonld "${SHACL2CODE_SPDX_DIR}/3.0.1/"
+    cp ${UNPACKDIR}/spdx-json-serialize-annotations.ttl "${SHACL2CODE_SPDX_DIR}/3.0.1/"
+    cp ${UNPACKDIR}/spdx-model.ttl "${SHACL2CODE_SPDX_DIR}/3.0.1/"
+}
+
+DEPENDS += " \
+    python3-shacl2code-native \
+    python3-hatch-build-scripts-native \
+"
+
+BBCLASSEXTEND = "native nativesdk"

-- 
2.53.0


