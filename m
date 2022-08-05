Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 880F6C00140
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 13:13:20 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.6771.1659705181226824020
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Jf2K03Bv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id
 i128-20020a1c3b86000000b003a3a22178beso3958614wma.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=zZ982Gna0b4HBPzqVaxZU3SRfWfC6p70dMYboDAx+gI=;
        b=Jf2K03BvWYlSFLDDsVvtP7r/HfDJXCNpwX4GhTlIqW2Wbck4oTE/k7P4TaAFwWf8T7
         n9uCXTjB6NgdFqvmWOcrV7KLBu61MhTpdvdpPgSJC8QuUi1Z0bPnFqJPUhnVBLVJnLu8
         n+zirxM4/43yUb97jJGBVC3X6JN0iYt6VlSzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=zZ982Gna0b4HBPzqVaxZU3SRfWfC6p70dMYboDAx+gI=;
        b=E9qENvFtvlQ/4gPdWWXDoL28+KBC/7aVCXAtDUIAUnbi10gMpyG0Rn9msr83FIEqRN
         Llh9cNcBXSI5XBEC1I/9BS2jPPceXTtabpLfcBFR+gZrUWNakTtKV//EVFUnXTef7QPY
         qekS6XL/ytQfa/LobY1e+GVis2LIKgJji/qBzOrAvgF9lNd82mtXc/ExWXcTgpfXe5tw
         Et1rZQWcN4mFqojlbpmwCb7ddfOtgIHBO5WkJ/W7QLjs7CLSOl9P6bIUTdrU1Lh2rtqV
         +fMy2/1v6jq8BIsH/ho4RY0VKU3QvA8kBa4mthlgOzdfzMdZiZW7BtVLDvUoorD9gU7G
         b4Ow==
X-Gm-Message-State: ACgBeo1Qi7h46OGVnbe5HrLWx9XhrOm+Y5LOei+ehX8Pmun6kXVJwRFU
	BA4VWN2yYnMiDux6on2Pu6YDeqabdMiZkQ==
X-Google-Smtp-Source: 
 AA6agR4cFDOQMirKfcKOlPt1j1gQBbxM6ng7vfol0uGuSJlangODSbgWYkkkU/EvSp1a2Vul3GvRSw==
X-Received: by 2002:a7b:cb0c:0:b0:3a3:2a38:5066 with SMTP id
 u12-20020a7bcb0c000000b003a32a385066mr4722596wmj.74.1659705189512;
        Fri, 05 Aug 2022 06:13:09 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f483:fcb0:1452:5a5a])
        by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c204c00b003a51a0d35e7sm1908901wmg.37.2022.08.05.06.13.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 06:13:08 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 16/29] rust-common/rust: Improve bootstrap BUILD_SYS handling
Date: Fri,  5 Aug 2022 14:12:39 +0100
Message-Id: <20220805131252.3706794-16-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
References: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 13:13:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168950

Move the "unknown" vendor workaround used during bootstrap to a
central location so it is applied consistently to all RUST_BUILD_SYS
values rather than some subset.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/rust-common.bbclass    | 5 +++++
 meta/recipes-devtools/rust/rust.inc | 7 +++----
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/classes/rust-common.bbclass b/meta/classes/rust-common.bbclass
index adcf96f0cd9..f2e99493fef 100644
--- a/meta/classes/rust-common.bbclass
+++ b/meta/classes/rust-common.bbclass
@@ -68,6 +68,11 @@ def rust_base_triple(d, thing):
     else:
         arch = oe.rust.arch_to_rust_arch(d.getVar('{}_ARCH'.format(thing)))
 
+    # When bootstrapping rust-native, BUILD must be the same as upstream snapshot tarballs
+    bpn = d.getVar('BPN')
+    if thing == "BUILD" and bpn in ["rust"]:
+        return arch + "-unknown-linux-gnu"
+
     # All the Yocto targets are Linux and are 'unknown'
     vendor = "-unknown"
     os = d.getVar('{}_OS'.format(thing))
diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
index 172cd22657d..5730887411a 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -23,7 +23,6 @@ CARGO_DISABLE_BITBAKE_VENDORING = "1"
 
 # We can't use RUST_BUILD_SYS here because that may be "musl" if
 # TCLIBC="musl". Snapshots are always -unknown-linux-gnu
-SNAPSHOT_BUILD_SYS = "${RUST_BUILD_ARCH}-unknown-linux-gnu"
 setup_cargo_environment () {
     # The first step is to build bootstrap and some early stage tools,
     # these are build for the same target as the snapshot, e.g.
@@ -31,7 +30,7 @@ setup_cargo_environment () {
     # Later stages are build for the native target (i.e. target.x86_64-linux)
     cargo_common_do_configure
 
-    printf '[target.%s]\n' "${SNAPSHOT_BUILD_SYS}" >> ${CARGO_HOME}/config
+    printf '[target.%s]\n' "${RUST_BUILD_SYS}" >> ${CARGO_HOME}/config
     printf "linker = '%s'\n" "${RUST_BUILD_CCLD}" >> ${CARGO_HOME}/config
 }
 
@@ -89,7 +88,7 @@ python do_configure() {
 
     # If we don't do this rust-native will compile it's own llvm for BUILD.
     # [target.${BUILD_ARCH}-unknown-linux-gnu]
-    build_section = "target.{}".format(d.getVar('SNAPSHOT_BUILD_SYS', True))
+    build_section = "target.{}".format(d.getVar('RUST_BUILD_SYS', True))
     config.add_section(build_section)
 
     config.set(build_section, "llvm-config", e(llvm_config_build))
@@ -136,7 +135,7 @@ python do_configure() {
 
     # We can't use BUILD_SYS since that is something the rust snapshot knows
     # nothing about when trying to build some stage0 tools (like fabricate)
-    config.set("build", "build", e(d.getVar("SNAPSHOT_BUILD_SYS", True)))
+    config.set("build", "build", e(d.getVar("RUST_BUILD_SYS", True)))
 
     # [install]
     config.add_section("install")
-- 
2.34.1


