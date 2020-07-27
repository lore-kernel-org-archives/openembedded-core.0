Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.57648.1595862640181913602
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 08:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=LW1wwJL1;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id 1so9211465pfn.9
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 08:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=tSj3ei6Az1U/a1OVAcTBv6j4uhX7E8pslLk9Niaf3gU=;
        b=LW1wwJL1fZJV1R/Ri5nlTJMEZsgr71a2v1YuarOrkMVti92ZppmgkYX3lD/aNUq0od
         TyRJC1yii5LD2U0314GEuXpFPUBxW4m1LcvLSQ37awDGxvmUurEYERlC8GE+3yRNXldJ
         KoKbV7OdspUjvDemG14XMCC8k7IEtX8fVYm/TOQC4nDuSY6+bBqH2myWv9KjNBqcyK1i
         tkkQIEOkpRS8iU8Lr+6GRQ4lcw8c96K2Yq5vinRxO/xOmo9wPilXfFJbA0pSIKdipiUh
         nSm1opLhzPhvmeXn58AH/GomjQtrNZx9d/t2qW8rweLSamAr+eMyiKYn/w9QvxPNsJmi
         ZNDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=tSj3ei6Az1U/a1OVAcTBv6j4uhX7E8pslLk9Niaf3gU=;
        b=siB2SKE04y9/PV4o962j0IlJ53h85daebBqxaq6Y/Ot8wnxg+Av+0hAj5lWdpQvkW5
         T+ziv4jWORZswkQD4AV73gP/XDw4M+TJ5dh7pxe4SQMAx8rKNeslAY6flTz8BEydiIfJ
         Nk7MTtT5JWbYUzo5RLmhaCkCdMBQbb4qMs47k7U+YAc2UIkgLa2yQe0aoNjsThj+dLwF
         tE52VRhrrf580JGsXWdmn3h0HN56/TFkZakHyO8MDYm4gfHVtNQFIJwrsXejWyJDcSCd
         242Mrd69WNhuE5w6FCPawO08eoIh578jGe9IEuZSyJOhYWehMplSlNZOg4zJlomrvQTx
         HABA==
X-Gm-Message-State: AOAM531n18eAeoWJ0WaHCtvC60ikaQzhc12UUIyRNQLKEDWUpG8uRjpO
	IWmzhXRk5s7jiBb8y6VgLOwOdn2t0Nc=
X-Google-Smtp-Source: ABdhPJzQEUuLYyroBgUeY8q8ZDGnC1buzDs3Fz9u/JLs1Pg3VkBoJYbblORBgpl3bnqIYv8KC792CQ==
X-Received: by 2002:a63:745:: with SMTP id 66mr20791304pgh.316.1595862639152;
        Mon, 27 Jul 2020 08:10:39 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id p127sm14929495pfb.17.2020.07.27.08.10.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 08:10:38 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/18] classes/package: Use HOST_OS for runtime dependencies
Date: Mon, 27 Jul 2020 05:09:50 -1000
Message-Id: <2541b5be1e9c2c33ca8017130461a19f8734d883.1595862361.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1595862361.git.steve@sakoman.com>
References: <cover.1595862361.git.steve@sakoman.com>

From: Joshua Watt <JPEWhacker@gmail.com>

The code was using TARGET_OS to try and detect what type of OS the
packages would be running on, but this is incorrect. TARGET_OS is the OS
for which the package will generate output (e.g. GCC output target or
GDB debugging target). The OS where the package will run is the HOST_OS.
Note that HOST_OS only differs from TARGET_OS when doing a
canadian cross compile, and even then in our case only when doing so for
a non-Linux host (e.g. MinGW).

Fix the code to use HOST_OS instead.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f284c5b2df220b520b025a59874e04ef4becd829)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/package.bbclass | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index d4c6a90e84..099d0459f3 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -950,7 +950,7 @@ python split_and_strip_files () {
 
     dvar = d.getVar('PKGD')
     pn = d.getVar('PN')
-    targetos = d.getVar('TARGET_OS')
+    hostos = d.getVar('HOST_OS')
 
     oldcwd = os.getcwd()
     os.chdir(dvar)
@@ -1105,7 +1105,7 @@ python split_and_strip_files () {
     if (d.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT') != '1'):
         results = oe.utils.multiprocess_launch(splitdebuginfo, list(elffiles), d, extraargs=(dvar, debugdir, debuglibdir, debugappend, debugsrcdir, d))
 
-        if debugsrcdir and not targetos.startswith("mingw"):
+        if debugsrcdir and not hostos.startswith("mingw"):
             if (d.getVar('PACKAGE_DEBUG_STATIC_SPLIT') == '1'):
                 results = oe.utils.multiprocess_launch(splitstaticdebuginfo, staticlibs, d, extraargs=(dvar, debugstaticdir, debugstaticlibdir, debugstaticappend, debugsrcdir, d))
             else:
@@ -1667,7 +1667,7 @@ python package_do_shlibs() {
     else:
         shlib_pkgs = packages.split()
 
-    targetos = d.getVar('TARGET_OS')
+    hostos = d.getVar('HOST_OS')
 
     workdir = d.getVar('WORKDIR')
 
@@ -1818,9 +1818,9 @@ python package_do_shlibs() {
                 soname = None
                 if cpath.islink(file):
                     continue
-                if targetos == "darwin" or targetos == "darwin8":
+                if hostos == "darwin" or hostos == "darwin8":
                     darwin_so(file, needed, sonames, renames, pkgver)
-                elif targetos.startswith("mingw"):
+                elif hostos.startswith("mingw"):
                     mingw_dll(file, needed, sonames, renames, pkgver)
                 elif os.access(file, os.X_OK) or lib_re.match(file):
                     linuxlist.append(file)
-- 
2.17.1

