Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f49.google.com (mail-yh0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0281160B05
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 16:42:09 +0000 (UTC)
Received: by mail-yh0-f49.google.com with SMTP id z6so9226167yhz.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Apr 2014 09:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=WY+TNmijRVa5gCKZbbPF+GFaQbxbnHzeWkWK0uHT9c4=;
	b=dibw+x6go6f0pULfWzngMhf1JBpFap+EE8YQSYZFln/WWFjJFEBZ1pspbHcgIt+sW1
	Y8A5/jtBEXmfnKTG7xVDpd42Z5Aih5jUPb4jvNgcx9T06gJ8ZYL6l5jRvj3KhD4hzrte
	XMdayi7RHOlbmCrWKoqhHA6D4zFVMXhb2PNIzcRVCF0NteSa/udF421zxeIkdsVE2NWu
	xwY8z4zIBKIZXZlq7c6ha9lDSZcqpzpv32fgKIOFIy9o9R1d+IJTN8SeZpeQChz3LKVw
	DuJRAU4Bz7LOp7r/9MrTBx84f6AEjPgmvaqbJqGuFw7bvCpzSxJmQgNnSbzm5m3+7/F/
	0NYA==
X-Received: by 10.236.27.108 with SMTP id d72mr4798438yha.137.1396370530631;
	Tue, 01 Apr 2014 09:42:10 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id n4sm31228544yhc.13.2014.04.01.09.42.09
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 09:42:10 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id ABDE819F802F5; Tue,  1 Apr 2014 13:42:06 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  1 Apr 2014 13:42:04 -0300
Message-Id: <1396370524-15076-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.9.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2] alsa-tools: Fix build without x11
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
X-List-Received-Date: Tue, 01 Apr 2014 16:42:10 -0000

The patch had some new tool (hdajackretask) missing which were
triggering build failures in O.S. Systems' builder as:

,----[ Build error in a clean tmp, without x11 ]
| checking for GTK3... no
| configure: error: Package requirements (gtk+-3.0) were not met:
|
| No package 'gtk+-3.0' found
|
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
|
| Alternatively, you may set the environment variables GTK3_CFLAGS
| and GTK3_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
| make: *** [all] Error 1
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch | 12 ++++++++----
 meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb            |  4 ++--
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch b/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch
index c6cb5b1..2665726 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch
+++ b/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch
@@ -1,21 +1,25 @@
 Remove some sub-components which need gtk+.
 
-Signed-off-by: Rogerio Nunes <ronunes@gmail.com>
-
 Upstream-Status: Inappropriate [configuration]
 
+Signed-off-by: Rogerio Nunes <ronunes@gmail.com>
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+
 diff --git a/Makefile b/Makefile
+index 2457a1c..72346d9 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -1,8 +1,8 @@
+@@ -1,9 +1,9 @@
  VERSION = 1.0.27
  TOP = .
 -SUBDIRS = as10k1 envy24control \
 -	  mixartloader pcxhrloader rmedigicontrol sb16_csp seq sscape_ctl \
 -	  us428control usx2yloader vxloader echomixer \
+-	  hwmixvolume hdajackretask hda-verb
 +SUBDIRS = as10k1 \
 +	  mixartloader pcxhrloader sb16_csp seq sscape_ctl \
 +	  us428control usx2yloader vxloader \
- 	  hwmixvolume hdajackretask hda-verb
++	  hwmixvolume hda-verb
  
  all:
+ 	@for i in $(SUBDIRS); do \
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
index 492f8a4..4f64a38 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.alsa-project.org"
 BUGTRACKER = "https://bugtrack.alsa-project.org/alsa-bug/login_page.php"
 SECTION = "console/utils"
 LICENSE = "GPLv2 & LGPLv2+"
-DEPENDS = "alsa-lib ncurses ${@base_contains('DISTRO_FEATURES', 'x11', 'gtk+3', '', d)}"
+DEPENDS = "alsa-lib ncurses"
 
 LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://ld10k1/COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
@@ -21,7 +21,7 @@ inherit autotools-brokensep
 EXTRA_OEMAKE += "GITCOMPILE_ARGS='--host=${HOST_SYS} --build=${BUILD_SYS} --target=${TARGET_SYS} --with-libtool-sysroot=${STAGING_DIR_HOST} --prefix=${prefix}'"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'gtk+', '', d)}"
-PACKAGECONFIG[gtk+] = ",,gtk+,"
+PACKAGECONFIG[gtk+] = ",,gtk+ gtk+3,"
 
 # configure.ac/.in doesn't exist so force copy
 AUTOTOOLS_COPYACLOCAL = "1"
-- 
1.9.1


