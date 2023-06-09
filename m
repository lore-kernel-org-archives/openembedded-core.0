Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC639C7EE2E
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 16:54:15 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.152.1686329650018597278
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 09:54:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=WMY0S/X6;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-652a6cf1918so1714127b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 09:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686329649; x=1688921649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DMPMe+NolPn2yfgpNLdmNNEqN+FeyeCxdgQLBGqDblw=;
        b=WMY0S/X62NJZKLcBaVlVw+7zupuhKE8eCGJMEZH1HMCwDNkyTGzXGrcc2JAa3J6rIy
         eOrQNhgLM6lxF/5ft292KKWGp/+HMy6bFZPZA7rne3pyM0KniyN8TgyX+HMCEFAwZ3ET
         fSdD/nhRh39Do8jLuOWCHlCU1N3PXpnNfMI8gBzmfP1H5eR5ia4evsqsILhO0jHC7sNH
         RuSezPj6b3LpJINObcDEdsvqe16bYRyk9NtCij4roPj6Pup08X7PFj/yBTsEB+5jmD0f
         fqS/UtVg7CeEJctj9mlaqRJX4TAfnJO18v6PcS48r5+wmwtFLFX4iqqLMzlMEXxD+caL
         GzHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686329649; x=1688921649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DMPMe+NolPn2yfgpNLdmNNEqN+FeyeCxdgQLBGqDblw=;
        b=QJW9/3A8YDy+e9VfTQbtJI3BTpntblfEjCwYCCufgQ/or7Lq0SdHubO3Md+sgTHKKP
         JNw7htxTtynA/jXkqfANBNMjEGOjmAzzPAbCcuEzZNno/wh1A0Wx7uXKcSB7iC6eT5lf
         iNHvVDKtGe9sCvtjfMawvS3fYlIfiTPyL7x2DODp6AzfyZT0SImy1fou/o7CZ1gaoJiy
         qkcBvTRQh/EehJrsI/OK4pJ6No3+x+6SON7Ft8rPnsZmZnitOpLrfBY0681t8IGL/MP0
         FX1y9yh7vPo8P1LoYj/AZt8u1aSWDXckWwha4RbS3h2afDViQzflErXTVON6NjLo4U7r
         iMgg==
X-Gm-Message-State: AC+VfDzrI8rCL9f8/DyOgQN2yPCAcNAApCbI862dTOO7+R9UBAEGFpYh
	tDK4lhVFrDDolJedJeNLsbDOuO5GIFm4If/hUgE=
X-Google-Smtp-Source: ACHHUZ6hpMLG94sURZvRrAHasHPakj8p9PbyCHUIbscLycPVGdMrqNUU4L5U7FQseYIDbZasi1i2+g==
X-Received: by 2002:a05:6a21:3404:b0:10f:9317:153a with SMTP id yn4-20020a056a21340400b0010f9317153amr1313280pzb.62.1686329649042;
        Fri, 09 Jun 2023 09:54:09 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020a62b618000000b0065980654baasm2901071pff.130.2023.06.09.09.54.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 09:54:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 03/30] go: Use -no-pie to build target cgo
Date: Fri,  9 Jun 2023 06:53:30 -1000
Message-Id: <0e9f47eddf786972b409088629d0f62c6bc74448.1686329289.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686329289.git.steve@sakoman.com>
References: <cover.1686329289.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 16:54:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182569

From: Khem Raj <raj.khem@gmail.com>

Fixes
go: ELF binary /usr/lib/go/pkg/tool/linux_arm64/pprof has relocations in .text
go: ELF binary /usr/lib/go/bin/go has relocations in .text [textrel]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a27d39aebd5966ffffb57c20518381cb06ba8373)
Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go_1.20.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go_1.20.4.bb b/meta/recipes-devtools/go/go_1.20.4.bb
index 587ee55944..46f5fbc6be 100644
--- a/meta/recipes-devtools/go/go_1.20.4.bb
+++ b/meta/recipes-devtools/go/go_1.20.4.bb
@@ -3,7 +3,7 @@ require go-target.inc
 
 inherit linuxloader
 
-CGO_LDFLAGS:append:mips = " -no-pie"
+CGO_LDFLAGS:append = " -no-pie"
 
 export GO_LDSO = "${@get_linuxloader(d)}"
 export CC_FOR_TARGET = "gcc"
-- 
2.34.1


