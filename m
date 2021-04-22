Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.13417.1619102483135542514
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 07:41:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1lZaW6-0002US-Iw; Thu, 22 Apr 2021 17:41:19 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.92)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1lZaW6-00066u-HY; Thu, 22 Apr 2021 17:41:18 +0300
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@bmw.de>
Subject: [PATCH 1/2] unzip: use optimization from bitbake
Date: Thu, 22 Apr 2021 17:41:14 +0300
Message-Id: <20210422144114.23157-1-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Rspam-Score: 2.3 (++)
X-Rspam-Report: Action: no action
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(2.50)
 Symbol: BROKEN_CONTENT_TYPE(1.50)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Message-ID: 20210422144114.23157-1-mikko.rapeli@bmw.de
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Content-Transfer-Encoding: 8bit

Build with bitbake default optimizations, e.g. O2,
instead of custom O3. Reduces unzip binary package
size from 304401 to 283921 bytes, and enables building
with Os to even further reduce binary size if needed
and configured for the whole system.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 .../unzip/unzip/unzip_optimization.patch      | 127 ++++++++++++++++++
 meta/recipes-extended/unzip/unzip_6.0.bb      |   1 +
 2 files changed, 128 insertions(+)
 create mode 100644 meta/recipes-extended/unzip/unzip/unzip_optimization.patch

