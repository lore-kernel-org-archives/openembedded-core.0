Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A9E836AC6C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 16:05:10 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6NG4VGh011282 for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 17:05:10 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 88wOKmvVvtWe
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 17:05:10 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6NG57nD013091
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 17:05:08 +0100
Message-ID: <1406131506.22985.125.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Jul 2014 17:05:06 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] toolchain-script: Really fix CANADIANEXTRAOE issues
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
X-List-Received-Date: Wed, 23 Jul 2014 16:05:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There was an error in the previous fix for the powerpc toolchain issue, this
should correct it (and simplify the code too).

[YOCTO #6490]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 413effe..6cc8eba 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -16,7 +16,7 @@ toolchain_create_sdk_env_script () {
 	echo 'export SDKTARGETSYSROOT='"$sysroot" >> $script
 	EXTRAPATH=""
 	for i in ${CANADIANEXTRAOS}; do
-		EXTRAPATH="$EXTRAPATH:"`echo ${SDKPATHNATIVE}${bindir_nativesdk}/${TARGET_SYS} | sed -e 's,${TARGET_PREFIX},${TARGET_PREFIX}$i,g'`
+		EXTRAPATH="$EXTRAPATH:${SDKPATHNATIVE}${bindir_nativesdk}/${TARGET_ARCH}${TARGET_VENDOR}-$i"
 	done
 	echo 'export PATH=${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNATIVE}${bindir_nativesdk}/${TARGET_SYS}'$EXTRAPATH':$PATH' >> $script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDKTARGETSYSROOT' >> $script



