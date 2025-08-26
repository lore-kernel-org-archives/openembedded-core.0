Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86AB1CA0FF6
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 13:41:36 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.64947.1756215695539137880
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 06:41:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZW1V6Pl3;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-323267bc2eeso4199166a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 06:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756215695; x=1756820495; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0PjrJIAroHPPXcLYBQFb5J7B+asCaiZxkbZ9YTk6pM0=;
        b=ZW1V6Pl3LGFTu378nZDvOKfMfSc0xuyR98nx9GNA3OI23iFpc1QCO8W9rTlfoKpZQY
         Z5XMWHmz4tnTXgqTuD1VNbuttOp/4WREx84AAW6ao3my2R64Ur424ud8pxMt1i744CC3
         Y86ajKE7RyHxNuu2WNuRR5z0/ipdzRqrepMd9OStryZefbekF35fajjfLbbrS4JQkijw
         Ne6mnv7+Wy7rImTA4E2WL1y1v7ncLx+7AakYVIjiY52Mh1nlJEhh4ZjCd2xvbp0RRaH/
         j7+pYuC7bkwYrdojoAJlpq9JNuQFQc5z6ZtNPYsp1KKqQNo+uPqo0yzgaRggneh/PiTb
         +B/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215695; x=1756820495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0PjrJIAroHPPXcLYBQFb5J7B+asCaiZxkbZ9YTk6pM0=;
        b=UIz3HX/cSd2n6YscEJqZY98MWv7f+yl+KwknxEaP+B0UlFcBNhUjtWjD5/TdPcAR0K
         JkG/wLYKoHI6MLqTscJv4ArxBEDdl3Ne2BBvCZWznlsUoWPJmgrDUa6c2VwSGbrQJbey
         SNdER32UdyUgu9MiyWKySZ84jVzw9ZYHsRJtgnLiGXdGlCGczvKRTmyarcVHo4z33LD4
         ed1H3GV3RUq8IVexJhQLT0eCf86UV1B4AXciwsHn7J51vkgpZeEepo49ClNOwSGBAmxJ
         KfAGMC/QJJ6cqYsquTHSG3U1ARZbWw1wFX1ekh6v/6AuNK2jT22PqIBO//sUyVyy4SRE
         13Iw==
X-Gm-Message-State: AOJu0YyHN1oismASR8FLeCnLXwfrjv1WHOyWzzFfD39nisg4KQOYUlP8
	p7cjJYZ39gn+JqN66t9t/GjVZ6oLK55iLcVmUVPnZ6ixTH/UE8XuPZKKirX0N4ciKHgx8LtuFXD
	B6i7q
X-Gm-Gg: ASbGnctnNMKBz9rZWtLu/tUenOLaxNxn5i6uJXp00Ay+RFnwHfkjDpYZwza17+iX9N/
	Xw2LGp123V4hWprskmg9ELoQUEUtGEiVWBaZldqwdo359z8BEXYwkK6svkRwkBT+cA1MDynITNP
	Y9tM7z6TvS5kL2VvcaUIaAfb5qTWqEne+uYf3Shb6vyHDECEOv8VMQpqxXZorJHNvH20svI5ZZ/
	RVkJxlP/4JjP67h9VEYlrL+JdKwLUECm0xgqbERsmHUchEn75vxffEYMq1cmvcyrYbSXjrlZJDe
	PZQuYMbt1u/jd1gTypXY+gqOOryWmvE5lKZl5PmlKkMcQW20k4u5AxRozNTao4+vRiaF9VbLcYQ
	d58NsDgsRLX89cw==
X-Google-Smtp-Source: AGHT+IH4DhzR0uz64luMIORed+qk/OAd8oC0lqcnCrImZalnGi4gRcN9UIoBvM9ZKpfyl08aS+z8gA==
X-Received: by 2002:a17:90b:3ec5:b0:321:7a2f:985d with SMTP id 98e67ed59e1d1-32517745990mr18738689a91.25.1756215694405;
        Tue, 26 Aug 2025 06:41:34 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1687:ddce:d4c7:f578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3274191c389sm1007414a91.4.2025.08.26.06.41.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 06:41:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 15/19] gstreamer1.0-rtsp-server: upgrade 1.24.12 -> 1.24.13
Date: Tue, 26 Aug 2025 06:40:49 -0700
Message-ID: <fb4f3b3d2ee5d6098993cf59337b5d982be74b19.1756215509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756215509.git.steve@sakoman.com>
References: <cover.1756215509.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 13:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222455

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...sp-server_1.24.12.bb => gstreamer1.0-rtsp-server_1.24.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.24.12.bb => gstreamer1.0-rtsp-server_1.24.13.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.13.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.13.bb
index b23634dcf0..3a67c05705 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.13.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "a335f73687d2efe22db94348c6893c73b53a2c6bc55ee7a590028ba196ddc623"
+SRC_URI[sha256sum] = "e8dd102a3d1026414f0048daed91078e7958012b56efea7e45fe2b3448b42d6f"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.43.0


