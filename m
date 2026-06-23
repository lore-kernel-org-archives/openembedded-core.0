Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A998CDB470
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 17:30:32 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26662.1782235826157576698
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 10:30:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IxMDrYnn;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-51a1fe8f578so203181cf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 10:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782235825; x=1782840625; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5EJgkhLc+3d690QMnG11bJ//4e1wqfZqaxPvvQ/LGjI=;
        b=IxMDrYnnUkFwu/ZPBFK5rZXAav4gZklREEL5ytSEd9kdD0gbJgBo2+h/+7JwlrxeIW
         g2ILhhpcuOH+BgKjqxWtyK5oZbojRhpsqZX/1ziM275BHRP25nhCvz2Wrp1ATY62g0Mp
         SpsiJQr9RtCMA1IGiVkyfYUot76adwg0bNDt4y+udn4ZTUNbCBUzAJKTgcPMwNP/uX0U
         j+TT0X0ByJGaft7hcJ947wWfmqgZowD+8wxlWxBB9tpHz8xiK4EuulUWHCJt/9oONta3
         LkdJSsriZpbnfALJhFzgVKdRmr/J8uyFICdq3jMhAsF+hiEKaDSnYEeU/foD9xWcwSRa
         mXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782235825; x=1782840625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5EJgkhLc+3d690QMnG11bJ//4e1wqfZqaxPvvQ/LGjI=;
        b=cflYmktvZtag4B0gxFHinTnLbGs4Dy9hWtHB099gyWSABzMNLTYZfTe+RQG9Hj2I1h
         5t76M5qOu/IJSKofQqDZKOfcK//420nCRroUcc0LHTUSb7dvxRBxlDOxR31eH50J0Yvq
         ujtJqFw2rjZjRyxJ3l/Hopb/2Q1cWqf1GCarJy2453isU1Reu67UO5Zvq30BYgcFMe+e
         +GHmbOY3snkISTpfPOxKhgPuUSRWrNOj4Yoynbnl+CSLrotXtO1+wk+BcZ1kC5WYJESN
         VKVyu1HOcnnoAVwpupQ9r1sr7Vb/rH6sxpQiHKobPoUdWiJsNkWT2/Kz0TgWsd+EqVUO
         dcaA==
X-Gm-Message-State: AOJu0Yzr81/7sJxMJAEZV+PuxVtrn7EaMeX85WT6fR7ue7kTM11iFoBj
	Qm7tHFaYJ6FORZBXtDU5eg2F/shmg+7x7RohBOw9jvxT3XoO3dP/Y/NLlS5mxyB9
X-Gm-Gg: AfdE7cmr4yPMNK0/JAhHypN/91gn2QspebA4qOAseasQal/zLWrX7zZ2FMnr3FHAWRy
	LZ7LuTSLkdL0UIbGE8ctEaJZZz45rwR7ZYrR42uSAMRUzIDYlCYBZmPUW5IHBSmOHmN3Ah0mPmw
	y2y6KWc0aLU1H2Y9PieTM+gHOYYZbGwVcIIVqTWT7oe/bhMXu9olgxAXeB7XIPYa8iCvbru2DYt
	Ss2r2YLGhISuuIv+gJxzE0Qu8mWFkw1L26850qOsBjvRt99oJtyT9OMruJPG6xicF/AAW1rRM23
	UoxcE4w36nSNfVbhj88V3lMmFg9dw8ldvHqfUR/PP2RaQ9alVwwq5M1XO2/4lBpsiyYX8LEod57
	QeNDRl0A+vD/zHeTL+Jx9D3/ovcgGB4uL/6h4cposCf9EnZDFk8FB7oYqx4bv30BeAqdgtYd0Eo
	BrvS5IrMTimxyqJYrGtgd/m4JADPdldC6aMajXErINOldJHZ9veljzAWEsgUOqqPk3TINmUxcP/
	unyGov9fgUv35KJGHd3/Fsj+8ArBppGwrHrGAZesiRL8hME7Vw2qM2+PAelNlhfPE/mirfi2CWG
	he8GfM5Axdt0lJgkW1KL3UAW9V0wb8lelA==
X-Received: by 2002:ac8:5a86:0:b0:517:9003:e1a with SMTP id d75a77b69052e-51a547323acmr56888731cf.21.1782235821449;
        Tue, 23 Jun 2026 10:30:21 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a515ccdbbsm28250931cf.11.2026.06.23.10.30.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 10:30:20 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][scarthgap] linux-yocto/6.6: address ltp hang
Date: Tue, 23 Jun 2026 13:30:18 -0400
Message-ID: <20260623173018.1594962-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 17:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239416

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.6:

