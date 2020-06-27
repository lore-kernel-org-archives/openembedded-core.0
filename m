Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web11.19496.1593301249315212690
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jun 2020 16:40:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: ni.com, ip: 148.163.156.75, mailfrom: prvs=9447524c43=alejandro.delcastillo@ni.com)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 05RNdFFC023413
	for <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2020 18:40:49 -0500
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 31x251h784-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2020 18:40:49 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (us-aus-exhub1.ni.corp.natinst.com [130.164.68.41])
	by us-aus-skprod2.natinst.com (8.16.0.42/8.16.0.42) with ESMTPS id 05RNemwL007767
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2020 18:40:48 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
 us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Sat, 27 Jun 2020 18:40:47 -0500
Received: from delcastillo3.natinst.com (172.18.68.32) by
 us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP Server
 id 15.0.1395.4 via Frontend Transport; Sat, 27 Jun 2020 18:40:47 -0500
From: "Alejandro del Castillo" <alejandro.delcastillo@ni.com>
To: <openembedded-core@lists.openembedded.org>
CC: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Subject: [PATCH 1/2] opkg-utils: upgrade to 0.4.3
Date: Sat, 27 Jun 2020 18:40:45 -0500
Message-ID: <20200627234046.568502-2-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200627234046.568502-1-alejandro.delcastillo@ni.com>
References: <20200627234046.568502-1-alejandro.delcastillo@ni.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-27_10:2020-06-26,2020-06-27 signatures=0
X-Proofpoint-Spam-Reason: orgsafe
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

- Drop fix-reproducibility.patch

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 .../opkg-utils/fix-reproducibility.patch      | 32 -------------------
 ...pkg-utils_0.4.2.bb => opkg-utils_0.4.3.bb} |  5 ++-
 2 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/fix-reproducibility.patch
 rename meta/recipes-devtools/opkg-utils/{opkg-utils_0.4.2.bb => opkg-utils_0.4.3.bb} (92%)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/fix-reproducibility.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/fix-reproducibility.patch
deleted file mode 100644
index 945979bc8a..0000000000
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
similarity index 92%
rename from meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb
rename to meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb
index 9315240190..f9df58a295 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb
@@ -8,12 +8,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 PROVIDES += "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtual/update-alternatives', '', d)}"
 
 SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV}.tar.gz \ 
-           file://fix-reproducibility.patch \
 "
 UPSTREAM_CHECK_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/refs/"
 
-SRC_URI[md5sum] = "cc210650644fcb9bba06ad5ec95a63ec"
-SRC_URI[sha256sum] = "5929ad87d541789e0b82d626db01a1201ac48df6f49f2262fcfb86cf815e5d6c"
+SRC_URI[md5sum] = "7bbadb3c381f3ea935b21d3bb8cc4671"
+SRC_URI[sha256sum] = "046517600fb0aed6c4645edefe02281f4fa2f1c02f71596152d93172452c0b01"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-- 
2.20.1

