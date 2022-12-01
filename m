Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E98B9C43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 19:03:05 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.53545.1669921376924038801
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 11:02:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ocS32UW4;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id y17so2534677plp.3
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 11:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/vR13FzOfRkfhvZvpulUku1LllcPzJYtfy3G7ikM+Vw=;
        b=ocS32UW4fARZkwkdRiSSlKEhpd9bulOxEBJinEZyHWPhJBsbrrPasyKz8qc7NMmRpg
         aFQIAI2eHsFBhd6h6YFeddXQPx3JrpTQAM3VMkkIOxjQZvj5LdAsyLvTxG5ZfUEbGw31
         OfBtCcIJCZGXdbZSMlJiNPYvKBCwnSqIEQM0PSqJ9SEArd17iOPUioP1buWwevq9jZX5
         1i+qGjurp7Ew7V31VNy0FrxDSBFStJ+YQ/82Lhe7h+1rX4k+ewwhfB6IQEhLJeqN5/QB
         raQ0wj0ra5ivtXMFyMrl5XIH8/v3YHBS8ZuLDkuc5ILBN3lH+O+/j039uv0c2yQXaAqp
         nwpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/vR13FzOfRkfhvZvpulUku1LllcPzJYtfy3G7ikM+Vw=;
        b=wDZQZivoOlRl0uYQogpqHNJKQJSAv4dCyj9SVuh6RS9PN/Ujyofb3MJ2NIKb1WUrbK
         0n+ZRWw/xzjXrruXrqJq31F87ZVdBdC4Qksj1CP5hEd7A2bnvoFQUg8niiy+TJxAe4dG
         yHvDshkpgPzE8zOkYow8sFU0XzVavxYNZbu7qV54Mv2zxUBWWTxPKF6E1/+PZheGEn7k
         000r/+fYZsJsuhFy9RioB3vlLkWrSk3S4mFtEEHwRCqUr1HQJbCyCeFtQDHComiLZiT/
         vLI2ojIktVfGgDjY4AFSjh3wT6x8iguaZ/M2TYpw9/WsnOXoPArrUrRXQA6Kf0iOQv8m
         G0eA==
X-Gm-Message-State: ANoB5pkvTA22wwHkxwJdIzBt0/+oYFj5FeTlU82GekbncR7SSpmn96xX
	OcayHe58edCL13gnjHMzWPlThtuTaQU=
X-Google-Smtp-Source: AA0mqf7jE3yKy5pYLJtTO+DvpqMX134wZtaFQlgUNddLICxjqLfK1Xzh0ILYZHOAno2/YV0CSgDz/Q==
X-Received: by 2002:a17:903:2311:b0:174:4ab2:6457 with SMTP id d17-20020a170903231100b001744ab26457mr62182075plh.118.1669921376067;
        Thu, 01 Dec 2022 11:02:56 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::d00])
        by smtp.gmail.com with ESMTPSA id 19-20020a621413000000b00576489088c7sm321092pfu.37.2022.12.01.11.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 11:02:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 6/6] pseudo: Disable LFS on 32bit arches
Date: Thu,  1 Dec 2022 11:02:48 -0800
Message-Id: <20221201190248.175753-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201190248.175753-1-raj.khem@gmail.com>
References: <20221201190248.175753-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 19:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174207

pseudo overrides certain libc functions which are aliases when LFS64 is
enabled. In anycase pseudo may not be much used on 32bit systems anyway

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index c34580b4ff..c3f0a987fc 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -17,5 +17,7 @@ SRCREV = "c9670c27ff67ab899007ce749254b16091577e55"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
+TARGET_CPPFLAGS:remove = "-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
+
 # error: use of undeclared identifier '_STAT_VER'
 COMPATIBLE_HOST:libc-musl = 'null'
-- 
2.38.1


