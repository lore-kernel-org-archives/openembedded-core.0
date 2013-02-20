Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U7xd8-0004DD-AR
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 01:34:14 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1K0HevC024078
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2013 16:17:40 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Tue, 19 Feb 2013 16:17:38 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Feb 2013 18:47:31 -0600
Message-ID: <1361321252-14982-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1361321252-14982-1-git-send-email-mark.hatle@windriver.com>
References: <1361321252-14982-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/2] man: Remove wildcard from SRC_URI
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Feb 2013 00:34:16 -0000
Content-Type: text/plain

[ CQID: WIND00402802 ]

Remove the wildcard from the SRC_URI.  This causes problems when you .bbappend
and add a FILESEXTRAPATHS entry.  The unpack task may be unable to find the
files to unpack leading to an error.

Avoid wildcards at all costs...

Note, remove both man-1.5m2-multiple.patch and man-1.6e-lzma+xz-support.patch,
they were not being applied in the previous version.  The later also fails to
apply when added to the SRC_URI.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../man/man/man-1.5m2-multiple.patch               |  22 ----
 .../man/man/man-1.6e-lzma+xz-support.patch         | 124 ---------------------
 meta/recipes-extended/man/man_1.6g.bb              |  47 ++++----
 3 files changed, 25 insertions(+), 168 deletions(-)
 delete mode 100644 meta/recipes-extended/man/man/man-1.5m2-multiple.patch
 delete mode 100644 meta/recipes-extended/man/man/man-1.6e-lzma+xz-support.patch

