Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC44C3F6B0
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 06:34:50 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web09.8103.1661322889414247703
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 23:34:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=REkwhlLK;
 spf=pass (domain: gmail.com, ip: 209.85.215.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id f4so12360995pgc.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 23:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=LkznSWhRXPe+OCc2AUBGuI2SYD2GhtmfV2D7Q5ZKvjM=;
        b=REkwhlLK/+K/u16e/fbWuuLYwmpVKgEepI1i5RcQXuLNTA4Mdu7Az0FjpI5QalQA3g
         vL868gjlxDG/nOxxOw9qpVOBclGGqpS59wTQFQ4gF3cWwU2nE/KIvTK4P5+n0ztE1cxE
         j1jDXMHnqhqOScmmDoPDsVYF7fPZDt7+yolZvSNfwJaqTkRrabSCy+RFn6CPvGpxJKyE
         djdT8RJu3j04iYvE+pepS9YCJljWEM6GIZELHuisLlETL8qLfPCR3S/2J8FBEM55JyHI
         VnunUPVPpiMu3PRHKNwGERJdFB3GK+S57ThW2cqKUM1autbX+QGPH93iMYUmLtquNttL
         CzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=LkznSWhRXPe+OCc2AUBGuI2SYD2GhtmfV2D7Q5ZKvjM=;
        b=NK1UcxIDFD1/+4CV1YU0YbTyoBp1BGaFNm0zreuNnVs6TWhR7NOMaoAfnn8a63Rolo
         juxAyRZD6Bhse6BTLbuQlWknLrytAMNhkL2jS7EsYjsMahpI8Iug+C58XaDJeuAakgZp
         f+xaiOx82BxDuVI0SvqBWvBQFabj4XAMnSmRcJHfoW7L4GaXnVDLOOUASnHgf8nOy2il
         LT6Atcnik9/NVx6TNRWY7uI+iM4mia7DIhSP+2T3BXrMmsP4e1ZxQuqnC6ZhjeC5MKTu
         a8ja1mq8/dR4OqWSZwpgJSRqL5R6/b3DBMrFL+TjSMIzq0zMxvBIVqLxl2ADl8q+55LU
         LxoQ==
X-Gm-Message-State: ACgBeo2rCM5kfK6tKSIZ23odS2O/v9PyTfxB6Rniozs86E2fHvdz6TQG
	+gS8XmQUeI0yTXxQ8OUH5IQ44MPx+oSImA==
X-Google-Smtp-Source: 
 AA6agR7n0/D3UN0BoeL2HapaLzAEUHc3ZKDZSw6GGPXwVqB1J0zh/dJIkQbgJOZQtZTdWG5VmUNV9A==
X-Received: by 2002:a63:6942:0:b0:41c:9261:54fd with SMTP id
 e63-20020a636942000000b0041c926154fdmr23606551pgc.34.1661322888516;
        Tue, 23 Aug 2022 23:34:48 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 s24-20020a639258000000b0042a3d9a1275sm8384957pgn.16.2022.08.23.23.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 23:34:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/7] enable _XOPEN_SOURCE on musl for wchar usage in curses
Date: Tue, 23 Aug 2022 23:34:40 -0700
Message-Id: <20220824063443.1774094-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220824063443.1774094-1-raj.khem@gmail.com>
References: <20220824063443.1774094-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 06:34:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169778

This is defined for glibc automatically with _GNU_SOURCE but not for
musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/pinentry/pinentry_1.2.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/pinentry/pinentry_1.2.0.bb b/meta/recipes-support/pinentry/pinentry_1.2.0.bb
index 169cac8965..e6cc71a547 100644
--- a/meta/recipes-support/pinentry/pinentry_1.2.0.bb
+++ b/meta/recipes-support/pinentry/pinentry_1.2.0.bb
@@ -32,5 +32,8 @@ PACKAGECONFIG[secret] = "--enable-libsecret, --disable-libsecret, libsecret"
 EXTRA_OECONF = " \
     --disable-rpath \
 "
+EXTRA_OECONF:append:libc-musl = " \
+    ac_cv_should_define__xopen_source=yes \
+"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.37.2


