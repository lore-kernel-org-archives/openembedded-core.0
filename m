Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D70C25B75
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 11:06:25 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.8943.1717153575676046187
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 May 2024 04:06:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PKV5O8fo;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: liu.ming50@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-354be94c874so1479865f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 04:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717153573; x=1717758373; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jahnUeOKn51RLPmUzg9qwUhvD/nG3jPatgBpmertxIU=;
        b=PKV5O8foGglW6LZn04WHZm7ek84J0FUtvX3JesTGyEKte/akxyLJqhAB7WyFEuZkMf
         eRuxgAUKpf5ji0ZnoFy3mM3mldvtdIiNoihYhu5ZETe+txbjHAhTOiXdURALCWz8v9d9
         7HgkaZ1JKZ8BRaLbJnppOVCW9w81ZKskPSq9mtqaq/Yrwh1bxwh6jBjhlK6L23rsVDWe
         DKty1YqNrDIDjIW1rJs7mLaECZuqU3ET8v2PdJ4bWjEVV84mN+ga8eLyC8mILm9BPAPd
         ufwWgfHaIHqsqlthXsUACjKVv4GVr3ebJaJibLACtpw27iKPucbD5tiEy0+us/30PFBz
         5XmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717153573; x=1717758373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jahnUeOKn51RLPmUzg9qwUhvD/nG3jPatgBpmertxIU=;
        b=ornDe1lrRVVpMl9kIzkukbTGeW7EOMqgt1MAH7l8GIMJb+gkb5bwKDStYTOQMfqw7+
         C0PJW2WTtDypIRXs2nYytcRSAglO4+Yh3z1aMSRtDn79qgi6ytI1k64iJ9k8iz/1OrUf
         j6PNHKdGnbQhUIZT3m+lr855yZhZo2Dy5jO1mDgTEj/8aqpWI3K/eA3vrY+BrYzEcC8E
         Y6TKR/6RWxa9tW5Xjf6+1+X+wSlimm+a9jYPVvamjTjY3CJOFtCMpHBwJ8d2PlGbQKKA
         UxY6TTZ3F8Dw5EV1WEi+OlpQG5alhmomrO3af3h3CqhyuehmEJq0zOmymQyZlVie4ok9
         WzPQ==
X-Gm-Message-State: AOJu0YywWmwoT3aGnCPdhImN4+LbQjjL60G3YDxfogfIVGga24jh9tlR
	upigek+TKbpCRY2z90LS6t4MHLWcdtafLGQ/uIoxFg2XERq4jQmRoHXqAA==
X-Google-Smtp-Source: AGHT+IGv3ZmzVVnS0h37s/78KWltMghTqXL4JJysfZ2vAkrDU2Mxho9qCZTJnfvmyCHIjoa0RnEyHA==
X-Received: by 2002:a5d:4565:0:b0:35c:5202:facb with SMTP id ffacd0b85a97d-35e0f259ba1mr1217175f8f.10.1717153572791;
        Fri, 31 May 2024 04:06:12 -0700 (PDT)
Received: from peterliu-Precision-7530.atlascopco.group ([213.50.243.108])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd0630010sm1602826f8f.76.2024.05.31.04.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 04:06:09 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] initramfs-framework:init: fix a error message
Date: Fri, 31 May 2024 13:06:05 +0200
Message-Id: <20240531110605.243346-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 11:06:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200063

From: Ming Liu <liu.ming50@gmail.com>

Fix a following error message when entering init fatal console:
```
can't access tty: job control turned off
```

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework/init | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/meta/recipes-core/initrdscripts/initramfs-framework/init
index e3d8caa0e1..41e2d28b9d 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/init
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
@@ -62,7 +62,7 @@ fatal() {
 	if [ -n "$bootparam_init_fatal_reboot" ]; then
 		reboot -f
 	elif [ -n "$bootparam_init_fatal_sh" ]; then
-		sh
+		sh +m
 	else
 		while [ "true" ]; do
 			sleep 3600
-- 
2.34.1


