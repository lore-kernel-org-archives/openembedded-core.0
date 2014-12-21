Return-Path: <paul.betafive@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5F0E9729B8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 22:12:15 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id l15so6402459wiw.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 14:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BNwens3e9PJuWoVu5g7P6XyTpr1beV8DRifjiHI+XT4=;
	b=PsFAmzdDb2BwYeVLQlbyU2Y1nQUZoV/9DsYramDtrSB1e5bMRnNxtBJmdBAkInr3lQ
	HtuODIiPtJBHmXdZaTkFVJKH8LqJprkUbindIv8T6lCheNYNvocfoOvB6m9uAPWZq2P+
	WdZXUz6x7fIVXoUTEgEVeMNo15qyuwzH4PJNI3v6rDJ8/31F1iB714DIlXeAHlzJOVQD
	cWkIqvr8euuFyfXjR2sCWA7lHg5XENJPF1zUIrI3spz+P/PNkBQMgRTdzlzBkodPccME
	mO78FjT9R5WQ+ZQkv7QYW/2AY9uOd/t/kPQaxlHgBFVBPRjIUioIJWZWhI8HM1WJZ6N8
	aSNw==
X-Received: by 10.194.85.17 with SMTP id d17mr35014233wjz.61.1419199935856;
	Sun, 21 Dec 2014 14:12:15 -0800 (PST)
Received: from nuc.betafive.co.uk
	(cpc19-shep11-2-0-cust55.8-3.cable.virginm.net. [81.111.243.56])
	by mx.google.com with ESMTPSA id
	kn5sm21350509wjb.48.2014.12.21.14.12.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 Dec 2014 14:12:15 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: OE Core <openembedded-core@lists.openembedded.org>
Date: Sun, 21 Dec 2014 22:11:57 +0000
Message-Id: <1419199917-27913-9-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1419199917-27913-1-git-send-email-paul@paulbarker.me.uk>
References: <1419199917-27913-1-git-send-email-paul@paulbarker.me.uk>
Subject: [PATCH 8/8] opkg-keyrings: New recipe
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
X-List-Received-Date: Sun, 21 Dec 2014 22:12:15 -0000

This recipe wraps package and package feed verification keys into a package,
making the management and deployment of verification keys much easier. Comments
on how to select keys for inclusion in this package are provided in the recipe
file.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/recipes-devtools/opkg/opkg-keyrings_1.0.bb | 48 +++++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg-keyrings_1.0.bb

diff --git a/meta/recipes-devtools/opkg/opkg-keyrings_1.0.bb b/meta/recipes-devtools/opkg/opkg-keyrings_1.0.bb
new file mode 100644
index 0000000..18d6abd
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg-keyrings_1.0.bb
@@ -0,0 +1,48 @@
+SUMMARY = "Keyrings for verifying opkg packages and feeds"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+# Distro-specific keys can be added to this package in two ways:
+#
+#   1) In a .bbappend, add .gpg and/or .asc files to SRC_URI and install them to
+#      ${D}${datadir}/opkg/keyrings/ in a do_install_append function. These
+#      files should not be named 'key-$name.gpg' to ensure they don't conflict
+#      with keys exported as per (2).
+#
+#   2) In a .bbappend, distro config or local.conf, override the variable
+#      OPKG_KEYRING_KEYS to contain a space-separated list of key names. For
+#      each name, 'gpg --export $name' will be ran to export the public key to a
+#      file named 'key-$name.gpg'. The public key must therefore be in the gpg
+#      keyrings on the build machine.
+
+OPKG_KEYRING_KEYS ?= ""
+
+do_compile() {
+    for name in ${OPKG_KEYRING_KEYS}; do
+        gpg --export ${name} > ${B}/key-${name}.gpg
+    done
+}
+
+do_install () {
+    install -d ${D}${datadir}/opkg/keyrings/
+    for name in ${OPKG_KEYRING_KEYS}; do
+        install -m 0644 ${B}/key-${name}.gpg ${D}${datadir}/opkg/keyrings/
+    done
+}
+
+FILES_${PN} = "${datadir}/opkg/keyrings"
+
+# We need 'opkg-key' to run the postinst script
+RDEPENDS_${PN} = "opkg"
+
+pkg_postinst_${PN} () {
+#! /bin/sh
+set -e
+
+if [ x"$D" = "x" ]; then
+    # On target
+    opkg-key populate
+else
+    exit 1
+fi
+}
-- 
1.9.1


