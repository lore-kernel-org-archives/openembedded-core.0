Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Qudin-00048V-HC
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Aug 2011 07:03:49 +0200
Received: by mail-yw0-f47.google.com with SMTP id 12so1631876ywa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 21:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=0ffeV02H12/PRoxshDifLFJl+uV7KAT8+d9RXTvx0O8=;
	b=RenXWyYifBzvCb/l1Cw6Xh55tOHysijo8bzF31EhYB36mG4YY0Ci8SGmTBfZdbHxSg
	qQTeXhBfi+a3TbKYepgucHBj5pWCkuX2FQTRYIgHvoR43nRCX1/K2HuKtfUOCR8p+Gq0
	sr0W/4lKFDMZ9n2pyuVM2YX0TKxjoa1RgDfos=
Received: by 10.236.173.129 with SMTP id v1mr780944yhl.25.1313816350269;
	Fri, 19 Aug 2011 21:59:10 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id f48sm4668774yhh.56.2011.08.19.21.59.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Aug 2011 21:59:09 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Sat, 20 Aug 2011 04:58:43 +0000
Message-Id: <7fbda567f12cd48df2dc292b370109681ce39cfb.1313816148.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1313816148.git.otavio@ossystems.com.br>
References: <cover.1313816148.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1313816148.git.otavio@ossystems.com.br>
References: <cover.1313816148.git.otavio@ossystems.com.br>
Subject: [PATCH 5/8] fix SDK building due TARGET_ARCH use in installation path
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 20 Aug 2011 05:03:49 -0000

TARGET_ARCH makes the building too fragile since it changes during
building of target and nativesdk binaries thus making it difficult to
handle a proper path for installation of binaries. The fix for it is
to move it to toolchain tarball name.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/populate_sdk.bbclass |    2 +-
 meta/conf/bitbake.conf            |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk.bbclass b/meta/classes/populate_sdk.bbclass
index 0f3591b..929f730 100644
--- a/meta/classes/populate_sdk.bbclass
+++ b/meta/classes/populate_sdk.bbclass
@@ -9,7 +9,7 @@ SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${TARGET_SYS}"
 
 TOOLCHAIN_HOST_TASK ?= "task-sdk-host-nativesdk task-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 TOOLCHAIN_TARGET_TASK ?= "task-core-standalone-sdk-target task-core-standalone-sdk-target-dbg"
-TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${DISTRO_VERSION}"
+TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-${SDK_ARCH}-${TARGET_ARCH}-toolchain-${DISTRO_VERSION}"
 
 RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
 DEPENDS = "virtual/fakeroot-native sed-native"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b309516..b5c6696 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -361,7 +361,7 @@ DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/tools"
 
 PKGDATA_DIR = "${TMPDIR}/pkgdata/${MULTIMACH_TARGET_SYS}"
 
-SDK_NAME = "oecore-${SDK_ARCH}-${TARGET_ARCH}"
+SDK_NAME = "oecore-sdk-${DISTRO}"
 SDKPATH = "/usr/local/${SDK_NAME}"
 SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
 
-- 
1.7.2.5



