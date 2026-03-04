Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FC93EFCE39
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 18:42:10 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25852.1772649720374341491
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 10:42:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RrdEzX8y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48379a42f76so60330075e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 10:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1772649718; x=1773254518; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vvkkVe4fAXnFwBk6Hk3CAQ0rorXNFKrxUI6d8EG+K1Q=;
        b=RrdEzX8ykTaPYWZSdRDIes5iPfZZJ3w3UnAEM/fbpZIi7eXdZlto9vVm3S22SwCtv9
         gLHad5T+chL4cFKjGEuMzZizCcKPDUCDs8IY1eWt8XnFABuR8UsFCvRj8w27EhitLB20
         raV2PkxZQYa8vXMe3WnpNxsFq3xv0+rShR7/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772649718; x=1773254518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vvkkVe4fAXnFwBk6Hk3CAQ0rorXNFKrxUI6d8EG+K1Q=;
        b=ebVV7hFXH/hQP++z54swFuv4BuKoALiCj+S6SAUU38N7Yymtht63gdI3lSskI/n6pc
         ZusKgrcieINljw1yrPWxNkR+vVpwPcYvKgLeCcGfPM6HcwsmZmfJcAapM5TJ6h4SrAaC
         9tw7j7KRuykpKCpIRQ0tw4vbyA9rd2dVWnuSzE5XurRnP07CbqSzK9l1AaH7M+5rK0FG
         dwpHcUDnTJq+epKfDMe136NCQO/R0RpCxvC7H4MN/sPxYkaodeK4DeFhh3xJJ2I4e4FM
         wQs4yU8FQspMz7z3gyIKPlrb5EtUpvZgq647Fc01cJbLdvWOyhP14aqOfI/JrNWEYqfc
         2MJQ==
X-Gm-Message-State: AOJu0YyQz7n2oTqGdTuCsESEsrbITQDnps/wegwiqrrqzxVbvVcFjQRI
	m3pzH5mco7UWhoqGNW4CZj98RXkoWRUutyxn7J0f+pIT67Yv0hoerDz+D38JGnSwyF3fP+VL9Ys
	n15Z1wNI=
X-Gm-Gg: ATEYQzxVjXCVNm2uKPj3+TpRDQ/FESBXltTTvd86EXwIxQBB9Jty6bncBLZXqHqyXxj
	H9O+kiFRFovffaxrn3H9J+6Tl9mv4NL7LIu/fcZvdEBgmCuAlhawfNnhIJ2/z/qB4ZCcSgBejHF
	xJ3YVruBLOF4GvYfbTtT+9qRvgNqrVqbv/1xu3q+W4MOjGBfKLcq0c8kA3iamncmojMMdO7rH+y
	KHM/oV5HmBRRikN+v6YzoWZIy+RwQ4JiRYSuZhhmECWPpn7d5vTvWktqZY4zn6yn8wgS/q/WF/f
	dMAkFGxzUl/CNT2K8lsHlyj7z1VRu7qx65b5zmC/ZK400aMRN5FaLZNNRFt/uH2vPouWF62PmZ1
	FoP5efBxym5ampaauEOJMK1w4bvTjnNEzPyA9LjP6uLjn2rB+hRYDqE9DtcX0WWT0LpBOlIWSAi
	dcAUDgTWS0fihkCOBf4kWAqtBiJf3weZgoThK0r3JRL3YItn5vNRs=
X-Received: by 2002:a05:600c:529b:b0:480:1c2f:b003 with SMTP id 5b1f17b1804b1-4851988407bmr47791785e9.20.1772649718075;
        Wed, 04 Mar 2026 10:41:58 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:d88a:b244:a11f:d7c7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851884a24asm68981305e9.7.2026.03.04.10.41.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 10:41:57 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] oeqa/runtime/ptest: Use a timeout with command, remove disabling
Date: Wed,  4 Mar 2026 18:41:55 +0000
Message-ID: <20260304184156.2025539-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 18:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232434

A simple 'which' call doesn't need the timeout disabling. This was likely
a copy and paste error and can be removed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/ptest.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index 1a0782374d0..2887e136719 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -35,7 +35,7 @@ class PtestRunnerTest(OERuntimeTestCase):
         self.do_ptestrunner()
 
     def do_ptestrunner(self):
-        status, output = self.target.run('which ptest-runner', 0)
+        status, output = self.target.run('which ptest-runner')
         if status != 0:
             self.skipTest("No -ptest packages are installed in the image")
 

