Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D54167340E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 08:15:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1D8FbA8020944
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 00:15:37 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 13 Feb 2015 00:15:37 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Feb 2015 00:15:26 -0800
Message-ID: <94950066b1f4f4747d1e1cbaea350b6b520be245.1423808841.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1423808841.git.liezhi.yang@windriver.com>
References: <cover.1423808841.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/12] tcp-wrappers: fix and enable parallel build
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
X-List-Received-Date: Fri, 13 Feb 2015 08:15:37 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../tcp-wrappers-7.6/makefile-fix-parallel.patch   |   54 ++++++++++++++++++++
 .../tcp-wrappers/tcp-wrappers_7.6.bb               |    6 +--
 2 files changed, 57 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/makefile-fix-parallel.patch

diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/makefile-fix-parallel.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/makefile-fix-parallel.patch
new file mode 100644
index 0000000..7973525
--- /dev/null
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/makefile-fix-parallel.patch
@@ -0,0 +1,54 @@
+From daf89d272e51b2153015ce7f54ab0b86182e64c1 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 28 Jan 2015 18:50:23 -0800
+Subject: [PATCH] Makefile: fix for parallel build
+
+Fixed:
+make: *** No rule to make target `cflags', needed by `tcpd.o'.  Stop.
+
+Let "cflags" depend on config-check which generates cflgas will fix the
+problem.
+
+Also fixed:
+Fatal error: can't create shared/hosts_access.o: No such file or directory
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ Makefile |    5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index fe5e732..f468751 100644
+--- a/Makefile
++++ b/Makefile
+@@ -714,6 +714,7 @@ KIT	= README miscd.c tcpd.c fromhost.c hosts_access.c shell_cmd.c \
+ LIB	= libwrap.a
+ 
+ shared/%.o: %.c
++	[ -d shared ] || mkdir -p shared
+ 	$(CC) $(CFLAGS) $(SHCFLAGS) -c $< -o $@
+ 
+ SOMAJOR = 0
+@@ -730,6 +731,8 @@ SHLIB_OBJ= $(addprefix shared/, $(LIB_OBJ));
+ 
+ all other: config-check tcpd tcpdmatch try-from safe_finger tcpdchk $(LIB)
+ 
++cflags: config-check
++
+ # Invalidate all object files when the compiler options (CFLAGS) have changed.
+ 
+ config-check:
+@@ -739,7 +742,7 @@ config-check:
+ 	then rm cflags.new ; \
+ 	else mv cflags.new cflags ; \
+ 	fi >/dev/null 2>/dev/null
+-	@if [ ! -d shared ]; then mkdir shared; fi
++	@[ -d shared ] || mkdir -p shared
+ 
+ $(LIB):	$(LIB_OBJ)
+ 	rm -f $(LIB)
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
index 4d64306..2630478 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -40,16 +40,16 @@ SRC_URI = "ftp://ftp.porcupine.org/pub/security/tcp_wrappers_${PV}.tar.gz \
            file://tcpdchk_libwrapped.patch \
            file://ldflags.patch \
            file://rename_strings_variable.patch \
-           \
            file://try-from.8 \
-           file://safe_finger.8"
+           file://safe_finger.8 \
+           file://makefile-fix-parallel.patch \
+           "
 
 SRC_URI[md5sum] = "e6fa25f71226d090f34de3f6b122fb5a"
 SRC_URI[sha256sum] = "9543d7adedf78a6de0b221ccbbd1952e08b5138717f4ade814039bb489a4315d"
 
 S = "${WORKDIR}/tcp_wrappers_${PV}"
 
-PARALLEL_MAKE = ""
 EXTRA_OEMAKE = "'CC=${CC}' \
                 'AR=${AR}' \
                 'RANLIB=${RANLIB}' \
-- 
1.7.9.5


