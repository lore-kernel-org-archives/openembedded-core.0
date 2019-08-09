Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 108D37F3E9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2019 01:49:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,362,1559491200"; d="scan'208";a="73263269"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Aug 2019 09:49:18 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 9665E4CE0870
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2019 09:49:20 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 9 Aug 2019 09:49:20 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 9 Aug 2019 09:48:37 +0800
Message-ID: <20190809014837.21207-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 9665E4CE0870.A7A82
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libnewt:upgrade 0.52.20 -> 0.52.21
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
X-List-Received-Date: Fri, 09 Aug 2019 01:49:19 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Refresh the following patch:
	files/pie-flags.patch

-files/fix_SHAREDDIR.patch
 Removed since this is included in 0.52.21.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../newt/files/fix_SHAREDDIR.patch                 | 37 ----------------------
 meta/recipes-extended/newt/files/pie-flags.patch   | 27 +++++++++-------
 .../{libnewt_0.52.20.bb => libnewt_0.52.21.bb}     |  5 ++-
 3 files changed, 18 insertions(+), 51 deletions(-)
 delete mode 100644 meta/recipes-extended/newt/files/fix_SHAREDDIR.patch
 rename meta/recipes-extended/newt/{libnewt_0.52.20.bb => libnewt_0.52.21.bb} (89%)

