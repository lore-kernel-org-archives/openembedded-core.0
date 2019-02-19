Return-Path: <prvs=395392ef89=alejandro.delcastillo@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 812167C9F1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 19:44:10 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x1JJg5jo026765; Tue, 19 Feb 2019 13:44:11 -0600
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2qrp7ugc05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 19 Feb 2019 13:44:11 -0600
Received: from us-aus-exch1.ni.corp.natinst.com
	(us-aus-exch1.ni.corp.natinst.com [130.164.68.11])
	by us-aus-skprod3.natinst.com (8.16.0.27/8.16.0.27) with ESMTPS id
	x1JJiAgi010168
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Tue, 19 Feb 2019 13:44:10 -0600
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch1.ni.corp.natinst.com (130.164.68.11) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 19 Feb 2019 13:44:10 -0600
Received: from delcastillo3.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1395.4 via Frontend Transport; Tue, 19 Feb 2019 13:44:10 -0600
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Feb 2019 13:44:09 -0600
Message-ID: <20190219194409.1287-1-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-02-19_13:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [PATCH] opkg-utils: do not set mtime on data.tar.X
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
X-List-Received-Date: Tue, 19 Feb 2019 19:44:10 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Suggested-by: Tristan Ramseyer <t@ramseyer.email>
Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 ...build-do-not-set-mtime-on-data.tar.X.patch | 33 +++++++++++++++++++
 .../opkg-utils/opkg-utils_0.4.0.bb            |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-do-not-set-mtime-on-data.tar.X.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-do-not-set-mtime-on-data.tar.X.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-do-not-set-mtime-on-data.tar.X.patch
new file mode 100644
index 0000000000..6c058c71d7
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-do-not-set-mtime-on-data.tar.X.patch
@@ -0,0 +1,33 @@
+From 42afc1f652d28dce3c5b9915d0cd3087a144e445 Mon Sep 17 00:00:00 2001
+From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+Date: Mon, 18 Feb 2019 11:25:43 -0600
+Subject: [PATCH] opkg-build: do not set mtime on data.tar.X
+
+Opkg should make sure the binaries it creates are created in a
+repoducibe way, but it shouldn't modify the mtime of the binaries it
+consumes. Doing so has side effects, for exmaple, Python pyc files are
+invalidated.
+
+Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+
+Upstream-Status: Submitted
+---
+ opkg-build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/opkg-build b/opkg-build
+index 13782ee..363cd01 100755
+--- a/opkg-build
++++ b/opkg-build
+@@ -301,7 +301,7 @@ build_date="${SOURCE_DATE_EPOCH:-$(date +%s)}"
+ 
+ ( cd $pkg_dir/$CONTROL && find . -type f > $tmp_dir/control_list )
+ ( cd $pkg_dir && find . -path ./$CONTROL -prune -o -print > $tmp_dir/file_list )
+-( cd $pkg_dir && tar $ogargs $tsortargs --no-recursion --mtime=@$build_date -c $tarformat -T $tmp_dir/file_list | $compressor $compressorargs > $tmp_dir/data.tar.$cext )
++( cd $pkg_dir && tar $ogargs $tsortargs --no-recursion -c $tarformat -T $tmp_dir/file_list | $compressor $compressorargs > $tmp_dir/data.tar.$cext )
+ ( cd $pkg_dir/$CONTROL && tar $ogargs $tsortargs --no-recursion --mtime=@$build_date -c $tarformat -T $tmp_dir/control_list | gzip $zipargs > $tmp_dir/control.tar.gz )
+ rm $tmp_dir/file_list
+ rm $tmp_dir/control_list
+-- 
+2.20.1
+
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.0.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.0.bb
index eab74eabd6..9a3e06b92e 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.0.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.0.bb
@@ -9,6 +9,7 @@ PROVIDES += "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtu
 
 SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV}.tar.gz \
            file://0001-Switch-all-scripts-to-use-Python-3.x.patch \
+           file://0001-opkg-build-do-not-set-mtime-on-data.tar.X.patch \
 "
 UPSTREAM_CHECK_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/refs/"
 
-- 
2.20.1


