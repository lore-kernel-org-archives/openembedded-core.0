Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 71D816FF84
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 00:30:59 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id pv5so24097410pac.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jan 2016 16:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=nHwoTKLXkS7ddT1nWpO/Od1donLxhIndTikkWJoQTy4=;
	b=D0BS6rZdID1fnBQVbjJfUIjQiT3LCfi2u3zWZhbWxMUxGqFt0UYrY4V/UPmLhRRCZJ
	Q+g+qbNYlgXg6K4pP/mqiqjzXAoKjTvjnBM71tg83jMYL3au21bRxmaamC3Xv+GEl62I
	4ymM2uddRUWVDpE5f+BdgS+4zBCeYJWONsTeXjc1yi+1ITo05+d8JMtvijCCNm78vXiT
	V5dUZ6xBx6svmSMYggobZ+Ay17toWqKgVFLpISP7YCwsSdpU2qXUC7H1EcYglhgQp93B
	7lN6pRJHdebrW0atAlvcjHD9cFT9W0OdMRITOfhc9YU0IIkEXVjosxQTazZ+yKEcMJzU
	dEAg==
X-Received: by 10.66.234.200 with SMTP id ug8mr93827995pac.129.1452385860126; 
	Sat, 09 Jan 2016 16:31:00 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	f12sm109237802pat.20.2016.01.09.16.30.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 16:30:55 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 21AF0FCC83B; Sat,  9 Jan 2016 16:30:49 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jan 2016 16:30:32 -0800
Message-Id: <773aad933fc58d29a436bcbe52d18b70d418e9be.1452385571.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452385571.git.akuster808@gmail.com>
References: <cover.1452385571.git.akuster808@gmail.com>
In-Reply-To: <cover.1452385571.git.akuster808@gmail.com>
References: <cover.1452385571.git.akuster808@gmail.com>
Subject: [PATCH 06/20] image.bbclass: don't let do_rootfs depend on BUILDNAME
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
X-List-Received-Date: Sun, 10 Jan 2016 00:31:00 -0000

From: Chen Qi <Qi.Chen@windriver.com>

BUILDNAME is set by cooker as a string of current time. Letting do_rootfs
task depend on this variable gets us no benefit. Besides, letting do_rootfs
task depend on this variable will cause us trouble when executing
`bitbake -S none core-image-minimal'. With current code, this command
gives us error complaining about the different bashhash of do_rootfs task.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
1.9.1


