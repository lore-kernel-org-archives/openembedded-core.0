Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69CCBEE49B8
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 20:12:45 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71917.1767125561538516678
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 12:12:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QQgexOxZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a0834769f0so101048325ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 12:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767125561; x=1767730361; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vd4QfoNoTcd2KswNWOYdKLZqRY1xXFiF3XiExu0RAiw=;
        b=QQgexOxZS3pnKC1h7EiIklYwrOf+9OpzeXMVSUDdOp01BTmAjSqboc5zfYQOLrLmHW
         1d0bkbeTVxUgp/p21kSOVQmilbmWDprktx4BIIPl4ER7MVJH+YXxH5P/31xPif/asfB8
         itqSL0tyozulNlYqu2mAP1vQAhQPuRr5K7M2VNv4ES/yLLaRQ01QmqlMPPrllykgTsI0
         aaHDT/AyPQS0juFC0UWJHQ/hYje9JrMZAwuNsbo/KGmuSKSHA9VGCDaWMjYE45qF6Ha1
         xlOruV5akDxweRVRzxg8LXE1Z0IDdZg3zu9ow4X/cimKVXsDhmye9mB282XnG1czKIAJ
         sKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767125561; x=1767730361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vd4QfoNoTcd2KswNWOYdKLZqRY1xXFiF3XiExu0RAiw=;
        b=oMBnglXZQCBcQeJfaJElKzl39+hWuGpIRimvVQsYYJzE9O2BHdHDGW+zojsXhvSVIs
         24nhacGNYQ3sJMIKT6/9Wu9yGzvLOSXKdLooJNhU99OaAyS1shMH/HHZDXjhYVKemkm0
         o5z8XBUL8TPKWE1Nw4XeGkbehILw2/9UDufIz7ueneIWG6acXidtyP2h8kt7ZjhQOcj9
         rkS336ccRVShgWKlT9mtM3m4c1c5KvJHNcSUh4ADJ1dM7CAGmL8oxXEgAC1OdxzbqS8x
         OwbAeK0Uc37oPHNQgeMu4rJ2qorMV5/Wp5zXetGPKCPcDnSWKD8hab7wC04A0wPgSESK
         3+Gw==
X-Gm-Message-State: AOJu0YzbG1M3ttCW5jXgbkkpCCKophHzlyjOOdr45xn8pt7hVDmmF0Mj
	pVevg4KIJiyehoZP1+oMyF/kkBa19l1EImJegIwpBLzyKP7ThMphEV4FXbpXIt6velyXea+mwh4
	vVgee
X-Gm-Gg: AY/fxX5qXlZAZU7I3zMZ0eGkxhuYlMotzsm9wde04O6QCAco7GKoqEjf6ATkPb65a6L
	BOJkj2yQImnwMRkX6+UJ0vZhxae0anIM9ZuGY53p9X1D0piiQ2SiyEVSGWt/A0eUAalettqxx7q
	Vo0QxdVg1emPbgN1ZQIxKD+IPGkYjzsSn9z0Lk9LmjRidcRItSTcdDNmjgj2Wlj3JXDYM4XqpMk
	+36gJx2ozR8xbwNsItQu1/AXN+f+7t5CXoXvswIrqlAPwQELqBS12Kpl7lI/IfxI8GIqgSeePwD
	Andc2msGOSIJcGJKBV5PltvUt0joJ7/7/zOhxoyDo6YlabHCP3Wp4HtU9m0UHxGlzTHlz8MdbQZ
	LuNtYv58tp5qsVzUmNY/9G+eJs5HFT8oK++8HZ8FB4xkjT3W9KcgG2F1V5E3I4TtN2ezgWQiuM2
	IsQA==
X-Google-Smtp-Source: AGHT+IGtQGymuRnH2fGjun7jsNLHgfqU5O6M7jLXBuoI6KKKvm2AGwGRQASMsGFcVzGW5+jyq3nJ+w==
X-Received: by 2002:a17:903:3c50:b0:2a0:9040:637b with SMTP id d9443c01a7336-2a2f2423178mr358887025ad.26.1767125560784;
        Tue, 30 Dec 2025 12:12:40 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:501f:80a7:5971:3e87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83325sm310391365ad.34.2025.12.30.12.12.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 12:12:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 20/29] gstreamer1.0-vaapi: upgrade 1.26.5 -> 1.26.7
Date: Tue, 30 Dec 2025 12:11:50 -0800
Message-ID: <86918ee5cd3edb4bc2b89e8288fe58c25b389c14.1767106395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767106395.git.steve@sakoman.com>
References: <cover.1767106395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 20:12:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228712

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 7d2536a8a83aa030c41ebac9ae831220906f41a6)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...streamer1.0-vaapi_1.26.5.bb => gstreamer1.0-vaapi_1.26.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.26.5.bb => gstreamer1.0-vaapi_1.26.7.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.7.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.7.bb
index f61125105d..e9515405ce 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.7.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "b42d44db63f3195a6f33296e1ead32c14d01ef27452b7068f1a2d86624f55ea9"
+SRC_URI[sha256sum] = "4885d4a02bb2f17c2af618879b5e77f1acdcedcba859aabd3b970550e2940a38"
 
 S = "${UNPACKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.43.0


