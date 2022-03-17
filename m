Return-Path: <ricardo@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC8A4C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 03:05:37 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com
 [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web12.5965.1647486337260572377
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 20:05:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=E+KdDzlu;
 spf=pass (domain: foundries.io, ip: 209.85.161.45,
 mailfrom: ricardo@foundries.io)
Received: by mail-oo1-f45.google.com with SMTP id
 s203-20020a4a3bd4000000b003191c2dcbe8so4994386oos.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 20:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BIdZN+JwU0whZHwo36hPT0l6s83OS7I8jclQIVhtacc=;
        b=E+KdDzlu01SrRu8AcmgVlIALald9Y1+IswNFKCwZGfXsRtBjDI1A1n+/qvmEbF1FxM
         q/g2fsig6iWbRaIucOAn5rNgePCJ13pI34Q4EerFUF5565eowvGmmphrRcWh4/WQfonc
         D+RtxCs5kkllDs+5aQFaet+d6HkkHwpeQ2zg31mSBzAoyEzPnWsJflQdGtCIYmPBmqwy
         618RNGnpYO4sIMj6p08HONQ8pq/B2gJSfVe5nN+BoCVV1qMuZG2d8M05RU/Y6HXmlAaK
         3XA2kjVPhEzfSgPza2bO4B7jxBUziaaCCTdra994uXHAiKpNK7TdoT++GYcm9QbPv3XS
         zP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BIdZN+JwU0whZHwo36hPT0l6s83OS7I8jclQIVhtacc=;
        b=Por2Pzz6EAZKO5En/PCKzuy2Q20OiZdwI/bRxMevTdx6r6BDjhEeqePfcPUzr1tIdB
         nxfKZix86JBw3tOwhPIBqS3jEWRCeFoGZ5O+Uv1/gWZi0U6Mn17B4S95d85gIGhA+c23
         MMHFmI3ZGlYMJrcv03Rcz9h6qWph4AlSAFlJiSv+T6F8EFfBx7DRySPTMScwbvFN5q7O
         FYbj3heY9nWwLKe7fMNrKOKbMFNmr1/HfJYWa2SlgdHvB5xNdQYdYs/TwgakoxzOavev
         GtNarTVbkiMS4+G+pJAmoPmkJk8ghMJPXfkl3GfMEvmnzgLJxIPmB1vMNpepLOwjtaUd
         HKDA==
X-Gm-Message-State: AOAM53325DQN2agYmu6tuDEBgmzOricyyPXH01eWe6qnGRsy3G1DIda/
	GghsWPLagaYAAVh02ECaPmageXjxAV9E
X-Google-Smtp-Source: 
 ABdhPJzGhjOv2vdKWhuDuDIO2ocs4+x93qnu9LB7gTA9fN6gkhkan6G4TlDdOOZcUqRIOvS9p+aV9w==
X-Received: by 2002:a05:6870:d112:b0:dd:a85c:3b32 with SMTP id
 e18-20020a056870d11200b000dda85c3b32mr1037837oac.60.1647486336101;
        Wed, 16 Mar 2022 20:05:36 -0700 (PDT)
Received: from localhost.localdomain ([179.181.81.112])
        by smtp.gmail.com with ESMTPSA id
 bm51-20020a0568081ab300b002da5c44e0bdsm1709289oib.28.2022.03.16.20.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 20:05:35 -0700 (PDT)
From: Ricardo Salveti <ricardo@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: daiane.angolini@foundries.io
Subject: [PATCH] libpam: use /run instead of /var/run in systemd tmpfiles
Date: Thu, 17 Mar 2022 00:05:19 -0300
Message-Id: <20220317030519.1423570-1-ricardo@foundries.io>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 03:05:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163371

/var/run in deprecated by systemd, use /run instead, as suggested by systemd.

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 meta/recipes-extended/pam/libpam/pam-volatiles.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pam/libpam/pam-volatiles.conf b/meta/recipes-extended/pam/libpam/pam-volatiles.conf
index d8b8259a93..1263feb03d 100644
--- a/meta/recipes-extended/pam/libpam/pam-volatiles.conf
+++ b/meta/recipes-extended/pam/libpam/pam-volatiles.conf
@@ -1 +1 @@
-d /var/run/sepermit 0755 root root - -
+d /run/sepermit 0755 root root - -
-- 
2.35.1


