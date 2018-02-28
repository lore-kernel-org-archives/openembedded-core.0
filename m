Return-Path: <prvs=2597bcfa75=alejandro.delcastillo@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 89F09788F5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 20:36:16 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w1SKaBCp014983 for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 14:36:17 -0600
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2gdqj02815-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 14:36:17 -0600
Received: from us-aus-exch1.ni.corp.natinst.com
	(us-aus-exch1.ni.corp.natinst.com [130.164.68.11])
	by us-aus-skprod3.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w1SKaErh019326
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 14:36:14 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch1.ni.corp.natinst.com (130.164.68.11) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Wed, 28 Feb 2018 14:36:14 -0600
Received: from delcastillo3.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Wed, 28 Feb 2018 14:36:14 -0600
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Feb 2018 14:36:45 -0600
Message-ID: <20180228203645.8305-1-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180222195736.21391-3-alejandro.delcastillo@ni.com>
References: <20180222195736.21391-3-alejandro.delcastillo@ni.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2018-02-28_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=4 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1711220000 definitions=main-1802280250
Subject: [PATCH v2] opkg-utils: upgrade to version 0.3.6
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Feb 2018 20:36:16 -0000
Content-Type: text/plain

0.3.5 -> 0.3.6

Patches:
 - Add support for tar versions that don't support --sort
 - Use local time when setting the modication time on the archives

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---

Changes since V1:
 - Add patch to support versions of tar that don't support --sort
 - Add patch to correctly set the modification time on the payload

 ...rt-name-on-versions-of-tar-which-support-.patch | 52 ++++++++++++++++++++++
 ...Use-local-time-for-build_date-since-opkg-.patch | 45 +++++++++++++++++++
 .../opkg-utils/opkg-utils/tar_ignore_error.patch   | 13 +++---
 .../{opkg-utils_0.3.5.bb => opkg-utils_0.3.6.bb}   |  6 ++-
 4 files changed, 108 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-Only-use-sort-name-on-versions-of-tar-which-support-.patch
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Use-local-time-for-build_date-since-opkg-.patch
 rename meta/recipes-devtools/opkg-utils/{opkg-utils_0.3.5.bb => opkg-utils_0.3.6.bb} (88%)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-Only-use-sort-name-on-versions-of-tar-which-support-.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-Only-use-sort-name-on-versions-of-tar-which-support-.patch
