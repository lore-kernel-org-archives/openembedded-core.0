Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2023D605AE
	for <openembedded-core@openembedded.org>;
	Sun, 15 Mar 2020 18:12:02 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id a32so7426968pga.4
	for <openembedded-core@openembedded.org>;
	Sun, 15 Mar 2020 11:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=s6ZX7oBzZO+ea0qiaIp2ddRpulR3KXZGU3dXsQHt8Gg=;
	b=nIKMm3KC3fLZGPjvghV0o5YEVHSVgkKLw/RIhyH+Ccw5jdHuuOGIbuzBdE4xsRckJh
	L1kyaWL/QuDNKZc1jndzjgHo5nuBtlbWvAIrNLXhsFKhSktxB9p/FyLxUzLaHZTgkawZ
	jVH5VrERfQcgGoRjYP+zKbK0HU7kocrIQqbLJUOVZNiYg//oJfFNAqlVdlEwSUnc3tdF
	rOQzVwLwx41XFqfHOEefpdImvHM7F/WUsh/i073o68yY+/8p/syn1onG31fiHSVNsIxG
	TjxRTRy6Om52pRt5zC+xJpDlPKmZnPspA47VOLo9IdYmEYzgiWQZI+0plPvbGT9bpDxO
	Jzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=s6ZX7oBzZO+ea0qiaIp2ddRpulR3KXZGU3dXsQHt8Gg=;
	b=bqsqHDySI6Nxoix1oebhq2cnLHgxCtIZ9HGiSHhx62ckPXfowE9DJlmXOUEd30vsLu
	H+/uC5PGR7S6B0cHhC55d/1iREBxO9Q6aHSROZXkQJdKK3+ViVyk1anEM6Q2G0QP+ckV
	OGdMOlsodl7EKuUHPotivsitVOoGVbt4B9uJxjDfzyIPW0zgDR2g/+AfJ15ebzd6vBrA
	rcF/N/Qd49KzHNaj1LocHv/z4oxlKHZ+w8OL5GtObN1pCX5rWDnlb7y0oe9QcYc0O3LD
	cQZiGbM+vIvBN5DajM3PsTRUf18mWDRAZmtaG3JfNSlql+gEhBV++XZVgd1jlmWqUfpZ
	IBrA==
X-Gm-Message-State: ANhLgQ0rdqIZt3e3r20rg5BhRzQGMAb7JkCfHXXnZb26vUwESXytSKYm
	r7EMDtF7SORYj8AmxLTqAVdSv09R
X-Google-Smtp-Source: ADFU+vsaWDe7CIVMVWpyeGM8WO2IwKi5aZLcrgQRg2ckcAal+GUdDnsKBb5cA4nx5PR2mojDzp2mRw==
X-Received: by 2002:a63:921b:: with SMTP id o27mr24427368pgd.364.1584295923818;
	Sun, 15 Mar 2020 11:12:03 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:c9cd:7c61:9c1c:2d2f])
	by smtp.gmail.com with ESMTPSA id
	n5sm12223816pfq.35.2020.03.15.11.12.03
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Mar 2020 11:12:03 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 15 Mar 2020 11:11:44 -0700
Message-Id: <fb3a4c0ef61ca9b6313d4fdc6e2b28d415780dc7.1584295805.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1584295805.git.akuster808@gmail.com>
References: <cover.1584295805.git.akuster808@gmail.com>
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
X-List-Received-Date: Sun, 15 Mar 2020 18:12:03 -0000

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


