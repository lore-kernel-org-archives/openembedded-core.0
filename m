Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36E8CC4167B
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 17:48:28 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.26055.1668880103298233807
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 09:48:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=hLlwjWNJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id io19so7190898plb.8
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 09:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wmwLVcB1CCHEHRpQzQE2I2JDnGaceVFN193k7lpOPJ4=;
        b=hLlwjWNJ/h0BFqtQU3Cl8g8c05TQ1T86LAD2xpvc8CbfK2cJ15qhq3f3sqfLsgS1Fp
         z0Yh5r7QgLz0+0M9BOQ/OL6ZxChHOrkv5PU3+9O6rfmFSjNGgjIhpn7n5onqyW7gIzXQ
         kv8a+19BnI7PGq8cgKWmzpX8tNTZ8OUBpeAssXiCgISp3TUNTW5Bo0TO0iz/pvrSYMv8
         VDPmtKoabzYMYyi7rq01pjUyLBy0UkxK0IYJT7DiwhCBNZGgbcEdX2ajUR9tVPhl3diO
         oNSVf8kyUkwyHsl/WBx8jpC3DNdws9Kj0YBycs1hTu4CJvqFi5CIfRbWOb/0+KfQLiqa
         sV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wmwLVcB1CCHEHRpQzQE2I2JDnGaceVFN193k7lpOPJ4=;
        b=vvxJ7Vte7lhf7rx4Inq2qbWX3I5BFI+1boMuLr3d9xJN1uBmoPb1BDsfnAGpR5jOMa
         PHKRiKY6dysbO6eem6R/2n6Z/ad7m3QRMLSkDfK8BuUbsKhRdm4krQNTk2lCYVXoQ8r9
         6WOJuiIdZGErnKU4eVeS7xZ4MMOkJsfwzQ7H0oIwN46g/v7tonvZU8Lgugxo/9oo3861
         PcDc3EAfHO6x98TtZoPipjkQLOsxHfx47tnvYc31ZlyloHARiJJM7k93dvR3E1pIX2Nm
         caE4YQMCd7hUcjxjQkkgRofSsFzBnJPpBzlhlDdegQaNedzBrofI4QPwFSY80vJ25gjj
         ZjHQ==
X-Gm-Message-State: ANoB5pnMafmfoJTRWLvK9u5bTDG8ogWbxlI6ACgJ8+be1tItqo6HVR+L
	hkPDLjSIjPpmKSDS0NZtXfnHLERFkh76GQTju30=
X-Google-Smtp-Source: AA0mqf6as9aLPyDFZ3DLwd4Y6MxC16SNkijOWZCILFbh5WXkSMfxgEv19nHwxzcHwDlCCRU8thTIwQ==
X-Received: by 2002:a17:90a:db52:b0:212:d2c2:8e1a with SMTP id u18-20020a17090adb5200b00212d2c28e1amr19421238pjx.54.1668880102331;
        Sat, 19 Nov 2022 09:48:22 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id m6-20020a17090a668600b0020d3662cc77sm7384151pjj.48.2022.11.19.09.48.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 09:48:21 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/21] golang: ignore CVE-2021-33194
Date: Sat, 19 Nov 2022 07:47:42 -1000
Message-Id: <14ceef5ca6a941dc931459ce58786bd4a0babffd.1668879817.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668879817.git.steve@sakoman.com>
References: <cover.1668879817.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 17:48:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173532

From: Ralph Siemsen <ralph.siemsen@linaro.org>

This is a bug in golang.org/x/net/html/parse.go. The golang compiler
includes a partial copy of this under src/vendor/golang.org/x/net/
however the "html" subdirectory is not included. So this bug does not
apply to the compiler itself.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index a0278b9816..ac4c4e9973 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -66,3 +66,6 @@ CVE_CHECK_WHITELIST += "CVE-2022-29526"
 # Issue only on windows
 CVE_CHECK_WHITELIST += "CVE-2022-29804"
 CVE_CHECK_WHITELIST += "CVE-2022-30634"
+
+# Issue is in golang.org/x/net/html/parse.go, not used in go compiler
+CVE_CHECK_WHITELIST += "CVE-2021-33194"
-- 
2.25.1


