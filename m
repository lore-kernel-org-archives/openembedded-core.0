Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A8F9ECAAD3
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 14:33:06 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web09.1929.1662733985958309389
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 07:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jzkLx3px;
 spf=pass (domain: gmail.com, ip: 209.85.160.52,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-12803ac8113so4332263fac.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 07:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=VEXZ7Hea2UURQHPr1Alkj8Pb8s7fQtR7QOr+IoWBEWs=;
        b=jzkLx3pxgRYcQ+UIcW2NyWeVVng0H12WFpM9ZvBDf+36oY0pkwkfl4KmMo0a1RI8Fm
         CofGXVD5U0GCejJB1IONu3IJqkbFr5xoqoDyqrbGpQqXa5K2a+sFl4Z9TZLkFeBszlBj
         qUMxuRhtXbT1pIel+y0/dJrlUGYkWqJ/ErTTNyZpMVKUlXX5BJalieJ48Bc7O7vBC/ZN
         C60Q6Z1k67TGyarBDwIqyWMcgKgESF77N6sOMZX9tUs0cJcx1wiO4kh5J5FJsHdSlN8K
         KlA0WIufLbaI+J5VM9VXcDPpn7s4y32IeFiBameKkl+zw1mF7OyHU3OryfLO+JsoCeCU
         GgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=VEXZ7Hea2UURQHPr1Alkj8Pb8s7fQtR7QOr+IoWBEWs=;
        b=FeUeewOX8SlAGJApoDWUcUox40xiUr23qU9vzou/hLyUiKdsLdq1BJKCDOnYsg/ZLd
         SCmueV0XgJuLPXcYzbVPPB6AHBMbX/sDcuJQiM7/Y84VOfSJ15PBznkm3rZ9ujon+z+S
         XLqifyc7bHRtCq3V3uaYLqKcsmITvr1adpig926IEib/TKWy4tyCWePLHXZtu0xXdpI+
         I8sYzEKsridi2mXdmlqlnljCJ3ck1DfkuUSHyt3rY9ljGiTcmMuPTuXzTVpahm3CFTwU
         1bbQav6eRnyBBzPPE3AjhnrrhtRKbTn4xXcbomN0Hi4iCELcxkKUJPNEPi6cD4ZkYCXa
         f08g==
X-Gm-Message-State: ACgBeo0lCzOE02DynPTZWw7JgYRpfOehnIQhivWrUOd0x4M8zoB7DOrb
	D3QxFRbm0bxpCIvr75R/ROhq+ixk34I=
X-Google-Smtp-Source: 
 AA6agR5ulebhfAOWMK5L7kyTzo8ccnB1dNhlbROesOueFk8szjj9/GEQrJnmm6R7BADd+zvoCdAGaA==
X-Received: by 2002:a05:6808:30a0:b0:34f:656c:1909 with SMTP id
 bl32-20020a05680830a000b0034f656c1909mr269543oib.115.1662733984777;
        Fri, 09 Sep 2022 07:33:04 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id
 f17-20020a056830205100b00636e9a0cce5sm319603otp.60.2022.09.09.07.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 07:33:04 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] oeqa: qemurunner: Report UNIX Epoch timestamp on
 login
Date: Fri,  9 Sep 2022 09:33:01 -0500
Message-Id: <20220909143301.3363777-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Sep 2022 14:33:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170490

Updates the log message printed when login banner is seen in QEMU to
report the UNIX Epoch time in addition to the human readable time. This
makes it much easier and accurate to correlate logs with the guest, in
particular with the guest journalctl which prints log timestamps in
human readable format and the oeqa SSH debug logging which prints the
UNIX Epoch.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 07018b7de8..948f8adc9f 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -472,9 +472,9 @@ class QemuRunner:
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
2.33.0


