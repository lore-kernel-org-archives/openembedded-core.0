Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F912C6FA89
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 14:18:50 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web08.5251.1663078727883313293
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 07:18:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=j8l4wp9P;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id k21so1432839pls.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 07:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=b38oTqDnfNeWC2NCq9IpCfOLfRp/wNlBG4j6sSFOUa4=;
        b=j8l4wp9P6egO4O+0Dz5qezW6KRYaiklElZ7Mkd0Yx73ge0bPOXwnMV7hYiWL3kwryw
         D53NtisLMiroL1uoibAbsndytAbfCgKTeC2EKnuQMdQoPD7TyyGzN7DgT0OWgV4BAQfs
         w23sdluZqqMT2PCiJSDmYjHmU/MFXeYnyupWS88/BpMPJch4gDUs5tnY1qqobu1sBJQI
         p2bzAPx/MHKrDsuXkSumHZ7laAr4slsz4srW6QIku5jNcY6kauGdh2KEfMMe06AUU74a
         rPN+3PXtYdJf6Wn2Lp8MckuNc9vZ99/8KVCW3f8vYjRXuVJNiLrLZ9JGHC+A2E7/nNWc
         y/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=b38oTqDnfNeWC2NCq9IpCfOLfRp/wNlBG4j6sSFOUa4=;
        b=SKB63Aq8jO+VGFEd2GYfZgRRshE/ffv/y8K/bIy0k6eYpNXppnp+KCiRxoh5ZwekPv
         49CZ31hZlaJpJ0vG2wJP/ilKcaktIcHjH+KNiT2bb+ZzM2p2RDY3NUa5swnJQFOZHIu/
         OVt7et24pozIgAG4k7wU0FIC44Y5PairIqKBpUutRi+8QNuq7RZcxajZ51JqrGejFWdg
         seIfR9i9l9eVRFw4xp6tcjY70Ml4NaThIgIugRV0LVdpjB3A9RuCnnsX4Uzd4VQa50Nm
         IHXlHi31F3r2FMuHBWxyNIH8SCDvnPfjpUNb17mj98TSoNIFpF4CXPL1eo+bNvL7acvW
         Z+8A==
X-Gm-Message-State: ACgBeo0zWFyjb2bKAlQnMmcjjY7CZrfw9KkJiPwzhY0OlpYsGh0tCSzs
	Wnz/4fT9j1dlaRXytKgL8ipgmMlVHYQRfCzT
X-Google-Smtp-Source: 
 AA6agR4GAK0zf3zGXXF1aYaZ8M07R5GdNwczAIr+Z1PZLmyZ0tnDEVqC3yLIqTflicCweZlfGNATQQ==
X-Received: by 2002:a17:90b:164c:b0:202:a4ee:8f97 with SMTP id
 il12-20020a17090b164c00b00202a4ee8f97mr4223783pjb.79.1663078726964;
        Tue, 13 Sep 2022 07:18:46 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g11-20020aa796ab000000b0053bf1f90188sm8086424pfk.176.2022.09.13.07.18.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 07:18:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/16] oeqa: qemurunner: Report UNIX Epoch
 timestamp on login
Date: Tue, 13 Sep 2022 04:17:56 -1000
Message-Id: 
 <2a860de611bebae2e1100380b975b7648b8560d9.1663078051.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663078051.git.steve@sakoman.com>
References: <cover.1663078051.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 14:18:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170594

From: Joshua Watt <JPEWhacker@gmail.com>

Updates the log message printed when login banner is seen in QEMU to
report the UNIX Epoch time in addition to the human readable time. This
makes it much easier and accurate to correlate logs with the guest, in
particular with the guest journalctl which prints log timestamps in
human readable format and the oeqa SSH debug logging which prints the
UNIX Epoch.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 275b6f3c8d0eeafa3902c48a49655491a89c47bc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 4c3d2010fb..c19164e6e7 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -471,9 +471,9 @@ class QemuRunner:
                             self.server_socket = qemusock
                             stopread = True
                             reachedlogin = True
-                            self.logger.debug("Reached login banner in %s seconds (%s)" %
+                            self.logger.debug("Reached login banner in %s seconds (%s, %s)" %
                                               (time.time() - (endtime - self.boottime),
-                                              time.strftime("%D %H:%M:%S")))
+                                              time.strftime("%D %H:%M:%S"), time.time()))
                     else:
                         # no need to check if reachedlogin unless we support multiple connections
                         self.logger.debug("QEMU socket disconnected before login banner reached. (%s)" %
-- 
2.25.1


