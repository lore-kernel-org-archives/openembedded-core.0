Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QgKKX-0005ls-7t
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jul 2011 19:31:37 +0200
Received: by gxk3 with SMTP id 3so1687388gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2011 10:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=AijY0LG8lbSQr9iqA7Xwupl21CIAA71QEHCpgq0Fhd8=;
	b=cvde0jl9HjDtg4IS1f0cEPg7eQ6HloRmxACh1sRxumXiU+tLnxtZiy5tUw4fG0LuaZ
	rKh7iZnQtIeItFjFjm0KZCBxRrkkpUwqQSf7K+Lyy5WjzaYj3jnHbAgtt+U+ZCXS9mll
	s1zHyzUxWtW9/PVlB6XtVMKblXt187drB/Uos=
Received: by 10.147.14.1 with SMTP id r1mr4128154yai.3.1310405260671;
	Mon, 11 Jul 2011 10:27:40 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id z28sm3592901yhn.35.2011.07.11.10.27.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jul 2011 10:27:39 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2011 17:27:17 +0000
Message-Id: <ee392d20ccf089009a261902e40430ad4347388c.1310405202.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1310405202.git.otavio@ossystems.com.br>
References: <cover.1310405202.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1310405202.git.otavio@ossystems.com.br>
References: <cover.1310405202.git.otavio@ossystems.com.br>
Subject: [PATCH 3/5] fix SDK building due TARGET_ARCH use in installation path
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
X-List-Received-Date: Mon, 11 Jul 2011 17:31:37 -0000

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
index 089ed9a..03b6d0f 100644
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
index 463991d..eeb29a7 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -341,7 +341,7 @@ DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/tools"
 
 PKGDATA_DIR = "${TMPDIR}/pkgdata/${MULTIMACH_TARGET_SYS}"
 
-SDK_NAME = "oecore-${SDK_ARCH}-${TARGET_ARCH}"
+SDK_NAME = "oecore-sdk-${DISTRO}"
 SDKPATH = "/usr/local/${SDK_NAME}"
 SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
 
-- 
1.7.2.5



