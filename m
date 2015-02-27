Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8189973772
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 17:20:03 +0000 (UTC)
Received: by igqa13 with SMTP id a13so2081002igq.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 09:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/gaUbYCvLqW37YSym8QwQMM8HT/A2UIIKphaF8FY7a4=;
	b=H7qQrxavW9INmpswZkEja/lAEaI5g9R0sgBrmStcE9tqDhpiANfVBag+ovb4VJGhbH
	DCF9AXIVRAURWfBiMo0D/yc1OOKTeQGrB+8CGmIgEtVBacMoEr4QYyoHKLX/UIdtnkRg
	s9uM7SOwjJOLH6ypeROrM4sCsLT2KPvCJKnO6YaC50RtFCXUYLCMd7IIZt37lcu9vOVA
	ZPQ9iRdD681ULo1+fuKlwM2GnwVEmO0s48a1QG4bnUXspojIf862wkX5NU+/B/SI5M6D
	orcln5nTLeWxxMnC/3On9egN5ELOHgX/v5i3EwCpVmKIb3ww+wW5ECCr0C4kw2kuDFB3
	HQuA==
X-Received: by 10.42.36.6 with SMTP id s6mr6856767icd.33.1425057605016;
	Fri, 27 Feb 2015 09:20:05 -0800 (PST)
Received: from kraj-ch2e.sys.comcast.net (a-96-119-88-205.sys.comcast.net.
	[96.119.88.205])
	by mx.google.com with ESMTPSA id r78sm2594257ioi.22.2015.02.27.09.20.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Feb 2015 09:20:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Feb 2015 17:19:52 +0000
Message-Id: <1425057596-28243-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/6] ncurses: Upgrade 4.9 stable to latest patchlevel 20150221
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
X-List-Received-Date: Fri, 27 Feb 2015 17:20:06 -0000

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


