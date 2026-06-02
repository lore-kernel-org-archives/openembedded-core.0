Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1017CD6E65
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 08:09:59 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20083.1780387792996125658
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 01:09:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Y+RqyVBg;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-46019edc13dso196377f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 01:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780387791; x=1780992591; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hDJEdbO0CeXzN0ATdDOxHf2yLAY02qMqa4WqKOU96aM=;
        b=Y+RqyVBg+EIQvdYQJg8Y5/CPg2zmNi8vSiDZ/xIKqxTdUN8yd3ylkKqbibuw4HMzJo
         IRpg8ERJojgG6jBitc3rjN/59iyP1+yA7BqJgQHShVVGy8l5+PEZ1IzCzy1sY5sTd5Gq
         WZrK4JHAWQxaoDXRj9fsKd9lwPIsexx+roCx3xZKhTLLak6j+Y5Wacpo5oYfZJbEBGhT
         Jf4k/qmG7b/dPg3A0kvKx/7aK62xJegNY44WtzfwPYP/F16Fy3XT/ahtKy0FXUt/9fO5
         8WpaOD1xYDVoBYLWr24aHDdYFLd8DeH0yLQgLFSrbzTIYeHX2Yf5+OZSSkgYzpQAyGRP
         43Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780387791; x=1780992591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDJEdbO0CeXzN0ATdDOxHf2yLAY02qMqa4WqKOU96aM=;
        b=An9+/enxKakVsna0DWH7olgJrjx5DT2XPucwIvw0JUVkkT6J5lZi3FuALux69W/uIu
         S+TepSeYKytDUKR59AN61SKZbuzjD/U8W7gt085O8KNdao8H+vvwYg6mn1W9lUeyUQeG
         uzva7OWYTkLSFay8i7woXlX03uZoHBxccV7O2t+XbPxGuhsDSBc+8bUHvHQfK+mnBmgN
         d62xtcURn+NdFMCqPbrdqcoEVC1kPki9eTo2vaLRICcu3lRKsayGBoptrBS5hcVNjOQo
         lqrx6p2TCccXWBNSiXpHFaRZIPv0Zp+WvbCpt+1SBk0yVWruSKVvOVsmcJJErKoH/+00
         zlkg==
X-Gm-Message-State: AOJu0Yw+Ddu1kgYSFnPgw0ufP8bb0qmt+7CjFz90VnwEkGXIY3hj4c3G
	jl4BDiOex/VLvsqn6YqfY8ExLIQe5d08Do5fxnj7YL16AF3/YL72WY5uU1SvMg==
X-Gm-Gg: Acq92OGquQJWDWn3wvK5nQnqNuO1XJWCdwm5bB+PCgOFHEpbMrN7mVxSMnlAuMyCG+a
	g5MXfugbvy3EwGDxyFAoCL/uMr7cpcF+v6a6Yb3xu4Rj+4U52ufpE5bThLR4tEftOgm6nLgtpqp
	V19T/7Vr9eve6ALAw0Wapz5YimdeEhVSV8gJT+MKMRUgBvLKYS4t7UlqjlWlG95GnK/Y/cLgb0n
	Ydqzie1CwsfWSEW/z6+1E0OXOIIn0GDUa6DjU2m/XzTls8LgZM3q00eFQFmG33bk143xIra/F7k
	zWGaMmAr7kiFEDi9FML0bWqguh0XGa34ByVtcb+h5g5tASYPea2hMeV8EJahj0PnpLcBGa15wdZ
	NjuEhIH07W4Nd8Q2RZ9dhroGQOAR+PVVkPCDuYuRAOiEqwUTVv3u1Dg3Sg2cAN7T1gPXi4b2UG4
	gnATt7dmNYNippTsh6c5qQOFNl2sB9hsWaIh9yUpmy0H+OIRendPpL1irFTxY/tZf0Uy3RucDev
	4M7DPmNO3Gx9OybEfwz
X-Received: by 2002:adf:fd91:0:b0:43d:77e1:6a69 with SMTP id ffacd0b85a97d-45ef6ba5aabmr18758750f8f.38.1780387790917;
        Tue, 02 Jun 2026 01:09:50 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354bb7asm30658488f8f.20.2026.06.02.01.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 01:09:50 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 1/3] setuptools3_legacy: ensure ${B} is clean
Date: Tue,  2 Jun 2026 10:09:38 +0200
Message-ID: <20260602080940.1053865-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 08:09:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238014

From: Ross Burton <ross.burton@arm.com>

We do builds in a separate directory in this class, so add it to cleandirs
to ensure that it is empty.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/setuptools3_legacy.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/setuptools3_legacy.bbclass b/meta/classes-recipe/setuptools3_legacy.bbclass
index 264b1f5cfb..45f567391d 100644
--- a/meta/classes-recipe/setuptools3_legacy.bbclass
+++ b/meta/classes-recipe/setuptools3_legacy.bbclass
@@ -17,6 +17,7 @@
 inherit setuptools3-base
 
 B = "${WORKDIR}/build"
+do_configure[cleandirs] = "${B}"
 
 SETUPTOOLS_BUILD_ARGS ?= ""
 SETUPTOOLS_INSTALL_ARGS ?= "--root=${D} \

