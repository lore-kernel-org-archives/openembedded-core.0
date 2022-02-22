Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D4F8C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 19:17:17 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web08.1971.1645557436370384567
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ODIDSqbu;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id w20so16492776plq.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=EMGj9MC8SPyFqxQziGiTsoHsvLOOfG3kpD8+GHqh4+k=;
        b=ODIDSqbupR2LpOgTO2dxiSVuFStj/T32xCQJzPT0oQZSfcFqi2mTf4h2oFtL5+OOGt
         i63dgktEdVb8sUCFqORdUuiv83zjYbaWlIxhYxnBNCwP95L+Exi48UdiRC4jtj5d9mr0
         45pJOwANK5NjoopYaXJDKg/PHPKFaN/rMltZ7klt78AE4uA691fOjriZRMWohUmSw+Ay
         yNY3Ylt42PBOOcdU2dI75c6QF7XNvhq1zKDzkoLEh1oLKhOOamDQxngj5wSjc75ECOlp
         Ojm8UeBunOi0RZowEacqIax/Y+sBof45bORFAmhIYODjaE2zjQVxJ6O/1caS9bKYuh3k
         uVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EMGj9MC8SPyFqxQziGiTsoHsvLOOfG3kpD8+GHqh4+k=;
        b=0HFhHnkqaqTx/fDKK9d532kSkGsT9nS+Ip/GxvRlUIm2vF/0ihLijQPoDOf46AelK8
         AiprlfBmZvGfxFnhZsTA9f45d5H/zU/8gpC2gov6KQ4LmVt1wCV7U0+OgmG5d8BS+4uC
         CmttvfIUheeD2mAukY2WZNHJ2O8uGFZi5H88vUT4lmJHjXBUzMky+m+mcFhEidAv27gg
         a4q6ZGN548HiaPzo747uvviGGYC6oRY5LjBTn1ifkhqzCJshMbofzAvB8g1a5HiwDYko
         BHdpzwmuQa9PMPPfl+6I3eulVcQ+7ZirmfYhqyMtmF/S4tITRbSB7jl8tUA302a47bQs
         P6RQ==
X-Gm-Message-State: AOAM530lVuNKFOrvLPC2oZQIt6SnShhM1sYGTa0YlxCCiDKz5CDEhcx+
	35K7h8jCSDozt4M1fsuAt+6QPwHzdkumzw==
X-Google-Smtp-Source: 
 ABdhPJzzljJ8p5xUarkSRw6iV7mEBnG5+8jvG6zS4XKDHPf4dGN5BY6gUSxqThiomp8D/nUpQZlxxQ==
X-Received: by 2002:a17:902:bb8e:b0:14e:f1a4:d8a3 with SMTP id
 m14-20020a170902bb8e00b0014ef1a4d8a3mr23891037pls.138.1645557435490;
        Tue, 22 Feb 2022 11:17:15 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d208:bddf:2b06:2b5a])
        by smtp.gmail.com with ESMTPSA id
 z13sm18402700pfe.20.2022.02.22.11.17.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 11:17:14 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 08/32] python3-attrs: inherit setuptools_build_meta
Date: Tue, 22 Feb 2022 11:16:34 -0800
Message-Id: 
 <41deaaaa34b8f4665ac068052075bc39217aaeaa.1645557032.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645557032.git.tim.orling@konsulko.com>
References: <cover.1645557032.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 19:17:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162199

Upstream provides a pyproject.toml which declares the
setuptools.build_meta backend for PEP-517 packaging.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-attrs_21.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-attrs_21.4.0.bb b/meta/recipes-devtools/python/python3-attrs_21.4.0.bb
index d1dde29d376..20e4541f81c 100644
--- a/meta/recipes-devtools/python/python3-attrs_21.4.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_21.4.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d4ab25949a73fe7d4fdee93bcbdbf8ff"
 
 SRC_URI[sha256sum] = "626ba8234211db98e869df76230a137c4c40a12d72445c45d5f5b716f076e2fd"
 
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
 
 RDEPENDS:${PN}:class-target += " \
     ${PYTHON_PN}-crypt \
-- 
2.30.2


