Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 337D0C433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 09:17:19 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.4030.1667294237287214637
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 02:17:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O0F+S+qD;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id j15so19277771wrq.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 02:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wFFe2tcknMMyaCQNrGq3g8cLFUVjp/l8CkMxqJQ+l60=;
        b=O0F+S+qDHLrKfxtwfDldIawEEVoXkPgtI8GFH4a+4fbvaTYPXwEp7SO8L4TaBv2mUe
         6gNXjT/5ShvK1wNlIhiYluRz9XQY+OnRdlfXw3NuL4DMiNfgkUBHpA9Qu16wGVG3mB8a
         l2OyFOazKXcRueJaHAI2Tj5vomFi/iSQBzlY28PIjGpw54w/qBsoEq4Z1AtTlsJewwxh
         Wt/OY9oYrIlF3Ypt07FpTzmsV2y46dsf03TWleUp0SsGDB+YbtzTspWdVMDLLsZMa2cx
         dVGjyEU9/PD/ulY9zbEZPTjBdVZLuBuH1GmgJ4NCGOH0JAXt1MWzU1tUX0LjV2qTRGUe
         tTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wFFe2tcknMMyaCQNrGq3g8cLFUVjp/l8CkMxqJQ+l60=;
        b=6OFmUIwbr64lt+uuvU4CSoSOd/T0gcJZEzOdmuIe1g04vHyGA8m/xwDJBxFLb6N0xh
         VnPL/oiDIsnISMTGcwJ6iXuJbHzQA8Id+1qCqMcP4Vto0xhXb0U53OHTenIHptPZz2jU
         A3BITYXCmTxj8EKfnlxzZ1QbzsLLNvgcsTFF6M9rIlrruSDIskE8OauAsenUFbNWv0VE
         EvXbJEbR0311QkndnwNoTQ+RlQk0gdYwvXTBzCY7HZMV7OknGNjypwcG++xiXfLVqd0Y
         vv1wUgdLuPzIDuK4K9agfZMn9rmo4jgZ7aHYU2Ey/95cZl7XuR/fFCpOUI5IThVVtFHX
         ra6Q==
X-Gm-Message-State: ACrzQf018h3B7KCvOnetrJHKG5S+ZoxyDlOvLmXFpWecV2223iqPHzl4
	zkXahubwopjZ8l2m4kAH1W7YA33Tw60=
X-Google-Smtp-Source: AMsMyM6W03JXwk8gpYKMaob6cOYGXK4T/f8qyRylTPPAILF/8l7lYl/LA1wCm34BBLq2/nx6x6YVPA==
X-Received: by 2002:adf:f8c3:0:b0:236:9c97:6f6b with SMTP id f3-20020adff8c3000000b002369c976f6bmr10542443wrq.548.1667294235623;
        Tue, 01 Nov 2022 02:17:15 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id n4-20020adfe344000000b002365f326037sm11447209wrj.63.2022.11.01.02.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 02:17:15 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] rust-common.bbclass: use built-in rust targets for -native builds
Date: Tue,  1 Nov 2022 10:17:09 +0100
Message-Id: <20221101091709.1029267-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 09:17:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172354

Rust targets have the form of 'arch-unknown-linux-gnu' while
oe's native targets are 'arch-linux-gnu', e.g. omit the vendor.

The effect this has on rust-native builds is that rust first builds
itself as stage0 for arch-unknown-linux-gnu, then builds itself
again for arch-unknown-linux-gnu, then finally uses the compiler
from second step to 'cross-compile' a compiler for 'arch-linux-gnu'.

This last step is really not necessary, and we could save 4 minutes
out of 12 if it is eliminated. Which is what this patch does
by setting the target directly to 'arch-unknown-linux-gnu'; rust's
build system then shortcuts the build process after the second step.

Given a working rust-native will be needed as early as possible in a
typical yocto build (e.g. when in a not too distant future making a
useful kernel will not be possible without rust), producing it faster
is important.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/rust-common.bbclass | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-recipe/rust-common.bbclass
index 93bf6c8be6..3338de7502 100644
--- a/meta/classes-recipe/rust-common.bbclass
+++ b/meta/classes-recipe/rust-common.bbclass
@@ -53,12 +53,9 @@ def rust_base_triple(d, thing):
     else:
         arch = oe.rust.arch_to_rust_arch(d.getVar('{}_ARCH'.format(thing)))
 
-    # When bootstrapping rust-native, BUILD must be the same as upstream snapshot tarballs
-    bpn = d.getVar('BPN')
-    if thing == "BUILD" and bpn in ["rust"]:
-        return arch + "-unknown-linux-gnu"
-
-    vendor = d.getVar('{}_VENDOR'.format(thing))
+    # Substituting "unknown" when vendor is empty will match rust's standard
+    # targets when building native recipes (including rust-native itself)
+    vendor = d.getVar('{}_VENDOR'.format(thing)) or "-unknown"
 
     # Default to glibc
     libc = "-gnu"
-- 
2.30.2


