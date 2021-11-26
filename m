Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC28C433EF
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 04:36:21 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.20020.1637901380321003358
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dBVSgKuF;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id u11so5886090plf.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FJPJ/IPzbaE4muT/9AeHTYH1/kZGY7qDYxPFjt91Aew=;
        b=dBVSgKuFqneJZ7hEJUni6NWACCUsmwaek6Jed54txzfU1yXBc/iFlnIMEKZ56wncGC
         Ha3zXBRstMJ+v0tMRY9+fKXwgtkZEj1vNCL41APks+y6pda3kzxZokONqhAXU88YWE2+
         j860bjrBvXHxjAjtbOmkO+aTOsKCo8KcE0IezvwRqqezGZR8OZc34+NJrACDiVoNq8Dh
         3KIg1h+NNacSlvKUysLy+1b1Y+Psjt4dYiD6cCdjz8zQhn2sG5G5xzf6fGiZzfG1lj8f
         RUp5TrKkBV4UHJEkHoA7NO1n/aWxgtzXq7D0GE3Wj96Ll3prHbdI4vX2NW/Eqwn1Sr9M
         LiZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FJPJ/IPzbaE4muT/9AeHTYH1/kZGY7qDYxPFjt91Aew=;
        b=d8dP5Jc/IvdnGV9WUeAYt+3qIsM59nzUeXPytXcjpkCyLv0w289af25ySmLC5VutBa
         7x/NlFzp5a0dvuJ7OrTd6+ddN/Jt6ERYrvMBvMPgKxhMZpk6iVTtntSy3dboRPKUGU39
         lgddC7MuI6a+mkm7CQnQPTRLAxDgXEfrjIYV920dNUoQuveHf05tP2eik2jKhBvzd6EG
         lBsBhmCrroeYN9v5hR3w4fuZmzRL0V2pGGp/+4F0m73Wk7WnjfGcnM9z+R0rv5wt/1k1
         5K/oLWHi7Yswgww4orrN4zHbk+UDbtHI1IKvNz+9CveDY8BPGYeMkL7qRo+ls+TeLxl5
         VFaw==
X-Gm-Message-State: AOAM532li8c30Q0XuI2izSPT9NRaAQLFM+ItvqpqFela4/GVaRaxYlIV
	80s8GKmIYEnyiUFR3s9y0UW+tfUTpN8=
X-Google-Smtp-Source: 
 ABdhPJy9cZa7dOjTXoy4SDKWQIFUvAB/1ex+Li/XK7X7vqpXWPcDM7e4HRqFs/9AzM4E9qsNEGezNQ==
X-Received: by 2002:a17:902:b60b:b0:144:e601:de5 with SMTP id
 b11-20020a170902b60b00b00144e6010de5mr35026616pls.36.1637901379554;
        Thu, 25 Nov 2021 20:36:19 -0800 (PST)
Received: from nereus.local ([2601:1c0:6000:1830:2111:e66e:a58a:6736])
        by smtp.gmail.com with ESMTPSA id
 fw21sm8909282pjb.25.2021.11.25.20.36.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 20:36:19 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 07/26] gpgme: inherit setuptools-base not distutils
Date: Thu, 25 Nov 2021 20:35:46 -0800
Message-Id: 
 <a8beee3c1d2f96a9ddf0c462f9fb72ccf8bd4fab.1637900380.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1637900380.git.timothy.t.orling@intel.com>
References: <cover.1637900380.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 04:36:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158803

What was distutils-common-base has been merged into setuptools3-base,
since we no longer need to support python2 and python3.

[YOCTO #14610]

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 meta/recipes-support/gpgme/gpgme_1.16.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gpgme/gpgme_1.16.0.bb b/meta/recipes-support/gpgme/gpgme_1.16.0.bb
index 0ab30d93b9e..d31e1b3132e 100644
--- a/meta/recipes-support/gpgme/gpgme_1.16.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.16.0.bb
@@ -59,7 +59,7 @@ EXTRA_OECONF += '--enable-languages="${LANGUAGES}" \
                  --disable-lang-python-test \
 '
 
-inherit autotools texinfo binconfig-disabled pkgconfig distutils-common-base ${PYTHON_INHERIT} multilib_header
+inherit autotools texinfo binconfig-disabled pkgconfig setuptools3-base ${PYTHON_INHERIT} multilib_header
 
 export PKG_CONFIG='pkg-config'
 
-- 
2.30.2


