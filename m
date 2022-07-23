Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 464CECCA489
	for <webhook@archiver.kernel.org>; Sat, 23 Jul 2022 11:10:53 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.5151.1658574649859083794
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Jul 2022 04:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IlF/HhmI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id
 a18-20020a05600c349200b003a30de68697so5991718wmq.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Jul 2022 04:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2PO4y4L65vjtecf7C04hyEc+h3mKKYvgvQW7iGJpBgs=;
        b=IlF/HhmImAa44CSH6cZ/TyCLfMqo6lsBMfXZOUTEtI404MekVsKVI2CESoKZN13A7P
         TzqpmJDynaW4vBAaXxGgih1eLxdQ4fA5FVY3Or5mkahA/t5fbbPSt0JZtMKIC8jvlJXr
         sL1/grlLzFJqB9/1i1bD8CQjyM6y/w0qxSAb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2PO4y4L65vjtecf7C04hyEc+h3mKKYvgvQW7iGJpBgs=;
        b=wqQr7Cz/a012Zns1mtz9bDFnhG/KQbzFzIOezBNLmCXg7BYUm4HoQB3JXrtCCLp0+7
         bMUT7AV1hNY9MOr/iFOi6vu4+C+RP/9rl8qgydrgG74noQbNNnWKgdOhB/wlxSuGa4ie
         TkQ3M43AIM4DB8e11hQGc9ybAJhMQzzRNTB9LCjb1yV7f71PFZnh1q8QXIO7XkI6adhC
         oF0ziexqcBXKviAsagc8p2uLM02WccrQ5txrLWPjOT+Whz3D0VKrrnfUSyAKySqEiwoM
         mgpC0eNrIDJ9z5VYowYFSTfKYo/VFueqNXAqC5hYrkOqyRNfFK/ppGPm6nu6+AOdS1g8
         djsA==
X-Gm-Message-State: AJIora+MDa3G9pAAKu2xHwj44SwYomJ14Sh2nF91+D4YXw9qpNLduXTK
	mqxJmSKR6whlRjOSOILpTOv3DG1LkPmvlA==
X-Google-Smtp-Source: 
 AGRyM1skaG1VryYpWmF++cRP/EiGyab+0SS7WSk49Nu0wrZ+iOJwwBHyfq18KlH9aV/rlNT46M6bpw==
X-Received: by 2002:a7b:ca57:0:b0:3a3:205d:2533 with SMTP id
 m23-20020a7bca57000000b003a3205d2533mr15044272wml.67.1658574647920;
        Sat, 23 Jul 2022 04:10:47 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9bb3:b62f:20a1:a32])
        by smtp.gmail.com with ESMTPSA id
 f5-20020adff445000000b0021e5f32ade7sm3430181wrp.68.2022.07.23.04.10.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jul 2022 04:10:47 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] rust-cross-canadian: Fix ordering of target json config
 generation
Date: Sat, 23 Jul 2022 12:10:43 +0100
Message-Id: <20220723111045.1775562-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220723111045.1775562-1-richard.purdie@linuxfoundation.org>
References: <20220723111045.1775562-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Jul 2022 11:10:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168430

Based upon a patch from Otavio Salvador <otavio@ossystems.com.br>,
ensure the target json files are written in the correct order with
the most specific last incase it overwrites earlier files if the prefixes
match.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/rust/rust-cross-canadian-common.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian-common.inc b/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
index 1f21c8af26e..df4901f1fac 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
@@ -27,9 +27,10 @@ DEBUG_PREFIX_MAP = "-fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDP
 
 python do_rust_gen_targets () {
     wd = d.getVar('WORKDIR') + '/targets/'
-    rust_gen_target(d, 'TARGET', wd, d.getVar('TARGET_LLVM_FEATURES') or "", d.getVar('TARGET_LLVM_CPU'), d.getVar('TARGET_ARCH'))
-    rust_gen_target(d, 'HOST', wd, "", "generic", d.getVar('HOST_ARCH'))
+    # Order of BUILD, HOST, TARGET is important in case the files overwrite, most specific last
     rust_gen_target(d, 'BUILD', wd, "", "generic", d.getVar('BUILD_ARCH'))
+    rust_gen_target(d, 'HOST', wd, "", "generic", d.getVar('HOST_ARCH'))
+    rust_gen_target(d, 'TARGET', wd, d.getVar('TARGET_LLVM_FEATURES') or "", d.getVar('TARGET_LLVM_CPU'), d.getVar('TARGET_ARCH'))
 }
 
 INHIBIT_DEFAULT_RUST_DEPS = "1"
-- 
2.34.1


