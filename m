Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D06C282CD
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 13:15:45 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.52540.1741007742654951386
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Mar 2025 05:15:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QzkhGKZv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4398e839cd4so33335775e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 05:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1741007741; x=1741612541; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9uNhtre3CSwDNR577S/3FAlqr2QqY3opSpzhCkQiX0s=;
        b=QzkhGKZvV5dWk/XKNGd92mPx+BRgD9Yq7hKN61tlyYoq/f42fl3+IcIRdPnAKz0yel
         8S1euffqJPLRjC+aVc9H8N6vdzOr7yol/6xdmWZzHqlGd/GS2TlHsQJ5hxLY2kC+nL+5
         8bbPWBGNXApmXLFY+STJn4rGo0Z1fMfhhVBXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741007741; x=1741612541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9uNhtre3CSwDNR577S/3FAlqr2QqY3opSpzhCkQiX0s=;
        b=bc+nocospGGoStIcJYMb0C4aJoijDFx6vVNPmQSEo6luFt+XslrMZE07UOzzLEOpuD
         jwA3l8/Ygsmdeaxu6mAVP3ctNNknShccm6jnpkWOuTExjZhVTCpLORSEJ/EgKl3y0xPe
         41s7KUaKa/AWih2dOT5qUnx+abh5ARR83QrKg6D++M4sCrjf86eQe/QHgSPoNL9ooheT
         mKXQ6cTdtHgtNwrmerDosw3BAMF9GXABdNcSTsN4p5LJ24hupg0X1fA710g9qyDslbrr
         UySFAA+Ew3I9/M2Sr3COcaHFZVd/dJCKSUrxsFcHEaS1sVubn1fVYrl1yYqLqhp6rrkh
         PUUw==
X-Gm-Message-State: AOJu0YxuS0+7CIRUvxkLQcA/fOCaTtB2pB9WPbgb7vNHtNP6Shdnp9mj
	QWWoZo4m96kSLb+MkFzpe69aTWclk7dxuIY01YFZUw7H8+kxWP1rN76Cj0FOm0GFpEYSWSQ2HQS
	9
X-Gm-Gg: ASbGncv742+oKUrlTfP1x2YOlEKz7IP54Nrijfm6Rxv+xtDjK2zTvZoj6keqNwmnyQH
	GhiAvt7MX7kKdicrijbc5iSN0TBs8J85KpIDonwTyRaxEUdT6eAmO5cTC3kr9HFnz6myXUrdbjz
	qJ4LblxvYOGZt/DUAcNJB9OXbDusQF/w3Ovp3kaLo9KA0UzFxc7xJdvjFHFqj1WmpnILCKFDhMZ
	flKmvVOqG8T4qYLhUsV9hOUUTRo4ueFSj57kLeDvapAcV2xspZqGmydqwm/pEifJhVKTyunQWLQ
	Eg+JJhUSkDTepUDC3GuZE5ybzVE25aCO77kSVKzcKnbDmm+7Lb+YN8XJ5lkPPnXqjcYpGoel
X-Google-Smtp-Source: AGHT+IFWC2GAoI7/MmOrHFsoMc9kLVnlrCgSM6uHAvIfmLKe7tuW4ZrOC4XEoqTrgbZFXRUuxX5SKw==
X-Received: by 2002:a05:6000:4594:b0:390:e535:8740 with SMTP id ffacd0b85a97d-390e535884fmr10319011f8f.14.1741007740688;
        Mon, 03 Mar 2025 05:15:40 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c70:3037:60d2:90d7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47a66bcsm14321212f8f.21.2025.03.03.05.15.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:15:39 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemurunner: Fix a bug with fork/exit handling
Date: Mon,  3 Mar 2025 13:15:39 +0000
Message-ID: <20250303131539.1657671-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 13:15:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212207

If you send this forked process a SIGTERM, it will execute all of the
parent's exit code leading to two sets of console/exit output which is
extremely confusing. Wrap the code in a try/finally to ensure we always
call os._exit() to avoid this.

I spent far too long trying to work out the crazy console output from this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 04e03349140..c4db0cf038b 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -267,12 +267,15 @@ class QemuRunner:
             self.monitorpipe = os.fdopen(w, "w")
         else:
             # child process
-            os.setpgrp()
-            os.close(w)
-            r = os.fdopen(r)
-            x = r.read()
-            os.killpg(os.getpgid(self.runqemu.pid), signal.SIGTERM)
-            os._exit(0)
+            try:
+                os.setpgrp()
+                os.close(w)
+                r = os.fdopen(r)
+                x = r.read()
+                os.killpg(os.getpgid(self.runqemu.pid), signal.SIGTERM)
+            finally:
+                # We must exit under all circumstances
+                os._exit(0)
 
         self.logger.debug("runqemu started, pid is %s" % self.runqemu.pid)
         self.logger.debug("waiting at most %d seconds for qemu pid (%s)" %

