Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12CE5C3DA4A
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 15:10:04 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.15836.1724339398185692159
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 08:09:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=MJnsYfkd;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.45, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6bf6721aae5so4321896d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 08:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1724339397; x=1724944197; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0giTKI5R75fjEkgyDO+S8fJsnb+eIm46pgpw+g1CVEQ=;
        b=MJnsYfkd5LIVqrro7CCe8OGFzR9kNweIMxTlBnVtB7dP9+HADdT3aSWZ9B2vXUEzGv
         gHjTH04j6y/BRDUGvjiPyiBd73bBpscZESAfjPB8e4bvZcG8rGhMkhMHwqm+Hk1PwTVr
         /5Yo9cN0GvdHSGHS8rOHZNeBkKahSMynKOxjOOC1P0tHkD3oL9p1iVl4V/18cH0Jhjbs
         fFuBqX85ukxqQMi9cPORP62rK8VRLuOQJ15Mnh2ZA1MyA3kWEzuxeAPEpMOeomLWn0vC
         DaXIH5gqpHN+PT+4rn4tbRBeWsR/FO4rWayHM2MBqqYMli3zXOfdrEp+IELNIfFaLYiF
         7uDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724339397; x=1724944197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0giTKI5R75fjEkgyDO+S8fJsnb+eIm46pgpw+g1CVEQ=;
        b=EJn5XMXJuKOHkcBQ6h2uB8+f44SS2FrCmWBbD4C1ZVdQkkoSxNyi/kpRy/gfNWvx38
         iC9UyEj1baiyiQEuSmCNVJMUpWkvdNqlTjaJg+AbPlzYqsOdeg4Hlb1GoV+ZLmQ6dXpz
         exHNYZyyfC3yLnYTBDlXEM0o6O2+JNDUGD3IJINODXKnSZD4XRk/+co53qwgj/0Jwe/f
         bknFWmY8ttiWROYT1m1zHV6u9Zi+qt4U1CBZXr3liFks2W66koEaF0XgO/ql8Kresaht
         0uFxeUs7EDxduzKkGhPs/hqY7mnA9r58i6toRUNaNScsW+P1Fk9Q/u0zUtJCtTwMU8KY
         UOzw==
X-Gm-Message-State: AOJu0YzJs1ICyYYyXNzNpIv5gmW6HyxDY2r3zD42NADfkHX08uDxiJsr
	FiccjfG6GQL017qfBM9WIi6Xq6d5aosg29WOmFc65lY8aylAibIekmdeGVMiYuAqcM/GQDJ3eV0
	=
X-Google-Smtp-Source: AGHT+IHEh7OXLTgbep/hXjUoIIMETydgpMlUupGBdTVJdjVeaYOvU6yO/fDuoCJENJgCBgoCwbr2WA==
X-Received: by 2002:a05:6214:2f08:b0:6bf:75f8:250b with SMTP id 6a1803df08f44-6c155d55e07mr74908416d6.10.1724339396362;
        Thu, 22 Aug 2024 08:09:56 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c162d796d9sm8364076d6.71.2024.08.22.08.09.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 08:09:56 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/runtime/ssh: increase the number of attempts
Date: Thu, 22 Aug 2024 11:09:55 -0400
Message-Id: <20240822150955.200448-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 15:10:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203654

Under high load, the ssh test is hitting the amount of retries.
Increase it to 20 to avoid this issue.  This would increase the maximum
failure time from 50 seconds (5 * 10) to 100 seconds.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/lib/oeqa/runtime/cases/ssh.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/ssh.py b/meta/lib/oeqa/runtime/cases/ssh.py
index 08430ae9dbb0..b86428002f65 100644
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
2.39.2


