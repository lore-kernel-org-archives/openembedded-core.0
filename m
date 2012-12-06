Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Tga0L-0005LT-4z for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 12:52:37 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB6Bc9I4028352
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Dec 2012 11:38:09 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27771-03 for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Dec 2012 11:38:04 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB6Bbxtd028345
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Dec 2012 11:38:00 GMT
Message-ID: <1354793869.25268.173.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 06 Dec 2012 11:37:49 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] image/populate_sdk: Simplify imagetest inclusion and drop dummy class file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Dec 2012 11:52:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Having to include some dummy class is suboptimal and we no longer need to
do this. Also move this check to populate_sdk_base since we then don't
need to include it in toolchains specifically.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 7b24e4e..7311906 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -1,8 +1,5 @@
 inherit rootfs_${IMAGE_PKGTYPE}
 
-IMAGETEST ?= "dummy"
-inherit imagetest-${IMAGETEST}
-
 inherit populate_sdk_base
 
 TOOLCHAIN_TARGET_TASK += "${PACKAGE_INSTALL}"
diff --git a/meta/classes/imagetest-dummy.bbclass b/meta/classes/imagetest-dummy.bbclass
deleted file mode 100644
index bcacae6..0000000
--- a/meta/classes/imagetest-dummy.bbclass
+++ /dev/null
@@ -1 +0,0 @@
-# dummy testclass file
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index c15a4d4..3c448c3 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -1,6 +1,9 @@
 inherit meta toolchain-scripts
 inherit populate_sdk_${IMAGE_PKGTYPE}
 
+IMAGETESTCLASS = "${@oe.utils.ifelse(d.getVar('IMAGETEST'),'imagetest-' + (d.getVar('IMAGETEST') or ""),'')}"
+inherit ${IMAGETESTCLASS}
+
 SDK_DIR = "${WORKDIR}/sdk"
 SDK_OUTPUT = "${SDK_DIR}/image"
 SDK_DEPLOY = "${TMPDIR}/deploy/sdk"
diff --git a/meta/recipes-core/meta/meta-toolchain.bb b/meta/recipes-core/meta/meta-toolchain.bb
index 61f9d34..dccf394 100644
--- a/meta/recipes-core/meta/meta-toolchain.bb
+++ b/meta/recipes-core/meta/meta-toolchain.bb
@@ -6,5 +6,4 @@ PR = "r7"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-IMAGETEST ?= "dummy"
-inherit populate_sdk imagetest-${IMAGETEST}
+inherit populate_sdk




