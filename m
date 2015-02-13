Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 89DD360556
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 06:00:13 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id r20so9519614wiv.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 22:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=qjUR3rbPKUljhCu1fUsviToSjbFaHNDdGJ+hEz2ViUg=;
	b=MQn2xYaB+6TWvCJqS6iamom1hCee4yxSrnW2i7BPFKeeMTqUE+0usGul+2fktXAeFe
	aWH5rN47FafJ640HOSUfJTFThxlRO+C0tlIXr8z80jKj+HMWb3FdA4gfWiSvMqK0x4Gj
	rGgoKvOTSR6M5jx+kGC+cDVhn8lngCtZYxHmkZpqFWRneoCkWzXcbc0yNVZRi/zDMQKK
	oiZJDDD4Jscnt9OlwFj+nkEq7FEROHFsPpHaGCMKCaJmTTKfHh++O5Puqv+eGeI69ZJq
	/l6YkKssRvsNhCz9TwmpeMqwV3jtDxsUDGlYvb6n1IyO+d2BHcqBHdS2jj85kCjqw4/b
	2sFQ==
X-Received: by 10.180.95.97 with SMTP id dj1mr3584308wib.43.1423807214028;
	Thu, 12 Feb 2015 22:00:14 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip0.t-ipconnect.de.
	[91.10.19.148])
	by mx.google.com with ESMTPSA id u9sm8547638wjy.37.2015.02.12.22.00.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 22:00:13 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Feb 2015 06:59:52 +0100
Message-Id: <1423807195-7087-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423807195-7087-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423807195-7087-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] gpgme: add native build and ship a valid gpgme-config
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
X-List-Received-Date: Fri, 13 Feb 2015 06:00:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some packages (here kde/kf5 kwallet) ask for gpgme details during
configuration. This patch makes them build properly. In case
gpgme-config is asked for host, it returns 'unknown' because native
build cannot know the target to build for.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../gpgme-1.4.3/0001-return-unknown-as-host.patch  | 33 ++++++++++++++++++++++
 meta/recipes-support/gpgme/gpgme_1.4.3.bb          | 11 ++++++--
 2 files changed, 42 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/gpgme/gpgme-1.4.3/0001-return-unknown-as-host.patch

diff --git a/meta/recipes-support/gpgme/gpgme-1.4.3/0001-return-unknown-as-host.patch b/meta/recipes-support/gpgme/gpgme-1.4.3/0001-return-unknown-as-host.patch
new file mode 100644
index 0000000..7dabd98
--- /dev/null
+++ b/meta/recipes-support/gpgme/gpgme-1.4.3/0001-return-unknown-as-host.patch
@@ -0,0 +1,33 @@
+From 84427b2fd68f6c56f3919fdddad63cf5b5541730 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Thu, 4 Dec 2014 13:31:15 +0100
+Subject: [PATCH] return unknown as host
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+this is intended for native build which cannot know target host
+
+Upstream-Status: Inappropriate [cross build specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 92375e6..4564c05 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -989,7 +989,7 @@ AH_BOTTOM([
+ # Substitution used for gpgme-config
+ GPGME_CONFIG_LIBS="-lgpgme"
+ GPGME_CONFIG_CFLAGS=""
+-GPGME_CONFIG_HOST="$host"
++GPGME_CONFIG_HOST="unknown"
+ AC_SUBST(GPGME_CONFIG_API_VERSION)
+ AC_SUBST(GPGME_CONFIG_LIBS)
+ AC_SUBST(GPGME_CONFIG_CFLAGS)
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-support/gpgme/gpgme_1.4.3.bb b/meta/recipes-support/gpgme/gpgme_1.4.3.bb
index 98fd68b..0b93ce4 100644
--- a/meta/recipes-support/gpgme/gpgme_1.4.3.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.4.3.bb
@@ -12,15 +12,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gpgme/gpgme-${PV}.tar.bz2 \
            file://gpgme.pc"
 
+SRC_URI_append_class-native = " file://0001-return-unknown-as-host.patch"
+
 SRC_URI[md5sum] = "334e524cffa8af4e2f43ae8afe585672"
 SRC_URI[sha256sum] = "2d1cc12411753752d9c5b9037e6fd3fd363517af720154768cc7b46b60120496"
 
 DEPENDS = "libgpg-error libassuan"
 
-BINCONFIG = "${bindir}/gpgme-config"
 EXTRA_OECONF = "--with-gpg=${bindir}/gpg --without-gpgsm --with-gpgconf=no --with-g13=no"
 
-inherit autotools texinfo binconfig-disabled pkgconfig
+inherit autotools texinfo pkgconfig
 
 PACKAGES =+ "${PN}-pthread"
 FILES_${PN}-pthread = "${libdir}/libgpgme-pthread.so.*"
@@ -36,3 +37,9 @@ do_install_append () {
         install -d ${D}${libdir}/pkgconfig
         install -m 0644 ${WORKDIR}/gpgme.pc ${D}${libdir}/pkgconfig/
 }
+
+do_install_append_class-native () {
+	sed -i 's:${STAGING_DIR_NATIVE}::g' ${D}${bindir}/gpgme-config
+}
+
+BBCLASSEXTEND = "native"
-- 
1.9.3


