Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9DBDC7892F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 19:03:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 11:03:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,446,1515484800"; d="scan'208";a="32651928"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2018 11:03:08 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 20:55:50 +0200
Message-Id: <20180309185614.31113-12-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
References: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 12/36] opkg-utils: refresh patches
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
X-List-Received-Date: Fri, 09 Mar 2018 19:03:07 -0000

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...ly-use-sort-name-on-versions-of-tar-which-support-.patch | 13 +++++--------
 ...kg-build-Use-local-time-for-build_date-since-opkg-.patch | 13 +++++--------
 2 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-Only-use-sort-name-on-versions-of-tar-which-support-.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-Only-use-sort-name-on-versions-of-tar-which-support-.patch
index 7de4b7f723c..203c5850533 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-Only-use-sort-name-on-versions-of-tar-which-support-.patch
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-Only-use-sort-name-on-versions-of-tar-which-support-.patch
@@ -11,10 +11,10 @@ Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
  opkg-build | 11 ++++++++---
  1 file changed, 8 insertions(+), 3 deletions(-)
 
-diff --git a/opkg-build b/opkg-build
-index 265906f..094d69f 100755
---- a/opkg-build
-+++ b/opkg-build
+Index: opkg-utils-0.3.6/opkg-build
+===================================================================
+--- opkg-utils-0.3.6.orig/opkg-build
++++ opkg-utils-0.3.6/opkg-build
 @@ -232,6 +232,11 @@ if [ $compressor = "gzip" ] ; then
  	compressorargs=$zipargs
  fi
@@ -40,13 +40,10 @@ index 265906f..094d69f 100755
  echo "2.0" > $tmp_dir/debian-binary
 @@ -296,7 +301,7 @@ rm -f $pkg_file
  if [ "$outer" = "ar" ] ; then
-   ( cd $tmp_dir && ar -crfD $pkg_file ./debian-binary ./control.tar.gz ./data.tar.$cext )
+   ( cd $tmp_dir && ar -crf $pkg_file ./debian-binary ./control.tar.gz ./data.tar.$cext )
  else
 -  ( cd $tmp_dir && tar -c --sort=name --mtime=$build_date $tarformat ./debian-binary ./control.tar.gz ./data.tar.$cext | gzip $zipargs > $pkg_file )
 +  ( cd $tmp_dir && tar -c $tsortargs --mtime=$build_date $tarformat ./debian-binary ./control.tar.gz ./data.tar.$cext | gzip $zipargs > $pkg_file )
  fi
  
  rm $tmp_dir/debian-binary $tmp_dir/data.tar.$cext $tmp_dir/control.tar.gz
--- 
-2.16.1
-
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Use-local-time-for-build_date-since-opkg-.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Use-local-time-for-build_date-since-opkg-.patch
index b42d7878c9b..0a7403d6747 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Use-local-time-for-build_date-since-opkg-.patch
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Use-local-time-for-build_date-since-opkg-.patch
@@ -12,10 +12,10 @@ Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
  opkg-build | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
-diff --git a/opkg-build b/opkg-build
-index 094d69f..0050c2b 100755
---- a/opkg-build
-+++ b/opkg-build
+Index: opkg-utils-0.3.6/opkg-build
+===================================================================
+--- opkg-utils-0.3.6.orig/opkg-build
++++ opkg-utils-0.3.6/opkg-build
 @@ -282,11 +282,11 @@ fi
  tmp_dir=$dest_dir/IPKG_BUILD.$$
  mkdir $tmp_dir
@@ -33,13 +33,10 @@ index 094d69f..0050c2b 100755
  echo "2.0" > $tmp_dir/debian-binary
 @@ -301,7 +301,7 @@ rm -f $pkg_file
  if [ "$outer" = "ar" ] ; then
-   ( cd $tmp_dir && ar -crfD $pkg_file ./debian-binary ./control.tar.gz ./data.tar.$cext )
+   ( cd $tmp_dir && ar -crf $pkg_file ./debian-binary ./control.tar.gz ./data.tar.$cext )
  else
 -  ( cd $tmp_dir && tar -c $tsortargs --mtime=$build_date $tarformat ./debian-binary ./control.tar.gz ./data.tar.$cext | gzip $zipargs > $pkg_file )
 +  ( cd $tmp_dir && tar -c $tsortargs --mtime="$build_date" $tarformat ./debian-binary ./control.tar.gz ./data.tar.$cext | gzip $zipargs > $pkg_file )
  fi
  
  rm $tmp_dir/debian-binary $tmp_dir/data.tar.$cext $tmp_dir/control.tar.gz
--- 
-2.16.1
-
-- 
2.16.1


