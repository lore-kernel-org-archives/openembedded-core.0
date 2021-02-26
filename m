Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web12.9988.1614349611212907538
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:26:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ugK6qJT4;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.44, mailfrom: steve@sakoman.com)
Received: by mail-io1-f44.google.com with SMTP id s24so9787017iob.6
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=q1nvLFS3vvozNn/3wVvQJ3+Mp5zNGHlDabvlpZSGEcs=;
        b=ugK6qJT49uoES1DpOovptXp2MGJzgH8v1KFMhioKP2vR4cpxwOHdqIYCdyedpmK3wk
         VXKOxWP3DwGXiOQFXQpun7yuw8jrwwfD45gxB+RLY5rCmvUGIPkfNjUK4w/nMggGYFll
         ncYL2siqqEE7QYfWWm1IXpInP6UBKhzP4QzhpYcL2ef7DftuqvotZd6RNX+kXLS5ZP5d
         DmHvO0qLZTFRTVkZiSzVOzP4Q92ZjbRgPDrbNUlSJvgImua4PosLSWecI0h/WgwITUGe
         9/daL4NjSx/fGnf14aGX995BldckY/aoVbEyVLBeznVHjVr5OBhp732BhAVF31LixNxn
         0NOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q1nvLFS3vvozNn/3wVvQJ3+Mp5zNGHlDabvlpZSGEcs=;
        b=E/6/PF+eJ8iINB6MTPe6VUTcKkOokLEmkzPQzZO8bdl2Zi9XTSeCpz/sN5lH+YEqOB
         muYtOwsPw3ndcLYBwk7mu7UlJfOz1OhReB+AT6kmjtaxFVPuBCvDXI6++CIHFBJ6hBF8
         EP6ZnrCV7s8JGJiBHY51IlYjP2oemQEAQTs8+bKbghKbrP/tLDz0CyJb/DAKDJK9TFBI
         oTbOjnwUDv5spO7HdxqD0aSSho/XAFvz8Ey6nTbuKfe4Nt0q3+vTZ37uJSQxwKcYswkA
         0xqvoBqtgKvZyN6zl9PqBa8tjN88IzXpCvygJ3hXmjrZRjShIs55Ry6/E1qastj5Snec
         5YjQ==
X-Gm-Message-State: AOAM532TU+6hRZ3SON3ilFD6la+8qJnBDu1/t/SyGwCDww+7yjJL+Ml8
	G8Cza7lLx+5PIgLWk0HKbvpOQ5uIpEGhStsN
X-Google-Smtp-Source: ABdhPJzofF3jlkcdfckyDB2w9og6D8qzg7DImuCvc01OpqLHLow9Z57dlBzzsmu7qdlOSTyVCRmZOw==
X-Received: by 2002:a02:a888:: with SMTP id l8mr3142757jam.50.1614349610169;
        Fri, 26 Feb 2021 06:26:50 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.26.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:26:49 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 22/40] watchdog: Fix determinism issue from sendmail host path
Date: Fri, 26 Feb 2021 04:24:05 -1000
Message-Id: <e69b9c2c672986d596f7507bbfadbfc8484807cf.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The build was injecting the path of the host's sendmail binary. Set
this deterministically to match OE's path for it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 476328b91ea4417160580d28df4fcc1147d85ae2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/watchdog/watchdog_5.15.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/watchdog/watchdog_5.15.bb b/meta/recipes-extended/watchdog/watchdog_5.15.bb
index 1acab2e9e7..8b326dfcc4 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.15.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.15.bb
@@ -28,6 +28,7 @@ CFLAGS += "-I${STAGING_INCDIR}/tirpc"
 LDFLAGS += "-ltirpc"
 
 EXTRA_OECONF += " --disable-nfs "
+CACHED_CONFIGUREVARS += "ac_cv_path_PATH_SENDMAIL=${sbindir}/sendmail"
 
 INITSCRIPT_PACKAGES = "${PN} ${PN}-keepalive"
 
-- 
2.25.1

