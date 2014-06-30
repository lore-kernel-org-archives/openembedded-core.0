Return-Path: <rewitt@declaratino.com>
Received: from p3plsmtpa07-09.prod.phx3.secureserver.net
	(p3plsmtpa07-09.prod.phx3.secureserver.net [173.201.192.238])
	by mail.openembedded.org (Postfix) with ESMTP id 8AB8465D4A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 18:38:36 +0000 (UTC)
Received: from localhost.localdomain ([74.138.158.48])
	by p3plsmtpa07-09.prod.phx3.secureserver.net with 
	id LiX31o00312wNLy01iXTeX; Mon, 30 Jun 2014 11:31:28 -0700
From: Randy Witt <rewitt@declaratino.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jun 2014 14:29:59 -0400
Message-Id: <1404152999-10661-2-git-send-email-rewitt@declaratino.com>
X-Mailer: git-send-email 2.0.1
In-Reply-To: <1404152999-10661-1-git-send-email-rewitt@declaratino.com>
References: <1404152999-10661-1-git-send-email-rewitt@declaratino.com>
Subject: [PATCH] Allow for selectable compression commands for sdk.
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
X-List-Received-Date: Mon, 30 Jun 2014 18:38:36 -0000

This allows for a user to specify the compression and decompression
commands when creating an sdk. An example would be to use pigz to
take advantage of multiple cores during compression.

Signed-off-by: Randy Witt <rewitt@declaratino.com>
---
 meta/classes/populate_sdk_base.bbclass | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index a12bf11..27c73e4 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -49,6 +49,27 @@ EXCLUDE_FROM_WORLD = "1"
 
 SDK_PACKAGING_FUNC ?= "create_shar"
 
+SDK_COMPRESS_bz2 ?= "bzip2 -z -c"
+SDK_DECOMPRESS_bz2 ?= "bzip2 -d -c"
+
+SDK_COMPRESS_xz ?= "xz -z -c"
+SDK_DECOMPRESS_xz ?= "xz -d -c"
+SDK_COMPRESSION_DEPS_xz = "xz-native"
+
+# pigz is set up as an alternative for gzip, hence why gzip is called
+# rather than pigz directly.
+SDK_COMPRESS_pigz ?= "gzip -c"
+SDK_DECOMPRESS_pigz ?= "gzip -d -c"
+SDK_COMPRESSION_DEPS_pigz = "pigz-native"
+SDK_COMPRESSION_EXTRANATIVEPATH_pigz = "pigz-native"
+
+SDK_COMPRESSION_TYPE ??= "bz2"
+SDK_COMPRESS = "${SDK_COMPRESS_${SDK_COMPRESSION_TYPE}}"
+SDK_DECOMPRESS = "${SDK_DECOMPRESS_${SDK_COMPRESSION_TYPE}}"
+
+SDK_DEPENDS += "${@d.getVar('SDK_COMPRESSION_DEPS_${SDK_COMPRESSION_TYPE}') or ''}"
+EXTRANATIVEPATH += "${@d.getVar('SDK_COMPRESSION_EXTRANATIVEPATH_${SDK_COMPRESSION_TYPE}') or ''}"
+
 fakeroot python do_populate_sdk() {
     from oe.sdk import populate_sdk
     from oe.manifest import create_manifest, Manifest
@@ -107,13 +128,13 @@ fakeroot create_sdk_files() {
 	sed -i -e "s:##DEFAULT_INSTALL_DIR##:$escaped_sdkpath:" ${SDK_OUTPUT}/${SDKPATH}/relocate_sdk.py
 }
 
-SDKTAROPTS = "--owner=root --group=root -j"
+SDKTAROPTS = "--owner=root --group=root"
 
 fakeroot tar_sdk() {
 	# Package it up
 	mkdir -p ${SDK_DEPLOY}
 	cd ${SDK_OUTPUT}/${SDKPATH}
-	tar ${SDKTAROPTS} -c --file=${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2 .
+	tar ${SDKTAROPTS} -c . | ${SDK_COMPRESS} > ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.${SDK_COMPRESSION_TYPE}
 }
 
 fakeroot create_shar() {
@@ -236,7 +257,7 @@ fi
 payload_offset=$(($(grep -na -m1 "^MARKER:$" $0|cut -d':' -f1) + 1))
 
 printf "Extracting SDK..."
-tail -n +$payload_offset $0| $SUDO_EXEC tar xj -C $target_sdk_dir
+tail -n +$payload_offset $0| ${SDK_DECOMPRESS} | $SUDO_EXEC tar x -C $target_sdk_dir
 echo "done"
 
 printf "Setting it up..."
@@ -305,10 +326,10 @@ EOF
 	chmod +x ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
 
 	# append the SDK tarball
-	cat ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2 >> ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
+	cat ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.${SDK_COMPRESSION_TYPE} >> ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
 
 	# delete the old tarball, we don't need it anymore
-	rm ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2
+	rm ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.${SDK_COMPRESSION_TYPE}
 }
 
 populate_sdk_log_check() {
-- 
2.0.1


