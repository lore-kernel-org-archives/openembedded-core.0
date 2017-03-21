Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 57C4971AFC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 00:55:20 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id z133so346225wmb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 17:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/gavGTsa1yHDmGwX7OKNGEoTXuFgG2XnLBHDoWMDG5U=;
	b=suZf7Rr63L5UtXhWR8goJbvTx2VqUu7WsEnN/6iQHaUOu/aDXcXbGcJqAlYMMKJCHe
	lycRiG3l/EiN3JmhmRXZHeoABtTD6nJcTkOsci99Dj16uxL9zOJIFIgOQE5oS+CFP0vQ
	XdGsFSoRbstRMl0pPHWdJ2a+4nk4yCjMWyulIVuXfYlJOPtYdnvVOREeS173yYzTnd74
	73Bhp4EmLiEfMFN6PRKreMv/hhP/QNmOYZP4zgjdCzvCJBPuqzJsfN8TcaEojwq58ire
	kZBwxs5elj96Ym6jMpdGnpJSDXMZZgUo3s1NFnSwn5+Ezbv1DpFWuNgIYjbZFwXC0qdx
	lGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/gavGTsa1yHDmGwX7OKNGEoTXuFgG2XnLBHDoWMDG5U=;
	b=XyZ5PgppZa1lE82qXHUnx6vdAd066s2AI5Qc6a0wMAVyGaUZIatYVka9BWLuXiDaHk
	jMdL31Jugh4DULzUJ2hHB5XXmIR3mt2kQmJuk7muIaEwdm+yLBJEd8ezBTFm4VM/RAhS
	YX6o4k3UckpS36HhROeXvX1rXal5rQv4HILnsbS8xR8BKNf7WkNKLPwS6HwoaRTO7Bgy
	7qnb+Y3fsfvflutjdYRouhZfuEekyTjZd0D6TW93Dni8rLPR5iHC2Yyn5tVOGLa/N+xr
	aptAfBPWzcUTW1tODlHVuQb32LPuPIrB0aYeBVxPkhuewDa5eRjnOg8XVQuzt8p6+kMx
	/RrQ==
X-Gm-Message-State: AFeK/H2uiIi5wVBa8MkQ//T0gl0X8KWXWIRTXfklWwazFpkbFrnGrcQGKM9bemX2agVhgA==
X-Received: by 10.28.236.209 with SMTP id h78mr275047wmi.97.1490057722048;
	Mon, 20 Mar 2017 17:55:22 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([223.104.101.84])
	by smtp.gmail.com with ESMTPSA id 10sm8882258wrz.44.2017.03.20.17.55.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Mar 2017 17:55:21 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Mar 2017 01:54:59 +0100
Message-Id: <1490057703-12819-2-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1490057703-12819-1-git-send-email-liu.ming50@gmail.com>
References: <1490057703-12819-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH 1/5] kernel.bbclass: fix some incorrect inter-task dependencies
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
X-List-Received-Date: Tue, 21 Mar 2017 00:55:21 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

- Move the addtask statment that kernel_link_images needs run after
  do_compile from linux-yocto.inc to kernel.bbclass. Or else the recipes
  that inheriting kernel.bbclass might run into implicit dependency
  issues.
- Fix a typo, "addtask do_strip" should be "addtask strip".
- Remove some redundant addtask statments, when "addtask A after B" is
  set, then "addtask B before A" is not needed.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/kernel.bbclass               | 5 +++--
 meta/recipes-kernel/linux/linux-yocto.inc | 1 -
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 1e0646a..d39fa24 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -538,6 +538,7 @@ do_kernel_link_images() {
 		ln -sf ../../../vmlinuz.bin
 	fi
 }
+addtask kernel_link_images after do_compile
 
 do_strip() {
 	if [ -n "${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}" ]; then
@@ -566,7 +567,7 @@ do_strip() {
 }
 do_strip[dirs] = "${B}"
 
-addtask do_strip before do_sizecheck after do_kernel_link_images
+addtask strip before do_sizecheck after do_kernel_link_images
 
 # Support checking the kernel size since some kernels need to reside in partitions
 # with a fixed length or there is a limit in transferring the kernel to memory
@@ -586,7 +587,7 @@ do_sizecheck() {
 }
 do_sizecheck[dirs] = "${B}"
 
-addtask sizecheck before do_install after do_strip
+addtask sizecheck before do_install
 
 KERNEL_IMAGE_BASE_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
 # Don't include the DATETIME variable in the sstate package signatures
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 556546f..637506a 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -65,6 +65,5 @@ do_install_append(){
 
 # extra tasks
 addtask kernel_version_sanity_check after do_kernel_metadata do_kernel_checkout before do_compile
-addtask kernel_link_images after do_compile before do_strip
 addtask validate_branches before do_patch after do_kernel_checkout
 addtask kernel_configcheck after do_configure before do_compile
-- 
2.7.4


