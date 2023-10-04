Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04027E7B60F
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 12:38:32 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.17096.1696423110462652434
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Oct 2023 05:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W9FkgvXf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4064876e8b8so21226405e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 05:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696423108; x=1697027908; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7t5exn/WuZn/S4drizgi7E4x/cayNQa71wj5kIpiRxg=;
        b=W9FkgvXfRvAvROJR8z1RL845NgBFJbf+3T6tExL4myBko+2LuVkQDVzhODEvXePA5s
         2H6YkI8vXMVD+tBPD6tsFCMsLFD0Z7PbZ5o7dabtez0/Q4pXCeTwvPBGBadFSLcXqjxd
         ktl9C/qRrQMb8ju/vjMn9UGBNwZetUWR9ZCX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696423108; x=1697027908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7t5exn/WuZn/S4drizgi7E4x/cayNQa71wj5kIpiRxg=;
        b=pQpA1pO/NgbhFbvmE0vnui0i6c1chMBktnxEO1EE7W+Mf0oyqTraBz1z4zKym/XjnK
         oq6/CXTG9jPbWycnzWnaWwa43VJ9XdJjiHrO+m/lIaO+5Iv6FyETizu90s9co3s+ULDo
         JJ3KQJVZ6GGRDkw07w9vSlLLTIx/cI5ThurSb0vHfAfsrOKJmEerX8K82e58gUcqkmkR
         KVxXQgDSirIpoSh/ViOesS/H3jGwCLuRCEWE2z0tDaFctd59VHZaSpvS0aHeyxjl1M5j
         fGeATLSrlutyp+JMSk1cnjPKYSwuMdjBbZc2YEXgVpPNobvPVe5sNvgPBMqf4uEvva42
         iuWg==
X-Gm-Message-State: AOJu0YwZ6Bcc+uBnIzWU+KZsnAdGLCRxIE4M6l9BTp1CTo/cMJ2REcOG
	37o2QxG+ywm03oQDXuZm2K2YvTZbjo/ylbehzAI=
X-Google-Smtp-Source: AGHT+IElO9GJJ8VBePAdOT0MYpbuyyAXJHZ+GmaX8EKhmzK79zUwPh9q91A6PFaMQzebaXEGrTwylg==
X-Received: by 2002:adf:f704:0:b0:314:1ce9:3c86 with SMTP id r4-20020adff704000000b003141ce93c86mr1882755wrp.0.1696423108672;
        Wed, 04 Oct 2023 05:38:28 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:cc7c:410f:894f:7a55])
        by smtp.gmail.com with ESMTPSA id da4-20020a056000196400b003279518f51dsm3974617wrb.2.2023.10.04.05.38.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 05:38:28 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] qemurunner: Show both the login console log and all logging upon failure
Date: Wed,  4 Oct 2023 13:38:23 +0100
Message-Id: <20231004123823.2990916-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231004123823.2990916-1-richard.purdie@linuxfoundation.org>
References: <20231004123823.2990916-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 12:38:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188679

It is unclear when things fail which output was on which serial port. Improve the output
to show the last lines of both data to improve debugging.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index ea867a2934f..9aa2e7b3bea 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -503,9 +503,8 @@ class QemuRunner:
                                   (self.boottime, time.strftime("%D %H:%M:%S")))
             tail = lambda l: "\n".join(l.splitlines()[-25:])
             bootlog = self.decode_qemulog(bootlog)
-            # in case bootlog is empty, use tail qemu log store at self.msg
-            lines = tail(bootlog if bootlog else self.msg)
-            self.logger.warning("Last 25 lines of text (%d):\n%s" % (len(bootlog), lines))
+            self.logger.warning("Last 25 lines of login console (%d):\n%s" % (len(bootlog), tail(bootlog)))
+            self.logger.warning("Last 25 lines of all logging (%d):\n%s" % (len(self.msg), tail(self.msg)))
             self.logger.warning("Check full boot log: %s" % self.logfile)
             self.stop()
             return False
-- 
2.39.2


