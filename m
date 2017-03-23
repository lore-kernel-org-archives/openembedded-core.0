Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id D3C0772F71
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 12:11:54 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id x124so16190544wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 05:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7kXfXpZEHi2jWVa03fku6H8LAjw3xJKlvtGXqa6sHlU=;
	b=O94CxrcrUj1hyqAfKVRYaZCR0ulUI4aiuNb9EzkYQanYA/3IEHAdzN1Ei5pALtEOJT
	HlHKWJIYTi5PupyRu18KLxGPOt3EDLVoCWv/8OVGepJMMBKBXPDAdwDqhedSRYmOg2qo
	shnzjDkSXJlgujHv3vRVQLLVJsjlZa0M1cCLoGPweprcn7M302Q/K/QK9W3Lm/9+wcFt
	THeQiMKhSt8AMVBxbZc5h6T2Q8xLSp+MVnh4RAaz5Y1FlBZ9+F8JbgJlRQVz+aCjnb6Q
	Q7Q+Hj9qeTl+1dKyi1AlkageiD0mbOhRFt+1y/yFuCfbbyFpX3iJkUguX6brTuzs/EUe
	Wvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7kXfXpZEHi2jWVa03fku6H8LAjw3xJKlvtGXqa6sHlU=;
	b=Z5d01jdMVm4brLClOj5A4maGDRKUl+uIO9d5Cokw+1889/Ffs2McpIW/hPct5yLmYA
	TKr9xGU8NAELEWWRFRzhVByoDuJ3tff7NZ5ayKQ+kwQMcgmTE6iwFq8cuzlHklLa3Ub2
	mid/JvO/gZLa4oD+8blgPbLwcBYefd5ZTptmrx5zwwF7TXMeDT2oQ/iG2mLscu3DU5DH
	CHSei5TKx4X4q/fLg7wSDbVyy+PLnsx1uWOPXZcr0UcX8BfCTfGEhPodVJikXhb+PTRk
	Ch43cI9uOuoPIyy5GeZ3DWNmcB/yVEPLHC53Mw+lzCRjenrXf8EvcraKHlTmAcCO/UCT
	cfJQ==
X-Gm-Message-State: AFeK/H1qf6wwgSRyTk8JnNMBJimSVnkpSSiNtgNL5O7PHcBBCkykP+JPwYs8xdqKmwVDaw==
X-Received: by 10.28.191.24 with SMTP id p24mr12636301wmf.118.1490271115094;
	Thu, 23 Mar 2017 05:11:55 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.217.162]) by smtp.gmail.com with ESMTPSA id
	k190sm4093773wmg.10.2017.03.23.05.11.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Mar 2017 05:11:54 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Mar 2017 13:11:12 +0100
Message-Id: <1490271075-3490-2-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1490271075-3490-1-git-send-email-liu.ming50@gmail.com>
References: <1490271075-3490-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH V4 1/4] kernel.bbclass: fix some incorrect inter-task dependencies
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
X-List-Received-Date: Thu, 23 Mar 2017 12:11:55 -0000

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


