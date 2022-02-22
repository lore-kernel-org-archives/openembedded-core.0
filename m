Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 519E4C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 19:17:48 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web09.1916.1645557467675574600
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jnQBSYzp;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 ck4-20020a17090afe0400b001bc64ee7d3cso413822pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Q/+sRbp5Jd5d3N64AVCykOfAPlyxMrIh2P21lbDqUP4=;
        b=jnQBSYzpXj2qfF7tapE6TJ48iQVjZgM/FR+3tSNAUm078ADw85jHBqH53Rcoi2hu+J
         GPCiCfj/dmLMJOzcCEmBbgECyLxU9nKWM4CODZyAJUhJUsfu6vheJwPYgKLavg8rFvSD
         ZqYiN4IpMYpzu/q/3sFtU9cd+BEhn7Y/pQoia9dDXiGIAS+M96i2X9IKmsdKKe3fYK4C
         LvZ8GtcbZwsiwwWYadGqJVOf7xVZNxdUg10K8I46mYYEa2kBF5teLus6KFyoblijOF9D
         N8MR2q1y1XEANlMpwLSLmWKPsmtsioyO/vjqbEi38inWjMH//cG0Uf821AQfLFpmBVFW
         Aupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q/+sRbp5Jd5d3N64AVCykOfAPlyxMrIh2P21lbDqUP4=;
        b=2/yc1LgNFANw8zl5gskdDaRwQXQCHIvSSlJBcFCYwXWs/DmvjXECd0USWiHPMwJyWA
         Zc5s1+58NhnEt6NaGfdtFfqqu6NVMbkgrM23mn4s+mwFDoYOj99XQHZunkXQpEcMrzDJ
         M35/uzyLgm0aKS9qojA/eCdjc6LDqSh1QV4yXPO2fx7PrJ5CRQJluWS0vQ3FqKYi2/a6
         mZMXprwePSgHKFNqHBKr/aj857bnZg0vRfQBW870e/aQVmOfUO6VVhkB0EiVtzP7GHoA
         2zSR/Lnf/WFS86JBVDAckgDFHVeuHv1ie2hGvbDfys9oOpeybTPqaDhCnuZBrMZA17uZ
         DxxA==
X-Gm-Message-State: AOAM533/mkLHW1DVSr+d2JS/tQhV5nXQnFRBMbecNUXnaFCueyE89arS
	ZVujMAfrq1UhFWZoazxmvNgXiQNk8NNIMw==
X-Google-Smtp-Source: 
 ABdhPJxALVA3DDGKZWE8lUBGizrqEEZKJiqatuLW1X3exTF6a+DKnt05CyJ8sWsQ1UedO5kDH3d2MA==
X-Received: by 2002:a17:90a:fe4:b0:1bc:1db6:c77f with SMTP id
 91-20020a17090a0fe400b001bc1db6c77fmr5569237pjz.184.1645557466578;
        Tue, 22 Feb 2022 11:17:46 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d208:bddf:2b06:2b5a])
        by smtp.gmail.com with ESMTPSA id
 z13sm18402700pfe.20.2022.02.22.11.17.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 11:17:45 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 26/32] asciidoc: set PIP_INSTALL_PACKAGE
Date: Tue, 22 Feb 2022 11:16:52 -0800
Message-Id: 
 <03e76865bf069d7543d69aaed7b2696738640384.1645557032.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645557032.git.tim.orling@konsulko.com>
References: <cover.1645557032.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 19:17:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162217

This recipe does not inherit pypi and therefor we need to manually set
PIP_INSTALL_PACKAGE to reflect the wheel built by bdist_wheel.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-extended/asciidoc/asciidoc_10.1.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/asciidoc/asciidoc_10.1.1.bb b/meta/recipes-extended/asciidoc/asciidoc_10.1.1.bb
index 8de827f09e8..60640d7a0f8 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_10.1.1.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_10.1.1.bb
@@ -20,6 +20,7 @@ S = "${WORKDIR}/git"
 export SGML_CATALOG_FILES="file://${STAGING_ETCDIR_NATIVE}/xml/catalog"
 
 inherit setuptools3
+PIP_INSTALL_PACKAGE = "asciidoc"
 CLEANBROKEN = "1"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


