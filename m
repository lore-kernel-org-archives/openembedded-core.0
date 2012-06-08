Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1Sd2Qx-0006Hc-8S
	for Openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 18:53:21 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q58GgcPB020842
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 8 Jun 2012 09:42:38 -0700 (PDT)
Received: from ord-lpggp2.wrs.com (128.224.65.244) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 8 Jun 2012 09:42:37 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Fri, 8 Jun 2012 11:43:47 -0500
Message-ID: <1339173827-61084-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH] libnewt: Fix cross link using autoconf detected AR
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Jun 2012 16:53:21 -0000
Content-Type: text/plain

If building on 32bit host and creating 64bit libraries, the target
package builds should not invoke the 32bit hosts's ar.  Specifically
you will get an error message like:

x86_64-linux-gcc    -m64 --sysroot=/opt/qemux86-64/tmp/sysroots/qemux86-64 -g -o test test.o libnewt.a -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -lslang
libnewt.a: could not read symbols: Archive has no index; run ranlib to add one
collect2: error: ld returned 1 exit status

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/recipes-extended/newt/files/cross_ar.patch |   51 +++++++++++++++++++++++
 meta/recipes-extended/newt/libnewt_0.52.14.bb   |    5 +-
 2 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/newt/files/cross_ar.patch

diff --git a/meta/recipes-extended/newt/files/cross_ar.patch b/meta/recipes-extended/newt/files/cross_ar.patch
new file mode 100644
index 0000000..f67239a
--- /dev/null
+++ b/meta/recipes-extended/newt/files/cross_ar.patch
@@ -0,0 +1,51 @@
+Fix cross link using autoconf detected AR
+
+If building on 32bit host and creating 64bit libraries, the target
+package builds should not invoke the 32bit hosts's ar.  Specifically
+you will get an error message like:
+
+x86_64-linux-gcc    -m64 --sysroot=/opt/qemux86-64/tmp/sysroots/qemux86-64 -g -o test test.o libnewt.a -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -lslang
+libnewt.a: could not read symbols: Archive has no index; run ranlib to add one
+collect2: error: ld returned 1 exit status
+
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+
+Upstream-Status: Pending
+
+---
+ Makefile.in  |    3 ++-
+ configure.ac |    4 ++++
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -7,6 +7,7 @@ CFLAGS = @CFLAGS@
+ LDFLAGS = @LDFLAGS@
+ CPPFLAGS = -D_GNU_SOURCE @CPPFLAGS@ 
+ GNU_LD = @GNU_LD@
++AR = @AR@
+ 
+ VERSION = @VERSION@
+ TAG = r$(subst .,-,$(VERSION))
+@@ -95,7 +96,7 @@ whiptcl.so: $(WHIPTCLOBJS) $(LIBNEWTSH)
+ 	$(CC) -shared $(SHCFLAGS) $(LDFLAGS) -o whiptcl.so $(WHIPTCLOBJS) -L. -lnewt  $(LIBTCL) -lpopt $(LIBS)
+ 
+ $(LIBNEWT): $(LIBOBJS)
+-	ar rv $@ $^
++	$(AR) rv $@ $^
+ 
+ newt.o $(SHAREDDIR)/newt.o: newt.c Makefile
+ 
+--- a/configure.ac
++++ b/configure.ac
+@@ -14,6 +14,10 @@ AC_PROG_CC
+ AC_PROG_INSTALL
+ AC_PROG_LN_S
+ AC_PROG_GREP
++AN_MAKEVAR([AR], [AC_PROG_AR])
++AN_PROGRAM([ar], [AC_PROG_AR])
++AC_DEFUN([AC_PROG_AR], [AC_CHECK_TOOL(AR, ar, :)])
++AC_PROG_AR
+ 
+ # Are we using GNU ld?
+ AC_MSG_CHECKING([for GNU ld])
diff --git a/meta/recipes-extended/newt/libnewt_0.52.14.bb b/meta/recipes-extended/newt/libnewt_0.52.14.bb
index 8a89eb7..0208695 100644
--- a/meta/recipes-extended/newt/libnewt_0.52.14.bb
+++ b/meta/recipes-extended/newt/libnewt_0.52.14.bb
@@ -17,11 +17,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 # slang needs to be >= 2.2
 DEPENDS = "slang popt"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "https://fedorahosted.org/releases/n/e/newt/newt-${PV}.tar.gz \
            file://remove_slang_include.patch \
-           file://fix_SHAREDDIR.patch"
+           file://fix_SHAREDDIR.patch \
+           file://cross_ar.patch"
 
 SRC_URI[md5sum] = "eb78c6bb658b92ec7198908b5b8d0e37"
 SRC_URI[sha256sum] = "f70f4f58baa60388ddf2e39249ffb00898fb40f2b2767e42e2ab51fe4b40978e"
-- 
1.7.1



