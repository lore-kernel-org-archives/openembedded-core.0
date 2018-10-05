Return-Path: <mac@mcrowe.com>
Received: from avasout02.plus.net (avasout02.plus.net [212.159.14.17])
	by mail.openembedded.org (Postfix) with ESMTP id 7534D745CD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 14:24:57 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id 8R2HgKX9e4OhT8R2IgDkf6; Fri, 05 Oct 2018 15:24:58 +0100
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=NKr7BXyg c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=smKx5t2vBNcA:10 a=-An2I_7KAAAA:8 a=4RBUngkUAAAA:8 a=iGHA9ds3AAAA:8
	a=Q4-j1AaZAAAA:8 a=1XWaLZrsAAAA:8 a=3aspW2O8d_ctZ45NvIcA:9
	a=Zf9qvvsLL8MA:10
	a=Sq34B_EcNBM9_nrAYB9S:22 a=_sbA2Q-Kp09kWB8D3iXc:22
	a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>)
	id 1g8R2F-0002xc-Mk; Fri, 05 Oct 2018 15:24:55 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Oct 2018 15:24:51 +0100
Message-Id: <20181005142451.9972-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.11.0
X-CMAE-Envelope: MS4wfFAVis45+U9/tBtpLyQKAEXnQaQ8DS7EXbtWof0V9caAHIsDXkBfpb93Nmjtw8V0d3+SBwG+bSre3NlzEbR2T+b5wByts1emQ5Pl9916c8N/5KFvOGV1
	jgzPCVyUaEyIdDTVoN+m/W2ueA6jg3rQXFtBWOFWG26Iprl8My226/Ez
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH v2] opkg-utils: Add support for pigz
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
X-List-Received-Date: Fri, 05 Oct 2018 14:24:57 -0000

Support explicit use of pigz when compressing the package contents by
setting:

 OPKGBUILDCMD = "opkg-build -Z pigz"

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 .../opkg-utils/opkg-utils/pigz.patch               | 51 ++++++++++++++++++++++
 .../opkg-utils/opkg-utils_0.3.6.bb                 |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/pigz.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/pigz.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/pigz.patch
new file mode 100644
index 0000000000..1c141fcf57
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/pigz.patch
@@ -0,0 +1,51 @@
+From ab1436927b47badcd219a5f075dfc848020e061d Mon Sep 17 00:00:00 2001
+From: Mike Crowe <mac@mcrowe.com>
+Date: Thu, 4 Oct 2018 17:54:19 +0100
+Subject: [opkg-utils PATCH] opkg-build: Add support for explicit use of pigz
+To: opkg-devel@googlegroups.com,
+    yocto@yoctoproject.org
+
+oe-core has stopped[1] installing pigz as gzip. This means that in
+order to persuade opkg-build to use pigz it must be specified
+explicitly. Let's teach opkg-build to deal with being passed pigz as a
+compressor.
+
+We can't combine the check for whether -T is required with the one for
+gzip because opkg-build needs to call $compressor and gzip separately
+to construct the package.
+
+[1] http://lists.openembedded.org/pipermail/openembedded-commits/2018-February/218767.html
+
+Upstream-status: Submitted [opkg-devel@googlegroups.com https://groups.google.com/forum/#!topic/opkg-devel/E0WVOhjK61w]
+Signed-off-by: Mike Crowe <mac@mcrowe.com>
+---
+ opkg-build | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/opkg-build b/opkg-build
+index 93a7956..f8403ea 100755
+--- a/opkg-build
++++ b/opkg-build
+@@ -170,7 +170,7 @@ fi
+ 
+ compressor_ext() {
+     case $1 in
+-	gzip)
++	gzip|pigz)
+ 	    echo gz
+ 	    ;;
+ 	bzip2)
+@@ -232,6 +232,10 @@ if [ $compressor = "gzip" ] ; then
+ 	compressorargs=$zipargs
+ elif [ $compressor = "xz" ] ; then
+ 	compressorargs="--threads 0"
++elif [ $compressor = "pigz" ] ; then
++	if $compressor --help 2>&1 | grep -- "-T" > /dev/null; then
++		compressorargs="-9nT"
++	fi
+ fi
+ 
+ tsortargs=
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.6.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.6.bb
index 0487c5f305..cb3775d9c9 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.6.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.6.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV
            file://0001-Only-use-sort-name-on-versions-of-tar-which-support-.patch \
            file://0002-opkg-build-Use-local-time-for-build_date-since-opkg-.patch \
            file://threaded-xz.patch \
+           file://pigz.patch \
 "
 SRC_URI_append_class-native = " file://tar_ignore_error.patch"
 UPSTREAM_CHECK_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/refs/"
-- 
2.11.0


