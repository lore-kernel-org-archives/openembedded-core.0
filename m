Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id D8AEE71758
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Oct 2014 21:53:31 +0000 (UTC)
Received: by mail-yk0-f170.google.com with SMTP id 20so1107126yks.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Oct 2014 14:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=oeerdzD67E2XaSZE2f4QIU5L/Mce7TSmKJiZWCT9E8o=;
	b=E7tyIMCJZL8WXtLIO+qjXnwDWhMFtZHmN4ruLNg2Xop3vf2HYxj3fqipib6Jz83ZSD
	Z5qeAaIZOUnuBRv391GFYSR/tZfzwUYHGi+WS4Bfj3PB+UUEpy9txpcGgqHiXYGJCXvW
	3ZqRdfo6UrdGy2y39W0fHZkz7ofv/RPTSl/5B6dZ6vxls8XKnS7HheMBj6AkXvKH93VU
	bAVjcXbSY/bYv44gY25UJIuMAqzVwZgFxiOHeAC6vTecaqcjUS9o0mUHRg37k3+Pz8Dg
	D/Mhmnr1e/OjD3dQY2MqK5ZAGDfkbRVlbsbQZr+fIVLoAmYQXq0fq3PG3Lrqqix9Rp/n
	T5Xg==
X-Received: by 10.236.83.132 with SMTP id q4mr1301108yhe.124.1412891612753;
	Thu, 09 Oct 2014 14:53:32 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.35.70.10])
	by mx.google.com with ESMTPSA id h92sm2048431yhq.21.2014.10.09.14.53.31
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Oct 2014 14:53:32 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu,  9 Oct 2014 18:53:14 -0300
Message-Id: <1412891594-9608-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1412891594-9608-1-git-send-email-otavio@ossystems.com.br>
References: <1412891594-9608-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] meta-toolchain-qt: Fix environment population
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
X-List-Received-Date: Thu, 09 Oct 2014 21:53:34 -0000

The generation of the environment has change since the change to use a
meta-environment canadian package in the OE-Core, the SDK environment
setting has been broken. This uses the new subscript environment to
fix it.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-qt/meta/meta-toolchain-qt.inc |   21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-qt/meta/meta-toolchain-qt.inc b/meta/recipes-qt/meta/meta-toolchain-qt.inc
index 53e5322..7e75d93 100644
--- a/meta/recipes-qt/meta/meta-toolchain-qt.inc
+++ b/meta/recipes-qt/meta/meta-toolchain-qt.inc
@@ -4,29 +4,32 @@ TOOLCHAIN_OUTPUTNAME = "${SDK_NAME}-toolchain-${QTNAME}-${DISTRO_VERSION}"
 
 require recipes-core/meta/meta-toolchain.bb
 
-QT_TOOLS_PREFIX = "${SDKPATHNATIVE}${bindir_nativesdk}"
+QT_TOOLS_PREFIX = "$OECORE_NATIVE_SYSROOT${bindir_nativesdk}"
 
-toolchain_create_sdk_env_script_append() {
-    echo 'export OE_QMAKE_CFLAGS="$CFLAGS"' >> $script
+create_sdk_files_append() {
+    mkdir -p ${SDK_OUTPUT}${SDKPATHNATIVE}/environment-setup.d/
+    script=${SDK_OUTPUT}${SDKPATHNATIVE}/environment-setup.d/${QT_DIR_NAME}.sh
+
+    echo 'export OE_QMAKE_CFLAGS="$CFLAGS"' > $script
     echo 'export OE_QMAKE_CXXFLAGS="$CXXFLAGS"' >> $script
     echo 'export OE_QMAKE_LDFLAGS="$LDFLAGS"' >> $script
     echo 'export OE_QMAKE_CC=$CC' >> $script
     echo 'export OE_QMAKE_CXX=$CXX' >> $script
     echo 'export OE_QMAKE_LINK=$CXX' >> $script
     echo 'export OE_QMAKE_AR=$AR' >> $script
-    echo 'export OE_QMAKE_LIBDIR_QT=${SDKTARGETSYSROOT}/${libdir}' >> $script
-    echo 'export OE_QMAKE_INCDIR_QT=${SDKTARGETSYSROOT}/${includedir}/${QT_DIR_NAME}' >> $script
+    echo 'export OE_QMAKE_LIBDIR_QT=$OECORE_TARGET_SYSROOT${libdir}' >> $script
+    echo 'export OE_QMAKE_INCDIR_QT=$OECORE_TARGET_SYSROOT${includedir}/${QT_DIR_NAME}' >> $script
     echo 'export OE_QMAKE_MOC=${QT_TOOLS_PREFIX}/moc4' >> $script
     echo 'export OE_QMAKE_UIC=${QT_TOOLS_PREFIX}/uic4' >> $script
     echo 'export OE_QMAKE_UIC3=${QT_TOOLS_PREFIX}/uic34' >> $script
     echo 'export OE_QMAKE_RCC=${QT_TOOLS_PREFIX}/rcc4' >> $script
     echo 'export OE_QMAKE_QDBUSCPP2XML=${QT_TOOLS_PREFIX}/qdbuscpp2xml4' >> $script
     echo 'export OE_QMAKE_QDBUSXML2CPP=${QT_TOOLS_PREFIX}/qdbusxml2cpp4' >> $script
-    echo 'export OE_QMAKE_QT_CONFIG=${SDKTARGETSYSROOT}/${datadir}/${QT_DIR_NAME}/mkspecs/qconfig.pri' >> $script
-    echo 'export QMAKESPEC=${SDKTARGETSYSROOT}/${datadir}/${QT_DIR_NAME}/mkspecs/linux-g++' >> $script
-    echo 'export QT_CONF_PATH=${SDKPATHNATIVE}/${sysconfdir}/qt.conf' >> $script
+    echo 'export OE_QMAKE_QT_CONFIG=$OECORE_TARGET_SYSROOT${datadir}/${QT_DIR_NAME}/mkspecs/qconfig.pri' >> $script
+    echo 'export QMAKESPEC=$OECORE_TARGET_SYSROOT${datadir}/${QT_DIR_NAME}/mkspecs/linux-g++' >> $script
+    echo 'export QT_CONF_PATH=$OECORE_NATIVE_SYSROOT${sysconfdir}/qt.conf' >> $script
 
     # make a symbolic link to mkspecs for compatibility with Qt SDK
     # and Qt Creator
-    (cd ${SDK_OUTPUT}/${QT_TOOLS_PREFIX}/..; ln -s ${SDKTARGETSYSROOT}/usr/share/${QT_DIR_NAME}/mkspecs mkspecs;)
+    (cd ${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/..; ln -s ${SDKTARGETSYSROOT}/usr/share/${QT_DIR_NAME}/mkspecs mkspecs;)
 }
-- 
1.7.10.4


