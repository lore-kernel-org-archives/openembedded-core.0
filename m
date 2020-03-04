Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
	[209.85.219.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8A53561672
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 14:55:27 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id fc12so892727qvb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 06:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=seoBAmEXQD5xzyUhKWXcdLA00DJjd/lzliL8xcYiRug=;
	b=PiQH57ZxNuLOoRE1TOaVaHCSUhgwu4LI/XHUdCId9q/LewWFli75F2L4gBCw359jM0
	Oam+tahwDvogyYsrbMNoISbgvbB5u87FxMTxbtFx6UJqnUCO2pEO5yP4i7kc3vxZMyu7
	P6RD0ym0ud6z+GPizMHgJuUg+gSokLEzglKhT6/eg4MDcK6JEgKeGy0DbX+j3qV9wYc9
	qgBrGCaOxauVmHYeHOIBnPoxycj5GACk9PL2i2mlI2YjCF+64mInySpa9/NvRStPjYyz
	6uyo2rQsEnMb/ASSm7IaTHJISUMFb8L2tTTjcjIacrc4sHhXXW2ss25enjlQpiAaBt7s
	XSjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=seoBAmEXQD5xzyUhKWXcdLA00DJjd/lzliL8xcYiRug=;
	b=P+7Zp+bQ0RLP2D/Rh7leX1b/Gjz1qyYYl7F0oGysYQI1xjOREXmb5SL1VNh2XEHtzo
	CKzwsGx/DeCdEzFAd5wyjJ7OWPzomCLBmzq1K7u+cuCgS/kmK+f5/UVZBeVm0hHefYRv
	zdMuyEOtc2BIZKuFyelCTmgDkuOPfbgragJE1v0hcv83oGf8hzqlFIE292R/z/PYiBJw
	TjGI38r21yo5Co4XC3kfvmLRkQwvhVeRNijwBX/Tx05Qba1k+hjXfnkzI+WmzhfF98eY
	D/TDDiSUN8K65SP4oFgQ36zVbHMr/5arrO9yXFUc4MmJNWTHDnekA6UXkA4Jx3kQfLPB
	umSg==
X-Gm-Message-State: ANhLgQ3YQyRtaWzAhA3mRYRgr4z/LwFWX9ZR9jKxNdqIeO/jaMpHDik/
	1TKFQKY3rPV960ol7++JByUf325afu6XmQ==
X-Google-Smtp-Source: ADFU+vso+q3tQe+/T44KQTc61kofXe9ImMRxQEzD8ckYki+Y4fEM5WVGhAQYprdhHlwlUPf1SdPH6A==
X-Received: by 2002:a0c:e7c3:: with SMTP id c3mr2434124qvo.183.1583333728135; 
	Wed, 04 Mar 2020 06:55:28 -0800 (PST)
Received: from localhost.localdomain
	(CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.240.214]) by smtp.gmail.com with ESMTPSA id
	w83sm13455065qkb.83.2020.03.04.06.55.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Mar 2020 06:55:27 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed,  4 Mar 2020 09:55:21 -0500
Message-Id: <5d990fd6d22bc9e8b5e41777aa487d13bf3122df.1583333447.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1583333447.git.bruce.ashfield@gmail.com>
References: <cover.1583333447.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] linux-yocto/5.2: backport perf build fix for latest binutils
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
X-List-Received-Date: Wed, 04 Mar 2020 14:55:27 -0000
Content-Transfer-Encoding: 8bit

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
2.19.1


