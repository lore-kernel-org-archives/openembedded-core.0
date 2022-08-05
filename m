Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D96AC25B08
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 13:13:20 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.6767.1659705175208683315
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=J1MkEvYl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id l4so3179590wrm.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=DTo5j2e7SUYxAIASJznUSvw/QNvpiYxFi4QlTtDlUwc=;
        b=J1MkEvYlXHLaSz1YLtnob19fkr4VzSPZjb4SNCD7hjwmlA3bhR6wOi3ipresk5rZwR
         4LSW4xv3N4PVqKlLxw1aSrCzTPYDYse1o5Zp9oLvPAMZnKOrA9qjp8F2xKwKzf0EXYCq
         f7y2mWD0BAeKxR8rKC8VHiK1OZZKjRAXhq4NQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=DTo5j2e7SUYxAIASJznUSvw/QNvpiYxFi4QlTtDlUwc=;
        b=DoXIsMK+YHG6mDek6x2yIWfZTB4OI0P6DWILdaDoqDCqGLTcONBoUj5rbjNx4iXcac
         r9lLKyqBSRzehe6ar8IV6Ol7I1fDXzxRq4lAxcy2J7ZLj8eTaptoGNkQpvDy8QO0DK5T
         q+dKLABLBvzz7O4+PSqPN+cYtf17N169dWFwLeDYTL8QsVmj34s0BDxjuT2N2ul6rma1
         VXC8VAWeRnfqMNrFIa973U1htOUtWEBNdEqpwtnT5uUoKc4KQbNoDjvRsk8cGK+gZe50
         b3yfwP0JeiMC7/O2GwqxUvUy0HtqF4c6XcnUlwlc0CsyK1lBRU/Y9YWTxRc3SZU6HeOj
         Tn1A==
X-Gm-Message-State: ACgBeo3903uE8yBqQrWgemy1RZ9GVraVu0iAqbCnkNeZjMavGjVUxi38
	7JlRpwBmvCez2OmfuVM8XqlhyjKl7xY8jA==
X-Google-Smtp-Source: 
 AA6agR4x1uRQ6kC1VPMF3Sqd+G9kAhZWs3vUnLPshBpB5yrAcYeQ0ol83eQdXtEwuAHJXT8QxKFKzg==
X-Received: by 2002:a5d:5601:0:b0:220:7144:2938 with SMTP id
 l1-20020a5d5601000000b0022071442938mr4581005wrv.50.1659705198545;
        Fri, 05 Aug 2022 06:13:18 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f483:fcb0:1452:5a5a])
        by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c204c00b003a51a0d35e7sm1908901wmg.37.2022.08.05.06.13.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 06:13:18 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 24/29] rust-common: Set rustlibdir to match target expectation
Date: Fri,  5 Aug 2022 14:12:47 +0100
Message-Id: <20220805131252.3706794-24-richard.purdie@linuxfoundation.org>
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
 https://lists.openembedded.org/g/openembedded-core/message/168958

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/rust-common.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/rust-common.bbclass b/meta/classes/rust-common.bbclass
index 516b258c15e..8ee05f57f86 100644
--- a/meta/classes/rust-common.bbclass
+++ b/meta/classes/rust-common.bbclass
@@ -2,12 +2,12 @@ inherit python3native
 inherit rust-target-config
 
 # Common variables used by all Rust builds
-export rustlibdir = "${libdir}/rust"
+export rustlibdir = "${libdir}/rustlib/${RUST_HOST_SYS}/lib"
 FILES:${PN} += "${rustlibdir}/*.so"
 FILES:${PN}-dev += "${rustlibdir}/*.rlib ${rustlibdir}/*.rmeta"
 FILES:${PN}-dbg += "${rustlibdir}/.debug"
 
-RUSTLIB = "-L ${STAGING_LIBDIR}/rust"
+RUSTLIB = "-L ${STAGING_DIR_HOST}${rustlibdir}"
 RUST_DEBUG_REMAP = "--remap-path-prefix=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
 RUSTFLAGS += "${RUSTLIB} ${RUST_DEBUG_REMAP}"
 RUSTLIB_DEP ?= "libstd-rs"
-- 
2.34.1