1/1 [
    Author: Baokun Li
    Email: libaokun1@huawei.com
    Subject: ext4: get rid of ppath in get_ext_path()
    Date: Thu, 22 Aug 2024 10:35:32 +0800

    The use of path and ppath is now very confusing, so to make the code more
    readable, pass path between functions uniformly, and get rid of ppath.

    After getting rid of ppath in get_ext_path(), its caller may pass an error
    pointer to ext4_free_ext_path(), so it needs to teach ext4_free_ext_path()
    and ext4_ext_drop_refs() to skip the error pointer. No functional changes.

    Signed-off-by: Baokun Li <libaokun1@huawei.com>
    Reviewed-by: Jan Kara <jack@suse.cz>
    Reviewed-by: Ojaswin Mujoo <ojaswin@linux.ibm.com>
    Tested-by: Ojaswin Mujoo <ojaswin@linux.ibm.com>
    Link: https://patch.msgid.link/20240822023545.1994557-13-libaokun@huaweicloud.com
    Signed-off-by: Theodore Ts'o <tytso@mit.edu>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  2 +-
 .../linux/linux-yocto-tiny_6.6.bb             |  2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 22 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 67fb5141ce..c3200cfd3f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,7 +14,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "422bdbd919836dc6565f5bbeb5b662b9c52dc038"
+SRCREV_machine ?= "1ceada58731a98237f70384921758a4df3951960"
 SRCREV_meta ?= "4a6f16d14b76e28ab7615c88e2fbdf95ee15fc98"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 7b4f0430a6..563598a2bd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -17,7 +17,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "597d6818e83dc368f871fccf981a2a54a93196d0"
+SRCREV_machine ?= "66e051144e21d531fa26ef67476dfdefbfc119a2"
 SRCREV_meta ?= "4a6f16d14b76e28ab7615c88e2fbdf95ee15fc98"
 
 PV = "${LINUX_VERSION}+git"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 3261ad6ac3..07a06f1852 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,17 +18,17 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "860f859f5e469702d108e6ce9d3affaca072cfa3"
-SRCREV_machine:qemuarm64 ?= "60caa07a883ec933fad7aadaa2eb67a16c207906"
-SRCREV_machine:qemuloongarch64 ?= "a9288bf8eb270b824e3f92ee54df9dcd72a6052f"
-SRCREV_machine:qemumips ?= "6895489ba64aa274deea1687100068d4afddaec4"
-SRCREV_machine:qemuppc ?= "5a29f898aaae6bd0e12bdaeed596f40ab6fec468"
-SRCREV_machine:qemuriscv64 ?= "a9288bf8eb270b824e3f92ee54df9dcd72a6052f"
-SRCREV_machine:qemuriscv32 ?= "a9288bf8eb270b824e3f92ee54df9dcd72a6052f"
-SRCREV_machine:qemux86 ?= "a9288bf8eb270b824e3f92ee54df9dcd72a6052f"
-SRCREV_machine:qemux86-64 ?= "a9288bf8eb270b824e3f92ee54df9dcd72a6052f"
-SRCREV_machine:qemumips64 ?= "44180b7d240f83de490ab570bc092afe5d123207"
-SRCREV_machine ?= "a9288bf8eb270b824e3f92ee54df9dcd72a6052f"
+SRCREV_machine:qemuarm ?= "d81ffd8843535762fecf5aa5fb2ca7d2c4343038"
+SRCREV_machine:qemuarm64 ?= "1f7f3a52dacadfcc75863f25252a534b06fdaeeb"
+SRCREV_machine:qemuloongarch64 ?= "a8a7d078f151a24e01d4501853c88c6b08c9cad9"
+SRCREV_machine:qemumips ?= "4410226fddf113b89cceb26e7ee5ca5bb70c55fb"
+SRCREV_machine:qemuppc ?= "8f8faf1fe9183f295901f8f2b8916ff54f4a4bfb"
+SRCREV_machine:qemuriscv64 ?= "a8a7d078f151a24e01d4501853c88c6b08c9cad9"
+SRCREV_machine:qemuriscv32 ?= "a8a7d078f151a24e01d4501853c88c6b08c9cad9"
+SRCREV_machine:qemux86 ?= "a8a7d078f151a24e01d4501853c88c6b08c9cad9"
+SRCREV_machine:qemux86-64 ?= "a8a7d078f151a24e01d4501853c88c6b08c9cad9"
+SRCREV_machine:qemumips64 ?= "14ca63e9f1ce2090e189c16b1024ed3df8f833f0"
+SRCREV_machine ?= "a8a7d078f151a24e01d4501853c88c6b08c9cad9"
 SRCREV_meta ?= "4a6f16d14b76e28ab7615c88e2fbdf95ee15fc98"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.43.0