new file mode 100644
index 0000000000..7de4b7f723
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-Only-use-sort-name-on-versions-of-tar-which-support-.patch
@@ -0,0 +1,52 @@
+From ef5db062b7d25e6070acc6922ea48f50491313b5 Mon Sep 17 00:00:00 2001
+From: Michael Hansen <michael.j.hansen@hp.com>
+Date: Mon, 26 Feb 2018 09:42:56 -0800
+Subject: [PATCH 1/2] Only use --sort=name on versions of tar which support it.
+ This fixes compatibility with bsdtar and old versions of GNU tar (e.g.
+ RHEL6).
+
+Signed-off-by: Michael Hansen <michael.j.hansen@hp.com>
+Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+---
+ opkg-build | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/opkg-build b/opkg-build
+index 265906f..094d69f 100755
+--- a/opkg-build
++++ b/opkg-build
+@@ -232,6 +232,11 @@ if [ $compressor = "gzip" ] ; then
+ 	compressorargs=$zipargs
+ fi
+ 
++tsortargs=
++if tar --help 2>&1 | grep -- "--sort=" > /dev/null; then
++	tsortargs="--sort=name"
++fi
++
+ shift $(($OPTIND - 1))
+ 
+ # continue on to process additional arguments
+@@ -280,8 +285,8 @@ mkdir $tmp_dir
+ build_date="$(date --utc --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y-%m-%d)"
+ 
+ echo $CONTROL > $tmp_dir/tarX
+-( cd $pkg_dir && tar $ogargs --sort=name --mtime=$build_date -X $tmp_dir/tarX -c $tarformat . | $compressor $compressorargs > $tmp_dir/data.tar.$cext )
+-( cd $pkg_dir/$CONTROL && tar $ogargs --sort=name --mtime=$build_date -c $tarformat . | gzip $zipargs > $tmp_dir/control.tar.gz )
++( cd $pkg_dir && tar $ogargs $tsortargs --mtime=$build_date -X $tmp_dir/tarX -c $tarformat . | $compressor $compressorargs > $tmp_dir/data.tar.$cext )
++( cd $pkg_dir/$CONTROL && tar $ogargs $tsortargs --mtime=$build_date -c $tarformat . | gzip $zipargs > $tmp_dir/control.tar.gz )
+ rm $tmp_dir/tarX
+ 
+ echo "2.0" > $tmp_dir/debian-binary
+@@ -296,7 +301,7 @@ rm -f $pkg_file
+ if [ "$outer" = "ar" ] ; then
+   ( cd $tmp_dir && ar -crfD $pkg_file ./debian-binary ./control.tar.gz ./data.tar.$cext )
+ else
+-  ( cd $tmp_dir && tar -c --sort=name --mtime=$build_date $tarformat ./debian-binary ./control.tar.gz ./data.tar.$cext | gzip $zipargs > $pkg_file )
++  ( cd $tmp_dir && tar -c $tsortargs --mtime=$build_date $tarformat ./debian-binary ./control.tar.gz ./data.tar.$cext | gzip $zipargs > $pkg_file )
+ fi
+ 
+ rm $tmp_dir/debian-binary $tmp_dir/data.tar.$cext $tmp_dir/control.tar.gz
+-- 
+2.16.1
+
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Use-local-time-for-build_date-since-opkg-.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Use-local-time-for-build_date-since-opkg-.patch
new file mode 100644
index 0000000000..b42d7878c9
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Use-local-time-for-build_date-since-opkg-.patch
@@ -0,0 +1,45 @@
+From 5727826b51cf99feaff3483a9df8af2043e7efc1 Mon Sep 17 00:00:00 2001
+From: Michael Hansen <michael.j.hansen@hp.com>
+Date: Mon, 26 Feb 2018 10:17:01 -0800
+Subject: [PATCH 2/2] opkg-build: Use local time for build_date, since opkg
+ extracts files assuming local time rather than UTC. Also increase resolution
+ of build date down to the second, rather than clamping to midnight of the
+ current date.
+
+Signed-off-by: Michael Hansen <michael.j.hansen@hp.com>
+Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+---
+ opkg-build | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/opkg-build b/opkg-build
+index 094d69f..0050c2b 100755
+--- a/opkg-build
++++ b/opkg-build
+@@ -282,11 +282,11 @@ fi
+ tmp_dir=$dest_dir/IPKG_BUILD.$$
+ mkdir $tmp_dir
+ 
+-build_date="$(date --utc --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y-%m-%d)"
++build_date="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" "+%Y-%m-%d %H:%M:%S")"
+ 
+ echo $CONTROL > $tmp_dir/tarX
+-( cd $pkg_dir && tar $ogargs $tsortargs --mtime=$build_date -X $tmp_dir/tarX -c $tarformat . | $compressor $compressorargs > $tmp_dir/data.tar.$cext )
+-( cd $pkg_dir/$CONTROL && tar $ogargs $tsortargs --mtime=$build_date -c $tarformat . | gzip $zipargs > $tmp_dir/control.tar.gz )
++( cd $pkg_dir && tar $ogargs $tsortargs --mtime="$build_date" -X $tmp_dir/tarX -c $tarformat . | $compressor $compressorargs > $tmp_dir/data.tar.$cext )
++( cd $pkg_dir/$CONTROL && tar $ogargs $tsortargs --mtime="$build_date" -c $tarformat . | gzip $zipargs > $tmp_dir/control.tar.gz )
+ rm $tmp_dir/tarX
+ 
+ echo "2.0" > $tmp_dir/debian-binary
+@@ -301,7 +301,7 @@ rm -f $pkg_file
+ if [ "$outer" = "ar" ] ; then
+   ( cd $tmp_dir && ar -crfD $pkg_file ./debian-binary ./control.tar.gz ./data.tar.$cext )
+ else
+-  ( cd $tmp_dir && tar -c $tsortargs --mtime=$build_date $tarformat ./debian-binary ./control.tar.gz ./data.tar.$cext | gzip $zipargs > $pkg_file )
++  ( cd $tmp_dir && tar -c $tsortargs --mtime="$build_date" $tarformat ./debian-binary ./control.tar.gz ./data.tar.$cext | gzip $zipargs > $pkg_file )
+ fi
+ 
+ rm $tmp_dir/debian-binary $tmp_dir/data.tar.$cext $tmp_dir/control.tar.gz
+-- 
+2.16.1
+
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch
index 75c6f3b8de..d8931b281f 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch
@@ -18,26 +18,27 @@ Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
 
 
 Index: git/opkg-build
