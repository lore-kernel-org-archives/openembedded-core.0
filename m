Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 929EFCDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 15:52:09 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.57869.1697817121561073190
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 08:52:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=21oTZEID;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1c9b95943beso7864465ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 08:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697817121; x=1698421921; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dnx36pQGPFUED2DLsYv3GQ0iQ1lwf7MaqmXWCAFvf8M=;
        b=21oTZEID5HQZv42nBlRgi2cvX2eNTWGzow/+3ngXuvXEk+Mnx6ZKy+88wzpW4QyQWw
         7q7yQ8l9GJNScsODgu7TRJkA/ZPpWeCsyJZaPZ4pvzOnS9ri//LOJw6kv8sSjg9ghqtk
         Q1hyCAQno+gQS7wpS5GZG1n5+h3IoI4Z3aFrjg/DlySA+BM6gq9yBYmJE8WzjqOWFDTm
         bGd7kS+8GArd2MOmjlIZ51Suoz9BHDBeeEdZC93AvIbNJaXbjfsQl5uXg33md/A/fiph
         n7L+svXOfEL0gbwhAsOLbxEGkoBCWgCQYthP6a67mMIuqe5DGU49Ng5ghN/x/6+Oh9FI
         i/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697817121; x=1698421921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dnx36pQGPFUED2DLsYv3GQ0iQ1lwf7MaqmXWCAFvf8M=;
        b=TJBhj0OGk9iMfPmzXxqanPi3QJKdBIKqT9fWsx61ftG0u2/nwP1X5VMUagDf+FXlM/
         ca+xOkxrS2b4bcy/sx4j8Gzz5lIflwDoPfBLtuN1u5iwzazTMEioWD5Cdn+IE5Gys1aN
         d7y9cYttWUT444UWT9xJ9rD79R6xeEpFyzuxVJB6tqB1VMSuLk6cgrqRTrnEt8/JjPFL
         4uoFLZVSXUwvuX8gUjhij5ISA4igawZRUR8mPnV//GbzxRygkj9I9AF3C7wk3HQRR0Y4
         ukxOgJRH+QYIMgCGiA87wHAZw3sRan6PcOn/5gZ3PtC4ctvPMp1So80FJ39Z0tGpgixz
         lI/A==
X-Gm-Message-State: AOJu0YyzJfpMnwkmc2o0y7y1u+hrqAAXTmFIPkbEBgDBGoGwWa0N+Qu7
	AFm0Eb2ugD43B2tp2fLArGUAVQ2yg08R5vE6ZDU=
X-Google-Smtp-Source: AGHT+IG0Zn/uDWslAC8nVYhf+jM7uEbR1HXBqjCspA55MIco7N2EwopSt5GIX//T6dXQV1uX99zjkA==
X-Received: by 2002:a17:902:c409:b0:1c5:a49e:7aa with SMTP id k9-20020a170902c40900b001c5a49e07aamr2583712plk.27.1697817120656;
        Fri, 20 Oct 2023 08:52:00 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q12-20020a170902dacc00b001c71ec1866fsm1679244plx.258.2023.10.20.08.51.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 08:52:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 15/24] shadow: fix patch Upstream-Status
Date: Fri, 20 Oct 2023 05:51:17 -1000
Message-Id: <2d789678cf430683fc24995514414ddfe32c22b5.1697816789.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697816789.git.steve@sakoman.com>
References: <cover.1697816789.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 15:52:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189560

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Replace "Accepted" by "Backport" as specified on
https://docs.yoctoproject.org/migration-guides/migration-3.2.html#miscellaneous-changes

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 945f1106de1fc1b08921e05aa0f871092c2c116d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../shadow/files/0001-Fix-can-not-print-full-login.patch        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/files/0001-Fix-can-not-print-full-login.patch b/meta/recipes-extended/shadow/files/0001-Fix-can-not-print-full-login.patch
index 37ba5f3dc2..89f9c05c8d 100644
--- a/meta/recipes-extended/shadow/files/0001-Fix-can-not-print-full-login.patch
+++ b/meta/recipes-extended/shadow/files/0001-Fix-can-not-print-full-login.patch
@@ -7,7 +7,7 @@ Date:   Tue Dec 27 17:40:17 2022 +0530
     Login timed out message prints only first few bytes when write is immediately followed by exit.
     Calling exit from new handler provides enough time to display full message.
 
-Upstream-Status: Accepted [https://github.com/shadow-maint/shadow/commit/670cae834827a8f794e6f7464fa57790d911b63c]
+Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/670cae834827a8f794e6f7464fa57790d911b63c]
 
 diff --git a/src/login.c b/src/login.c
 index 116e2cb3..c55f4de0 100644
-- 
2.34.1


