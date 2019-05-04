Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id C8CD67DD90
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:27:55 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 188so4420984pfd.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=niax5VrFKrMcZvAWMdDHG+q1lEORWcnlP+sn8BUXZkg=;
	b=KHBfXsXh/YfYS3o/Edlz+Cv5SqNFYa4N4iV8mK0XPCHvqq9eK06W3KLqUbE3bT1Yqe
	tVM/zLjzhi6IZRO1UzL9MpeuCxLReg97yzuVl+KpbpwwIQ6fyQnHs0f+ANpJLjgwmeO7
	CM1ablSM+56Q3BYSAcMU2AXNZ2QAAtFDqcWnbpPJZysBIN1Ft1xYkPkIEwjHHa8tQ3Hu
	hATiqNVpcgaooEIw+JLOaQei+A3f5W1ueF7Q1/5ZM5Av5d52Nsa8Tk8QytfOgZ3fg2dX
	Nji/435xdj5jFrJBHoqDswz/3AerC2N5ujVfVkhgDbhZ9YfWOmE2aR8k1W/5zhqCF1TN
	zULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=niax5VrFKrMcZvAWMdDHG+q1lEORWcnlP+sn8BUXZkg=;
	b=AhrG0IkoVOx+lNJdApVbrOrrPxmLnU791HQoRN3gX6mx7/FFgbsNOrsYSvajk3kBov
	8g8ZF120dkC4eZTfW8TjCOYb92KdBN+/+xJgLOzYi8e/5IQRoUinisbABuhImRWS73Mh
	ZJgorVHkvIiYAwjzNUkCHCMlE+HNXbO4VHeZtyMLmP+hDajfrVRIfmnOuic7aifcHOz8
	5X7V3lbOTTRhRE2yDjBLPbVpWdA/y31iu/qszqA31On0x50C0V+4yuIU/yTr8FgkiZRi
	lse3VtjSl3MhDobu5wu6IbEVeT1CswtBJg8+yhJDTdBqLRFvkxY7aGdwHEB73IKtviPO
	+9Ug==
X-Gm-Message-State: APjAAAVWOwpJBRh3F6s2yZKfIJ9KdoEo1CnW4ZwfPhiF0LmKZYYT8hnR
	a+C2LvRs2u/3Zm4e7bqcyt3Jfw5p
X-Google-Smtp-Source: APXvYqzqRmFoUM3c2LXP/zSeinyc0YqL7qIjbvr4SCobBD+Zqc2ItXHtc2+Q+sZc1+x1mhbwo2QWWA==
X-Received: by 2002:a63:5443:: with SMTP id e3mr19069432pgm.265.1556983676984; 
	Sat, 04 May 2019 08:27:56 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.27.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:27:56 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:27:07 -0700
Message-Id: <5a8eee4b5f4f40e615510f509e2e17fd46b19da0.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 31/43] linux-yocto/5.0: integrate TCP timeout / hang fix
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
X-List-Received-Date: Sat, 04 May 2019 15:27:56 -0000

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following fix:

[
    tcp: fix issues relaed to implement coalescing on backlog queue

    As was discussed on -netdev, there's an issue with TCP timeouts and
    hangs due to new features introduced in the 5.0 kernel:

      https://www.spinics.net/lists/netdev/msg562928.html

    This is a temporary commit to widely test the proposed solution. It
    will be dropped when an official patch makes mainline.
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_5.0.bb      | 18 +++++++++---------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index 07fa910..ef3f0a0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "04585fb29f99725a27acb96fc25efa0a55a62a8a"
-SRCREV_meta ?= "ffd8cf5baf8e741b8987b72c942ce3b9cc7c7f30"
+SRCREV_machine ?= "a3309af7ab77156bd8d731df3a97126d3d897916"
+SRCREV_meta ?= "2d838e11b084a96dd70e5cc0fec01d2e492f72c3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
index c1084f2..206e6c3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "e265300362d7004e3b57bb5cbcfc65fb469b9ce9"
-SRCREV_machine ?= "9c40ed0d86ad87f48659aad4fdead2455e8b5db8"
-SRCREV_meta ?= "ffd8cf5baf8e741b8987b72c942ce3b9cc7c7f30"
+SRCREV_machine_qemuarm ?= "d905ae925fc4a60d63f45e1922163da683d8a3bc"
+SRCREV_machine ?= "14b6c1fc020fa357245e9ac9c6c69d253bc7ce30"
+SRCREV_meta ?= "2d838e11b084a96dd70e5cc0fec01d2e492f72c3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index 01269dd..f34cc7b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "v5.0/standard/base"
 KBRANCH_qemux86-64 ?= "v5.0/standard/base"
 KBRANCH_qemumips64 ?= "v5.0/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "ed9d11e2c8ebbfe056420cb89c2e5d02836496ce"
-SRCREV_machine_qemuarm64 ?= "9c40ed0d86ad87f48659aad4fdead2455e8b5db8"
-SRCREV_machine_qemumips ?= "40a729c3b0683d0875f8d6ad7353e6e429c7afc2"
-SRCREV_machine_qemuppc ?= "9c40ed0d86ad87f48659aad4fdead2455e8b5db8"
-SRCREV_machine_qemux86 ?= "9c40ed0d86ad87f48659aad4fdead2455e8b5db8"
-SRCREV_machine_qemux86-64 ?= "9c40ed0d86ad87f48659aad4fdead2455e8b5db8"
-SRCREV_machine_qemumips64 ?= "437d99225c689f3f192bb834e4d649ea0467ac87"
-SRCREV_machine ?= "9c40ed0d86ad87f48659aad4fdead2455e8b5db8"
-SRCREV_meta ?= "ffd8cf5baf8e741b8987b72c942ce3b9cc7c7f30"
+SRCREV_machine_qemuarm ?= "17c4b7e9db4d17aa713c85d0c3d2d84af962864a"
+SRCREV_machine_qemuarm64 ?= "14b6c1fc020fa357245e9ac9c6c69d253bc7ce30"
+SRCREV_machine_qemumips ?= "e5c23fb31438dab373a50afc40f6e4ab0c568485"
+SRCREV_machine_qemuppc ?= "14b6c1fc020fa357245e9ac9c6c69d253bc7ce30"
+SRCREV_machine_qemux86 ?= "14b6c1fc020fa357245e9ac9c6c69d253bc7ce30"
+SRCREV_machine_qemux86-64 ?= "14b6c1fc020fa357245e9ac9c6c69d253bc7ce30"
+SRCREV_machine_qemumips64 ?= "743d799797ad6828472087e1da8c67fdab87bf75"
+SRCREV_machine ?= "14b6c1fc020fa357245e9ac9c6c69d253bc7ce30"
+SRCREV_meta ?= "2d838e11b084a96dd70e5cc0fec01d2e492f72c3"
 
 # remap qemuarm to qemuarma15 for the 5.0 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.7.4


