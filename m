Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19AA9CF3941
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 15:44:09 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10100.1763567041541306509
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 07:44:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PMiEMXp9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477a1c28778so44388375e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 07:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1763567039; x=1764171839; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ypm6Kgb7DAdEhwZ+3RWRxUufk8Hs5/BGB32plRQRaMM=;
        b=PMiEMXp9DGRTpbQl1WPDxHXQgtEs257+sOhkMZJm+RDVKpRALOKw+Ff5gE9x0I4QdG
         AENILDlxIGQn/nqendlGQcbK92J9oEFNZQ8TUEOZcudml6rL1vVWGpM6AjO05COxmbJF
         PMOVsqQJVutYWKBs+5YgnOeJhP3oG+lIL1hds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567039; x=1764171839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ypm6Kgb7DAdEhwZ+3RWRxUufk8Hs5/BGB32plRQRaMM=;
        b=WoN8XJ8ASm2l8rme6eQmEAfDp3KyTUttYd+wjU0s4Mhj6lwh4Yh/UtOh+IE0cI8FXy
         vHsG1MKjz0O4jBpTIqdJYXoECeGN9JtS8gKwQnMwD53WjqR1lAtVHgsT6jcrUGfI9U6d
         jiyNC/r9P5P4c1FY85UZ3GpacuW7rtzK70AAAhH/R8myhHj9U2oA2n5lkR2venrEBDrB
         KgM5j8YGr5Aqki+IEhy5i/L1mShXVP6nbr0ZbwJo1fc/HbxYhO5zMkRxX4TjVcaZE+Io
         A/LpLTVczpwnMXGip+H4VcV2fjA98oQxkwjuQNERQg/S8waSOj2ZmuG4/Bu2+SsY0fZA
         OjPw==
X-Gm-Message-State: AOJu0Yx5o4rEnoVoCr+qGrumTND8K5LUWC0tufRTBursiROIwyowEl2x
	Kh+5AnJ/WESyEp6eqzSsbHaq9js/wl8KFirivNc59yHoQ40WsDz08gfhSTMmPvKFmElwuZkXjlI
	1joW6
X-Gm-Gg: ASbGncuGtJYvhdN40IcqNs4+9bzSo3cgyziiWm0F4PxQLa0fJpgHIlNV1m3jSIzdIgF
	PHTpmykzNc0auEW9xCsHN/iO8O1QjJz1MPEaMa7QZUgR71cTDKSCoBX2eHaBNIFv//eot1J9YAA
	4NWbvCjDL6M14noTVJPKDsttiFoAAvtDsaJlabf5Mr/RtGKa/Ers87iNIPBIUJcZe/kyYtHAXVd
	3eCSP3pRYLV8uG4+cAfLxhHWEB7RY356HYOWsUubQbQptcd0ILI9F39HZQhKdoA32BJ7NWRTjge
	wFsuVSMC/2m/cplTCIvIxZc+KVKHHVBbZDahSM87MI699Nxn8vZpxScTMzejVtQKfi64ObWtCx4
	+kdqAFwiP4gpllxyk5aI722P/lpOO9ovvM0V9+q7NisolYeGobTJ0rhW7gfH1q5iQM5dcmpilN/
	OQBfOfuSG3wNcXW4q2C3ve3lP9MoLRKmPex+RVM60I+7IgtOLLPA==
X-Google-Smtp-Source: AGHT+IFXfTm+j2bqSobMr8+e55XWYmIEoootjzpY1HLWE2vABgFjPO+hLuYcRzh+9ZP5Rpo42AK61g==
X-Received: by 2002:a05:600c:4585:b0:475:e067:f23d with SMTP id 5b1f17b1804b1-4778fe96783mr192531185e9.25.1763567039205;
        Wed, 19 Nov 2025 07:43:59 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8b60:264a:98da:e4b2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b102bc9csm56231855e9.8.2025.11.19.07.43.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:43:58 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lib/oeqa/utils/httpserver: use multiprocessing from bb
Date: Wed, 19 Nov 2025 15:43:57 +0000
Message-ID: <20251119154357.337496-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 15:44:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226558

Fixes build with python-3.14 (and hence on Fedora 43)

It was added to bitbake in 62be9113d98fccb347c6aa0a10d5c4ee2857f8b6
and oe-core now requires latest bitbake already, so we can use this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/httpserver.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/httpserver.py b/meta/lib/oeqa/utils/httpserver.py
index 80752c13770..9e61cd89d5a 100644
--- a/meta/lib/oeqa/utils/httpserver.py
+++ b/meta/lib/oeqa/utils/httpserver.py
@@ -6,7 +6,7 @@
 
 import http.server
 import logging
-import multiprocessing
+from bb import multiprocessing
 import os
 import signal
 from socketserver import ThreadingMixIn

