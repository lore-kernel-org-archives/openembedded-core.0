Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF00CDE007
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 22:27:15 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32863.1782253629508415175
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 15:27:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wJ9YFjV0;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso3664355e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 15:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782253628; x=1782858428; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FztXDc0Ggh+2S1cZPE/sTwbrlJIo+v4a+px6yXZO+4s=;
        b=wJ9YFjV070Jc4hjy4+iTGBTjkmcrX/QtIZEy3zpJak3PqQZczLv+awnOabzyqG1Uun
         tLe/MfEewky/TZT17ziwHw6Qr2XjAoi6fWlxzvMGiWFRdmRHJ98V8mLgx/QoQM1N+Q5A
         /Av4MLK+QC7qFu/nmViYZ1FLjwxvL+RywjIzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782253628; x=1782858428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FztXDc0Ggh+2S1cZPE/sTwbrlJIo+v4a+px6yXZO+4s=;
        b=Z+qRH5szp95ZQ6VaEsBNEbxu6qRTm1BznehLDBaAatK3yy0zQ5Hp3Z4nZ7n22WhFFR
         +1BqDWXMhWMAul19mGMaVE3Tf8VDpvOVlQH5jHFeXLOraa55mW4MOWhLJ/JRGp+xRv+H
         4730ZWYVH3NTruiJskljLG6RYNcY1F8MCGIyiEtefHjOawBKWFz71PI53OxPX5FbfsF9
         zkU+J4AwC0B7Fds3yCfAaQ0D8ctNFSFACq8p/OSYFcYlrRY5XDER13RXRa0Y/UyJZv52
         aD959Y4PnE3H6h5dReX5/xz68BmS3S/9HDrfXS0LERXUlnfDb5SZT3ATIgngzv/d99J/
         Jrjw==
X-Gm-Message-State: AOJu0YyOFwWKmg71cGPK+gSZQYgNW2aZBcr3DNlrIUrUgGV5hm/B8u4n
	2v9D3Yl6nmuuU4fWu4KFjfWmzA0sNOA75/bVNJATS25EdFED5XGs6OUzYCZYmNI5z+/94007+NM
	bFHC7
X-Gm-Gg: AfdE7cl9yikjbjjbL2CBnYOS2KGW3zGV1iBjHopsGTdPmfCExX44Z36EFETS2fzhw1M
	Fmo+jtj7VjrjP9it/KT1C5Vx5VRWtz0D3YXUHe/CeSv5/MJUf81qfKIDL7nOb7CHPDcCNq2wA1j
	eAcgtR3v8s4fYaBIaSzfEh5eibsAo6aARmz5iRuVfaiZ0UVm75xCfoYOC2PkEJPayzp8uBCsCZr
	d59H5WMx/Xw9pMi8kyIAu1LBIJ6gEGPfw8EW4A72OL6aOvEJS3WKGOrodLij4vQ8J14LsAd+t2M
	JgxthQ4pBvx84sjemjf/lIHDEigS6wBAinUudxErBsvyPgiC1fdoTkuU+MgqtDqKBzxQCJb9KYJ
	Qwz/SD7yrte9xbRUD8acSX6VR4JrRKao3FiRncUqzEAmpUBK+FD22pWPoyZINPAetRjupLd5mmV
	ZKQM/+LiSq+HCekTGnOovNV99ubQ3TOfLG4WN8csP+YWzL+uMvA3GxtHkDfbleYBpYgdcYsCGIk
	y/9sDdPmNJ/v64q
X-Received: by 2002:a05:600c:4e4f:b0:492:5e36:155a with SMTP id 5b1f17b1804b1-492608805b0mr6271375e9.34.1782253627711;
        Tue, 23 Jun 2026 15:27:07 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0055dd0cae868d89dd.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:55dd:cae:868d:89dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd21dbdsm370786745e9.6.2026.06.23.15.27.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:27:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 18/41] oeqa/core/runner: stub addDuration in OETestResult
Date: Wed, 24 Jun 2026 00:26:17 +0200
Message-ID: <9105e2bbf3245bfa02d2f4c55a010a7d2c3da6c2.1782252148.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782252148.git.yoann.congal@smile.fr>
References: <cover.1782252148.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 22:27:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239440

From: Ross Burton <ross.burton@arm.com>

We have a custom TestResult implementation, and Python 3.12 added a new
method addDuration() to the TestResult interface.  This would be useful
to implement correctly, but for now stub it out to silence the warning
when running under Python 3.12:

/usr/lib64/python3.12/unittest/case.py:580: RuntimeWarning: TestResult has no addDuration method
  warnings.warn("TestResult has no addDuration method",

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2d6fff81b34476b890f6943997615fbf8d3d133f)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/core/runner.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index b683d9b80a7..0d2bc3a3ed0 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -78,6 +78,10 @@ class OETestResult(_TestResult):
                     self.shownmsg.append(test.id())
                     break
 
+    # Python 3.12 added this, stub it out for now
+    def addDuration(self, test, elapsed):
+         pass
+
     def logSummary(self, component, context_msg=''):
         elapsed_time = self.tc._run_end_time - self.tc._run_start_time
         self.tc.logger.info("SUMMARY:")

