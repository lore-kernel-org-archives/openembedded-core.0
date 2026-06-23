Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A9BCDB481
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 22:27:15 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32867.1782253632145838082
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 15:27:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rw4vn1gn;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49241dbf9c1so2617765e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 15:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782253630; x=1782858430; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IGleD6hhpZ+IyQpm/s4yTdo4tp1DsJfwgTMKkfLK6fw=;
        b=rw4vn1gnnMQV6jS42+mfeE/SzW9WWH7N2OXP+U/K61M8zOovgTOmdaDR6Tu7R2gV63
         KOL2ztPLBCQoA8GpSn8JHmLdZ8sy8zbKorOluoqZCTfN5C4glICvmILp+lw5XsHlKY5h
         BGA9apJ9ba04Wl0mplz61dL44ca8tbQGo21Lo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782253630; x=1782858430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IGleD6hhpZ+IyQpm/s4yTdo4tp1DsJfwgTMKkfLK6fw=;
        b=clKZED0ozNR5cy82vZ5NaII6UMP3L/LSVz+dVS2eM+WKtQ8z+B5r6Bslti8lwU44Mh
         VtLh58vPQQeHoA5jsrNeJkgMqmxQ02+dGBpsxPNGtsHjAeepwT8DRD9KhnxTFIg0nvW7
         YB5Uf7Cuc9rKFaf/4lD4maDJ9yDA3p1BFNxT/7WjEkB2K9XxZR1bQc/xrBHKlB7z5WGu
         6fjofh4To2EqabfM6go8RMAjBbVSPbHMjn2DMa4M6TD/De7p3I7JyMgTKBbj32MJGby1
         KU40bgTxIHSPw6ONEKoOCYVv/kHOfZwdJOiW+m5gF/EcIBEwwdpbKiOsM4qcN1Er3peX
         Hf0Q==
X-Gm-Message-State: AOJu0YwlUEHlp1qqzLPMzMsmSDPMbZnd0GJfRUbwDQZV5sm0EFGPe+Mx
	oQ282vkSXRSbIWbt67/OIchgfvLAvXqvEynRd7a64NuYHONSUT8i1GAf+BtpUL78mBhULj69GE1
	JjEL9
X-Gm-Gg: AfdE7ck1lJjRsAsWTrlRukB62b/DhSnJBWX9p5iW54hmUEktto44BLAbag6K0ChIrfX
	OsNkxtvgWm8xOtpu8xZZadq1V22h4wr4ymQidwkc1C3VNhyeKsiY/y3u5shUaCQ0n9zTeQC0Kha
	R69dnvHYSVN4ag/Jvew1Fhc90KCu4jxYR2ScDWt5YGeQXfb20+UceGZN6qh9qmkdA2vo6VCu5D2
	xpWPoYw5qGsi8zAmMwqltOjaY+SPQvL+oomPxpaJ/+4WGeRYZeZSy5U/o8uHIuVxz9S6BFHQUK2
	WrC/x6MTGcoSSAfVdYEEQCI4CdWq1wP+5oR/KioCcSBbgdM09LiAShg7H3wUvAwpsKyJLlX0OU8
	pZUyzd0w42BC/aOcoXWHf3E4itwuNyup53EeZmT2WNO3FKyiCxF74j8M6SCZcooHKJBtf+PB9Oj
	LZ9QeTPF+g7nlnccU9J1qPEBWTWoE5ZVrBBX8uh0g+LGFVjO5Frr6bKHY9lDagBKDfdqj92Tw7G
	qr3q/G/D7fop5hu
X-Received: by 2002:a05:600c:1daa:b0:490:da12:f1fa with SMTP id 5b1f17b1804b1-4926087853cmr6258645e9.31.1782253630435;
        Tue, 23 Jun 2026 15:27:10 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0055dd0cae868d89dd.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:55dd:cae:868d:89dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd21dbdsm370786745e9.6.2026.06.23.15.27.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:27:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 23/41] apr: Add CVE_PRODUCT to support product name
Date: Wed, 24 Jun 2026 00:26:22 +0200
Message-ID: <d93c564790a51b53347bde257151c778e8867624.1782252148.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782252148.git.yoann.congal@smile.fr>
References: <cover.1782252148.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 22:27:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239445

From: Himanshu Jadon <hjadon@cisco.com>

apr is tracked in NVD under apache:portable_runtime rather than the
recipe name apr. Set CVE_PRODUCT accordingly so cve-check uses the
correct NVD product identity for APR.

No additional alias was found to be necessary for this recipe.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit bc3803e12d4938e2de514c39bd5d0f011f883ace)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/apr/apr_1.7.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/apr/apr_1.7.5.bb b/meta/recipes-support/apr/apr_1.7.5.bb
index 78796476e22..7a3445aa201 100644
--- a/meta/recipes-support/apr/apr_1.7.5.bb
+++ b/meta/recipes-support/apr/apr_1.7.5.bb
@@ -136,3 +136,6 @@ do_install_ptest() {
 }
 
 export CONFIG_SHELL="/bin/bash"
+
+# Add CVE_PRODUCT to match the NVD CPE product name
+CVE_PRODUCT = "apache:portable_runtime"

