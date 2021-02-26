Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web11.9988.1614349625803806451
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:27:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=HNreJp9m;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.49, mailfrom: steve@sakoman.com)
Received: by mail-io1-f49.google.com with SMTP id z13so9776153iox.8
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=azBhwq6QXavjtRlhpnx0MqhnP9O3pF3Z5uGLiMIvC44=;
        b=HNreJp9mx7pTH4DK/kMFDE3USQT6NP+4pPi5DoQFfgxZfjI2LT54m87Nhp3r0O6oWV
         U7n06q730yIrPhWNq+v+QovdKlIB8RjqV2N+9q4as41rj4EP4Ky2psXnJs3dS2dcWWuD
         PQA5Wvn8jFw+svCL+wb0NCaUe8LFYEqCMcxjfXlZBVjfgBApQcYUbCWxk7IvWiW7JqyU
         Qz3qXY1C0WjsM1sjLY11RlClH2KD7Jv5DZ8krYLuagh/wPO6E310egvo+T6n4nvbUx2Q
         B4cjUod1lpuQv1Kyyv4oOB/X0AcFvhjZN7WquyzAEmWx64/BYxUU0oqRT3YyVaING6fp
         uQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=azBhwq6QXavjtRlhpnx0MqhnP9O3pF3Z5uGLiMIvC44=;
        b=cm96HRklH5XFJe5OvvMB1LKp6faREkF6n5oAJn+nuRj5Nu+vZaAnkDoiA7EVdztHky
         hIsEQikpe1dxfW8yDMqxDyS0ymms80Q1qVCciAZ5aNuKlMvLpxNDAi9H+MknKgBi1UjH
         ZHESn7hKt43K28PBXNnytkGFKREkXNJpfAT7LtEsV5mYfqgytRHrmOA6xtkIebNVo1RR
         3H7JOX67K0l+IHi+aCEaBlssRqg24uabOpZQfeZXTbpZNyeb5ISawHBvuPqcl/vSMoVa
         sUNYeDJKrT7406i5Dx2v4oudAmJ640/vNbhpnXjqE48EOlH4PfvBR2zPU3ERWLR5RXOI
         6Zew==
X-Gm-Message-State: AOAM530gENWsEpcVbcdn8ow4bUZOi3mU3BOcMfOhVxWEonm3Z3TcVaaW
	2gcaHaypRxbjxXEdFyBmwRJN1dGOjT+Fr51j
X-Google-Smtp-Source: ABdhPJy7O9BhsJgvIDwWaZt+JC82MGHiSRtjj35k52jA0Jr2mwZM7VXA8TiFdd2PKzt+CUuQX0iDQQ==
X-Received: by 2002:a05:6638:2190:: with SMTP id s16mr3154345jaj.106.1614349624752;
        Fri, 26 Feb 2021 06:27:04 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.27.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:27:04 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 25/40] xorg-minimal-fonts: Really fix determinism
Date: Fri, 26 Feb 2021 04:24:08 -1000
Message-Id: <824265580f469e66eb0b415f023660d99b910205.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

My previous fix wasn't correct as the file timestamps do vary by git checkout
or modification time and aren't correct here. Instead use a specific
date/time for the files to be deterministic.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 725a30a30052540a4b7fc2933396fe9eb946eeac)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
index e1e470bf34..bf8385fe6d 100644
--- a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
+++ b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
@@ -10,8 +10,12 @@ LIC_FILES_CHKSUM = "file://../misc/fonts.dir;md5=82a143d94d6a974aafe97132d2d519a
 
 SRC_URI = "file://misc"
 
+SOURCE_DATE_EPOCH = "1613559011"
+
 PE = "1"
-PR = "r2"
+PR = "r3"
+HASHEQUIV_HASH_VERSION .= ".1"
+
 
 inherit allarch features_check
 
@@ -26,7 +30,9 @@ RDEPENDS_${PN} += "font-alias"
 
 do_install() {
 	install -d ${D}/${datadir}/fonts/X11/misc
-	install -m 0644 -p ${S}/* ${D}/${datadir}/fonts/X11/misc/
+	install -m 0644 ${S}/* ${D}/${datadir}/fonts/X11/misc/
+	# Pick a date/time as otherwise it would be the git checkout/modify time
+	touch -d @1613559011 ${D}/${datadir}/fonts/X11/misc/*
 	install -d ${D}/${libdir}/X11
 	ln -sf ${datadir}/fonts/X11/ ${D}/${libdir}/X11/fonts -s
 }
-- 
2.25.1

