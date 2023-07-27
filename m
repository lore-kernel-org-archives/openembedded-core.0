Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E629C04A6A
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 16:27:11 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.11901.1690475225418919560
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 09:27:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CspN1Cwy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3175f17a7baso1250609f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 09:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690475223; x=1691080023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tK1f5wtozH1mjEXal1K/asYW9Wy3F5M2yVpGAXZPCCU=;
        b=CspN1Cwy9VwE6t/uoHDiSlVABtilfLOly5RD3KWErrHU21qz6Bu3ryfxs78961SvhL
         rR3FKwS1112kfF78n4FsLJI+s42EKKojkOu9krY/V+mTgw1IPx3d5Uijz3uw2u84d8u7
         WULKs2xD489diFihUQmqmWeWkwXybAB8RyZOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690475223; x=1691080023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tK1f5wtozH1mjEXal1K/asYW9Wy3F5M2yVpGAXZPCCU=;
        b=M5hrzkKoxWp2+k1UgzfvQpLhCalKBohmO80tVBmVDOLpyuACjtiJ7qM1aqiU6BDpjs
         kvWtiakCckbV4LjZgwmKthO3ndRBSXCtstoC5f5lN+z63osT2Uf7B05jy0oWm9+4Clvw
         hhvvFe1bSffN25GJVzgjwZXZE7nw4YlttkFr6UXMk4GcsWKeQd06I2A2bMH9mzklwjTH
         eVBnSAtphDAr0LVJAvK2MpCdxK87iOxU2+Y9mNYnSiRvi+N5QMcrO/c/m6a4+2al4LYT
         cJw9fur+ZMM2v5smDQ1jeMLU2ZfawQAWW9NNeqoBFbcb3j8JB9pUL6kE+KO1GBLprIPm
         ysXQ==
X-Gm-Message-State: ABy/qLYAA5TF8eaY5OlnJU2X+ySGqgILtVMVK5sRwIyrMk5ARyw3UUwc
	BfUjIBoZOlMZie9lnOjhsfEcsX2+cAf6UbZewGA=
X-Google-Smtp-Source: APBJJlEjrb/Vtx60e9Rz5G+DzesasYKdErTLEjH+06RiABE4/hx2Q6o50aR7WV79RFtM/TVV9jVNTg==
X-Received: by 2002:a5d:6e42:0:b0:317:71bb:7ccd with SMTP id j2-20020a5d6e42000000b0031771bb7ccdmr2101897wrz.52.1690475223677;
        Thu, 27 Jul 2023 09:27:03 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:efd1:4b49:509f:a1e1])
        by smtp.gmail.com with ESMTPSA id w10-20020a5d608a000000b0030ae499da59sm2440568wrt.111.2023.07.27.09.27.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 09:27:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] oeqa/runtime/ltp: Increase ltp test output timeout
Date: Thu, 27 Jul 2023 17:27:00 +0100
Message-Id: <20230727162700.1576131-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727162700.1576131-1-richard.purdie@linuxfoundation.org>
References: <20230727162700.1576131-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 16:27:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184970

On our slower arm server, the tests currently timeout leading to inconsistent test
results. Increase the timeout to avoid this and aim to make the test results
consistent.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/ltp.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/cases/ltp.py
index 29c26d7d324..362054452ec 100644
--- a/meta/lib/oeqa/runtime/cases/ltp.py
+++ b/meta/lib/oeqa/runtime/cases/ltp.py
@@ -71,7 +71,7 @@ class LtpTest(LtpTestBase):
             cmd = '/opt/ltp/runltp -f %s -q -r /opt/ltp -l /opt/ltp/results/%s -I 1 -d /opt/ltp' % (ltp_group, ltp_group)
 
             starttime = time.time()
-            (status, output) = self.target.run(cmd)
+            (status, output) = self.target.run(cmd, timeout=600)
             endtime = time.time()
 
             # Write the console log to disk for convenience
-- 
2.39.2


