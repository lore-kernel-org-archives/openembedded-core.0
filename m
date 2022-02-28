Return-Path: <andrew@aj.id.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D339C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:40:03 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web09.20616.1646059202734151341
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:40:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aj.id.au header.s=fm2 header.b=pNOK8B53;
 spf=pass (domain: aj.id.au, ip: 66.111.4.27, mailfrom: andrew@aj.id.au)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 135985C02F0;
	Mon, 28 Feb 2022 09:40:02 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 28 Feb 2022 09:40:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; bh=GAnDW5URs9E+mHDpSWfKFwybg3mPqs
	tMI8XBL/R6OlI=; b=pNOK8B536viMq90DDbVG950a1Jf0EA091zB93B/6JNUO3/
	bwugCIy5GbyQjkIKuNeiQaNQqGZBMnaka9ZtH+MxZOKdeslQRnniMHj2vjBbcmWI
	lrlTnFGQBNfjFRVJ1zvchCzOKe/sc9u11/qs/9xgzijDWwYJVpINDMeve56QbQGa
	ypeMIZlDJPoWA48E8tZzr+cCf5QIJYYjmnRTJe95k3QsPSR/aCcYMBH9emWR2/aX
	7i/RFbrkpY0B0EZxChI1tA7o/ZXToyeTp7MJZeeMe6T0PkwjU52jsVLF+RU6g0rL
	lJHRETTe0ueMbol5wIip4KEAKvtt9SM3D5yGbsYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=GAnDW5
	URs9E+mHDpSWfKFwybg3mPqstMI8XBL/R6OlI=; b=DdFchChnRW1kAa9n7WYoVW
	+RB1HxW8mp+F81mQAoVkH/JvLvKMGcJ5TLyswTqUsnY+48fhY+bnKYV/z5bq6pXq
	46sawAk4/sikRl6AN55lBbH2yKnAEpP22trua6iFgT9QI7tIAu7xUamoIsweEfy1
	GjwZPBayD9YS43gVWhf6hoR/GVD2uUfsvRyuKMM52v5DqnkcDGaDFeF5wwX+2fFn
	2HivvcsKHnQkjWjQpAWY2TmldIvKKQYx+XYSpBjgEjvS1Sf7uc65UeibbMZ5edjk
	pU/OSexdckjNQg3+8H3ks3Ks+ny0/7WgImSBpctTluOZtAowacRWCeKiddcA+R5Q
	==
X-ME-Sender: <xms:wd4cYpnwSw71Hb0ci3EQuYjHJesBIyR_4Qnu16qm0C8pFn3Y_FOnQg>
    <xme:wd4cYk0DgRPsGJuUfxL5CtRSsSAdJROsvhB5b6ybxuY2dCHdsNuIrLqmSlet0NOYg
    z8uBMJ_RPjwRpxNNg>
X-ME-Received: 
 <xmr:wd4cYvrtQf9PoKyusAK2pj79EM78lkDLZIyk6qq64xbWJyJGNrIMWZI0-BrRErME7zQZoWq2mnltvNpeHhZ4OL0ClCwnQxOlQMvYOKvNJ6ZeTPB6iz_DFIT5W3ZtnHt0>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddttddgieejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
    jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
    etjeffleffvdduudevieffgeetleevhfetnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:wt4cYplbPF7Idy53R_0B_zjtK6bzTHky0nznq2tgAtnPS1c8Pe3bRQ>
    <xmx:wt4cYn06TrWMlCDoUo6peKXOpm5AEWWGWKe1oxAdsPt_lLKEtCmPIQ>
    <xmx:wt4cYovR_Uw840jOGklyQi8AQwPGKEjVUbNzmNq9FfeimFBKuV2HCA>
    <xmx:wt4cYg_hHwKKDBg-UL4qpp0nJ7vrApvJUzMUBdWUrNlp8dW_VWJCzw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Feb 2022 09:40:00 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	richard.purdie@linuxfoundation.org
Subject: [PATCH v2 1/3] rust: Introduce arch_to_rust_arch()
Date: Tue,  1 Mar 2022 01:09:46 +1030
Message-Id: <20220228143948.50809-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220228143948.50809-1-andrew@aj.id.au>
References: <20220228143948.50809-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:40:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162502

On modern Power systems `uname -m` yields 'ppc64le' while the toolchain
knows the architecture as 'powerpc64le'. Provide a mapping from one to
the other to integrate with the existing architecture configuration
flags.

arch_to_rust_arch() only exists to map the OE *_ARCH variables before
any further processing, unlike arch_to_rust_target_arch() which is
specific to the internal triple handling of rust.

On Linux ppc64le systems the changes give the following config:

