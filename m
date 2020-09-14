Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web12.61412.1600092740443632657
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 07:12:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=xj5m33Jc;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id k15so12724605pfc.12
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 07:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=1ljS3TygyB2GXTpMOJtfb63EnpDfUt4l6bH1LUUaRTQ=;
        b=xj5m33Jc5y8ASQ/2WcxNquzNsSKhnVlt9ilvh4kpSBOv1XZAGAgxKZzPmRmQDI94s2
         VN2RwVhET1MiTTxaQkTxn9jzM1ubLEz4iBlBrpHMG8CQuRJDm0DhF77eyOXrQl1BK0S2
         13R95O6fmWV2uoWY89DPCbbt31Vapcd+5beU0lPbkBuOhl9EKRihZYT0IjGcKKNmYU5w
         xr/Az6JJ/DxF/BwYhCjSQIpkbpbL5hkUTiel/yKIzCl0B1ERxSBhFaEWrY78+cTNFFLa
         mQ6PugWViLcQONEMUByULZHrqWS7L+/kIyqhTO9MS01C4x2SLZZQfZmHaZKdtzS4ku0t
         UZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=1ljS3TygyB2GXTpMOJtfb63EnpDfUt4l6bH1LUUaRTQ=;
        b=tTlvqxwQ1wxg5Ii/luA5LStb8WoC+dcoscpNh/PJTg0JwUDmSjon+AF2EsxY2H5zMD
         usCw51NoCAm8qsCDQMse1SPQhToomTVPB0AlapZWeL6n5qgrBtyes4yN1CseG0LRQQqx
         SZ87qNESiplQ4IZcy7x2LJeRtImw8NSxMQrAn9GCNsG+XYDrxu7hQAW1y1aC6FmLFM83
         bTdbBIX0bM6OgHsBwHa7DGVJ7oZblLAMWS+y6w1KC8WygZ+hWyUDrNsCHSVoceOE/CMF
         gvrSiz4z/B/jv745rl7fGIZ+lAQUhIKJTmnqrSizJZvbFzRcVJePEVvDNFK9t+VfyeL2
         3WvA==
X-Gm-Message-State: AOAM533wecNSKG2nb+VooNKTaaswMwwCZTsVlLbA9YGi9nB45KQEmmgM
	IO7JiY6BvdDavoKDjZgNmtgVwYgltC7xJBnhljQ=
X-Google-Smtp-Source: ABdhPJyYDMREEFx+fNcNW2Jts041jbnNsmghS8sMXbApOPGfaaPEVMZngoO02htRAzwO1Lq3amVVBQ==
X-Received: by 2002:a17:902:9a41:b029:d0:cb2d:f275 with SMTP id x1-20020a1709029a41b02900d0cb2df275mr14906544plv.14.1600092739633;
        Mon, 14 Sep 2020 07:12:19 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id z22sm11053183pjq.2.2020.09.14.07.12.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 07:12:19 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/24] insane: only load real files as ELF
Date: Mon, 14 Sep 2020 04:11:25 -1000
Message-Id: <0b6f03752e6581a15e5fb900a8de7aef78709ef6.1600092418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1600092418.git.steve@sakoman.com>
References: <cover.1600092418.git.steve@sakoman.com>

From: Ross Burton <ross@burtonini.com>

The file path checks are passed an ELF object if the file is an ELF. It
doesn't make a lot of sense to load symlinks to ELFs as if they're in
the same package then the real file will be checked too.

This should speed up do_package_qa slightly as libraries won't be
scanned repeatedly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c63af30d3b6350361daff94a59d4f14d7c5395e1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/insane.bbclass | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index c595080bdf..46d386a38b 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -708,12 +708,13 @@ def package_qa_walk(warnfuncs, errorfuncs, package, d):
     warnings = {}
     errors = {}
     for path in pkgfiles[package]:
-            elf = oe.qa.ELFFile(path)
-            try:
-                elf.open()
-            except (IOError, oe.qa.NotELFFileError):
-                # IOError can happen if the packaging control files disappear,
-                elf = None
+            elf = None
+            if os.path.isfile(path):
+                elf = oe.qa.ELFFile(path)
+                try:
+                    elf.open()
+                except oe.qa.NotELFFileError:
+                    elf = None
             for func in warnfuncs:
                 func(path, package, d, elf, warnings)
             for func in errorfuncs:
-- 
2.17.1

