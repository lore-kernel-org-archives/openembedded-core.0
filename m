Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.57336.1629305437512835562
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 09:50:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V2fmpfCf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id q11so4508225wrr.9
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 09:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Ol65iIyoHbqbBBtKJLNw/KvYbJa6sl+GLySaFjPYFDQ=;
        b=V2fmpfCfazkLWi1FqA89iLSivMe93dDMs6Q04LipplW3C6mJQMgGzUa/cwtaEHGCww
         UNPSRjwsjhRgLtyY22/vTHncmXTm8E+KVI7JnzAryDFFzzc4u2EAMNaqxAGT98K5nBa5
         5CaBuXfp0OVFuE8FBejPqAzHZGrdybecHlY64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ol65iIyoHbqbBBtKJLNw/KvYbJa6sl+GLySaFjPYFDQ=;
        b=qG4DL/bPLSpxQjWI+4GFYtxA8AFJ/KbRIvEvdUmKCq/gGq49nY0kMaQyHEsgtGKICg
         rgs3DK7wTUt82x15SKsYJFK/OfKkfnVl9iufjs+JgXofR5YtAQJAF/Cua/8ZZ0weIE+K
         Gi/ZFMS9TFI2no4Q4xFM7upcoQ/rioTXuBfiEpV6Y6va9NS5dPpjJ0jBjv/ZO6TU1vOG
         1bGVS7IxmmL/N3q7g4hdchmzWGa97pEbS2KTkohBjWlKkQsZIMMXTf94G1r6DUaGMGKH
         TWqlws35tfpOJtBQ+jYNshZK+qrWhs9UmYR0FtDMDZvsBtJ3T3kUpbG9JFPv8CvvnshJ
         s6Mw==
X-Gm-Message-State: AOAM532w9zuH1Vg/+Sniz6F5nggTqa9lcHl778WNh81xUkmzE7UIMNjI
	eCIgZjl9IbD4siBgOBmNvPePvFlaHh1hjA==
X-Google-Smtp-Source: ABdhPJzA5y1tAkkuQi7gqK6eB5N12qCrYQ6PYfBePJ8evFsKC1/KJyXWtlbE3QpmsyV3rVeGtLnsuw==
X-Received: by 2002:adf:ee0d:: with SMTP id y13mr11583044wrn.317.1629305436065;
        Wed, 18 Aug 2021 09:50:36 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:2c5b:67f4:375e:5ae2])
        by smtp.gmail.com with ESMTPSA id z126sm343363wmc.11.2021.08.18.09.50.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 09:50:35 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] elfutils: Fix ptest dependencies
Date: Wed, 18 Aug 2021 17:50:33 +0100
Message-Id: <20210818165033.3935964-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818165033.3935964-1-richard.purdie@linuxfoundation.org>
References: <20210818165033.3935964-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The elfutils ptests require debug symbols for the libc to be available, else
we see failures such as those on the autobuilder for the fast ptest image
on arm (the dbg symbols are pulled in by other recipes in other images).

Also fix various test skips/error messages due to missing gcc/ld and
development headers.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/elfutils/elfutils_0.185.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.185.bb b/meta/recipes-devtools/elfutils/elfutils_0.185.bb
index 3d103c7c48e..9ea4de8e407 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.185.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.185.bb
@@ -50,11 +50,12 @@ PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
 PACKAGECONFIG[libdebuginfod] = "--enable-libdebuginfod,--disable-libdebuginfod,curl"
 PACKAGECONFIG[debuginfod] = "--enable-debuginfod,--disable-debuginfod,libarchive sqlite3 libmicrohttpd"
 
-RDEPENDS:${PN}-ptest += "libasm libelf bash make coreutils ${PN}-binutils iproute2-ss bsdtar"
+RDEPENDS:${PN}-ptest += "libasm libelf bash make coreutils ${PN}-binutils iproute2-ss bsdtar gcc-symlinks binutils-symlinks libgcc-dev"
 
 EXTRA_OECONF:append:class-target = " --disable-tests-rpath"
 
-RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-utils"
+RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-utils glibc-dbg glibc-dev"
+INSANE_SKIP:${PN}-ptest = "debug-deps dev-deps"
 
 do_compile_ptest() {
 	cd ${B}/tests
-- 
2.30.2

