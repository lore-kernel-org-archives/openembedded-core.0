Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3D445762A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 13:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8TDQwNK004543 for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 14:27:59 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id sKywYpCrrEiU
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 14:27:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8TDRjMd004563
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 14:27:56 +0100
Message-ID: <1443533265.5162.35.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Sep 2015 14:27:45 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] linuxloader/image-prelink/image-mklibs: Fix non-standard path prelinking
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
X-List-Received-Date: Tue, 29 Sep 2015 13:28:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Prelinking on x86-64 wasn't working out the box as it uses /lib and
not /lib64 for libs. Prelink was refusing to link as the dynamic loader
didn't match its idea of the right path. Passing in the --dyanmic-linker
option avoids this.

We can share code from image-mklibs so abstract that into a new class,
linuxloader.bbclass.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/image-mklibs.bbclass b/meta/classes/image-mklibs.bbclass
index c455a8e..45a66fb 100644
--- a/meta/classes/image-mklibs.bbclass
+++ b/meta/classes/image-mklibs.bbclass
@@ -2,6 +2,8 @@ do_rootfs[depends] += "mklibs-native:do_populate_sysroot"
 
 IMAGE_PREPROCESS_COMMAND += "mklibs_optimize_image; "
 
+inherit linuxloader
+
 mklibs_optimize_image_doit() {
 	rm -rf ${WORKDIR}/mklibs
 	mkdir -p ${WORKDIR}/mklibs/dest
@@ -15,26 +17,8 @@ mklibs_optimize_image_doit() {
 		| sed "s+^\./++" \
 		> ${WORKDIR}/mklibs/executables.list
 
-	case ${TARGET_ARCH} in
-		powerpc | mips | mipsel | microblaze )
-			dynamic_loader="${base_libdir}/ld.so.1"
-			;;
-		powerpc64)
-			dynamic_loader="${base_libdir}/ld64.so.1"
-			;;
-		x86_64)
-			dynamic_loader="${base_libdir}/ld-linux-x86-64.so.2"
-			;;
-		i586 )
-			dynamic_loader="${base_libdir}/ld-linux.so.2"
-			;;
-		arm )
-			dynamic_loader="${base_libdir}/ld-linux.so.3"
-			;;
-		* )
-			dynamic_loader="/unknown_dynamic_linker"
-			;;
-	esac
+	# Set $dynamic_loader 
+        linuxloader
 
 	mklibs -v \
 		--ldlib ${dynamic_loader} \
diff --git a/meta/classes/image-prelink.bbclass b/meta/classes/image-prelink.bbclass
index d4bb3ae..4bb090d 100644
--- a/meta/classes/image-prelink.bbclass
+++ b/meta/classes/image-prelink.bbclass
@@ -2,6 +2,8 @@ do_rootfs[depends] += "prelink-native:do_populate_sysroot"
 
 IMAGE_PREPROCESS_COMMAND += "prelink_image; "
 
+inherit linuxloader
+
 prelink_image () {
 #	export PSEUDO_DEBUG=4
 #	/bin/env | /bin/grep PSEUDO
@@ -20,8 +22,11 @@ prelink_image () {
 		dummy_prelink_conf=false;
 	fi
 
+	# Set $dynamic_loader
+	linuxloader
+
 	# prelink!
-	${STAGING_DIR_NATIVE}${sbindir_native}/prelink --root ${IMAGE_ROOTFS} -amR -N -c ${sysconfdir}/prelink.conf
+	${STAGING_DIR_NATIVE}${sbindir_native}/prelink --root ${IMAGE_ROOTFS} -amR -N -c ${sysconfdir}/prelink.conf --dynamic-linker $dynamic_loader
 
 	# Remove the prelink.conf if we had to add it.
 	if [ "$dummy_prelink_conf" = "true" ]; then
diff --git a/meta/classes/linuxloader.bbclass b/meta/classes/linuxloader.bbclass
new file mode 100644
index 0000000..578df14
--- /dev/null
+++ b/meta/classes/linuxloader.bbclass
@@ -0,0 +1,23 @@
+
+linuxloader () {
+	case ${TARGET_ARCH} in
+		powerpc | mips | mipsel | microblaze )
+			dynamic_loader="${base_libdir}/ld.so.1"
+			;;
+		powerpc64)
+			dynamic_loader="${base_libdir}/ld64.so.1"
+			;;
+		x86_64)
+			dynamic_loader="${base_libdir}/ld-linux-x86-64.so.2"
+			;;
+		i586 )
+			dynamic_loader="${base_libdir}/ld-linux.so.2"
+			;;
+		arm )
+			dynamic_loader="${base_libdir}/ld-linux.so.3"
+			;;
+		* )
+			dynamic_loader="/unknown_dynamic_linker"
+			;;
+	esac
+}



