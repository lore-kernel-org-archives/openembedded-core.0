Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB64EE49A1
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 20:12:45 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71913.1767125555545420761
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 12:12:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BN+EDYfD;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a102494058so55293485ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 12:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767125555; x=1767730355; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pDCtT+qKkmsUbD0RvfDg3wZOwRa7pEZoewB4JOZT0Uw=;
        b=BN+EDYfDxF012MnRWivQIxqju33c8BkSSimS+bk4O+Ngh/zqBCZIr32Nzot8c8piQt
         Kw1BSMVwwc9h7AOHbq5sW3uEmi6JxTOwrEnEhIW622y1vTrjXdKAQ1i+FDF4fP0bwMGJ
         grX8WzWIbdUYSJlbkKmD0JHW+l90gctMpL4Z2PBMvkrDcNc4ynaWZRfuklpZalJYg5Sl
         1yWv+sKH9bQkIqEP2mdFSA/rqE6AL3eEYR0XSPrRBfCFLsAsbcZrhAD7CG7iHknb02Nf
         DtsqZD3ypVef52btYWdFfIfNhII+i/jRBA2QLRiGaNUFHuOCZfiur0TjI0xiAsZhh0El
         ShKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767125555; x=1767730355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pDCtT+qKkmsUbD0RvfDg3wZOwRa7pEZoewB4JOZT0Uw=;
        b=Gw37jjqm32tApC8AZtCjbHfkhG/SAT2WAsp2++c549s6Jmapz6kNgookmDMKqUQs+J
         4ftwhl6VKG9iA/IT9ip2QVMB12nxhIX0NJDZdKLRUJMKa6SsQ5WixU/d2xS2XSGD22J2
         kvi7AYrO8bUd9l43gxksZJGxtV5QHacosUCdBcawxfSkc8sl9cppU43GZ+tDY38QnYVZ
         oS3P5s1d1oSUW3cNRfc6qdpnf9JFrHS0bL7LmwHwlzF2WPQhofFuaBM6jRgZoRCSdLqm
         yucvEKqR95vfzAR2B1NcMNiuQjFF6Y+Ovj1e7cI37wPxgpMvo5skcvheASYh0nNoffes
         ZW/Q==
X-Gm-Message-State: AOJu0YwEjRc1KIFBAIfT8DG4rByFU1FFjagKsrbPyRpgFIFEjllIJu0r
	L1m8wRl5ZthMFCAOxSFW+uww+iYByrdaTqKJ+YyQzc+VcQmwFqC9XN1JDCOSAR+sT1N9iqYv+nR
	P/nP0
X-Gm-Gg: AY/fxX4ghK/qblBLjwKZ1qawvbcdtmRQZxbCKyw4Aa89JMeA+UOw/UC99kEzAIbaSTc
	N5T0X5zThk0IaWkMxtrF6s8OE5pTkJ+ftjjHaEnZQ811KD/k7zwxff/GnZUZpwGeAh6obv1uZb4
	hhR1Bg8ovJsyM4DfTyUIEJT8V5fdvTdZWFUuYU2S7ACgH4pz+1Ry9fBS1IOrn7O76Ogezp1D4RB
	gKB3KSj6d5XrZdGUjO1vlYT3JgBm2+YdwqfudwprtVyIDrP9QIpS9xycs2XudI/GU+p2JCRWJYI
	wdgwDWdH79GvRjTZYzb65WdTcL4GOKHoq6pwNXdN76ddkbCQucBPgPq2XmXLoc5KPwGezQyG0jv
	kpozl3QJ1FCCxi9yPuGGiqjJo9TYY0kMAm5e/ikGmQzyF+LegI8VplJmDBdeaVqCstnJI0L6733
	T0fQ==
X-Google-Smtp-Source: AGHT+IF9eJl74bTsIbhmU+rCJzfNG3ofweZBtXAZDaQR37liI4T0fL6PE6q3s7wC37syxBzwAFsz9w==
X-Received: by 2002:a17:903:1b24:b0:298:639b:a64f with SMTP id d9443c01a7336-2a2f0ca9edemr341938965ad.6.1767125554764;
        Tue, 30 Dec 2025 12:12:34 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:501f:80a7:5971:3e87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83325sm310391365ad.34.2025.12.30.12.12.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 12:12:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 16/29] gstreamer1.0-plugins-ugly: upgrade 1.26.5 -> 1.26.7
Date: Tue, 30 Dec 2025 12:11:46 -0800
Message-ID: <45017f7b578c27fa20e3b935084496a61bedff14.1767106395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767106395.git.steve@sakoman.com>
References: <cover.1767106395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 20:12:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228708

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 8d9ba1e3d17294c6df297cb0a200745e3ae76c9b)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ugins-ugly_1.26.5.bb => gstreamer1.0-plugins-ugly_1.26.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.26.5.bb => gstreamer1.0-plugins-ugly_1.26.7.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.7.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.7.bb
index 5583c2f128..fa34912a06 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.7.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "3dfc43435be97e110816bac6d602b0f206a038546279683d9d25372ff127db52"
+SRC_URI[sha256sum] = "11f2e4f34bb2e841dc60edc95581572bc47be0c11e577d12bed98bb1f80a661b"
 
 S = "${UNPACKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.43.0


