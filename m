Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7786DC10F13
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 07:52:26 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.58167.1702626741581785065
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 23:52:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vh8WgO8T;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-55114c073b8so391604a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 23:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702626740; x=1703231540; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U36Scc/rudRiwhZgA3abONCie+nbSOsjO/BdlUlBqy8=;
        b=Vh8WgO8Tx1hHP2IL2cXsz2OjSJfdCuAxFdWGEn+K6u8R7FHqNGw4dSqmJK3b1HJULT
         FvZHVpel7fo/r07EY6ksMRqDPHVzzIDyOg+WaS2T39G7R0ph6swKhwurCCZ/hmUwIoBe
         ibo0LW6/GV4/Xs52rsDEkJlsvfNEXH7iX80hTN6JDz/bgN6pBXvuCufi2k4iJO+jQG2t
         GDcZMK75w+qmjXdpWv2EXe8VhGhAZ5WJicQPUWEdU9dW4HhVRNTSx26xHtBQ3oDt/D7T
         Mjg1TjoK1g13KVet3ohXM0ze8qmSKwszxhGxPYeUGjJQtLnfdVRG46fXM1hNS2vE2ztY
         SfOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702626740; x=1703231540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U36Scc/rudRiwhZgA3abONCie+nbSOsjO/BdlUlBqy8=;
        b=GAGuZDHq1T5uLwFyO/c/xq0NBPAmOCQBM5ACjUw+1ztDeosZVOhzVfx0QMCT+Q8eNh
         6FnZTLTpsKR2GBJ2BQRunXKDnwcN7RGdzJzu4bqQEOsV1ksbxh37fcQ0GEMUEhFZt7d9
         SX3ovig1VCwtX5Hq4WHTvf1vCOR1ymXeQ1/I+zvfMcO1Tgec3rb2NiqOuhtYAK+KLieb
         WWY8J3q0at8Ay7/aAzF9bNGVIHy//R0LdnOclEbqELy7vvy576dBsi/Rt0UGusStqhWS
         +f7jzLcwljHkzpiReRbwvb42ShqtMnJ44Qj6Xah2gcPw62zFt8Wdug3wq/L0ZSO9rWGd
         wEJw==
X-Gm-Message-State: AOJu0YwXGwEA7vbJgUk+hA9yXovI7RUpYqg+6nfN6Aw9TpG+Ui5C6xkt
	uOdKDsMnJ0NiuN83UbkSaJGQS8oCyNA=
X-Google-Smtp-Source: AGHT+IENZsCXezI3gZ13KjpAhZACVYuJcGCNcJlr4GrEPB/HKO549GxCjHF6p3jX+bRuuRvvzikGiQ==
X-Received: by 2002:a50:d557:0:b0:552:7db3:5d63 with SMTP id f23-20020a50d557000000b005527db35d63mr717728edj.59.1702626739986;
        Thu, 14 Dec 2023 23:52:19 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id bt13-20020a0564020a4d00b00551d6d51401sm2961885edb.53.2023.12.14.23.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 23:52:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/10] python3-numpy: distutils is no longer required
Date: Fri, 15 Dec 2023 08:52:10 +0100
Message-Id: <20231215075210.3049785-10-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231215075210.3049785-1-alex@linutronix.de>
References: <20231215075210.3049785-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 07:52:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192422

Please see:
https://numpy.org/devdocs/reference/distutils_status_migration.html
https://numpy.org/doc/stable/release/1.26.0-notes.html

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3-numpy_1.26.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-numpy_1.26.2.bb b/meta/recipes-devtools/python/python3-numpy_1.26.2.bb
index 00c09b29954..253b3343677 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.26.2.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.26.2.bb
@@ -40,7 +40,6 @@ RDEPENDS:${PN} = "${PYTHON_PN}-unittest \
                   ${PYTHON_PN}-shell \
                   ${PYTHON_PN}-doctest \
                   ${PYTHON_PN}-datetime \
-                  ${PYTHON_PN}-distutils \
                   ${PYTHON_PN}-misc \
                   ${PYTHON_PN}-mmap \
                   ${PYTHON_PN}-netclient \
-- 
2.39.2


