Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E067C54EF0
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:52 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.9363.1672830368120524387
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ef7UsMy+;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id z16so16086299wrw.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j7azEgyrX4hQL8uMdXwoyBvxCyYkb6hNGiIdrzwaOmE=;
        b=ef7UsMy+lQxl4chxeArMPyqb0Z5D+5x4ko0NuGim95YwfVgdjqWTf8Mm49D201I+76
         SI6JIq+139pZpQQHZv9IaAM0M7VeH4JECID9LC00qyAuQFt2KUchRP6iIcCxk+WuJ3ZB
         u3EtHCaPB2i34v/cetXI/LXEk7w51WFlVD/Or1HZsqN9LFMxakr3kz/MP4/dldCfdKeS
         q1kUOzRnslGHOTRfEs+XGhKGO3DHJhxqjcTW833ABQ/u36Gmp64xfjrNhneFCbWoNf5r
         x6wT0+qFlNQ05d2vKwqp6rWNrP9D5SN+pWARSBaJUQ7ze/3m/KQVn2z10Iz3A1tCSmG1
         fYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j7azEgyrX4hQL8uMdXwoyBvxCyYkb6hNGiIdrzwaOmE=;
        b=pfcDvD6KfWq7qzZVOY/UHPLtxxu/Ke0XIG3u5bEwEtG49B7cjLM4me6votBUf+C4Et
         /xlxgIPqrrfRKcYSxfUAnr9pXBe/WQaN/UVmsz2nknhdDB2z0OqGmBaQcdF2WWWayYjY
         NBzffR5zmBNUIXqOiE7nCwAcyRR06NtWrwu8XhfRfkHP81cmvua/Hgqp/MWVziWzWrdN
         Wcuu32JNB4nAhUL7tgRvG/XDxr0Cg6ULxs5JHYjdOmxljm7PbxkupjGQllTxYER9StAI
         JD5MMlAUZ3ZV9MRj65o74uPbaQ7hMZP30Cs1QV4aRir2hanHAauPJZyiK79otCpPfYE2
         xePQ==
X-Gm-Message-State: AFqh2ko2nElNycv7McYhTnPMUWNf/7qvv/JTnHC7bZ9RyNqsqBo4ue4I
	7g9Z8kvodpPgu9wPQDf8iARcDgq7luk=
X-Google-Smtp-Source: AMrXdXsRa4XIvOBC1OjTA1/1cd0bU8C48Rbaw/hcUgdSQpMAZs5VSAyu2t4ckDrsRK3VlXNAoAPrjQ==
X-Received: by 2002:a5d:488b:0:b0:242:5ae0:5b41 with SMTP id g11-20020a5d488b000000b002425ae05b41mr30614186wrq.33.1672830409885;
        Wed, 04 Jan 2023 03:06:49 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:49 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 75/77] elfutils: do not error out on deprecated declarations
Date: Wed,  4 Jan 2023 12:05:46 +0100
Message-Id: <20230104110548.2537259-75-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175460

This addresses new curl's deprecation warnings treated as failures.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/elfutils/elfutils_0.188.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.188.bb b/meta/recipes-devtools/elfutils/elfutils_0.188.bb
index 43f5b2e56c..c94e36071c 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.188.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.188.bb
@@ -33,6 +33,8 @@ inherit autotools gettext ptest pkgconfig
 EXTRA_OECONF = "--program-prefix=eu-"
 
 BUILD_CFLAGS += "-Wno-error=stringop-overflow"
+# compatibility with curl 7.87; can be removed when elfutils upstream fixes the deprecation fails
+BUILD_CFLAGS += "-Wno-error=deprecated-declarations"
 
 DEPENDS_BZIP2 = "bzip2-replacement-native"
 DEPENDS_BZIP2:class-target = "bzip2"
-- 
2.30.2


