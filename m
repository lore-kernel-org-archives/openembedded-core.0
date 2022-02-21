Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B1B2C433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 21:24:20 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web12.4690.1645478659273417515
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g0c26vle;
 spf=pass (domain: gmail.com, ip: 209.85.210.180,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id z16so9981453pfh.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MbFM/lfHIRRkVJn+qCVJ397jXTQm8/CrUAmSQXaYRLw=;
        b=g0c26vleXfaNy/ithdeRGYZsZuuBIDtR5rOD8P4+8vZCWqXmCns3VquQCp2UwcQ2lj
         Pt48XUKzkQwDjCoWYHxXH9bv1qd/bYpKfGbudVGql5H0kGmmGyJSm2kRZ4uYXRBXSTyl
         LmGK1Re9HH41Ysbe6UaMYIwU9f+niao7z2IQB4HfWcTipJGyh+vtd2ozPXcrxTCwjRqw
         f829tpyDWfEsnuUcrURkqMGC3POKIENTpU7/8eZL1Uj2AsNCeU/Qfns34G7zTvloS60p
         oI/MatB9MTl+yRBDW9UGHd0DwR37NMVhFo1z9BKuGE7LvffeV/rf4L1Inkn4JsbM8UWe
         WaIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MbFM/lfHIRRkVJn+qCVJ397jXTQm8/CrUAmSQXaYRLw=;
        b=WIiwU9QaVf3/AD9C+O21HHyVMic+wsheuBYySY6ubWiuVg45aJB2TjHwCnc0TQHIM3
         x2B6M/YCNIJYjLNQVIRIdsmIYlZJrqJkW0hxu8vOyQY15yOWzVpF6QbqbzCmIYxT2RRh
         XniPZyMQwg0JPBWu7bve+ULymrVwOF48bteTOoGEUS+IB37HqjHWE+apsstha1oul32V
         ZVQO6zo8xjJmYuiryXnMaXxiEebORFQ+jWrFN3P0pG+XvdKVL8yXK1iXDjo7u8VTYFWH
         0oL1k/l0XKQKAf+zonHlqvnbQBNLqkY9dsTdIgmejfi/S27Br3oxniJ1LYBL5O/yUOKg
         AEKA==
X-Gm-Message-State: AOAM531pPeHC/svnyIu8eUtevePuZmP36ODCjLuk8enyECjt2Cv/Gip7
	8zeNBPA7/83S0KQ5Q43wbSx3Ma6EX2lOsg==
X-Google-Smtp-Source: 
 ABdhPJzuP9hS+DzBET0+YPKzL0gQ4vUac15QVuyYoR4PbYFNr7/MHBHXaHTF93NbnmENjiPP8d9KQw==
X-Received: by 2002:a05:6a00:24c4:b0:4cb:7324:bfd with SMTP id
 d4-20020a056a0024c400b004cb73240bfdmr21816466pfv.60.1645478658390;
        Mon, 21 Feb 2022 13:24:18 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d01c:96b7:6393:8c56])
        by smtp.gmail.com with ESMTPSA id
 n85sm14081529pfd.142.2022.02.21.13.24.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:24:17 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 11/32] python3-setuptools-scm: inherit
 setuptools_build_meta
Date: Mon, 21 Feb 2022 13:23:26 -0800
Message-Id: 
 <0ba58b2ff324cb790b77e20580c7a874a018ae8f.1645478020.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645478020.git.tim.orling@konsulko.com>
References: <cover.1645478020.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 21:24:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162087

Upstream provides a pyproject.toml which declares the
setuptools.build_meta backend for PEP-517 packaging.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb b/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb
index 10dad5a37be..182ccecbbfc 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148
 SRC_URI[sha256sum] = "6833ac65c6ed9711a4d5d2266f8024cfa07c533a0e55f4c12f6eff280a5a9e30"
 
 PYPI_PACKAGE = "setuptools_scm"
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
 
 UPSTREAM_CHECK_REGEX = "setuptools_scm-(?P<pver>.*)\.tar"
 
-- 
2.30.2


