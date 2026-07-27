Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F8BC54F57
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:31 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43801.1785192983682785751
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NOjFsgy6;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49557167508so31086505e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785192982; x=1785797782; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qHqvvf2a1aTv9Wx3hEdxQtZgrBUjY4aRWiX+nXmy7oI=;
        b=NOjFsgy6AdJNm8HVs/KEP6Lw3RHvLTdPHVJzVSgjRWINVFdIIU3I+7ltFHl8AkO3rg
         6UR0lZ4WF1WxwpNxz79FAIM8E0lpixJG0bnmqjT05Zjt8K33MMjvoaI4Kw7HEdalFzz/
         MX0h31ygikwrqMKuL9qVWzsUgceekRv46Cs2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785192982; x=1785797782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qHqvvf2a1aTv9Wx3hEdxQtZgrBUjY4aRWiX+nXmy7oI=;
        b=IoMRIdOxAoBmblxzheAn4J3ed2aA70KJXpEbO4dTAado6XjRd1+A3PitKJKlWo2ICT
         dNYY7XGcDU54rsa4joIfTDFZJUK44N+ch6vHXlVtn66tHIXyMO/53nwozcOXz5GoEQCm
         N/YezSkk6LVzNSx3pX8c+3R6W4DLb+BmItLrP66YoqZ9F2qjPUAH88J9nsfYtMatoYIb
         DqAJkJ9qH8pzaQDbfIouILlhvgMpnGZTXrIf7sblpaloq1S4g6djV6OhxDgNkIXvf5Vr
         E9VOChnyVkXHoOGE0ba8WlwlfCIFCO72l0iTAgsLkVodqNSZidSbaI44smR1Pp2Jy4Oa
         RLCA==
X-Gm-Message-State: AOJu0YyboKdMnXGK4WsLCmLjLQsiWGvivHS52gt5jTV4fNtH9lLWzdNB
	rE1rSD1/j/gMs+aGMhY+url216/nDwAFH9zkJadkxrEnxlfHkdiBwDh9G+pBbO6RzCPKn2C+Xel
	z6+vPADU=
X-Gm-Gg: AR+sD11u3kpMyZNj4MT5G0rayt2aBwv0finWE3XyLoTny59KnV6G9bFPJZmFxPT9TOu
	MFlfQSj1tggNiegycv74Kpjou318PUyNwHw4prezxif0W7z0fVD2b3UXrIJUq9/g5nD9jrt53Mn
	kOEUQFezaP7yYnlcfrv1TRRXQUe+nXQLYa53jXYdIR36DCIuptJ70oMuasNvbdpLlpRAimXu/6Q
	Id4JeMl/VfNoMyBorcOnedGKE9UUm3uoWIM2GlIGRKKtImqANgDSVn2HoEuQHLzh5KTh3CZOR5I
	XGDkmmxcGk2y4EbqNfsUGL44gcvd/M2nYA5bJKFnL0ceWfiyoddxPByf1BlZFY55av5ykAcPzko
	tQPi/lzdBsiMwVra7Rp3gs99raq7lrlsXQ8gN87Z0B7TSFGOqqnXeNmdHG9RjM7crwCtLHK2a9i
	4A94+nAJfK8l8a5JOippJgHidmdc8J8DzlSNppwJVL89zg8wISKifP62wXTyuXRaRe3D/MVbSSD
	qAOww==
X-Received: by 2002:a05:600c:6089:b0:495:6482:9d8c with SMTP id 5b1f17b1804b1-496c4fd630fmr8099885e9.37.1785192981950;
        Mon, 27 Jul 2026 15:56:21 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45de1a3sm31513055e9.11.2026.07.27.15.56.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:56:21 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 15/36] python3-ply: set CVE_PRODUCT
Date: Tue, 28 Jul 2026 00:55:29 +0200
Message-ID: <c42d69fb7b5423e423a8f4af7853c32e65b3fb5a.1785190123.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785190123.git.yoann.congal@smile.fr>
References: <cover.1785190123.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242123

From: mark.yang <mark.yang@lge.com>

NVD registers ply as dabeaz:ply, so the default python:ply vendor
prefix never matches and no CVEs are reported. Use the exact
vendor:product pair.

CVE-2025-56005 will then show as unpatched; no fixed release exists.

Suggested-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bb80fef9a76649fb1144408fbc7e2903439cd556)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-ply_3.11.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-ply_3.11.bb b/meta/recipes-devtools/python/python3-ply_3.11.bb
index 2c5fa3f215e..06393ac4fed 100644
--- a/meta/recipes-devtools/python/python3-ply_3.11.bb
+++ b/meta/recipes-devtools/python/python3-ply_3.11.bb
@@ -14,4 +14,6 @@ RDEPENDS:${PN}:class-target += "\
     python3-shell \
 "
 
+CVE_PRODUCT = "dabeaz:ply"
+
 BBCLASSEXTEND = "native nativesdk"

