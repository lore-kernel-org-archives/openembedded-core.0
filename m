Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 477C460290
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 18:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u08IO47Q016897 for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jan 2016 18:24:04 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id V5fulAkyGJGk
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 18:24:04 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u08IO0HF016892
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jan 2016 18:24:01 GMT
Message-ID: <1452277440.7598.138.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 08 Jan 2016 18:24:00 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] populate_sdk: Switch from bzip2 to xz
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
X-List-Received-Date: Fri, 08 Jan 2016 18:24:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

xz gives *much* faster decompression times for the SDK which in itself
is a good reason to use it. It also gives better compression.

One downside is its slower but we care about the end user case
first, build performance secondary.

It also assumes the SDK user has a tar capable of understanding a xz
compressed file but that should be common enough now.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 23dc115..7ca1df6 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -40,7 +40,7 @@ TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
 TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
 
 SDK_RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
-SDK_DEPENDS = "virtual/fakeroot-native pbzip2-native"
+SDK_DEPENDS = "virtual/fakeroot-native xz-native"
 
 # We want the MULTIARCH_TARGET_SYS to point to the TUNE_PKGARCH, not PACKAGE_ARCH as it
 # could be set to the MACHINE_ARCH
@@ -177,7 +177,7 @@ fakeroot tar_sdk() {
 	# Package it up
 	mkdir -p ${SDK_DEPLOY}
 	cd ${SDK_OUTPUT}/${SDKPATH}
-	tar ${SDKTAROPTS} -cf - . | pbzip2 > ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2
+	tar ${SDKTAROPTS} -cf - . | xz > ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
 }
 
 fakeroot create_shar() {
@@ -216,10 +216,10 @@ EOF
 	chmod +x ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
 
 	# append the SDK tarball
-	cat ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2 >> ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
+	cat ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.xz >> ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
 
 	# delete the old tarball, we don't need it anymore
-	rm ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2
+	rm ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
 }
 
 populate_sdk_log_check() {
diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index de8c669..b1ef4b7 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -168,7 +168,7 @@ fi
 payload_offset=$(($(grep -na -m1 "^MARKER:$" $0|cut -d':' -f1) + 1))
 
 printf "Extracting SDK..."
-tail -n +$payload_offset $0| $SUDO_EXEC tar xj -C $target_sdk_dir --checkpoint=.2500
+tail -n +$payload_offset $0| $SUDO_EXEC tar xJ -C $target_sdk_dir --checkpoint=.2500
 echo "done"
 
 printf "Setting it up..."



