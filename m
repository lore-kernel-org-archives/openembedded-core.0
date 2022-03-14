Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C2E2C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 22:48:45 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.3428.1647298124344894461
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ecaQfzca;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id
 r190-20020a1c2bc7000000b0038a1013241dso421865wmr.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gLKH5epzSN0mzlhtJ10RrUzCLL/pTwnX97ocHAPZ3HI=;
        b=ecaQfzcaCTBMeFLvrrkBoHCzQ2xJOj6QrZYGobbbxeuyAiwbD1phRXPtrHcELNGs+N
         FnryW9dde59BHPMoEH/aPZPKV8anmgkGCOcAT6XnOeaf5WkaU6fGiHQUmXYRy4DlI0BR
         N/vSvCdq8xj7oDxTCdyWI3p4VyeOQnJgO4NJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gLKH5epzSN0mzlhtJ10RrUzCLL/pTwnX97ocHAPZ3HI=;
        b=vvcKAxUWANiQeEKnNbP8p3r6xu2d8mgeihXFn4ZnOkKorqnPUfi9ULoO+s/Gva10I5
         IufbLqadlxjlldMAUQ8CJvoMFodbdTWRTScT4619bAX71h8QTwvjWLq85uIArwDt0UHj
         mayRHecLszYipaL4e6ZbcLZCMlkoSFrIMPAB8sZp+reqjj0oeLF3MzNnfww0gCpbbpWz
         8HIqJCq/Sl9rnbEE3zC7iRj2TH04X/8nV8fbqVKy6/G9atx60DfxagYNT94U28nibyYl
         8EV4kyR5rOjdbySTaO6gbZ+6sg+QA4O2+9RM2lweVRQ1RL/oFC9OkfX3uv7mKuxL7ElU
         hSmQ==
X-Gm-Message-State: AOAM530hRoMEPnZAFvcVNQ9bcWuBk/wvyEqsUwIr5qu7vJVHzUS0eAaf
	U3jYidXmA+j5/PKOtiz2ZALuYGhnKgOHhSQZ
X-Google-Smtp-Source: 
 ABdhPJy5JxqfOygSzMnLyt0yTzwrAFn3bqE0/IKY47BlEdmpmRRctKYUSOklLTafEOp6ZZyPjUv4CA==
X-Received: by 2002:a1c:44c4:0:b0:389:e7e6:282a with SMTP id
 r187-20020a1c44c4000000b00389e7e6282amr997350wma.206.1647298122568;
        Mon, 14 Mar 2022 15:48:42 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm788599wmb.3.2022.03.14.15.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 15:48:42 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 04/33] setuptools3_rust.bbclass: move from meta-python
Date: Mon, 14 Mar 2022 22:48:08 +0000
Message-Id: <20220314224837.834776-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
References: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 22:48:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163170

From: Tim Orling <tim.orling@konsulko.com>

setuptools-rust is a plugin for setuptools to build Rust Python extensions
implemented with PyO3 or rust-cpython.

Compile and distribute Python extensions written in Rust as easily as if
they were written in C.

This class inherits pyo3.bbclass (and therefore cargo.bbclass) and
setuptools3.bbclass to make it easier to build Python modules with Rust
extensions.

Need to call pyo3_do_configure to properly setup the PyO3 environment
for cross-compiling.

Need to call cargo_common_do_configure to setup cargo_home/config so
that the linker properly finds e.g. crti.o and crtbeginS.o

It is strongly recommended to provide crates needed for your recipe
using the crate:// fetcher. This can be helped with the cargo-bitbake
command [1].

If you choose not to use the crate fetcher, bitbake vendoring will not
work with setuptools-rust, as it errors out immediately because it cannot
find pyo3 or some other crate. The (strongly discouraged) workaround for
this is to set:

CARGO_DISABLE_BITBAKE_VENDORING = "1"

[1] https://crates.io/crates/cargo-bitbake

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/classes/setuptools3_rust.bbclass | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta/classes/setuptools3_rust.bbclass

diff --git a/meta/classes/setuptools3_rust.bbclass b/meta/classes/setuptools3_rust.bbclass
new file mode 100644
index 00000000000..fb11f08f89c
--- /dev/null
+++ b/meta/classes/setuptools3_rust.bbclass
@@ -0,0 +1,11 @@
+inherit pyo3 setuptools3
+
+DEPENDS += "python3-setuptools-rust-native"
+
+setuptools3_rust_do_configure() {
+    pyo3_do_configure
+    cargo_common_do_configure
+    setuptools3_do_configure
+}
+
+EXPORT_FUNCTIONS do_configure
-- 
2.32.0