diff --git a/meta/recipes-extended/unzip/unzip/unzip_optimization.patch b/meta/recipes-extended/unzip/unzip/unzip_optimization.patch
new file mode 100644
index 0000000000..4bab7b26af
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/unzip_optimization.patch
@@ -0,0 +1,127 @@
+unzip: use optimization from bitbake
+
+Remove -O3 optimizations to use bitbake default optimization levels.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
+
+diff -rup unix-orig/configure unix/configure
+--- a/unix-orig/configure	2021-04-16 10:25:03.120858292 +0000
++++ b/unix/configure	2021-04-16 10:46:43.292546138 +0000
+@@ -70,7 +70,7 @@ int main()
+ _EOF_
+   $CC $CFLAGS -c conftest.c > /dev/null 2>/dev/null
+   if test $? -eq 0; then
+-    CFLAGS_OPT='-O3'
++    CFLAGS_OPT=''
+     echo "  DEC C ($CFLAGS_OPT)"
+   else
+     # HP-UX HP C?
+@@ -111,7 +111,7 @@ int main()
+ _EOF_
+       $CC $CFLAGS -c conftest.c > /dev/null 2>/dev/null
+       if test $? -eq 0; then
+-        CFLAGS_OPT='-O3'
++        CFLAGS_OPT=''
+         echo "  GNU C ($CFLAGS_OPT)"
+ 	# Special Mac OS X shared library "ld" option?
+         if test ` uname -s 2> /dev/null ` = 'Darwin'; then
+diff -rup unix-orig/Makefile unix/Makefile
+--- a/unix-orig/Makefile	2021-04-16 10:25:03.000863878 +0000
++++ b/unix/Makefile	2021-04-16 10:47:31.658299278 +0000
+@@ -47,7 +47,7 @@ LD = $(CC)#	must match, else "unresolved
+ AS = as
+ LOC = $(D_USE_BZ2) $(LOCAL_UNZIP)
+ AF = $(LOC)
+-CFLAGS = -O
++CFLAGS = 
+ CF_NOOPT = -I. -I$(IZ_BZIP2) -DUNIX $(LOC)
+ CF = $(CFLAGS) $(CF_NOOPT)
+ LFLAGS1 =
+@@ -594,12 +594,12 @@ generic_shlib:	unix_make
+ 	@echo\
+  'which is UnZip linked with the DLL).  This target is an example only.'
+ 	@echo ""
+-	$(MAKE) objsdll CC=gcc CFLAGS="-O3 -Wall -fPIC -DDLL"
++	$(MAKE) objsdll CC=gcc CFLAGS="-Wall -fPIC -DDLL"
+ 	gcc -shared -Wl,-soname,libunzip.so.0 -o libunzip.so.0.4 $(OBJSDLL)
+ 	$(RM) libunzip.so.0 libunzip.so
+ 	$(LN) -s libunzip.so.0.4 libunzip.so.0
+ 	$(LN) -s libunzip.so.0 libunzip.so
+-	gcc -c -O unzipstb.c
++	gcc -c unzipstb.c
+ 	gcc -o unzip_shlib unzipstb.o -L. -lunzip
+ 
+ #----------------------------------------------------------------------------
+@@ -775,7 +775,7 @@ freebsd:		unix_make
+ # with "echo" instead).
+ #
+ gcc:		unix_make
+-	$(MAKE) unzips CC=gcc LD=gcc CFLAGS="-O3" LF2=""
++	$(MAKE) unzips CC=gcc LD=gcc CFLAGS="" LF2=""
+ 
+ # Heurikon HK68 (68010), UniPlus+ System V 5.0, Green Hills C-68000
+ hk68:		unix_make
+@@ -792,7 +792,7 @@ isc:		unix_make
+ isc_gcc:	unix_make
+ 	$(MAKE) unzips AS=gcc CC=gcc LD=gcc CRCA_O=crc_gcc$O \
+ 	 LF="-shlib $(LF)" SL="-shlib $(SL)" FL="-shlib $(FL)" LF2="" \
+-	 CFLAGS="-O3" LOC="-DSYSV -DASM_CRC -DNO_UID_GID -DNEED_PTEM -DNO_LCHOWN -DNO_LCHMOD $(LOC)" \
++	 CFLAGS="" LOC="-DSYSV -DASM_CRC -DNO_UID_GID -DNEED_PTEM -DNO_LCHOWN -DNO_LCHMOD $(LOC)" \
+ 	 AF="-DNO_UNDERLINE -Djecxz=jcxz -DALIGNMENT='.align 16' $(AF)"
+ 	$(STRIP) $(UNZIPS)
+ 
+@@ -808,7 +808,7 @@ isi:		unix_make
+ linux:		unix_make
+ 	@echo 'NOTE:  use linux_noasm target for non-Intel Linux compiles.'
+ 	$(MAKE) unzips CC=gcc LD=gcc AS=gcc\
+-	 CFLAGS="-O3 -Wall -DASM_CRC"\
++	 CFLAGS="-Wall -DASM_CRC"\
+ 	 AF="-Di386 $(AF)" CRCA_O=crc_gcc$O
+ # GRR:  this echo is pointless; if user gets this far, no difference to install
+ #	@echo 'Be sure to use the install_asm target rather than the install target'
+@@ -818,14 +818,14 @@ linux_asm:	linux
+ # Linux (Posix, approximately SysV):  virtually any version since before 0.96,
+ # for any platform.  Change "-O" to "-O3" or whatever, as desired...
+ linux_noasm:	unix_make
+-	$(MAKE) unzips CC=gcc LD=gcc CFLAGS="-O -Wall"
++	$(MAKE) unzips CC=gcc LD=gcc CFLAGS="-Wall"
+ 
+ # Linux with lcc compiler:  __inline__ (stat.h) not recognized, and must edit
+ # /usr/include/gnu/types.h to get rid of "long long" if __LCC__ defined.  -O3
+ # (or -O2 or -O) is ignored.  [GRR 960828: test target only]
+ #
+ linux_lcc:	unix_make
+-	$(MAKE) unzips CC=lcc LD=lcc CFLAGS="-O3 -Wall -D__inline__= "
++	$(MAKE) unzips CC=lcc LD=lcc CFLAGS="-Wall -D__inline__= "
+ 
+ # Linux host with go32 (djgpp) cross-compiler (go32crs.tgz) for 32-bit DOS.
+ linux_dos:	unix_make
+@@ -844,7 +844,7 @@ linux_dos:	unix_make
+ # library).
+ #
+ linux_shlib:	unix_make
+-	$(MAKE) objsdll CC=gcc CFLAGS="-O3 -Wall -fPIC"\
++	$(MAKE) objsdll CC=gcc CFLAGS="-Wall -fPIC"\
+ 	 LOC="-DDLL -DASM_CRC $(LOC)"\
+ 	 AS=gcc AF="-fPIC -Di386 $(AF)" CRCA_O=crc_gcc$O
+ 	gcc -shared -Wl,-soname,libunzip.so.0 -o libunzip.so.0.4 $(OBJSDLL)\
+@@ -858,7 +858,7 @@ linux_shlib:	unix_make
+ # instead of the original UnZip version.  (libz was libgz prior to 0.94)
+ linux_shlibz:	unix_make
+ 	$(MAKE) objsdll CC=gcc AS=gcc AF="-fPIC -Di386 $(AF)" CRCA_O=crc_gcc$O\
+-	 CFLAGS="-O3 -Wall -fPIC" LOC="-DDLL -DUSE_ZLIB -DASM_CRC $(LOC)"
++	 CFLAGS="-Wall -fPIC" LOC="-DDLL -DUSE_ZLIB -DASM_CRC $(LOC)"
+ 	gcc -shared -Wl,-soname,libunzip.so.0 -o libunzip.so.0.4 $(OBJSDLL)\
+ 	 crc_gcc.pic.o
+ 	ln -sf libunzip.so.0.4 libunzip.so.0
+@@ -871,7 +871,7 @@ lynx:		unix_make
+ 
+ # Macintosh MacOS X (Unix-compatible enviroment), using standard compiler
+ macosx:	unix_make
+-	$(MAKE) unzips CFLAGS="-O3 -Wall -DBSD" LF2=""
++	$(MAKE) unzips CFLAGS="-Wall -DBSD" LF2=""
+ 	$(STRIP) $(UNZIPS)
+ 
+ # Macintosh MacOS X (Unix-compatible enviroment), using gcc
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index 0c56a39d92..ec69508eea 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -26,6 +26,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
 	file://CVE-2019-13232_p1.patch \
 	file://CVE-2019-13232_p2.patch \
 	file://CVE-2019-13232_p3.patch \
+	file://unzip_optimization.patch \
 "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.20.1

