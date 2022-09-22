Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04246C6FA86
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 15:28:04 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web12.194.1663860475177497360
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 08:27:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b+1iEr7S;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id
 o20-20020a05600c4fd400b003b4a516c479so1578455wmq.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 08:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=/sXTz+/ZvxB3a4judxmiJs6AV3E6qXYiKybIAra3nbU=;
        b=b+1iEr7S/ni0uvGgojZ99XJbmDK2yRqGCBsXznmXqUPzXJxCmLbeJk0fbfNtcyUItx
         pFnCIUMV9Bb3Wdn+8kA8qYIr8XfBw0GFymMt0qawkx4RdD9H+aBId07dweKOTj+EfRHz
         Yrpnzw0Ffjr0d28BEcDZDszHvSSIBQw8Hrluw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=/sXTz+/ZvxB3a4judxmiJs6AV3E6qXYiKybIAra3nbU=;
        b=Jg4M8tUeb1CS+IGk+IjxBz3H1isGjyTtDZnZ6qvv3aI2S26FtS5H9o7z6WXUuYKFQB
         8Ls1ZF6EW8/TT6s1Sdc3K3zn6b16bcfY2WqmPdBJDxYHKDAtjrDk7KsjAJMG7aKg4kCv
         86avmt12uWqqBMYgliPfTgyfJ9onKyvEYznjH1SPPePN5CYMhgIEv/fIU5vU0u5AuhVh
         W1y4A+/ObNrpV2/EXseBcdXr3fd/HluEv3OHSthwEYXm0FNTf1J95Z52j+sJ2qG7jBj1
         ImmLPY9kVGsSZ3uzM4SJszbHngpP4JKg4BxLeFionetQa1xCAdI9ediZMbwGNSyKC5w9
         j4SA==
X-Gm-Message-State: ACrzQf0uionV4GmqDMKpLSDP8YDV22A3IDe1xdh2/5HzTW8AptIT+sgm
	9kKc5WahonIm8NNX+/zfPGAYeRbuZ0wEag==
X-Google-Smtp-Source: 
 AMsMyM7qos0Qxibd1AZjNJgo94jEZqQNAaGwx9Cjx3cQP4UcNEvthsQqblRP8jiBgsH89VTXzeIQ5A==
X-Received: by 2002:a05:600c:154d:b0:3b4:aae6:4bd7 with SMTP id
 f13-20020a05600c154d00b003b4aae64bd7mr2863841wmg.63.1663860473329;
        Thu, 22 Sep 2022 08:27:53 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6f87:a0ac:e77:378])
        by smtp.gmail.com with ESMTPSA id
 o2-20020a05600c510200b003a540fef440sm6881428wms.1.2022.09.22.08.27.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 08:27:52 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] oeqa/runtime/virgl: Update test to match new mesa version
Date: Thu, 22 Sep 2022 16:27:47 +0100
Message-Id: <20220922152747.1685843-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922152747.1685843-1-richard.purdie@linuxfoundation.org>
References: <20220922152747.1685843-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Sep 2022 15:28:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170985

The output string changed slightly in new mesa versions so update
the test to match.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-selftest/lib/oeqa/runtime/cases/virgl.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-selftest/lib/oeqa/runtime/cases/virgl.py b/meta-selftest/lib/oeqa/runtime/cases/virgl.py
index 144decdd6b7..f19cdee9f09 100644
--- a/meta-selftest/lib/oeqa/runtime/cases/virgl.py
+++ b/meta-selftest/lib/oeqa/runtime/cases/virgl.py
@@ -15,4 +15,4 @@ class VirglTest(OERuntimeTestCase):
     def test_kmscube(self):
         status, output = self.target.run('kmscube')
         self.assertEqual(status, 0, "kmscube exited with non-zero status %d and output:\n%s" %(status, output))
-        self.assertIn('renderer: "virgl"', output, "kmscube does not seem to use virgl:\n%s" %(output))
+        self.assertIn('renderer: "virgl', output, "kmscube does not seem to use virgl:\n%s" %(output))
-- 
2.34.1


