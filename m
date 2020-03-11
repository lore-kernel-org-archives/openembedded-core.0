Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 36EBF61BBF
	for <openembedded-core@openembedded.org>;
	Wed, 11 Mar 2020 02:26:22 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id b22so315483pls.12
	for <openembedded-core@openembedded.org>;
	Tue, 10 Mar 2020 19:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=s6ZX7oBzZO+ea0qiaIp2ddRpulR3KXZGU3dXsQHt8Gg=;
	b=tyIlFAMCkss3MgkMOX0QYnI7v11Fck0UF8YQYtKYBSWE/u+tJ0ApB+cFqIBLxJ/XoE
	XDUOugLbWYarzogM+tdU4xoCcTN4vIHBpQgf4JJwIRAUBAUYTocbFJuNA67sJUKX6DTZ
	ECpw4eEw5RQEXcE75TNc2B1ek0RrClGR404UYUVwn75SyJlKqH+/51egQT33esrlIaBf
	gM8llBXNbtGESWiioNaY6h3yCxJRT2XPWHUNVSz5YUE1UhAbvk0R2ArbcE/uySSrCks6
	rcpTwzH6gyakAveI++LYTwZN6Lm5XyI3juVeqwVGjDpPoYcS/+nfBCveoxag5VdW7bmn
	QWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=s6ZX7oBzZO+ea0qiaIp2ddRpulR3KXZGU3dXsQHt8Gg=;
	b=cuhstl1ChJdhJo3fv3uXaV9NwQgLBvl93Lon5NH6OcS0bpU0O86uGYN/FINsUqCUoT
	1AuStiDQ36sEiBoOGcP6uTQv7gD/CF/UPwU5T3cJNDH/QRlnLSQtO9mq+XxyV8sHgyt4
	8x+spiTkvST517c1eQiGRniCKKIsZgXEeU/gMC56T9hw2B8JIov5uTrqgu0Sdb8eDc/4
	ydMxf2UTaiauGmF92egzPSw/xQA8rk05fUikeRblRd0VTpjpHqGXP4EzaM94Iy9NEglo
	K3tGM/qsP5QD/z6RTeTtzxwYxzVdNeOlk2Hj9nTQJNdK+Px8a0+pl1FmQJm8Cb0x62DD
	T0Ig==
X-Gm-Message-State: ANhLgQ3fvgv7HABNGz1bfHKhfTqJfnoBxv7I5bja935wSKSjoFYV6fwK
	opvBM4ja9qFUwnujzP5FAgUhJZyh
X-Google-Smtp-Source: ADFU+vtpmNj2IDu479XBKmwl0OetDN735uOpRIa6TFCJATgkC+Dt5Md354cGXsAoJ7+IEZVRKjD/Zg==
X-Received: by 2002:a17:902:9a48:: with SMTP id x8mr977411plv.14.1583893582956;
	Tue, 10 Mar 2020 19:26:22 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:a4a4:c739:7769:e9ed])
	by smtp.gmail.com with ESMTPSA id
	o11sm1461661pjb.18.2020.03.10.19.26.22
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Mar 2020 19:26:22 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Tue, 10 Mar 2020 19:26:03 -0700
Message-Id: <fb3a4c0ef61ca9b6313d4fdc6e2b28d415780dc7.1583893499.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1583893499.git.akuster808@gmail.com>
References: <cover.1583893499.git.akuster808@gmail.com>
Subject: [zeus 02/16] linux-yocto/5.2: backport perf build fix for latest binutils
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
X-List-Received-Date: Wed, 11 Mar 2020 02:26:22 -0000

From: Bruce Ashfield <bruce.ashfield@gmail.com>

