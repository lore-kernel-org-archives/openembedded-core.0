Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 63F227FB2D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 09:47:47 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id e11so12868097wrv.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 02:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=pO9nhesMCjW+1zRyglKkxAq/+yyZzrVPdSAXrjndmEo=;
	b=vIMwlFnbr2VX2Nkiul+A18CFgvnEpHb7DjmHkr778MTy2IU20krxmPz7kyhwA+UTce
	8UziCvo2t1kSsdIEr+uv1teMhQjKZJsOCXHRQorLgwwiZ8TD6sRJNexWs02+UWqzlCJ+
	GsA1fIdiCE8e13byWlJkEwVrCSt7CFZ997C7BKFNIUipfYFlmLd7VX9cMxO+R90CvWKB
	aXhPB/6QM9a2gg9HSyCxxXYzn9K4A7Hrpj2PzcPbfsdr78rFO4klN5Ax38ebchi9p2M8
	Cqf9rTUx18PSgw7U8F3Ajmo+CmQufPcTQyhdsi2wRUamD2ZAwJZzfnnDZAIQ6BnVgJFF
	rrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=pO9nhesMCjW+1zRyglKkxAq/+yyZzrVPdSAXrjndmEo=;
	b=Qy+jeipM4ClJvk3GoKMPBS21Gj8Zk97RjlJoMWsIBuUgGU7yQfjIXTmSxkcatcbd9o
	0kzkAq8BmDZYp5PilGVB9euZ5bYe1RDdc9cSDn9yBKvTc9VkvEPxz5SdSQl29JLehPqU
	l3Jy/s+YrXtjGP9iNIPQKwoh/0548ofe+KMm8UQttia2Obs9JMOQiLsgG9ZdBu6m2R+d
	HuQ2pOHcbBtIWMKO+QMNd4Z5o2umYM2WPUR/bBC9Y4587l6ED/ph+byM3+Dtv4W/QMud
	hMfoJbnI66NoL5bghtnlJwhfRRivU/WLamVBAiiMr1UjvSnHY0kT9RegzzHdDPaB4tvp
	CGgA==
X-Gm-Message-State: APjAAAUPseaSVjZzqBk0Mn25+q4hWgPsj09LIPXc4DJsVoc9v2EIVfwJ
	VmVR7XuYHD3KNdYin1F30wRsFfplHvs=
X-Google-Smtp-Source: APXvYqyHQokauR5K2and/wjndnXORP5wfxY9OEBsfSZz5NFQB3Fmg14oOTimWoFPiz0iGCUUzI1OAQ==
X-Received: by 2002:a5d:5050:: with SMTP id h16mr806094wrt.380.1572342467816; 
	Tue, 29 Oct 2019 02:47:47 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com ([91.217.168.176])
	by smtp.gmail.com with ESMTPSA id
	36sm29150537wrj.42.2019.10.29.02.47.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Oct 2019 02:47:47 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Oct 2019 10:47:19 +0100
Message-Id: <ed04eb3e19c9edbbcc4599522f5c0952c8372467.1572341125.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572341125.git.akuster808@gmail.com>
References: <cover.1572341125.git.akuster808@gmail.com>
Subject: [warrior 06/19] linux-yocto: arch/x86/boot: use prefix map to avoid embedded paths
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
X-List-Received-Date: Tue, 29 Oct 2019 09:47:47 -0000

From: Bruce Ashfield <bruce.ashfield@gmail.com>

From the kernel patch:

[
    It was observed that the kernel embeds the path in the x86 boot
    artifacts.

    From https://bugzilla.yoctoproject.org/show_bug.cgi?id=13458:

    [
       If you turn on the buildpaths QA test, or try a reproducible build, you
       discover that the kernel image contains build paths.

       $ strings bzImage-5.0.19-yocto-standard |grep tmp/
       out of pgt_buf in
       /data/poky-tmp/reproducible/tmp/work-shared/qemux86-64/kernel-source/arch/x86/boot/compressed/kaslr_64.c!?

       But what's this in the top-level Makefile:

       $ git grep prefix-map
       Makefile:KBUILD_CFLAGS  += $(call
       cc-option,-fmacro-prefix-map=$(srctree)/=)

       So the __FILE__ shouldn't be using the full path.  However
       arch/x86/boot/compressed/Makefile has this:

       KBUILD_CFLAGS := -m$(BITS) -O2

       So that clears KBUILD_FLAGS, removing the -fmacro-prefix-map option.
    ]

    Other architectures do not clear the flags, but instead prune before
    adding boot or specific options. There's no obvious reason why x86 isn't
    doing the same thing (pruning vs clearing) and no build or boot issues
    have been observed.

    So we make x86 can do the same thing, and we no longer have embedded paths.
]

This issue has been reported upstream, and a patch submission is
pending, but for now, we'll soak the proposed patch in linux-yocto to
see if any issues are found

[YOCTO: #13458]

(From OE-Core rev: 78b0ff5960814af935a8089ec49c51d76f148149)

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_5.0.bb      | 19 ++++++++++---------
 3 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index d7b3b38..d1adf0c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "9c1e84c9b81b6bf1df55f26f2e0517266c37f7eb"
-SRCREV_meta ?= "c2e34d9ab2894edc6abc6be9ac89907bf4348447"
+SRCREV_machine ?= "e6cb812b5532630b6fc6dfd7778d57a4907d3180"
+SRCREV_meta ?= "96c82f3d7ab25a3f44e517f9dbbb53e2c4c45729"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
index c0caed3..7d49de6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "fabee455f397ba8054f35a3ad5f2250bbad93bef"
-SRCREV_machine ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
-SRCREV_meta ?= "c2e34d9ab2894edc6abc6be9ac89907bf4348447"
+SRCREV_machine_qemuarm ?= "b9001287984b0066814c8739f38d629de73739b7"
+SRCREV_machine ?= "55dd15336b7301b686a0c183f5372b49c1003d03"
+SRCREV_meta ?= "96c82f3d7ab25a3f44e517f9dbbb53e2c4c45729"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index 895cb15..35088da 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -11,15 +11,16 @@ KBRANCH_qemux86  ?= "v5.0/standard/base"
 KBRANCH_qemux86-64 ?= "v5.0/standard/base"
 KBRANCH_qemumips64 ?= "v5.0/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "9161b2fa2f1cec0ba02976c389c788445858e0de"
-SRCREV_machine_qemuarm64 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
-SRCREV_machine_qemumips ?= "7de9b8f0db98e51a666477c8e2b64f1964b45410"
-SRCREV_machine_qemuppc ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
-SRCREV_machine_qemux86 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
-SRCREV_machine_qemux86-64 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
-SRCREV_machine_qemumips64 ?= "5a8b27bcc0b16077ab8edfcd3fb25c80dc2c652e"
-SRCREV_machine ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
-SRCREV_meta ?= "c2e34d9ab2894edc6abc6be9ac89907bf4348447"
+SRCREV_machine_qemuarm ?= "d1ed980ad989252d42386c8bc63b2f5f11985ea4"
+SRCREV_machine_qemuarm64 ?= "55dd15336b7301b686a0c183f5372b49c1003d03"
+SRCREV_machine_qemumips ?= "1520e78195e64f27be46a46a8d6711c8470fb083"
+SRCREV_machine_qemuppc ?= "55dd15336b7301b686a0c183f5372b49c1003d03"
+SRCREV_machine_qemuriscv64 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
+SRCREV_machine_qemux86 ?= "55dd15336b7301b686a0c183f5372b49c1003d03"
+SRCREV_machine_qemux86-64 ?= "55dd15336b7301b686a0c183f5372b49c1003d03"
+SRCREV_machine_qemumips64 ?= "9d4105b32cf123a861bc754377d2f2e156278a7e"
+SRCREV_machine ?= "55dd15336b7301b686a0c183f5372b49c1003d03"
+SRCREV_meta ?= "96c82f3d7ab25a3f44e517f9dbbb53e2c4c45729"
 
 # remap qemuarm to qemuarma15 for the 5.0 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.7.4


