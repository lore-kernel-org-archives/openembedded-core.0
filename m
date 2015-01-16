Return-Path: <paul.betafive@gmail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2A8B672575
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jan 2015 22:15:52 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id q58so22559637wes.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jan 2015 14:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BNwens3e9PJuWoVu5g7P6XyTpr1beV8DRifjiHI+XT4=;
	b=qPHZe1QQfRODhr13c873ENsFye0hjPTUdH9jNKg+kO61vQlByNNGcsSU3l4ZoFgLuV
	uS1WT2NbxXDTnI89KD+U8MrAQoBT4mncc5vFtOC6JE2cBysXDQ0P0XiCW7Ti9h38Op42
	Or0rTSy7GpKydmpODIhzBIG+ohhqyBdFMnOTFAjvcn1bIs9uAhH/DpKHKC36qk7aYTcY
	gCUfBVs465AOj7B8Cswc8XUCfE+338ujrD/X9tujUwWFsvRwdPMnrnNx0ro+JQjewBjN
	RvF4bka9pmCSnC8ARIHPn91OJ3GQfu+tD4uGfavnTcWzemtrnWYkjvy63p1OtrmYDIKT
	+KDw==
X-Received: by 10.194.82.97 with SMTP id h1mr34154649wjy.116.1421446552992;
	Fri, 16 Jan 2015 14:15:52 -0800 (PST)
Received: from nuc.betafive.co.uk
	(cpc19-shep11-2-0-cust55.8-3.cable.virginm.net. [81.111.243.56])
	by mx.google.com with ESMTPSA id x6sm7664547wjf.24.2015.01.16.14.15.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Jan 2015 14:15:52 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: OE Core <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Jan 2015 22:15:29 +0000
Message-Id: <1421446529-24888-8-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1421446529-24888-1-git-send-email-paul@paulbarker.me.uk>
References: <1421446529-24888-1-git-send-email-paul@paulbarker.me.uk>
Subject: [PATCH V2 7/7] opkg-keyrings: New recipe
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
X-List-Received-Date: Fri, 16 Jan 2015 22:15:53 -0000

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


