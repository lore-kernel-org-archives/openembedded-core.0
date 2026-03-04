Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED62EFCE33
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 18:42:10 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25754.1772649721083474455
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 10:42:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dKxWEzoX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4836d4c26d3so55498995e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 10:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1772649719; x=1773254519; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MsJMPzcG9Al5mGLWAmpM+lF5JtU4oL57jLmTV753WFA=;
        b=dKxWEzoXPvfqmOPxjk9afb8v/IAQwVje4Q9YRUbzdpgra+MWGxgEOT5tzTiT99G4Ik
         6TC7mFkY/aEin95+vrYVgFFxuNPLQcIswTjjv2aEPshTMTp5U8KZZzeEDM8lE51jStEx
         Rl1Jtoupu3htQAhTpUzEGDb93+pF9NkLmFHL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772649719; x=1773254519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MsJMPzcG9Al5mGLWAmpM+lF5JtU4oL57jLmTV753WFA=;
        b=Zvs+NDxxo4HmyZSnNfkZ1frvg5nViBVP5FwFd0XtwSEDHz3hK5/lbYqjUUcZgFqA3/
         r1+pTA5U69vbpl/fwg5X15mGP6BFxr9crWd4m9BJKcEaTuT8s+JHOnEyaMLhGTEot9P9
         qvL1ob0aKZkFzpvgomMQCHCDwsRR0lzlI6iv53ACrPbaNf28/bB0w8LGebLrnfCwNm03
         +EzkpfwgOuvomQdmzjzYBQ7WrgL//umo5BjDrgaetV44+vjC1A90RQgLO2DKkYdWou4D
         Kp6Y8nNxqYoVoQNazGwEHbExv77XCdWGAhzwbW0Ig5SIT/UcIap5EAthU54Q1f5YeRgh
         6NmA==
X-Gm-Message-State: AOJu0YxeEVFbARr2DeXtVH4AP2UgO7WP2P64CO9mWZbS8Lz6qzpUEMl8
	gcEFaBq3cLRkRuc6RAYYjIG8Z0L2NvNqRerYe5H+6XgZVCfo2MTiU37L6FCGmiFlY1+HAwATLEi
	0dSoAwdM=
X-Gm-Gg: ATEYQzwEUEQ2epUbaSk5Nt3V+lIr10sIGCWiFUIoWj9fnjlWKmP341VwYuEtWB5Gq7c
	i+Wtz38TWJeUfOTN2Jskp5XuypgxApuu1+diTKM+qI3D+34Yy5ocwMJXvLv6VPkqRPzCz2Fa+3N
	E8hLpyfkQ5bi5yjdKd0oHeujpUR7byZN883kZiHDZu8qwy725R6CxPnoe8HpXD0q4GT6xkGGuNx
	5HREynjtfXTlZNvGLw+ZhwAlvk2J85dfkkfPeohzLxT/eIYtIFQ4nZ7aRgEYFq14slhhTsJTlS0
	yo2KFt+1rms8kabXUFqF6/8uQaN2nf6B77tdIN+WVTb/iJHZfx9vWD115JWJRjokA051tjl+A6m
	jDaY4dmJtndW5YnxTiQhPoqiql2g401rHuoxpEmopQeiL2fa4oFNOetKtNg+o2Du8ORxAy8dbQE
	44xo4kxHzghVNCMmwo6f7KJJ6Uk3j20EFF8TXe1tFULecLnEHQKwQ=
X-Received: by 2002:a05:600c:458e:b0:483:6ff1:18b with SMTP id 5b1f17b1804b1-485197e3a02mr59059535e9.0.1772649718854;
        Wed, 04 Mar 2026 10:41:58 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:d88a:b244:a11f:d7c7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851884a24asm68981305e9.7.2026.03.04.10.41.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 10:41:58 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] oeqa/runtime/ptest: Improve timeout values
Date: Wed,  4 Mar 2026 18:41:56 +0000
Message-ID: <20260304184156.2025539-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260304184156.2025539-1-richard.purdie@linuxfoundation.org>
References: <20260304184156.2025539-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 18:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232435

The ptest runner command has timeouts disabled which has the side effect of limiting
the command logging. This can lead to incomplete logs and makes issues harder to debug
since the log buffer is lost if things crash or are interrupted.

Pass in a timeout value of the ptest timeout + 30 so that debugging is improved.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/ptest.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index 2887e136719..57cb050a1d3 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -60,7 +60,7 @@ class PtestRunnerTest(OERuntimeTestCase):
         if not libdir in ptest_dirs:
             ptest_dirs.append(libdir)
         ptest_timeout = self.td.get('PTEST_RUNNER_TIMEOUT', '450')
-        status, output = self.target.run('ptest-runner -t {} -d \"{}\"'.format(ptest_timeout, ' '.join(ptest_dirs)), 0)
+        status, output = self.target.run('ptest-runner -t {} -d \"{}\"'.format(ptest_timeout, ' '.join(ptest_dirs)), timeout=int(ptest_timeout)+30)
         os.makedirs(ptest_log_dir)
         with open(ptest_runner_log, 'w') as f:
             f.write(output)

