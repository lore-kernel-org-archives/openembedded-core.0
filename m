Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87583C001E0
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 11:13:26 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.29845.1690542796810683687
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jul 2023 04:13:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DTxrcbE9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3fe104df822so3426365e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 04:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690542795; x=1691147595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mC5Q3CJQjfZBnzobPK/5BgFwYUIUC/+n69fLxojd9vY=;
        b=DTxrcbE9I0p5A+kfH9QkxNIG1zB/n/W/ybdHhsDqTm2GXbRQ0C3/UKpBSQ1a14Y9ME
         2Zk/Hl4qxlmkkCepLRYvo9Ogs3dH1akmD/22Wb2h1Nssx042p6dybLfG+FL4/YkZiRFv
         sN+EjP0lzzmoczyyCOv1H6S8eIytWyAhRiLUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690542795; x=1691147595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mC5Q3CJQjfZBnzobPK/5BgFwYUIUC/+n69fLxojd9vY=;
        b=RRK1CZqbHUzjoFFegGerDRg+lG5nraecuoXMqUB8j07ixbBgqVMJtcskYA4wIf4pkF
         gwwOJ7NyTMOnp0t/1iEkhO9LtXM+1q+Igt3FCTdcVpbk0qdrR0pyRTx4XUQo6nlwmFFU
         dmwajnB4ivH3HE0Klh2zvrBrNbSeU9D/BEByBdeZ1cmbGWFb4OazBbax63a4822a3cEg
         xDwvJHdX+9EtSdd1O4aC1bIPj4628QPMYXtZh/2L1G55YE0qy5O6Lu/TXXgnPI8xjpPS
         5lvNgW3K4/gQPbS1dSeM55yj0SpNfYvpxrXgq4HHNKGy2hnX5cwvw3HiLc2R/A6VeAg8
         yYEA==
X-Gm-Message-State: ABy/qLYJZOC3HOiWEKroKRop97Oqscudk03HnDsH9lva4jIj1kIDfYHK
	xA8dmwp2DeVRhSQnRM5jVr2JK2wmS2zuFN5mF1s=
X-Google-Smtp-Source: APBJJlHMoLX2qCGa0WbBfQ5a2VssyjdVck/Po4HH1QzuWOjn2xgip01LMPNqGVVrkODVkweQF31g4w==
X-Received: by 2002:a05:600c:2213:b0:3fd:e94f:1283 with SMTP id z19-20020a05600c221300b003fde94f1283mr1708037wml.1.1690542794823;
        Fri, 28 Jul 2023 04:13:14 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4e39:f3a8:af2d:87a2])
        by smtp.gmail.com with ESMTPSA id k17-20020a7bc311000000b003fc02218d6csm6730736wmj.25.2023.07.28.04.13.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 04:13:14 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] ltp: Add lernel loopback module dependency
Date: Fri, 28 Jul 2023 12:13:10 +0100
Message-Id: <20230728111311.1665976-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230728111311.1665976-1-richard.purdie@linuxfoundation.org>
References: <20230728111311.1665976-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 11:13:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185023

The qemuarm64 kernel builds loopback device support as a module and it isn't included
in the image leading to ltp test failures on that platform.

Add the missing kernel module RRECOMMENDS to avoid this and fix those errors.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/ltp/ltp_20230516.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/ltp/ltp_20230516.bb b/meta/recipes-extended/ltp/ltp_20230516.bb
index e4ba3c68724..6c97dce6c32 100644
--- a/meta/recipes-extended/ltp/ltp_20230516.bb
+++ b/meta/recipes-extended/ltp/ltp_20230516.bb
@@ -113,6 +113,8 @@ RDEPENDS:${PN} = "\
     tar \
 "
 
+RRECOMMENDS:${PN} += "kernel-module-loop"
+
 FILES:${PN} += "${prefix}/* ${prefix}/runtest/* ${prefix}/scenario_groups/* ${prefix}/testcases/bin/* ${prefix}/testcases/bin/*/bin/* ${prefix}/testscripts/* ${prefix}/testcases/open_posix_testsuite/* ${prefix}/testcases/open_posix_testsuite/conformance/* ${prefix}/testcases/open_posix_testsuite/Documentation/* ${prefix}/testcases/open_posix_testsuite/functional/* ${prefix}/testcases/open_posix_testsuite/include/* ${prefix}/testcases/open_posix_testsuite/scripts/* ${prefix}/testcases/open_posix_testsuite/stress/* ${prefix}/testcases/open_posix_testsuite/tools/* ${prefix}/testcases/data/nm01/lib.a ${prefix}/lib/libmem.a"
 
 # Avoid stripping some generated binaries otherwise some of the ltp tests such as ldd01 & nm01 fail
-- 
2.39.2


