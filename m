Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id A7D7F6E668
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:46:27 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id c201so33835688wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=d/gsaKrafIT0s0O9lbIMtV8935ex0zt2IvVGmTHmD5I=;
	b=0lXCfC/8S1lWafaOaGCFvaqLgyUCWTK69opmTBK8Mh8iXT22kaybG2cv/HXZ2d37ho
	84eK7vMjuPZKkZFCD2FiCu+8pvPUVR/CRWXHCCs4IM3blqc6aPx7A1AaMtTLwEDEI8gr
	Q0WsQL3KgT71bOQjuSsY7qxyJOd2cDRQ9v9c4Eol6fGFNNNbsjHUSbJe9JwODN53eSYV
	25yYXwgDcdMZwtsT8ZPDFdFd2iBRm0BDh76DGJZ3B+c1H2Pqf+gBswRhqjwqA4NoeHt0
	rU1KEmni4UAGb+cPksPVtVf4LOQxkKTZzuxUZGcDSisCDq7pXnpPlpcBQAElys4y/OJ9
	E5PQ==
X-Received: by 10.194.63.142 with SMTP id g14mr12811650wjs.161.1449755187484; 
	Thu, 10 Dec 2015 05:46:27 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	l7sm12532906wjx.14.2015.12.10.05.46.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:46:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:48:00 +0100
Message-Id: <d884657262b275b54f6c5ab3b4cf489115c67e55.1449754336.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1449754336.git.Martin.Jansa@gmail.com>
References: <cover.1449754336.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1449754336.git.Martin.Jansa@gmail.com>
References: <cover.1449754336.git.Martin.Jansa@gmail.com>
Subject: [PATCH][dizzy][RESEND 2/7] image.bbclass: don't let do_rootfs depend on BUILDNAME
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
X-List-Received-Date: Thu, 10 Dec 2015 13:46:28 -0000

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
2.6.3


