Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F2DCAC5B0
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 13:41:20 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.11865.1758807673229259381
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 06:41:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PiBK18EO;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3324523dfb2so908853a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 06:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758807672; x=1759412472; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3odeXumc+Yd2J9PSC6g23yN5HIxWp5JpW6rY+NI4cE=;
        b=PiBK18EOhc110Q5XmFw6aWLyo8smidyUVVlBIxertjtlKu9f6bQYhLqqjwglNRc9zg
         7bUOw77ks2QXvIPwNyaRgxClmqYc4BQg/VrrSp8fkwerj+PY0HnXMB+Of6AQTUzhKyHZ
         /M9a56oMcrFnkykccXJZejq+bS5clGkLrV3buDTLFc0noHutybLOjZphMa7ngEpyeVyt
         ncaJNxMj3C5D+ejJeAuqhmaJSPlMVqdKYace49Krodq0cSEvHd8Tr3pTUzNTDLAQ71z1
         0QbXt0X/KeluK5TymtAQhXblM9VUVemHemrlCVB2DGb1x+Q4Rxz5qP7N4fzMGLrN55dS
         IJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758807672; x=1759412472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n3odeXumc+Yd2J9PSC6g23yN5HIxWp5JpW6rY+NI4cE=;
        b=wG0/OSNcVmCzPl/Sg4CX+zQmphTAmL5BktqY3vn8huRMLL5+8V2T0JVJ5/50W5QFPf
         jHtiwffZdr+Kq1P3DQ1AMA8Cjw4eUUz5Ocws5z/ziyBsCO0/QRN0vXemoluYF2oiB2fY
         8UI/HkT+l9gGRG0Iuiy/aeJnqKtQAdfoqtTNZnDUCJJdmmQ+iY3rqkUCaK1KsnSTfqLS
         IM8q0HVPKbI9krQ/ceiKmo9owi7rOL8/MMMWIW3ovl2YYkfLhUjf8w/r58S/MbfSWoK1
         l3Jl2E3rcBvV5Bqvdhdp+6CS2OtQbpuVOxskwMdKHhU1zKHqGGIOYH4KTK8Liw5K3SuK
         5EpQ==
X-Gm-Message-State: AOJu0YxEErZFj5VcQcyNsGhzp1qJNDzrMqk8u2gO3fZAc1DWs0SrgfqO
	f7X8IpHalCKBTIoDR7kl5WzQu4gRo6c0qBezylJLFqt+VZnP8bse9TMV5+W/J3VoDnWNaG0KrnY
	nTJJB
X-Gm-Gg: ASbGnctOUCSxtdEWsHDsY/0EXKzMZhYxquji7g6rk3M0B6IbcD2PI5kBp+ih4W6U7uz
	EY/gfiSbna9Ma4MljeCkXrSSwkkOnC1DZAXLd+RioUS3HWo+PqRBijhgKgEyPbPbe/2xD4IFprK
	akMH17kN8+JuJxkzQaGqR2sDil+ObYcjh/dQW9+oujhiNyIWvflIw6rp7u5WU66QnIb0xkonmv7
	IE5Qy19hEdbA6fCH2FYzmNOqf0Ne+JS7hmi05efA2mVQmaUdfh76v48yIeXf2wxWLpCUiJio1UD
	2J9/0b4T6IKMU9qdWaq1vXIChlpP8+j5WzGxkJ8iry2AZ96Wx0iXSmsM3xVac72pzWsq72RTEEj
	n7R9EKulXX7OlZw==
X-Google-Smtp-Source: AGHT+IGhS7B7z+7PCWyuZ9l3+tfQqOd6nnDzxp4yKeunTa207CPL7H/8ay/ZYdHYGD3Mw43rxoXd9Q==
X-Received: by 2002:a17:90b:3852:b0:32e:24cf:e658 with SMTP id 98e67ed59e1d1-3342a22cdc9mr3932506a91.3.1758807672410;
        Thu, 25 Sep 2025 06:41:12 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:127b:348d:dc99:9937])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3346e9eba87sm2430014a91.0.2025.09.25.06.41.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 06:41:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/11] lib/oe/utils: use multiprocessing from bb
Date: Thu, 25 Sep 2025 06:40:50 -0700
Message-ID: <92369c8acf0b4d6c2ced88abbda5f5defd276ba2.1758807463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758807463.git.steve@sakoman.com>
References: <cover.1758807463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 13:41:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224024

From: Martin Jansa <martin.jansa@gmail.com>

Fixes build with python-3.14

It was added to bitbake in 62be9113d98fccb347c6aa0a10d5c4ee2857f8b6
and oe-core now requires latest bitbake already, so we can use this.

[YOCTO #15858]

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/utils.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index c9c7a47041..437a2d51c7 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -5,10 +5,11 @@
 #
 
 import subprocess
-import multiprocessing
 import traceback
 import errno
 
+from bb import multiprocessing
+
 def read_file(filename):
     try:
         f = open( filename, "r" )
-- 
2.43.0


