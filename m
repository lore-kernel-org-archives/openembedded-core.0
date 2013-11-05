Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 88CD96D6EE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2013 22:10:44 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA5MAeXt005600 for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Nov 2013 22:10:40 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id FqU98gnzKBiH
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2013 22:10:40 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA5MAYtO005596
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Nov 2013 22:10:36 GMT
Message-ID: <1383689430.6271.182.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 05 Nov 2013 22:10:30 +0000
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] toolchain-scripts: Drop darwin8 code
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
X-List-Received-Date: Tue, 05 Nov 2013 22:10:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The code was clearly broken and isn't used, even by meta-darwin so we
might as well remove it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index db0ae17..07e6fbf 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -34,13 +34,6 @@ toolchain_create_sdk_env_script () {
 	echo 'export M4=m4' >> $script
 	echo 'export TARGET_PREFIX=${TARGET_PREFIX}' >> $script
 	echo 'export CONFIGURE_FLAGS="--target=${TARGET_SYS} --host=${TARGET_SYS} --build=${SDK_ARCH}-linux --with-libtool-sysroot=$SDKTARGETSYSROOT"' >> $script
-	if [ "${TARGET_OS}" = "darwin8" ]; then
-		echo 'export TARGET_CFLAGS="-I$SDKTARGETSYSROOT'"$includedir"'"' >> $script
-		echo 'export TARGET_LDFLAGS="-L$SDKTARGETSYSROOT'"$libdir"'"' >> $script
-		# Workaround darwin toolchain sysroot path problems
-		cd ${SDK_OUTPUT}$SDKTARGETSYSROOT/usr
-		ln -s /usr/local local
-	fi
 	echo 'export CFLAGS="${TARGET_CFLAGS}"' >> $script
 	echo 'export CXXFLAGS="${TARGET_CXXFLAGS}"' >> $script
 	echo 'export LDFLAGS="${TARGET_LDFLAGS}"' >> $script
@@ -81,13 +74,6 @@ toolchain_create_tree_env_script () {
 	echo 'export NM=${TARGET_PREFIX}nm' >> $script
 	echo 'export TARGET_PREFIX=${TARGET_PREFIX}' >> $script
 	echo 'export CONFIGURE_FLAGS="--target=${TARGET_SYS} --host=${TARGET_SYS} --build=${BUILD_SYS} --with-libtool-sysroot=${STAGING_DIR_TARGET}"' >> $script
-	if [ "${TARGET_OS}" = "darwin8" ]; then
-		echo 'export TARGET_CFLAGS="-I${STAGING_DIR}${MACHINE}${includedir}"' >> $script
-		echo 'export TARGET_LDFLAGS="-L${STAGING_DIR}${MACHINE}${libdir}"' >> $script
-		# Workaround darwin toolchain sysroot path problems
-		cd ${SDK_OUTPUT}${SDKTARGETSYSROOT}/usr
-		ln -s /usr/local local
-	fi
 	echo 'export CFLAGS="${TARGET_CFLAGS}"' >> $script
 	echo 'export CXXFLAGS="${TARGET_CXXFLAGS}"' >> $script
 	echo 'export LDFLAGS="${TARGET_LDFLAGS}"' >> $script



