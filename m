Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id D8BAA72007
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Feb 2015 02:32:29 +0000 (UTC)
Received: by iecar1 with SMTP id ar1so1439836iec.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Feb 2015 18:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/gaUbYCvLqW37YSym8QwQMM8HT/A2UIIKphaF8FY7a4=;
	b=dtQ1auoexzXaaUrD9IklWITl5U/zdq52QVkRR7YCzbXfofa4YClNYmY/4e+DGSbxM+
	QRxC+ZXWgJOH6dNcd5bqjCXRiD9+QGzBo/hs/a/ZqLa9jj9YJ7kgba/a9GMwhOnqLtDd
	mmJMKzVKREDIVK8e2wtkg1nUer+eVgHQelZmQzymg3J1AdMKJSasSUGjmzjP7YnFzt7D
	FDBAxRj5nqmgvAUMIiH9s7+Hb31pzQM09rac631qh6tPXibrwEgsSLSH1KNBpDmiNElm
	SgQEZDKb26Kyn/xxvjfYVZereXBbKh74c25vsA8dnCg5OMxPRM2vpwM3YLrTutK4qBwA
	W1UQ==
X-Received: by 10.42.223.194 with SMTP id il2mr1445651icb.94.1424831550447;
	Tue, 24 Feb 2015 18:32:30 -0800 (PST)
Received: from kraj-ch2e.sys.comcast.net (a-96-119-88-205.sys.comcast.net.
	[96.119.88.205]) by mx.google.com with ESMTPSA id
	f12sm24302381ioi.21.2015.02.24.18.32.29
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 Feb 2015 18:32:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Feb 2015 02:31:55 +0000
Message-Id: <1424831516-15260-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/2] ncurses: Upgrade 4.9 stable to latest patchlevel 20150221
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
X-List-Received-Date: Wed, 25 Feb 2015 02:32:32 -0000

gcc5 barfs on older release

Change-Id: Ib1ad9b1cf7f16eb454da21fd61dc56fe1d9f6783
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/ncurses/ncurses.inc    | 5 ++++-
 meta/recipes-core/ncurses/ncurses_5.9.bb | 7 +++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 10f7dd1..49de358 100644
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
+ 	sed -i 's#-I${cf_includedir}##g' ${S}/configure || die "sed CPPFLAGS"
 
 	# The --enable-pc-files requires PKG_CONFIG_LIBDIR existed
 	mkdir -p ${PKG_CONFIG_LIBDIR}
@@ -105,6 +107,7 @@ do_configure() {
 		return 1
 	! ${ENABLE_WIDEC} || \
 		ncurses_configure "widec" "--enable-widec" "--without-progs"
+
 }
 
 do_compile() {
diff --git a/meta/recipes-core/ncurses/ncurses_5.9.bb b/meta/recipes-core/ncurses/ncurses_5.9.bb
index 6d23c0c..02db497 100644
--- a/meta/recipes-core/ncurses/ncurses_5.9.bb
+++ b/meta/recipes-core/ncurses/ncurses_5.9.bb
@@ -1,10 +1,13 @@
 require ncurses.inc
 
+REVISION = "20150221"
+
 PR = "${INC_PR}.1"
 
 SRC_URI += "file://tic-hang.patch \
             file://config.cache \
 "
+S = "${WORKDIR}/${BP}-${REVISION}"
+SRC_URI[md5sum] = "e54c989cdf8fbb750d5639a83a89c61b"
+SRC_URI[sha256sum] = "9de5b66f8c434a09ff0647e97fc76f2329d406c2726fa3f9968e361941f02b07"
 
-SRC_URI[md5sum] = "8cb9c412e5f2d96bc6f459aa8c6282a1"
-SRC_URI[sha256sum] = "9046298fb440324c9d4135ecea7879ffed8546dd1b58e59430ea07a4633f563b"
-- 
2.1.4


