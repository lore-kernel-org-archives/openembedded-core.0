Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C70CA0FEC
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 12:52:58 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.13591.1725022373736436033
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Aug 2024 05:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TvIcWb3J;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20202df1c2fso19492185ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2024 05:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1725022373; x=1725627173; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tIOduqnwN0W1/0YnBLo7Vyd49+G8D/XFjE5izHwu9SE=;
        b=TvIcWb3JZXVha28Ejjuvy0eM8TNEmU+DVogdkp+XYcl4KLXbZ+0O+QKnY26cgWlPF/
         lH0bFzEIxVViFIHNtPCKrZnFGxXeogbE35Bzi2PnhY37zxu7GGe0jYm9rx0+2YhhsSpI
         4/DwRJSr6JRHKOpWYmW5q5wt15btByKteF4HPeCYWNHscl8W3v3eB7DBXO7D9U+7MVeI
         /pia3biGO0ld7CKIcQd9WlZcMMMnaLW9jkPDgvVZNr5pub9f8j1zpXk8PHk26sUktAo4
         WujKtNH4PhdUbL/rsh9yWVNEgvICN/ryuzrjFuHK1BB4ZI9G8s2YkZA0MR4qQdqMHS3Q
         WTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725022373; x=1725627173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tIOduqnwN0W1/0YnBLo7Vyd49+G8D/XFjE5izHwu9SE=;
        b=vWsVu2BzHyy65KtIkJ8dLAeXjEd7POSTJ3h1Jiphdwc7xQFpBdkb4PqtiDQXyIQcsI
         Gl7bQlkErNge41fbj8XH3dkOPSoRIRYoSRmHzk0eh/dFPdyl/FrFWmVSH0KUG+U5JXb3
         wFOMLE5px/5efgx7zFqEQLyae7ywjeMofpW0oueLWoeBrbO/VFKkldHgaVeRbxb2XEJy
         wOUbRQ/YsRpMU75qWlD7Q0adkccA76Oz64FJdR5uM7ZYtaic7PpUc5dtx8KoBU+GBuzG
         Y7cEX6LC5NgSyIF1Et2EfkE4ODoB9SB+Qq4CzColonOL+i8wPqDynI5mubx29eObkVl2
         5wRw==
X-Gm-Message-State: AOJu0YxQOyawNa7nVUlkZxChaagsJA05FusAadcQydTzYWVhxmKo1g9I
	+rM2y5zaUwTR+EX6ycnK2J1N9dG51WvOHprG4ia1/vNBvHxrSwCsC1v/D8Fo7K+JH+UjoUQRxZq
	Bh1M=
X-Google-Smtp-Source: AGHT+IEOZxxDc8qI0/X+cyzqCqGBETZac5L4ootyC5hZLtPcQrkD2OicARRzE7gIuY5HKqsXNjPx+Q==
X-Received: by 2002:a17:902:e847:b0:1fb:a38b:c5b7 with SMTP id d9443c01a7336-205276c71aamr40359945ad.1.1725022372947;
        Fri, 30 Aug 2024 05:52:52 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2051554235bsm26295975ad.214.2024.08.30.05.52.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 05:52:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/7] libyaml: Ignore CVE-2024-35325
Date: Fri, 30 Aug 2024 05:52:41 -0700
Message-Id: <a28240d49c111050e253e373507ac3094b74f6e1.1725022186.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725022186.git.steve@sakoman.com>
References: <cover.1725022186.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2024 12:52:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203960

From: Peter Marko <peter.marko@siemens.com>

This is similar CVE as the previous ones from the same author.
https://github.com/yaml/libyaml/issues/303 explain why this is misuse
(or wrong use) of libyaml.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libyaml/libyaml_0.2.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libyaml/libyaml_0.2.5.bb b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
index e30dc5a43f..514c60779c 100644
--- a/meta/recipes-support/libyaml/libyaml_0.2.5.bb
+++ b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
@@ -20,5 +20,7 @@ DISABLE_STATIC:class-native = ""
 
 # upstream-wontfix: Upstream thinks there is no working code that is exploitable - https://github.com/yaml/libyaml/issues/302
 CVE_CHECK_IGNORE += "CVE-2024-35326 CVE-2024-35328"
+# upstream-wontfix: Upstream thinks this is a misuse (or wrong use) of the libyaml API - https://github.com/yaml/libyaml/issues/303
+CVE_CHECK_IGNORE += "CVE-2024-35325"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


