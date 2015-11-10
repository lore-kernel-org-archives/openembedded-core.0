Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 20E9776294
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 09:07:13 +0000 (UTC)
Received: by wmww144 with SMTP id w144so66269478wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 01:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=o/kcmwq29SoVSrgFB4qVgXScFB1y84gxk1dkmQo0B8E=;
	b=PdHErxw3ahE6AN2NL49Bs3bWA9aw3j8Xv06+I/r+hvH/uS1hCWexoa9dCeimQ/3/0G
	g7Zo/909LO2o+UPsO1IldciPR1P7DIPhBUdm38+Hs3jKYrdeFN+pbLZJ5JGQnAnqnV1I
	UYUtTdeVM2KpCedwC9d9aig2VxdX4feTvjdG1XgdyX9+pUsTBIvLtFFzmueue+stCoRu
	cpiK4bPgvlcOKwKOulXOnB88KOchWKMN/Mkwu2eWKswzHozDbLJoV/XJLizJd15A0uWX
	x6U06ro+gXQosyF+pAaWklXYO3Z4bZP7joRw8ec4MEqJw8h9GSNRNdYbfGmVpxEDjoUZ
	gO3g==
X-Received: by 10.194.7.97 with SMTP id i1mr2970579wja.87.1447146433136;
	Tue, 10 Nov 2015 01:07:13 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id h4sm2328176wjx.41.2015.11.10.01.07.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Nov 2015 01:07:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Nov 2015 10:07:16 +0100
Message-Id: <1447146436-1296-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1447145891-13916-1-git-send-email-Martin.Jansa@gmail.com>
References: <1447145891-13916-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][dizzy] image.bbclass: don't let do_rootfs depend on BUILDNAME
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
X-List-Received-Date: Tue, 10 Nov 2015 09:07:15 -0000

From: Chen Qi <Qi.Chen@windriver.com>

BUILDNAME is set by cooker as a string of current time. Letting do_rootfs
task depend on this variable gets us no benefit. Besides, letting do_rootfs
task depend on this variable will cause us trouble when executing
`bitbake -S none core-image-minimal'. With current code, this command
gives us error complaining about the different bashhash of do_rootfs task.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 1c0fda7..c0f9775 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -94,7 +94,7 @@ def rootfs_variables(d):
                  'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_LINK_NAME','IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','RM_OLD_IMAGE','IMAGE_FSTYPES','IMAGE_INSTALL_COMPLEMENTARY','IMAGE_LINGUAS','SDK_OS',
                  'SDK_OUTPUT','SDKPATHNATIVE','SDKTARGETSYSROOT','SDK_DIR','SDK_VENDOR','SDKIMAGE_INSTALL_COMPLEMENTARY','SDK_PACKAGE_ARCHS','SDK_OUTPUT','SDKTARGETSYSROOT','MULTILIBRE_ALLOW_REP',
                  'MULTILIB_TEMP_ROOTFS','MULTILIB_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIANTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS','PACKAGE_ARCHS',
-                 'PACKAGE_CLASSES','TARGET_VENDOR','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI','INTERCEPT_DIR','BUILDNAME','USE_DEVFS',
+                 'PACKAGE_CLASSES','TARGET_VENDOR','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI','INTERCEPT_DIR','USE_DEVFS',
                  'STAGING_KERNEL_DIR','COMPRESSIONTYPES']
     variables.extend(command_variables(d))
     variables.extend(variable_depends(d))
-- 
2.6.2


