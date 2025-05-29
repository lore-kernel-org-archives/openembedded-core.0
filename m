Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF55DC5AD49
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 16:25:57 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.25367.1748535956695278231
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 09:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N7fCYY4i;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-441ab63a415so12515935e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 09:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748535954; x=1749140754; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/0rwdShac27XUzRXgW+zNDMXkje07GuA+oBpQtIdXMc=;
        b=N7fCYY4iUXfoSALOyxz0HpeENyftjGtnJEPiNXVQDtspPWQyDpC5AexQlrjnLNHbuQ
         V/iu1R9j+aNgX6SxAk9O695VLKmhm2/isCeduYC+MJGRg3rcBh+nvVyy9SMC6m00oxPv
         ftQxQyMM6qj5tshgqO9ZpIWt22Y59kWr6W6bI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748535954; x=1749140754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/0rwdShac27XUzRXgW+zNDMXkje07GuA+oBpQtIdXMc=;
        b=cy8k8PWAqqMcqz4x+jk07opouY5l/tfBl9mg4T91yWwH0SJcrUEY0e2vj2OdxptBP0
         Ocv0NC7ZyJKSoVdLSpz8PuUxWRxHFNHef7pKb6m7S8E61dP3dQlxbYJiuD9OKk2aaDai
         qpsD3MOUvhiOCI3B8MpWgFobIRFtEGliOyLMq4QCqssTdXxUK5BILTyr/dUmjT9T5FE5
         Bgmqb3nrA9qwWhgffh/3cv2T/rBHZj7CAs3EkmsJTvqH1LJARCpVuwTEafhDfLqG8kOL
         xUUG9pN4arhK9Op3V0d8/Xvn5H+YiXTgxyElVpBy4LSNSfM5+Xch9cZQZ5W0TAnLuu6c
         R6MA==
X-Gm-Message-State: AOJu0Yy3ok83v78osQGPeOYcFNt47cPsXvE/xAtc0XzBPW1qZbWmARfM
	X2ZdoTjf/wGNoghp2t6LrWredRzGOaAJX9XV2Hk/CsaHKOpXM2RRC+tKlxWr7f3THpT4oNeAe40
	ti8GFxI0=
X-Gm-Gg: ASbGncus2LbHWB2mpzuybCnfvHv/iklLSQRbgAqZK4mJSnUgU81YyVuVJuBzW9DARp/
	oC9mBHMfDvjljtL0QNGIcWKurOg9Kflh+Qrhwbi+gsseBsbyOITnirPT/fJusOjlDdVrlbIDVQH
	RIAGfJwfvERYN7gaiLqVXA+evYStNePxSTJzYIRFLVD6OETTAsg5yeeYDjoOXv82ndgPAT+kl6n
	I6+QL4Q9ph4Ylj8FWcGFtV1jgprM6m/oSznqZNOhuOivS4Y+sdkil0wGRnWNaQ3ik5cXKpXOsHA
	PSNujdEFUUusUk4N/XWtc2HBZldaw5AZemmayzmPH0h3kvHYwH3QB/W0ziZByvzMgIkHBrYuT+s
	vP7cf6fo3Wyqf
X-Google-Smtp-Source: AGHT+IEZZsd95G8ypKPukErx1IGdfOMDK/TBEchImiAP7awC9uH9ed7bJ8Uc9codF04c5jD1E12KcQ==
X-Received: by 2002:a05:600c:8207:b0:43c:fa24:873e with SMTP id 5b1f17b1804b1-450d652794amr4360435e9.13.1748535954429;
        Thu, 29 May 2025 09:25:54 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1a5e:81:40ad:9da7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f0097539sm2468733f8f.63.2025.05.29.09.25.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 09:25:53 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sstatetests: Switch to new CDN
Date: Thu, 29 May 2025 17:25:52 +0100
Message-ID: <20250529162552.3115463-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 16:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217418

The project is switching the way handle our CDN provision of sstate objects,
update the URL accordingly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 681a57f4db0..487995acc3a 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -972,7 +972,7 @@ class SStateMirrors(SStateCheckObjectPresence):
             self.append_config("""
 MACHINE = "{}"
 BB_HASHSERVE_UPSTREAM = "hashserv.yoctoproject.org:8686"
-SSTATE_MIRRORS ?= "file://.* http://cdn.jsdelivr.net/yocto/sstate/all/PATH;downloadfilename=PATH"
+SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
 """.format(machine))
         else:
             self.append_config("""

