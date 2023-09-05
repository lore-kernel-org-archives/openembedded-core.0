Return-Path: <xmdy61@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23DE3C83F33
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 11:40:02 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web11.19188.1693914000471849898
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 04:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=BBWBQAnW;
 spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: xmdy61@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-34c5fec2a95so6957235ab.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 04:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693913999; x=1694518799; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QwsA8EZZCtLECKt3YeSoSGEyWZR9IY6phI55u1Ebiac=;
        b=BBWBQAnWoQvXqU5q7ZUByXliVDgGDxdNoGmhr2rvLHnkPhG0OsOFkcOOUcxAxFAf0v
         ZokV3GzPhjvscduWDFAEzOUQQGLi38wN5K4EI0qQW8AH2Cocw6SBfP64YnXZ7wIfmba5
         KWYydzkegQj5B4QAMoRshMMf8yhENTl6W11Mn7qUN8vilUTHEkKJqXHLZUivoUxKHDTd
         IEd/1p/3L7bcNSJYlhWXUmpX8RBMaYAm5sv/ReoEEbaUpuErMITDezLJo3xHCKI+TAC2
         DCze9k5OSoZlhBP3t2bSimgpl1Bm9/0Qztx6TDr1o7daJKDR8KLWBQrSyaHsolbVQc+x
         wuJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693913999; x=1694518799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QwsA8EZZCtLECKt3YeSoSGEyWZR9IY6phI55u1Ebiac=;
        b=hdrqS95SqP/Nt9W6kvbOpuGmpDw8BjnpWFdAEoGg+COO4e8FqTGSPYI7f0eb2zyt1P
         KVsPG7igeCTA69x7pK8L1y0QiNTrXUrZYsIRFM90u+24eosHxWo6ApIA+XLjeAEVoGGx
         ZQDQZvrhaTvR8ckhiuQV9pf5RMjFL0sHU4h5DiAc/PVFL1z5cw5tNE5sBMGywH94fF8G
         Nyz73zziQHw5GA386UrThXLdxzYmNGksnurZOIQinKp4TMd2gYc01uHze11XSUHBP/GM
         yJd2yTm3Nhh+chgJGRgkw0Exb0PWF1MKGTqarznkQCV5DaHaHCp5GtpgGDZNNAY2uvFr
         8opg==
X-Gm-Message-State: AOJu0YyD2K/aGdZQJy3oGjudJL+LtDbRpIoBRITAan/zvDlzPqOhM43V
	Q8j0uq7ogVqooaBiqZ6Fayzb1K8os0rexvU4
X-Google-Smtp-Source: AGHT+IH4ASAfmDlIEpbG80o88DrR7ZirT+UPouUCtH9a2VlW573mj3kmstPr2Tpow7qMmzThs8eU2w==
X-Received: by 2002:a92:cc05:0:b0:345:fae5:666c with SMTP id s5-20020a92cc05000000b00345fae5666cmr13125647ilp.4.1693913999546;
        Tue, 05 Sep 2023 04:39:59 -0700 (PDT)
Received: from localhost.localdomain ([112.20.109.102])
        by smtp.gmail.com with ESMTPSA id v7-20020a17090a898700b0026f90d7947csm8990554pjn.34.2023.09.05.04.39.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 04:39:59 -0700 (PDT)
From: Zang Ruochen <xmdy61@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] [OE-core][PATCH] goarch.bbclass: Add loongarch64 to go_map_arch
Date: Tue,  5 Sep 2023 19:39:54 +0800
Message-Id: <20230905113954.18711-1-xmdy61@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 11:40:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187209

Signed-off-by: Zang Ruochen <zangruochen@loongson.cn>
---
 meta/classes-recipe/goarch.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/goarch.bbclass b/meta/classes-recipe/goarch.bbclass
index 61ead30a63..e3555e1e46 100644
--- a/meta/classes-recipe/goarch.bbclass
+++ b/meta/classes-recipe/goarch.bbclass
@@ -90,6 +90,8 @@ def go_map_arch(a, d):
         return 'ppc64'
     elif a == 'riscv64':
         return 'riscv64'
+    elif a == 'loongarch64':
+        return 'loong64'
     else:
         raise bb.parse.SkipRecipe("Unsupported CPU architecture: %s" % a)
 
-- 
2.20.1


