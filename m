Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SjlcX-0003Gz-H9
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 08:20:57 +0200
Received: by mail-pz0-f47.google.com with SMTP id h21so894934dal.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2012 23:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=o1EykKS4xC2v17Xsv+SI+S4kRSL69DT/nggPI8YILSo=;
	b=kEeYSoHxi5MzDUV5CvaweaaaHCBH1wqqlE1nNox7+snEMzErSeBF8KU54xWlFPiMbX
	ucAm/aAXA8H4pLarBi6NFnsJfvn6zIjUeX2oxnNnXq94lDt7q+GZcTaHVjAPwz30YH55
	caoIOwb6rGcLcf1npCy0hUKRfzIjHyWDq/X3sNwonF4RAWPvL4Vb6gEVbWOtzUnDwfTN
	jjF5RVttLdn9N094YrhUAkhTiEYKdCEp+cVoBWLCt/5zH9c5Z4ew6IOa4ImkktT6NIFo
	Ki3GayztVXkzB9Erpel0obQGwKNEoZXdDkm1FVN1h9jI4cyBOOnPPZQslk29GXRYe6Qt
	jnwg==
Received: by 10.68.203.66 with SMTP id ko2mr60329212pbc.84.1340777406274;
	Tue, 26 Jun 2012 23:10:06 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ob9sm14168304pbb.28.2012.06.26.23.10.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Jun 2012 23:10:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jun 2012 23:09:45 -0700
Message-Id: <55a411d66293b6d2196e98376f0fb9e4487b4bdf.1340777116.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1340777115.git.raj.khem@gmail.com>
References: <cover.1340777115.git.raj.khem@gmail.com>
Subject: [PATCH 1/7] kconfig-frontends: New recipe
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
X-List-Received-Date: Wed, 27 Jun 2012 06:20:57 -0000

kconfig-frontends provides the kconfig infrastructure
thats used for linux kernel as a standalone package. Its
not intended to be used for kernel itself but can be
used by packages who are based on kconfig e.g. busybox
uclibc or new packages who wants to use kconfig infra
for the package build

kconfig-frontends names it's shared library as -3.4.0.so instead of .so.3.4.0,
this causes the -dev package to grab it since it matches on *.so. This error
would also have shown up with the old PACKAGE order.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../kconfig-frontends/kconfig-frontends_3.4.bb     |   34 ++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb

diff --git a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb
new file mode 100644
index 0000000..9abfa75
--- /dev/null
+++ b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb
@@ -0,0 +1,34 @@
+# Copyright (C) 2012 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "The kconfig-frontends project aims at centralising \
+the effort of keeping an up-to-date, out-of-tree, packaging of the \
+kconfig infrastructure, ready for use by third-party projects. \
+The kconfig-frontends package provides the kconfig parser, as well as all \
+the frontends"
+HOMEPAGE = "http://ymorin.is-a-geek.org/projects/kconfig-frontends"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9b8cf60ff39767ff04b671fca8302408"
+SECTION = "devel"
+DEPENDS += "ncurses flex bison gperf"
+PR = "r0"
+PV = "3.4.0"
+SPIN = "0"
+SRC_URI = "http://ymorin.is-a-geek.org/download/${BPN}/${BPN}-${PV}-${SPIN}.tar.xz"
+SRC_URI[md5sum] = "7eed0faf5a41d6dd0b2a886a440a972d"
+SRC_URI[sha256sum] = "638006f3d1aefefdc1db3030a15b562cf3c89f2028b1cea0bf0f0629708802f2"
+
+S = "${WORKDIR}/${BPN}-${PV}-${SPIN}"
+
+inherit autotools
+do_configure_prepend () {
+	mkdir -p scripts/.autostuff/m4
+}
+EXTRA_OECONF += "--disable-gconf --disable-qconf"
+
+# Some packages have the version preceeding the .so instead properly
+# versioned .so.<version>, so we need to reorder and repackage.
+SOLIBS = "-${PV}.so"
+FILES_SOLIBSDEV = "${libdir}/libkconfig-parser.so"
+
+BBCLASSEXTEND = "native"
-- 
1.7.9.5



