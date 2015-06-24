Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C1130741CF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 01:19:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5O1JxfE028134
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 18:19:59 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 23 Jun 2015 18:19:59 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Jun 2015 09:12:21 +0800
Message-ID: <1435108341-25026-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][v2] unzip: fix three CVE defects
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
X-List-Received-Date: Wed, 24 Jun 2015 01:19:58 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Port four patches from unzip_6.0-8+deb7u2.debian.tar.gz to fix:
     cve-2014-8139
     cve-2014-8140
     cve-2014-8141

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../unzip/09-cve-2014-8139-crc-overflow.patch      |  52 ++++++++
 .../unzip/10-cve-2014-8140-test-compr-eb.patch     |  33 +++++
 .../unzip/11-cve-2014-8141-getzip64data.patch      | 144 +++++++++++++++++++++
 meta/recipes-extended/unzip/unzip_6.0.bb           |   3 +
 4 files changed, 232 insertions(+)
 create mode 100644 meta/recipes-extended/unzip/unzip/09-cve-2014-8139-crc-overflow.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/10-cve-2014-8140-test-compr-eb.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/11-cve-2014-8141-getzip64data.patch

diff --git a/meta/recipes-extended/unzip/unzip/09-cve-2014-8139-crc-overflow.patch b/meta/recipes-extended/unzip/unzip/09-cve-2014-8139-crc-overflow.patch
new file mode 100644
index 0000000..e137f0d
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/09-cve-2014-8139-crc-overflow.patch
@@ -0,0 +1,52 @@
+From: sms
+Subject: Fix CVE-2014-8139: CRC32 verification heap-based overflow
+Bug-Debian: http://bugs.debian.org/773722
+
+The patch comes from unzip_6.0-8+deb7u2.debian.tar.gz
+
+Upstream-Status: Backport
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+
+--- a/extract.c
++++ b/extract.c
+@@ -298,6 +298,8 @@
+ #ifndef SFX
+    static ZCONST char Far InconsistEFlength[] = "bad extra-field entry:\n \
+      EF block length (%u bytes) exceeds remaining EF data (%u bytes)\n";
++   static ZCONST char Far TooSmallEBlength[] = "bad extra-field entry:\n \
++     EF block length (%u bytes) invalid (< %d)\n";
+    static ZCONST char Far InvalidComprDataEAs[] =
+      " invalid compressed data for EAs\n";
+ #  if (defined(WIN32) && defined(NTSD_EAS))
+@@ -2023,7 +2025,8 @@
+         ebID = makeword(ef);
+         ebLen = (unsigned)makeword(ef+EB_LEN);
+ 
+-        if (ebLen > (ef_len - EB_HEADSIZE)) {
++        if (ebLen > (ef_len - EB_HEADSIZE))
++        {
+            /* Discovered some extra field inconsistency! */
+             if (uO.qflag)
+                 Info(slide, 1, ((char *)slide, "%-22s ",
+@@ -2158,11 +2161,19 @@
+                 }
+                 break;
+             case EF_PKVMS:
+-                if (makelong(ef+EB_HEADSIZE) !=
++                if (ebLen < 4)
++                {
++                    Info(slide, 1,
++                     ((char *)slide, LoadFarString(TooSmallEBlength),
++                     ebLen, 4));
++                }
++                else if (makelong(ef+EB_HEADSIZE) !=
+                     crc32(CRCVAL_INITIAL, ef+(EB_HEADSIZE+4),
+                           (extent)(ebLen-4)))
++                {
+                     Info(slide, 1, ((char *)slide,
+                       LoadFarString(BadCRC_EAs)));
++                }
+                 break;
+             case EF_PKW32:
+             case EF_PKUNIX:
diff --git a/meta/recipes-extended/unzip/unzip/10-cve-2014-8140-test-compr-eb.patch b/meta/recipes-extended/unzip/unzip/10-cve-2014-8140-test-compr-eb.patch
new file mode 100644
index 0000000..edc7d51
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/10-cve-2014-8140-test-compr-eb.patch
@@ -0,0 +1,33 @@
+From: sms
+Subject: Fix CVE-2014-8140: out-of-bounds write issue in test_compr_eb()
+Bug-Debian: http://bugs.debian.org/773722
+
+The patch comes from unzip_6.0-8+deb7u2.debian.tar.gz
+
+Upstream-Status: Backport
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+
+--- a/extract.c
++++ b/extract.c
+@@ -2232,10 +2232,17 @@
+     if (compr_offset < 4)                /* field is not compressed: */
+         return PK_OK;                    /* do nothing and signal OK */
+ 
++    /* Return no/bad-data error status if any problem is found:
++     *    1. eb_size is too small to hold the uncompressed size
++     *       (eb_ucsize).  (Else extract eb_ucsize.)
++     *    2. eb_ucsize is zero (invalid).  2014-12-04 SMS.
++     *    3. eb_ucsize is positive, but eb_size is too small to hold
++     *       the compressed data header.
++     */
+     if ((eb_size < (EB_UCSIZE_P + 4)) ||
+-        ((eb_ucsize = makelong(eb+(EB_HEADSIZE+EB_UCSIZE_P))) > 0L &&
+-         eb_size <= (compr_offset + EB_CMPRHEADLEN)))
+-        return IZ_EF_TRUNC;               /* no compressed data! */
++     ((eb_ucsize = makelong( eb+ (EB_HEADSIZE+ EB_UCSIZE_P))) == 0L) ||
++     ((eb_ucsize > 0L) && (eb_size <= (compr_offset + EB_CMPRHEADLEN))))
++        return IZ_EF_TRUNC;             /* no/bad compressed data! */
+ 
+     if (
+ #ifdef INT_16BIT
diff --git a/meta/recipes-extended/unzip/unzip/11-cve-2014-8141-getzip64data.patch b/meta/recipes-extended/unzip/unzip/11-cve-2014-8141-getzip64data.patch
new file mode 100644
index 0000000..d0c1db3
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/11-cve-2014-8141-getzip64data.patch
@@ -0,0 +1,144 @@
+From: sms
+Subject: Fix CVE-2014-8141: out-of-bounds read issues in getZip64Data()
+Bug-Debian: http://bugs.debian.org/773722
+
+The patch comes from unzip_6.0-8+deb7u2.debian.tar.gz
+
+Upstream-Status: Backport
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+
+
+--- a/fileio.c
++++ b/fileio.c
+@@ -176,6 +176,8 @@
+ #endif
+ static ZCONST char Far ExtraFieldTooLong[] =
+   "warning:  extra field too long (%d).  Ignoring...\n";
++static ZCONST char Far ExtraFieldCorrupt[] =
++  "warning:  extra field (type: 0x%04x) corrupt.  Continuing...\n";
+ 
+ #ifdef WINDLL
+    static ZCONST char Far DiskFullQuery[] =
+@@ -2295,7 +2297,12 @@
+             if (readbuf(__G__ (char *)G.extra_field, length) == 0)
+                 return PK_EOF;
+             /* Looks like here is where extra fields are read */
+-            getZip64Data(__G__ G.extra_field, length);
++            if (getZip64Data(__G__ G.extra_field, length) != PK_COOL)
++            {
++                Info(slide, 0x401, ((char *)slide,
++                 LoadFarString( ExtraFieldCorrupt), EF_PKSZ64));
++                error = PK_WARN;
++            }
+ #ifdef UNICODE_SUPPORT
+             G.unipath_filename = NULL;
+             if (G.UzO.U_flag < 2) {
+--- a/process.c
++++ b/process.c
+@@ -1,5 +1,5 @@
+ /*
+-  Copyright (c) 1990-2009 Info-ZIP.  All rights reserved.
++  Copyright (c) 1990-2014 Info-ZIP.  All rights reserved.
+ 
+   See the accompanying file LICENSE, version 2009-Jan-02 or later
+   (the contents of which are also included in unzip.h) for terms of use.
+@@ -1901,48 +1901,82 @@
+     and a 4-byte version of disk start number.
+     Sets both local header and central header fields.  Not terribly clever,
+     but it means that this procedure is only called in one place.
++
++    2014-12-05 SMS.
++    Added checks to ensure that enough data are available before calling
++    makeint64() or makelong().  Replaced various sizeof() values with
++    simple ("4" or "8") constants.  (The Zip64 structures do not depend
++    on our variable sizes.)  Error handling is crude, but we should now
++    stay within the buffer.
+   ---------------------------------------------------------------------------*/
+ 
++#define Z64FLGS 0xffff
++#define Z64FLGL 0xffffffff
++
+     if (ef_len == 0 || ef_buf == NULL)
+         return PK_COOL;
+ 
+     Trace((stderr,"\ngetZip64Data: scanning extra field of length %u\n",
+       ef_len));
+ 
+-    while (ef_len >= EB_HEADSIZE) {
++    while (ef_len >= EB_HEADSIZE)
++    {
+         eb_id = makeword(EB_ID + ef_buf);
+         eb_len = makeword(EB_LEN + ef_buf);
+ 
+-        if (eb_len > (ef_len - EB_HEADSIZE)) {
+-            /* discovered some extra field inconsistency! */
++        if (eb_len > (ef_len - EB_HEADSIZE))
++        {
++            /* Extra block length exceeds remaining extra field length. */
+             Trace((stderr,
+               "getZip64Data: block length %u > rest ef_size %u\n", eb_len,
+               ef_len - EB_HEADSIZE));
+             break;
+         }
+-        if (eb_id == EF_PKSZ64) {
+-
++        if (eb_id == EF_PKSZ64)
++        {
+           int offset = EB_HEADSIZE;
+ 
+-          if (G.crec.ucsize == 0xffffffff || G.lrec.ucsize == 0xffffffff){
+-            G.lrec.ucsize = G.crec.ucsize = makeint64(offset + ef_buf);
+-            offset += sizeof(G.crec.ucsize);
++          if ((G.crec.ucsize == Z64FLGL) || (G.lrec.ucsize == Z64FLGL))
++          {
++            if (offset+ 8 > ef_len)
++              return PK_ERR;
++
++            G.crec.ucsize = G.lrec.ucsize = makeint64(offset + ef_buf);
++            offset += 8;
+           }
+-          if (G.crec.csize == 0xffffffff || G.lrec.csize == 0xffffffff){
+-            G.csize = G.lrec.csize = G.crec.csize = makeint64(offset + ef_buf);
+-            offset += sizeof(G.crec.csize);
++
++          if ((G.crec.csize == Z64FLGL) || (G.lrec.csize == Z64FLGL))
++          {
++            if (offset+ 8 > ef_len)
++              return PK_ERR;
++
++            G.csize = G.crec.csize = G.lrec.csize = makeint64(offset + ef_buf);
++            offset += 8;
+           }
+-          if (G.crec.relative_offset_local_header == 0xffffffff){
++
++          if (G.crec.relative_offset_local_header == Z64FLGL)
++          {
++            if (offset+ 8 > ef_len)
++              return PK_ERR;
++
+             G.crec.relative_offset_local_header = makeint64(offset + ef_buf);
+-            offset += sizeof(G.crec.relative_offset_local_header);
++            offset += 8;
+           }
+-          if (G.crec.disk_number_start == 0xffff){
++
++          if (G.crec.disk_number_start == Z64FLGS)
++          {
++            if (offset+ 4 > ef_len)
++              return PK_ERR;
++
+             G.crec.disk_number_start = (zuvl_t)makelong(offset + ef_buf);
+-            offset += sizeof(G.crec.disk_number_start);
++            offset += 4;
+           }
++#if 0
++          break;                /* Expect only one EF_PKSZ64 block. */
++#endif /* 0 */
+         }
+ 
+-        /* Skip this extra field block */
++        /* Skip this extra field block. */
+         ef_buf += (eb_len + EB_HEADSIZE);
+         ef_len -= (eb_len + EB_HEADSIZE);
+     }
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index 5060d35..4a0a713 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -11,6 +11,9 @@ SRC_URI = "ftp://ftp.info-zip.org/pub/infozip/src/unzip60.tgz \
 	file://define-ldflags.patch \
 	file://06-unzip60-alt-iconv-utf8_CVE-2015-1315.patch \
 	file://unzip-6.0_overflow3.diff \
+	file://09-cve-2014-8139-crc-overflow.patch \
+	file://10-cve-2014-8140-test-compr-eb.patch \
+	file://11-cve-2014-8141-getzip64data.patch \
 "
 
 SRC_URI[md5sum] = "62b490407489521db863b523a7f86375"
-- 
1.9.1


