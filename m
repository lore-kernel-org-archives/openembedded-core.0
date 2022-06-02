Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E071AC43334
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 16:53:03 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.1571.1654188781214858912
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:53:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=oM3AZMXA;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id e66so5214264pgc.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VkbN5rB+tnd1I5hVr9BTZbGy1c+22guOXSzDuhvo5s4=;
        b=oM3AZMXAGePILmIj4/h4xgiPwObBdLMwvD+HI8EDMEHaIPSiW7lhEnvmNd42BWtmMW
         oIOF3HklMzcgsCYxC4BvwWM3cRzXZ44weEKpkJ/eGm7SgqQjzAl+P4Tyzal9ojBMwB62
         dPfaefTfjJTgocQgw9bvBgYUj7hZ08mPFFumxj/6SJ0vpDmF4niEqu7EHivinWYo7gBt
         UkJTbq8LBlXdgoJxtEJs3zw2dUNaht33CznQ28A4sFpWvRKSKR+vdfkAvrGMnEmmzrQ1
         3Z8ZmKm1u5ff0QvHnGQkR0GwMIEexyVk5h2TUZABHSL1GWPbQCqFxfMB3VXDcDE+ZFHv
         p1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VkbN5rB+tnd1I5hVr9BTZbGy1c+22guOXSzDuhvo5s4=;
        b=tk4Br9oAMPq0tBc1dUX5jdu7iISQOGGChZDR15SCxdXkeQQx/WRwZ5CyLyR6ww955a
         tipJdu+m0IgTsH1aiHFgw5cH4HMeqWpDysINEp7FNb07SzvtTe+tRlGkmkVMH61pZISl
         QZF4nRb/eAbhk4OigxW3GE4nwj0MOkx0O2BuiTbTaZfFP0/Q3eyIW8CB73nSwS3cMDWg
         FW7HBdIZ+XRna+lXIIZzu/QvjfetQm2Li0rkpBbqg5dAnehqTpPvpC0or+sjXL9dJqIa
         cuPY8XoU5qp79PXCvG0TTcinUT++MgLCudi/an6lmh/4gnaT4uymPUm2wusBKAh2nZKb
         gzug==
X-Gm-Message-State: AOAM532WSWXeYN5UcA5zPXwAQ2eaBB7oP567MnZ3MRCjmMmcVc3HU0KE
	hH3CS5n11LQpP/84F5rCMmb0jLmAkdl7e+Sb
X-Google-Smtp-Source: 
 ABdhPJzDHxDVy9r/C2voHtkjXjaItNur3S8YMUG2XnyZZTfgGHYq14pKO+zNFDJRQGiWTemC5pxE+g==
X-Received: by 2002:a05:6a00:1487:b0:518:b952:889b with SMTP id
 v7-20020a056a00148700b00518b952889bmr6064126pfu.43.1654188782292;
        Thu, 02 Jun 2022 09:53:02 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i188-20020a626dc5000000b0050dc762815asm3782233pfc.52.2022.06.02.09.53.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 09:53:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/26] rust-common: Fix sstate signatures between
 arm hf and non-hf
Date: Thu,  2 Jun 2022 06:51:53 -1000
Message-Id: 
 <424b81ae680057a8c285157ea081f167381b6c62.1654188574.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654188574.git.steve@sakoman.com>
References: <cover.1654188574.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 16:53:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166498

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Building with MACHINE=qemuarm and MACHINE=qemux86-64 causes rust-native
to rebuild. The reason is all the ingredients into the RUST_*_SYS
variables are being tracked but that doesn't really make sense in this
case:

$ bitbake-diffsigs tmp/stamps/x86_64-linux/rust-native/1.60.0-r0.do_rust_gen_targets.sigdata.63* tmp/stamps/x86_64-linux/rust-native/1.60.0-r0.do_rust_gen_targets.sigdata.34*
NOTE: Starting bitbake server...
basehash changed from 860b8f11b10182dc5b2737f62cdb697477f714adb63eeb4d4b932d67cac8eec2 to 9379e8b9df9696e8056fec7d1534661f34dda073f6d816e241b09a2dff76ae2d
Variable rust_base_triple value changed:
@@ -36,4 +36,4 @@

 # In some cases uname and the toolchain differ on their idea of the arch name
-TUNE_FEATURES{callconvention-hard} = Set
+TUNE_FEATURES{callconvention-hard} = Unset

Switch to using the final variable value for sstate signature purposes
which avoids this issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 38b61aeaf877f6a34c3c0060c175119975ebd782)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/rust-common.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/rust-common.bbclass b/meta/classes/rust-common.bbclass
index 02a538258a..cb811ac5da 100644
--- a/meta/classes/rust-common.bbclass
+++ b/meta/classes/rust-common.bbclass
@@ -117,8 +117,11 @@ RUST_BUILD_ARCH = "${@oe.rust.arch_to_rust_arch(d.getVar('BUILD_ARCH'))}"
 # its likely best to not use the triple suffix due to potential confusion.
 
 RUST_BUILD_SYS = "${@rust_base_triple(d, 'BUILD')}"
+RUST_BUILD_SYS[vardepvalue] = "${RUST_BUILD_SYS}"
 RUST_HOST_SYS = "${@rust_base_triple(d, 'HOST')}"
+RUST_HOST_SYS[vardepvalue] = "${RUST_HOST_SYS}"
 RUST_TARGET_SYS = "${@rust_base_triple(d, 'TARGET')}"
+RUST_TARGET_SYS[vardepvalue] = "${RUST_TARGET_SYS}"
 
 # wrappers to get around the fact that Rust needs a single
 # binary but Yocto's compiler and linker commands have
-- 
2.25.1


