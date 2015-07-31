Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 529DF7663E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 15:19:18 +0000 (UTC)
Received: by pdrg1 with SMTP id g1so44313035pdr.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 08:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gCWMRTMMu6a9RtUMWjGrdUIpUwj1Q9/rWQvd6xRRVOE=;
	b=I2V1I2kTg6vxXiBbS+F4PbcLByobOyGXU3ehFM0PWkmzx5e0gSi6XZp88ZKrSCIJxg
	xgcnesnBZAemgAVh+3zhJnuUPxDZZQ98wkHYZnuAyc3RMvGLkarLZAaFPF/doDXcV179
	2l6zAAT7Jw6W3k09vWvIW9dqUb3KPfinABGyo1dZiQxrnhVd5TFKJ40Y4xqC1S4VfsRu
	24f2FHXFEo9+g9vhgtFfu5yx+8zs+25S73JGnTEz1pLllzLTgskEyIlsy2vd8RfPIqvP
	/BwQztQgZ/t6/M9xS1nT8VG8SEdbyjWyPxsMo/jDLB0H9ys4zkbeLqrVvXDXS5XpHih2
	Ll3A==
X-Received: by 10.70.50.165 with SMTP id d5mr8022812pdo.93.1438355959041;
	Fri, 31 Jul 2015 08:19:19 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id v9sm8225967pdr.96.2015.07.31.08.19.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 31 Jul 2015 08:19:18 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jul 2015 08:19:12 -0700
Message-Id: <746de2e112499d4a1188beea9aea9f96571183ac.1438355747.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <cover.1438355747.git.chris_larson@mentor.com>
References: <cover.1438355747.git.chris_larson@mentor.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 1/3] populate_sdk_ext: use lnr, not ln -sr, for portability
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
X-List-Received-Date: Fri, 31 Jul 2015 15:19:21 -0000

From: Christopher Larson <chris_larson@mentor.com>

Not all hosts are running sufficiently new coreutils.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/populate_sdk_ext.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index b28413b..0151468 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -164,8 +164,8 @@ python copy_buildsystem () {
 
 install_tools() {
 	install -d ${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}
-	ln -sr ${SDK_OUTPUT}/${SDKPATH}/${scriptrelpath}/devtool ${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/devtool
-	ln -sr ${SDK_OUTPUT}/${SDKPATH}/${scriptrelpath}/recipetool ${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/recipetool
+	lnr ${SDK_OUTPUT}/${SDKPATH}/${scriptrelpath}/devtool ${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/devtool
+	lnr ${SDK_OUTPUT}/${SDKPATH}/${scriptrelpath}/recipetool ${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/recipetool
 	touch ${SDK_OUTPUT}/${SDKPATH}/.devtoolbase
 
 	install ${SDK_DEPLOY}/${DISTRO}-${TCLIBC}-${SDK_ARCH}-buildtools-tarball-${TUNE_PKGARCH}-buildtools-nativesdk-standalone-${DISTRO_VERSION}.sh ${SDK_OUTPUT}/${SDKPATH}
-- 
2.2.1


