Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1QlMO2-00034S-5b
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 16:44:02 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with SMTP id p6PEIa5I006409
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 25 Jul 2011 16:18:37 +0200
Received: by ensc-virt.intern.sigma-chemnitz.de (sSMTP sendmail emulation);
	Mon, 25 Jul 2011 16:18:36 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jul 2011 16:18:26 +0200
Message-Id: <1311603506-14101-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.6
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.9
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.71 on 62.153.82.30
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] ncurses: enforce creation of pkg-config files
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
X-List-Received-Date: Mon, 25 Jul 2011 14:44:02 -0000

ncurses does not create its .pc files when the /usr/lib/pkg-config
directory does not exist in the sysroot.  Because ncurses will be built
very early, this directory might be missing and .pc files will not be
installed.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 .../ncurses/ncurses-5.9/pkgconfig-initial.patch    |   30 ++++++++++++++++++++
 meta/recipes-core/ncurses/ncurses_5.9.bb           |    3 +-
 2 files changed, 32 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/ncurses/ncurses-5.9/pkgconfig-initial.patch

diff --git a/meta/recipes-core/ncurses/ncurses-5.9/pkgconfig-initial.patch b/meta/recipes-core/ncurses/ncurses-5.9/pkgconfig-initial.patch
new file mode 100644
index 0000000..e0cc9b0
--- /dev/null
+++ b/meta/recipes-core/ncurses/ncurses-5.9/pkgconfig-initial.patch
@@ -0,0 +1,30 @@
+Do not check for the existence of /usr/lib/pkg-config directory
+
+directory might not exist yet when building oe from scratch.
+
+Index: ncurses-5.9/configure
+===================================================================
+--- ncurses-5.9.orig/configure
++++ ncurses-5.9/configure
+@@ -3626,7 +3626,7 @@ echo $ECHO_N "checking if we should inst
+		PKG_CONFIG_LIBDIR=`echo "$PKG_CONFIG" | sed -e 's,/[^/]*/[^/]*$,,'`/lib/pkgconfig
+	fi
+	PKG_CONFIG_LIBDIR=`echo "$PKG_CONFIG_LIBDIR" | sed -e 's/^://' -e 's/:.*//'`
+-	if test -n "$PKG_CONFIG_LIBDIR" && test -d "$PKG_CONFIG_LIBDIR" ; then
++	if test -n "$PKG_CONFIG_LIBDIR" ; then
+
+ # Check whether --enable-pc-files or --disable-pc-files was given.
+ if test "${enable_pc_files+set}" = set; then
+Index: ncurses-5.9/configure.in
+===================================================================
+--- ncurses-5.9.orig/configure.in
++++ ncurses-5.9/configure.in
+@@ -177,7 +177,7 @@ if test "$PKG_CONFIG" != no ; then
+		PKG_CONFIG_LIBDIR=`echo "$PKG_CONFIG" | sed -e 's,/[[^/]]*/[[^/]]*$,,'`/lib/pkgconfig
+	fi
+	PKG_CONFIG_LIBDIR=`echo "$PKG_CONFIG_LIBDIR" | sed -e 's/^://' -e 's/:.*//'`
+-	if test -n "$PKG_CONFIG_LIBDIR" && test -d "$PKG_CONFIG_LIBDIR" ; then
++	if test -n "$PKG_CONFIG_LIBDIR" ; then
+		AC_ARG_ENABLE(pc-files,
+			[  --enable-pc-files       generate and install .pc files for pkg-config],
+			[enable_pc_files=$enableval],
diff --git a/meta/recipes-core/ncurses/ncurses_5.9.bb b/meta/recipes-core/ncurses/ncurses_5.9.bb
index 6d23c0c..c980b73 100644
--- a/meta/recipes-core/ncurses/ncurses_5.9.bb
+++ b/meta/recipes-core/ncurses/ncurses_5.9.bb
@@ -1,9 +1,10 @@
 require ncurses.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 SRC_URI += "file://tic-hang.patch \
             file://config.cache \
+            file://pkgconfig-initial.patch \
 "
 
 SRC_URI[md5sum] = "8cb9c412e5f2d96bc6f459aa8c6282a1"
-- 
1.7.6



