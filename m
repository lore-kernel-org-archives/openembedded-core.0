Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 793BDCA0FF0
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 13:41:36 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.64945.1756215694005387838
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 06:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0HmJ0Tlo;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-324eb9cc40aso4210729a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 06:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756215693; x=1756820493; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gAWg3ys2sqaLVTWubBVxS9LkDHAke0EFJwkdMjB7kvY=;
        b=0HmJ0TloozDx7rV6o3vbwh++xv3SjvC0LsVMMNClcxDpXFJs1+er3I79G2Bg2yFNO+
         3+kVkLTcwaHwLPneh9bC411iSylGCalqZrAxtApUue2ox+sFbUmANFna3xApO2UpC8vS
         9cRa+tKLHuyITtCwDJL/u6dNXG3iQkz6uBRwGQ/NLRsKW8N3vDAENbjW+tG5QCHDEQBY
         tM58pips12vehV2yP72qMOBmCwzcUQEqRPAPfoHHONN9Euc/rBRGQcgcfLPFjPzD8dC7
         wSBcZARyo3turqCr7diO5qL1pCfqi+/B1fSwbGuVly0VkEzzN2IjaECBlrn9ki7wZpaG
         0lUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215693; x=1756820493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gAWg3ys2sqaLVTWubBVxS9LkDHAke0EFJwkdMjB7kvY=;
        b=Q8sGIlZR8GE0OmRA1MvOxhwu20YWnnR/eSq8RjS8gyX+Uv9sop0WDxs0IgIWn+159s
         uQ9+FkHwmta4lZHvwppTSkWMP+2KCvZdA5gpyOwUdJ6UOGRBeDAeJ5sZ1BEvqmflh+pp
         j+Q+sIt5eBZpq5p7IAbQF5CD9nvnInXUokkJzcGwP6VV8XUcoi7axJutpeWjAYSskHCz
         vbXQTTQqph8HVZMdMeTyTi4+a/hkdc4AojQyKSM/2WQoubUJ/VPIcsCIVKf3HTVNE0vf
         YMJBv8jW12owKfvpoWmDaRTChS8gV7/jxh99bzm6Ye/9c/DTVUD2ha+SqyMkvFp2U7AN
         dU/Q==
X-Gm-Message-State: AOJu0YxZbMMjgBEOc4rI1vXqopEYc+QrH9NCE9Utr2NqxgyHbSQFz3mf
	qqHkZB7PiSvnHSbdBsFGaM+hA0/ykSsOtTfRvP//XZ/3MrL+d/Jn6N15DxZOI9BGix0LNmwcF/7
	VeNU8
X-Gm-Gg: ASbGncv9yzT9dVcCYYBircmOU+aYcTs9K6SCI39B49f5Ro/TxXKrh+CN2SlOjwFbyFI
	7WhZRqhlexpPy9eSenky5ibAKCbh1wMaJAdxGtHYbL3K/ItsyZ+BA6zXjMcgdOCvtiGprwobNMe
	Nogvjyu7dMs6/YcbcLl9HEnqxKuInV6OVdwbKLOBQxo30cozjFB2LfC+Bz+ace4RL2sEjAE5VYW
	iBCq5wKXcKgXpWsPo/Ux8mWB2UJQWEiQlhkt80ovPnE0YSkGTC7ncDd9ibAndgUqclKo52AvveN
	XaVp6dpbKRHHX/uHcW6Lt7bnrB4fS63xyZHKowPI3S8xzZVzsRRc2eAPbLkouTH59MOsplbgv/5
	yywcQp78gUKboegpEwgv/C6ci
X-Google-Smtp-Source: AGHT+IFHOURHiF7M/B5nYjSh1oXLbIQx1tAC5vHFp5/qSQuIRwqKc9BF9Qh1KHXWl5uGll33jj37Jw==
X-Received: by 2002:a17:90b:4b8d:b0:325:3ada:b385 with SMTP id 98e67ed59e1d1-3275085f383mr1887293a91.8.1756215692992;
        Tue, 26 Aug 2025 06:41:32 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1687:ddce:d4c7:f578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3274191c389sm1007414a91.4.2025.08.26.06.41.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 06:41:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 14/19] gstreamer1.0-python: upgrade 1.24.12 -> 1.24.13
Date: Tue, 26 Aug 2025 06:40:48 -0700
Message-ID: <c5742f1c6037c588e91011883b8cf5af6bd360a5.1756215509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756215509.git.steve@sakoman.com>
References: <cover.1756215509.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 13:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222454

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...amer1.0-python_1.24.12.bb => gstreamer1.0-python_1.24.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.24.12.bb => gstreamer1.0-python_1.24.13.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.13.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.13.bb
index f62cb159c2..542b273039 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.13.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d679e2ca3e655a7328627c4670c324fc22f588d2cb8ecd2fa7a6a42df51132cc"
+SRC_URI[sha256sum] = "abb9a1edc11d67a463b6cef7b74a8b10ea6c342760c012d597102a7bfb7e09da"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.43.0


