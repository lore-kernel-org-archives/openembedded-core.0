Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0461E7B608
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 12:38:31 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.17187.1696423108630156927
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Oct 2023 05:38:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d/cywloH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-313e742a787so544092f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 05:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696423107; x=1697027907; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+f+43+nY1gMTCGycdrxFR+ux6ozREs0MBPDSmcbpw10=;
        b=d/cywloHoa8zaemCU8+QPt/mIG+0YOr/FU+VgjBrroRbmEF403FkFtFT7ocpmXJa9J
         jYRSEnuc9N1j4mLS3w1meoyNY/5oP7m7wiodmwBw6HWAqlyAjw117uJHbFwG9Yru8zrm
         yx+SNnPi/iDVgCxdrsuif4f63GpL6NZqPYPfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696423107; x=1697027907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+f+43+nY1gMTCGycdrxFR+ux6ozREs0MBPDSmcbpw10=;
        b=A6Pbfo0PFaA0UXLt9gc+2tT+HZe7HZaw+tIipDqOPw3pnjVrBGXRXrSmxwjJfiyIxF
         bgUc5WCEensKQC1Syg7CuRxcqea90VkVnXoU5FwRqwUqCWiqh+L1uDZBs89C7jBVgHR8
         IJWasp1VD8dXHB3+PWVpOO48QCRTAe9WJLD4rEtdhDGiRkeZlMyQGazFPYvr3stFkg3I
         Oz5TfkQVZtFs7Tlw6hTuSDZa2EoANS5ZFN1PkrkzDz2wCkw8sqXLRCBqid8bZMdXKpPz
         l4ZdfRQWzZI69HeWERCYGd2guQESF7tw8D1VfVZr46Kiisxo+NBKlYcpdvUvw2rF1w6L
         cZEw==
X-Gm-Message-State: AOJu0YybMb7dNxc00I5QsVZjuYcNTcTSsUoIfoywh/p1nXFuJuneTK9S
	xmpdTf54yrpmQEua2fkaRuWYyZvb8M22L1KwUmI=
X-Google-Smtp-Source: AGHT+IFgmf2LXxIJYlb2DMB0qX6imngguPPMiRhyG54EP2oWLF5taVyGqLbNMSF4GiSUvxFcewO1TA==
X-Received: by 2002:a5d:4449:0:b0:323:1738:1c35 with SMTP id x9-20020a5d4449000000b0032317381c35mr4789239wrr.26.1696423106904;
        Wed, 04 Oct 2023 05:38:26 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:cc7c:410f:894f:7a55])
        by smtp.gmail.com with ESMTPSA id da4-20020a056000196400b003279518f51dsm3974617wrb.2.2023.10.04.05.38.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 05:38:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] qemurunner: Use backslashreplace with utf8 to make invalid characters clear
Date: Wed,  4 Oct 2023 13:38:21 +0100
Message-Id: <20231004123823.2990916-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231004123823.2990916-1-richard.purdie@linuxfoundation.org>
References: <20231004123823.2990916-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 12:38:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188677

Switch to the backslashreplace error handling when decoding strings so that
invalid characters are clear in the stream to improve debugging.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index b8f51112861..b738a261d87 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -109,7 +109,7 @@ class QemuRunner:
 
     def decode_qemulog(self, todecode):
         # Sanitize the data received from qemu as it may contain control characters
-        msg = todecode.decode("utf-8", errors='ignore')
+        msg = todecode.decode("utf-8", errors='backslashreplace')
         msg = re_control_char.sub('', msg)
         return msg
 
@@ -473,7 +473,7 @@ class QemuRunner:
                         self.logger.error('Invalid file type: %s\n%s' % (file))
                         read = b''
 
-                    self.logger.debug2('Partial boot log:\n%s' % (read.decode('utf-8', errors='ignore')))
+                    self.logger.debug2('Partial boot log:\n%s' % (read.decode('utf-8', errors='backslashreplace')))
                     data = data + read
                     if data:
                         bootlog += data
-- 
2.39.2


