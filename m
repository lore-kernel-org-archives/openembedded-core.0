Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E13E0EB64DD
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 14:13:17 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.17360.1687961588654091062
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 07:13:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=pYZDemsO;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1b7f68f1c9eso34592515ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 07:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687961588; x=1690553588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D9O6g2y27KFFx+IxcT+fWf67vv1qlo8LOADAl2gQhV8=;
        b=pYZDemsOxxKAHvmbfZw6cTY+fjHS4He6yaCRTQrsQHYfLzUEquK+6fI2VBpN+A2svp
         3wr7D1sfw6Y/8inUP2Mr7s3s6xrawMcrIszRSy6/hKKoqG/cbxS3jveX9CmFbSgBoQID
         VUlu/yeMyQejJvZS1ad7UhYGJhgNu6XMtLx07lELx2Soj3DR9buBO94S0jr8oKrFDAVy
         VK94Is0navXQSfAARH7adRREEjhNXzfEi05R1cHnX3Pdrs1ePIqgIXFQKpoRIMROsEG9
         TBkDaJeNIkWKFoij2n/qqbInWq5CKXPrhgs36aJDojfe9fDky7x6X/6vlRn0lqpmaX2x
         57tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687961588; x=1690553588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D9O6g2y27KFFx+IxcT+fWf67vv1qlo8LOADAl2gQhV8=;
        b=enqBJwZ++DFLRMzEfaTzX9lF3liU8nAAOfhASyexlch66Hhn8TMcOHO8F8jJ7HicTR
         Y4GbTzdFHCrgOQpiPKMz/0l96vKMJS2a3umVyfdbvQe1+oaQj8J8WK8CoNzOPi/ifYub
         aS4uw8mV8KNtz02rcQc7tN4WjqMEeJPOcNj0D9UVhfGdyAaYoaepBRPL0W/AmP75a70z
         xTmts0hQxLQE8nvcpvBW7yK2Bmed4/03x7zS/FV6mZRXMhV5DXKcS22p0iJNzh4r8J4E
         UYVUzlNdrwVa8PYmfT3MorUXtJF2ujRKBa5a0yzFF+74qUGzFGzlSaH7Ss0jwQb+hc+C
         g2zQ==
X-Gm-Message-State: AC+VfDxoxL07yILKA3kbC2Nh+tb3VWfduiRwLJ31Up40stFX32jZkcPV
	V0tu+UOa8jLdujWQhTEuOjC8PoBvwYZ73BXR9ls2gg==
X-Google-Smtp-Source: ACHHUZ7X/zW2/vtpvnFCAQHcWS4pw9ZHcwn5unZoeaPYQpXQpGu56INMBeDXItl6rhcD8uzbd4OYqg==
X-Received: by 2002:a17:902:f541:b0:1b6:7172:62ec with SMTP id h1-20020a170902f54100b001b6717262ecmr16924577plf.66.1687961587763;
        Wed, 28 Jun 2023 07:13:07 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b19-20020a170902d89300b001b3ce619e2esm7792092plz.179.2023.06.28.07.13.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 07:13:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/29] ninja: ignore CVE-2021-4336, wrong ninja
Date: Wed, 28 Jun 2023 04:12:29 -1000
Message-Id: <804067b760591d33cd49f8c31fa68a92fcbf5445.1687961326.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687961326.git.steve@sakoman.com>
References: <cover.1687961326.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 14:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183559

From: Ross Burton <ross.burton@arm.com>

(From OE-Core rev: c2dd2c13ff26c3f046e35a2f6b8afeb099ef422a)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9a106486ad7900924a87c5869702903204a35b54)
Signed-off-by: virendra thakur <virendrak@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/ninja/ninja_1.10.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/ninja/ninja_1.10.2.bb b/meta/recipes-devtools/ninja/ninja_1.10.2.bb
index 7270321d6e..1509a54c9e 100644
--- a/meta/recipes-devtools/ninja/ninja_1.10.2.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.10.2.bb
@@ -29,3 +29,6 @@ do_install() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+# This is a different Ninja
+CVE_CHECK_IGNORE += "CVE-2021-4336"
-- 
2.34.1


