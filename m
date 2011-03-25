Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q3GZx-0007Wc-J4
	for openembedded-core@lists.openembedded.org;
	Sat, 26 Mar 2011 00:38:05 +0100
Received: by pxi1 with SMTP id 1so318003pxi.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2011 16:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=so9VBhUZdOMvszQfA2WqAaxCtgmzjsaqDc/LnXdlX+E=;
	b=nmYcmVWS/iWC5JLFDSg7ge5nYEkI9/daYmsrM3jcYyC0n38RlL+iZC1qn/fdqw5fJ6
	cqolF4OsxFBwJT8MW5HdBNHpf+EWygrGn7C+mYpxaaQC8yvaUXEmzDy6dQSJ+1uAMiR2
	jlphvFL30dbdE0uHQaZ1W9aeHmFjFSlPQB4J0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=saLR5z6WyuROa+gPx2RoxE6yfz2M+Z6zpWuPBNatLtjIBjJHK4olk++fMm7lEYJRWH
	RmcsNTKTk9vQzDoOmZKPCgTA22a93nZo4lHJVQP3Q7GngJwvH2GcFklKftTb9Ld+f8C4
	Mn+SZaOiGj0z9YO8ci2VdzS1jaUrC4yiT4HPo=
Received: by 10.142.199.2 with SMTP id w2mr1046614wff.293.1301096171102;
	Fri, 25 Mar 2011 16:36:11 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id m10sm1935174wfl.23.2011.03.25.16.36.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 Mar 2011 16:36:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Mar 2011 16:36:05 -0700
Message-Id: <a2fab8dbdf597d85b8981b2d334e1a6a0e001dc2.1301095943.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301095943.git.raj.khem@gmail.com>
References: <cover.1301095943.git.raj.khem@gmail.com>
Subject: [PATCH V3 2/2] qemu.inc: Add sh4, sh4eb, mips64, mips64el targets
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
X-List-Received-Date: Fri, 25 Mar 2011 23:38:05 -0000

In order to leavarage more emulations in oe-core
these targets needs to be built as well

Introduce new variable QEMU_TARGETS which
can be set by user to decide what all machine support
should be build into qemu-native

This one works adding same to qemu.inc does not
parse presumably a bitbake problem.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu-targets.inc |   18 ++++++++++++++++++
 meta/recipes-devtools/qemu/qemu.inc         |   12 +++++++++---
 2 files changed, 27 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu-targets.inc

diff --git a/meta/recipes-devtools/qemu/qemu-targets.inc b/meta/recipes-devtools/qemu/qemu-targets.inc
new file mode 100644
index 0000000..550a7fe
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu-targets.inc
@@ -0,0 +1,18 @@
+# possible arch values are arm mips mipsel mips64 mips64el ppc ppc64 ppc64abi32
+# ppcemb armeb alpha sparc32plus i386 x86_64 cris m68k microblaze sparc sparc32
+# sparc32plus
+
+def get_qemu_target_list(d):
+    import bb
+    archs = bb.data.getVar('QEMU_TARGETS', d, True).split()
+    targets = ""
+    for arch in ['mips64', 'mips64el', 'ppcemb']:
+        if arch in archs:
+            targets += arch + "-softmmu,"
+	    archs.remove(arch)
+    for arch in ['armeb', 'alpha', 'ppc64abi32', 'sparc32plus']:
+        if arch in archs:
+            targets += arch + "-linux-user,"
+	    archs.remove(arch)
+    return targets + ''.join([arch + "-linux-user" + "," + arch + "-softmmu" + "," for arch in archs]).rstrip(',')
+
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index f41b49c..0367f50 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -3,8 +3,14 @@ HOMEPAGE = "http://qemu.org"
 LICENSE = "GPLv2 & LGPLv2.1"
 DEPENDS = "zlib alsa-lib"
 
-EXTRA_OECONF = "--target-list=arm-linux-user,arm-softmmu,i386-linux-user,i386-softmmu,x86_64-linux-user,x86_64-softmmu,mips-linux-user,mips-softmmu,ppc-linux-user,ppc-softmmu,mipsel-linux-user --disable-werror --disable-vnc-tls --enable-kvm --audio-drv-list=oss,alsa --audio-card-list=ac97,es1370"
-#EXTRA_OECONF += "--disable-sdl"
+# QEMU_TARGETS is overridable variable
+QEMU_TARGETS ?= "arm i386 mips mipsel mips64 mips64el ppc sh4 x86_64"
+
+require qemu-targets.inc
+
+EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls --enable-kvm --audio-drv-list=oss,alsa --audio-card-list=ac97,es1370"
+
+#EXTRA_OECOF += "--disable-sdl"
 
 inherit autotools
 
@@ -34,6 +40,6 @@ do_configure() {
 SRC_URI_append_virtclass-nativesdk = " file://glflags.patch;patch=1"
 DEPENDS_virtclass-nativesdk = "zlib-nativesdk libsdl-nativesdk qemugl-nativesdk"
 RDEPENDS_virtclass-nativesdk = "libsdl-nativesdk"
-EXTRA_OECONF_virtclass-nativesdk = "--target-list=arm-linux-user,arm-softmmu,i386-softmmu,x86_64-softmmu,mips-linux-user,mipsel-linux-user,mips-softmmu,ppc-softmmu --disable-vnc-tls --cross-prefix=${TARGET_PREFIX}"
+EXTRA_OECONF_virtclass-nativesdk += "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls --cross-prefix=${TARGET_PREFIX}"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.4.1



