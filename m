Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 861AC6F57A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 20:23:41 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id y10so3836949wgg.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Mar 2014 12:23:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=kcYZ0yWbvEXECjWUbxuE2wmctfUOCmipACkerB+A4cU=;
	b=ioXJ7VLe13IhN50I/QjI1O5Rldk8kOz9T3VRsE5xdRkSeC0XHoQBg3ELjv0cQGb86o
	6zrmH5zIQAcOt6eCaMdUm7N3CW7MkiINdG0niFCeWvfhDsBj+fKz4B/XVpoOJutgm29e
	PsHJpSxE5QpnbsWt/zoRKRdzwroILXSjq56Lj2RP8zhaghrN3F/hKn5nGYT8y4zh5Clq
	ncPwjlefYkzLa0pISLo9rvAdYo+xZ4pBSiv0+D9vPCCg//a2/4OryABxB2E39ciDMJlu
	mq/oxPbMyYZV7HlXyHyz324vt/gA/KF2Xcg5ASzKtnSHsmcatV4p4ItE23LUCRdLilc+
	Jj7Q==
X-Gm-Message-State: ALoCoQlTRl6W2mB2I8Nwux5K5/afqEp7KuMkJLxylQbDOmuYPtmMxMD3ba6Zxcb1wv+SbodP19N9
X-Received: by 10.194.82.69 with SMTP id g5mr9271900wjy.85.1393878221463;
	Mon, 03 Mar 2014 12:23:41 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id de3sm40523147wjb.8.2014.03.03.12.23.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Mar 2014 12:23:40 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Mar 2014 20:23:35 +0000
Message-Id: <1393878215-27447-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1393878215-27447-1-git-send-email-ross.burton@intel.com>
References: <1393878215-27447-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/3] ncurses: use lnr instead of python code
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
X-List-Received-Date: Mon, 03 Mar 2014 20:23:43 -0000

Drop the use of custom Python code and instead use the new lnr script to
generate relative symlinks.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/ncurses/ncurses.inc |   14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index a94466a..f0a4044 100644
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
@@ -226,8 +221,11 @@ shell_do_install() {
 
             mv ${D}${libdir}/libtinfo.so.* ${D}${base_libdir}
             rm ${D}${libdir}/libtinfo.so
-            # We'll turn this into a relative symlink after do_install returns
-            ln -sf ${D}${base_libdir}/libtinfo.so.5 ${D}${libdir}/libtinfo.so
+
+            # Use lnr to ensure this is a relative link despite absolute paths
+            # (as we can't know the relationship between base_libdir and libdir).
+            # At some point we can rely on coreutils 8.16 which has ln -r.
+            lnr ${D}${base_libdir}/libtinfo.so.5 ${D}${libdir}/libtinfo.so
         fi
 
         oe_multilib_header curses.h
-- 
1.7.10.4