diff --git a/meta/recipes-extended/man/man/man-1.5m2-multiple.patch b/meta/recipes-extended/man/man/man-1.5m2-multiple.patch
deleted file mode 100644
index ec06ab7..0000000
--- a/meta/recipes-extended/man/man/man-1.5m2-multiple.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
---- man-1.5m2/src/manfile.c_multiple	2006-12-08 23:42:17.000000000 +0100
-+++ man-1.5m2/src/manfile.c	2006-12-09 00:00:01.000000000 +0100
-@@ -25,9 +25,12 @@
- 
-      if (a) {
- 	  if (*head) {
--	       p = *head;
--	       while(p->next)
--		    p = p->next;
-+		   for (p = *head; p->next; p = p->next) {
-+               if(!strcmp (p->filename, a->filename))
-+					   return;
-+		   }
-+           if(!strcmp (p->filename, a->filename))
-+				  return;
- 	       p->next = a;
- 	  } else
- 	       *head = a;
diff --git a/meta/recipes-extended/man/man/man-1.6e-lzma+xz-support.patch b/meta/recipes-extended/man/man/man-1.6e-lzma+xz-support.patch
deleted file mode 100644
index aae980f..0000000
--- a/meta/recipes-extended/man/man/man-1.6e-lzma+xz-support.patch
+++ /dev/null
@@ -1,124 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
-Index: man-1.6f/configure
-===================================================================
---- man-1.6f.orig/configure	2010-12-29 14:00:35.000000000 -0800
-+++ man-1.6f/configure	2010-12-29 14:27:57.584431711 -0800
-@@ -1027,7 +1027,7 @@
-   then
-     DO_COMPRESSION=true
-     compress=
--    for i in lzma bzip2 gzip bzip tzip pack compress freeze yabba
-+    for i in xz lzma bzip2 gzip bzip tzip pack compress freeze yabba
-     do
-       eval F$i=missing
-       for j in $DEFPATH
-@@ -1080,6 +1080,7 @@
-     fi
- 
-     case $compress in
-+      *xz*) ext=".xz" ;;
-       *lzma*) ext=".lzma" ;;
-       *bzip2*) ext=".bz2" ;;
-       *gzip*) ext=".gz" ;;
-@@ -1123,7 +1124,7 @@
- fi
- 
- # unconditionally handle uncompression
--UNCOMPRESSORS="unlzma gunzip bzip2 pcat zcat fcat unyabba"
-+UNCOMPRESSORS="unxz unlzma gunzip bzip2 pcat zcat fcat unyabba"
- for i in $UNCOMPRESSORS
- do
-   eval F$i=missing
-@@ -1144,6 +1145,10 @@
- if [ $Fbzip2 != missing ]; then
-   bzip2="$Fbzip2 -c -d"
- fi
-+unxz=missing
-+if [ $Funxz != missing ]; then
-+  unxz="$Funxz -c -d"
-+fi
- unlzma=missing
- if [ $Funlzma != missing ]; then
-   unlzma="$Funlzma -c -d"
-@@ -1176,6 +1181,9 @@
- 	bzip2)
- 	  echo "Command to use for .bz2 files (standard bzip2)"
- 	  echo $n "[`eval echo \\$$filter`] $c" ;;
-+	xz)
-+	  echo "Command to use for .xz files (standard xz)"
-+	  echo $n "[`eval echo \\$$filter`] $c" ;;
- 	lzma)
- 	  echo "Command to use for .lzma files (standard lzma)"
- 	  echo $n "[`eval echo \\$$filter`] $c" ;;
-@@ -1240,6 +1248,7 @@
- case $compress_ext in
-   .gz) decompress=$gunzip ;;
-   .bz2) decompress=$bzip2 ;;
-+  .xz) decompress=$unxz ;;
-   .lzma) decompress=$unlzma ;;
-   .z) decompress=$pcat ;;
-   .Z) decompress=$zcat ;;
-@@ -1333,6 +1342,7 @@
- s,@zcat@,$zcat,
- s,@gunzip@,$gunzip,
- s,@bzip2@,$bzip2,
-+s,@unxz@,$unxz,
- s,@unlzma@,$unlzma,
- s,@unyabba@,$unyabba,
- s,@compress@,$compress,
-Index: man-1.6f/src/makewhatis.sh
-===================================================================
---- man-1.6f.orig/src/makewhatis.sh	2010-12-29 14:00:35.000000000 -0800
-+++ man-1.6f/src/makewhatis.sh	2010-12-29 14:16:18.821555314 -0800
-@@ -242,7 +242,7 @@
- 	    find $mandir/${pages}$i/. -name '*' $findarg0 $findarg -print | LC_ALL=C $AWK -v MAN_NAME="$MAN_NAME" -v MAN_DESCRIPTION="$MAN_DESCRIPTION" '
- 
- 	    function readline() {
--              if (use_zcat || use_bzcat || use_lzcat) {
-+              if (use_zcat || use_bzcat || use_lzcat || use_xzcat) {
- 		result = (pipe_cmd | getline);
- 		if (result < 0) {
- 		  print "Pipe error: " pipe_cmd " " ERRNO > "/dev/stderr";
-@@ -257,7 +257,7 @@
- 	    }
- 	    
- 	    function closeline() {
--              if (use_zcat || use_bzcat || use_lzcat) {
-+              if (use_zcat || use_bzcat || use_lzcat || use_xzcat) {
- 		return close(pipe_cmd);
- 	      } else {
- 		return close(filename);
-@@ -278,7 +278,9 @@
- 		use_bzcat = match(filename,"\\.bz2");
-               if(!use_bzcat)
-                 use_lzcat = match(filename,"\\.lzma");
--              if (use_zcat || use_bzcat || use_lzcat ) {
-+	      if(!use_xzcat)
-+                use_xzcat = match(filename,"\\.xz");
-+              if (use_zcat || use_bzcat || use_lzcat || use_xzcat ) {
- 		filename_no_gz = substr(filename, 0, RSTART - 1);
- 	      } else {
- 		filename_no_gz = filename;
-@@ -291,14 +293,16 @@
- 		actual_section = section;
- 	      }
- 	      sub(/\..*/, "", progname);
--              if (use_zcat || use_bzcat || use_lzcat) {
-+              if (use_zcat || use_bzcat || use_lzcat || use_xzcat) {
- 		if (use_zcat) {
- 		  pipe_cmd = "zcat \"" filename "\"";
-                 } else if (use_bzcat) {
- 		  pipe_cmd = "bzcat \"" filename "\"";
--                } else {
-+                } else if (use_lzcat) {
-                   pipe_cmd = "lzcat \"" filename "\"";
--                }
-+                } else {
-+    		  pipe_cmd = "xzcat \"" filename "\"";
-+		}
- 		# try to avoid suspicious stuff
- 		if (filename ~ /[;&|`$(]/) {
- 		  print "ignored strange file name " filename " in " curdir > "/dev/stderr";
diff --git a/meta/recipes-extended/man/man_1.6g.bb b/meta/recipes-extended/man/man_1.6g.bb
index a2d6ace..f13b3ae 100644
--- a/meta/recipes-extended/man/man_1.6g.bb
+++ b/meta/recipes-extended/man/man_1.6g.bb
@@ -5,36 +5,39 @@ HOMEPAGE = "http://primates.ximian.com/~flucifredi/man"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-PR = "r0"
+PR = "r1"
 
 DEPENDS = "groff less"
 
 SRC_URI = "http://primates.ximian.com/~flucifredi/${BPN}/${BPN}-${PV}.tar.gz \
            file://man-1.5k-confpath.patch;striplevel=0 \
-           file://man-1.5h1-make.patch; \
-           file://man-1.5k-nonascii.patch; \
-           file://man-1.6e-security.patch; \
-           file://man-1.6e-mandirs.patch; \
-           file://man-1.5m2-bug11621.patch; \
-           file://man-1.5k-sofix.patch; \
-           file://man-1.5m2-buildroot.patch; \
-           file://man-1.6e-ro_usr.patch; \
+           file://man-1.5h1-make.patch \
+           file://man-1.5k-nonascii.patch \
+           file://man-1.6e-security.patch \
+           file://man-1.6e-mandirs.patch \
+           file://man-1.5m2-bug11621.patch \
+           file://man-1.5k-sofix.patch \
+           file://man-1.5m2-buildroot.patch \
+           file://man-1.6e-ro_usr.patch \
            file://man-1.5i2-newline.patch;striplevel=0 \
-           file://man-1.5j-utf8.patch; \
-           file://man-1.5i2-overflow.patch; \
-           file://man-1.5j-nocache.patch; \
-           file://man-1.5i2-initial.patch; \
+           file://man-1.5j-utf8.patch \
+           file://man-1.5i2-overflow.patch \
+           file://man-1.5j-nocache.patch \
+           file://man-1.5i2-initial.patch \
            file://man-1.5h1-gencat.patch;striplevel=0 \
-           file://man-1.5g-nonrootbuild.patch; \
+           file://man-1.5g-nonrootbuild.patch \
            file://man-1.5m2-tv_fhs.patch;striplevel=0 \
-           file://man-1.5j-i18n.patch; \
-           file://man-1.6e-whatis2.patch; \
-           file://man-1.6e-use_i18n_vars_in_a_std_way.patch; \
-           file://man-1.5m2-no-color-for-printing.patch; \
-           file://man-1.5m2-sigpipe.patch; \
-           file://man-1.6e-i18n_whatis.patch; \
-           file://man-1.6e-new_sections.patch; \
-           file://man*"
+           file://man-1.5j-i18n.patch \
+           file://man-1.6e-whatis2.patch \
+           file://man-1.6e-use_i18n_vars_in_a_std_way.patch \
+           file://man-1.5m2-no-color-for-printing.patch \
+           file://man-1.5m2-sigpipe.patch \
+           file://man-1.6e-i18n_whatis.patch \
+           file://man-1.6e-new_sections.patch \
+           file://man.1.gz \
+           file://man.7.gz \
+           file://man.conf \
+           file://manpath.5.gz"
 
 SRC_URI[md5sum] = "ba154d5796928b841c9c69f0ae376660"
 SRC_URI[sha256sum] = "ccdcb8c3f4e0080923d7e818f0e4a202db26c46415eaef361387c20995b8959f"
-- 
1.8.1.2.545.g2f19ada



