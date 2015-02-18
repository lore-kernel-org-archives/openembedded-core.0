Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id C86B36E614
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Feb 2015 06:45:06 +0000 (UTC)
Received: by lbjb6 with SMTP id b6so8878160lbj.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 22:45:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lcWIaERLZeqG6x9HowCJKZnlH8xOGRWWhqtTYrGKb6I=;
	b=FmRtGR/0DYzoYWlY2RxvGIlgnSUJzAM0qTrlwnD1uhHvlaUzIbGQUSfADrjByujYaI
	5A7pKrPW5B0ecuS+U41ToYMnyr7D7NaAkjsNeH4SOCllnKREvU464xzH0ZR5NK7IUF6w
	wZo8oC6vKnsdWmnFBYAxouQsmYMxa4gJWKU8AIibta6718yjiDR24l9ZV8JsYe0LLbwL
	/H/q2Dxv4YVqi42aDIdyrM9yKTKN/Qa5kzCdCrW3mMbFcxbHERVjiJKkWqZHtkNabTNj
	wV5Gen+AKbZXqoPpQvl5DtePtvRPkTSb9KkYcAR9j7KKsqc2Mzd/YLeCgV5RXjSJ6+VE
	rfxA==
X-Gm-Message-State: ALoCoQk/htfyR/Rj70kqbWzG2CU4L3Axo6WIdPIT68mJC84SgfU5ajOKxqP/Plcjz7CMMkIQVqCW
X-Received: by 10.152.28.73 with SMTP id z9mr19024829lag.28.1424241906454;
	Tue, 17 Feb 2015 22:45:06 -0800 (PST)
Received: from localhost.localdomain (a91-152-81-141.elisa-laajakaista.fi.
	[91.152.81.141])
	by mx.google.com with ESMTPSA id lf3sm4019974lbc.2.2015.02.17.22.45.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Feb 2015 22:45:05 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Feb 2015 14:44:45 +0800
Message-Id: <1424241885-9344-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] busybox: update to 1.23.1 release
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
X-List-Received-Date: Wed, 18 Feb 2015 06:45:10 -0000

* Bump SRCREV/PV
* Drop PR
* Update SRC_URI md5sum/sha256sum
* Drop 0001-build-system-Specify-nostldlib-when-linking-to-.o-fi.patch
  - applied upstream and available in 1.23.1 release

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 ...m-Specify-nostldlib-when-linking-to-.o-fi.patch | 40 ----------------------
 .../{busybox_1.22.1.bb => busybox_1.23.1.bb}       |  7 ++--
 meta/recipes-core/busybox/busybox_git.bb           |  4 +--
 3 files changed, 4 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-build-system-Specify-nostldlib-when-linking-to-.o-fi.patch
 rename meta/recipes-core/busybox/{busybox_1.22.1.bb => busybox_1.23.1.bb} (85%)

diff --git a/meta/recipes-core/busybox/busybox/0001-build-system-Specify-nostldlib-when-linking-to-.o-fi.patch b/meta/recipes-core/busybox/busybox/0001-build-system-Specify-nostldlib-when-linking-to-.o-fi.patch
deleted file mode 100644
index 3da38bb..0000000
--- a/meta/recipes-core/busybox/busybox/0001-build-system-Specify-nostldlib-when-linking-to-.o-fi.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 28389e59701c2408e87e886c358f8e1766c677f7 Mon Sep 17 00:00:00 2001
-From: Drew Moseley <drew_moseley@mentor.com>
-Date: Sat, 29 Mar 2014 11:13:16 -0400
-Subject: [PATCH] build system: Specify '-nostldlib' when linking to .o files.
-
-For certain cross build scenarios the LD variable is overridden
-to use the gcc executive to ensure all the target tuning parameters
-are used.  In these cases, the executive errors out as shown below
-but since this step is only linking to a .o file the standard libs
-are not needed.
-
-    $ make LD=gcc applets/built-in.o
-      LD      applets/built-in.o
-    /usr/bin/ld: cannot find -lgcc_s
-    /usr/bin/ld: cannot find -lgcc_s
-    collect2: ld returned 1 exit status
-    make[1]: *** [applets/built-in.o] Error 1
-    make: *** [applets_dir] Error 2
-
-Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
----
- scripts/Makefile.build |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/scripts/Makefile.build b/scripts/Makefile.build
-index 5685b5b..eba69f6 100644
---- a/scripts/Makefile.build
-+++ b/scripts/Makefile.build
-@@ -256,7 +256,7 @@ ifdef builtin-target
- quiet_cmd_link_o_target = LD      $@
- # If the list of objects to link is empty, just create an empty built-in.o
- cmd_link_o_target = $(if $(strip $(obj-y)),\
--		$(LD) $(ld_flags) -r -o $@ $(filter $(obj-y), $^),\
-+		$(LD) -nostdlib $(ld_flags) -r -o $@ $(filter $(obj-y), $^),\
- 		rm -f $@; $(AR) rcs $@)
- 
- $(builtin-target): $(obj-y) FORCE
--- 
-1.7.9.5
-
diff --git a/meta/recipes-core/busybox/busybox_1.22.1.bb b/meta/recipes-core/busybox/busybox_1.23.1.bb
similarity index 85%
rename from meta/recipes-core/busybox/busybox_1.22.1.bb
rename to meta/recipes-core/busybox/busybox_1.23.1.bb
index a41879c..1742390 100644
--- a/meta/recipes-core/busybox/busybox_1.22.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.23.1.bb
@@ -1,7 +1,5 @@
 require busybox.inc
 
-PR = "r32"
-
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://get_header_tar.patch \
            file://busybox-appletlib-dependency.patch \
@@ -30,14 +28,13 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://inetd.conf \
            file://inetd \
            file://login-utilities.cfg \
-           file://0001-build-system-Specify-nostldlib-when-linking-to-.o-fi.patch \
            file://recognize_connmand.patch \
            file://busybox-cross-menuconfig.patch \
            file://CVE-2014-9645_busybox_reject_module_names_with_slashes.patch \
 "
 
-SRC_URI[tarball.md5sum] = "337d1a15ab1cb1d4ed423168b1eb7d7e"
-SRC_URI[tarball.sha256sum] = "ae0b029d0a9e4dd71a077a790840e496dd838998e4571b87b60fed7462b6678b"
+SRC_URI[tarball.md5sum] = "5c94d6301a964cd91619bd4d74605245"
+SRC_URI[tarball.sha256sum] = "300f1db0a7ca4ecee8f8d8027aba250b903372e8339b7d9123d37c1e900473bf"
 
 EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
 
diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
index f91b552..529ed5b 100644
--- a/meta/recipes-core/busybox/busybox_git.bb
+++ b/meta/recipes-core/busybox/busybox_git.bb
@@ -1,8 +1,8 @@
 require busybox.inc
 
-SRCREV = "d9e0c438e10e2155513e5d26498af472c5137d65"
+SRCREV = "1ecfe811fe2f70380170ef7d820e8150054e88ca"
 # Lookout for PV bump too when SRCREV is changed
-PV = "1.22.1+git${SRCPV}"
+PV = "1.23.1+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.1.4


