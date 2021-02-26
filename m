Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.10341.1614351088412631988
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:51:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@enlyze-com.20150623.gappssmtp.com header.s=20150623 header.b=i//nLlMK;
 spf=none, err=permanent DNS error (domain: enlyze.com, ip: 209.85.221.51, mailfrom: c.finck@enlyze.com)
Received: by mail-wr1-f51.google.com with SMTP id r3so8825923wro.9
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=enlyze-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ihtRvKoz+MHpCBTSYmxJaBnD+oC7zbB/1nW4tzBWXYc=;
        b=i//nLlMKkGmI16gk1NdMqM3ML10TPRRsHZ6/spYMf+eB5RhAeGk61RPpsQrgQsVuSR
         7+342EaP7Y3Ln5JVmOmq189j5xknqfL9k2nDC0fANGR49tmXInu77CfHg7k9gFxx4Xmn
         x2aKH88cTw7AAfX41818zxsOkaKdVS7P3uCkTI/3D9DNJdntVy2W51TpRvOhOXHhjBL2
         6fLlNZQBrcTwEB/DfJFmKAMS/wk3CXT5qBUwAzWn41F6TJvuWsokU/mCmMaskeJOFths
         vll9Wbo2+A+0dz//KcPr+wHp83HVXwzOx2+Hkn3VYeWgW7rgnRXy4+Cny+/msQdIi8HH
         CvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ihtRvKoz+MHpCBTSYmxJaBnD+oC7zbB/1nW4tzBWXYc=;
        b=PMjbokMZNXeQk+mPcwlUvzhg0Gn/08Nped7b0C4XKkGb6bCrxyNj4jmw1terGZg8LU
         0LX59z3hojm0HacGdaRDCBStmr2ogY3mY0X0cAAFc7sdUVEYqN/kLOSlrGl7uQubnwpb
         mNvAzWnut1spr892Nlzori1kb4xH6lStvZxgeizndu4AA5GlvyA8d1hueMJPctvP4Q+m
         G/rxGk4adz/Jglllyy6/BdCHxUd8FNTt4fFl2KbKfwpe5ZC1BYJdUNZ4TnUrNm4UUXUw
         vPcaZWVE0BFKLyhGuifZDP3uIDH1IcR+F+zSiCVCIpQb5il5GDuv74mbi8YOoJcl3v6C
         MBxw==
X-Gm-Message-State: AOAM533tRDTJve07bMV5Crst1qhYvbq2MVtsssG1uESadYcY+w32Pzbt
	yoOCKdjAW0g0B4casOzkUIOdncLT3R2sM5yO
X-Google-Smtp-Source: ABdhPJwY81fWWyDTeMyLK7ogD/TjWM8/vGuo75NDdyORe2jX4ovam0t+yJFRVeTfsvnXelfUdCPuDg==
X-Received: by 2002:a5d:62d1:: with SMTP id o17mr3709789wrv.111.1614351086702;
        Fri, 26 Feb 2021 06:51:26 -0800 (PST)
Return-Path: <c.finck@enlyze.com>
Received: from localhost.localdomain (xdsl-78-35-205-164.nc.de. [78.35.205.164])
        by smtp.gmail.com with ESMTPSA id c3sm13570215wrr.29.2021.02.26.06.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:51:26 -0800 (PST)
From: "Colin Finck" <c.finck@enlyze.com>
To: openembedded-core@lists.openembedded.org
Cc: Colin Finck <c.finck@enlyze.com>
Subject: [PATCH] dosfstools: Upgrade to 4.2
Date: Fri, 26 Feb 2021 15:50:39 +0100
Message-Id: <20210226145039.447-1-c.finck@enlyze.com>
X-Mailer: git-send-email 2.28.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The new version has an internal CP850 conversion table, hence it doesn't
depend on gconv or iconv anymore.
gettext-native is still required for the AM_ICONV automake macro though.

Most notably, dosfsck 4.2 no longer marks directory entries created by
mtools <= 4.0.19 as bad, thereby rendering lots of FAT boot partitions
(Raspberry Pi/UEFI) unbootable.
mtools <= 4.0.19 is part of "warrior" and earlier and used by e.g.
meta-mender during build. Therefore, many affected FAT partitions can be
expected in the wild and a backport of dosfsck 4.2 is highly recommended.

References:
* https://github.com/dosfstools/dosfstools/commit/87a8f29785bb605350821f1638a42e6cf3e49ce3
* https://svn.savannah.gnu.org/viewvc/mtools/trunk/direntry.c?r1=363&r2=452

Signed-off-by: Colin Finck <c.finck@enlyze.com>
---
 .../{dosfstools_4.1.bb => dosfstools_4.2.bb}         | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/dosfstools/{dosfstools_4.1.bb => dosfstools_4.2.bb} (72%)

diff --git a/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb b/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb
similarity index 72%
rename from meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
rename to meta/recipes-devtools/dosfstools/dosfstools_4.2.bb
index 4bd4aef099..445f4cafe8 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb
@@ -8,25 +8,23 @@ HOMEPAGE = "https://github.com/dosfstools/dosfstools"
 SECTION = "base"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+DEPENDS = "gettext-native"
 
-SRC_URI = "https://github.com/dosfstools/dosfstools/releases/download/v${PV}/${BP}.tar.xz \
+SRC_URI = "https://github.com/dosfstools/dosfstools/releases/download/v${PV}/${BP}.tar.gz \
           "
-SRC_URI[md5sum] = "07a1050db1a898e9a2e03b0c4569c4bd"
-SRC_URI[sha256sum] = "e6b2aca70ccc3fe3687365009dd94a2e18e82b688ed4e260e04b7412471cc173"
+SRC_URI[md5sum] = "49c8e457327dc61efab5b115a27b087a"
+SRC_URI[sha256sum] = "64926eebf90092dca21b14259a5301b7b98e7b1943e8a201c7d726084809b527"
 
 UPSTREAM_CHECK_URI = "https://github.com/dosfstools/dosfstools/releases"
 
 inherit autotools pkgconfig update-alternatives
 
-EXTRA_OECONF = "--without-udev --enable-compat-symlinks"
+EXTRA_OECONF = "--enable-compat-symlinks --without-iconv"
 
 CFLAGS += "-D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
 
 BBCLASSEXTEND = "native nativesdk"
 
-# Add codepage437 to avoid error from `dosfsck -l`
-RRECOMMENDS_${PN}_append_libc-glibc = " glibc-gconv-ibm437"
-
 ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_${PN} = "mkfs.vfat"
 ALTERNATIVE_LINK_NAME[mkfs.vfat] = "${sbindir}/mkfs.vfat"
-- 
2.28.0.windows.1

