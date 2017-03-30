Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 119F2719AC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 07:59:07 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id k6so8357251wre.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 00:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=7kXfXpZEHi2jWVa03fku6H8LAjw3xJKlvtGXqa6sHlU=;
	b=BwjoEsg9RBf//2un4X7iExm3eU4Qjho/YNc5Ga/M7NaQUiHLIHzKxJSg4vN7jV43ub
	KP1oRpIpRz/OblmOLBOxgHuL07yB8xYjONvqn0eYmR/iAXB68wEZop+ytx+0MIH7a6yf
	yHk42TmLWdjJZVUlHO2tax7zb41OSxy1typzymjcoJTD+kCN3OIggug4o13mIzfzlmDe
	W1DPk8mxKEGTbQ2kZpScZapL5DCqGMUKssT91SyoxDEqsDJK4b+LZVtTH/25qIy7/hQW
	ber9zkf8A7Scd4i0BOtoWV6oz8HxnEcmH9K6Zy/i7mPd2vSneQFSUfP5G8l8MWykAVMV
	blLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7kXfXpZEHi2jWVa03fku6H8LAjw3xJKlvtGXqa6sHlU=;
	b=IlAmx+yClBQcMBbVK1ndrKRBFekKB6CGnzNDZqtn5iBf9mB7hO7rbpElaPqEcDkVr6
	PK/Rlul10HRySr5AM3xbu6ESokt/PcLg09g10wi7QttHqkLPUb2QMz8zzBZPiZMaUDeX
	QNh0ia89UU19wc8eoVA1gYCRvveU97K80NLyIUjHgdVOPRUgz9Kjm6NpZXyw+q3zx86d
	OpS/ewzam5+iHkgLS0Zdd3NmJ3j1/J+h9X4uEjw+l4pgo/cik3deSnfiJHhbnfmW7vj9
	FAoEiVLHu745fIYAT9vgV0uFLBw1G91W0BztnxEaazLwX/y2Zz5hmfvwuqLsO2OtTGk3
	dCKA==
X-Gm-Message-State: AFeK/H2u04rVv/+mxwiQmuU5C5iUsxoIJAQ7IcPTnbsEVwn8WgQu7n0zRBJsv8H5vnVzfw==
X-Received: by 10.28.86.68 with SMTP id k65mr2083058wmb.112.1490860748720;
	Thu, 30 Mar 2017 00:59:08 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.223.149]) by smtp.gmail.com with ESMTPSA id
	m90sm2149590wmi.34.2017.03.30.00.59.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Mar 2017 00:59:08 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 09:58:59 +0200
Message-Id: <1490860739-27953-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] kernel.bbclass: fix some incorrect inter-task dependencies
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
X-List-Received-Date: Thu, 30 Mar 2017 07:59:08 -0000

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
index 244087a..d175f1d 100644
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


