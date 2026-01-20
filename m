Return-Path: <ungerer.ricardo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52CB4D2629A
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 19:47:39 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15235.1768938449697686022
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 11:47:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J9wjEo+o;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: ungerer.ricardo@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59b6c13b68dso163968e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 11:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768938447; x=1769543247; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e4+ErnnIAdbQltOXrfHObtyfG77tXL72S0ro2vHq5Bw=;
        b=J9wjEo+oLBxO6pj4pNazWIsTT3am7wDNzUYDmyi6NgOiC8D02AgK/UhW44rS4sGx7c
         ETg2lBvQODdSt0N5soR4rtBMXJoDP/276JBWCXK/I9mc2vGHO5tAH/pnFc/tIHS2mDYR
         8AYavVlPNuxec5EE0M7dqe1FtsGWzrlnzZni0N95kOxhMz3kk5MEAZuyN5XNF7gmZlOt
         wsqZn+CD8/oftep+DCxTMFLNjZdYdAJvYm99KNcVoaXx2HYuLKjPgptnjhk1On8v6dB/
         ypl+Hs4cx05tZmPiJldpVK7AK/LtzadxUScTaCKUrbk2slFeMS0ISUkpBnJBJsdbbVNL
         3fkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768938447; x=1769543247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4+ErnnIAdbQltOXrfHObtyfG77tXL72S0ro2vHq5Bw=;
        b=cSB0vzW+Vglb0d2NG831+7amq7DGQSCVWox8lnsA0jMyCHlRA5iAkB1w/autXSKEKQ
         vJKj1BGvjOtseJxsGvr33ybJKdRcHbde/1xrynelTOnO1m0HdFdDXXLPj72Ww//qbF++
         HIdM2INdPmtEZu59Bl1BNxQ8Po1RvHDQ8X9yCSpp01xVLvKcIxiV3pTAwrqImWeeJSX4
         dimwPjJ+w7CraLu97VyKfwnjouukGCg2xR2A7kzcMytatZ7Xi3ikcvc/zHzX10KKxecC
         A8NUqnI8y7Ly2xLvr8PpOVz7sTQ4YVq3hdLxpHTJ2mEhNUfAcE2Kp+KzamL3LYn+EQru
         Sqew==
X-Gm-Message-State: AOJu0Yw2bmkNL0cc9AzpiJrxBGwBxCr0MhVd80Yj/C7vgW8hhFWWXcRw
	TtiCnXeNzGnooTppchiyAH7KuIAKMh+MtRnTqmGe9mGw3+ztrv4Eg29S3XshMw==
X-Gm-Gg: AZuq6aL/DiapZrDTsTxAJi/ePV7F8ymyEAzPuqb3U0PWMJ29aFGp/Vnv+43SgmSMt7n
	IZHxAkRu3sIf4FzaUwSShKxJuJ26UxpJsG0bbLnXvt+r8btfsbJ/WGmoz0nFYQQtMPZep27WU7I
	PKT3tNcsOS+GgGaGvKmSpDg4UYrMQwdXUAhFviJvTarvOqq4ML75V211TCVytfynUB8Yk5wJRX+
	zYpHIMYlGvx02pcw3IlK6b3q/L778owdS+4MwwRSQGve4T+WOdzlp/F49I44iP8vrlB3wAmqNkA
	I522KZwAggjeoU3cndQqhb88A7N1+NszqU6Gpj0KR2akDa99NF6Nc9Y8r3ZCh1FUAvWNsff/sLj
	/xUP01+TsqNfEaW+FdcawUDJ5NeWSto8dXJ8Hr8xAlIDl6mTYe0s3EWANiQPKAzqtFOduOwyTiF
	WzfjQP9nHHS58MlNfM
X-Received: by 2002:a05:6512:4020:b0:59b:ae7f:9208 with SMTP id 2adb3069b0e04-59baf17326cmr5657246e87.11.1768938447095;
        Tue, 20 Jan 2026 11:47:27 -0800 (PST)
Received: from bolonheso.. ([45.94.208.114])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-59baf9d442dsm4395035e87.94.2026.01.20.11.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 11:47:26 -0800 (PST)
From: Ricardo Ungerer <ungerer.ricardo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ricardo Ungerer <ungerer.ricardo@gmail.com>
Subject: [PATCH 0/3] Improve yocto-check-layer test_readme method
Date: Tue, 20 Jan 2026 19:47:19 +0000
Message-ID: <20260120194722.142355-1-ungerer.ricardo@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 19:47:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229788

This series of patches improves the test_readme method in the
yocto-check-layer tool by:

1. adding context messages to assertions,
2. changing the python function used to check email addresses from re.match to
   re.search,
3. adding a docstring to the test_readme method

Ricardo Ungerer (3):
  yocto-check-layer: Add messages in test_readme assertions
  yocto-check-layer: Fix README email check
  yocto-check-layer: Add docstring to test_readme method

 scripts/lib/checklayer/cases/common.py | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

--
2.43.0

