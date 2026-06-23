Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580CDCDE004
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 22:27:15 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32866.1782253630962160834
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 15:27:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bc7wLEzt;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4924593f45dso3833245e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 15:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782253629; x=1782858429; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bW0wf28jLOy+Ca9B6aGkD6Rs4nTYm923FLflNVQsWhE=;
        b=bc7wLEztzcJeq0b2LfvJYhoqD59ApOQhRw7T46GC7xecgOmYJeh+8U+crVQqpDtx4H
         j8xXLcoXSnQm6qZ+c3EE7RPPINRwLmc6fSu1EKPUIFQrogJAS68t6y2eRwLkcMQOpLtI
         A779x7kpVXaNvFpV/dvJ5iB7UsFcBynFyAOh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782253629; x=1782858429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bW0wf28jLOy+Ca9B6aGkD6Rs4nTYm923FLflNVQsWhE=;
        b=R0hD66BTuhypU0KKk7vv2DywxbdmwTN10usgv5RhR8bnnmwZjjIu2cSiFv1JIpX8MZ
         xwvNM2g4tH9g39K/AzBC40zPKleHHpLH2KTU/4LI4aVP421BD+zsnsslwoHlwpVOg/JK
         k5v1WtKzTNz89S2UvC2iqu/zKsZlaw05jmq5wSej8OKrsk0MTsBn5jjFD9wMGMOn2p+L
         gfQljvO0VoXAkgpZmhspk5mYU/mZcdUXwcQ68glAgQOMoFn6YUqmx8P2m5hRUahzf6Rj
         tAl5+9tt5XhFf4yGFP8BgzldEzQ2cCfiPv6RIM5RHW5taFKfEQ76bx9Nh1nqHPk9nyZl
         5eAg==
X-Gm-Message-State: AOJu0Yz6HfCjPhPBiLHynPi5ksneOFC2Xs0X+8AU5BQnA3wMbiL2ZNIX
	fCQDphP/DbpSMP9lPDnFL014CwwSzOr8zaHgfEJj4HbzihHfrXn9/2ySPUWo6iA3grUF2qP5uAR
	jBx3G
X-Gm-Gg: AfdE7cljrMmcQslePjZgzrebWduOtHex4oC5scEgFGapzCGAZlVW8eeE63T6WXJ36Ld
	Bmy9aEQq59Bm3HSa4QhiM+Rq0XfSxl0i2Tq5uEQII5siEWx/vKVJMh6kM7frvd94CWq+GYzIELN
	zh0Jx1LI2hMJBDDV+XNGohVJMWD1l3PqWMUH0P9HPPQfL2gbmMZNyGkZ/NqfnV9OLtaqHA/uQQe
	XIMTCpoa7kO6lFtl+vX6tXdWZH4sNHESVhGun7OKSU+YSi93Ijcgbr6JgRAW3Q03Quetp2Wl63o
	r6se0PXdnVZ+jJqUNzb1gE5a4ROTXGwajxt6IV/seMgKR7FCCBXA/FgyAhzvHIN86n9AD3NmhnD
	pLJYJTtiaI4pxCFHIfh2egyZCBAjle5py1i77HEVNonkMh1bb4u5VcvQ4GcHgqpfWWJyGR3EN0n
	aN5qL4ILEEHndikBSxkTPIodr17WhdNpDY3EItjGWRgs3kANULJVHSz5QnDbKdOFUQ+G6mfaN7e
	q+q/S0NJ7dXF5Ok
X-Received: by 2002:a05:600c:c059:10b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-49260840572mr5192955e9.8.1782253629196;
        Tue, 23 Jun 2026 15:27:09 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0055dd0cae868d89dd.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:55dd:cae:868d:89dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd21dbdsm370786745e9.6.2026.06.23.15.27.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:27:08 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 21/41] bzip2: set CVE_PRODUCT
Date: Wed, 24 Jun 2026 00:26:20 +0200
Message-ID: <b976aed4282df6becec170ba6085e54df281603f.1782252148.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782252148.git.yoann.congal@smile.fr>
References: <cover.1782252148.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 22:27:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239443

From: Jonas Munsin <jonas.munsin@gehealthcare.com>

Add CVE_PRODUCT to bzip2

Signed-off-by: Jonas Munsin <jonas.munsin@gehealthcare.com>
Signed-off-by: Maxin John <maxin.john@gehealthcare.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bc889ea799cc82f7fa018baabca0b821c1209897)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
index 4e3a06f2408..f9224908685 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
@@ -66,5 +66,7 @@ FILES:libbz2 = "${libdir}/lib*${SOLIBS}"
 
 RDEPENDS:${PN}-ptest += "make bash"
 
+CVE_PRODUCT = "bzip:bzip2"
+
 PROVIDES:append:class-native = " bzip2-replacement-native"
 BBCLASSEXTEND = "native nativesdk"

