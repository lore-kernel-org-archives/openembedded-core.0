Return-Path: <martin.jansa@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id D869460655
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 22:18:59 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id kp6so1159420pab.35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 15:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=CkLKeL4gY+K38PgUz8S+L080XU2HhPcnmxKd/Q2e6z0=;
	b=K5JtKVVDu+Lz7oGXquMPxFqRTTL+d9Z+m0alBUpZM8f2PxGuS1gY+GY1p0BvCoq3hH
	lE1m5VhcCGp2StJBlrTcwvGNEqCvxLkDHJWY7lqxRyrQ6LAjRGRmr9CjzUt+CbNuTOSs
	WTSB2BpTPgX7OK6vfcu0gNYyunYCMhIOrmTcKragpfP+Zs1yzcgGXYzksCRxp8BQn/Ua
	R8tf3V2bPaWxTBgh3fY4HcinYFXuyymumLf1vROQ2ugQgE1rc96uT87iyzPRRSBEe7qn
	29pz+Ik6B2MkYRvAJi4krN6uGRnK8m3VJD6l+JOiVzT1yIJs+Ch3AJ2W4XEzF9T3Jbrp
	d65A==
X-Received: by 10.66.89.65 with SMTP id bm1mr5166876pab.179.1369174741076;
	Tue, 21 May 2013 15:19:01 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	nt2sm4293947pbc.17.2013.05.21.15.18.58 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 21 May 2013 15:19:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 May 2013 00:18:53 +0200
Message-Id: <1369174733-25584-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <20130521221615.GG32431@jama>
References: <20130521221615.GG32431@jama>
Subject: [PATCH] kernel: Remove unnecessary cd and rm, fix MODULE_TARBALL_SYMLINK_NAME creation
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
X-List-Received-Date: Tue, 21 May 2013 22:18:59 -0000

* DEPLOYDIR is used as target for every other file deployed by do_deploy,
  this was just unnecessary switching CWD to create relative symlink and I
  have no idea why rm -f was used together with ln -sf.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel.bbclass | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 3320747..5a4f4ea 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -375,16 +375,13 @@ kernel_do_deploy() {
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		mkdir -p ${D}/lib
 		tar -cvzf ${DEPLOYDIR}/${MODULE_TARBALL_BASE_NAME} -C ${D} lib
-		ln -sf ${MODULE_TARBALL_BASE_NAME}.bin ${MODULE_TARBALL_SYMLINK_NAME}
+		ln -sf ${MODULE_TARBALL_BASE_NAME}.bin ${DEPLOYDIR}/${MODULE_TARBALL_SYMLINK_NAME}
 	fi
 
-	cd ${DEPLOYDIR}
-	rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.bin
-	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGE_SYMLINK_NAME}.bin
-	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGETYPE}
+	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${DEPLOYDIR}/${KERNEL_IMAGE_SYMLINK_NAME}.bin
+	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${DEPLOYDIR}/${KERNEL_IMAGETYPE}
 
 	cp ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
-	cd -
 }
 do_deploy[dirs] = "${DEPLOYDIR} ${B}"
 do_deploy[prefuncs] += "package_get_auto_pr"
-- 
1.8.2.1


