Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 45B78719A4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 18:49:39 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id s8so5591495pfj.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 11:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=wGQwcEFdDYJfkzVEdFN6YXHHrYOAgAx/xHb9fINhGuk=;
	b=L/71xgT/fuWEwm1KXV6CKDXSdOrGfe/kwkv6YScZaJzCGfs1FbG5D8bEGihCqUwukK
	bBDJ4USiawpyiNA/A3rFF6CjToOvP2/iEdZhqFlI173/af0OrDbtD7e41g7Tu/ZEzcwK
	7SYtyIN9H4dH09/ngmQ/ME69S8/AxtpLbPJHSuOAv+aizkWxTvjb40zWcORdTEkjg92j
	O+6GTM45mwXKXdUg0DBEntF8EqE8ppW7iXjZnvOpeUwKgIrUizLD8oawnuxkPlUJunZv
	WjMEFlfq70D4TLpchUYyH+ozSBB0Ll6AKNkXHrCZ0SXKHt0sh+cpFFWeN8FaJokMproN
	RHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wGQwcEFdDYJfkzVEdFN6YXHHrYOAgAx/xHb9fINhGuk=;
	b=G49ayZWFb1y+TdpgfOStWnaxojpp7EBiZZQAcycYQaNifwbbDPqL71X0qY094fwUrq
	mU2x4OYTYITiPeLnRuqGsqd3Cu7VsJWzcqC+WH/yOF+FEWQtiOUrm0h8zcFZRELJm1iq
	sWFVi9AmiHuAF/JEtfSLzjwQL0vZIKzozzAlUd2miSDAtZY4V8ZNizhZwWLjv1tRSOQm
	wiKPAmCQyKslJFY64xArxuHnYE+yV470LnM+IGE5DfaMrutTC5ZUJyWrkk9PY0S8DX9u
	KKKWAvMxz2iOJM1wtYIloamcCJn//hm4PWbbmF8E7RoEu5YcGvVKBpiaxoCv3ZelKykt
	ql7g==
X-Gm-Message-State: AA6/9Rk1q/14m32QFYABzM++sxeX6pGXtpKxgPRd/+NYqkXpR8TVVc5jWm3UkAYGvCTZ1w==
X-Received: by 10.99.129.65 with SMTP id t62mr10196186pgd.114.1476384581213;
	Thu, 13 Oct 2016 11:49:41 -0700 (PDT)
Received: from e6520.adbgroup.pl
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	f2sm21405689pfj.68.2016.10.13.11.49.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Oct 2016 11:49:39 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2016 11:49:33 -0700
Message-Id: <1476384573-29506-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] linux-yocto.inc: ensure do_kernel_link_images runs before do_strip
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
X-List-Received-Date: Thu, 13 Oct 2016 18:49:40 -0000

If the do_kernel_link_images task is enabled, then it needs to run
before do_strip. The addtask statement for do_strip makes that
explicit. For consistency, make it explicit in the addtask statement
for do_kernel_link_images too.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index d8d4387..09cd1f1 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -65,6 +65,6 @@ do_install_append(){
 
 # extra tasks
 addtask kernel_version_sanity_check after do_kernel_metadata do_kernel_checkout before do_compile
-addtask kernel_link_images after do_compile before do_install
+addtask kernel_link_images after do_compile before do_strip
 addtask validate_branches before do_patch after do_kernel_checkout
 addtask kernel_configcheck after do_configure before do_compile
-- 
1.9.1


