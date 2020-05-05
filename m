Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.1504.1588648825272141451
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 20:20:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=r8xrQCCf;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id q124so389036pgq.13
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 20:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=6A3ZNSUqX/MSiDyteDiqEvjFgdITxMavIyie0vx+va4=;
        b=r8xrQCCffCaWQW5RvnmnlrBBgL0agl+IxPJMNTHby18z1LZJa2YU5IExd4HtYElzGt
         0BVpffPY9e+r85jz19EsWf8G/sImzXUy7TYQimXLyZ9d6+Ercik8Cb2A8aNYh90wMDrP
         sC9ms569Q1+zVly/C/dX+yc873Ux9xVBTJEwTyX6mjbAIBdUcTlJU2aG65/F9KO6civ/
         kRFtyxTIUHRTpQ/KBzJMCGANcGTOfyYgSErQOacckSEHfWWoO1MfLqnFcECGfYJhIoEd
         cn1LQAdCVvN1iQ3MAoC6So7Kzrr7We1EqN1DwTVTPt/+sReCETIs6SKQBXt4tFxK3JgC
         WVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=6A3ZNSUqX/MSiDyteDiqEvjFgdITxMavIyie0vx+va4=;
        b=rx59BlHJv+CaYPp3tWr4BbldVcl44nHKpEkj7TYZMjs9J5ssExJuTL1Nqzc+CqBh/q
         y7GEFxo5ehG7TPpMREv5/3+17LRgmL/O69i3qNkBfweCT013/C/SBboe3DbE5UOI+GdQ
         UEfk48lIeM+oXXY+MeTA0Wtpwmdk5YK+qfpFaZOFVm6PkwDueEH+UL8XBCg9vPfPaeIX
         wj0jovTgNTUkJlS6LTAnByuiVV2xBDrtfTNVaOATJdLBT0jqi12V1XY1zKFsLlsYiwXi
         MtS8D5R3qUpZXAxuFzZIOca7KFKJ84ne8HjeIfGYvOR4I99s9Jg0dhgii0WCSpcuTTBx
         c6Iw==
X-Gm-Message-State: AGi0PuZ3vZYhYvoxKUVynShnjqZDuU47E0OcfpvR3gj9orWBMeNvnwpJ
	u/bc5e5pKFl3ZqaKonp72jzccMSP6cfu9Q==
X-Google-Smtp-Source: APiQypJcHgO/7oT3u0NZcPbqkxG1PknhEwa+B2+ias0xIbAteENTM0fpFVwqqn6qhzqVkznYuI/PSQ==
X-Received: by 2002:a63:2b58:: with SMTP id r85mr1204690pgr.107.1588648824331;
        Mon, 04 May 2020 20:20:24 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 20sm503379pfx.116.2020.05.04.20.20.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 20:20:23 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/28] binutils: Install PIC version of libiberty.a
Date: Mon,  4 May 2020 17:19:04 -1000
Message-Id: <4e64f0bc62fd81f91d75a1f46230fff7c71650e2.1588638879.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588638879.git.steve@sakoman.com>
References: <cover.1588638879.git.steve@sakoman.com>

From: Khem Raj <raj.khem@gmail.com>

some architectures e.g. mips complain in linking apps which have shared
libs that are linking with libiberty.a fixes errors like below

libiberty/../../libiberty/hashtab.c:285:(.text+0xf8): relocation R_MIPS_26 against `htab_create_typed_alloc' cannot be used when making a shared object; recompile with -fPIC

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/binutils/binutils.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 4119960c63..e93cd50b20 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -152,6 +152,11 @@ do_install () {
 	install -m 644 ${S}/include/ansidecl.h ${D}${includedir}
 	install -m 644 ${S}/include/libiberty.h ${D}${includedir}
 
+	# insall pic version of libiberty if available
+        if [ -e ${B}/libiberty/pic/libiberty.a ]; then
+		install -Dm 0644 ${B}/libiberty/pic/libiberty.a ${D}${libdir}/libiberty.a
+	fi
+
 	cd ${D}${bindir}
 
 	# Symlinks for ease of running these on the native target
-- 
2.17.1

