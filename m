Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB7DC43334
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 09:50:07 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.39564.1656323399098823255
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jun 2022 02:49:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m455BqFU;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id n1so12179863wrg.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jun 2022 02:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BFam3ob/1OodVmKUkdGvrIwsreJmSeoiTDd9x5fmYFw=;
        b=m455BqFUoiVeZn+AcDdVqfbBHqe6hD5uVAlHESaxme1+KC/MNlcMHe0S0WkWQq7Y/O
         PYqDJGhl/UiK9RSQFJqdKUJDVXEJ0funB31CZ2sLC+sySmzMBE2lnLnv9vHjMY0z3GH1
         LWmGH1gW8K8AEAxDZNs+ipInRt2C1NwbMdzZg1uZfAxqtzpZLEK6+8YgSFv/4Gxl3LT4
         zaskDzfrAlIBwsj/I6G/KacEfwjI2T5q0pZa9PUFuHit9vinR+xyAPTf3OfoQoq6z2OV
         zkIUmpV9dSKb0mwLnAVn+8jO2ZOEenyg/8ubX8VitVwXkLIwuhOu+jQS8cRdREixGV3O
         Tsug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BFam3ob/1OodVmKUkdGvrIwsreJmSeoiTDd9x5fmYFw=;
        b=8E3fDtkgJILv1nscokLTjoAk3lwQpM0y9FfKPgyrbKD68Im6quN4i5wG29oTQE0Jn/
         6Ui3DJDU2hN6xuLZGGnR6Xi0ujAUwDbebHTgfFUoyV14OZ3IHEpYVQpnghOd1IZWQvX6
         wn3lILFTk8cI+RzhPuOlx4SgH/yNAb2KfL/4bj8p8ctBvZwWLOD5PZHA/rd5DNOBO0r5
         2dZLN8+ED/EpIQQchvmVPX3tKXaVXRuoTih2FV6DitljusAIvrbupH1M1jY7bZi8Kk5K
         xoDAm+ipZ5zPudlu8nOberuc4mpK6ZSzDUEk9hOGUlmyfrHeQ4EkJ3emaQMKHe/hmi5/
         YaSA==
X-Gm-Message-State: AJIora9qdnRyiTZzuFaJ1mQwm+5c2uq7VRSwlwNV62NlzxDsv6rl5eus
	+4GtLHDobjNifPaQCNgZ6Xz4B8HaSzMY3fYV
X-Google-Smtp-Source: 
 AGRyM1tFOhnOuLzctlHJvRqKdH8BiIhyl+Qyqltq4EcbrJAdpP/zEyqyZ88zMgfdVd8HVM041FkWkw==
X-Received: by 2002:adf:efc2:0:b0:21b:adf4:b4d4 with SMTP id
 i2-20020adfefc2000000b0021badf4b4d4mr11403990wrp.287.1656323397655;
        Mon, 27 Jun 2022 02:49:57 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c511300b0039c7dbafa7asm17249081wms.19.2022.06.27.02.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 02:49:57 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/3] at: take tarballs from debian
Date: Mon, 27 Jun 2022 11:49:50 +0200
Message-Id: <20220627094951.1882744-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220627094951.1882744-1-alex@linutronix.de>
References: <20220627094951.1882744-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jun 2022 09:50:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167315

The original site went down, and at is more or less
maintained in Debian anyway; the tarballs are identical in name
and content.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/at/at_3.2.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/at/at_3.2.5.bb b/meta/recipes-extended/at/at_3.2.5.bb
index 6769eb364b..87a436173f 100644
--- a/meta/recipes-extended/at/at_3.2.5.bb
+++ b/meta/recipes-extended/at/at_3.2.5.bb
@@ -22,7 +22,7 @@ PAM_DEPS = "libpam libpam-runtime pam-plugin-env pam-plugin-limits"
 RCONFLICTS:${PN} = "atd"
 RREPLACES:${PN} = "atd"
 
-SRC_URI = "http://software.calhariz.com/at/${BPN}_${PV}.orig.tar.gz \
+SRC_URI = "${DEBIAN_MIRROR}/main/a/at/${BPN}_${PV}.orig.tar.gz \
            file://posixtm.c \
            file://posixtm.h \
            file://file_replacement_with_gplv2.patch \
-- 
2.30.2


