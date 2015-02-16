Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CA0117340B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 16:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1GGODdv006290 for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 16:24:42 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id E1b7oFplJJ_i
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 16:24:42 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1GGOTKH006295
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 16:24:40 GMT
Message-ID: <1424103869.25541.1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Feb 2015 16:24:29 +0000
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] populate_sdk: Handle OLDEST_KERNEL
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
X-List-Received-Date: Mon, 16 Feb 2015 16:24:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Add a check to the SDK so that it only runs on systems with kernel versions
it supports.

[YOCTO #6856]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 8b7e9ea..e3adacb 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -126,6 +126,7 @@ EOF
 	# substitute variables
 	sed -i -e 's#@SDK_ARCH@#${SDK_ARCH}#g' \
 		-e 's#@SDKPATH@#${SDKPATH}#g' \
+		-e 's#@OLDEST_KERNEL@#${OLDEST_KERNEL}#g' \
 		-e 's#@REAL_MULTIMACH_TARGET_SYS@#${REAL_MULTIMACH_TARGET_SYS}#g' \
 		-e '/@SDK_POST_INSTALL_COMMAND@/d' \
 		${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
diff --git a/meta/files/toolchain-shar-template.sh b/meta/files/toolchain-shar-template.sh
index 4a7fbd5..64e87a2 100644
--- a/meta/files/toolchain-shar-template.sh
+++ b/meta/files/toolchain-shar-template.sh
@@ -3,6 +3,24 @@
 INST_ARCH=$(uname -m | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
 SDK_ARCH=$(echo @SDK_ARCH@ | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
 
+verlte () {
+	[  "$1" = "`printf "$1\n$2" | sort -V | head -n1`" ]
+}
+
+verlt() {
+	[ "$1" = "$2" ] && return 1 || verlte $1 $2
+}
+
+verlt `uname -r` @OLDEST_KERNEL@
+if [ $? = 0 ]; then
+	echo "Error: The SDK needs a kernel > @OLDEST_KERNEL@"
+	exit 1
+fi
+
+
+verlte `uname -r` 3.18.0 && echo "yes" || echo "no"
+verlte 4.16 3.18.0 && echo "yes" || echo "no"
+
 if [ "$INST_ARCH" != "$SDK_ARCH" ]; then
 	# Allow for installation of ix86 SDK on x86_64 host
 	if [ "$INST_ARCH" != x86_64 -o "$SDK_ARCH" != ix86 ]; then



