Return-Path: <juro.bystricky@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id A04467841B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 17:28:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Feb 2018 09:28:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,465,1511856000"; d="scan'208";a="171825998"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga004.jf.intel.com with ESMTP; 05 Feb 2018 09:28:51 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Feb 2018 09:28:58 -0800
Message-Id: <1517851738-68408-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH] opkg-build: differentiate between compressorargs and zipargs
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
X-List-Received-Date: Mon, 05 Feb 2018 17:28:50 -0000

control.tar.gz is always compressed with gzip.
If data.tar is compressed by a compressor other than gzip, control.tar.gz
may end up compressed with timestamp in the compressed image header.
This would result in packages that are not binary reproducible.

[YOCTO #11242]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 opkg-build | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/opkg-build b/opkg-build
index 7bfdd99..318f308 100755
--- a/opkg-build
+++ b/opkg-build
@@ -149,7 +149,8 @@ outer=ar
 noclean=0
 opkext=0
 compressor=gzip
-compressorargs="-9n"
+zipargs="-9n"
+compressorargs=""
 
 # Determine if tar supports the --format argument by checking the help output.
 #
@@ -223,13 +224,12 @@ done
 
 cext=$(compressor_ext $compressor)
 
+# pgzip requires -T to avoid timestamps on the gzip archive
+if gzip --help 2>&1 | grep -- "-T" > /dev/null; then
+	zipargs="-9nT"
+fi
 if [ $compressor = "gzip" ] ; then
-	# pgzip requires -T to avoid timestamps on the gzip archive
-	if gzip --help 2>&1 | grep -- "-T" > /dev/null; then
-		compressorargs="-9nT"
-	fi
-else
-	compressorargs=""
+	compressorargs=$zipargs
 fi
 
 shift $(($OPTIND - 1))
@@ -281,7 +281,7 @@ build_date="$(date --utc --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y-%m-%d)"
 
 echo $CONTROL > $tmp_dir/tarX
 ( cd $pkg_dir && tar $ogargs --sort=name --mtime=$build_date -X $tmp_dir/tarX -c $tarformat . | $compressor $compressorargs > $tmp_dir/data.tar.$cext )
-( cd $pkg_dir/$CONTROL && tar $ogargs --sort=name --mtime=$build_date -c $tarformat . | gzip $compressorargs > $tmp_dir/control.tar.gz )
+( cd $pkg_dir/$CONTROL && tar $ogargs --sort=name --mtime=$build_date -c $tarformat . | gzip $zipargs > $tmp_dir/control.tar.gz )
 rm $tmp_dir/tarX
 
 echo "2.0" > $tmp_dir/debian-binary
@@ -296,7 +296,7 @@ rm -f $pkg_file
 if [ "$outer" = "ar" ] ; then
   ( cd $tmp_dir && ar -crf $pkg_file ./debian-binary ./control.tar.gz ./data.tar.$cext )
 else
-  ( cd $tmp_dir && tar -c --sort=name --mtime=$build_date $tarformat ./debian-binary ./control.tar.gz ./data.tar.$cext | gzip $compressorargs > $pkg_file )
+  ( cd $tmp_dir && tar -c --sort=name --mtime=$build_date $tarformat ./debian-binary ./control.tar.gz ./data.tar.$cext | gzip $zipargs > $pkg_file )
 fi
 
 rm $tmp_dir/debian-binary $tmp_dir/data.tar.$cext $tmp_dir/control.tar.gz
-- 
2.7.4


