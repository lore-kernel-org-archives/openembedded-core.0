Return-Path: <frezidok1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0326CD3427
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 10:24:37 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8504.1778149469008409615
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 03:24:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=j4feiK41;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: frezidok1@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a525aedb24so627962e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 03:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778149467; x=1778754267; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sS29WdxNpmKyWXOvsWaB8EfMezccvSdfmqlx0WHCfJE=;
        b=j4feiK41pSmAUL378Q4uNvib9WloiEUPGH60WL9lGwvJW/9KHLq2EsXci40pzh49Z9
         d7sNmS/t5kTUMos+NC8g3P0hYEEFCp+npMhdCiYZTI/qm5RkVihpkwVpqapngnvALblb
         r0FWyUqH+yfdLFqPmcgN+fIPGJaiDLqwO/KX23jCpccwBXnREcEyRaClNvtR+3/SVyWY
         6WQnFEGVZAwpmWZVXVAAlNGGV9VpYNV0lW9R60ReGOrNolVb0jIBz4wTPRjV1qxze6mW
         FGVuAbItXy7WqKoXYS80LeCoyMffszF9EknMv5irX272mbcQViBc90jgIi9deTTR8Bmw
         ykzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778149467; x=1778754267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sS29WdxNpmKyWXOvsWaB8EfMezccvSdfmqlx0WHCfJE=;
        b=ip07IXcvBNL2OQtKDApqYxCb+CoMW5754ieXJCwvorZshh4kRBu0n4G0XCGgTDXWQf
         P8g+If6+UiLRkCdZ6Z+OR2pMSgaHGCCN6WND2Uydju6wQoNGoD/6FerbFlXw57ahvlTk
         wYArmQbJ0LYrS3Ax5F69WDPwD+3DIwZ/p+bnXvVEBWWnU5bOYwJYQApSat5ZK/YRKLz+
         KjTL4y/dVz8QrF8OOK/piYYmYZ47ix6zW80+DeR0wMCGHG/xv3ciSFLcfub0H8sJk16b
         13ltwHHb02WrMO1JH2P36lKAuaRAckCFijTld1DOKlavAhVod9cw/Qv7Jlc5r8cPo7Wo
         zHLg==
X-Gm-Message-State: AOJu0YzQV2B80w96aNct+dPCf/0qEQvYBHMnVHBCZvvgOAV0tYwPodks
	jhJfHWN5QXdnSyHHywB0vCavLj4IreChD4u0JZfPNwvYJP6qXixwERyRx9UcPtcnpU8=
X-Gm-Gg: AeBDiescZgkOagHjsdc8uKbStWZq764HgFAohgqhXBMlDG6YBOhzjEn/KyZwM7IcoWv
	+5AlVFzE/aJ0ejuaEj55jBHUnEgIgVqkovLNxOwBWSSgOQBVfYpXffdElE1e+v3XNlq+aRX18KA
	LP0WxDZRvtjb6XhF8qylbo/vwpKoXQVm1bP8dCsg/vUM9wC/pQVmBKzG1/9xYV19np9i7imhH4f
	saFk3yPWdcWIOLhIrJc+k6wZnHvkbc+8BN7MCLZ2uvQGBivIiFn/5GCrD/AwnfBoxxDpECb/1zC
	cFTm17awJYxnCBcqYK6OgLZBB0aY/WpwWv7EV6lMFIFOTYysjD0Ni770fW0agjIy+Kaw6m/JhKd
	u1wqCxofM1UaV24WHoTF3/cgEGonTJYR/9r3cziJywPQ1TkYNABm7FzeV2Zild8y07WQOGVNk8l
	FrNMK1RTaYXaX7ReU6UAQoC7Jlrf1WmUCTJNTqSIlH
X-Received: by 2002:a05:6512:4017:b0:5a8:89d6:93de with SMTP id 2adb3069b0e04-5a889d6967amr2702678e87.23.1778149466653;
        Thu, 07 May 2026 03:24:26 -0700 (PDT)
Received: from ubuntu1.. ([213.87.139.100])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a86cd8fce5sm4153712e87.41.2026.05.07.03.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 03:24:25 -0700 (PDT)
From: frezidok1@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Sakhonchik <frezidok1@gmail.com>
Subject: [PATCH] shadow-native: Change upstream status of disable_syslog.patch
Date: Thu,  7 May 2026 13:23:53 +0300
Message-Id: <20260507102353.43585-1-frezidok1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 10:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236572

From: Dmitry Sakhonchik <frezidok1@gmail.com>

Upstream has accepted configure option and merged it into their master branch.

https://github.com/shadow-maint/shadow/pull/1618

After they release v4.20 we can remove the patch and rewrite recipe with the configure option.

Fixes [YOCTO #15785]

Signed-off-by: Dmitry Sakhonchik <frezidok1@gmail.com>
---
 meta/recipes-extended/shadow/files/disable_syslog.patch | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/files/disable_syslog.patch b/meta/recipes-extended/shadow/files/disable_syslog.patch
index 7299a8e61c..7afe0654ae 100644
--- a/meta/recipes-extended/shadow/files/disable_syslog.patch
+++ b/meta/recipes-extended/shadow/files/disable_syslog.patch
@@ -2,8 +2,9 @@ When building images using shadow-native, we shouldn't be spamming the host's
 log with lots of syslog messages which aren't relavent. Disable syslog use
 in the native case.
 
-Upstream-Status: Inappropriate [Would upstream accept a configure option?]
+Upstream-Status: Submitted [Merged to upstream's master, waiting for release]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Signed-off-by: Dmitry Sakhonchik <frezidok1@gmail.com>
 
 Index: shadow-4.17.2/lib/defines.h
 ===================================================================

