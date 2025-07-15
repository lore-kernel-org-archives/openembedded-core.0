Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 741C8C83F36
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 20:36:50 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.5374.1752611808659414160
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 13:36:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SQg0OCCs;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-237e6963f63so35408475ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 13:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752611808; x=1753216608; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1VYIaLCHL0FzAP6FE+xqdTupWxxjy0sIAPopVMZmY6w=;
        b=SQg0OCCsA05BI8dF0jrVXr2TLMiTwAfO/aRfQ2zCNxGojRqR0+1mXFWGaLHfXX4lnm
         VupMsUenU9hMXu6POHoa94Eb0G2vtDr91Ac7eIVAf/3oe6eMrk0RHkwSLkhtJZlFi9sX
         hxDaIzS8FHH50fjoNgtatDh0Wauj6H4QC/OxhJJYFAZ+qxxlPq+LxJFloP7k/l0OSaJr
         Z0EfC29HRZS0tag2fehZafLcHBSFnEoukvycRKZivZQv8n6tSg/EMuLWZVl1mz6JMYNq
         R9ihKEwg8CMHQbmy2zSX2gOL3+wXaoY+aXt7k07f9d1kWS+AgbFckXSXcrnBBEqYyq44
         xh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752611808; x=1753216608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1VYIaLCHL0FzAP6FE+xqdTupWxxjy0sIAPopVMZmY6w=;
        b=Y9jIQ3FP9Cc1u4iynIOUAe3+sbS72l/skExtqCpXghIs3AuNX6KYmofoBkTUMkKR2Y
         pwPL1Q6hiUw/IMdFPM2dLsmwCrpaZs4I+NL/4gy00Yk4quIlza6spfg9t/YZse3oDogc
         KXfHp9yZ7oHXQsEvr8/MXSh0mafKrS6/2/IXfvZxeX8bHmjPP9iWwIfawEZrez6rDZE4
         JL0NIHlS3GF2BXMgx5oNzlAZrF8e2X2F7j9IB4DNJxigna1W66MVMRnKGGAsiIzfcgOx
         125aRPfm4OX/ChNNxSGIsPX6Y3XUwNb6J+Z/DyJd5SQ5Px3gHt6jsSMxYk3YNWazm+K/
         O1pA==
X-Gm-Message-State: AOJu0Yw2GDK1ByNoJVcp/DuIVvj8Mp3iDyOhAS+CxumaVlTOqGCmIxHI
	2HyxEHwMsiR6Q20MrO+CqQwmRM7ZFbq06cwguB9GSNLRmFsh76q+/cE3FZBcJgIWs9XXtWyjDms
	/J0sy
X-Gm-Gg: ASbGnctPB1vOHrbTa3KzEwiPm3Tf+CWs59b78LDksb9LMEk+Yx8R3lr5zKZ4koQUQeR
	a3bnVM9IhwiLOAykjMQzxfoh4G/OY4mlRCPW0kTT2zHEZ67J9AgZAoS++evF6PKiQAj0CbcmSvk
	IZKdHR/hINsiPXmdNCT3rDcWG1hUR3+G2bfHBHMD+3dMXu6pBvcYK58IHRXUtefltljLmX7ovTq
	UBkEZfYiBnBOvgA5XJ5YvXzeYKICctCWYeras6TG//sMBrVZO9APH634cx5YDxesRcT+zb2/RcG
	89t5rfibd8MdNWDsiaddBz/Noh7j+nrK96VspygsYV5XXUAmD0xeHNdB/Qx2R6AYaHclAkuE2Jj
	1hhigJ769gXpkmA==
X-Google-Smtp-Source: AGHT+IEs7bIwpn1prdFf2IT92Ic1vi4G0dzZqjgRV/4TqoUh2nS4uONoNMjwAO0r4yOiaOLDnGyAYQ==
X-Received: by 2002:a17:903:2344:b0:235:eb71:a386 with SMTP id d9443c01a7336-23e25787f4bmr1537085ad.50.1752611807784;
        Tue, 15 Jul 2025 13:36:47 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5c42:3781:50b6:b9d7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de43637f2sm115585595ad.241.2025.07.15.13.36.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 13:36:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/16] oeqa/core/decorator: add decorators to skip based on HOST_ARCH
Date: Tue, 15 Jul 2025 13:36:16 -0700
Message-ID: <a8381f4b7d7c294d9ad8a9d3f0b1f7c409753716.1752611671.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752611671.git.steve@sakoman.com>
References: <cover.1752611671.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 20:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220424

From: Ross Burton <ross.burton@arm.com>

There are already decorators to skip on the value of MACHINE, but for
flexibility it's better to skip based on the target architecture. This
means, for example, the ISO image tests could skip if the architecture
isn't x86.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 0c21ff0a92906b6b4820eb8beddf8762fe70653d)
Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/core/decorator/data.py | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/meta/lib/oeqa/core/decorator/data.py b/meta/lib/oeqa/core/decorator/data.py
index 3ce10e5499..de881e097a 100644
--- a/meta/lib/oeqa/core/decorator/data.py
+++ b/meta/lib/oeqa/core/decorator/data.py
@@ -194,3 +194,27 @@ class skipIfQemu(OETestDecorator):
         self.logger.debug("Checking if qemu MACHINE")
         if self.case.td.get('MACHINE', '').startswith('qemu'):
              self.case.skipTest('Test only runs on real hardware')
+
+@registerDecorator
+class skipIfArch(OETestDecorator):
+    """
+    Skip test if HOST_ARCH is present in the tuple specified.
+    """
+
+    attrs = ('archs',)
+    def setUpDecorator(self):
+        arch = self.case.td['HOST_ARCH']
+        if arch in self.archs:
+             self.case.skipTest('Test skipped on %s' % arch)
+
+@registerDecorator
+class skipIfNotArch(OETestDecorator):
+    """
+    Skip test if HOST_ARCH is not present in the tuple specified.
+    """
+
+    attrs = ('archs',)
+    def setUpDecorator(self):
+        arch = self.case.td['HOST_ARCH']
+        if arch not in self.archs:
+             self.case.skipTest('Test skipped on %s' % arch)
-- 
2.43.0


