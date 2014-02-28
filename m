Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6F6B96EE30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 18:28:57 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id q58so854794wes.40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 10:28:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=y5x+kDi1pKDt2w0ecYYLGQp6iN5mhF4P9xaRtrpDHsk=;
	b=e2nYDwqSahr5b4BcOJauZCR82ShwXBou8QyMkNY2uvzvef9mLyXFd41rRFPqiZafNJ
	NXCwBOxe3xitIx3+oRt1yGDJ4zKqsFCO+teLrLp3r7paZtYxx2Zvx4VV08fHrdhwyy6M
	sQ7UyOWhN94we2VX299QgtLkpdgb0Ate8fsjYQLK7LqS5l/QirfekniNwINulhq+UFfn
	KaTg5UsRvZS5wcr69HBYG5B2K2fsbbAA8HhpHQ8EzrmlhD+TG2KuUh69+Fti/5qSXAkR
	QGTBPOycEzmLpGINAsSttHzeKSZo9nw8YgiNzmeZg59x3IXEzzsyoAJPjp+DCwcB1osJ
	qnmQ==
X-Gm-Message-State: ALoCoQmcG2NhlTLl3zdv0FTFDRzvUMN8X7mdWaPRX3Xx5dHczjEJZDvxA5hHMGKbgO47Hw3ecOCq
X-Received: by 10.180.211.239 with SMTP id nf15mr4667615wic.9.1393612137887;
	Fri, 28 Feb 2014 10:28:57 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id ju6sm6293912wjc.1.2014.02.28.10.28.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Feb 2014 10:28:57 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2014 18:28:54 +0000
Message-Id: <1393612134-15665-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] ncurses: use ln -r to generate relative symlink
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
X-List-Received-Date: Fri, 28 Feb 2014 18:29:01 -0000

Instead of using a Python do_install() and calling
oe.path.make_relative_symlink, just pass -r to ln to generate a relative symlink
directly.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/ncurses/ncurses.inc |   10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index a94466a..835ecc3 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -147,12 +147,7 @@ _install_cfgs = "\
   PKG_CONFIG_LIBDIR='${libdir}/pkgconfig' \
 "
 
-python do_install () {
-    bb.build.exec_func("shell_do_install", d)
-    oe.path.make_relative_symlink(d.expand("${D}${libdir}/libtinfo.so"))
-}
-
-shell_do_install() {
+do_install() {
         # Order of installation is important; widec installs a 'curses.h'
         # header with more definitions and must be installed last hence.
         # Compatibility of these headers will be checked in 'do_test()'.
@@ -226,8 +221,7 @@ shell_do_install() {
 
             mv ${D}${libdir}/libtinfo.so.* ${D}${base_libdir}
             rm ${D}${libdir}/libtinfo.so
-            # We'll turn this into a relative symlink after do_install returns
-            ln -sf ${D}${base_libdir}/libtinfo.so.5 ${D}${libdir}/libtinfo.so
+            ln -rsf ${D}${base_libdir}/libtinfo.so.5 ${D}${libdir}/libtinfo.so
         fi
 
         oe_multilib_header curses.h
-- 
1.7.10.4


