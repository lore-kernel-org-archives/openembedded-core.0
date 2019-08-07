Return-Path: <chin.huat.ang@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AAB0B7F45D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 05:59:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Aug 2019 22:52:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,356,1559545200"; d="scan'208";a="168519898"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga008.jf.intel.com with ESMTP; 06 Aug 2019 22:52:36 -0700
From: Chin Huat Ang <chin.huat.ang@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed,  7 Aug 2019 13:52:30 +0800
Message-Id: <1565157150-7729-4-git-send-email-chin.huat.ang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565157150-7729-1-git-send-email-chin.huat.ang@intel.com>
References: <1565157150-7729-1-git-send-email-chin.huat.ang@intel.com>
Subject: [warrior][PATCH 4/4] efibootmgr: Pass correct flags to compiler from pkg-config
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
X-List-Received-Date: Wed, 07 Aug 2019 05:59:41 -0000

From: Khem Raj <raj.khem@gmail.com>

efivar.h is in usr/include/efirvar directory so it should be
added to include search path via -I to compiler cmdline to fix

make[1]: *** No rule to make target 'efivar.h', needed by 'efibootmgr.o'.  Stop.
| make[1]: *** Waiting for unfinished jobs....

When running clang to generate dependencies -MM -MG -MF it still
parses the compile unit and complains if certain header is not found
where as gcc does not do that, hence the compile error is only seen
when compiling with clang.

(From OE-Core rev: db4fa7e765cb434119d816d86b943eeb62235601)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../97668ae0bce776a36ea2001dea63d376be8274ac.patch | 83 ++++++++++++++++++++++
 meta/recipes-bsp/efibootmgr/efibootmgr_17.bb       |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-bsp/efibootmgr/efibootmgr/97668ae0bce776a36ea2001dea63d376be8274ac.patch

diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr/97668ae0bce776a36ea2001dea63d376be8274ac.patch b/meta/recipes-bsp/efibootmgr/efibootmgr/97668ae0bce776a36ea2001dea63d376be8274ac.patch
new file mode 100644
index 0000000..9525ed8
--- /dev/null
+++ b/meta/recipes-bsp/efibootmgr/efibootmgr/97668ae0bce776a36ea2001dea63d376be8274ac.patch
@@ -0,0 +1,83 @@
+From 97668ae0bce776a36ea2001dea63d376be8274ac Mon Sep 17 00:00:00 2001
+From: Peter Jones <pjones@redhat.com>
+Date: Wed, 6 Mar 2019 13:08:33 -0500
+Subject: [PATCH] Make sure PKGS= is propogated into the submake for "make
+ deps"
+
+When we're doing make deps with "$(CC) -MF", gcc and clang have different
+behavior, both broken in different ways, which we're hitting because of a
+missing -I argument for libefivar's includes.  On clang, when a header can't
+be found, it emits a rule with the header as a prerequisite without a path,
+such as efivar.h here:
+
+efibootmgr.o: efibootmgr.c fix_coverity.h efivar.h efiboot.h \
+  /home/pjones/devel/github.com/efibootmgr/master/src/include/list.h \
+  /home/pjones/devel/github.com/efibootmgr/master/src/include/efi.h \
+  /home/pjones/devel/github.com/efibootmgr/master/src/include/unparse_path.h \
+  /home/pjones/devel/github.com/efibootmgr/master/src/include/efibootmgr.h \
+  error.h
+
+Then the build that utilizes that rule will fail to find the
+prerequisite and tell you something like:
+
+make[1]: *** No rule to make target 'efivar.h', needed by 'efibootmgr.o'.  Stop.
+make[1]: Leaving directory '/home/pjones/devel/github.com/efibootmgr/master/src'
+
+With gcc, when a header can't be found, it emits a rule without that header
+as a prerequisite, as such (again with efivar.h):
+
+efibootmgr.o: efibootmgr.c fix_coverity.h \
+ /home/pjones/devel/github.com/efibootmgr/master/src/include/list.h \
+ /home/pjones/devel/github.com/efibootmgr/master/src/include/efi.h \
+ /home/pjones/devel/github.com/efibootmgr/master/src/include/unparse_path.h \
+ /home/pjones/devel/github.com/efibootmgr/master/src/include/efi.h \
+ /home/pjones/devel/github.com/efibootmgr/master/src/include/efibootmgr.h \
+ error.h
+
+And then your build will fail if you haven't adjusted CFLAGS to tell it
+where to find the header.
+
+Both of these would be better just erroring, but at least gcc's doesn't
+insert a *wrong* dependency.
+
+This patch adds "PKGS=efivar efibootmgr popt" for all deps under src/.
+Technically that's overkill, as efibootmgr itself doesn't need popt, but it
+doesn't hurt anything to have the extra part there.  The resulting
+.efibootmgr.d file has the prerequisites expressed correctly:
+
+efibootmgr.o: efibootmgr.c fix_coverity.h /usr/include/efivar/efivar.h \
+ /usr/include/efivar/efiboot.h \
+ /home/pjones/devel/github.com/efibootmgr/master/src/include/list.h \
+ /home/pjones/devel/github.com/efibootmgr/master/src/include/efi.h \
+ /home/pjones/devel/github.com/efibootmgr/master/src/include/unparse_path.h \
+ /home/pjones/devel/github.com/efibootmgr/master/src/include/efi.h \
+ /home/pjones/devel/github.com/efibootmgr/master/src/include/efibootmgr.h \
+ error.h
+
+This fixes the issue described in github PR #96
+
+Signed-off-by: Peter Jones <pjones@redhat.com>
+Upstream-Status: Backport [https://github.com/rhboot/efibootmgr/commit/97668ae0bce776a36ea2001dea63d376be8274ac]
+---
+ src/Makefile | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 258bac1..32fa188 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -31,8 +31,13 @@ efibootdump : PKGS=efivar efiboot popt
+ efibootnext : $(call objects-of,$(EFIBOOTNEXT_SOURCES))
+ efibootnext : PKGS=efivar efiboot popt
+ 
++deps : PKGS=efivar efiboot popt
+ deps : $(ALL_SOURCES)
+-	$(MAKE) -f $(TOPDIR)/Make.deps deps SOURCES="$(ALL_SOURCES)" SUBDIR_CFLAGS="$(SUBDIR_CFLAGS)"
++	$(MAKE) -f $(TOPDIR)/Make.deps \
++		SOURCES="$(ALL_SOURCES)" \
++		SUBDIR_CFLAGS="$(SUBDIR_CFLAGS)" \
++		PKGS="$(PKGS)" \
++		deps
+ 
+ clean :
+ 	@rm -rfv *.o *.a *.so $(TARGETS)
diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
index 0e5a81e..5d6f200 100644
--- a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
+++ b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
@@ -12,6 +12,7 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
 SRC_URI = "git://github.com/rhinstaller/efibootmgr.git;protocol=https \
            file://0001-remove-extra-decl.patch \
+           file://97668ae0bce776a36ea2001dea63d376be8274ac.patch \
           "
 SRCREV = "e067160ecef8208e1944002e5d50b275733211fb"
 
-- 
2.7.4


