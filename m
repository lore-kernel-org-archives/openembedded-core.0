Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3125160796
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 03:22:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v8L3MixO006679
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 20:22:44 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 20 Sep 2017 20:22:42 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Sep 2017 11:21:39 +0800
Message-ID: <1505964099-5570-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [PATCH] tiff: Security fix CVE-2017-13726 and CVE-2017-13727
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
X-List-Received-Date: Thu, 21 Sep 2017 03:22:43 -0000
Content-Type: text/plain

References:
https://nvd.nist.gov/vuln/detail/CVE-2017-13726
https://nvd.nist.gov/vuln/detail/CVE-2017-13727

Patches from:
CVE-2017-13726:
https://github.com/vadz/libtiff/commit/f91ca83a21a6a583050e5a5755ce1441b2bf1d7e

CVE-2017-13727:
https://github.com/vadz/libtiff/commit/b6af137bf9ef852f1a48a50a5afb88f9e9da01cc

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libtiff/files/CVE-2017-13726.patch             | 54 ++++++++++++++++++
 .../libtiff/files/CVE-2017-13727.patch             | 65 ++++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.8.bb      |  2 +
 3 files changed, 121 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-13726.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-13727.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2017-13726.patch b/meta/recipes-multimedia/libtiff/files/CVE-2017-13726.patch
new file mode 100644
index 0000000..c60ffa6
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2017-13726.patch
@@ -0,0 +1,54 @@
+From 5317ce215936ce611846557bb104b49d3b4c8345 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Wed, 23 Aug 2017 13:21:41 +0000
+Subject: [PATCH] * libtiff/tif_dirwrite.c: replace assertion related to not
+ finding the SubIFD tag by runtime check. Fixes
+ http://bugzilla.maptools.org/show_bug.cgi?id=2727 Reported by team OWL337
+
+Upstream-Status: Backport
+[https://github.com/vadz/libtiff/commit/f91ca83a21a6a583050e5a5755ce1441b2bf1d7e]
+
+CVE: CVE-2017-13726
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ ChangeLog              | 7 +++++++
+ libtiff/tif_dirwrite.c | 7 ++++++-
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index 6980da8..3e299d9 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,10 @@
++2017-08-23  Even Rouault <even.rouault at spatialys.com>
++
++	* libtiff/tif_dirwrite.c: replace assertion related to not finding the
++	SubIFD tag by runtime check.
++	Fixes http://bugzilla.maptools.org/show_bug.cgi?id=2727
++	Reported by team OWL337
++
+ 2017-07-15  Even Rouault <even.rouault at spatialys.com>
+ 
+ 	* tools/tiff2pdf.c: prevent heap buffer overflow write in "Raw"
+diff --git a/libtiff/tif_dirwrite.c b/libtiff/tif_dirwrite.c
+index 8d6686b..14090ae 100644
+--- a/libtiff/tif_dirwrite.c
++++ b/libtiff/tif_dirwrite.c
+@@ -821,7 +821,12 @@ TIFFWriteDirectorySec(TIFF* tif, int isimage, int imagedone, uint64* pdiroff)
+ 			TIFFDirEntry* nb;
+ 			for (na=0, nb=dir; ; na++, nb++)
+ 			{
+-				assert(na<ndir);
++				if( na == ndir )
++                                {
++                                    TIFFErrorExt(tif->tif_clientdata,module,
++                                                 "Cannot find SubIFD tag");
++                                    goto bad;
++                                }
+ 				if (nb->tdir_tag==TIFFTAG_SUBIFD)
+ 					break;
+ 			}
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2017-13727.patch b/meta/recipes-multimedia/libtiff/files/CVE-2017-13727.patch
new file mode 100644
index 0000000..e228c2f
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2017-13727.patch
@@ -0,0 +1,65 @@
+From a5e8245cc67646f7b448b4ca29258eaac418102c Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Wed, 23 Aug 2017 13:33:42 +0000
+Subject: [PATCH] * libtiff/tif_dirwrite.c: replace assertion to tag value not
+ fitting on uint32 when selecting the value of SubIFD tag by runtime check (in
+ TIFFWriteDirectoryTagSubifd()). Fixes
+ http://bugzilla.maptools.org/show_bug.cgi?id=2728 Reported by team OWL337
+
+SubIFD tag by runtime check (in TIFFWriteDirectorySec())
+
+Upstream-Status: Backport
+[https://github.com/vadz/libtiff/commit/b6af137bf9ef852f1a48a50a5afb88f9e9da01cc]
+
+CVE: CVE-2017-13727
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ ChangeLog              | 10 +++++++++-
+ libtiff/tif_dirwrite.c |  9 ++++++++-
+ 2 files changed, 17 insertions(+), 2 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index 3e299d9..8f5efe9 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,7 +1,15 @@
+ 2017-08-23  Even Rouault <even.rouault at spatialys.com>
+ 
++	* libtiff/tif_dirwrite.c: replace assertion to tag value not fitting
++	on uint32 when selecting the value of SubIFD tag by runtime check
++	(in TIFFWriteDirectoryTagSubifd()).
++	Fixes http://bugzilla.maptools.org/show_bug.cgi?id=2728
++	Reported by team OWL337
++
++2017-08-23  Even Rouault <even.rouault at spatialys.com>
++
+ 	* libtiff/tif_dirwrite.c: replace assertion related to not finding the
+-	SubIFD tag by runtime check.
++	SubIFD tag by runtime check (in TIFFWriteDirectorySec())
+ 	Fixes http://bugzilla.maptools.org/show_bug.cgi?id=2727
+ 	Reported by team OWL337
+ 
+diff --git a/libtiff/tif_dirwrite.c b/libtiff/tif_dirwrite.c
+index 14090ae..f0a4baa 100644
+--- a/libtiff/tif_dirwrite.c
++++ b/libtiff/tif_dirwrite.c
+@@ -1949,7 +1949,14 @@ TIFFWriteDirectoryTagSubifd(TIFF* tif, uint32* ndir, TIFFDirEntry* dir)
+ 		for (p=0; p < tif->tif_dir.td_nsubifd; p++)
+ 		{
+                         assert(pa != 0);
+-			assert(*pa <= 0xFFFFFFFFUL);
++
++                        /* Could happen if an classicTIFF has a SubIFD of type LONG8 (which is illegal) */
++                        if( *pa > 0xFFFFFFFFUL)
++                        {
++                            TIFFErrorExt(tif->tif_clientdata,module,"Illegal value for SubIFD tag");
++                            _TIFFfree(o);
++                            return(0);
++                        }
+ 			*pb++=(uint32)(*pa++);
+ 		}
+ 		n=TIFFWriteDirectoryTagCheckedIfdArray(tif,ndir,dir,TIFFTAG_SUBIFD,tif->tif_dir.td_nsubifd,o);
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.8.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.8.bb
index c8ad5d5..cb91baa 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.8.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.8.bb
@@ -10,6 +10,8 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2017-9936.patch \
            file://CVE-2017-10688.patch \
            file://CVE-2017-11335.patch \
+           file://CVE-2017-13726.patch \
+           file://CVE-2017-13727.patch \
           "
 
 SRC_URI[md5sum] = "2a7d1c1318416ddf36d5f6fa4600069b"
-- 
2.7.4


