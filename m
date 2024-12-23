Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65402E7718F
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 16:35:55 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.15176.1734967779962356746
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 07:29:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=celfSyyT;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: ribeiro.angelo224@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43635796b48so26656555e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 07:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734967778; x=1735572578; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iKwY2kiSbGoaaVBn0OXBygAFk1cCvIcDHqJK9ArtjLI=;
        b=celfSyyTjIKEK0Ui3WaKvU2OAQ05GgMiDOwoVwHT1oB4K722L0zUJmX6NNJ6jtUgNc
         2/kn2YLkVM5ucj65r3phZCkpBHWs0sDwSRwsfGfM++kC4kh7jPp+QZxwHfEzpPSa09vq
         vBHgkhBPZ8Eye7SQTK9Myg8pOPzZcmDeJiYHOMCOyaEWKbVqYnRBInWBVey9YGxglGFn
         al/V8fOZUwrvxmBaAH8HYbX6vbVZeKMdZaHypwRESXEt7q8KBvRUCjJtFOlZWbT/xQov
         euVlaOQbi3M3aLJWguA9zMvsOQD6ZHzlOdgPyCevKpxflyM72q4XjO8G2+tcOKfHC0Hl
         2b6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734967778; x=1735572578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iKwY2kiSbGoaaVBn0OXBygAFk1cCvIcDHqJK9ArtjLI=;
        b=FYYNx0x/W+RXVjXWgtPayeS7K8qGguBaBAG0M4z4xTgLkBy4jHaJffw7RQo6gDwghx
         n1bzJxEJXc7S1crFaNSnQljrnUiUCwhsWrdCKOhlndk6YXNZSArmJWNOnBJ/d1D+Wx/H
         neO45dOl74WVegI4Uqw7WhhReo2d3Es9JQGnoUrLINPIsMy1FTCZNDQQx9ESdvtoFCoI
         qYY6yCuz78ydoG8i8JOQK4xbAGBf7Z61yt3y9WSv2ZT6gcnKX0DiN9X+vl47k0rlgf5J
         uhSWVpom9CdQpPFWRgq/Ke0sgf9HCPMAleIw6SNSQWOTomJE0UpgU60OJ1KUSmP4wT/X
         tH2w==
X-Gm-Message-State: AOJu0Yyj1ky/ZAVF89wIOCT4imnm05eCMMhUVDzYBcUQSjQjukIzLQbA
	faSF9ehFDeJJ6upQTZzadLwoeuQCVOrjj4+N0N7/nGVV4uE2dSnOD9Fyapjb
X-Gm-Gg: ASbGncsKtISRgbRK9YBGGP808M7jb0gv7PAulLq0vK5Yv9/RXDG1+76fWoM8KW80O2l
	UZs4YkpfxKhq7/XOAyzN5o/Jdg2KG8Zw0+dl/sc+Nb6LCr6/MAEgOMnhqNnpCssSPAkTMhiJwUs
	M7BNpB+Qgtn6sSb6+6c8UcYNJnLOsIZBdGjizmasEpnHbq0Ay4JzYhxwYsj62QPDzyvO2M4CfE/
	mnYB4JAOw9FZjoXpZo0oROMYOX/gj2E5aFMRtlCbGrIrXXli9D7rjUzqimAR/nq8yZX8oE6N7ug
	M+avtA59swQ7C/P7X6U=
X-Google-Smtp-Source: AGHT+IEad9UsjAI7uf9LXkYKQjTqdtoXjV0DA+M/GD85AxVc6yfh3ouZP3zFmJ/4OjlVOqhi4v5Rbg==
X-Received: by 2002:a05:600c:450f:b0:434:9f90:2583 with SMTP id 5b1f17b1804b1-4365c79294amr150962305e9.11.1734967778226;
        Mon, 23 Dec 2024 07:29:38 -0800 (PST)
Received: from L-PW01ZSFV.criticaltechworks.com ([213.205.68.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661219a7csm138587995e9.24.2024.12.23.07.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 07:29:37 -0800 (PST)
From: Angelo Ribeiro <ribeiro.angelo224@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: "Angelo.Ribeiro" <Angelo.Ribeiro@criticaltechworks.com>,
	Angelo Ribeiro <ribeiro.angelo224@gmail.com>
Subject: [PATCH] report-error: Add PN to error report file
Date: Mon, 23 Dec 2024 15:29:19 +0000
Message-Id: <20241223152919.84997-1-ribeiro.angelo224@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 16:35:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209045

From: "Angelo.Ribeiro" <Angelo.Ribeiro@criticaltechworks.com>

Extracting the PN out of the PF value is not allways trivial.
For example when PE is set the package name will have the PE value
before the '_' that clearly makes the division between name and version.
Other packages include a number in their naming separated by a '-',
for example mozjs-115 and openjdk-17.

Signed-off-by: Angelo Ribeiro <ribeiro.angelo224@gmail.com>
---
 meta/classes/report-error.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index 1452513a66..2b880c8b0c 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -81,6 +81,7 @@ python errorreport_handler () {
             task = e.task
             taskdata={}
             log = e.data.getVar('BB_LOGFILE')
+            taskdata['recipe'] = e.data.expand("${PN}")
             taskdata['package'] = e.data.expand("${PF}")
             taskdata['task'] = task
             if log:
-- 
2.34.1


