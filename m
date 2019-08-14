Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id C40F27EC92
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 15:31:41 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id m24so30317850otp.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 08:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0yN5ecBRCEqg1/BhPJXsFyr0RgP/SBgBX5do3kqpokg=;
	b=EIK+n7XPKdp1xD8gEzS3XzdQIOnac6UXOcM1FIUHzep0sKmI+FXfp5tcAwcB/V5Vkh
	4buN8pQEb75dAQhDyIh8yInU9P9GWDu7xIQFtYh5BJTzXr2+Ypqkpj9ybh9hcVAq2CXV
	bw5rSiA1L8IZqyesxgyCEqLRzP7nHR/L88Dof0nsLbU/j4Dkagg0l2uDxa9vaSddOtE8
	PweTaCl96cUPaMenXVzCt1UXkPswEbCYstQeC0w6Zi8ar+RRy9WV7yoxf3bwagPCQvBZ
	S+IuDJ6xnZzwP7i+GQjVhTrSI+puQO4+QTp7Vy1ZgSBpCR/sX0qbd6IV3c1SV1qQ3CSq
	Efag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0yN5ecBRCEqg1/BhPJXsFyr0RgP/SBgBX5do3kqpokg=;
	b=sR0OpHPpkK5coKXqLd9ufnKUSxZpyqQUZQ5xnZ6lFKsuSNnHhQjPw1sjaZKg/msCQQ
	Mo2naug8xanMJo1hKjFOgLf9PFJ4LBLSBVEGUluN36GjeE6cIfsFPl54yYtX/m8DvZ+n
	xisKTUOUQxStEc63PcSDhP3aurFOzeXMdYvi3wuXoPiJtO9HAkKDynLsaPKZhXwP5E3W
	gn67mHBLINXK9wP8DCinNklTwwr9gmG3ASfs7OBevjZZPDvoWWDyW/yCy2HbfTpHaF9m
	0imlZzoK52V3c/RkQgDuQkmEKJs2kvmNrmvy+DvXmnoZSQwEI1HhrJ9cJgJvjZkLISW7
	mMJg==
X-Gm-Message-State: APjAAAVUaSJtBI6dwNKV03FNW1//fWfATbLMEYZzXdbMXFHnVyC0oLP2
	yKWA/4/1Qx1qUdaFJOLIWto=
X-Google-Smtp-Source: APXvYqzxoiPZH5Cezy034nXkqqY2eRCsc1Lm5slm7Y5oDC6JnzA+l20a7e6hyFIQir/eX5mbLERmJw==
X-Received: by 2002:a6b:5116:: with SMTP id f22mr591884iob.108.1565796702534; 
	Wed, 14 Aug 2019 08:31:42 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208])
	by smtp.gmail.com with ESMTPSA id 8sm224570ion.26.2019.08.14.08.31.40
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 14 Aug 2019 08:31:41 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed, 14 Aug 2019 11:31:31 -0400
Message-Id: <2120096638d789f5fcf471ac26da5b16478991b2.1565796002.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1565796002.git.bruce.ashfield@gmail.com>
References: <cover.1565796002.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] linux-yocto: arch/x86/boot: use prefix map to avoid embedded paths
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
X-List-Received-Date: Wed, 14 Aug 2019 15:31:42 -0000
Content-Transfer-Encoding: 8bit

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

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto-rt_5.0.bb |  4 ++--
 .../linux/linux-yocto-tiny_5.0.bb              |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_5.0.bb   | 18 +++++++++---------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index 9e822f2e7f..f66ee6f4ad 100644
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
index a1719651b6..42e0dcd603 100644
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
index 0e4a372d2d..ea4b6f5b33 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.0/standard/base"
 KBRANCH_qemux86-64 ?= "v5.0/standard/base"
 KBRANCH_qemumips64 ?= "v5.0/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "9161b2fa2f1cec0ba02976c389c788445858e0de"
-SRCREV_machine_qemuarm64 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
-SRCREV_machine_qemumips ?= "7de9b8f0db98e51a666477c8e2b64f1964b45410"
-SRCREV_machine_qemuppc ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
+SRCREV_machine_qemuarm ?= "d1ed980ad989252d42386c8bc63b2f5f11985ea4"
+SRCREV_machine_qemuarm64 ?= "55dd15336b7301b686a0c183f5372b49c1003d03"
+SRCREV_machine_qemumips ?= "1520e78195e64f27be46a46a8d6711c8470fb083"
+SRCREV_machine_qemuppc ?= "55dd15336b7301b686a0c183f5372b49c1003d03"
 SRCREV_machine_qemuriscv64 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
-SRCREV_machine_qemux86 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
-SRCREV_machine_qemux86-64 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
-SRCREV_machine_qemumips64 ?= "5a8b27bcc0b16077ab8edfcd3fb25c80dc2c652e"
-SRCREV_machine ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
-SRCREV_meta ?= "c2e34d9ab2894edc6abc6be9ac89907bf4348447"
+SRCREV_machine_qemux86 ?= "55dd15336b7301b686a0c183f5372b49c1003d03"
+SRCREV_machine_qemux86-64 ?= "55dd15336b7301b686a0c183f5372b49c1003d03"
+SRCREV_machine_qemumips64 ?= "9d4105b32cf123a861bc754377d2f2e156278a7e"
+SRCREV_machine ?= "55dd15336b7301b686a0c183f5372b49c1003d03"
+SRCREV_meta ?= "96c82f3d7ab25a3f44e517f9dbbb53e2c4c45729"
 
 # remap qemuarm to qemuarma15 for the 5.0 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1


