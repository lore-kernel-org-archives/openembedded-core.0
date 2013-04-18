Received: from mail-ee0-f52.google.com ([74.125.83.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1USqkq-0000hM-7X
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 17:28:09 +0200
Received: by mail-ee0-f52.google.com with SMTP id b57so1185003eek.39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2013 08:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=uUD+5vK4c4ApgpG0BCTq2Fen23izdhaM8OvqxFwHLR4=;
	b=bqR4rn2EbWExFqtuFhDSjbUjWJpHLABDn8/sdmqmbnC/o3yZpI59cuDZ4BN+mMDCkH
	w5Mofy9S9YNY2XjAhwSJgsh3H07C+bVnj5YCXewbINHZ5ht4R2TtolUIlSaTvxOIpDAn
	cU6JyjcmufIFDSUVKMCKDH/k8uGA1OQqApkdvioblbLC12nDpkV4pcOqvj2m0RBWVeJD
	GIGiJDGstKJ10rIGWzkdaI2N8wnlIXQLbyADKjgHpXlviJLEa8zwBm0XiV4+r5I4DSCO
	GyiHFqwHH2ZIcOrAc2Oq2ZyGvEKnVeXArYicUd+kEmZHabwzv+D7LzLPPmePenXiIsBI
	BZTA==
X-Received: by 10.15.101.200 with SMTP id bp48mr30890713eeb.38.1366297834952; 
	Thu, 18 Apr 2013 08:10:34 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id u44sm16511977eel.7.2013.04.18.08.10.32
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 18 Apr 2013 08:10:33 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Apr 2013 17:10:20 +0200
Message-Id: <1366297820-5000-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQlkIhCisuW1Mc1yVwa83dFxScBwD3EIHD/JZFadlTJYlb+nrv7l8aQzI/FfFAIuHouch+Ur
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] grub-efi-native: fix build on modern distributions without gets()
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
X-List-Received-Date: Thu, 18 Apr 2013 15:28:09 -0000

O irony: the grub2/gnulib nag macro that says "don't use gets, use fgets" breaks the build if you're using a recent (e)glibc release that has gets removed.

Fedora already #if 0's the check in grub, so I stole their patch.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../grub-2.00-ignore-gnulib-gets-stupidity.patch   | 28 ++++++++++++++++++++++
 meta/recipes-bsp/grub/grub-efi-native_2.00.bb      |  3 ++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/grub/files/grub-2.00-ignore-gnulib-gets-stupidity.patch

diff --git a/meta/recipes-bsp/grub/files/grub-2.00-ignore-gnulib-gets-stupidity.patch b/meta/recipes-bsp/grub/files/grub-2.00-ignore-gnulib-gets-stupidity.patch
new file mode 100644
index 0000000..70f6001
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/grub-2.00-ignore-gnulib-gets-stupidity.patch
@@ -0,0 +1,28 @@
+From f66d54b934710f54999debb72e8b7c620edece1d Mon Sep 17 00:00:00 2001
+From: Peter Jones <pjones@redhat.com>
+Date: Fri, 25 May 2012 15:28:19 -0400
+Subject: [PATCH] gnulib accused in build breaking shocker.
+
+Upstream-Status: pending [Fedora will push this]
+
+---
+ grub-core/gnulib/stdio.in.h |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/grub-core/gnulib/stdio.in.h b/grub-core/gnulib/stdio.in.h
+index 80b9dbf..69932d9 100644
+--- a/grub-core/gnulib/stdio.in.h
++++ b/grub-core/gnulib/stdio.in.h
+@@ -141,7 +141,9 @@ _GL_WARN_ON_USE (fflush, "fflush is not always POSIX compliant - "
+    so any use of gets warrants an unconditional warning.  Assume it is
+    always declared, since it is required by C89.  */
+ #undef gets
++#if 0
+ _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
++#endif
+ 
+ #if @GNULIB_FOPEN@
+ # if @REPLACE_FOPEN@
+-- 
+1.7.10.1
+
diff --git a/meta/recipes-bsp/grub/grub-efi-native_2.00.bb b/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
index 6f8ba8e..2a5dad7 100644
--- a/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
+++ b/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 # FIXME: We should be able to optionally drop freetype as a dependency
 DEPENDS = "autogen-native"
 RDEPENDS_${PN} = "diffutils freetype"
-PR = "r1"
+PR = "r2"
 
 # Native packages do not normally rebuild when the target changes.
 # Ensure this is built once per HOST-TARGET pair.
@@ -28,6 +28,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://grub-2.00-disable-help2man.patch \
            file://check-if-liblzma-is-disabled.patch \
 	   file://grub-no-unused-result.patch \
+	   file://grub-2.00-ignore-gnulib-gets-stupidity.patch \
           "
 SRC_URI[md5sum] = "e927540b6eda8b024fb0391eeaa4091c"
 SRC_URI[sha256sum] = "65b39a0558f8c802209c574f4d02ca263a804e8a564bc6caf1cd0fd3b3cc11e3"
-- 
1.8.1.4



