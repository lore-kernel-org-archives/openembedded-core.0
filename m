Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED188C7EE2F
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 16:54:45 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.179.1686329676091544097
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 09:54:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=jGInWLaD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-65242634690so1618005b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 09:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686329675; x=1688921675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zXgoJGI27q/QEdftxR3gdzTfDK6kOv2Kk61yqeWWSAM=;
        b=jGInWLaD+NWwYt0nul+5pGG+d19LMYo42ymuzrOuPzF7J5k2uZ28LIGGKTlO/7LZgM
         TmznJFS/QODKDpYDYmOzLaKC4lcAciEqdPiHbVWYLRPnVCN5CAjNi2th1ORpCXgwQBUM
         Ym6yc0hsjD6Z6g5J7MKQIuQicpZvpFatlYex8xi7FFm1i3S4t9ZFMlTfuxjjGHu5gBSQ
         oJKKwnRaqIzHVhLcccubEuL2RCTLoJa4JnghmBeBupASDgOLMPOVcpXcJvq/Wrqn5NMW
         P/d7fKIX8IuICMMi9jGd/TngvnikYel3iHQEWTmpwuM7TFSJJ8o+QTctgfpivcLqSnQo
         KtZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686329675; x=1688921675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zXgoJGI27q/QEdftxR3gdzTfDK6kOv2Kk61yqeWWSAM=;
        b=jWJUdsHQkqjEz2B12wEzBwbofoH6Wiyv8B63QX71dzpWWlUVZNJrMCW81kBfs5T0vf
         XWldhvYSsdO3RqwlkpBIGRJUGlDIAaCUthABYkg6CwtzSTFgQMjQWJNszS8zZ2+ZrIx+
         tjt6i7SPROQTDQqCaHx9MNFvj1UCjOl2EFvdJQvH00jXs1Ns7e8OiTxzK947JZmaGtJ5
         oLXVVYoO036ppjbfwnv5hVO/bMlW2JMPosShmFXQ7zHDIVvreOmQ/xRHNO72J3uazKGT
         XAy13HmONsuMvJHKdngOaLPhHmF55KbYSrgRVJ7XlLlfyEQdCt0Ec4mau/ULor9VQ3m0
         bn8A==
X-Gm-Message-State: AC+VfDx5mQII+9rEBfI1bluCihvOivKYh/n/MUqdeFVlPskC5bMQCiaW
	z7tJiMOb2vPqSBTdwzNBCdwcW1bi9hVJkVPdtyk=
X-Google-Smtp-Source: ACHHUZ7HxePJZvnYDmkgCjfF7aIskCRXEuU9hmwE6bXbekJYI1Wfp2i3KVooy/a0Vj60SLEqaLeiLg==
X-Received: by 2002:a05:6a20:729a:b0:10c:c5df:8bb7 with SMTP id o26-20020a056a20729a00b0010cc5df8bb7mr1662187pzk.30.1686329674979;
        Fri, 09 Jun 2023 09:54:34 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020a62b618000000b0065980654baasm2901071pff.130.2023.06.09.09.54.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 09:54:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 19/30] linux-yocto: move build / debug dependencies to .inc
Date: Fri,  9 Jun 2023 06:53:46 -1000
Message-Id: <67a972a1d8c2ff271cbbca68a2805ea31f079fa1.1686329289.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686329289.git.steve@sakoman.com>
References: <cover.1686329289.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 16:54:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182585

From: Bruce Ashfield <bruce.ashfield@gmail.com>

When the architecture and debug specific build and runtime dependencies
were introduced, they were only applicable to "newer" kernel versions
and were enabled in the version specific recipes.

These are now common dependencies, so we can avoid the duplication and
move them to a common location.

We also change the adhoc nature of the existing elfutils definition,
as it is now detected by the kernel build and we no longer need the
work around to the native sysroot.

Finally, we change the undocumented KERNEL_DEBUG_OPTIONS to KERNEL_DEBUG
and use it to conditionally enable features that need extended support
(and support sometimes out of oe-core).

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7ddeb149e7a78bedeb945898fec5e8f13b7c5711)
Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc    | 10 ++++++++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb |  4 ----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 934591ff1c..04a8105e17 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -59,8 +59,14 @@ do_install:append(){
 # enable kernel-sample for oeqa/runtime/cases's ksample.py test
 KERNEL_FEATURES:append:qemuall=" features/kernel-sample/kernel-sample.scc"
 
-KERNEL_DEBUG_OPTIONS ?= "stack"
-KERNEL_EXTRA_ARGS:append:x86-64 = " ${@bb.utils.contains('KERNEL_DEBUG_OPTIONS', 'stack', 'HOST_LIBELF_LIBS="-L${RECIPE_SYSROOT_NATIVE}/usr/lib/pkgconfig/../../../usr/lib/ -lelf"', '', d)}"
+KERNEL_DEBUG ?= ""
+# These used to be version specific, but are now common dependencies.  New
+# tools / dependencies will continue to be added in version specific recipes.
+DEPENDS += '${@bb.utils.contains_any("ARCH", [ "x86", "arm64" ], "elfutils-native", "", d)}'
+DEPENDS += "openssl-native util-linux-native"
+DEPENDS += "gmp-native libmpc-native"
+DEPENDS += '${@bb.utils.contains("KERNEL_DEBUG", "True", "pahole-native", "", d)}'
+EXTRA_OEMAKE += '${@bb.utils.contains("KERNEL_DEBUG", "True", "", "PAHOLE=false", d)}'
 
 do_devshell:prepend() {
     # setup native pkg-config variables (kconfig scripts call pkg-config directly, cannot generically be overriden to pkg-config-native)
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 36f7ed8791..6640000d83 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -45,10 +45,6 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 LINUX_VERSION ?= "6.1.25"
 
-DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
-DEPENDS += "openssl-native util-linux-native"
-DEPENDS += "gmp-native libmpc-native"
-
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
 KMETA = "kernel-meta"
-- 
2.34.1


