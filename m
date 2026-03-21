Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 738431094462
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 07:38:37 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7246.1774078714380911821
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Mar 2026 00:38:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fXKlX3DT;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso23500855e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 00:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774078713; x=1774683513; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVcBYeJh3EwGLd2p5IKRGPfNZ0UyXmoQpABHURfEo3o=;
        b=fXKlX3DT3i65vM4SVHtB8Ve0CmOY7A5x/QZPNGxshjeIwqQlN8JuWcRsTFr0yFz6Yz
         uf7Rwn2gxlRj5CvnUjSRG2fBkVL0rUeggrmjQgqefMyRij4NY8WMb0mfUU5c9RBAvNph
         K4Z3kyTqtIX5G/JN3wOHWGpOwz9GWWHHmrDLZ7DOEw48xe7P7Z18TM8qHz1Fjpa12hnI
         yogd/mQGbn8vCBfLXM2CUhL6Mvlcv04T5D6l4AwajB093LfZ225Bi8UirUKca2XZjKyx
         pX97GwYHKc6kYhxFPNoPIM/mEH2kjszGP5T47eC+OOkOEs8/xcQh5+bCwH9P4IrHQGRu
         XyYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774078713; x=1774683513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VVcBYeJh3EwGLd2p5IKRGPfNZ0UyXmoQpABHURfEo3o=;
        b=M+RdmLih1ngro1fXmhhkQxerQL4dTPa67mEoSAYBw3FH4t9miLBowLK3itlBF2pWeB
         1YxgwPI2Yv5z8bcWZls6ENiI7KOgVvsyH0DkhVGaNv6UrV6dq/6dyiN1ABbqb8crmIz0
         p4hHERh0e/l2GXK5B6Ut+kJEtG4I5XOeYG6U5KppcgAt2RE3jrrPOhnDJEmBKPPuGNnv
         e1TxujqCqn0QMxyRSLVe6iDC1+MOah+71Daygsj1YYwmAGuFTk6TE5PxvZDEijUMmwUc
         IuiLG7Aj3sK1v2PNYs3EiiRJgP+00Sa4SX4JaF7XjEOdFTgo4glQ6t12bRgd/8W44LWk
         Jb9w==
X-Gm-Message-State: AOJu0YzOEPMdNISfGqjARCYVans0/bkO1nvbK6VMkJA+Mm7b+5lBjN5p
	8Qi2dJXmY+wC+qMlNe0QbE5DJdicVADO1OSyQvGMfu6jeGD9PDlNJwcLnrHZPQ==
X-Gm-Gg: ATEYQzzx5ZBP8Rv2YYnGr11nAZn3mNWlfyPhpRSNmmpvI6I9gEaGcqsWL0cQocMFHo5
	9V7tBXBHHH1qVqwkOaLGoUSFxJmME9mPBoyZXTbrm0e4UQXdanmHr+ykCfcjgc/3RGLMjydf5Rt
	1sSWqQz1qMR9nmK+/cMdETTkzdCmEQ8vF+bH/o2a7DXDwx7JeLz/cGJqnwVtqE3b7kpetW19Mnx
	hG5eQmd33y0MqG+gUQ5rTAjYQX7vgoy1r0IlGo3xKLjZJypZuVzCoRCXtItMwDAJS+eRHmHhjqu
	S2wELKvu38xPR4Rtkr8wRJCyBJqWiVkZ3Wf/Yl5x493ePGuFPX6UAg7ItRb9isM2djEkg5Eu5Re
	E9FyRzmnYT2u4TdPr/bXfoLcjcWI0Z+pSf9SIjUX18sUa1o99/hIg9Ump1U0IV3wJ1t+9qLAZKc
	muL0kHrJNGaNQRFVOWDuEPPq18
X-Received: by 2002:a05:600c:a31c:b0:485:2a4b:7bc3 with SMTP id 5b1f17b1804b1-486fede723dmr63171975e9.4.1774078712246;
        Sat, 21 Mar 2026 00:38:32 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48700658441sm149916245e9.4.2026.03.21.00.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 00:38:32 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Hongxu Jia <hongxu.jia@windriver.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [whinlatter][PATCH 4/4] gn: upgrade to latest revision
Date: Sat, 21 Mar 2026 08:36:40 +0100
Message-ID: <20260321073820.1403645-5-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260321073820.1403645-1-zboszor@gmail.com>
References: <20260321073820.1403645-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 07:38:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233650

From: Hongxu Jia <hongxu.jia@windriver.com>

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0ab101678860100c8dd0a47eb1d297624fd95cc9)
---
 meta/recipes-devtools/gn/gn_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/gn_git.bb
index 81d1814191..0b139ac5f0 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -7,7 +7,7 @@ DEPENDS += "ninja-native"
 UPSTREAM_CHECK_COMMITS = "1"
 
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main"
-SRCREV = "103f8b437f5e791e0aef9d5c372521a5d675fabb"
+SRCREV = "9d19a7870add65151ff91bcc26252bb7521065cf"
 PV = "0+git"
 
 BB_GIT_SHALLOW = ""
-- 
2.53.0