diff --git a/meta/recipes-extended/newt/files/fix_SHAREDDIR.patch b/meta/recipes-extended/newt/files/fix_SHAREDDIR.patch
deleted file mode 100644
index b0a1e8c..0000000
--- a/meta/recipes-extended/newt/files/fix_SHAREDDIR.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Upstream-Status: Pending
-
-Author: dexuan.cui@intel.com
-Date: Fri Apr 15 16:17:39 CST 2011
-
-The patch fixes a parallel-make issue: when generating $(SHAREDDIR)/%.o, we should
-ensure the directory ${SHAREDDIR} exists.
-
-We need to push the patch to upstream.
-
-Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- Makefile.in | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -128,12 +128,12 @@ $(SHAREDDIR):
- 
- sharedlib: $(LIBNEWTSH)
- 
--$(LIBNEWTSH): $(SHAREDDIR) $(SHAREDOBJS)
-+$(LIBNEWTSH): $(SHAREDOBJS)
- 	$(CC) -shared -o $(LIBNEWTSH) $(SHLIBFLAGS) $(SHAREDOBJS) $(LDFLAGS) $(LIBS)
- 	ln -fs $(LIBNEWTSONAME) libnewt.$(SOEXT)
- 	ln -fs $(LIBNEWTSH) $(LIBNEWTSONAME)
- 
--$(SHAREDDIR)/%.o : %.c
-+$(SHAREDDIR)/%.o : %.c $(SHAREDDIR)
- 	$(CC) $(SHCFLAGS) -c $(CFLAGS) $(CPPFLAGS) -o $@ $<
- 
- install: $(LIBNEWT) install-sh whiptail
--- 
-1.8.1.2
-
diff --git a/meta/recipes-extended/newt/files/pie-flags.patch b/meta/recipes-extended/newt/files/pie-flags.patch
index 8883e26..92f5b25 100644
--- a/meta/recipes-extended/newt/files/pie-flags.patch
+++ b/meta/recipes-extended/newt/files/pie-flags.patch
@@ -1,7 +1,4 @@
-specify -fPIC after CFLAGS so it can override the CFLAGS containing -pie and -fpie
-this makes sure the objects that go into shared objects are compiled with -fPIC
-and not with -fpie. We can not use -fpie on objects which will go into .so files
-Fixes errors like
+specify -fPIC after CFLAGS so it can override the CFLAGS containing -pie and -fpie this makes sure the objects that go into shared objects are compiled with -fPIC and not with -fpie. We can not use -fpie on objects which will go into .so files Fixes errors like
 
 | /mnt/oe/build/tmp-glibc/sysroots/x86_64-linux/usr/libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/5.3.0/ld: shared/newt.o: relocation R_X86_64_PC32 against undefined symbol `SLtt_Screen_Rows@@SLANG2' can not be used when making a shared object; recompile with -fPIC
 | /mnt/oe/build/tmp-glibc/sysroots/x86_64-linux/usr/libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/5.3.0/ld: final link failed: Bad value
@@ -10,10 +7,15 @@ Fixes errors like
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
-Index: newt-0.52.18/Makefile.in
-===================================================================
---- newt-0.52.18.orig/Makefile.in
-+++ newt-0.52.18/Makefile.in
+
+---
+ Makefile.in | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index be5f87b..88ee0b7 100644
+--- a/Makefile.in
++++ b/Makefile.in
 @@ -96,8 +96,8 @@ _snack.$(SOEXT):   snack.c $(LIBNEWTSH)
  		PIFLAGS=`$$pyconfig --includes`; \
  		PLDFLAGS=`$$pyconfig --ldflags`; \
@@ -25,12 +27,15 @@ Index: newt-0.52.18/Makefile.in
  		echo $(CC) --shared $$PLDFLAGS $$PLFLAGS $(LDFLAGS) -o $$ver/_snack.$(SOEXT) $$ver/snack.o -L.  -lnewt $(LIBS); \
  		$(CC) --shared $$PLDFLAGS $$PLFLAGS $(LDFLAGS) -o $$ver/_snack.$(SOEXT) $$ver/snack.o -L.  -lnewt $(LIBS); \
  	done || :
-@@ -135,7 +135,7 @@ $(LIBNEWTSH): $(SHAREDOBJS)
- 	ln -fs $(LIBNEWTSH) $(LIBNEWTSONAME)
+@@ -133,7 +133,7 @@ $(LIBNEWTSH): $(SHAREDOBJS)
  
- $(SHAREDDIR)/%.o : %.c $(SHAREDDIR)
+ $(SHAREDDIR)/%.o : %.c
+ 	@mkdir -p $(SHAREDDIR)
 -	$(CC) $(SHCFLAGS) -c $(CFLAGS) $(CPPFLAGS) -o $@ $<
 +	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(SHCFLAGS) -o $@ $<
  
  install: $(LIBNEWT) install-sh whiptail
  	[ -d $(instroot)/$(bindir) ] || install -m 755 -d $(instroot)/$(bindir)
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/newt/libnewt_0.52.20.bb b/meta/recipes-extended/newt/libnewt_0.52.21.bb
similarity index 89%
rename from meta/recipes-extended/newt/libnewt_0.52.20.bb
rename to meta/recipes-extended/newt/libnewt_0.52.21.bb
index dc07a18..09b61be 100644
--- a/meta/recipes-extended/newt/libnewt_0.52.20.bb
+++ b/meta/recipes-extended/newt/libnewt_0.52.21.bb
@@ -18,15 +18,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 DEPENDS = "slang popt python3"
 
 SRC_URI = "https://releases.pagure.org/newt/newt-${PV}.tar.gz \
-           file://fix_SHAREDDIR.patch \
            file://cross_ar.patch \
            file://Makefile.in-Add-tinfo-library-to-the-linking-librari.patch \
            file://pie-flags.patch \
            file://0001-detect-gold-as-GNU-linker-too.patch \
 "
 
-SRC_URI[md5sum] = "70b288f821234593a8e7920e435b259b"
-SRC_URI[sha256sum] = "8d66ba6beffc3f786d4ccfee9d2b43d93484680ef8db9397a4fb70b5adbb6dbc"
+SRC_URI[md5sum] = "a0a5fd6b53bb167a65e15996b249ebb5"
+SRC_URI[sha256sum] = "265eb46b55d7eaeb887fca7a1d51fe115658882dfe148164b6c49fccac5abb31"
 
 S = "${WORKDIR}/newt-${PV}"
 
-- 
2.7.4




