Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Til8e-00011W-Vd
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 13:10:13 +0100
Received: from mail-wi0-f197.google.com ([209.85.212.197])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 12 Dec 2012 03:55:38 -0800
Received: by mail-wi0-f197.google.com with SMTP id hm6so586729wib.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2012 03:55:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=58cyHF5OAUbnTLTybMZ30L9fUCG4WNPJ+CWS8RucaQE=;
	b=RKbUCHu6A40BqIyf+UAyrYz90BlXiifQXynGVE0C+/G0u/ZeaorcImIrUbajdNBNko
	KA4yVgAOSGn4QV3cAMXYxIt0B/6+O1CWT2cQsfvuZpwRMUUQo20ASYUNWaYYjt0ahbIH
	ApbUJU3sbzBux1ADP7nb5+NnpAuHJSVwBjUr2QIOhDqBbFUkqqkGCWIz2jTQxSPUQlSx
	LH5im1Q3ap3HGG4CFmy6HYu3vPYI0lQkk2MdqhgqdWT2/MjwEd5XiYoirw3M3FDswmF0
	G5xr5d+ChQl7crphfqWMq6RtEZXecV8DUIBONcdFdEO2MYJZSc+RG8FjrHIciANIK4lT
	uouQ==
Received: by 10.194.71.140 with SMTP id v12mr1445956wju.36.1355313336594;
	Wed, 12 Dec 2012 03:55:36 -0800 (PST)
Received: by 10.194.71.140 with SMTP id v12mr1445941wju.36.1355313336372;
	Wed, 12 Dec 2012 03:55:36 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id b1sm20926879wix.11.2012.12.12.03.55.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Dec 2012 03:55:35 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Dec 2012 11:53:57 +0000
Message-Id: <1355313237-32367-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnKZJc3qOvUhOzQzF4ry+KcNVWKtbgs0e1qoObLVoWA9gmYfxKHD81YL7/fcG3Mo+0gQcxHdfRsCuOBCXaSzQxvZYuxsPwTSYdZ0vrBJXGedwjLVMfkuv1vcDzDhv4Al+8ip/PLklvemB1lzcGUWoxNoTOdd51JFC8pNUZe9Oyt6j7AHHMzsT5BycVEfAxKiPm4DT9C
Subject: [PATCH] matchbox-keyboard: fix the build with libpng15
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Dec 2012 12:10:13 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../matchbox-keyboard/files/png-fix.patch          |   49 ++++++++++++++++++++
 .../matchbox-keyboard/matchbox-keyboard_git.bb     |    5 +-
 2 files changed, 52 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-sato/matchbox-keyboard/files/png-fix.patch

diff --git a/meta/recipes-sato/matchbox-keyboard/files/png-fix.patch b/meta/recipes-sato/matchbox-keyboard/files/png-fix.patch
new file mode 100644
index 0000000..e3834f5
--- /dev/null
+++ b/meta/recipes-sato/matchbox-keyboard/files/png-fix.patch
@@ -0,0 +1,49 @@
+Change matchbox-keyboard to look for "libpng" instead of "libpng12", and fix the
+code so that it works with the 1.2 and 1.5 API.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/configure.ac b/configure.ac
+index 9678cf7..9bbbd76 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -171,24 +171,7 @@ dnl ------ Expat ------------------------------------------------------------
+ 
+ dnl ------ Check for PNG ---------------------------------------------------
+ 
+-AC_MSG_CHECKING(for libpng12)
+-
+-if $PKG_CONFIG --exists libpng12; then
+-        AC_MSG_RESULT(yes)
+-        PNG_LIBS=`$PKG_CONFIG --libs libpng12`
+-        PNG_CFLAGS=`$PKG_CONFIG --cflags libpng12`
+-else
+-        AC_MSG_RESULT(no)
+-        AC_CHECK_LIB([png], [png_create_read_struct],
+-                      [have_png="yes"], [have_png="no"])
+-
+-        if test x$have_png=xyes && test x$have_png_h=xyes; then
+-            PNG_LIBS="-lpng -lz"
+-        else
+-            AC_MSG_ERROR([*** Cannot find libpng12 ****])
+-        fi
+-fi
+-
++PKG_CHECK_MODULES(PNG, libpng)
+ 
+ dnl ------ Debug Build ------------------------------------------------------
+ 
+diff --git a/src/matchbox-keyboard-image.c b/src/matchbox-keyboard-image.c
+index 8accc3e..6b4b0e8 100644
+--- a/src/matchbox-keyboard-image.c
++++ b/src/matchbox-keyboard-image.c
+@@ -65,7 +65,7 @@ png_file_load (const char *file,
+     return NULL;
+   }
+ 
+-  if ( setjmp( png_ptr->jmpbuf ) ) {
++  if (setjmp (png_jmpbuf (png_ptr))) {
+     png_destroy_read_struct( &png_ptr, &info_ptr, NULL);
+     fclose(fd);
+     return NULL;
diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
index 430e343..adde25b 100644
--- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
+++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
@@ -12,12 +12,13 @@ RDEPENDS_${PN} = "formfactor dbus-wait"
 SECTION = "x11"
 SRCREV = "b38f24036cff3be6c2fbcf9ca9881803e69003ac"
 PV = "0.0+git${SRCPV}"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
            file://configure_fix.patch;maxrev=1819 \
            file://single-instance.patch \
-	   file://80matchboxkeyboard.shbg"
+           file://80matchboxkeyboard.shbg \
+           file://png-fix.patch"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.10



