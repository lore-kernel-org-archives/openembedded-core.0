Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id D276476C08
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 22:19:53 +0000 (UTC)
Received: by pacdd16 with SMTP id dd16so106447578pac.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 15:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=EqMO7gC8ZC5/j2ksWSr0IPw3XQkmEL2CeuWiN/2rLbs=;
	b=OglrwyzPHR4zXIl7zt7qjjWm02d7txMaUtnykkOWYlg6LHC406OFJoXJHubvwBrXEv
	k2f2oRLvsADi5os+UwK54fglyiDoUG/m9SL3AHRocsf+1d7m6NYdaPZ8Hf+XmpgtNNZ4
	2vQIwe+vR/mRWI23ZPiusgW8O+4zl4LHyA5UPqmASEDE/173yXgQvmOto//U5mUHE4ov
	xE+bQoMtn0XtgqQiBNsnKF0D/WuLOjPGDGcaCk04vcsGslLDOhjXNJeq7gVsvFrlVqmT
	fiP88Ob+9byfyZcxj4Q1Y7HES7sHz51RIK1Rd34KNbKyp6Q5mw6CcR4hK0LQzFSnbPLY
	99Mw==
X-Received: by 10.68.142.200 with SMTP id ry8mr49278568pbb.136.1440454794330; 
	Mon, 24 Aug 2015 15:19:54 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	u10sm18537623pdp.85.2015.08.24.15.19.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 15:19:53 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 15:19:44 -0700
Message-Id: <a4f5aee1dac48d9455c616c8fe75f780f2d4246e.1440454579.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <efbd9a5c0ebb330d105c707bbb1ebf9875003caa.1440454579.git.chris_larson@mentor.com>
References: <efbd9a5c0ebb330d105c707bbb1ebf9875003caa.1440454579.git.chris_larson@mentor.com>
In-Reply-To: <cover.1440454579.git.chris_larson@mentor.com>
References: <cover.1440454579.git.chris_larson@mentor.com>
Subject: [PATCH 2/5] libatomic-ops: move to recipes-support, fix recipe name
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
X-List-Received-Date: Mon, 24 Aug 2015 22:19:54 -0000

- This recipe is useful for more than just pulseaudio, so move it to
  recipes-support.
- Rename to the correct upstream name, which corresponds to the library name.
  Keep a PROVIDES of libatomics-ops for compatibility.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/recipes-devtools/guile/guile_2.0.11.bb                             | 2 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc                       | 2 +-
 meta/recipes-support/bdwgc/bdwgc_7.4.2.bb                               | 2 +-
 .../libatomic-ops/libatomic-ops_7.4.2.bb}                               | 1 +
 meta/recipes-support/libunwind/libunwind.inc                            | 2 +-
 5 files changed, 5 insertions(+), 4 deletions(-)
 rename meta/{recipes-multimedia/pulseaudio/libatomics-ops_7.4.2.bb => recipes-support/libatomic-ops/libatomic-ops_7.4.2.bb} (96%)

diff --git a/meta/recipes-devtools/guile/guile_2.0.11.bb b/meta/recipes-devtools/guile/guile_2.0.11.bb
index 71f696e..4869694 100644
--- a/meta/recipes-devtools/guile/guile_2.0.11.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.11.bb
@@ -37,7 +37,7 @@ BBCLASSEXTEND = "native"
 
 DEPENDS = "libunistring bdwgc gmp libtool libffi ncurses readline"
 # add guile-native only to the target recipe's DEPENDS
-DEPENDS_append_class-target = " guile-native libatomics-ops"
+DEPENDS_append_class-target = " guile-native libatomic-ops"
 
 RDEPENDS_${PN}_append_libc-glibc_class-target = "glibc-gconv-iso8859-1"
 
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 3389ec9..a098473 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://GPL;md5=4325afd396febcb659c36b49533135d4 \
                     file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://src/pulsecore/resampler.h;beginline=4;endline=21;md5=09794012ae16912c0270f3280cc8ff84"
 
-DEPENDS = "libatomics-ops liboil libsndfile1 libtool"
+DEPENDS = "libatomic-ops liboil libsndfile1 libtool"
 # optional
 DEPENDS += "udev alsa-lib glib-2.0 dbus gconf"
 DEPENDS += "json-c gdbm speexdsp libxml-parser-perl-native libcap"
diff --git a/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb b/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
index 23ec954..1ca8cf7 100644
--- a/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
+++ b/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
@@ -36,6 +36,6 @@ inherit autotools pkgconfig
 
 # by default use external libatomic-ops
 PACKAGECONFIG ??= "libatomic-ops"
-PACKAGECONFIG[libatomic-ops] = "--with-libatomic-ops=yes,--with-libatomic-ops=no,libatomics-ops"
+PACKAGECONFIG[libatomic-ops] = "--with-libatomic-ops=yes,--with-libatomic-ops=no,libatomic-ops"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-multimedia/pulseaudio/libatomics-ops_7.4.2.bb b/meta/recipes-support/libatomic-ops/libatomic-ops_7.4.2.bb
similarity index 96%
rename from meta/recipes-multimedia/pulseaudio/libatomics-ops_7.4.2.bb
rename to meta/recipes-support/libatomic-ops/libatomic-ops_7.4.2.bb
index 26faabb..4d0e299 100644
--- a/meta/recipes-multimedia/pulseaudio/libatomics-ops_7.4.2.bb
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.4.2.bb
@@ -1,6 +1,7 @@
 SUMMARY = "A library for atomic integer operations"
 HOMEPAGE = "https://github.com/ivmai/libatomic_ops/"
 SECTION = "optional"
+PROVIDES += "libatomics-ops"
 LICENSE = "GPLv2 & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://doc/LICENSING.txt;md5=e00dd5c8ac03a14c5ae5225a4525fa2d \
diff --git a/meta/recipes-support/libunwind/libunwind.inc b/meta/recipes-support/libunwind/libunwind.inc
index c8eab58..6660af2 100644
--- a/meta/recipes-support/libunwind/libunwind.inc
+++ b/meta/recipes-support/libunwind/libunwind.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "a portable and efficient C programming interface (API) to determi
 HOMEPAGE = "http://www.nongnu.org/libunwind"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3fced11d6df719b47505837a51c16ae5"
-DEPENDS += "libatomics-ops"
+DEPENDS += "libatomic-ops"
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
 
-- 
2.2.1


