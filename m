Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web08.5981.1609856680131225611
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 06:24:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=FHyxnj/h;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id f14so1770464pju.4
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Jan 2021 06:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=eqLdLANpbsAc+Ca3BnCs5Pr3wXMaEO5gedUD3msRtzw=;
        b=FHyxnj/hYbps4A8BK8lmt3nFpju7tQzf3rVOXKw8102vUERceqM+sx/8I1HDlr16Z5
         +V1ZXv8z0pdbXYqBApPWLezNqo13cyKPnBPFp1sU+WGF2AA2DyrDaxCMCotr8MLUgbV9
         YR3EV9ZuphTVwQuR2c2/hskdCDYIfY/SWoofdmSML4OcLIembe8oS96ZNQx8CopOs1Ir
         6NwNJYGT6D75WT6Y0e2W7p3l0QY4di1NemzMMihnwDg9xTTvZquKixBrByTnYXegDfhR
         OWkb5/o8dvCTWyLzyG5us2qb3iQYCokYYPyHS5jK1J9944VyNjYtSvt75zSbsb1hYksb
         GCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=eqLdLANpbsAc+Ca3BnCs5Pr3wXMaEO5gedUD3msRtzw=;
        b=ADglVhn6fSvNdVwQ4l6KCVNitw+TuOBWHFo5HnT0PSAnljF0pn8JFNa0UqB0DToupr
         D7fOp4J+Ec4vFO3w2cxxbLIbiCIcC01m00Ij+2ll7UHn3WWo4GZ6Gz8ZA2D6jLvBX+um
         eA5kf3to3QKgFwNMoulVUyvJ8JkZWc6m4pcFgugAy0nIalls57jiWgvzUv4xNPCvUMsI
         6VJYRN13Os87G1UTnjyQvY0voB27J05OAM33TpGudEbmjaMqcToB3Ygf9w60cVdXW4K3
         9KdTFEyjvvlrSzOWCEszPj3avpZpGjwuzxqyQF+WPFmZw84TfYaapr35ZmgAyDlx0gWu
         +K9A==
X-Gm-Message-State: AOAM530jie/bUzOlbb7ktoEZLwOWEkOmjefRSSnok9Ul0v9yZksTfK0i
	4AsThniRjGZBFWMCrSnBxIYSvPrlH7HZRMnrHZ0=
X-Google-Smtp-Source: ABdhPJx3g54cieVyrDyBKw5nknt6avu4qpp2quNPu2VTYCImPeTaSFOJcKHg+4QsKHQquTJ5q2Yjug==
X-Received: by 2002:a17:902:d893:b029:da:72d4:8343 with SMTP id b19-20020a170902d893b02900da72d48343mr49460999plz.84.1609856679183;
        Tue, 05 Jan 2021 06:24:39 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i130sm57552465pfe.94.2021.01.05.06.24.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 06:24:38 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/30] ncurses: Prevent LDFLAGS being emitted in .pc files
Date: Tue,  5 Jan 2021 04:23:31 -1000
Message-Id: <7b84c9ea009b5452a21233483516de5e070fbe82.1609856435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609856435.git.steve@sakoman.com>
References: <cover.1609856435.git.steve@sakoman.com>

From: Nathan Rossi <nathan@nathanrossi.com>

By default ncurses includes the values of LDFLAGS in its output
pkgconfig .pc files. This causes issues because OE includes options that
are specific to either the build host, or build configuration. These
options are not expected to be embedded in the pkgconfig output that is
installed.

Specifically this change resolves issues with uninative, where uninative
includes '-Wl,--dynamic-linker=' in LDFLAGS in order to force the
building and execution of native binaries against the dynamic linker
provided by uninative. This path is specific to TMPDIR at the time of
build, such that the installed files (and the associated sstate) have
this path. This prevents the sstate from being portable across build
directories/hosts.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ef960d14bd9cecb9a3b50994636fbd455f06104a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-Do-not-include-LDFLAGS-in-generated.patch | 29 +++++++++++++++++++
 meta/recipes-core/ncurses/ncurses_6.2.bb      |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-core/ncurses/files/0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch

diff --git a/meta/recipes-core/ncurses/files/0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch b/meta/recipes-core/ncurses/files/0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch
new file mode 100644
index 0000000000..1eb17767a0
--- /dev/null
+++ b/meta/recipes-core/ncurses/files/0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch
@@ -0,0 +1,29 @@
+From 3b3e87934bb6d8511261d7c3d6e39b4f71849272 Mon Sep 17 00:00:00 2001
+From: Nathan Rossi <nathan@nathanrossi.com>
+Date: Mon, 14 Dec 2020 13:39:02 +1000
+Subject: [PATCH] gen-pkgconfig.in: Do not include LDFLAGS in generated pc
+ files
+
+Including the LDFLAGS in the pkgconfig output is problematic as OE
+includes build host specific paths and options (e.g. uninative and
+'-Wl,--dynamic-linker=').
+
+Upstream-Status: Inappropriate [OE Specific]
+Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
+---
+ misc/gen-pkgconfig.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/misc/gen-pkgconfig.in b/misc/gen-pkgconfig.in
+index 8f00b824b9..009d215663 100644
+--- a/misc/gen-pkgconfig.in
++++ b/misc/gen-pkgconfig.in
+@@ -80,7 +80,7 @@ if [ "$includedir" != "/usr/include" ]; then
+ fi
+ 
+ lib_flags=
+-for opt in -L$libdir @LDFLAGS@ @EXTRA_LDFLAGS@ @LIBS@
++for opt in -L$libdir @LIBS@
+ do
+ 	case $opt in
+ 	-l*) # LIBS is handled specially below
diff --git a/meta/recipes-core/ncurses/ncurses_6.2.bb b/meta/recipes-core/ncurses/ncurses_6.2.bb
index 5c02db8541..76f0cf97f4 100644
--- a/meta/recipes-core/ncurses/ncurses_6.2.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.2.bb
@@ -2,6 +2,7 @@ require ncurses.inc
 
 SRC_URI += "file://0001-tic-hang.patch \
            file://0002-configure-reproducible.patch \
+           file://0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch \
            "
 # commit id corresponds to the revision in package version
 SRCREV = "a669013cd5e9d6434e5301348ea51baf306c93c4"
-- 
2.17.1

