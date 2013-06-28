Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id E9E726AF40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 22:04:46 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id p10so1280500pdj.22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=V/9O92eANSQC6VHYA3d1dl9S1vIi2DZk5beVNVP+iZU=;
	b=HD1t2y9MKygsRgpLiyRWCfnp0OUIRfV+zdR2NnSO+oIaCSvI9jOwAJxJb1/7dK4tUz
	fBDEMbVBHZSbkhU/z4/oYv/lf6SAjjTJvvQxUcwM9+OuuDKkuKezKwyeidWswuaNcUQt
	TRJt9odkb8Xnc8mt5grO3bWgVL1xWDNCFTEcXvtqEUbVnEQw9V64zPoU73sdfjvuc1fc
	APSYNnOUrWksag4QWglEunYTvASb5E6kQMZ25wBrZrl0xh0BEtsafFft8BKVEY13/7gR
	5tJgrnzfJpkKODQX3YccsC7JsJAoSS5bZ9fNq71U2xZN0SSrBszKuMaJwInP4Z8mGOtI
	3Kbg==
X-Received: by 10.66.162.102 with SMTP id xz6mr13612188pab.0.1372457088368;
	Fri, 28 Jun 2013 15:04:48 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	re16sm10723745pac.16.2013.06.28.15.04.47 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 15:04:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 15:04:06 -0700
Message-Id: <16aa82db3cd5727a22d3688197fef330aaf2df59.1372456294.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <4da336aceedb08e21f23fed08fede84eec15ad7b.1372456294.git.raj.khem@gmail.com>
References: <4da336aceedb08e21f23fed08fede84eec15ad7b.1372456294.git.raj.khem@gmail.com>
In-Reply-To: <cover.1372456294.git.raj.khem@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
Subject: [PATCH 21/24] python3-jinja: Recipe for python3 templating system
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Jun 2013 22:04:47 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python/python3-jinja_1.2.bb |   37 +++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-jinja_1.2.bb

diff --git a/meta/recipes-devtools/python/python3-jinja_1.2.bb b/meta/recipes-devtools/python/python3-jinja_1.2.bb
new file mode 100644
index 0000000..e84548a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-jinja_1.2.bb
@@ -0,0 +1,37 @@
+DESCRIPTION = "Pure Python Templating System."
+HOMEPAGE = " http://jinja.pocoo.org/"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=782689a6f9cc3482c3b8b39c552f1cf8"
+
+DEPENDS = "python3"
+
+RDEPENDS_${PN} = " \
+                   python3-codecs \
+                   python3-core \
+                   python3-re \
+                 "
+SRCNAME = "Jinja"
+PR = "r1"
+
+SRC_URI = "\
+  http://pypi.python.org/packages/source/J/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "1235a005ade00b213800ff1e798c0241"
+SRC_URI[sha256sum] = "36252f3d0356008a31a537a31cfba189f7b5898b8e2da454f72ea5f987db8b31"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools3
+
+do_sanitize() {
+
+    # it seems that the installer is not ready for python3.  Upconvert...
+    ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/2to3 -w .
+
+    # this looks like a broken 2to3 fixer.  Help it out.
+    sed -E -i'.tweak' -e 's/__nonzero__/__bool__/g' jinja/datastructure.py
+}
+
+addtask sanitize after do_unpack before do_patch
-- 
1.7.9.5


