Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9B6F77649D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 10:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6VAT9TS020196 for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:29:09 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id nYQc3p40HIl9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:29:09 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6VASumm020192
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:29:07 +0100
Message-ID: <1438338536.22462.13.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Jul 2015 11:28:56 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] cross-canadian: Add symlinks for multilib cases
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
X-List-Received-Date: Fri, 31 Jul 2015 10:29:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

In the same way we map various TARGET_OS options back to the single
cross-canadian compiler, add mappings for the TARGET_VENDOR cases we
know about in the multilib case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index 40eb511..6b6c680 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -17,6 +17,7 @@ STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${S
 #
 PACKAGE_ARCH = "${SDK_ARCH}-${SDKPKGSUFFIX}"
 CANADIANEXTRAOS = "linux-uclibc linux-musl"
+CANADIANEXTRAVENDOR = ""
 MODIFYTOS ??= "1"
 python () {
     archs = d.getVar('PACKAGE_ARCHS', True).split()
@@ -68,6 +69,17 @@ python () {
         d.setVar("TARGET_OS", "linux-gnueabi")
     else:
         d.setVar("TARGET_OS", "linux")
+
+    # Also need to handle multilib target vendors
+    vendors = d.getVar("CANADIANEXTRAVENDOR", True)
+    if not vendors:
+        vendors = all_multilib_tune_values(d, 'TARGET_VENDOR')
+    origvendor = d.getVar("TARGET_VENDOR_MULTILIB_ORIGINAL", True)
+    if origvendor:
+        d.setVar("TARGET_VENDOR", origvendor)
+        if origvendor not in vendors.split():
+            vendors = origvendor + " " + vendors
+    d.setVar("CANADIANEXTRAVENDOR", vendors)
 }
 MULTIMACH_TARGET_SYS = "${PACKAGE_ARCH}${HOST_VENDOR}-${HOST_OS}"
 
@@ -148,14 +160,21 @@ SHLIBSDIRS = "${PKGDATA_DIR}/nativesdk-shlibs2"
 SHLIBSWORKDIR = "${PKGDATA_DIR}/nativesdk-shlibs2"
 
 cross_canadian_bindirlinks () {
-	for i in ${CANADIANEXTRAOS}
+	for i in linux ${CANADIANEXTRAOS}
 	do
-		d=${D}${bindir}/../${TARGET_ARCH}${TARGET_VENDOR}-$i
-		install -d $d
-		for j in `ls ${D}${bindir}`
+		for v in ${CANADIANEXTRAVENDOR}
 		do
-			p=${TARGET_ARCH}${TARGET_VENDOR}-$i-`echo $j | sed -e s,${TARGET_PREFIX},,`
-			ln -s ../${TARGET_SYS}/$j $d/$p
+			d=${D}${bindir}/../${TARGET_ARCH}$v-$i
+			if [ -d $d ];
+			then
+			    continue
+			fi
+			install -d $d
+			for j in `ls ${D}${bindir}`
+			do
+				p=${TARGET_ARCH}$v-$i-`echo $j | sed -e s,${TARGET_PREFIX},,`
+				ln -s ../${TARGET_SYS}/$j $d/$p
+			done
 		done
        done
 }



