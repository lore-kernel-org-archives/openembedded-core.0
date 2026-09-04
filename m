Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 969EBC624DE
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 20:53:23 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7921.1788555194873439241
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 13:53:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ebu5UD4J;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so13178955e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 13:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788555193; x=1789159993; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sPbd/dRHOMrimSkRuFwvChN2sqs50+HRRQVybCpF7H8=;
        b=ebu5UD4J99B1fL9GtzVA+hNYB8IF4AaAokFY+UXPsOtxeQI8qK2NKoTgmqAx0v/Iy9
         2eEHLNa/f22jEcv3vnDB4uBckHdhZy8wHj45WPKS9i/6sqnnr8jk5M1OqR5AeUgt7rio
         r/UeW4RxQQE3CV2lfjo2ktRXhhGHa9dQU7KEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788555193; x=1789159993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sPbd/dRHOMrimSkRuFwvChN2sqs50+HRRQVybCpF7H8=;
        b=Q1/wYITb626t+e+1cWOCjJy98JfurHhFUXlmTM/w5U0YFQSORKjcNTiKPuwHdyzl+I
         Gd6zxbIVLkL91EGIXBgQh2/kpGVoG9dh32RsyEeKktiPiPb6U43M3WMP3a6xeFYEY9J5
         Vy9q2JT35OjuVSu2PCPOkpHuApGNE94t6GQfUnKF5ygsp/2wdeNXqK6LCVwrgrn5ReUb
         /ws0MA7muvyHekz5q1VjZ0DPy10O+EqHeFhzvYm+lGWWue+H2yOfkRTRtycI27rpkesD
         YoKFUXxh6xwYGUP3v8+IqkLEFB7LnI1WpTyQ0hiDCfKo13mj9iquobHwYxdOLzqt6s+4
         XX8A==
X-Gm-Message-State: AFuF++nM2a9R8VtxJmNHM+khfAuh/gYftmyjAU23ufPCxxNLR3UCk8Co
	wRXg3KU2VEAblm+mZwihR9cbmdBg5xCftxHv8iLReU/EBdyyBHWwsR1d+2DeH2WncifiIY7ax+w
	WactrHuU=
X-Gm-Gg: AYBFou0jd+lJxfu10oJev9amnkh2iBT8DdmJiBXQposvXiGJm1GxaRRzckyT03QQPyE
	xH6PVfvoxcIeyvNh8LCeCncbQE2HM38T3Q2Ni+3lKGuYlaDcLzq+wO9hKyjhF9rrKOLp2e4TFkM
	RNF8zVsqchs7Xj/5U+kX15BIvcxrV9hoI98rCDQZwABze8APUBOFidBt/UrozbtOCi8NxeD/AEx
	xAJKkalklZaVAcZIDGeUx7iFyBXSpX4XA/O9av70f2upWomIDxAyfUYnbAr1OpWSieOvx71itph
	DEytkWZ0z6tXEPArrGBvSqXDzJZRxu7PmagdwmRufLt5lZXbtvSbq85EwggJQOk6HEIzHocSjjD
	7oiuz+dUQenc3M9yorD1cGnmEYlvXDo3GDMwH49/lsQLho55/qQJHZVgcuXTxCfARnzRZ8uhQqS
	gYyEbjnszuQslvbOoD1j0nE7sPL+3CRp/7k/FiBQDiGwh1GI3+yg5VfttHoUhsVYDRxuTu66tfn
	ArTyXGp4fu7TLZeVy6TnKm4DSNV
X-Received: by 2002:a05:6000:2999:10b0:482:ea08:8c97 with SMTP id ffacd0b85a97d-48587046b35mr13972303f8f.2.1788555192830;
        Fri, 04 Sep 2026 13:53:12 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:23f6:3417:15e4:9ee4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858bcefd59sm5807127f8f.19.2026.09.04.13.53.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 13:53:12 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lib/oe/lsb: Add missing os import
Date: Fri,  4 Sep 2026 21:53:10 +0100
Message-ID: <20260904205310.2258067-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 20:53:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245129

  File "/srv/pokybuild/yocto-worker/buildperf-alma8/build/layers/openembedded-core/meta/lib/oe/lsb.py", line 11, in get_os_release
    if os.path.exists('/etc/os-release'):
       ^^
NameError: name 'os' is not defined. Did you forget to import 'os'?

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/lsb.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oe/lsb.py b/meta/lib/oe/lsb.py
index 1dfc19be333..1283cefaafd 100644
--- a/meta/lib/oe/lsb.py
+++ b/meta/lib/oe/lsb.py
@@ -4,6 +4,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
+import os
+
 def get_os_release():
     """Get all key-value pairs from /etc/os-release as a dict"""
 

