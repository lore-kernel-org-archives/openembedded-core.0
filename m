Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3C6037589F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 13:43:48 +0000 (UTC)
Received: by wgez8 with SMTP id z8so5611274wge.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 06:43:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=vdrkCi5zUhPFKILpEYGHuuaO+WBnuTk1zgJB1487OCQ=;
	b=iPDoMKPIyi96ES1Qj8yMPXN3z8IZmH5CbcRoDasvwdtE8YqeVzbLDkWlYQHsiVNnqH
	ATgINSwT0Wjiy4DUfRS1Xc803POVBxkokN7nznWIbbxbbIQ1JiGsL4xA2U9VaePTc2Zp
	rtWF8+39nIxiKSTCy4gd3lgkZaYrdbXF7CiJN85U53YwLxzH0iR5dDZCVylnGIA5EiQJ
	BU7yTNxY757T/u2tCJCwoTmMFhyN5IOCdVW0H60AfKt0x2Sj7xLQrFDqptQOlZw7i5DF
	C5RkorwCKKvO6avYWcbEg1VI2Hf+PoACN/L1kkOl7ahmBmP3kvhn0ok7AAirpdREgn9a
	/nug==
X-Gm-Message-State: ALoCoQnAQUwxlAHL7SJ65Bv5b0c+1ph41LwgqIjdpcnFqng0XGIGwykBDi17SfYTC+wCW2Lu5RJm
X-Received: by 10.194.200.228 with SMTP id jv4mr16330645wjc.157.1434030229697; 
	Thu, 11 Jun 2015 06:43:49 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id o4sm12903651wib.5.2015.06.11.06.43.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 Jun 2015 06:43:48 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jun 2015 14:39:04 +0100
Message-Id: <1434029944-16622-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH][V2] piglit: upgrade to more recent srvrev
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
X-List-Received-Date: Thu, 11 Jun 2015 13:43:51 -0000

Upgrade to 126c7d from December 2014.  Still not the latest but it's got no
added build dependencies and importantly handles installs out of the box instead
of us having to hack and kludge, and builds with cmake 3.x.

The usage has changed: now there's a "piglit" binary that has run/resume/summary
subcommands, for example:

$ piglit run quick quick-results/

For reference the quick test suite on a IvyBridge NUC results in:

[27714/27714] crash: 3, fail: 326, pass: 18275, skip: 9107, warn: 3 -

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 37 +++++-------------------------
 1 file changed, 6 insertions(+), 31 deletions(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index e33e4a7..75e41fe 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
 
 SRC_URI = "git://anongit.freedesktop.org/piglit"
 
-# From 2012/12/30.
-SRCREV = "bbeff5d21b06d37338ad28e42d88f499bef13268"
+# From 2014/12/04
+SRCREV = "126c7d049b8f32e541625d5a35fbc5f5e4e7fbf8"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
@@ -17,40 +17,15 @@ inherit cmake pythonnative distro_features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-# As piglit doesn't install, enforce in-tree builds so that we can easily copy
-# contents out of $S and $B.
-B="${S}"
-
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[freeglut] = "-DPIGLIT_USE_GLUT=1,-DPIGLIT_USE_GLUT=0,freeglut,"
 
-# CMake sets the rpath at build time with the source tree, and will reset it at
-# install time. As we don't install this doesn't happen, so force the rpath to
-# what we need.
-EXTRA_OECMAKE = "-DCMAKE_BUILD_WITH_INSTALL_RPATH=1 -DCMAKE_INSTALL_RPATH=${libdir}/piglit/lib"
-
-do_install() {
-	install -d ${D}${bindir}
-	install -m 0755 piglit-*.py ${D}${bindir}
-
-	install -d ${D}${libdir}/piglit/
-
-	install -d ${D}${libdir}/piglit/bin
-	install -m 755 ${S}/bin/* ${D}${libdir}/piglit/bin
-
-	cp -Pr lib/ ${D}${libdir}/piglit/
-	cp -Pr framework/ ${D}${libdir}/piglit/
-	cp -Pr generated_tests/ ${D}${libdir}/piglit/
-	cp -Pr tests/ ${D}${libdir}/piglit/
-	cp -Pr templates/ ${D}${libdir}/piglit/
-
-	sed -i -e 's|sys.path.append(.*)|sys.path.append("${libdir}/piglit")|' ${D}${bindir}/piglit-*.py
-	sed -i -e 's|^templatedir = .*$|templatedir = "${libdir}/piglit/templates"|' ${D}${bindir}/piglit-summary-html.py
-}
-
 FILES_${PN}-dbg += "${libdir}/piglit/*/.debug/"
 
-RDEPENDS_${PN} = "python waffle python-json python-subprocess \
+RDEPENDS_${PN} = "waffle python python-mako python-json python-subprocess \
+	python-argparse python-importlib python-unixadmin \
 	python-multiprocessing python-textutils python-netserver python-shell \
 	mesa-demos bash \
 	"
+
+INSANE_SKIP_${PN} += "dev-so"
\ No newline at end of file
-- 
2.1.4


