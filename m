Return-Path: <armccurdy@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id B8528737AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 19:47:08 +0000 (UTC)
Received: by pdbci14 with SMTP id ci14so59526380pdb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 12:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dLcF7JVxQL1Fruo0VU93EBu7jsFdxZ4pj66MvlPXZtc=;
	b=j8P/TjM5wD1NWgr23COGk3rR/VO1J+mE4IvZlWsvvfT0pmiec5g+9z49sSDG8f9Mfi
	qdiYZQIGYCdeHESKghyu2w2GoDRR6I28Eq1dFi1dEAms3P9rpIGEGiORyjqFyIdixhiA
	LSv0CNP8ttQebfk/ckE4+4bvrMmYQxpaBLxHa3ysZM3hje1ZhqNKfmWAFYRpGDvcBJmL
	gN7MYmC3JmiXV6jXmL2uDE6PKjmZQ6+T/iq/aPVRNTRfudN0re7dPkUKGtmTk3+xCgF/
	QdHINGYXgMdLmHM3xFLJch4xMAGycRrgWpNzHkNe7rI7MheAWS3ndFAGADbKJDRd+QFG
	He3g==
X-Received: by 10.68.250.194 with SMTP id ze2mr3065568pbc.24.1435261630045;
	Thu, 25 Jun 2015 12:47:10 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id
	i10sm30936327pdr.78.2015.06.25.12.47.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 25 Jun 2015 12:47:09 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jun 2015 12:46:47 -0700
Message-Id: <1435261607-2512-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1435261607-2512-1-git-send-email-armccurdy@gmail.com>
References: <1435261607-2512-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/3] populate_sdk_base.bbclass: use pbzip2 to compress SDK tarfiles
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
X-List-Received-Date: Thu, 25 Jun 2015 19:47:09 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/populate_sdk_base.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 781b279..a4a0193 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -40,7 +40,7 @@ TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
 TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
 
 SDK_RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
-SDK_DEPENDS = "virtual/fakeroot-native"
+SDK_DEPENDS = "virtual/fakeroot-native pbzip2-native"
 
 # We want the MULTIARCH_TARGET_SYS to point to the TUNE_PKGARCH, not PACKAGE_ARCH as it
 # could be set to the MACHINE_ARCH
@@ -121,13 +121,13 @@ fakeroot create_sdk_files() {
 	sed -i -e "s:##DEFAULT_INSTALL_DIR##:$escaped_sdkpath:" ${SDK_OUTPUT}/${SDKPATH}/relocate_sdk.py
 }
 
-SDKTAROPTS = "--owner=root --group=root -j"
+SDKTAROPTS = "--owner=root --group=root"
 
 fakeroot tar_sdk() {
 	# Package it up
 	mkdir -p ${SDK_DEPLOY}
 	cd ${SDK_OUTPUT}/${SDKPATH}
-	tar ${SDKTAROPTS} -c --file=${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2 .
+	tar ${SDKTAROPTS} -cf - . | pbzip2 > ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2
 }
 
 fakeroot create_shar() {
-- 
1.9.1


