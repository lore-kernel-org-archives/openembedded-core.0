Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id D78AF60556
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 06:00:14 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id em10so9528250wid.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 22:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=hdUPcsrnHtMNqwp1qjKbN69wxD5cC8LXrOiD1Jf8X/U=;
	b=pnGaErOqwGFhdI2pHdm35k6P15NShpHSf8UtE/ehe7d4e3LfuDFk7PftjNZGWUJGkz
	AiEiq9U+h0lASO7DJCaASolgTRLJfE3w6GBUAQQ6o3s2c5LjQAp4A/lRv5bFImQC833f
	89YwbAEt99imIbkGHcLd4PjhBlFzIXEbXGd4U6jBXvgeNhHeDqEQfR04VUJh7jnqfwYj
	SMLdYN3wBYRvFzunnD9XV33hqmrwt8eT/QmWh/c4HvF4WdT6b+p4YxBd0SEK5qB3zapr
	L4EqFoPcBlR5FrTDBWjGbWr7SYlncXifeErOXtGk/ZKjRNxKuml4CVAYGecYgjxwKIvO
	PjSg==
X-Received: by 10.180.19.7 with SMTP id a7mr12760835wie.62.1423807215581;
	Thu, 12 Feb 2015 22:00:15 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip0.t-ipconnect.de.
	[91.10.19.148])
	by mx.google.com with ESMTPSA id u9sm8547638wjy.37.2015.02.12.22.00.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 22:00:14 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Feb 2015 06:59:53 +0100
Message-Id: <1423807195-7087-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423807195-7087-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423807195-7087-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] initial add fontforge(-native) 20141126
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
X-List-Received-Date: Fri, 13 Feb 2015 06:00:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

had this in my private layer but think it could be useful here.

Native tests: liberation-fonts (follow-up patch) / oxygen-fonts
Target test: gumstix overo / xfce image

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../fontforge/fontforge_20141126.bb                | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 meta/recipes-graphics/fontforge/fontforge_20141126.bb

diff --git a/meta/recipes-graphics/fontforge/fontforge_20141126.bb b/meta/recipes-graphics/fontforge/fontforge_20141126.bb
new file mode 100644
index 0000000..835aa9b
--- /dev/null
+++ b/meta/recipes-graphics/fontforge/fontforge_20141126.bb
@@ -0,0 +1,43 @@
+SUMMARY = "A font editor"
+HOMEPAGE = "http://fontforge.github.io/en-US/"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = " \
+    file://COPYING.gplv3;md5=d32239bcb673463ab874e80d47fae504 \
+    file://LICENSE;md5=71d636ba7678baa1573e1b531041386e \
+"
+
+inherit autotools pkgconfig pythonnative mime
+
+DEPENDS = "glib-2.0 pango giflib tiff libxml2 jpeg python libtool"
+DEPENDS_append_class-target = " libxi"
+
+SRC_URI = "https://github.com/${BPN}/${BPN}/archive/${PV}.tar.gz"
+SRC_URI[md5sum] = "0d6f5112c4e5689087339a94aceadf77"
+SRC_URI[sha256sum] = "9c90c640023463c0b2b97b87575a014fcf44f688c3763f4cd136d3c267092106"
+
+EXTRA_OECONF_append_class-native = " with_x=no --disable-python-extension --disable-python-scripting"
+
+do_configure_prepend() {
+    currdir=`pwd`
+    cd ${S}
+
+    ./bootstrap
+
+    cd $currdir
+}
+
+EXTRA_OEMAKE = "CFLAGS='${CFLAGS} -I${B}/uthash/src'"
+
+PACKAGES =+ "${PN}-python-dbg ${PN}-python"
+
+FILES_${PN} += " \
+    ${datadir}/mime \
+    ${datadir}/icons \
+"
+
+FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR} ${datadir}/${PN}/python"
+FILES_${PN}-python-dbg = "${PYTHON_SITEPACKAGES_DIR}/.debug"
+RDEPENDS_${PN}-python = "python"
+
+# for kde's oxygen-fonts or liberation-fonts (> 1.04)
+BBCLASSEXTEND = "native"
-- 
1.9.3


