Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id A6F9677C17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 13:20:19 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id k6so10838127wre.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 06:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=raMwrDG3cgMCI4BlQJF804NNjw5t7v2Cr9/wF+JVcQY=;
	b=UkdvoqLjng45VZ3m+Mmu+JGn7S8VGqe+Gict9OiGeuJiWYuf8Nr83ru51CXhWeHmvL
	T/xDgwMYGBeyPXvrVlCYAVTWUBHNdpM/QeDTrwNRgBlrnP2jt1Np/dydLD+uT3f5aebM
	W6kTYbqyZ1NMsWPH3Uf2Hxu8lpYh4yO9AYgHCfH3pqSXy7LYeMn1s+LwwjKszWHmKJKH
	wNQYZ/HMKrFgb9V3Wv7xxELmLJH6wYdKIjiKxEpwZYxfeUswY28LbtmwGR9c33BOkImq
	E3tx2zeOst7GqPk/cyGbRQyqqhAtKHeECbCmafc0v9hUfzcXRl8D3YNunYqezcfJgnuY
	Uqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=raMwrDG3cgMCI4BlQJF804NNjw5t7v2Cr9/wF+JVcQY=;
	b=M2EOxhN/h4tj/WXsuRB8QOkJUfTRtMgF/O2Qc6htDXbhmxBnWxO7uCqUoXuZV7q0fP
	7olepUtYnTE5jWNtEeoGL2s02AZw+gSWLwLSgE8NWvz/latx8riRYS3RHQlJn8Qnve+a
	jspMpAaGp2fwYt0+VKnlhden1cg1ZiUIuEWlIuNabSKdXSCmws7V8oclXAP8BouJvKXt
	1caADzhScC9VkJ3UXaVRVdjyBVSD6il/X09zqq5vqJyxHN0YsGimHQqELDjUSATc5ZCu
	ZR/jdaOJyUv82EXbW48NtqFCCxlP83g7ZzEAoCJZ0Twl/XCj+ZcZfjqqQB5tWzmPql0W
	LZyQ==
X-Gm-Message-State: AFeK/H1lsGxDDlKAOZuuMoNe1xFfkuYyxhL9uBayhSiwo5GN/EhXb6g4RSMerRYqAA092A==
X-Received: by 10.223.150.88 with SMTP id c24mr5424678wra.202.1490880020584;
	Thu, 30 Mar 2017 06:20:20 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.223.149]) by smtp.gmail.com with ESMTPSA id
	k203sm3252306wmk.4.2017.03.30.06.20.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Mar 2017 06:20:20 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 15:20:13 +0200
Message-Id: <1490880013-10149-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH V2] kernel.bbclass: move in addtask kernel_link_images statement from linux-yocto.inc
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
X-List-Received-Date: Thu, 30 Mar 2017 13:20:19 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Add kernel_link_images task in kernel.bbclass instead of adding it in
linux-yocto.inc, or else the recipes inheriting kernel.bbclass might
run into implicit dependency issues.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/kernel.bbclass               | 1 +
 meta/recipes-kernel/linux/linux-yocto.inc | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 244087a..bc09fba 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -538,6 +538,7 @@ do_kernel_link_images() {
 		ln -sf ../../../vmlinuz.bin
 	fi
 }
+addtask kernel_link_images after do_compile before do_strip
 
 do_strip() {
 	if [ -n "${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}" ]; then
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


