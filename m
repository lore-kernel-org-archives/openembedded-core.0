Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web12.26548.1592249782052149132
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 12:36:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=qvmiecEz;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id b201so8273369pfb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 12:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=zfcXPDxrzZmOrbMnB0obVFl6ID2bhXqvsB/U9KBzMww=;
        b=qvmiecEzGSscpmahyFAnIO99T95zCdpqN4NTA/3HlulDdCxdHdv+Rm9xpoEhIYb/3J
         yVp1UtsQcvj7T/4/vIQ37Zm2qESYELPB95RbJ3Kh6Akr+1pk0Z3CclpjDWQtPsdGzdft
         BMnPYocpYkdzVQ/HK14Onh+aff56AIqluujrw5X8EyVvWr4pT4fLXhaeQmFRAqQDZ/8Y
         38YYYh8KBXSDk9AjNF3q66pYioJJRYmQ0ZJyPBfzhZa8zqmuvC6FClCVEELBZnm3iqmE
         I9UsM7qgtEnwpL6M3AgSwhrDfjvOVhN6n8c3+BUUsObAb492JkAnofMrRAGPDbPsZSsk
         eOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=zfcXPDxrzZmOrbMnB0obVFl6ID2bhXqvsB/U9KBzMww=;
        b=kIiOwwtBgttqarKvYgILcK0EzwfggGNqJym6T7M596+LJYBdzLZNdT71y1mAAIE9ji
         MIE/RQFz7lhQJFcNllpLfEY7zJFOVwUjtqsnTebmojTvm3fV2q+wJfDGs0Hwy2OQya0L
         43rs9qy2p/dFz1lkAAfHNw1XLftQv68RYoW5VBkO7PEkFkMHjaqAnDDtL0e+TkWvD6fh
         m1vFU8hS+GrlBC/LPV8gsF+k+ojvMHFOR07XaWB4Tcc47f7yHcNbS6B5d0dg+zElCY9Z
         CTfLFZKOxyIzC9kDy+h6Yhbrk1a53paE2CYKp1ZHf41+g59idL1R2A7/zs5GVnPofakM
         2tTA==
X-Gm-Message-State: AOAM531iRrHuMVpQp46/pR/pl2RocMfSVM5CxLjkIz7YXB2/wGUq4Xdh
	QpUY2Euwv0TwHAKGSB7Q0pNTusS06lE=
X-Google-Smtp-Source: ABdhPJwizDpewJJnZ6cJYy8O+kNsvlbJjIY927S8OLaT9Z5TsZGGUZPMNhEbS4+WU+zFaRe8zC25zg==
X-Received: by 2002:aa7:8ecd:: with SMTP id b13mr25720969pfr.297.1592249781064;
        Mon, 15 Jun 2020 12:36:21 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u1sm12405492pgf.28.2020.06.15.12.36.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 12:36:20 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/21] cairo: Do not try to remove nonexistent directories
Date: Mon, 15 Jun 2020 09:35:27 -1000
Message-Id: <5e33d1d1d655c50a817acda85f2df67c67196daf.1592249381.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592249381.git.steve@sakoman.com>
References: <cover.1592249381.git.steve@sakoman.com>

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Commit 0e1f8fa0 (bitbake.conf: propagate 'opengl' DISTRO_FEATURE to
native/nativesdk from target) changed the default PACKAGECONFIG for
native and nativesdk so that it becomes empty unless "x11" is in
DISTRO_FEATURES since "trace" was also removed (propbably
unintentionally). This highlighted than an empty PACKAGECONFIG would
lead to a build failure since /usr/bin is never created under these
conditions, but the recipe still tried to remove it.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9bb2268677ac8f0c97433bf1f04555abe88028a9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/cairo/cairo_1.16.0.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
index b772c2ece2..8663dec404 100644
--- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
@@ -68,8 +68,10 @@ do_install_append () {
 	rm -rf ${D}${libdir}/cairo/cairo-sphinx*
 	rm -rf ${D}${libdir}/cairo/.debug/cairo-fdr*
 	rm -rf ${D}${libdir}/cairo/.debug/cairo-sphinx*
-	rmdir -p --ignore-fail-on-non-empty ${D}${bindir}
-	rmdir -p --ignore-fail-on-non-empty ${D}${libdir}/cairo
+	[ ! -d ${D}${bindir} ] ||
+		rmdir -p --ignore-fail-on-non-empty ${D}${bindir}
+	[ ! -d ${D}${libdir}/cairo ] ||
+		rmdir -p --ignore-fail-on-non-empty ${D}${libdir}/cairo
 }
 
 PACKAGES =+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
-- 
2.17.1

