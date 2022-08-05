Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5136C48BE4
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 13:13:30 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.6785.1659705205728996451
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T9W6CdX0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id z17so3227787wrq.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=8njVWIB42DTFJ4e46cdOmMEnu5wx7q5RlwC7hZ5ZGuA=;
        b=T9W6CdX0jKSiKDruyZ3a47rsgAgzzytFW6FuACjz6Qk1ZI3CHPNoP1hF/Ltn0y+nGW
         FBCuHrHNxgjCq2rkJw+aQuBbVOW9Y/ynGhdCNe0YDH/ZiBa2NZEBrNmSbvdC4GORdIs1
         eOSWBY2V5buXSD0OijW+sxoFvKPn0VsoQ7+Yc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=8njVWIB42DTFJ4e46cdOmMEnu5wx7q5RlwC7hZ5ZGuA=;
        b=KnUudIZ6Snx+tQn3P+CL8A0rZif8ecbKz9i75OyRL+XEeY3vMyOc3tWaAFFTcersjO
         pGMCY4LAxab/OlaazklkmfOBJEBKcLtxC1OORiMASECNF5SywYuPjmAce7kGf9MkM6wI
         T4ix2PCQqIruThBze1sq5WeiHS/5TGyoNL9mjL/VTfK7ygZBUXfjqiYwv1/pBKHaknV8
         Wtg3dc1RpgAx0Nv+pt1JISgWQUaiWXSzYEs3ebXKUHuUaeJK/9XOXxKV7SyBPIH77cL/
         /kTzoqGxex9l3UIKdUISx3p8/s6P2t99sDJJVF1ETAPojGLfxPW5kuNyTABhUs9qoYhF
         iByw==
X-Gm-Message-State: ACgBeo2RQW0+cIEfBriqOvEYBi5q4bcQE2qWjJ9VTJDMnGxyrB2b6YIx
	/Ghb0iSwoHiY237Qdtk+5+RLVhfmzW8FRQ==
X-Google-Smtp-Source: 
 AA6agR4XyE1iORuiL4VjIcpIA1AMDce1slZzwanTzvsSm2c6SwM8DktB+7ymaiq7woqYWEjBVE9LEQ==
X-Received: by 2002:a5d:40c7:0:b0:220:6407:6fc2 with SMTP id
 b7-20020a5d40c7000000b0022064076fc2mr4307974wrq.352.1659705204026;
        Fri, 05 Aug 2022 06:13:24 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f483:fcb0:1452:5a5a])
        by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c204c00b003a51a0d35e7sm1908901wmg.37.2022.08.05.06.13.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 06:13:23 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 29/29] rust: Ensure buildpaths are handled in debug symbols
 correctly
Date: Fri,  5 Aug 2022 14:12:52 +0100
Message-Id: <20220805131252.3706794-29-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
References: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 13:13:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168963

To ensure buildpaths aren't encoded in the debug symbol output, ensure
we pass our prefix remapping compiler options in.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/rust/rust.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
index d0f7467a887..7e302b59929 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -177,6 +177,8 @@ rust_runx () {
     unset CXXFLAGS
     unset CPPFLAGS
 
+    export RUSTFLAGS="${RUST_DEBUG_REMAP}"
+
     # Copy the natively built llvm-config into the target so we can run it. Horrible,
     # but works!
     if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} != ${RUST_ALTERNATE_EXE_PATH} ]; then
-- 
2.34.1


