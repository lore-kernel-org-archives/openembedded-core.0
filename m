Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.13561.1593279616710191141
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jun 2020 10:40:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SFs1EGGx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id o11so12466371wrv.9
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2020 10:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4+JJwjk6naSLJalORR5wQETXgDeLMAV1yPa3U9xThgo=;
        b=SFs1EGGxxsGgKcpSbImN16xAyyfsmQuwaxSliQcMGJO8OLDK/Gt/SY5q14KTPMO9TE
         t+D/OjnSZCsg7o00HoojddhUJV/lYPjzmvPXw1/vbXeOC7btXXzCY8hfhDulD9YO4/xF
         fx/rK5qGd4UQ2uGehQ/kY1ejMov2xYaXvVWEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4+JJwjk6naSLJalORR5wQETXgDeLMAV1yPa3U9xThgo=;
        b=Rwvhh0OWkKgeoL1WzYxabTceIHC8d4Ud+vXST55JC6CIDVmmZhNm5LK/tRY4r7uuk4
         YQYAMfJhfHo80VWREwLRX/Zb6Xy62coFUlPj2hOqHvYhSMqSjGWNGbMwZ/NOe41HZeD8
         f4MvT0vyxHTlP7PpvZM2qfY00oeTCqNhNSR0clXCEDiywZt/bxNqxfxVT+gMhxp9uGIW
         zB4sFiThvIEp+oTrFngtsl4a0PWecM0Mu2L1OuTzl2nNjAo4cXtt+8GMm6D9tHXUBbTQ
         meMJrhoOXhtV1V/nm3c5Y04VwR7RgN1WduF2zcKf99CAr3uD3IQWh3MJxHP3ft2C4Bkr
         L4XA==
X-Gm-Message-State: AOAM530L/Gg5bpQVCw58N0K2iiomnZQKCWOsP6kzqcBCVGQ1of/BpDBR
	KDpYwb/DLTMKf/4HPQkXLKBAEYvG7exNvg==
X-Google-Smtp-Source: ABdhPJxPykvsEOANpk8fVsSMyOtCe5J+EdHukkwpCLLHZU16NvJVfvweodSIYlPKPmkgUwcxFb2OTw==
X-Received: by 2002:adf:9307:: with SMTP id 7mr9258739wro.414.1593279614739;
        Sat, 27 Jun 2020 10:40:14 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id b18sm12522323wmb.18.2020.06.27.10.40.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2020 10:40:14 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] opkg-utils: Upgrade 0.4.2 -> 0.4.3
Date: Sat, 27 Jun 2020 18:40:12 +0100
Message-Id: <20200627174012.715329-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop one patch that was submitted and merged upstream.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../opkg-utils/fix-reproducibility.patch      | 32 -------------------
 ...pkg-utils_0.4.2.bb => opkg-utils_0.4.3.bb} |  7 ++--
 2 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/fix-reproducibility.patch
 rename meta/recipes-devtools/opkg-utils/{opkg-utils_0.4.2.bb => opkg-utils_0.4.3.bb} (91%)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/fix-reproducibility.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/fix-reproducibility.patch
deleted file mode 100644
index 945979bc8a7..00000000000
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/fix-reproducibility.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Fix reproducibility issues in opkg-build
-
-There is a sorting problem with opkg-build where the ipk generated is depending
-upon the order of files on disk. The reason is the --sort option to tar only
-influences the orders of files tar reads, not those passed by the -T option.
-
-Add in a sort call to resolve this issue. To ensure consistent sorting we
-also need to force to a specific locale (C) else the results are still not
-deterministic.
-
-RP 2020/2/5
-
-Upstream-Status: Submitted [https://groups.google.com/forum/#!topic/opkg-devel/YttZ73NLrYQ]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: opkg-utils-0.4.2/opkg-build
-===================================================================
---- opkg-utils-0.4.2.orig/opkg-build
-+++ opkg-utils-0.4.2/opkg-build
-@@ -305,8 +305,10 @@ if [ ! -z "$SOURCE_DATE_EPOCH"  ]; then
-     mtime_args="--mtime=@$build_date --clamp-mtime"
- fi
- 
--( cd $pkg_dir/$CONTROL && find . -type f > $tmp_dir/control_list )
--( cd $pkg_dir && find . -path ./$CONTROL -prune -o -path . -o -print  > $tmp_dir/file_list )
-+export LANG=C
-+export LC_ALL=C
-+( cd $pkg_dir/$CONTROL && find . -type f | sort > $tmp_dir/control_list )
-+( cd $pkg_dir && find . -path ./$CONTROL -prune -o -path . -o -print  | sort > $tmp_dir/file_list )
- ( cd $pkg_dir && tar $ogargs $tsortargs --no-recursion $mtime_args -c $tarformat -T $tmp_dir/file_list | $compressor $compressorargs > $tmp_dir/data.tar.$cext )
- ( cd $pkg_dir/$CONTROL && tar $ogargs $tsortargs --no-recursion --mtime=@$build_date -c $tarformat -T $tmp_dir/control_list | gzip $zipargs > $tmp_dir/control.tar.gz )
- rm $tmp_dir/file_list
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb
similarity index 91%
rename from meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb
rename to meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb
index 9315240190f..68d069ebd1d 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb
@@ -7,13 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://opkg.py;beginline=2;endline=18;md5=ffa11ff3c15eb31c6a7ceaa00cc9f986"
 PROVIDES += "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtual/update-alternatives', '', d)}"
 
-SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV}.tar.gz \ 
-           file://fix-reproducibility.patch \
-"
+SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/refs/"
 
-SRC_URI[md5sum] = "cc210650644fcb9bba06ad5ec95a63ec"
-SRC_URI[sha256sum] = "5929ad87d541789e0b82d626db01a1201ac48df6f49f2262fcfb86cf815e5d6c"
+SRC_URI[sha256sum] = "046517600fb0aed6c4645edefe02281f4fa2f1c02f71596152d93172452c0b01"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-- 
2.25.1

