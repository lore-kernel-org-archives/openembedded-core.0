Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB712CDB47C
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 13:14:46 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20840.1782220483515625816
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 06:14:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Us5H0kcP;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490a76757e5so35504595e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 06:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782220482; x=1782825282; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bW0wf28jLOy+Ca9B6aGkD6Rs4nTYm923FLflNVQsWhE=;
        b=Us5H0kcPbd4KNdI4R4QS6DKvuZaaMnOQXGJgnxPaEL+nKYz82InIlHOuM1Yj41OUiW
         QMkdvJhxtsCUHnkivWf2TAv88LWD3LXbBD3j9NIc2YkyU72mu3GuCoKEKKE40aOdK2qo
         qEflMvExIhpcm+UHOCbbi0KjWhCYFkDkxeJYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220482; x=1782825282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bW0wf28jLOy+Ca9B6aGkD6Rs4nTYm923FLflNVQsWhE=;
        b=VitLd+5FMUCvjytiT9mfVmi8JolDbOmhMEcRoNz+wAluXRTT4f2UAtscK9ZRcTbdcj
         7bOI1nRmJjqmfxMoYTtC8/lZog0hhap7ZTbZwmGbcpHOdv+UfEltnLoG6fjopHrLtL3C
         PZvea9EtiLblhnAIW32c3aLVwbk/uQt8dcVWLdh05vnu6l2g0mgfbvdg/4yn6Dx8EDrM
         tECdKBT0n58aSwb7KQmguEJhAQ9GrMFt4sQkjrKmBlG6+S+Vzul/08q8cmirLg53VLim
         ejs001Kb4x0ICoJBbYCI3sRnFOhApGzY/NOSqTJVYHxvbr1lb06/LOvZ6b9Nu5mCHeZr
         0b9g==
X-Gm-Message-State: AOJu0Yz3SHD55L8WHZlE7zB+33zy9l+j6aVK/JkqZNKGvbAhJF+znEHM
	e1ZDlLmV8qoIxVkTbg33GgpnFQXliI0E0Tt0t3kRJwvV9LaeUJo0afLUclphBTUKbBJgEXS5kt5
	SBJzZ
X-Gm-Gg: AfdE7cmNk8HJAkqsT5gqkUKLELq90IJvLAGo+rZ0EdSyX6MotiqS7euefjqBnYliKxs
	3ADq+aPbjEzjLu5/IIjlvs8pqgjw3w7fE9HCa8ZNPfoM9hcj3RPEmbU9N8XMUwUczpxOIGABJaj
	R3FMDtBwZ3o2Nglww4YQIjEUBsVECbf0uQbXA7BvbipNGU0E1Nmo50JV2ApThQ3r60UEgeaH17N
	IW2whjerCRqx3n9IEDHd6Xdc5ftKpfaBA/Z9vUZLQtmDNPJkCVo8BEAIXKOKsGWdXvZGsbeEiF6
	5z+tOaWpg+OfkCgeHFTcBUI3Zufv8O7OxUDRPVXrFoYTYqNuKOqhdHWbB/X9HY5kHGkTq0BHBeE
	UW0FrcIbje3KoCdjPYOxBkSucm7gRFXZQMLxe3wPDXk3AwNCeErnG1Svv8ObBTihKZ6uXPBvnzI
	/RAqIRK59nzrmveEZWuD3aoAOAFvBByZ1f5vBTGcdPRfvSY8ZbbMP2DNKRhUyno6uTQdDATbc9O
	z7/F9ntgnE8yZBIag==
X-Received: by 2002:a05:600c:3acb:b0:490:b642:ce31 with SMTP id 5b1f17b1804b1-4925b386802mr37407825e9.2.1782220481677;
        Tue, 23 Jun 2026 06:14:41 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa008234f3c115adbb1a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8234:f3c1:15ad:bb1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4925d013a69sm24334285e9.3.2026.06.23.06.14.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:14:41 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 21/26] bzip2: set CVE_PRODUCT
Date: Tue, 23 Jun 2026 15:14:02 +0200
Message-ID: <b976aed4282df6becec170ba6085e54df281603f.1782220259.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782220259.git.yoann.congal@smile.fr>
References: <cover.1782220259.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 13:14:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239387

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

