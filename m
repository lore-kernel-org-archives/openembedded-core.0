Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6CE3C4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 17:09:55 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.41050.1702055391683403814
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 09:09:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N37CXEBR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-33339d843b9so2453523f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 09:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702055390; x=1702660190; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2DmdKX37QKnvZdxsk7l9JMhb3Zd8GPzzLPCTZW+e5Tw=;
        b=N37CXEBRhZ5ToqJhEW3T6S4KgHu+2cVn6nUaI0GVBV2U0afk0JG8Mci58oRIlrm/7w
         eqe35qrOopBboHP/8RocYPsa8QKd27KxsXCvdn7wD7Bnca2HY4yRC8mvRlFa3hy6EYfv
         3PIM3T9LFBIFyRxQXmqzu4BkukcZZd8xHWMYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702055390; x=1702660190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2DmdKX37QKnvZdxsk7l9JMhb3Zd8GPzzLPCTZW+e5Tw=;
        b=Ai88mFyLji/siOyzz34sP9ToBcAUN8Ap+KDZ0BrElb39VDN8Qn1Yae7FgDfkfJeuC1
         RqFoDnANB0C4RSQuH85Rw1cbLnHKGV/+4+wKeT2a6xvYiEjmpcgyk4hscP2k4nUTSAaT
         8GTlRVAlu0B0XEhTE9DPhXXA85enVUZqaiHmivSA+lsWHcHNvyBeFIx/FTAhtYQwGAbO
         91nwT50ZCJLU/7gg0h9cHtLe/ikT+08o9pqFeNsqY66YKtUpQB3eZ0kl4c2SpyVyVIzg
         8yfn4ldNsEpmaH0LPYNQwcgdwnIYiJSZ5vm1SQ99NoDsNebenE2/JVJZS+LW9+dipzax
         alnQ==
X-Gm-Message-State: AOJu0YxR8jBYEQR3bLrtHsxd7cmi8x3A9PzMkoLArDiBKXBI5i6hWb+2
	3p4p3rp0McEk5WSj0oZw6uvwhbiMTQuoJ9POWMY=
X-Google-Smtp-Source: AGHT+IGO8Fb4Sf441mF+eDofFXBq6Nxc/4xD10fEd+h5C8R/1Y3YZCERaQAW8f0MeWmB62FDQPTI4g==
X-Received: by 2002:adf:f7d0:0:b0:333:43b:840a with SMTP id a16-20020adff7d0000000b00333043b840amr183286wrq.50.1702055389575;
        Fri, 08 Dec 2023 09:09:49 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7bab:5c16:7781:6a4b])
        by smtp.gmail.com with ESMTPSA id q15-20020a056000136f00b00336098d0e64sm1400468wrz.106.2023.12.08.09.09.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 09:09:49 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/runtime/systemd: Ensure test runs only on systemd images
Date: Fri,  8 Dec 2023 17:09:48 +0000
Message-Id: <20231208170948.2035569-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 17:09:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192080

When enabled in DISTRO_FEATURES the test may run on a system without systemd.
Fix this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/systemd.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/runtime/cases/systemd.py b/meta/lib/oeqa/runtime/cases/systemd.py
index 4c581ba396e..2865887959a 100644
--- a/meta/lib/oeqa/runtime/cases/systemd.py
+++ b/meta/lib/oeqa/runtime/cases/systemd.py
@@ -137,6 +137,7 @@ class SystemdServiceTests(SystemdTest):
             status = self.target.run('mount -oro,remount /')[0]
             self.assertTrue(status == 0, msg='Remounting / as r/o failed')
 
+    @OETestDepends(['systemd.SystemdBasicTests.test_systemd_basic'])
     @skipIfNotFeature('minidebuginfo', 'Test requires minidebuginfo to be in DISTRO_FEATURES')
     @OEHasPackage(['busybox'])
     def test_systemd_coredump_minidebuginfo(self):
-- 
2.39.2


