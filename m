Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3EEFFF8843
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:13 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31998.1777064232169065471
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:57:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rBZqywnS;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48909558b3aso78132635e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064230; x=1777669030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7kM49vNBlLs852kqobhvU8eNhW6T9rt3XCAloieSabc=;
        b=rBZqywnSVxIBs9nCMjhxnr4mc5Adp3/7YCpSqENO55Vjxd5XDnF60+hOJwqetSS0sB
         Um0JJUI6+WRSDkAdf0pDnRB4CCDaUg9ZPfC0vCoJLzEqJO4ywJS+vCjWc0DAzPh178jS
         meS0LOZ1Z3fekAOuvXzhwJu7eDtq3hHUpSs34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064230; x=1777669030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7kM49vNBlLs852kqobhvU8eNhW6T9rt3XCAloieSabc=;
        b=l8ykI4ERmdpm5lybZlAnlB+v6FiE8UaQq3Fynjt2yNrYzOI1iTUOOKKn1JxI08sN0G
         toQY/hViZQZRX+3dTCZ/tGnCOfCo0vA8EiukKHPhLbfVM5SSy8McBvOFUPIjOplxIzFG
         jh9UagjqGZi/ljaD7exM7jrYidXyreXCQq/A9fUdiWvjXgDICWB/SiDxkx6zFPsWmsUm
         pwEyog0qPmYmFmQcV/RaFE7poIcLgZH24HND3Omt/owSksp814HhHCPQp2AooEHtm7sy
         JmY/zZeYa5+DfV9bScIvbN4KSP1G5pRRCG9Def/+V+KDfU+pfD0GGln8hIpc+zrVJwnh
         OLRw==
X-Gm-Message-State: AOJu0YyFn9FBLObTVg2D0rm8isxIgKT5/qYd6TI+PfrI7v9/mp0PL3Wz
	W5g1L9QyoHSfysMnJRCS6UnsMCN8zcFODnx7DdylMcEc3H2EAraP7+xK2Nkjgyn7wbgwyanErXe
	5KB7l2OnMOQ==
X-Gm-Gg: AeBDievibOlwmTfljEn4e1+ZW+C3AplEBs7qgY+KN8W06y9uCahhuUbdKi93u3NPe6Y
	nV2Eb7fQXWObUX/jWKk/ApQIR/XIDWs2CYvgMBH1jK8aQyJ4ZuCwzpoGNQ5IgaUAlPwTrLeJhLT
	N0EVA4oLErOu5EgTmWXIoQoQbPbRPzTWKbxdPM51zheCbnAsZfzEHn2dAF9Z/WSJDXgI+9Qad99
	czIghY85x5hnqtA0M0XcxfFD49euUd9QXEH/a8TVg+K1YbyqZpyoJJe8gZ6dpGif/A8C7H9rAST
	3ZIi0FO9Vd/zZyPFFjmnL7oUOWVV536Q43SbzNMp7mvaYFN2culQuENz2tQW9Obyp1fT0oUzkJv
	MQU8M3os2vUmw7th2uzls3fWbdYoVQc3r/Nd2GMREHrI+gBjM24Ecs/RucbpJMAaArtj/mVwtXP
	JRtx0tUPoew0YIIf/Ci2KUcNJKWWTlRH/bX4YCzxt9x0s0fKwo/rO4YtvGXuFF80fhkom2nJb1V
	RtO9VAcOa2ilUVyvkURLuf0XHxDXydPMRClUA==
X-Received: by 2002:a05:600d:8408:b0:488:be58:bb5b with SMTP id 5b1f17b1804b1-488fb773f0cmr359654005e9.24.1777064230315;
        Fri, 24 Apr 2026 13:57:10 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.57.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:57:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 58/66] lib/oeqa/utils/httpserver: use multiprocessing from bb
Date: Fri, 24 Apr 2026 22:55:57 +0200
Message-ID: <2273e9ba2ffeea57620af576e3cd1e523e4d3fc3.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235931

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Fixes build with python-3.14 (and hence on Fedora 43)

It was added to bitbake in 62be9113d98fccb347c6aa0a10d5c4ee2857f8b6
and oe-core now requires latest bitbake already, so we can use this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3ed1cef082b8ef0fa05684f7a41f0842150811bd)
[YC: bitbake commit was backported as 15d7448e04aa ("Use a "fork" multiprocessing context")
in the 2.8(scarthgap) branch]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
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

