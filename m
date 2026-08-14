Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB58FC5CFDB
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 10:20:05 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9891.1786702800050588828
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 03:20:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=d0FMSu3f;
 spf=pass (domain: mvista.com, ip: 209.85.216.44, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso699837a91.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 03:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1786702799; x=1787307599; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bSMojl6mQaQOqvIFayGjgug1jYnSMNgFcJAxNYkkIKs=;
        b=d0FMSu3fj9S4IqUgSGhy2vimz7h0IOSmOsTJ4fYoxrMQW/QIkqfEegBSZmMTX4lOHt
         spsE8Fs/WsvtmVbV3Mc4s69t+/2P/rIxvk2rj6rFKXbEXQvNr4B9t4JldAXHo/Dord/N
         USRSWj/jCyJvaU3n8gKyBXxcF9sadAMDusitc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786702799; x=1787307599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bSMojl6mQaQOqvIFayGjgug1jYnSMNgFcJAxNYkkIKs=;
        b=kQ+jq7qRJ/fdfq3cGPhg86lWbX7nSNMB2foKmpFKdqMS46j1msxUGeoBniMyttAd4y
         euHm8NZJvrC+Amy2h5LwLf6LdTx5D46LXCL9dWYjzy8Ssb8iu8GCD/hb+yVDTppGnl8T
         QB7ZdObvv/ngXFliixNJ+hkWyu9xlGvZ8be94/QAqKAPi76bwDcF4ef66PHiwYsenJjp
         etipvxhzkI51yNIoHmUHiWljRQ4fjDqyd4bNM6/kFCOCOfySd6Sa7B/EVYh18ILEWj1l
         NiHt0VuEC0MSJYLf5nTypoYcEXJGkTAhmr4GNqTR/ChhjaUfIwU6f83ROZUnRV5mBBoo
         i+eg==
X-Gm-Message-State: AOJu0Yxi5V6UTApLe6+x4Kh+2DFjSFazchKha3thYoAeU+W6Ug3reY2K
	GkNyI+R2vHR273p00ZwSpEJySQScbuMaFmBw4sKw0xDX0G+gYJlTrcWFibfrhTAtDDMowUacKNc
	QGjTA3/k=
X-Gm-Gg: AR+sD13aktwT7lr7Mfx63MAHxnwEOqfC7xS4EAqo0LWK+KV/5wo0+6RcABEzhRiHk6h
	XwMgY8gbyLTUQ0CH8/1u2pea/iySSoHPlc0VWwoPdYm+N5MC23ehlkNGBnMjStnskRSkREKE7wd
	TkFxckQvUu7gzZkJgOBU1KLzUW3pTEjZ817s++KWZwIEF9REDZpoIZCjDLgi1Im3dqDzgGMFSrR
	p1/PXNF1ao9hC1WQc4q38dWGFUXPDLA8wRAKzcrudccT9zK5SI2K6O8pIjWyh87c0S6xdRI6Zn+
	lXngmTW2S3WfNd6yUKKlGmH4mEsG9CmA0tCZBbaLub3BmDzmGztV4nIjPi2cu57qPuKeYpYD7O4
	8GBwK3mUjbmssNhQBosziDonSR0F7zlyRvBHPdJAaQ8dGAm61N64EiP75KeapwkZXfvWKbYeY03
	yQyDu0WSVId39mBkzd8ub4qudFeLWfXH9ExEiiF3FIse8GjqZjX2Faj8/DvJoDXYzG411HzJJQ8
	A5QiE+1WXwrmvA=
X-Received: by 2002:a17:90b:3d45:b0:37f:fd1f:d30f with SMTP id 98e67ed59e1d1-3933b9157eemr5152221a91.12.1786702799318;
        Fri, 14 Aug 2026 03:19:59 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1cc4:a7de:e349:c3d5:7c44:1c80])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141386a039asm7889333c88.0.2026.08.14.03.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 03:19:58 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch 1/3] p11-kit: upgrade 0.26.2 -> 0.26.4
Date: Fri, 14 Aug 2026 15:49:39 +0530
Message-ID: <20260814101941.873295-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 10:20:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243432

From: Richard Purdie <richard.purdie@linuxfoundation.org>

ChangeLog:
https://github.com/p11-glue/p11-kit/releases/tag/0.26.4
https://github.com/p11-glue/p11-kit/releases/tag/0.26.3

Fixes CVE-2026-13757

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4e58b57cdc5e25d6cb12b658f09fea7c91835430)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../p11-kit/{p11-kit_0.26.2.bb => p11-kit_0.26.4.bb}            | 2 ++
 1 file changed, 2 insertions(+)
 rename meta/recipes-support/p11-kit/{p11-kit_0.26.2.bb => p11-kit_0.26.4.bb} (94%)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb b/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
similarity index 94%
rename from meta/recipes-support/p11-kit/p11-kit_0.26.2.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
index 5f553f11bb..ecf7500b13 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
@@ -13,6 +13,8 @@ DEPENDS:append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''
 SRC_URI = "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https;tag=${PV} \
            "
 SRCREV = "8e6e4e6d64d9fe91c62b0052c105b2b72d4c24ef"
+SRC_URI = "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https;tag=${PV}"
+SRCREV = "a14788849d1ef44422d679534a13821eab5bb5f4"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native"
-- 
2.43.0


