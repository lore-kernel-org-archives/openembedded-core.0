Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 81CAA78542
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 19:39:48 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id d28so15165273pfe.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 11:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=s0xXxScP58MynhDPX/jsC/T7fFUQ2dAQdqFSgGVKJI8=;
	b=uomgK6502ZrOpE67wJOgoEiAVSDAkMUMbj9RMeMwcD9U31wliGeqK7Lufk/GnSBJXv
	DhWUOjZkH+60CO3kHnQNF9MVSHdHtjVwXJPI52GRXK2LgHay5uKMV6QC6xyAzshDgU9p
	4p1enLwF4ewLzdNfV9m3Do9tUiwHtY3aAJkBP+9OuqBLzqp67jD5PhdqxLMUJ+aiLzlo
	2/jZyRF6pE6xtXcANOFqkJwQvAq8bMKra2oLRdc3WlJrXaC3OOaGIz0qeiVGNuiAWi70
	UAXsq8p/5wAv5CeujVEd5dJzAuYQD7FxX7SZLWiKcXkm5MivEOEQvKjbzRIIU8KoOiCy
	84zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=s0xXxScP58MynhDPX/jsC/T7fFUQ2dAQdqFSgGVKJI8=;
	b=I+QX7p/uYVMEcvP+c6MosXONZJd1cGMEtscWtN4cgUgQFjsjQy9X+dUsjjjR9QS49Y
	T+7O6U5t8FGEt2cVTYy46BT2wyfSDQwYLg/XBZF8eyUGcjZR8/7Au/txRb6/09VRW0om
	qribISoMXqOdRTZVQmcngx0st/NudPy29wX6LH5XXK9S2mrH6yhETwRJGHJVj/1UMXEd
	ADZvJ/XcyTNAfa4xAqaRjGP9+qQ9dw/LaZLdguvnKB/Q4aALRrgy3dAmrS0RypgosQOx
	EbG0/VcKgdqjxx2i14ur5doCkGHkkcM+3+SJBx4RMOAU/+d+dnoxIWnwAoicc58SAAUl
	U8zQ==
X-Gm-Message-State: AJaThX7sjk6GPYLUxF/LhxOT8Jy4ufwEy9kjiIdtaULnU0mkREAVR8B4
	LhqloDI05fFoTpo6QFQOPGmPDg==
X-Google-Smtp-Source: AGs4zMZiY/zRAi2gYmIVn4hSA5YyeW+JS5om1hixIuB7ld9IHRcr/ySiL87jL7gwnSzRBtLKuPBNnw==
X-Received: by 10.98.50.193 with SMTP id y184mr14856531pfy.9.1510688389751;
	Tue, 14 Nov 2017 11:39:49 -0800 (PST)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	f4sm30804162pgs.30.2017.11.14.11.39.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Nov 2017 11:39:48 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 11:39:24 -0800
Message-Id: <1510688364-32667-7-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1510688364-32667-1-git-send-email-armccurdy@gmail.com>
References: <1510688364-32667-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 6/6] systemd: fix duplication of CACHED_CONFIGUREVARS
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
X-List-Received-Date: Tue, 14 Nov 2017 19:39:48 -0000

Fix historical duplication that appears to have been caused by
merging two independent fixes for the same issue:

  http://git.openembedded.org/openembedded-core/commit/?id=294adc0907a359d9c0ad260823188145aab294ad
  http://git.openembedded.org/openembedded-core/commit/?id=b30d7b1b97ffd1d44083d93ed0e572d80fcebc54

Also minor reformatting of EXTRA_OECONF values.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/systemd/systemd_234.bb | 44 +++++++++++++++-----------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core/systemd/systemd_234.bb
index d4e0b1f..bfcecb3 100644
--- a/meta/recipes-core/systemd/systemd_234.bb
+++ b/meta/recipes-core/systemd/systemd_234.bb
@@ -149,11 +149,18 @@ PACKAGECONFIG[xkbcommon] = "--enable-xkbcommon,--disable-xkbcommon,libxkbcommon"
 PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
 PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib"
 
-CACHED_CONFIGUREVARS += "ac_cv_path_KILL=${base_bindir}/kill"
-CACHED_CONFIGUREVARS += "ac_cv_path_KMOD=${base_bindir}/kmod"
-CACHED_CONFIGUREVARS += "ac_cv_path_QUOTACHECK=${sbindir}/quotacheck"
-CACHED_CONFIGUREVARS += "ac_cv_path_QUOTAON=${sbindir}/quotaon"
-CACHED_CONFIGUREVARS += "ac_cv_path_SULOGIN=${base_sbindir}/sulogin"
+# Hardcode target binary paths to avoid AC_PROG_PATH in the systemd
+# configure script detecting and setting paths from sysroot or host.
+CACHED_CONFIGUREVARS_class-target = " \
+    ac_cv_path_KEXEC=${sbindir}/kexec \
+    ac_cv_path_KILL=${base_bindir}/kill \
+    ac_cv_path_KMOD=${base_bindir}/kmod \
+    ac_cv_path_MOUNT_PATH=${base_bindir}/mount \
+    ac_cv_path_QUOTACHECK=${sbindir}/quotacheck \
+    ac_cv_path_QUOTAON=${sbindir}/quotaon \
+    ac_cv_path_SULOGIN=${base_sbindir}/sulogin \
+    ac_cv_path_UMOUNT_PATH=${base_bindir}/umount \
+"
 
 # Helper variables to clarify locations.  This mirrors the logic in systemd's
 # build system.
@@ -161,24 +168,15 @@ rootprefix ?= "${root_prefix}"
 rootlibdir ?= "${base_libdir}"
 rootlibexecdir = "${rootprefix}/lib"
 
-CACHED_CONFIGUREVARS_class-target = "\
-                         ac_cv_path_MOUNT_PATH=${base_bindir}/mount \
-                         ac_cv_path_UMOUNT_PATH=${base_bindir}/umount \
-                         ac_cv_path_KMOD=${base_bindir}/kmod \
-                         ac_cv_path_KILL=${base_bindir}/kill \
-                         ac_cv_path_SULOGIN=${base_sbindir}/sulogin \
-                         ac_cv_path_KEXEC=${sbindir}/kexec \
-                         ac_cv_path_QUOTACHECK=${sbindir}/quotacheck \
-                         ac_cv_path_QUOTAON=${sbindir}/quotaon \
-			 "
-
-EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
-                 --with-rootlibdir=${rootlibdir} \
-                 --with-roothomedir=${ROOT_HOME} \
-                 --without-python \
-                 --with-sysvrcnd-path=${sysconfdir} \
-                 --with-firmware-path=${nonarch_base_libdir}/firmware \
-               "
+EXTRA_OECONF = " \
+    --without-python \
+    --with-roothomedir=${ROOT_HOME} \
+    --with-rootlibdir=${rootlibdir} \
+    --with-rootprefix=${rootprefix} \
+    --with-sysvrcnd-path=${sysconfdir} \
+    --with-firmware-path=${nonarch_base_libdir}/firmware \
+"
+
 # per the systemd README, define VALGRIND=1 to run under valgrind
 CFLAGS .= "${@bb.utils.contains('PACKAGECONFIG', 'valgrind', ' -DVALGRIND=1', '', d)}"
 
-- 
1.9.1


