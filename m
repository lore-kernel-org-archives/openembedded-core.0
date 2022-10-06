Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D9C6C433FE
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 11:27:28 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web12.4653.1665055642659877338
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 04:27:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Byo9a9we;
 spf=pass (domain: gmail.com, ip: 209.85.167.48,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id s20so2207691lfi.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 04:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVDUXUKlwpln+ByrZTaWYQoEVC9Lk8lOSQamkmHE7HE=;
        b=Byo9a9wewxhZwaBOBJUEDixDiEY8evFwmIG/8EPDhKj8Ohx98DOiGA4NySrvAExKV/
         2ye1LdBjXDYnXNUb8RBwPu6XsG4234jv68a2pzbkoM5gKFikXCPICcq4e6lZJvvTEG35
         fQVQ7qQKtZ8QeDnDkZ34vCad6KXtSMy1fuNWpcpYEERXMFF3Uoe4FKeC2IVVUNNoOKVK
         zp/+ZM2mwBoao/6dfg3/bj12scDzMeT0okusUj81DRxA/k+bhDhdg3u6kJ9ZqDDt+OpW
         GIoZvc2dH96Z3m5IGGGvoR55Vft/1Jb1i0Atz6WYZ9e5GoPDDEYfsvaPqQR64diN+2D4
         /dsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVDUXUKlwpln+ByrZTaWYQoEVC9Lk8lOSQamkmHE7HE=;
        b=4zgq8gFgMfeAIr5clA9aUhTRMqLEiUzdB/fadYhlvYoa5ZrarHBf/vZJJtLLSYvNW0
         SGA/+7EnNtW88/a8eoSPSOSIfQs4kv/gNM1H6qjO6gkFT4X+5//VTjdSJbd3DaXb6qR5
         OZ0VEinRmPcwHqCu3D0l+yZEYrCllhaPxLL0lmx8GACmVHH4qg2ntvKYWeohrA1oVznq
         HrqH7bw34Pkhh79C8RmTYR2LxDfonF0gVsJ6gSu2cIibTfkwtzem0mvrUGDPIulqnSfU
         7Iwytr4qI0tkFV1pVqKN2RYAxiaT65otQXmKzDM05IpHH/QLP41NZA5SeUctqBIbmMUQ
         hsEA==
X-Gm-Message-State: ACrzQf075dOtJH6fvXgbcupXGC42pbt4ZkHoF+D4aTyFj2m36C0Gy+J3
	WOqkUNMACFbSBPdXXarwccvwQwR3INE=
X-Google-Smtp-Source: 
 AMsMyM56Dyz+c47z196gCczSmK/ml+rTMlk4ZcZ2+t4ZBeD83rnGNrcCeHbpQY6zsv9uN48wMiozww==
X-Received: by 2002:ac2:5e23:0:b0:4a2:6e06:e107 with SMTP id
 o3-20020ac25e23000000b004a26e06e107mr1536790lfg.256.1665055640602;
        Thu, 06 Oct 2022 04:27:20 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 ([2a00:801:74a:8a14:c53c:8bda:a430:fba8])
        by smtp.gmail.com with ESMTPSA id
 i8-20020a056512318800b0049ebc44994fsm2668056lfe.128.2022.10.06.04.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 04:27:20 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH V4 2/2] testsdk.py: ensure the testsdk directory is
 writable before removing it
Date: Thu,  6 Oct 2022 13:27:12 +0200
Message-Id: <20221006112712.23062-3-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221006112712.23062-1-liu.ming50@gmail.com>
References: <20221006112712.23062-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Oct 2022 11:27:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171495

From: Ming Liu <liu.ming50@gmail.com>

We have to make sure all users have write permission to testsdk
directory before removing it, this is to avoid potential 'rm' failures.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/lib/oeqa/sdk/testsdk.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oeqa/sdk/testsdk.py b/meta/lib/oeqa/sdk/testsdk.py
index 35e40187bc..e0179c9849 100644
--- a/meta/lib/oeqa/sdk/testsdk.py
+++ b/meta/lib/oeqa/sdk/testsdk.py
@@ -101,6 +101,10 @@ class TestSDK(TestSDKBase):
                 processes = None
 
         sdk_dir = d.expand("${WORKDIR}/testimage-sdk/")
+
+        # Ensure the Test SDK directory is writable for all users.
+        subprocess.check_output(['chmod', 'ugo+w', '-R', sdk_dir], stderr=subprocess.STDOUT)
+
         bb.utils.remove(sdk_dir, True)
         bb.utils.mkdirhier(sdk_dir)
 
-- 
2.25.1


