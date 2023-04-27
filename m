Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1865C77B61
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 09:07:31 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.15869.1682586442102763913
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Apr 2023 02:07:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=MN5NvnDu;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1a95aef9885so41635215ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 02:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682586440; x=1685178440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bC4NpgWAMqKEFCs1UZ17i2wrK1H4C55Y0muBKpCwDNc=;
        b=MN5NvnDuJd9SLzlsZYSsMc9LeiXw8iaJidQY1hxEcQenMC9DzgI6IOaZ70e/oYU4tp
         ggb2IDR85V01/GJ0+XT+DXfHsGoRjF9Fj+q5bSp09JJDAJM44CYrf4Lynfav2Jtf+BlF
         2QaalYQFBJuhABHvNWLEhEEQt7rIPL/Gw4QDdzWgI6zrNSk+vWqOhrV07Hs5w2HyqpYT
         JMQDkhbacpHIRxaSpWZV62T2dm23HM8oBhbIqnaGI7i5QUDwCHzQG2t1l/CTZp5rq+cw
         Wi+htEhbAuiXCR0gxkVT7AQjvSUNlkmrNyBRC+n11ebl1nkimDjA6zRGwEPuo/xJLKv1
         G+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682586440; x=1685178440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bC4NpgWAMqKEFCs1UZ17i2wrK1H4C55Y0muBKpCwDNc=;
        b=N7z/4dOyjW0syxiTvasMu2mke3HgQGPmkz+B98/wwrm+nU2m09c1FAsBPDjEslmUuf
         kbZ2QuafMe7KAYApAHJgpngKYwwCoMuJ/n+oaJR11/05ZvYu/TMq4ajhBjmBO+0+rXGf
         NCokvlmm+HEMEltsG3OgIgwUNeIbOxOqLYRlOwlJvjIyFpO36Fuzjji5HpTcpJDyF9ho
         Ny8lVhz048yyVhZH2Ao+2gicZEFvTt0ontQLGOGCMkPHnZTUn5u2czkFEU0yxSt308rp
         kf3qH5RZEGcrP6t0h7aFaSHol1B7Ot/NPuve9tYMc6at5gAN6Quxku9k0tejI9fp87X9
         uAkg==
X-Gm-Message-State: AC+VfDwBRlM3NQwcDSc6TWWAIGImcTW9YMbjhcgRWNI6ISbR1BEFBIwS
	OtTBnHEzu/kzJ5UiSphmR4eCCdzEcIQ=
X-Google-Smtp-Source: ACHHUZ77vcsvLe9vwHGl8I4JfvnDBzhyXxlWafRSzjBVQe2DcR3Rkg0xstQtiECH33fl081PAPEGag==
X-Received: by 2002:a17:902:c948:b0:1a6:abac:9cc with SMTP id i8-20020a170902c94800b001a6abac09ccmr1007784pla.66.1682586440392;
        Thu, 27 Apr 2023 02:07:20 -0700 (PDT)
Received: from localhost.localdomain ([223.233.80.206])
        by smtp.gmail.com with ESMTPSA id bf9-20020a170902b90900b001a245b49731sm11199891plb.128.2023.04.27.02.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 02:07:19 -0700 (PDT)
From: virendra thakur <thakur.virendra1810@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: virendrak@kpit.com
Subject: [meta][kirkstone][PATCH] qemu: Whitelist CVE-2023-0664
Date: Thu, 27 Apr 2023 14:36:57 +0530
Message-Id: <20230427090657.32563-1-thakur.virendra1810@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 09:07:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180488

From: Virendra Thakur <virendrak@kpit.com>

This CVE is related to Windows.

Link: https://nvd.nist.gov/vuln/detail/CVE-2023-0664

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index a6ee958e4b..2517fccf93 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -112,8 +112,13 @@ CVE_CHECK_IGNORE += "CVE-2007-0998"
 # https://bugzilla.redhat.com/show_bug.cgi?id=1609015#c11
 CVE_CHECK_IGNORE += "CVE-2018-18438"
 
-COMPATIBLE_HOST:mipsarchn32 = "null"
-COMPATIBLE_HOST:mipsarchn64 = "null"
+# As per https://nvd.nist.gov/vuln/detail/CVE-2023-0664
+# https://bugzilla.redhat.com/show_bug.cgi?id=2167423
+# this bug related to windows specific.
+CVE_CHECK_IGNORE += "CVE-2023-0664"
+
+COMPATIBLE_HOST_mipsarchn32 = "null"
+COMPATIBLE_HOST_mipsarchn64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
 
 # Per https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg03873.html
-- 
2.25.1


