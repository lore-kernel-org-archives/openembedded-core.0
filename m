Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D48C2CD4F40
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 21:33:30 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.62254.1725485606420597771
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Sep 2024 14:33:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=g+P8tvdU;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7d4f85766f0so99776a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 14:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1725485606; x=1726090406; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N++C1OMQ+PQk3A7ikvc7+ldMde+V83j5RVRJNUKt9rg=;
        b=g+P8tvdUe+7wqEENyZrhxylLmURRXhxW95aZ8c5o4bAhEWzf4oYpXIOHf28xNdGysG
         PJ3yC7TSJSlFWuR4CELaW0qNgzNzWxIJ5ImOmgnda8WYKoanebxi3KvBJkFbJVrTBcR7
         kaCBwB/GdCKZ895n0/YH33M+kJSHLnhwLDkiCXB1FrwqkawNiuzle+QWmiNcbDs8G7MF
         /WlHnqFkTi+rOn6Qo/FCOY2fgY+kPj2omGyBEbwaq3ivgUmDZoU3kWG5foQk3nTElN6Y
         A0V5W6eLrgoJYgXqxbCdvTdXpf0Ix/B0dDmLiVBJMN9P9ML+Ep5EayMCGmiOHcn+Efaw
         hpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725485606; x=1726090406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N++C1OMQ+PQk3A7ikvc7+ldMde+V83j5RVRJNUKt9rg=;
        b=ImvIJNuM5fA0cuad9QTBWheCc8jmj3SbwLIBTSociLcfhlxTTr8BaQnOmUgFP48n+u
         Ukta91j6ftdKcTCpIpPkkCsanbsfyjbL+e+qc+pf9r80CcHqLUoiEEvb47gSzmgvgQ8J
         T2vKplzkQxUl1w5yiS9wfpcN8GbZ7Niaa1EtcrIaxCYJGRIM9DRyoLLI3z5VLFdVINS9
         DfhMKTiRY1ooZxv6oRW9OGjPa2DAmjsbiFlyOhi01coAyKGQv7UOclcp+gffZrhlN4A6
         ixpcfZE2QeeBWrNnBU0ACqJP5o7YTsFGSr6b1ZsIenNNnu8QQXgr7SqH6OFbolTlDc9v
         abBQ==
X-Gm-Message-State: AOJu0YwhZaVhaW+HfrGoYfsPhmQmKeJb92CXYkAgVYALJYcPTolss8U9
	KWYdNK3pkyNJltukqspTNTR8NSjkmlwIt5HtnSVAhmg8ipyaYfEuEUFiJJnr7HS/DdTt3j7eaPp
	wPJY=
X-Google-Smtp-Source: AGHT+IGIEHUoDtsDBbZM7bjvRhN8q9n+TLGsknuuvW0+XqW/hT7VrGsglLXXImGvtErRp09U8hCJSg==
X-Received: by 2002:a17:90a:ec16:b0:2da:6812:c1bd with SMTP id 98e67ed59e1d1-2da6812c3e9mr6557195a91.15.1725485605729;
        Wed, 04 Sep 2024 14:33:25 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8e3e8c580sm6693767a91.40.2024.09.04.14.33.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 14:33:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/14] oeqa/runtime/ssh: increase the number of attempts
Date: Wed,  4 Sep 2024 14:32:53 -0700
Message-Id: <4581b5793f310d2f1f0c80bfe1a5f8743416c4fc.1725456307.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725456307.git.steve@sakoman.com>
References: <cover.1725456307.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 21:33:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204224

From: Jon Mason <jdmason@kudzu.us>

Under high load, the ssh test is hitting the amount of retries.
Increase it to 20 to avoid this issue.  This would increase the maximum
failure time from 50 seconds (5 * 10) to 100 seconds.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c796438eec5dd6b4671b798f85506bc89ff402ab)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/ssh.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/ssh.py b/meta/lib/oeqa/runtime/cases/ssh.py
index 08430ae9db..b86428002f 100644
--- a/meta/lib/oeqa/runtime/cases/ssh.py
+++ b/meta/lib/oeqa/runtime/cases/ssh.py
@@ -16,7 +16,7 @@ class SSHTest(OERuntimeTestCase):
     @OETestDepends(['ping.PingTest.test_ping'])
     @OEHasPackage(['dropbear', 'openssh-sshd'])
     def test_ssh(self):
-        for i in range(10):
+        for i in range(20):
           status, output = self.target.run("uname -a", timeout=5)
           if status == 0:
               break
-- 
2.34.1


