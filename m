Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0D5357777D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 14:35:08 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id l37so22642515wrc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 07:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/gavGTsa1yHDmGwX7OKNGEoTXuFgG2XnLBHDoWMDG5U=;
	b=VDQxJT9kiINC6zVJExbKxbfCj2MQmLyYOwGVl20yuTAJj9toMrpLBX/CCpSkS+Cz1+
	oB+/FgICqhx6T+C0r5DRh175xq4oC/DYKgSfTvzsWMT9sHe11ioAaxkIuOqbnCvGboKb
	yrJgWqfosLLhcKuKxccHSx91jE9ze8hcPBSmZL0RkisgQ6TvZl1YFhjW0keu95ssGwzd
	Us9kLk3RF7PyluK3q+g/wgstCI6m19TwudIeRBkmSjAKHCsP0Ikwd63RBwamx3mVHGha
	WMrKINC7my+xB6FCcBFlDpjQHiBYXHHqL+c7XT3QBA12tvJxmiNWJMRn2E2mF0e5W3U5
	uyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/gavGTsa1yHDmGwX7OKNGEoTXuFgG2XnLBHDoWMDG5U=;
	b=kX2KK+t8iVsYII1FWVh96y4g7l0GbdxmnYk2SqE/490LaTrBaGGTHHUZx/4w/7PnpK
	b5iG2CrZt2FdTCKel9p6Om3dNzKAD7nOly+LRScbzqoXBpct7coLYLxdkkTu8weMqOA6
	2x3/9ZHJWL+wONi+ZPLJEON3riDsy6SJmDgZs3CB9S4L74tnbI2bHFb0n0C1G2+8Su/5
	medaLQxpSE9pmr/y32dmShSerBXJpoUo0xHmq/om+6KQqClUvBWdojOI9afG1R7Kvrki
	0ClDBha4aRlgso09JIlGTOx+se3R/GrGAc1QS4sP0dCda/jfgVSBrUCrGctNKc5irWWA
	6mOQ==
X-Gm-Message-State: AFeK/H2ypK8MmUMKfcdaNBJo3vpStUHdw8buQIB3kICYjKKsrQoMGLXCXuXybpZKwQKOBw==
X-Received: by 10.223.152.73 with SMTP id v67mr30058444wrb.78.1490106909591;
	Tue, 21 Mar 2017 07:35:09 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.217.162]) by smtp.gmail.com with ESMTPSA id
	u41sm25225692wrc.24.2017.03.21.07.35.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Mar 2017 07:35:09 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Mar 2017 15:34:48 +0100
Message-Id: <1490106891-13909-2-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1490106891-13909-1-git-send-email-liu.ming50@gmail.com>
References: <1490106891-13909-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH 1/4] kernel.bbclass: fix some incorrect inter-task dependencies
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
X-List-Received-Date: Tue, 21 Mar 2017 14:35:09 -0000

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


