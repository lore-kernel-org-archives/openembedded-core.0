Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2494D6F2D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 16:37:32 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 28 Feb 2014 08:37:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,562,1389772800"; d="scan'208";a="490064842"
Received: from davidllo-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.227])
	by fmsmga002.fm.intel.com with ESMTP; 28 Feb 2014 08:37:32 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2014 16:37:23 +0000
Message-Id: <b05cf2dbbc02b9b21cc076fcba58892f08471bfb.1393605405.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1393605405.git.paul.eggleton@linux.intel.com>
References: <cover.1393605405.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1393605405.git.paul.eggleton@linux.intel.com>
References: <cover.1393605405.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/6] dropbear: upgrade to 2014.63
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
X-List-Received-Date: Fri, 28 Feb 2014 16:37:32 -0000

Drop 0002-static_build_fix.patch since an equivalent fix has been merged
upstream.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/dropbear/dropbear.inc            |  1 -
 .../dropbear/dropbear/0002-static_build_fix.patch  | 64 ----------------------
 meta/recipes-core/dropbear/dropbear_2013.62.bb     |  4 --
 meta/recipes-core/dropbear/dropbear_2014.63.bb     |  4 ++
 4 files changed, 4 insertions(+), 69 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear/0002-static_build_fix.patch
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2013.62.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2014.63.bb

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index d5fceec..40ed9d2 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -14,7 +14,6 @@ DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://0001-urandom-xauth-changes-to-options.h.patch \
-           file://0002-static_build_fix.patch \
            file://0003-configure.patch \
            file://0004-fix-2kb-keys.patch \
            file://0007-dropbear-fix-for-x32-abi.patch \
diff --git a/meta/recipes-core/dropbear/dropbear/0002-static_build_fix.patch b/meta/recipes-core/dropbear/dropbear/0002-static_build_fix.patch
deleted file mode 100644
index 552bee8..0000000
--- a/meta/recipes-core/dropbear/dropbear/0002-static_build_fix.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-Subject: [PATCH 2/6] static_build_fix
-Upstream-Status: Submitted
-
-dropbear: fix static build
-
-A more appropriate fix is to remove @CRYPTLIB@ from the objs
-line, since it will cause problems with target checking,
-this change also meets the goals of the orignal change which
-was to not link libcrypt to all binaries.
-
-svr-authpasswd.o: In function `svr_auth_password':
-svr-authpasswd.c:(.text+0xfc): undefined reference to `crypt'
-collect2: ld returned 1 exit status
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
----
- Makefile.in | 11 +++++++----
- 1 file changed, 7 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 4bdd845..e82e561 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -56,7 +56,7 @@ HEADERS=options.h dbutil.h session.h packet.h algo.h ssh.h buffer.h kex.h \
- 		loginrec.h atomicio.h x11fwd.h agentfwd.h tcpfwd.h compat.h \
- 		listener.h fake-rfc2553.h
- 
--dropbearobjs=$(COMMONOBJS) $(CLISVROBJS) $(SVROBJS) @CRYPTLIB@ 
-+dropbearobjs=$(COMMONOBJS) $(CLISVROBJS) $(SVROBJS)
- dbclientobjs=$(COMMONOBJS) $(CLISVROBJS) $(CLIOBJS)
- dropbearkeyobjs=$(COMMONOBJS) $(KEYOBJS)
- dropbearconvertobjs=$(COMMONOBJS) $(CONVERTOBJS)
-@@ -158,7 +158,10 @@ dbclient: $(dbclientobjs)
- dropbearkey: $(dropbearkeyobjs)
- dropbearconvert: $(dropbearconvertobjs)
- 
--dropbear dbclient dropbearkey dropbearconvert: $(HEADERS) $(LIBTOM_DEPS) Makefile
-+dropbear: $(HEADERS) $(LIBTOM_DEPS) Makefile
-+	$(CC) $(LDFLAGS) -o $@$(EXEEXT) $($@objs) $(LIBS) @CRYPTLIB@
-+
-+dbclient dropbearkey dropbearconvert: $(HEADERS) $(LIBTOM_DEPS) Makefile
- 	$(CC) $(LDFLAGS) -o $@$(EXEEXT) $($@objs) $(LIBS)
- 
- # scp doesn't use the libs so is special.
-@@ -169,14 +172,14 @@ scp: $(SCPOBJS)  $(HEADERS) Makefile
- # multi-binary compilation.
- MULTIOBJS=
- ifeq ($(MULTI),1)
--	MULTIOBJS=dbmulti.o $(sort $(foreach prog, $(PROGRAMS), $($(prog)objs))) @CRYPTLIB@ 
-+	MULTIOBJS=dbmulti.o $(sort $(foreach prog, $(PROGRAMS), $($(prog)objs)))
- 	CFLAGS+=$(addprefix -DDBMULTI_, $(PROGRAMS)) -DDROPBEAR_MULTI
- endif
- 
- dropbearmulti: multilink 
- 
- multibinary: $(HEADERS) $(MULTIOBJS) $(LIBTOM_DEPS) Makefile
--	$(CC) $(LDFLAGS) -o dropbearmulti$(EXEEXT) $(MULTIOBJS) $(LIBS)
-+	$(CC) $(LDFLAGS) -o dropbearmulti$(EXEEXT) $(MULTIOBJS) $(LIBS) @CRYPTLIB@
- 
- multilink: multibinary $(addprefix link, $(PROGRAMS))
- 
--- 
-1.7.11.7
-
diff --git a/meta/recipes-core/dropbear/dropbear_2013.62.bb b/meta/recipes-core/dropbear/dropbear_2013.62.bb
deleted file mode 100644
index 3cae940..0000000
--- a/meta/recipes-core/dropbear/dropbear_2013.62.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require dropbear.inc
-
-SRC_URI[md5sum] = "ca2c7932a1399cf361f795aaa3843998"
-SRC_URI[sha256sum] = "c6656302bbcc54b0a9c361f505822f6994039117ec32d2897ead3364da079ffa"
diff --git a/meta/recipes-core/dropbear/dropbear_2014.63.bb b/meta/recipes-core/dropbear/dropbear_2014.63.bb
new file mode 100644
index 0000000..bb7e617
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear_2014.63.bb
@@ -0,0 +1,4 @@
+require dropbear.inc
+
+SRC_URI[md5sum] = "7066bb9a2da708f3ed06314fdc9c47fd"
+SRC_URI[sha256sum] = "595992de432ba586a0e7e191bbb1ad587727678bb3e345b018c395b8c55b57ae"
-- 
1.8.5.3