+
 ===================================================================
 --- git.orig/opkg-build
 +++ git/opkg-build
-@@ -250,8 +250,21 @@ tmp_dir=$dest_dir/IPKG_BUILD.$$
- mkdir $tmp_dir
+@@ -285,8 +285,21 @@ mkdir $tmp_dir
+ build_date="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" "+%Y-%m-%d %H:%M:%S")"
  
  echo $CONTROL > $tmp_dir/tarX
--( cd $pkg_dir && tar $ogargs -X $tmp_dir/tarX -c --$compressor $tarformat -f $tmp_dir/data.tar.$cext . )
--( cd $pkg_dir/$CONTROL && tar $ogargs -cz $tarformat -f $tmp_dir/control.tar.gz . )
+-( cd $pkg_dir && tar $ogargs $tsortargs --mtime="$build_date" -X $tmp_dir/tarX -c $tarformat . | $compressor $compressorargs > $tmp_dir/data.tar.$cext )
+-( cd $pkg_dir/$CONTROL && tar $ogargs $tsortargs --mtime="$build_date" -c $tarformat . | gzip $zipargs > $tmp_dir/control.tar.gz )
 +
 +
 +# Ignore error code 1, caused by modifying the number of hard links while creating the tar file
 +rc=0
-+( cd $pkg_dir && tar $ogargs -X $tmp_dir/tarX -c --$compressor $tarformat -f $tmp_dir/data.tar.$cext . ) || rc=$?
++( cd $pkg_dir && tar $ogargs $tsortargs --mtime="$build_date" -X $tmp_dir/tarX -c $tarformat . | $compressor $compressorargs > $tmp_dir/data.tar.$cext ) || rc=$?
 +if [ $rc -ne 1 ] && [ $rc -ne 0 ]; then
 +        exit $rc 
 +fi
 +
 +rc=0
-+( cd $pkg_dir/$CONTROL && tar $ogargs -cz $tarformat -f $tmp_dir/control.tar.gz . ) || rc=$?
++( cd $pkg_dir/$CONTROL && tar $ogargs $tsortargs --mtime="$build_date" -c $tarformat . | gzip $zipargs > $tmp_dir/control.tar.gz ) || rc=$?
 +if [ $rc -ne 1 ] && [ $rc -ne 0 ]; then
 +        exit $rc
 +fi
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.5.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.6.bb
similarity index 88%
rename from meta/recipes-devtools/opkg-utils/opkg-utils_0.3.5.bb
rename to meta/recipes-devtools/opkg-utils/opkg-utils_0.3.6.bb
index e9ba9de094..081d8d8b7d 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.5.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.6.bb
@@ -9,13 +9,15 @@ PROVIDES += "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtu
 
 SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV}.tar.gz \
            file://0001-Switch-all-scripts-to-use-Python-3.x.patch \
+           file://0001-Only-use-sort-name-on-versions-of-tar-which-support-.patch \
+           file://0002-opkg-build-Use-local-time-for-build_date-since-opkg-.patch \
 "
 SRC_URI_append_class-native = " file://tar_ignore_error.patch"
 UPSTREAM_CHECK_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/refs/"
 
 
-SRC_URI[md5sum] = "a19e09c79bf1152aac62e8a120d679ff"
-SRC_URI[sha256sum] = "7f4b08912e26a3f4f6f423f3b4e7157a73b1f3a7483fc59b216d1a80b50b0c38"
+SRC_URI[md5sum] = "391c1c80aca26961375dd22e1d2d0cbf"
+SRC_URI[sha256sum] = "26b3f4dd1c1ef65f519d4cddfb35ebea41ae8af989aea2699a39783598c33769"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-- 
2.16.1


