Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrM-0004fO-Np
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:33 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Jan 2012 22:21:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752235"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:04 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:19:51 -0800
Message-Id: <40608dc059120208bcadf0d6f38e419c2f77bd31.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 065/113] dropbear: fix CRYPTLIB patch
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:33 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../dropbear-0.53.1-static_build_fix.patch         |   67 ++++++++++++++------
 meta/recipes-core/dropbear/dropbear_2011.54.bb     |    2 +-
 2 files changed, 49 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-core/dropbear/dropbear/dropbear-0.53.1-static_build_fix.patch b/meta/recipes-core/dropbear/dropbear/dropbear-0.53.1-static_build_fix.patch
index 14a8770..d125616 100644
--- a/meta/recipes-core/dropbear/dropbear/dropbear-0.53.1-static_build_fix.patch
+++ b/meta/recipes-core/dropbear/dropbear/dropbear-0.53.1-static_build_fix.patch
@@ -1,29 +1,58 @@
-Upstream-Status: Inappropriate [Pending]
-Get this patch from  buildroot maillist.
+Upstream-Status: Submitted
 
-dropbear: fix static build
 
-The latest release 0.53.1 change: lcrypt needs to be before object files for static linking
+dropbear: fix static build
 
-the -lcrypt is missing during the link
+A more appropriate fix is to remove @CRYPTLIB@ from the objs
+line, since it will cause problems with target checking,
+this change also meets the goals of the orignal change which
+was to not link libcrypt to all binaries.
 
 svr-authpasswd.o: In function `svr_auth_password':
 svr-authpasswd.c:(.text+0xfc): undefined reference to `crypt'
 collect2: ld returned 1 exit status
 
-Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj at jcrosoft.com>
-Signed-off-by: Mei Lei <lei.mei@intel.com>
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
-diff --git a/Makefile.in b/Makefile.in
-index 8d81647..0b9b769 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -77,7 +77,7 @@ STRIP=@STRIP@
- INSTALL=@INSTALL@
- CPPFLAGS=@CPPFLAGS@
- CFLAGS+=-I. -I$(srcdir) $(CPPFLAGS) @CFLAGS@
--LIBS+=@LIBS@
-+LIBS+=@CRYPTLIB@ @LIBS@
- LDFLAGS=@LDFLAGS@
+Index: dropbear-2011.54/Makefile.in
+===================================================================
+--- dropbear-2011.54.orig/Makefile.in	2011-11-08 04:48:15.000000000 -0800
++++ dropbear-2011.54/Makefile.in	2011-12-27 13:44:41.644354442 -0800
+@@ -56,7 +56,7 @@
+ 		loginrec.h atomicio.h x11fwd.h agentfwd.h tcpfwd.h compat.h \
+ 		listener.h fake-rfc2553.h
+ 
+-dropbearobjs=$(COMMONOBJS) $(CLISVROBJS) $(SVROBJS) @CRYPTLIB@ 
++dropbearobjs=$(COMMONOBJS) $(CLISVROBJS) $(SVROBJS)
+ dbclientobjs=$(COMMONOBJS) $(CLISVROBJS) $(CLIOBJS)
+ dropbearkeyobjs=$(COMMONOBJS) $(KEYOBJS)
+ dropbearconvertobjs=$(COMMONOBJS) $(CONVERTOBJS)
+@@ -158,7 +158,10 @@
+ dropbearkey: $(dropbearkeyobjs)
+ dropbearconvert: $(dropbearconvertobjs)
+ 
+-dropbear dbclient dropbearkey dropbearconvert: $(HEADERS) $(LIBTOM_DEPS) Makefile
++dropbear: $(HEADERS) $(LIBTOM_DEPS) Makefile
++	$(CC) $(LDFLAGS) -o $@$(EXEEXT) $($@objs) $(LIBS) @CRYPTLIB@
++
++dbclient dropbearkey dropbearconvert: $(HEADERS) $(LIBTOM_DEPS) Makefile
+ 	$(CC) $(LDFLAGS) -o $@$(EXEEXT) $($@objs) $(LIBS)
+ 
+ # scp doesn't use the libs so is special.
+@@ -169,14 +172,14 @@
+ # multi-binary compilation.
+ MULTIOBJS=
+ ifeq ($(MULTI),1)
+-	MULTIOBJS=dbmulti.o $(sort $(foreach prog, $(PROGRAMS), $($(prog)objs))) @CRYPTLIB@ 
++	MULTIOBJS=dbmulti.o $(sort $(foreach prog, $(PROGRAMS), $($(prog)objs)))
+ 	CFLAGS+=$(addprefix -DDBMULTI_, $(PROGRAMS)) -DDROPBEAR_MULTI
+ endif
+ 
+ dropbearmulti: multilink 
+ 
+ multibinary: $(HEADERS) $(MULTIOBJS) $(LIBTOM_DEPS) Makefile
+-	$(CC) $(LDFLAGS) -o dropbearmulti$(EXEEXT) $(MULTIOBJS) $(LIBS)
++	$(CC) $(LDFLAGS) -o dropbearmulti$(EXEEXT) $(MULTIOBJS) $(LIBS) @CRYPTLIB@
+ 
+ multilink: multibinary $(addprefix link, $(PROGRAMS))
  
- EXEEXT=@EXEEXT@
diff --git a/meta/recipes-core/dropbear/dropbear_2011.54.bb b/meta/recipes-core/dropbear/dropbear_2011.54.bb
index b7b4b83..1bd8bda 100644
--- a/meta/recipes-core/dropbear/dropbear_2011.54.bb
+++ b/meta/recipes-core/dropbear/dropbear_2011.54.bb
@@ -3,4 +3,4 @@ require dropbear.inc
 SRC_URI[md5sum] = "ce1e236c4a8df0cb95253defee6716b5"
 SRC_URI[sha256sum] = "a5fe60fa9c11e7b0f6a21ef6e86a53ce3d55236548901905070ff1c1716fbf47"
 
-PR = "r0"
+PR = "r1"
-- 
1.7.6.4



