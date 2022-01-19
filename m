Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 033DAC433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:50 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.4796.1642588908813924556
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IRF9y+7/;
 spf=pass (domain: gmail.com, ip: 209.85.128.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id c2so4514297wml.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1Cevkhdlj2tiLkIDNGdreV8scSZ1wuVTz/d4ujTABdY=;
        b=IRF9y+7/0LNSqPuIFDvNrxp3GrHbIZh3liCrJJSJbfQFUUbZWQc8+x/kS0MfYRi8S5
         oJYHeS5BAd1kpxvqJiUfsJtUonb6N6/chMGXovumFJBQN3qZ4SwTdqOWxN22JLzqgV+g
         UbJzkpY77U3RSIoaZm/ufxAQDUs6CzXHjI7R2vP/wLptXmq2vVhLoJnOHIO7t6mPsRuW
         egpytctTBdgRPG9l+QGf99ZLcKdQEz4ubYrqhqxwWCcUJHU6TEmZHnyzIHOqG+uFlPKX
         dQK7zeywm7pcML00Mz7ciU3zD1u7D2GRQpXHzxfbtdsP0szGAglMmysOOGEQfswpSTZr
         awVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1Cevkhdlj2tiLkIDNGdreV8scSZ1wuVTz/d4ujTABdY=;
        b=gFpS6BHc/2Cw1T799TZbCIMiljXFKUFU20ehGQI7tH9ptiqctXGB0nkmR9g+lOEXzo
         AjQisSrtaOfIPuQop8nhRQb9IS6SH6Yem6A4a8hSaJ6K92LjYstkeB7SVyiiTnUBcu+q
         0EmfDokfbGhC1LQzh0n7f0qxAQ3S2Eu5fW4n/Y8oxWiZAfy0Fx0dinaIrVLNRWUwyBmH
         V9WE8piLZldW0sXI4x2YGkzMMhdgcVmVhqrEygRk9CCqYXaHpnKq5ULKDyJH3C3QEzXS
         MB1f7nCBFiFGjN8IL4TF6GCwf4xyOBxlsmUSpNVkFZ+JNQmclkEv+TGuEzVUrJrbIvgX
         PFnQ==
X-Gm-Message-State: AOAM533qmBUcou+kTWtzcCXnE1SVl7lkjKf/dysABekt4XY/2EKVnNes
	c7ONG/+lRLETOuLC10jd89kb5uh6OWs=
X-Google-Smtp-Source: 
 ABdhPJwLN0ziz5K5bsKd4EdzR9ckhNzDXHOzit9KiRLD8RDdxWmOwo2OuCTwyHmsFv+m2Uz/0TVJyQ==
X-Received: by 2002:a5d:608c:: with SMTP id w12mr2377494wrt.313.1642588907393;
        Wed, 19 Jan 2022 02:41:47 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:47 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 29/39] stress-ng: upgrade 0.13.09 -> 0.13.10
Date: Wed, 19 Jan 2022 11:41:07 +0100
Message-Id: <20220119104117.2120127-29-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160721

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../stress-ng/{stress-ng_0.13.09.bb => stress-ng_0.13.10.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.13.09.bb => stress-ng_0.13.10.bb} (93%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.13.09.bb b/meta/recipes-extended/stress-ng/stress-ng_0.13.10.bb
similarity index 93%
rename from meta/recipes-extended/stress-ng/stress-ng_0.13.09.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.13.10.bb
index 482fdd2df5..700ee1595e 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.13.09.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.13.10.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master"
-SRCREV = "757b66b49e4b3d7d008ef7054b34d791c742e869"
+SRCREV = "b81116cb69a97aa671ab207a7f600aaacca091d1"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native"
-- 
2.20.1


