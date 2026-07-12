Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A740C4450F
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 18:43:38 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.936.1783881808268083178
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 11:43:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=iCXsV9+G;
 spf=pass (domain: underview.tech, ip: 74.125.224.47, mailfrom: vince@underview.tech)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-664cdeab266so3869107d50.3
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 11:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783881807; x=1784486607; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aij4URGMB/UyTElt/p02TPGcULtzqCdNoov+1e2UU0w=;
        b=iCXsV9+GZSWDxEY4LtDHC6Oq14ojV3IPOPpGw7Ix2RF5mUgwo2KptxJ8bC9WhcSZa/
         cmJVhKzvp20V01k12EdIukqb9ASncXsS5GeTnQf003FmBLhQBKhSzbRQPeKNYuFQ/nX0
         bqBqjPFVKIlYZncITzub10D5gUTxcZaxsCRBpWmOiGhl6Mai97VlOEdvErjckQCzRdS4
         P2aCIcqke04/9FjSyaqOT8mxG2XRoz5dVt2/V39AiQDgq5lG4E9e4KC1wYZEnb9oA67W
         DgohLUUI4xIKW8iRwwtZu8iodsDKt3eWWJCUd9z4GndDTbYwbck5ZTCoxaZNDdZ7zEim
         Zxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783881807; x=1784486607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Aij4URGMB/UyTElt/p02TPGcULtzqCdNoov+1e2UU0w=;
        b=NBzOCbos95hwCf56XUQ62DnNXE637RUzc1bM5gBzMPuvEDSROcGIJ3oPZH/NlXf5l0
         V8A0vj2iGG/GBUF9qIpSHVone6fdNTSPRYmhV8tORGuun4bn4BIa+FslqfZGZYPEeY/R
         /1kCtmf3t15cFmKeTgg0M3hSoE7u59/QnhL8Zi0DZWtxGRcH3/NAWrwJJviIv7x9+Q0/
         Dz8DzyDMYj9w9Gda8LUt4gg5OFfKPNe2dlaLqXL4hAKF18f9aSmzFeygkxaVoxc1d7xe
         rIznR44aQuD/tDt6kepSZ7N3yMW2FraW++JHY4W3DV3FJ01JkNj01XIcwS+RX7i+XlLl
         hCbA==
X-Gm-Message-State: AOJu0YzY+mjeqSYt+CVC4EsawTEIUj3MRVT2Q6GqY4M/VcquFLIJa3Ur
	n4DSVhXjvMatMujUHay58HTxVnIJOjEjmJ62eG0cxtu0JzCoEqR7zGHxZTP5zJ+vIbjPQ45ZuM9
	gKc/TGIU=
X-Gm-Gg: AfdE7ckj4YMMYgMFSLCEAmP4T5msENQb1+0CxY6qGtPeAbrH4bhN9IvehLHgr0jbMmX
	IsiPHOJ/7oAi2TkJIKCXWhzSbic17/sQ0DWimMmXryc7rEuH4Lahzl7HnlcUVzLRChgkbp/TwLj
	zxqJw22PiT2suzdwgP9y2rHXGU19J0LWsHCJt/mY7RO3NDaAG6pBgj3L4rMmSbzdaAXNOe0Y+Og
	mA+XmG0Ph/1A/Kd7aQFYu+N/2uzXyTv5lHEwpZFNl+zwPyGXE97QLh9Z3VDn4Vo67uRmR0F1Ld3
	h5tbYoiWwTfLqsyA3sSnGHkZOJNUhH5+M7NcBNFMV0szeyQYrpHeIzKI626y/cSRkZxu3uUHMIQ
	XbcDfSmVlNS504LPL2SeLJGU8PtNunZ9vm0ZGI+2VNYgy8Znpl/LE29E6Rw0FQwvz7Zu9r8L+K4
	IL3QbEspVh83uc7+R46aSQb76K
X-Received: by 2002:a05:690e:408b:b0:667:e33b:6043 with SMTP id 956f58d0204a3-667e33b6a48mr2950045d50.101.1783881807196;
        Sun, 12 Jul 2026 11:43:27 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787b23b35sm11768236d50.21.2026.07.12.11.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 11:43:26 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v4 11/27] watchdog: rename kernel prefix
Date: Sun, 12 Jul 2026 14:42:51 -0400
Message-ID: <20260712184307.3259642-11-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712184307.3259642-1-vince@underview.tech>
References: <20260712184307.3259642-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 18:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240801

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-extended/watchdog/watchdog_5.16.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/watchdog/watchdog_5.16.bb b/meta/recipes-extended/watchdog/watchdog_5.16.bb
index c166ace665..8ce0c2fc5a 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.16.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.16.bb
@@ -65,8 +65,8 @@ FILES:${PN}-keepalive = " \
 "
 
 RDEPENDS:${PN} += "${PN}-config"
-RRECOMMENDS:${PN} += "kernel-module-softdog"
+RRECOMMENDS:${PN} += "${KERNEL_PACKAGE_NAME}-module-softdog"
 
 RDEPENDS:${PN}-keepalive += "${PN}-config"
 RCONFLICTS:${PN}-keepalive += "${PN}"
-RRECOMMENDS:${PN}-keepalive += "kernel-module-softdog"
+RRECOMMENDS:${PN}-keepalive += "${KERNEL_PACKAGE_NAME}-module-softdog"
-- 
2.43.0


