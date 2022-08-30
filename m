Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F72ECAAD1
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 14:20:05 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web08.12190.1661869195646517808
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 07:19:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=fPUh0sE2;
 spf=pass (domain: gherzan.com, ip: 66.111.4.29, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id EDD175C00D3;
	Tue, 30 Aug 2022 10:19:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 30 Aug 2022 10:19:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1661869194; x=1661955594; bh=/5f6nclgO8AX0rXiIxT9Qx7vB
	aqMlObLrobYnUIi2xc=; b=fPUh0sE28sHzxmIkXPQm+R9JooOob10SKkNmALswK
	uY9fTHi/GeZy7iX/Q7V9w1JV4BatT7V2QNvRysPzDZJxu34qipjV5etO4P/yZKPW
	8CLNPUFfgfKDuVmQLKLksxs2PmLT55Yyqf87MLSFubtMR+WwN/AN1lRx7YzcR1ud
	V+QHicOtZ2Oebf3KSws6CeEDYbTMrqyOij1MAqTUzheaq1YKFqHcHUTdbJdBgZZt
	aW5Ydp9mwENuAYdtJTOBJcLr+1tgeIrj2HprNZFsjhd/9wIPsKL5g80qJ7LRKhfV
	Ac3UULQsZvrbuSLR2l6ghz7jjw2YVw+QpZFW7CVt59gqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1661869194; x=1661955594; bh=/5f6nclgO8AX0rXiIxT9Qx7vBaqMlObLrob
	YnUIi2xc=; b=Avn82BV5ovyhXAK8Mc8vrAheG4RYCfCXIAnOzY1EHswy5ULxTG9
	SxAw0NmW9FvMSSLfiMlUQZbrDDNZcZfJ8+tlvJaSm4uO+XJJh9I3M6te4pjrgTWl
	Ftanh8gZdU/jCITLWLTcFNtcE+LeSQ0/2UK89GvXSxCCjS87ATx9xOy1mfLX5MLe
	zcxjANa3oGAm0W9ugHdC6qCuldZX0b1lQeHe5ryHeHG+WUVDsipw+FoWmgWzyvhZ
	aXDLZvaLTBy5dSD4wt2n3HnJzZ4ihIQnt0CY6AAhws4mKbs5y/4fwOaxfoA2Tktg
	rgt1iD/svINpdrpE8ha85IgwGCWnyzR0u2A==
X-ME-Sender: <xms:ihwOYxF-gtXhYFqQJo7JIBVVU8iB0uErjaw5Yr3-Fh1cr0SJwBUffA>
    <xme:ihwOY2UPdWMT9cJyV5dJiIQLU6iOuqnZjK75Yut5el5nvoMImWhG-QBpPN7pH03fg
    hPXVtF8AArzU6AZvfU>
X-ME-Received: 
 <xmr:ihwOYzKkKEOA6p-7I0_O_xdmXJQnUf0fDg0LJef07IW7K3a4jV508S4m7ggXh1FiQ_V5-4bjylw-PoNgyKEKcdWKQup-Oiefn5wCU1xCYbTBj0HkNdQAMxPq>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdekfedgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihesghhh
    vghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepieeiudeuieefvdduvdevueevve
    dvkeeufefgkedufeeuleeukeetkeekkeejieelnecuffhomhgrihhnpeihohgtthhophhr
    ohhjvggtthdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:ihwOY3FBzhqMBI_2dJphdPpGW4tMkKUznykzgDtSxMv3hgM5Q_A31A>
    <xmx:ihwOY3UnDUedLQJ8Ra0zJJggcW2BlNzb_WvsKai1KNhl9rHfS5g-CA>
    <xmx:ihwOYyOHz2jnNd3yvQ8MYTocR3-EbIdCHrQfy1QfhY0q4lhcVEV6Bg>
    <xmx:ihwOY-ep507AnAA-Ny3zH6xo9H5B6NS1cARteJEkBtf4w6iXyZzopw>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 Aug 2022 10:19:54 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [kirkstone][PATCH] linux-yocto: Fix COMPATIBLE_MACHINE regex match
Date: Tue, 30 Aug 2022 16:19:28 +0200
Message-Id: <20220830141928.3714283-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 14:20:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170073

From: Andrei Gherzan <andrei.gherzan@huawei.com>

With the current regex expression, a machine that is not part of the
compatible could match the regex expression.

For example, consider the following COMPATIBLE_MACHINE:

COMPATIBLE_MACHINE = "qemuarm|qemuarm64"

A machine definition bringing in "qemuarm-foo" would match against the
COMPATIBLE_MACHINE pattern above (see base.bbclass for implementation
details).

Fix this by matching the start and the end of the string.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb       | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb      | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index d35632071b..75b1cb2a49 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -50,7 +50,7 @@ PACKAGECONFIG[dt-validation] = ",,python3-dtschema-native"
 # we need the wrappers if validation isn't in the packageconfig
 DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'dt-validation', '', 'python3-dtschema-wrapper-native', d)}"
 
-COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv32|qemuriscv64)"
+COMPATIBLE_MACHINE = "^(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv32|qemuriscv64)$"
 
 KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 9387c67cfb..aac5e97657 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -31,7 +31,7 @@ KCONF_BSP_AUDIT_LEVEL = "1"
 
 LINUX_KERNEL_TYPE = "preempt-rt"
 
-COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64|qemuppc|qemumips)"
+COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64|qemuppc|qemumips)$"
 
 KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 32c7db2c74..61200cc456 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -31,7 +31,7 @@ KCONF_BSP_AUDIT_LEVEL = "1"
 
 LINUX_KERNEL_TYPE = "preempt-rt"
 
-COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64|qemuppc|qemumips)"
+COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64|qemuppc|qemumips)$"
 
 KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index d7aa3281cc..d9b5e00378 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -24,7 +24,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarmv5"
+COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm|qemuarmv5)$"
 
 # Functionality flags
 KERNEL_FEATURES = ""
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 8eb138e78b..0707b41494 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -22,7 +22,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm64|qemuarm|qemuarmv5"
+COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm64|qemuarm|qemuarmv5)$"
 
 # Functionality flags
 KERNEL_FEATURES = ""
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 73a58e59a0..bc4430cc1c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -42,7 +42,7 @@ KCONF_BSP_AUDIT_LEVEL = "1"
 
 KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
 
-COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64|qemuriscv64|qemuriscv32"
+COMPATIBLE_MACHINE = "^(qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64|qemuriscv64|qemuriscv32)$"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 083f87727b..7ea8932186 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -51,7 +51,7 @@ KCONF_BSP_AUDIT_LEVEL = "1"
 
 KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
 
-COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64|qemuriscv64|qemuriscv32"
+COMPATIBLE_MACHINE = "^(qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64|qemuriscv64|qemuriscv32)$"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-- 
2.25.1


