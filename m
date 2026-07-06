Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4418C44506
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:33 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155306.1783358246329179039
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=e2fGENdk;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493c733f15aso33161815e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358244; x=1783963044; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vA0qRadAqKm8Ulip4n91HmRQts1rZN0E3RJa72MR7Wg=;
        b=e2fGENdkCutwRuoOZ8Hv8A+3wRMnqrZInKm0RD6TlXdM/bW4cdAbDHtFc5DNHsOY6K
         ITrx91oQ4HmyLNAXd8Y6phjGdla+bZdP5gjfs5KPtUyT0rVawi9Z7FNzbIh3v2rTYWlx
         Ku7woyFwPvOtWRezTBosk0WbEnCSd/dV/Q8qSpFPCNEiyMT2NDPEWiiNzCTn5NYJ3FWh
         1A/Qge2d34Js6ZnA5f2q8E2hHlUICQgsoZFXC2dDyrNrXtscH06nrlmF5JSvMdU2+fOB
         JhPhfrt6BCcRqPRQ/63YE568d6W1XMuKrS4LHD6G1oX3eLKRXIFGiaYMGx0nt8M9MRcj
         Yifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358244; x=1783963044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vA0qRadAqKm8Ulip4n91HmRQts1rZN0E3RJa72MR7Wg=;
        b=BCceBZrZAZN0KTqkI3OZROcDKSFNyXtUKx5KuTmHl7l/iNKksNd1MRhjly4gOzROvr
         uMAkIJbnj2dzUR9BBSFfrW/SWWJejSYbvh0AMuZkPMnrBfjhmrg+WczGFuMtnx0wWIKj
         EzAgGmE1rYkwzgnEXG1KuTOunFUr31tMLWNstpLEzAIaftkQF048zZNBVw7wlR2H2WbB
         k+KW3tcBvRJpjun4jYtmhdvwB6f6rjHcKSojw1VY14UM0lg4XRfKZnI7KF5l2hkOC/A9
         0KHj42V60Zkqy3gaG3p161axwvCMFVsUtD111OJoWahUgPX46+tHh2fvLJB2JieOiVo0
         7bLw==
X-Gm-Message-State: AOJu0YwUXVun0ilJddCNVE8E16UeO2ukRe6Eq8XOlBpGjNC0m5War0Y/
	fhKit5bfDRmQAlKSp1D58uhsEo65ufm+4d/JCX4+/ojvH5UbgXBkmhxxnvadtA==
X-Gm-Gg: AfdE7ckysNxPgkvs9G5zbVzcSOFFCFOoEqwIXGWxCYcyN44+bMrgbgVSVJ2SSQodk15
	tmed9f9Dje1s1IaeVmBtG83Kq8lAUfUlYTH/BvmjzXKCBE4nBLwrUhov177vrBVZCb4B3a1/8wt
	jYn8Mo/MPp2rhEz2mm0uBOV7vERt8dtBOHgJ9hL6yfMEFWayQhiV3nB/8SuUDVAc3MIV1wS8IWd
	r1M7lASRWJfpbI0dc+HVVytN/IPnHt4BgkNZVoPnoWdFtQOShgAJJs8mFMbklCyJsZJlcbvnRHE
	Y64KWLNbJgsGv5SCZma3cp1WduKYbrCAlSgV9oJIYvSe6usYPosfH9+KeYfKCTFSB0eoEzSr5Vl
	2AKG0zsyFPFFq1+1E1wSEC+V9780NoWr0NHC+dR6UKEacztF2HE9A67jI1RFXBHtgHu63ItbtiB
	dk2mkeMO8I3tFUbeUYN+MSB7xey2ZB1P+1ZGauO2ngyk7tSnNE
X-Received: by 2002:a05:600c:34d4:b0:493:bd73:c77a with SMTP id 5b1f17b1804b1-493df099f9dmr16230215e9.29.1783358244514;
        Mon, 06 Jul 2026 10:17:24 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:24 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 22/45] lighttpd: upgrade 1.4.83 -> 1.4.84
Date: Mon,  6 Jul 2026 19:16:36 +0200
Message-ID: <20260706171701.70536-22-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240308

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../lighttpd/{lighttpd_1.4.83.bb => lighttpd_1.4.84.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.83.bb => lighttpd_1.4.84.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.83.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.84.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.83.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.84.bb
index a1a7bee227..289ecef333 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.83.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.84.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://lighttpd \
            "
 
-SRC_URI[sha256sum] = "b3f878156480079f8a93903bd24d456074a0fbedb9b4d99fcd65df33b1f566f0"
+SRC_URI[sha256sum] = "076dd43bec8f2ba9ce6db7e7ca7e8ad72271cd529805ead2400b56efaa026f70"
 
 DEPENDS = "virtual/crypt"
 
-- 
2.47.3