[
   Author: Changbin Du <changbin.du@gmail.com>
   Date:   Tue Jan 28 23:29:38 2020 +0800

       perf: Make perf able to build with latest libbfd

       libbfd has changed the bfd_section_* macros to inline functions
       bfd_section_<field> since 2019-09-18. See below two commits:
	 o http://www.sourceware.org/ml/gdb-cvs/2019-09/msg00064.html
	 o https://www.sourceware.org/ml/gdb-cvs/2019-09/msg00072.html

       This fix make perf able to build with both old and new libbfd.

       Signed-off-by: Changbin Du <changbin.du@gmail.com>
       Acked-by: Jiri Olsa <jolsa@redhat.com>
       Cc: Peter Zijlstra <peterz@infradead.org>
       Link: http://lore.kernel.org/lkml/20200128152938.31413-1-changbin.du@gmail.com
       Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
       Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 14a338dbbe2da5a022a916081b3aab9c7472c3ce)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto-rt_5.2.bb |  2 +-
 .../linux/linux-yocto-tiny_5.2.bb              |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.2.bb   | 18 +++++++++---------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
index 441545f55e..a23a5e6f93 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b18bde6f0d8d1a5710cec9792372c03543cf0be9"
+SRCREV_machine ?= "78e147f949b5b18524aa7bd72f1cc8f7ae8039f8"
 SRCREV_meta ?= "bb2776d6beaae64b1a0fc902b64376f082085498"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
index 6d49e00e21..ac9904f415 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "ed1c3b7ad8221ba4e20ce7e4e4f6a73afd5015d4"
-SRCREV_machine ?= "c926964d00caf714f42878535af8c7374452072d"
+SRCREV_machine_qemuarm ?= "e0a3a01b24070b15121e938ea19755091bf0d662"
+SRCREV_machine ?= "73b12de4c879e4569bef3b2d0ee9c783a9788b27"
 SRCREV_meta ?= "bb2776d6beaae64b1a0fc902b64376f082085498"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.2.bb b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
index 44516dcacb..eab142e1c6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
@@ -12,15 +12,15 @@ KBRANCH_qemux86  ?= "v5.2/standard/base"
 KBRANCH_qemux86-64 ?= "v5.2/standard/base"
 KBRANCH_qemumips64 ?= "v5.2/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "1ed2236e622e5b79d910fc1db37ec6eec5a94fdc"
-SRCREV_machine_qemuarm64 ?= "c926964d00caf714f42878535af8c7374452072d"
-SRCREV_machine_qemumips ?= "e669e4307d07072458904ac0fda56f7192e2880d"
-SRCREV_machine_qemuppc ?= "c926964d00caf714f42878535af8c7374452072d"
-SRCREV_machine_qemuriscv64 ?= "c926964d00caf714f42878535af8c7374452072d"
-SRCREV_machine_qemux86 ?= "c926964d00caf714f42878535af8c7374452072d"
-SRCREV_machine_qemux86-64 ?= "c926964d00caf714f42878535af8c7374452072d"
-SRCREV_machine_qemumips64 ?= "217cada95bbe7eb4c3a6d40ee141ea4cea3bc1b6"
-SRCREV_machine ?= "c926964d00caf714f42878535af8c7374452072d"
+SRCREV_machine_qemuarm ?= "fdb7cd1bb5e4238e5b3d120ce9db31119ec2b5ee"
+SRCREV_machine_qemuarm64 ?= "73b12de4c879e4569bef3b2d0ee9c783a9788b27"
+SRCREV_machine_qemumips ?= "eb7faee13cfce200e9add4ba1852a3fe5d8b92e6"
+SRCREV_machine_qemuppc ?= "73b12de4c879e4569bef3b2d0ee9c783a9788b27"
+SRCREV_machine_qemuriscv64 ?= "73b12de4c879e4569bef3b2d0ee9c783a9788b27"
+SRCREV_machine_qemux86 ?= "73b12de4c879e4569bef3b2d0ee9c783a9788b27"
+SRCREV_machine_qemux86-64 ?= "73b12de4c879e4569bef3b2d0ee9c783a9788b27"
+SRCREV_machine_qemumips64 ?= "8e3bfeb7e9b5aa92c5bea941d361ff5b081a2aaa"
+SRCREV_machine ?= "73b12de4c879e4569bef3b2d0ee9c783a9788b27"
 SRCREV_meta ?= "bb2776d6beaae64b1a0fc902b64376f082085498"
 
 # remap qemuarm to qemuarma15 for the 5.2 kernel
-- 
2.17.1


