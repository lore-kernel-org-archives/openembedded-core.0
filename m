Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05AF7EB64DD
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 03:27:17 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.5004.1690860427521127678
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 20:27:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=WqkCRDxK;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3a412653335so3322172b6e.1
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 20:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690860426; x=1691465226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9UPxVwe8jYC1PAfYij9bUAst5lxqcy0k3+DbbSp+mQ=;
        b=WqkCRDxKUFD4Dqqazxr4V0xG8y4NcOUoirymtyzWM8wBynpk15xgri7HRLlDnCF/YQ
         pY6puhsVzigMZCTs2qn5BmD0MoP2gl/+jU+e7f6suvRzFk8rm5p5hgBUnuKOP3ZF+2I+
         2MNmIAlMvnUgsuuEfXO0QC3UL81ZLV6IFY+RygLq9LbvtWa0E5MSuQfRSvOVZMqEZxwK
         b4WFYvNDwP3HJ+FAQV5xSHdWSxUnYqIiBfC2zWoeyswojOYhtdADDcos51biyzY3FhWj
         xQlRZgcy73wwPVsfIl47vfkv1TVF14NlrwbplCu1b/yBTAkTZndF7OTXJ3iD6zCVr5Ul
         SvAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690860426; x=1691465226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9UPxVwe8jYC1PAfYij9bUAst5lxqcy0k3+DbbSp+mQ=;
        b=dQevgWJLr5M62sxua//Kp2Drd8G+8658PGIZadVqNsz+Awl6J3BwzXoTZkwqyY5thg
         h7PzLWiGk35acMFf8W/72/m2btZ4lT5OIGcC3PP1feDhiVvuAVCq90txADce3PFs8JIB
         gTesk2QAmpPVQX9hhNwfiyDSQLIIfqDmysMILutO68ttFqMie52wkIT4a0ngG5iIDV1b
         1WKsgKaEEieiFvrh8W/Xcp0Wbm4koJm3vX/dToUuq7nTvLWtEKCubyKV8jW5PpmCrfhX
         B/4P+QBbXUuEj9EWNqwHRunlQpNMD6wemxUsufv7M185zu2GNBuAEmotnJqpvoa32p5Q
         frWg==
X-Gm-Message-State: ABy/qLZLUbop3LsKsMLKGfY3rRWRbXz0cTftXUtXl+Dxl23idAYcT7R6
	M7vztlWQUyt3Elmj3rNHpF6iWKBp5EfmwQ==
X-Google-Smtp-Source: APBJJlFqd5oruRZ+g5u4QwWz498+vTnPDQnUWj35C0gEWbQOU9Fx0tPBKabrrW7mU1I0uO45O7pJTQ==
X-Received: by 2002:a05:6808:138f:b0:3a7:4a89:7510 with SMTP id c15-20020a056808138f00b003a74a897510mr1084874oiw.30.1690860426529;
        Mon, 31 Jul 2023 20:27:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::61c9])
        by smtp.gmail.com with ESMTPSA id m8-20020a17090a4d8800b0026822cb85casm6753601pjh.18.2023.07.31.20.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 20:27:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] glibc: Enable fortify sources by defaults
Date: Mon, 31 Jul 2023 20:27:01 -0700
Message-ID: <20230801032702.1475825-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801032702.1475825-1-raj.khem@gmail.com>
References: <20230801032702.1475825-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 03:27:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185186

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.38.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc_2.38.bb b/meta/recipes-core/glibc/glibc_2.38.bb
index 4290f3e6e4f..2021991eb4a 100644
--- a/meta/recipes-core/glibc/glibc_2.38.bb
+++ b/meta/recipes-core/glibc/glibc_2.38.bb
@@ -76,6 +76,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --disable-crypt \
                 --with-default-link \
                 --disable-werror \
+                --enable-fortify-source \
                 ${@bb.utils.contains_any('SELECTED_OPTIMIZATION', '-O0 -Og', '--disable-werror', '', d)} \
                 ${GLIBCPIE} \
                 ${GLIBC_EXTRA_OECONF}"
-- 
2.41.0


