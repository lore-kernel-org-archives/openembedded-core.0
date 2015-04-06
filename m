Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2A30672A51
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 17:37:00 +0000 (UTC)
Received: by iget9 with SMTP id t9so5086602ige.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Apr 2015 10:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LGUVGgPoW7KaMuglePJRFHumbcP4NZ4CjoS8afCzRDc=;
	b=yM5Zg2DAm60cVYXV1SjCXQW/eycUWaF80BUacndzS7GN03rCXcQWtA+0Y4JmIXRwLI
	q+JbEn0MZvHUYYe0Y12D7eRPJ8tlvwHsermdOpDIiQJEnXywhh2T6JSJnNjbK9DEc1WK
	MEw7sWWx96xoaOJ6kSzgO2tqmJAg9l3l9kqNH4DGKKo7jfBpuBzwh9oTgUWm0Kg/8mmj
	ptOA5TjH6ligJjJLzUwIRTLyKKsXRLd4m/H0cYOLbiLE2LB912GsI4zRlBDk5v7YbMSk
	o4QIYQqpMbhI0gg6VbQozyvtCW/Y82Pj7DdgrqBSkDRuZPRAAOVzG0c9TVYDZpxu6Mux
	0NDg==
X-Received: by 10.50.43.163 with SMTP id x3mr24802576igl.6.1428341822031;
	Mon, 06 Apr 2015 10:37:02 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id 7sm3063135iol.43.2015.04.06.10.37.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Apr 2015 10:37:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Apr 2015 17:36:29 +0000
Message-Id: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1428341477.git.raj.khem@gmail.com>
References: <cover.1428341477.git.raj.khem@gmail.com>
Subject: [PATCH 01/24] ncurses: Upgrade 4.9 stable to latest patchlevel 20150329
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
X-List-Received-Date: Mon, 06 Apr 2015 17:37:01 -0000

gcc5 barfs on older release

Change-Id: Ib1ad9b1cf7f16eb454da21fd61dc56fe1d9f6783
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/ncurses/ncurses.inc    | 14 ++++++++++++--
 meta/recipes-core/ncurses/ncurses_5.9.bb |  8 +++++---
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 10f7dd1..225e369 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -13,7 +13,7 @@ BINCONFIG = "${bindir}/ncurses-config"
 inherit autotools binconfig-disabled multilib_header
 
 # Upstream has useful patches at times at ftp://invisible-island.net/ncurses/
-SRC_URI = "${GNU_MIRROR}/ncurses/ncurses-${PV}.tar.gz"
+SRC_URI = "ftp://invisible-island.net/${BPN}/current/${BP}-${REVISION}.tgz"
 
 EXTRA_AUTORECONF = "-I m4"
 CONFIG_SITE =+ "${WORKDIR}/config.cache"
@@ -97,6 +97,8 @@ do_configure() {
         # broken because it requires stdin to be pollable (which is
         # not the case for /dev/null redirections)
         export cf_cv_working_poll=yes
+	#Remove ${includedir} from CPPFLAGS, need for cross compile
+	sed -i 's#-I${cf_includedir}##g' ${S}/configure || die "sed CPPFLAGS"
 
 	# The --enable-pc-files requires PKG_CONFIG_LIBDIR existed
 	mkdir -p ${PKG_CONFIG_LIBDIR}
@@ -105,6 +107,7 @@ do_configure() {
 		return 1
 	! ${ENABLE_WIDEC} || \
 		ncurses_configure "widec" "--enable-widec" "--without-progs"
+
 }
 
 do_compile() {
@@ -231,7 +234,14 @@ do_install() {
             # At some point we can rely on coreutils 8.16 which has ln -r.
             lnr ${D}${base_libdir}/libtinfo.so.5 ${D}${libdir}/libtinfo.so
         fi
-
+        if [ -d "${D}${includedir}/ncurses" ]; then
+            for f in `find ${D}${includedir}/ncurses -name "*.h"`
+            do
+	        f=`basename $f`
+	        test -e ${D}${includedir}/$f && continue
+                ln -sf ncurses/$f ${D}${includedir}/$f
+            done
+        fi
         oe_multilib_header curses.h
 }
 
diff --git a/meta/recipes-core/ncurses/ncurses_5.9.bb b/meta/recipes-core/ncurses/ncurses_5.9.bb
index 6d23c0c..54d27a9 100644
--- a/meta/recipes-core/ncurses/ncurses_5.9.bb
+++ b/meta/recipes-core/ncurses/ncurses_5.9.bb
@@ -1,10 +1,12 @@
 require ncurses.inc
 
+REVISION = "20150329"
+
 PR = "${INC_PR}.1"
 
 SRC_URI += "file://tic-hang.patch \
             file://config.cache \
 "
-
-SRC_URI[md5sum] = "8cb9c412e5f2d96bc6f459aa8c6282a1"
-SRC_URI[sha256sum] = "9046298fb440324c9d4135ecea7879ffed8546dd1b58e59430ea07a4633f563b"
+S = "${WORKDIR}/${BP}-${REVISION}"
+SRC_URI[md5sum] = "cee991d09e69e60ebedef424804c52d4"
+SRC_URI[sha256sum] = "5b64f40e4dce73e3aa83d15bd9257c6eff8790ec41150f0938bd87c0eb75828f"
-- 
2.1.4


