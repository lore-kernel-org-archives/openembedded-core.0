Return-Path: <yashinde145@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC2AEC5479D
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 14:00:38 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.72192.1673272831004786926
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jan 2023 06:00:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KvjZt/TA;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: yashinde145@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id a184so6144407pfa.9
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 06:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7CrBUHniq2P2BDvi/FRdZdXqRvYdpEliAtSRY1dEHqA=;
        b=KvjZt/TABEcti2NFeeA2QBnbt2rPUy3QriG6B4Fs3x+MTAPT5R8gBCSDqmgJznTRGV
         NcKZ+8HL0xObY4KMq+M6MMfxx8WEmdsTQd7VTZQJyKegT5PbHzX0+lL+9kLtr8DiC7bw
         M23w0XRR11p7qzY4k8ZX7eOy9zThxDT//XByRoPLrkkFIR+uqIigzDjypwDODHKI58/v
         I96nutnu7sa0TVFHFV3blnLaa7MHAPiWpuBlerKWw1ySWFKrYfLrhlXZ+F6reM60ycJF
         rxVVS2MgMfw2HX8tLqEoZrwK3mEbG7QPSTAU4bhAMDHIxk8O4wdSr15P6NkNtIIhFGgJ
         taZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7CrBUHniq2P2BDvi/FRdZdXqRvYdpEliAtSRY1dEHqA=;
        b=RNweaRpJz5pN/Sw7yO0KHpMMrEbBmXLlmnEFzn91HVr9C3OOJ0I+jmilNU4ttCwENs
         H+NYx5BdqYtdrFr3scRpnGSzNdxnVcimlE1CCbJLY+dsmKox83V/8VDLXygexcH2mGUV
         7LV2Q6oBHV3vyxrT9vYTFtDWcn+9+TdFouaUXdK1W/pjhj2akY7uT4D45vrAEdhjj8G/
         L4RWpmIeHlQt32GsP6a0m+yiGrcMfOWu2qTPjkkziLopuTefRUANL277Yxb3ooIIx3tr
         fMdDymin8h0kF1du1llWUo2x2Yh0ld9zcpih0OxA44xGT99AhPghJ+6gp4rIVMz28cwZ
         AZJw==
X-Gm-Message-State: AFqh2krlINGtwNTJy8R0XZOpYeOQwyLazH01MWLC1rH0eZBIKHb9D513
	oOL1e3KlAvh6ggSddYxz/+AxQpTlomo=
X-Google-Smtp-Source: AMrXdXuUnOH+puxhstGvDKBMuowekM/IczYH+kH4PUp2/R9YxZVmz+HZQh0qD4fk/ZMdzaLnksrHXQ==
X-Received: by 2002:a05:6a00:1da3:b0:589:d831:ad2a with SMTP id z35-20020a056a001da300b00589d831ad2amr850844pfw.6.1673272830213;
        Mon, 09 Jan 2023 06:00:30 -0800 (PST)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id j123-20020a62c581000000b00576d76c9927sm6116128pfg.106.2023.01.09.06.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 06:00:29 -0800 (PST)
From: Yash Shinde <yashinde145@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Yash.Shinde@windriver.com
Subject: libstd-rs: Build in the release mode to avoid error Issue: LINCD-7172
Date: Mon,  9 Jan 2023 19:30:05 +0530
Message-Id: <20230109140005.234301-1-yashinde145@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 14:00:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175685

When mozjs in firefox is built with DEBUG_BUILD = "1"
in local.conf, it will fail with the following error:
   rustc-1.56.0-src/vendor/compiler_builtins/src/int/specialized_div_rem
/asymmetric.rs:57:
   more undefined references to `core::panicking::panic' follow

Switch to building libstd-rs in "release" mode as that works
around the issue and builds mozjs successfully. This is a
work-around that can be used until the root cause of the debug
build error is resolved.

(LOCAL REV: NOT UPSTREAM) -- to be sent to oe-core

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../rust/rust/LINCD-11387.patch               | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/rust/LINCD-11387.patch

diff --git a/meta/recipes-devtools/rust/rust/LINCD-11387.patch b/meta/recipes-devtools/rust/rust/LINCD-11387.patch
new file mode 100644
index 0000000000..3e84aa7232
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust/LINCD-11387.patch
@@ -0,0 +1,43 @@
+From 45731fb0f735bc287e56b6fd6c93b56966195647 Mon Sep 17 00:00:00 2001
+From: naveen gowda <pgowda.cve@gmail.com>
+Date: Mon, 29 Nov 2021 21:40:27 -0800
+Subject: libstd-rs: Build in the release mode to avoid error
+
+Issue: LINCD-7172
+
+When mozjs in firefox is built with DEBUG_BUILD = "1"
+in local.conf, it will fail with the following error:
+   rustc-1.56.0-src/vendor/compiler_builtins/src/int/specialized_div_rem
+/asymmetric.rs:57:
+   more undefined references to `core::panicking::panic' follow
+
+Switch to building libstd-rs in "release" mode as that works
+around the issue and builds mozjs successfully. This is a
+work-around that can be used until the root cause of the debug
+build error is resolved.
+
+(LOCAL REV: NOT UPSTREAM) -- to be sent to oe-core
+
+Signed-off-by: naveen gowda <naveen.gowda@windriver.com>
+Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
+---
+meta/recipes-devtools/rust/libstd-rs_1.66.0.bb | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb
+index 8802e9790c..c5295187f8 100644
+--- a/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb
++++ b/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb
+@@ -24,9 +24,12 @@ RUSTFLAGS += "-Cembed-bitcode=yes"
+ # Needed so cargo can find libbacktrace
+ RUSTFLAGS += "-L ${STAGING_LIBDIR} -C link-arg=-Wl,-soname,libstd.so"
+
++CARGO_BUILD_FLAGS:append = "${@' --release' if d.getVar('DEBUG_BUILD') == '1' else ''}"
++
+ CARGO_FEATURES ?= "panic-unwind backtrace"
+ CARGO_BUILD_FLAGS += "--features '${CARGO_FEATURES}'"
+ CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
++BUILD_DIR = "release"
+
+ do_compile:prepend () {
+     export CARGO_TARGET_DIR="${B}"
-- 
2.25.1


