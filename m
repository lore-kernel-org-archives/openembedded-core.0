Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E6D0EE49A9
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 20:12:25 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71902.1767125541011372220
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 12:12:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yEmhLfHN;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a0fe77d141so111425575ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 12:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767125540; x=1767730340; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tXa4U/vz7AAPp8HXNrpUGBEiB5Kh85ZAMPwyHS2j4I=;
        b=yEmhLfHNqiDbU4YUdhdLalSWtsA2Jj7yxbSq5nDIv6OH8IPm7B8DrPV3f2gX2yORyk
         LMtnmJiXMHffGZ6UmxEWl52SQq/UwjQguapjjfBkaKQyo6lkboLSIVxJeLlBFIvWosma
         j4RbUIs7ZGiEt9NukKXGCwQR5WzSCerRBxPnzdS/G5/TMRrQYya7F+yf5+Uy2X+eZKZc
         X2LArf8tM90OMpp8mAM+///HdpWt6qhTnK9qhoQz2g/LXky1oK1jvqIQ9tJF6O4NL1gl
         9gOMvlW23KPqlEXUhuDioCajWxpBKNq761j5Trx8FNs9Qtfe/9+1vM8yT2yEm+SNRaA8
         0bJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767125540; x=1767730340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2tXa4U/vz7AAPp8HXNrpUGBEiB5Kh85ZAMPwyHS2j4I=;
        b=hltRL7ud4xgOYEgDMuS3nBYbHOhZszXtHqcWxmAqBjdHGwXu4W5TIF+EWGZPJqV9Wj
         56Zj0lYRsPu+/qaLOagLSoysnsPljwrN6yetisonVL/FC3zE/VY7uDzav3IjfBjtXpMe
         6d36dS+2C2c7DK80fNxPx86QAY3gmlv8AqiFu1ZhLQuXgu7q/gV5bPbW1FcK7DlCI0gi
         VFT1cPMSNOkTMHE6QOu1pEK0ILe+4Afdh1KdWaBC3i9MJvxB+chmx0k/Mfc2qMToiQNj
         ZFBcLmJ8VhVlaA2XBjK5LorYyJcsY1CC9B8mt/Ji2F4zZ4lpBIR1cbO2+o6Sve4h/q7A
         oRhw==
X-Gm-Message-State: AOJu0YxRNJKdpB1INrhsUaizkyGIXzXZqoZ3t+ccTm/ryy0pFaWqrbb9
	wkCxmVL74ldQhOWl2ciBRRybr4LExAkZGHWHvFEAGGcQZ+c/wFFa3TS5f1gD+ZTs/E/4hdTjK/D
	s4T8V
X-Gm-Gg: AY/fxX5f3TiuP7Jj0m8Ov0h+sUn8MInM4JJZVGPomLlhkNAHUl2gbCEYqw9d3e1Eq4I
	ZNXRcLvRDEOACsxU8XZknk/TEyiDP6RZNGg2FcDOCj6xjThVrBlqXWGv7K7DJDCLPMHVTpzW59x
	N7IO5oMrmCRmWhHY4HBg5me1T514ttoB1p1kPmybDXkxokcFeQoocEaBfkpi76JLJfuWGs1S8O0
	FrYMJqgePs48S4EHqqYBpFJLWvqicSi3/8ODJ/U4X805E6PCQNde3LQA0a7F+yJfctKiHIl6SXR
	ZVLDSxOhYpY3OX2j7GN2PVvhwnUmxL9CA7D3/z6leB+eFppd0ExVc2nc7uNwA79F2pz+2LzMliy
	U+4XYVYxjiqJxg36KZTuUhGS/mHla2zXrFKpddlDiJusEVn2LqtFAqakZRqaCD7EO1256n65f5N
	fpdUfSyS6OfmDW
X-Google-Smtp-Source: AGHT+IFe9QD/z1Vt3ycLXtkGfYhRl4ZhTVoAIoA0gP4YB9FXPmJSWxUmwXPN66SI3XKiSeuWufdDMA==
X-Received: by 2002:a17:903:2f81:b0:295:592e:7633 with SMTP id d9443c01a7336-2a2f2830f7emr314458665ad.29.1767125540205;
        Tue, 30 Dec 2025 12:12:20 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:501f:80a7:5971:3e87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83325sm310391365ad.34.2025.12.30.12.12.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 12:12:19 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 06/29] libxmlb: upgrade 0.3.23 -> 0.3.24
Date: Tue, 30 Dec 2025 12:11:36 -0800
Message-ID: <71a5da375b1c95129fa75bce403909100a58b14c.1767106395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767106395.git.steve@sakoman.com>
References: <cover.1767106395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 20:12:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228698

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://github.com/hughsie/libxmlb/releases/tag/0.3.24

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1316eceb9fef09ad0fdeede0d1772eac38c2261e)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxmlb/{libxmlb_0.3.23.bb => libxmlb_0.3.24.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.23.bb => libxmlb_0.3.24.bb} (93%)

diff --git a/meta/recipes-gnome/libxmlb/libxmlb_0.3.23.bb b/meta/recipes-gnome/libxmlb/libxmlb_0.3.24.bb
similarity index 93%
rename from meta/recipes-gnome/libxmlb/libxmlb_0.3.23.bb
rename to meta/recipes-gnome/libxmlb/libxmlb_0.3.24.bb
index 54df81c718..24eb62c98c 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb_0.3.23.bb
+++ b/meta/recipes-gnome/libxmlb/libxmlb_0.3.24.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
 	file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch \
 	file://run-ptest \
 "
-SRCREV = "65bfb3099beeb7a5ffae995db124f55bea70f41e"
+SRCREV = "d004cca465e5c5af3ce02c02a15978ff02b510c3"
 
 DEPENDS = "glib-2.0 xz zstd"
 
-- 
2.43.0


