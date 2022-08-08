Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4356EC00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 14:44:19 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.26484.1659969857352678077
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:44:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YNzTMe92;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id z12so11143336wrs.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=3oUdvRfgKzEf/equxDrE//pLzPtkCMF1tuXfM8aTIDM=;
        b=YNzTMe92rmW5Du86nos+kb7Si4BMS+pptLtFmY9A7ls4lI2plh2fYVzgNcCe9f3pFW
         dgyw0trKlTSriEPjgxhadAYR0rMo4PbS+soZiXGUjm0GCyyN71QGqzh07frngveujQcQ
         mmDKPjJ6dt6P6k5mqkvRsdgKAerbIrjrL56Gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=3oUdvRfgKzEf/equxDrE//pLzPtkCMF1tuXfM8aTIDM=;
        b=TmXNoTuNa03R3JLzGEAoE0h3MX+PaxY/0BD41jWqwcFlPE550WIl/nOlzTqZU1twRT
         fCj1vYGWQjzuNJs3jqr6o9FjByILwRAFStaLfU9h6NpURmNB+ryWocpnAImzd4mpq8Uz
         KyjfZLzpBjK/iVzdfD4RgyWoRZ8e9LYwj5Pa1or5/MFeDKmoqHBf/GsYU8JkZxY3iL6n
         f1srGJl0oHvjuAiapyxOgO7z6CCslwjpwG0dSVAJhdeYzSLFtQG5PQC0kzV6jwlQsAde
         thqMHXsSp0SAITaPjGEd4ZjplrCh+QfeR/Y9sbiNsGh2gn+Un6AG+XpxEZoM2Uv0te6L
         ywlQ==
X-Gm-Message-State: ACgBeo3RhWYJerMSyVNzyTFbgKqLe2J9MeIBG6q7E6MmvXcbmSQfkd+Z
	meMzeHvHprHUGVHkp9pdcPjfUrOhxYidAw==
X-Google-Smtp-Source: 
 AA6agR5PCPFP/WJ8MGSccRHgihvaWxcvbJIURByhaDr0GxMUNQ+wQhWMhGP264M0CUQlwaEj9kVgeA==
X-Received: by 2002:a5d:6b10:0:b0:21e:4bbd:e893 with SMTP id
 v16-20020a5d6b10000000b0021e4bbde893mr11820454wrw.613.1659969855394;
        Mon, 08 Aug 2022 07:44:15 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:d3ed:8697:1d83:a16])
        by smtp.gmail.com with ESMTPSA id
 t11-20020a5d534b000000b00222c96d8656sm3842859wrv.114.2022.08.08.07.44.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 07:44:15 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] selftest/wic: Tweak test case to not depend on kernel size
Date: Mon,  8 Aug 2022 15:44:13 +0100
Message-Id: <20220808144413.56533-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 14:44:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169090

The current test assumes the kernel size leaves a certain amount of whitespace
in the output. Improve this constraint so a slightly larger kernel doesn't fail
the test.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/wic.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 53058df226b..0d664d7c395 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1420,7 +1420,7 @@ class ModifyTests(WicTestCase):
 
         # list directory content of the first partition
         result = runCmd("wic ls %s:1 -n %s" % (images[0], sysroot))
-        self.assertIn('\n%s        ' % kerneltype.upper(), result.output)
+        self.assertIn('\n%s ' % kerneltype.upper(), result.output)
         self.assertIn('\nEFI          <DIR>     ', result.output)
 
         # remove file. EFI partitions are case-insensitive so exercise that too
-- 
2.34.1


