Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3932AC433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 21:24:55 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web09.4697.1645478694514164840
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=edv89iGx;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 cp23-20020a17090afb9700b001bbfe0fbe94so394490pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=sO/EUa4XjVmllj2Nds/wBREbCBXakTql+3tYE1L8myg=;
        b=edv89iGxCOQuaFdVeHcPTZ3qA1iLCceiO97kRV0T+GEGjHlvQvgXWne9e88xrzmdro
         fyk82WGK36BJ1jwLaTLtOYEdrhmwfdeWQdDwSOcOjucBEvLZGPaRcEjoFvv6oPKsDW9t
         2WtzBqn+Gs+looTP8YEj72u2KdU9JLbgj/kpu3cWXmuXa8zJwYp4jKsuUAIF9rKNKNCb
         s3FfnzTOJzxPxnSKeADedu4Q3jQHV1xu0i3hXbPSxnWnLVSs1yFbHueemC1yxpVrwn6l
         bn9iq2yL98y5WUNJOMb2pyfwoEYuFWUBzYWVKfWWu0SVYDe9DptT21hl0sts6rbOH8pn
         vB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sO/EUa4XjVmllj2Nds/wBREbCBXakTql+3tYE1L8myg=;
        b=MUhMrNhCDFf7otee+ZKdi3o3pgTD67JeVjpd5vGBoWJAcAj/VdqjrEdhy5sGebVqKz
         xF0BYiI99OLP12FJt7kd92H5ZmMLjaffGleWQ+C9q332H104w9OYOyFZZVUoHzh4a/AO
         O5IEq3VlWpuo5hv+j6FnOFRHc7LgLQb9nec9bvU0pubNjLnMAKYt/Xya5WvKL4gS1m1m
         iVVftYzXZLg0GE8Qf0JLyO1jlsT9j5CPjty91UtIzy+usewxuUrY0JKkd+K0fSSIgGlo
         LgSQiu/N9sUbR9BnVIfASoUvxpEwvbrYb4rMvkbnzoZp5ru6fxPA65dGt7o5VH81kS5a
         UFew==
X-Gm-Message-State: AOAM533vdU4KNDXb58XtWOXbEVet/g7JqJOU1QqSBtv4pyWL5GUQZHD6
	pM1gcNfIdLXI3I8X34fq5C0jETvst2KKYw==
X-Google-Smtp-Source: 
 ABdhPJxswLjXCQPZLcsvtENH+8UQg656MJtelUCWcw361Q9pq2WPLd46PDtHRwxwdjrhFYYFM+11Cw==
X-Received: by 2002:a17:903:110c:b0:14d:8859:5c8 with SMTP id
 n12-20020a170903110c00b0014d885905c8mr20868742plh.156.1645478693492;
        Mon, 21 Feb 2022 13:24:53 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d01c:96b7:6393:8c56])
        by smtp.gmail.com with ESMTPSA id
 n85sm14081529pfd.142.2022.02.21.13.24.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:24:53 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 31/32] python3-packaging: inherit setuptools_build_meta
Date: Mon, 21 Feb 2022 13:23:46 -0800
Message-Id: 
 <e66c8d15deab8b735d82147999f9b39a61272fa0.1645478020.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645478020.git.tim.orling@konsulko.com>
References: <cover.1645478020.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 21:24:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162107

Upstream provides a pyproject.toml which declares the
setuptools.build_meta backend for PEP-517 packaging.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-packaging_21.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-packaging_21.3.bb b/meta/recipes-devtools/python/python3-packaging_21.3.bb
index 446edf04e1c..c7d0cb7ef78 100644
--- a/meta/recipes-devtools/python/python3-packaging_21.3.bb
+++ b/meta/recipes-devtools/python/python3-packaging_21.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
 SRC_URI[sha256sum] = "dd47c42927d89ab911e606518907cc2d3a1f38bbd026385970643f9c5b8ecfeb"
 
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.30.2


