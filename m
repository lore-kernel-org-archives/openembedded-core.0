Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RkhqD-0001Lu-5j
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 20:58:41 +0100
Received: by ghrr17 with SMTP id r17so2226286ghr.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 11:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=3SdPH8CYn3ZT1d/00oBwaHLzSvG3bEDdhqEZvCiljFU=;
	b=ahDGu43uiYNNGqnbjw4Od5Jh+GRnmksAB0yVW1IgoxzCDJ7KRkxMxIqGavFak9BqSn
	KTZyzRHQKi71LFIyHV27GG8wCNcsusk3ADcr0s0bAUVbI80Hh3Fu0wQjNH6j02s/Z/eX
	unWktJpZ7k72+OxXEuZou/7m7eBsbtICeBESc=
Received: by 10.236.161.197 with SMTP id w45mr28597849yhk.96.1326225071864;
	Tue, 10 Jan 2012 11:51:11 -0800 (PST)
Received: from sb-u1004lts-64bit.alm.mentorg.com (hsvwanfw1-nat.mentorg.com.
	[139.181.24.34])
	by mx.google.com with ESMTPS id i32sm3314457anm.22.2012.01.10.11.51.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Jan 2012 11:51:11 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2012 13:51:18 -0600
Message-Id: <1326225078-18652-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] ncurses-native: install to libdir, not base_libdir
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
X-List-Received-Date: Tue, 10 Jan 2012 19:58:41 -0000

From: Christopher Larson <chris_larson@mentor.com>

For target, both base_libdir and libdir in sysroot can be used, as we pass
--sysroot to the toolchain. For native, we don't do this, and we also only add
-L<sysroot>/${libdir}, not -L<sysroot>/${base_libdir}, resulting in other
native recipes (like readline-native) failing to find the ncurses libraries.

readline-native only built successfully on hosts where it could fall back to
their ncurses/termcap rather than the one in the sysroot.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-core/ncurses/ncurses.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 8321d7b..43303b7 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://ncurses/base/version.c;beginline=1;endline=27;md5=cbc
 SECTION = "libs"
 DEPENDS = "ncurses-native"
 DEPENDS_virtclass-native = ""
-INC_PR = "r3"
+INC_PR = "r4"
 
 inherit autotools binconfig multilib_header
 
@@ -26,8 +26,8 @@ ENABLE_WIDEC ?= "true"
 # builds.
 BUILD_CPPFLAGS += "-D_GNU_SOURCE"
 
-# tic from the -native build cannot run without setting this explicitly
-BUILD_LDFLAGS_virtclass-native += "-Wl,-rpath,${base_libdir}"
+# natives don't generally look in base_libdir
+base_libdir_virtclass-native = "${libdir}"
 
 # Helper function for do_configure to allow multiple configurations
 # $1 the directory to run configure in
-- 
1.7.8.rc4



