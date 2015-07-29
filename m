Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9546976424
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 21:54:20 +0000 (UTC)
Received: by padck2 with SMTP id ck2so11955710pad.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 14:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gCWMRTMMu6a9RtUMWjGrdUIpUwj1Q9/rWQvd6xRRVOE=;
	b=I8Cb7zgEf/JqI84mTcLplYw+yEjm9mPL1wXmQsCqbA8+Ni16dF0BpmNCYYZNquOjNn
	TGEqL92eAm+/3EOIczNeH79oAG/5+pj4EkXr7yh703jQ2cDXXdrHfb6/SSnbjmy63n3p
	2VQR0vvlDtuq4uoQbmi/L6Yr6jRITPWauaucVYYuzReAq/Qkuoi8jeR9FPDtVeDEGrZq
	KvJEFcNg8EqLLBz7A+QceJ86bbiuq4/8ctifrkSOVVkxthMv3ifEpwAVQH8A2ZXHlpR1
	3OPVTsxF2BBKsNnicGk2IThWkwYRLh/Jses7m1Tn+YzKVE1BzovX4LvmmiGtASRdQ7gx
	oREg==
X-Received: by 10.66.66.166 with SMTP id g6mr96922974pat.114.1438206861357;
	Wed, 29 Jul 2015 14:54:21 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	i5sm42780938pat.42.2015.07.29.14.54.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Jul 2015 14:54:19 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jul 2015 14:54:12 -0700
Message-Id: <e64dd77c8bbab29e1ba0b0b44e97e2e6a3393349.1438206555.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <cover.1438206555.git.chris_larson@mentor.com>
References: <cover.1438206555.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/3] populate_sdk_ext: use lnr, not ln -sr, for portability
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
X-List-Received-Date: Wed, 29 Jul 2015 21:54:21 -0000

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


