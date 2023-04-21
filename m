Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58BEEC77B73
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 03:41:39 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.4040.1682048496650048628
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Apr 2023 20:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=AnEXuZ0q;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-63b64a32fd2so2426609b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 20:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682048496; x=1684640496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLYZ72hkzbcfOFbnoS/TBweotW/I8Vc3Ck0zlVJRuEU=;
        b=AnEXuZ0q5kXhjIMLzklTdBOAiSQU5lA93Z6DzUTtkV7/UomkElixWeA5br3JKCnWjx
         pgrkh49xdGe5YzP6XXRl0UKdcsY9syzoYTdAl2l5s2tX+IyoHmYmjNhl7Mh5IDzEh53q
         0M8BkstVp/9lHq7a46OnZbB9Wq6q8NCmDhus1nuUfoqracY7WnOwgvXsXeUK/itZv+NP
         2XNfTXHt7jIyS/bsJBRKkfUheK+8MIkFK2yhZC0nYPkrjD/QooMNXbEDI5zIwc3iddnZ
         z/dy9o2LGilfRMNaFTLCJXNWPFi/DgUJ6M7691GT8tV9Mn5av8lagaJI+MrlhInkDJIn
         g4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682048496; x=1684640496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLYZ72hkzbcfOFbnoS/TBweotW/I8Vc3Ck0zlVJRuEU=;
        b=VaUKdd5pOK6jl5iZdlgcN8hqWZg9TneZ2rC2GUGPU9bbG2gK6WsiKDijz7bqPHbpJE
         L+p3eK5E89XIRh3NMi3nuRHCXT10HY2rAXifiGd57NdeB/LdCA9ow4YSVEkQ5oLnNNFu
         JK1h0NPdDaZtXH2oc4R/FLM37Ie6eftHStvOJoywl16+aWtC4v0GJgEALDI3rgAIO2AE
         QQRm1nUU4PneFFN/Nsol80ogou6Tl+Wat1Ofr5o5jFiEG9Ruv3ZAH2A017pM4U7N3bwY
         F+8ajnycjqaOWOvMg8fyUQ64EmqWZ+FSOZUgbzA6mYLKsW2aW4d/DMrdcZA3cg6AqRq7
         RYoQ==
X-Gm-Message-State: AAQBX9dHyK9iwSWVSqiJJRkDV6765mcCSwX/0/m6aXOy1DZA+qZDsmi5
	IkyzzGTG8xcBHwa3/UPCPWOfVPYpi1WORw==
X-Google-Smtp-Source: AKy350a/3AlB+1XNME/alm6WOSzbqi8M4sPWzCE4+fDurqTUbGnPwxiNcc2y9FAAObUtqMqh6TVYlQ==
X-Received: by 2002:a05:6a00:aca:b0:63d:254a:3900 with SMTP id c10-20020a056a000aca00b0063d254a3900mr3887954pfl.5.1682048495722;
        Thu, 20 Apr 2023 20:41:35 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::ebd0])
        by smtp.gmail.com with ESMTPSA id v11-20020aa7850b000000b0062bc045bf4fsm2027199pfn.19.2023.04.20.20.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 20:41:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] acl: Disable misc.test on musl
Date: Thu, 20 Apr 2023 20:41:32 -0700
Message-Id: <20230421034133.1136343-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421034133.1136343-1-raj.khem@gmail.com>
References: <20230421034133.1136343-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 03:41:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180266

misc.test fails on musl due to nftw order, ignore it for now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/attr/acl_2.3.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/attr/acl_2.3.1.bb b/meta/recipes-support/attr/acl_2.3.1.bb
index 9cb19ed72f..9badd33254 100644
--- a/meta/recipes-support/attr/acl_2.3.1.bb
+++ b/meta/recipes-support/attr/acl_2.3.1.bb
@@ -61,6 +61,10 @@ do_install_ptest() {
         rm ${D}${PTEST_PATH}/.libs/libtestlookup.lai
 }
 
+do_install_ptest:append:libc-musl() {
+        sed -i -e '/test\/misc.test/d' ${D}${PTEST_PATH}/Makefile
+}
+
 RDEPENDS:${PN}-ptest = "acl \
                         bash \
                         coreutils \
-- 
2.40.0


