Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1B8FC606CA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 12:31:29 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id z52so70962716wrc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 May 2017 05:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=ZOMjYNr/HjvnPkPxLMZp0Q4EHWY8w9GqSo58K2inC3E=;
	b=vdwcUWe9gnCyPrS3zCJIBN0WBkQjHJ1L78UJGVwhHKLAnYWI3u44ANOelJxQw6E9fQ
	lWzr16tU4Snjq9zR4A9KujUB5Y/ivF4GmQt4tirzoUHimKVw2KevD/qFuyxrx7WUYoK+
	KJR0mIkHtROcpeXgAOFOxR3pLmsSAMRTZIkz9Z/Fbp15GTuJ/kB5ghBsZ8Peq8GoI2mb
	Wtanw/dzvgJPBoASlIi6jnlne1UlFeSArgjxAvavQsVklPWgmniP4U9Pom7rBoOy4+/Z
	qlm9/xVEHjLDed1b7CIzFaEP0Pdk0l939U47h+v4e1P+lrL2WXI+KVhMlgfyPsadGl1q
	n+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ZOMjYNr/HjvnPkPxLMZp0Q4EHWY8w9GqSo58K2inC3E=;
	b=hxd6nh8k6uFxxqRVbNaygzE70V498B3zg+wuzOu740hwKWxskleqprz0USxPcnipmS
	RFfcj3LEn/gm0ZSyhyHwvfWUUrLX0IvRLhriy20hI/LRgoscnlooA3f5tpbF75TFarWe
	9QhqVFqCPVPSYL+Dlptkj43Fuxlgt9WdHcLoMA8xPDSdcX9/54OTqulz2voReF2gRENa
	xzHyk5BQuGH8nvfVYGdRP7fIXYKWsaCP7P61GAwgCg94PBVyMHgRHsPgl2AQ+TJ4fBVM
	B4gpLk0yQiTc2eZeJoLaBKfZGTnzCykqErRVHnwAf33La37dehDA+PBD9UcCoDO6BPQ8
	2Ppw==
X-Gm-Message-State: AN3rC/4O9CbMfL+Ft8XnbAlB8j+B4buP+j9KxHt/Q1iVzxY7srql/XOo
	ihIiobj/01y0i+X69Gk=
X-Received: by 10.223.177.219 with SMTP id r27mr42659429wra.148.1494333089595; 
	Tue, 09 May 2017 05:31:29 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	o20sm14925174wro.61.2017.05.09.05.31.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 May 2017 05:31:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 May 2017 13:31:27 +0100
Message-Id: <1494333087-16518-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] gcr: add missing dependency on xsltproc if introspection is enabled
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
X-List-Received-Date: Tue, 09 May 2017 12:31:30 -0000

gcr needs xsltproc at build time if GObject Introspection is enabled.

Also, remove the explicit disabling of g-i and gtk-doc on x86-64 targets, this
appears to work now.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gcr/gcr_3.20.0.bb | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-gnome/gcr/gcr_3.20.0.bb b/meta/recipes-gnome/gcr/gcr_3.20.0.bb
index f31abce..4450e15 100644
--- a/meta/recipes-gnome/gcr/gcr_3.20.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.20.0.bb
@@ -5,7 +5,8 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
-DEPENDS = "intltool-native gtk+3 p11-kit glib-2.0 libgcrypt"
+DEPENDS = "intltool-native gtk+3 p11-kit glib-2.0 libgcrypt \
+           ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'libxslt-native', '', d)}"
 
 inherit autotools gnomebase gtk-icon-cache gtk-doc distro_features_check upstream-version-is-even vala gobject-introspection
 # depends on gtk+3, but also x11 through gtk+-x11
@@ -23,16 +24,3 @@ FILES_${PN} += " \
 
 # http://errors.yoctoproject.org/Errors/Details/20229/
 ARM_INSTRUCTION_SET = "arm"
-
-# on x86-64 the introspection binary goes into 
-# an infinite loop under qemu during compilation, 
-# printing the following:
-# 
-# gcrypt-Message: select() error: Bad address
-#
-# gcrypt-Message: select() error: Bad address
-#
-# gcrypt-Message: select() error: Bad address
-#
-# This will be investigated later.
-EXTRA_OECONF_append_x86-64 = " --disable-introspection --disable-gtk-doc"
-- 
2.8.1


