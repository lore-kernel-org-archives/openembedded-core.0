Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 90735789BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 23:53:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w2JNrNfT016352
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 16:53:23 -0700
Received: from localhost (128.224.163.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 19 Mar 2018 16:53:22 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Mar 2018 07:53:20 +0800
Message-ID: <1521503600-21532-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.163.220]
Subject: [PATCH] tiff: Security fixes
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
X-List-Received-Date: Mon, 19 Mar 2018 23:53:22 -0000
Content-Type: text/plain

Fix CVE-2017-99935, CVE-2017-18013, CVE-2018-5784

References:
https://nvd.nist.gov/vuln/detail/CVE-2017-9935
https://nvd.nist.gov/vuln/detail/CVE-2017-18013
https://nvd.nist.gov/vuln/detail/CVE-2018-5784

Patches from:
CVE-2017-9935:
https://gitlab.com/libtiff/libtiff/commit/3dd8f6a357981a4090f126ab9025056c938b6940
CVE-2017-18013:
https://gitlab.com/libtiff/libtiff/commit/c6f41df7b581402dfba3c19a1e3df4454c551a01
CVE-2018-5784:
https://gitlab.com/libtiff/libtiff/commit/473851d211cf8805a161820337ca74cc9615d6ef

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libtiff/files/CVE-2017-18013.patch             |  42 ++++++
 .../libtiff/files/CVE-2017-9935.patch              | 160 +++++++++++++++++++++
 .../libtiff/files/CVE-2018-5784.patch              | 135 +++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.9.bb      |   3 +
 4 files changed, 340 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-18013.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-9935.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2018-5784.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2017-18013.patch b/meta/recipes-multimedia/libtiff/files/CVE-2017-18013.patch