```
$ cat ./tmp/work/ppc64le-linux/rust-native/1.58.0-r0/targets/ppc64le-linux.json
{
    "llvm-target": "powerpc64le-unknown-linux-gnu",
    "data-layout": "e-m:e-i64:64-n32:64-v256:256:256-v512:512:512",
    "max-atomic-width": 64,
    "target-pointer-width": "64",
    "target-c-int-width": "64",
    "target-endian": "little",
    "arch": "powerpc64",
    "os": "linux",
    "env": "gnu",
    "vendor": "unknown",
    "target-family": "unix",
    "linker": "gcc",
    "cpu": "generic",
    "dynamic-linking": true,
    "executables": true,
    "linker-is-gnu": true,
    "linker-flavor": "gcc",
    "has-rpath": true,
    "has-elf-tls": true,
    "position-independent-executables": true,
    "panic-strategy": "unwind"
}
```

Change-Id: Ief0c01189185d7d4da31d307270bec4e1de674ca
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 meta/classes/base.bbclass                  | 2 +-
 meta/classes/rust-common.bbclass           | 2 +-
 meta/lib/oe/rust.py                        | 5 +++++
 meta/recipes-devtools/rust/rust-common.inc | 8 +++++---
 4 files changed, 12 insertions(+), 5 deletions(-)
 create mode 100644 meta/lib/oe/rust.py

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 55f654d37d0c..27c1d6168d45 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -12,7 +12,7 @@ inherit logging
 
 OE_EXTRA_IMPORTS ?= ""
 
-OE_IMPORTS += "os sys time oe.path oe.utils oe.types oe.package oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license oe.qa oe.reproducible ${OE_EXTRA_IMPORTS}"
+OE_IMPORTS += "os sys time oe.path oe.utils oe.types oe.package oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license oe.qa oe.reproducible oe.rust ${OE_EXTRA_IMPORTS}"
 OE_IMPORTS[type] = "list"
 
 PACKAGECONFIG_CONFARGS ??= ""
diff --git a/meta/classes/rust-common.bbclass b/meta/classes/rust-common.bbclass
index 98d65970e8c0..8cfe864ca3fd 100644
--- a/meta/classes/rust-common.bbclass
+++ b/meta/classes/rust-common.bbclass
@@ -65,7 +65,7 @@ def rust_base_triple(d, thing):
     if thing == "TARGET" and target_is_armv7(d):
         arch = "armv7"
     else:
-        arch = d.getVar('{}_ARCH'.format(thing))
+        arch = oe.rust.arch_to_rust_arch(d.getVar('{}_ARCH'.format(thing)))
 
     # All the Yocto targets are Linux and are 'unknown'
     vendor = "-unknown"
diff --git a/meta/lib/oe/rust.py b/meta/lib/oe/rust.py
new file mode 100644
index 000000000000..ec70b348054d
--- /dev/null
+++ b/meta/lib/oe/rust.py
@@ -0,0 +1,5 @@
+# Handle mismatches between `uname -m`-style output and Rust's arch names
+def arch_to_rust_arch(arch):
+    if arch == "ppc64le":
+        return "powerpc64le"
+    return arch
diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
index ceeee9786376..310aecef226e 100644
--- a/meta/recipes-devtools/rust/rust-common.inc
+++ b/meta/recipes-devtools/rust/rust-common.inc
@@ -313,10 +313,12 @@ def rust_gen_target(d, thing, wd, features, cpu, arch, abi=""):
     sys = sys_for(d, thing)
     prefix = prefix_for(d, thing)
 
+    rust_arch = oe.rust.arch_to_rust_arch(arch)
+
     if abi:
-        arch_abi = "{}-{}".format(arch, abi)
+        arch_abi = "{}-{}".format(rust_arch, abi)
     else:
-        arch_abi = arch
+        arch_abi = rust_arch
 
     features = features or d.getVarFlag('FEATURES', arch_abi) or ""
     features = features.strip()
@@ -329,7 +331,7 @@ def rust_gen_target(d, thing, wd, features, cpu, arch, abi=""):
     tspec['target-pointer-width'] = d.getVarFlag('TARGET_POINTER_WIDTH', arch_abi)
     tspec['target-c-int-width'] = d.getVarFlag('TARGET_C_INT_WIDTH', arch_abi)
     tspec['target-endian'] = d.getVarFlag('TARGET_ENDIAN', arch_abi)
-    tspec['arch'] = arch_to_rust_target_arch(arch)
+    tspec['arch'] = arch_to_rust_target_arch(rust_arch)
     tspec['os'] = "linux"
     if "musl" in tspec['llvm-target']:
         tspec['env'] = "musl"
-- 
2.32.0


