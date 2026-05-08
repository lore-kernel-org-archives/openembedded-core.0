Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3AC4CD37AC
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:17 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8150.1778224331277031862
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=q4J72XSf;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso15482335e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224329; x=1778829129; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ifQscOr9HiUyn6wLZYb6mIWmOjTyzmwCeb5XCuk/Fpg=;
        b=q4J72XSfk2KujYpE5974PZiJU3V0ue0fPgE1gci7gO1sCHS0VB3qGjpl4Rg29eEII1
         WTl3HNs9WOVrpmaWgpOr5cthfGPX5rnf/oKTsF1xxWs4NFNxo/XWbLjnj4/cZBiD45Ey
         yam6QWjxNXSqtbK30Rsh4O1XsYWNbfH1KPLp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224329; x=1778829129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ifQscOr9HiUyn6wLZYb6mIWmOjTyzmwCeb5XCuk/Fpg=;
        b=PHYL7PSXzZOtMICfGCWcVFPwTu33hEuRjBGs3A9gOwJL3Q6u8VMIYNSnFC5CeIpMK4
         +HrcZrGL1GgE++GEV84L7Exe0iD9l5LUdPAN2ZbL7iJnm9drQsbk/dt3hjTSxWdDjxhk
         +QQCCVy3o56lx8qdVMyHqH5rBSongc6oftfNEFwXU7XTQpRxpNvYDl0+V6TGnMnvwZ/x
         zU3vFxI2vd1SDBbm6FuI2UcQT4/AwjvaYjhLJb3PhdqgfUpjoM7Y3jIL6A41cvFInfWx
         z+uHqKnxtW9KNFevWs0hV2nYBsGtRxzmcqYy9Ebw/gM18MRsimEBhUEe/qaW8UU1Lzph
         b87Q==
X-Gm-Message-State: AOJu0Yx+ffATvsqqjUXvUATwH8e2OzdWW7y44bsEtRFMqksceGik/PlL
	RXuSjH0qwbWhXGrjhv3PuRNDPo6l0p4K8O7Q+63TnRCzANMzBwrI9gtIjsjfn8Ai+J0eAIdi9IZ
	1Z9LGBOM=
X-Gm-Gg: AeBDiet921twHSSEno0etVTuHKP9fAr6nb/oXKJfCmEZdnL/7EytUaB8CDycu5+gUct
	/Jd0lZS3uotXJN+H+oGXu/mFTcyzcdf+u3gpzDaPFx7AjLiAoveYZ+oRo2QvPwluGWtQmDx37zh
	zLp82mu34Y/TFUAuCK7m+6rSvWIC1Fu7t/hruKL/MYnCURpOXnqO/j3DfAX/towjQ7/z1tBw00k
	YkUEsAPJs/TgawPgOCumE4Rar9oNMcQ7g1/hsb5rrUlcM3JvQ1Ffew3qeiknpN2kH3KwFUodwGM
	EFTXRx3p/G8rXM6hnxK5JRZAynw+qVfKmgWcu/KdVG1HF905/+eTvUS6ZkCqbx/QPqvujkT3MPi
	ghX+P8DIHLNapF7keup+dQX+UAJt0CDLgzZ2m6kUGGjdN5lqTXFwk6bpcKR8LN0cTule9oHE09/
	JUj8CWJStmYZe3HntIU7YhtEQfwGI6sBGNo7tVFlyhSc2rtnyRjLHn32HlH/99o/iFqOpyu3Hj7
	rSQUU+HTOweJeL+KMi+rv/0xPk=
X-Received: by 2002:a05:600c:a30a:b0:48a:58ae:9938 with SMTP id 5b1f17b1804b1-48e51f37f28mr132401815e9.19.1778224329204;
        Fri, 08 May 2026 00:12:09 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:08 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 02/52] ruby: set status for CVE-2025-0306
Date: Fri,  8 May 2026 09:10:55 +0200
Message-ID: <90b45f5699ef1191a8ffb672c2f926780375c0b4.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236644

From: Peter Marko <peter.marko@siemens.com>

This is a version-less Redhat CVE, so explicit status is needed.
Per [1] the issue is mitigated by using openssl >= 3.2.0.

[1] https://bugzilla.redhat.com/show_bug.cgi?id=2336100

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5e03d64e32dce88d78dcf59429ea8fec475ea318)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/ruby/ruby_4.0.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/ruby/ruby_4.0.2.bb b/meta/recipes-devtools/ruby/ruby_4.0.2.bb
index ba24e8601ce..89d8d5b1551 100644
--- a/meta/recipes-devtools/ruby/ruby_4.0.2.bb
+++ b/meta/recipes-devtools/ruby/ruby_4.0.2.bb
@@ -140,3 +140,5 @@ FILES:${PN}-ptest:append:class-target = "\
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2025-0306] = "not-applicable-config: issue does not occur with openssl >= 3.2.0"