new file mode 100644
index 0000000..878e0de
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2017-18013.patch
@@ -0,0 +1,42 @@
+From 293c8b0298e91d20ba51291e2351ab7d110671d0 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Sun, 31 Dec 2017 15:09:41 +0100
+Subject: [PATCH] libtiff/tif_print.c: TIFFPrintDirectory(): fix null pointer
+ dereference on corrupted file. Fixes
+ http://bugzilla.maptools.org/show_bug.cgi?id=2770
+
+Upstream-Status: Backport
+[https://gitlab.com/libtiff/libtiff/commit/c6f41df7b581402dfba3c19a1e3df4454c551a01]
+
+CVE: CVE-2017-18013
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ libtiff/tif_print.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/libtiff/tif_print.c b/libtiff/tif_print.c
+index 24d4b98..f494cfb 100644
+--- a/libtiff/tif_print.c
++++ b/libtiff/tif_print.c
+@@ -667,13 +667,13 @@ TIFFPrintDirectory(TIFF* tif, FILE* fd, long flags)
+ #if defined(__WIN32__) && (defined(_MSC_VER) || defined(__MINGW32__))
+ 			fprintf(fd, "    %3lu: [%8I64u, %8I64u]\n",
+ 			    (unsigned long) s,
+-			    (unsigned __int64) td->td_stripoffset[s],
+-			    (unsigned __int64) td->td_stripbytecount[s]);
++			    td->td_stripoffset ? (unsigned __int64) td->td_stripoffset[s] : 0,
++			    td->td_stripbytecount ? (unsigned __int64) td->td_stripbytecount[s] : 0);
+ #else
+ 			fprintf(fd, "    %3lu: [%8llu, %8llu]\n",
+ 			    (unsigned long) s,
+-			    (unsigned long long) td->td_stripoffset[s],
+-			    (unsigned long long) td->td_stripbytecount[s]);
++			    td->td_stripoffset ? (unsigned long long) td->td_stripoffset[s] : 0,
++			    td->td_stripbytecount ? (unsigned long long) td->td_stripbytecount[s] : 0);
+ #endif
+ 	}
+ }
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2017-9935.patch b/meta/recipes-multimedia/libtiff/files/CVE-2017-9935.patch
new file mode 100644
index 0000000..60684dd
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2017-9935.patch
@@ -0,0 +1,160 @@
+From abb0055d21c52a9925314d5b0628fb2b6307619c Mon Sep 17 00:00:00 2001
+From: Brian May <brian@linuxpenguins.xyz>
+Date: Thu, 7 Dec 2017 07:46:47 +1100
+Subject: [PATCH] tiff2pdf: Fix CVE-2017-9935
+
+Fix for http://bugzilla.maptools.org/show_bug.cgi?id=2704
+
+This vulnerability - at least for the supplied test case - is because we
+assume that a tiff will only have one transfer function that is the same
+for all pages. This is not required by the TIFF standards.
+
+We than read the transfer function for every page.  Depending on the
+transfer function, we allocate either 2 or 4 bytes to the XREF buffer.
+We allocate this memory after we read in the transfer function for the
+page.
+
+For the first exploit - POC1, this file has 3 pages. For the first page
+we allocate 2 extra extra XREF entries. Then for the next page 2 more
+entries. Then for the last page the transfer function changes and we
+allocate 4 more entries.
+
+When we read the file into memory, we assume we have 4 bytes extra for
+each and every page (as per the last transfer function we read). Which
+is not correct, we only have 2 bytes extra for the first 2 pages. As a
+result, we end up writing past the end of the buffer.
+
+There are also some related issues that this also fixes. For example,
+TIFFGetField can return uninitalized pointer values, and the logic to
+detect a N=3 vs N=1 transfer function seemed rather strange.
+
+It is also strange that we declare the transfer functions to be of type
+float, when the standard says they are unsigned 16 bit values. This is
+fixed in another patch.
+
+This patch will check to ensure that the N value for every transfer
+function is the same for every page. If this changes, we abort with an
+error. In theory, we should perhaps check that the transfer function
+itself is identical for every page, however we don't do that due to the
+confusion of the type of the data in the transfer function.
+
+Upstream-Status: Backport
+[https://gitlab.com/libtiff/libtiff/commit/3dd8f6a357981a4090f126ab9025056c938b6940]
+
+CVE: CVE-2017-9935
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ libtiff/tif_dir.c |  3 +++
+ tools/tiff2pdf.c  | 65 +++++++++++++++++++++++++++++++++++++------------------
+ 2 files changed, 47 insertions(+), 21 deletions(-)
+
+diff --git a/libtiff/tif_dir.c b/libtiff/tif_dir.c
+index f00f808..c36a5f3 100644
+--- a/libtiff/tif_dir.c
++++ b/libtiff/tif_dir.c
+@@ -1067,6 +1067,9 @@ _TIFFVGetField(TIFF* tif, uint32 tag, va_list ap)
+ 			if (td->td_samplesperpixel - td->td_extrasamples > 1) {
+ 				*va_arg(ap, uint16**) = td->td_transferfunction[1];
+ 				*va_arg(ap, uint16**) = td->td_transferfunction[2];
++			} else {
++				*va_arg(ap, uint16**) = NULL;
++				*va_arg(ap, uint16**) = NULL;
+ 			}
+ 			break;
+ 		case TIFFTAG_REFERENCEBLACKWHITE:
+diff --git a/tools/tiff2pdf.c b/tools/tiff2pdf.c
+index 454befb..0b5973e 100644
+--- a/tools/tiff2pdf.c
++++ b/tools/tiff2pdf.c
+@@ -1047,6 +1047,8 @@ void t2p_read_tiff_init(T2P* t2p, TIFF* input){
+ 	uint16 pagen=0;
+ 	uint16 paged=0;
+ 	uint16 xuint16=0;
++	uint16 tiff_transferfunctioncount=0;
++	float* tiff_transferfunction[3];
+ 
+ 	directorycount=TIFFNumberOfDirectories(input);
+ 	t2p->tiff_pages = (T2P_PAGE*) _TIFFmalloc(TIFFSafeMultiply(tmsize_t,directorycount,sizeof(T2P_PAGE)));
+@@ -1147,26 +1149,48 @@ void t2p_read_tiff_init(T2P* t2p, TIFF* input){
+                 }
+ #endif
+ 		if (TIFFGetField(input, TIFFTAG_TRANSFERFUNCTION,
+-                                 &(t2p->tiff_transferfunction[0]),
+-                                 &(t2p->tiff_transferfunction[1]),
+-                                 &(t2p->tiff_transferfunction[2]))) {
+-			if((t2p->tiff_transferfunction[1] != (float*) NULL) &&
+-                           (t2p->tiff_transferfunction[2] != (float*) NULL) &&
+-                           (t2p->tiff_transferfunction[1] !=
+-                            t2p->tiff_transferfunction[0])) {
+-				t2p->tiff_transferfunctioncount = 3;
+-				t2p->tiff_pages[i].page_extra += 4;
+-				t2p->pdf_xrefcount += 4;
+-			} else {
+-				t2p->tiff_transferfunctioncount = 1;
+-				t2p->tiff_pages[i].page_extra += 2;
+-				t2p->pdf_xrefcount += 2;
+-			}
+-			if(t2p->pdf_minorversion < 2)
+-				t2p->pdf_minorversion = 2;
++                                 &(tiff_transferfunction[0]),
++                                 &(tiff_transferfunction[1]),
++                                 &(tiff_transferfunction[2]))) {
++
++                        if((tiff_transferfunction[1] != (float*) NULL) &&
++                           (tiff_transferfunction[2] != (float*) NULL)
++                          ) {
++                            tiff_transferfunctioncount=3;
++                        } else {
++                            tiff_transferfunctioncount=1;
++                        }
+                 } else {
+-			t2p->tiff_transferfunctioncount=0;
++			tiff_transferfunctioncount=0;
+ 		}
++
++                if (i > 0){
++                    if (tiff_transferfunctioncount != t2p->tiff_transferfunctioncount){
++                        TIFFError(
++                            TIFF2PDF_MODULE,
++                            "Different transfer function on page %d",
++                            i);
++                        t2p->t2p_error = T2P_ERR_ERROR;
++                        return;
++                    }
++                }
++
++                t2p->tiff_transferfunctioncount = tiff_transferfunctioncount;
++                t2p->tiff_transferfunction[0] = tiff_transferfunction[0];
++                t2p->tiff_transferfunction[1] = tiff_transferfunction[1];
++                t2p->tiff_transferfunction[2] = tiff_transferfunction[2];
++                if(tiff_transferfunctioncount == 3){
++                        t2p->tiff_pages[i].page_extra += 4;
++                        t2p->pdf_xrefcount += 4;
++                        if(t2p->pdf_minorversion < 2)
++                                t2p->pdf_minorversion = 2;
++                } else if (tiff_transferfunctioncount == 1){
++                        t2p->tiff_pages[i].page_extra += 2;
++                        t2p->pdf_xrefcount += 2;
++                        if(t2p->pdf_minorversion < 2)
++                                t2p->pdf_minorversion = 2;
++                }
++
+ 		if( TIFFGetField(
+ 			input, 
+ 			TIFFTAG_ICCPROFILE, 
+@@ -1828,9 +1852,8 @@ void t2p_read_tiff_data(T2P* t2p, TIFF* input){
+ 			 &(t2p->tiff_transferfunction[1]),
+ 			 &(t2p->tiff_transferfunction[2]))) {
+ 		if((t2p->tiff_transferfunction[1] != (float*) NULL) &&
+-                   (t2p->tiff_transferfunction[2] != (float*) NULL) &&
+-                   (t2p->tiff_transferfunction[1] !=
+-                    t2p->tiff_transferfunction[0])) {
++                   (t2p->tiff_transferfunction[2] != (float*) NULL)
++                  ) {
+ 			t2p->tiff_transferfunctioncount=3;
+ 		} else {
+ 			t2p->tiff_transferfunctioncount=1;
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2018-5784.patch b/meta/recipes-multimedia/libtiff/files/CVE-2018-5784.patch
new file mode 100644
index 0000000..406001d
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2018-5784.patch
@@ -0,0 +1,135 @@
+From 6cdea15213be6b67d9f8380c7bb40e325d3adace Mon Sep 17 00:00:00 2001
+From: Nathan Baker <nathanb@lenovo-chrome.com>
+Date: Tue, 6 Feb 2018 10:13:57 -0500
+Subject: [PATCH] Fix for bug 2772
+
+It is possible to craft a TIFF document where the IFD list is circular,
+leading to an infinite loop while traversing the chain. The libtiff
+directory reader has a failsafe that will break out of this loop after
+reading 65535 directory entries, but it will continue processing,
+consuming time and resources to process what is essentially a bogus TIFF
+document.
+
+This change fixes the above behavior by breaking out of processing when
+a TIFF document has >= 65535 directories and terminating with an error.
+
+Upstream-Status: Backport
+[https://gitlab.com/libtiff/libtiff/commit/473851d211cf8805a161820337ca74cc9615d6ef]
+
+CVE: CVE-2018-5784
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ contrib/addtiffo/tif_overview.c | 14 +++++++++++++-
+ tools/tiff2pdf.c                | 10 ++++++++++
+ tools/tiffcrop.c                | 13 +++++++++++--
+ 3 files changed, 34 insertions(+), 3 deletions(-)
+
+diff --git a/contrib/addtiffo/tif_overview.c b/contrib/addtiffo/tif_overview.c
+index c61ffbb..03b3573 100644
+--- a/contrib/addtiffo/tif_overview.c
++++ b/contrib/addtiffo/tif_overview.c
+@@ -65,6 +65,8 @@
+ #  define MAX(a,b)      ((a>b) ? a : b)
+ #endif
+ 
++#define TIFF_DIR_MAX  65534
++
+ void TIFFBuildOverviews( TIFF *, int, int *, int, const char *,
+                          int (*)(double,void*), void * );
+ 
+@@ -91,6 +93,7 @@ uint32 TIFF_WriteOverview( TIFF *hTIFF, uint32 nXSize, uint32 nYSize,
+ {
+     toff_t	nBaseDirOffset;
+     toff_t	nOffset;
++    tdir_t	iNumDir;
+ 
+     (void) bUseSubIFDs;
+ 
+@@ -147,7 +150,16 @@ uint32 TIFF_WriteOverview( TIFF *hTIFF, uint32 nXSize, uint32 nYSize,
+         return 0;
+ 
+     TIFFWriteDirectory( hTIFF );
+-    TIFFSetDirectory( hTIFF, (tdir_t) (TIFFNumberOfDirectories(hTIFF)-1) );
++    iNumDir = TIFFNumberOfDirectories(hTIFF);
++    if( iNumDir > TIFF_DIR_MAX )
++    {
++        TIFFErrorExt( TIFFClientdata(hTIFF),
++                      "TIFF_WriteOverview",
++                      "File `%s' has too many directories.\n",
++                      TIFFFileName(hTIFF) );
++        exit(-1);
++    }
++    TIFFSetDirectory( hTIFF, (tdir_t) (iNumDir - 1) );
+ 
+     nOffset = TIFFCurrentDirOffset( hTIFF );
+ 
+diff --git a/tools/tiff2pdf.c b/tools/tiff2pdf.c
+index 0b5973e..ef5d6a0 100644
+--- a/tools/tiff2pdf.c
++++ b/tools/tiff2pdf.c
+@@ -68,6 +68,8 @@ extern int getopt(int, char**, char*);
+ 
+ #define PS_UNIT_SIZE	72.0F
+ 
++#define TIFF_DIR_MAX    65534
++
+ /* This type is of PDF color spaces. */
+ typedef enum {
+ 	T2P_CS_BILEVEL = 0x01,	/* Bilevel, black and white */
+@@ -1051,6 +1053,14 @@ void t2p_read_tiff_init(T2P* t2p, TIFF* input){
+ 	float* tiff_transferfunction[3];
+ 
+ 	directorycount=TIFFNumberOfDirectories(input);
++	if(directorycount > TIFF_DIR_MAX) {
++		TIFFError(
++			TIFF2PDF_MODULE,
++			"TIFF contains too many directories, %s",
++			TIFFFileName(input));
++		t2p->t2p_error = T2P_ERR_ERROR;
++		return;
++	}
+ 	t2p->tiff_pages = (T2P_PAGE*) _TIFFmalloc(TIFFSafeMultiply(tmsize_t,directorycount,sizeof(T2P_PAGE)));
+ 	if(t2p->tiff_pages==NULL){
+ 		TIFFError(
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index c69177e..c60cb38 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -217,6 +217,8 @@ extern int getopt(int argc, char * const argv[], const char *optstring);
+ #define DUMP_TEXT   1
+ #define DUMP_RAW    2
+ 
++#define TIFF_DIR_MAX  65534
++
+ /* Offsets into buffer for margins and fixed width and length segments */
+ struct offset {
+   uint32  tmargin;
+@@ -2233,7 +2235,7 @@ main(int argc, char* argv[])
+     pageNum = -1;
+   else
+     total_images = 0;
+-  /* read multiple input files and write to output file(s) */
++  /* Read multiple input files and write to output file(s) */
+   while (optind < argc - 1)
+     {
+     in = TIFFOpen (argv[optind], "r");
+@@ -2241,7 +2243,14 @@ main(int argc, char* argv[])
+       return (-3);
+ 
+     /* If only one input file is specified, we can use directory count */
+-    total_images = TIFFNumberOfDirectories(in); 
++    total_images = TIFFNumberOfDirectories(in);
++    if (total_images > TIFF_DIR_MAX)
++      {
++      TIFFError (TIFFFileName(in), "File contains too many directories");
++      if (out != NULL)
++        (void) TIFFClose(out);
++      return (1);
++      }
+     if (image_count == 0)
+       {
+       dirnum = 0;
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb
index b8f895b..8c3bba5 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb
@@ -6,6 +6,9 @@ CVE_PRODUCT = "libtiff"
 
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://libtool2.patch \
+           file://CVE-2017-9935.patch \
+           file://CVE-2017-18013.patch \
+           file://CVE-2018-5784.patch \
           "
 
 SRC_URI[md5sum] = "54bad211279cc93eb4fca31ba9bfdc79"
-- 
2.7.4


