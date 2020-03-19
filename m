Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id A795E60F32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 16:44:19 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id a9so72585wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 09:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=028+oElPlpdnMqOLa58lF8x4sM/HBneil+GrO6C3Nzs=;
	b=wqUkXPn8pKCz/ccUn6FOzianaf2fypruC+mkG+gF0FxSIn4G7ADVWgU5lZaqLV5uBg
	1HctVsg/oXS1qA/9mBDamHcan/tjPQADb5eTn2S6Tg7z9WUXxHi+vHKqnzkUNhu+LaGb
	Ju8Js9nGCsW79Z7JbxkL0Y9nxGK/Ufu5UFs/3H2jheeO7EVnDNc//HP0+bKx3jGBx5QG
	DG5KizJzmOFanqzNk5sftYhYUOviLZ6jGG0PyBdgDZNkR3E/Kd201yR9ovCLgM0yTxHW
	YwrQSZQovIEakNqYNz8vM8DpifRcpaMAv+8RZUe065nRozyIqC/nMuG6DPt+dW7NjQID
	pCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=028+oElPlpdnMqOLa58lF8x4sM/HBneil+GrO6C3Nzs=;
	b=Tx7MM8DG7Xt+2QzroCtg/h/TiMMat1DKfxePykSwgp7W0pzMPx8uiWkuhrWWPvYY2v
	0KC/AXqILy+YF/l33rql0FZ/ww5kXFUBL7Dv5upjePoswRUXoLUiDKNsx4X10cbqu2Vj
	xk4CmuREe02h/pAa8UQd+KTcYASrz9cOb/I1Jeyl2ayczUz1mrWDD5KBZn0LJBjIhNYH
	dqt/iXuvf9aTi8JGAXtdeXdIu7mJG7hPkbGIyth7/fgnZmO9iGjD76u4MqyhrdehSZiL
	PAu4K+T463EiNJebUAyvpNbw1bikOA3ZtYaSfaHkFWviqK+TM4rM1UhIhaCqDvU58shc
	RnnA==
X-Gm-Message-State: ANhLgQ2xbu6sfYNMCrDoBjkKR0PSh3Z5o309O9EU89VeVYWDgglv3ZQY
	FQS7nUPnZfl1IppU2aZu3wqZ0w==
X-Google-Smtp-Source: ADFU+vtoPGi8jQLezsda2RDMrhrPVIrGjaOPP2Eujjf1S7sNKIxlwVsf6VPSqAEm+JuaTr56vkeqmg==
X-Received: by 2002:a7b:ca41:: with SMTP id m1mr4526754wml.127.1584636260352; 
	Thu, 19 Mar 2020 09:44:20 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
	[2.15.156.232]) by smtp.gmail.com with ESMTPSA id
	b82sm3741970wmb.46.2020.03.19.09.44.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Mar 2020 09:44:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Armin Kuster <akuster808@gmail.com>, Jerome Neanne <jneanne@baylibre.com>,
	Quentin Schulz <quentin.schulz@streamunlimited.com>
Date: Thu, 19 Mar 2020 17:44:02 +0100
Message-Id: <20200319164403.29605-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200319164403.29605-1-brgl@bgdev.pl>
References: <20200319164403.29605-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 1/2] image.bbclass: add an intermediate deploy task
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
X-List-Received-Date: Thu, 19 Mar 2020 16:44:21 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Instead of using do_image_complete for both the deployment of image
artifacts into DEPLOY_DIR_IMAGE as well as calling the image
post-process commands, split the responsability between two separate
tasks: do_image_deploy will take care of the sstate deployment, while
do_image_complete will only do the post-processing. This way we can
make the dependencies more fine-grained.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 meta/classes/image.bbclass | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 07aa1f1fa5..6e2b864f73 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -144,7 +144,7 @@ python () {
             deps += " %s:%s" % (dep, task)
         return deps
 
-    d.appendVarFlag('do_image_complete', 'depends', extraimage_getdepends('do_populate_sysroot'))
+    d.appendVarFlag('do_image_deploy', 'depends', extraimage_getdepends('do_populate_sysroot'))
 
     deps = " " + imagetypes_getdepends(d)
     d.appendVarFlag('do_rootfs', 'depends', deps)
@@ -264,6 +264,17 @@ do_image[dirs] = "${TOPDIR}"
 do_image[umask] = "022"
 addtask do_image after do_rootfs
 
+do_image_deploy() {
+    # This is a placeholder really but it still needs to run for sstate
+    # to correctly deploy the image artifacts.
+    true
+}
+SSTATETASKS += "do_image_deploy"
+do_image_deploy[sstate-inputdirs] = "${IMGDEPLOYDIR}"
+do_image_deploy[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
+SSTATE_SKIP_CREATION_task-image-deploy = '1'
+addtask do_image_deploy after do_image before do_build
+
 fakeroot python do_image_complete () {
     from oe.utils import execute_pre_post_process
 
@@ -273,12 +284,8 @@ fakeroot python do_image_complete () {
 }
 do_image_complete[dirs] = "${TOPDIR}"
 do_image_complete[umask] = "022"
-SSTATETASKS += "do_image_complete"
-SSTATE_SKIP_CREATION_task-image-complete = '1'
-do_image_complete[sstate-inputdirs] = "${IMGDEPLOYDIR}"
-do_image_complete[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
 do_image_complete[stamp-extra-info] = "${MACHINE_ARCH}"
-addtask do_image_complete after do_image before do_build
+addtask do_image_complete after do_image_deploy before do_build
 python do_image_complete_setscene () {
     sstate_setscene(d)
 }
@@ -500,8 +507,8 @@ python () {
         d.appendVarFlag(task, 'vardeps', ' ' + ' '.join(vardeps))
         d.appendVarFlag(task, 'vardepsexclude', ' DATETIME DATE ' + ' '.join(vardepsexclude))
 
-        bb.debug(2, "Adding task %s before %s, after %s" % (task, 'do_image_complete', after))
-        bb.build.addtask(task, 'do_image_complete', after, d)
+        bb.debug(2, "Adding task %s before do_image_deploy, after %s" % (task, after))
+        bb.build.addtask(task, 'do_image_deploy', after, d)
 }
 
 #
-- 
2.19.1


