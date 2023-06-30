Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE1A9C001DF
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:33:44 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.3936.1688092415751165793
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:33:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=oORpstYM;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.169, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-765a4ff26cdso125903585a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092414; x=1690684414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cj15mkQdLqwj6I5Y5HjNQOXrLwbN6vDc5lNMnaNm6+w=;
        b=oORpstYMtm8yxkwpLVgsK3/dCOvJawtpRCE1/DbyVAOvRqvD14VIB9iG/neO5ptsRm
         AxXo969N/zkDdCE5mNPkzsuTRu1bV16B+U2+Gv9Xulr5H4D4eLUkXIxlKoEidZ8rRSJ1
         Dwz1YUYgKgx/TV1wSZp9WqyNwm9kZh6iEIZUetVWujZsm+KaUHxbFgRxYu/xqxkwva5y
         A5dnddu+MTdWFDH4ojP8LNOhA80Htmj9eXpXIKu27AocECO2exW4qx3FXsytx3vDbgzT
         p8/kWciXeBtLeisoeEf9TrMggINVwuP+zKu779AzoTLLNTY4vZt131UQP1For4RMcPj7
         jRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092414; x=1690684414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cj15mkQdLqwj6I5Y5HjNQOXrLwbN6vDc5lNMnaNm6+w=;
        b=KDVUpFe8a3FnPzRgydoX5tfKVU5G/Mg5IqzkA9qBCheT4FbIWeqPm0MIxCH/r10oY6
         f4du2Ipf88sflyCARR0q7cIKjM2/KQkwQGPqM+mM12Vg7SmVps/r3xPHq8kExTy6nRMB
         eeUjJhk8RkXMCzSEU8mgWPObXUWx+L8mQVlq9/QMKy5m8UBU4meCLpg6P9OkTSiqQhoT
         PKZuueci5xJNqSiWUmioQmSfNp/I3mZ2ft3K1Dvi63wL+qkMkzR288vNbU04130T65lY
         6fD5MJePsLbWaDN81xUqj9etneiQX8JGN7g2FNn21Fdi65M0kTTy/Ha93RxwrimCDSug
         O26Q==
X-Gm-Message-State: AC+VfDwp02feBjo6CkTUbwqNkWif7PxXrUezA2n8AAWGaxWtow1Qwsqz
	w2ayJOqw+kPSwwP6x/8nsZumBOKICug1dl26Q7KDhA==
X-Google-Smtp-Source: ACHHUZ66b/Yfa8fJUifTP1sz29AJzHw4LuvD7F7TsECtgVoP29821+qE12Dv3ewWdKbHN1ukwwofNQ==
X-Received: by 2002:a05:620a:469e:b0:767:3fb8:12dd with SMTP id bq30-20020a05620a469e00b007673fb812ddmr1319739qkb.38.1688092414505;
        Thu, 29 Jun 2023 19:33:34 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id l22-20020a62be16000000b006815fbe3245sm3028607pff.37.2023.06.29.19.33.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:33:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/10] ninja: Whitelist CVE-2021-4336, wrong ninja
Date: Thu, 29 Jun 2023 16:33:15 -1000
Message-Id: <a056017d8383686651de6a72b50d95213bacf226.1688092252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688092252.git.steve@sakoman.com>
References: <cover.1688092252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:33:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183673

From: Ross Burton <ross.burton@arm.com>

(From OE-Core rev: c2dd2c13ff26c3f046e35a2f6b8afeb099ef422a)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9a106486ad7900924a87c5869702903204a35b54)
Signed-off-by: virendra thakur <virendrak@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/ninja/ninja_1.10.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/ninja/ninja_1.10.0.bb b/meta/recipes-devtools/ninja/ninja_1.10.0.bb
index ae3f3f1ea8..755b73a173 100644
--- a/meta/recipes-devtools/ninja/ninja_1.10.0.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.10.0.bb
@@ -29,3 +29,6 @@ do_install() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+# This is a different Ninja
+CVE_CHECK_WHITELIST += "CVE-2021-4336"
-- 
2.34.1


