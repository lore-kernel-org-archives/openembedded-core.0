Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB2C6C54F5B
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:31 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43753.1785192982668069370
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XJ2ci+MS;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so15636545e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785192981; x=1785797781; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OQRySA8FFcgoLCak0R720yown2ebhLpBB3Zcrz2McSA=;
        b=XJ2ci+MS70vCHX6yU8w8dmOPBheAZ4RinewmQeWZNmIWPymuJa6BhvjHnJk2ww7HtO
         bjG9LIbPrO6B4dLdtlKr/ugoUniyj4u8uDJbx5PdRuQ6GU25YDrVQbF975uCDdS9Vir3
         m5Zkw7BqITzmaq1cazOt3J0BitDO+Uw2RAGfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785192981; x=1785797781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OQRySA8FFcgoLCak0R720yown2ebhLpBB3Zcrz2McSA=;
        b=ZyOLuWHmmIATY1PHg3B3Wk6nPWX/uOW8L3cF3qQJURHJ237DYnq3VNCy8FX46Vw5jY
         Oo4dRofX/Qzh+vBTVZ34cw+BoJ6K5EbG6tj8EKZPfRQ7HM5n/chPbsiUmUlIpRCnw8qg
         GplA+gRG01YECKK4pgOnvBK8V17njNinfs1YGCiMdZjD232/7Ly0ZunBFUlLnQzKnOlZ
         TDvtLrMDPtyQ+bg7ccVizoF7u5ThYwGtuRo6NzmcfQGdc6sFrml7XZRpqBEhGuhOVVG2
         HhMaK8mbPbPh0fjsoxS4NW+fzrROIASxFglJTspglCjFOKrdlKEowZ0xSfILSG0KYkxx
         HQCA==
X-Gm-Message-State: AOJu0YzR6zusKmSxUAMqWsXsuCFEYN30jErn3EPljoGQc1RgNgJh614j
	0TNHEQ3retywlZrXq1f8XLI5UtxoYJK1hk0iYRLAQqwBVLko9ylbXQP8ZMvR20HSPlaWMo9X3Z6
	dmjukJJ4=
X-Gm-Gg: AR+sD12prjJZ9BouQvS/n8XsWMWp9mykuAe3q1uqp9X9NsoUAIcBHo4RbO+lT4U7kFT
	88cpX5QKPJppULd0g9a9KVCPcy9pohX6H91E/rywmPfmLJ/HDnTg3sN7fitKMvVUr91MqhwOCIq
	Oh5PZ7+auiIYuQxNZivVa5lBUZEJI8WOgavsI9dXO623QqwnHRod/lTvwMf2BR/s2rec8UCY8cv
	vxZUmK6yk8FKFce91w3R0Jy3zBar5378DYkt/puIgK2U4IeyxxvAhctsfc3G36h4rWquYK5sOxa
	RaRH35e7ut5mV1ZHLz741FA7dAgmyLd6C8M6Jhblkwqp+2mW6hbjMkG79p7C8tgcFEWrvIE5wH9
	60WY3o5hefeWJ8ud4Zl0dv1WbTf2LijbD6pqSYJfb05W/gghFpXKdrj1GfB+obvUgqAC3XqR2+J
	L905Fgygyaq5WjTada6S8nf8wcZ7P46x3t1PkTYy4SRP5nn6fVWQDtY8SeohsDpwlAv6KvWm31z
	+xiz/fp/hQuVEi7
X-Received: by 2002:a05:600c:c87:b0:495:3e81:76fa with SMTP id 5b1f17b1804b1-496b56ff0fdmr133932315e9.15.1785192981018;
        Mon, 27 Jul 2026 15:56:21 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45de1a3sm31513055e9.11.2026.07.27.15.56.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:56:20 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 14/36] python3-cryptography: set CVE_PRODUCT
Date: Tue, 28 Jul 2026 00:55:28 +0200
Message-ID: <b021f439f5fc637273afcf542383417b7536690e.1785190123.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785190123.git.yoann.congal@smile.fr>
References: <cover.1785190123.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242122

From: mark.yang <mark.yang@lge.com>

NVD lists it as cryptography.io:cryptography and CNA lists it as
pyca:cryptography, so set both vendor:product pairs to match correctly
and precisely.

Suggested-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b721019e0b2ccbaa8de267e14b282c48a5a3de8b)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-cryptography.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index fc5cb50b029..42e8c5ff19c 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -73,4 +73,6 @@ FILES:${PN}-dbg += " \
     ${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}/hazmat/bindings/.debug \
 "
 
+CVE_PRODUCT = "cryptography.io:cryptography pyca:cryptography"
+
 BBCLASSEXTEND = "native nativesdk"

