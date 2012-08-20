Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc.reilly@gmail.com>) id 1T3G2M-0005mf-Ra
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 02:40:11 +0200
Received: by mail-pb0-f47.google.com with SMTP id wy7so7151723pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2012 17:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=ZX8J2X9oblJt4O/TbTD8NzdaRSrgSGJAb5svMbRf/SU=;
	b=jqxAFe4LuunB0RAY9+xz8JW5mxjOHSI85OJU8xkaERP9p95lT67Mx9qjMrKGGzAaI1
	uRr/jGuztmqmCH5lF2z0+v6Qx5SHg4V5EVT/S6A/+Aq+SVBt8gQkudPHD0PcTmX1xswg
	UhknSsyNT0K8byfrpmCR612/A2VLMkr9xXYMqfsACADl8bcO7g1wGsbvdswjzCjwTq4v
	2jfu/rTGSPUfX6VBocHFB4M+L79Q7yvf3aFJv3zPW4w8GIzoqQ3y2T6ZWPvnIpAKnxH5
	qqnHO2Wb8aP2zM2lU2pMFeZLkcwlCmzdxltSv2szMpCqnE2AB3r/AUIitHclZVCEuPW1
	ZahA==
Received: by 10.66.75.229 with SMTP id f5mr25523053paw.47.1345422490899;
	Sun, 19 Aug 2012 17:28:10 -0700 (PDT)
Received: from localhost.localdomain (220-244-174-13.static.tpgi.com.au.
	[220.244.174.13])
	by mx.google.com with ESMTPS id wd6sm9871286pbc.15.2012.08.19.17.28.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 19 Aug 2012 17:28:10 -0700 (PDT)
Sender: Marc Reilly <marc.reilly@gmail.com>
From: Marc Reilly <marc@cpdesign.com.au>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2012 10:21:39 +1000
Message-Id: <1345422099-26198-2-git-send-email-marc@cpdesign.com.au>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1345422099-26198-1-git-send-email-marc@cpdesign.com.au>
References: <1345422099-26198-1-git-send-email-marc@cpdesign.com.au>
Subject: [PATCH] hplip: Introduce version 3.12.6
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
X-List-Received-Date: Mon, 20 Aug 2012 00:40:11 -0000

This introduces a recipe to build hplip 3.12.6 in a simple configuration
aimed at USB printers. It is based on a 3.11.3a recipe for oe classic
by Steve Sakoman.

The hp-setup program is patched to add a small delay after restarting cups,
as on slower embedded systems the cups daemon would sometimes not restart
quickly enough and adding a new printer would sporadically fail.

Tested on an armv6 system (with cups 1.4.6, ghostscript 9.05, foomatic).

Signed-off-by: Marc Reilly <marc@cpdesign.com.au>
---
 .../hplip/hplip-3.12.6/fix-libusb-paths.patch      |   35 ++++++++++
 .../setup-add-sleep-after-cups-reset.patch         |   12 ++++
 meta/recipes-extended/hplip/hplip_3.12.6.bb        |   68 ++++++++++++++++++++
 3 files changed, 115 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/hplip/hplip-3.12.6/fix-libusb-paths.patch
 create mode 100644 meta/recipes-extended/hplip/hplip-3.12.6/setup-add-sleep-after-cups-reset.patch
 create mode 100644 meta/recipes-extended/hplip/hplip_3.12.6.bb

diff --git a/meta/recipes-extended/hplip/hplip-3.12.6/fix-libusb-paths.patch b/meta/recipes-extended/hplip/hplip-3.12.6/fix-libusb-paths.patch
new file mode 100644
index 0000000..b347f83
--- /dev/null
+++ b/meta/recipes-extended/hplip/hplip-3.12.6/fix-libusb-paths.patch
@@ -0,0 +1,35 @@
+Upstream-Status: Inappropriate [configuration]
+
+diff -rupN hplip-3.12.6_orig/configure.in hplip-3.12.6/configure.in
+--- hplip-3.12.6_orig/configure.in	2012-06-18 20:44:24.000000000 +1000
++++ hplip-3.12.6/configure.in	2012-08-16 13:40:07.259927650 +1000
+@@ -524,6 +524,8 @@ if test "$hpijs_only_build" = "no"; then
+       AC_CHECK_HEADERS(usb.h, ,[AC_MSG_ERROR([cannot find libusb-devel support], 11)])
+    else
+       AC_CHECK_LIB([usb-1.0], [libusb_init], [LIBS="$LIBS"], [AC_MSG_ERROR([cannot find libusb 1.0 support], 2)])
++      LIBUSBINCLUDEROOT?="/usr/include/"
++      AC_ARG_VAR(LIBUSBINCLUDEROOT, [path to libusb-1.0 folder])
+       AC_CHECK_HEADERS(libusb-1.0/libusb.h, ,[AC_MSG_ERROR([cannot find libusb-1.0-devel support], 11)])
+    fi
+ fi
+diff -rupN hplip-3.12.6_orig/Makefile.am hplip-3.12.6/Makefile.am
+--- hplip-3.12.6_orig/Makefile.am	2012-06-18 20:44:13.000000000 +1000
++++ hplip-3.12.6/Makefile.am	2012-08-16 13:41:12.307932822 +1000
+@@ -72,7 +72,7 @@ libhpmud_la_SOURCES = io/hpmud/hpmud.c i
+ 	  io/hpmud/hpmud.h io/hpmud/hpmudi.h io/hpmud/list.h io/hpmud/mlc.h io/hpmud/pml.h io/hpmud/dot4.c \
+ 	  io/hpmud/dot4.h io/hpmud/jd.c io/hpmud/jd.h io/hpmud/pp.c io/hpmud/pp.h io/hpmud/musb.h io/hpmud/musb_libusb01.c
+ else
+-libhpmud_la_CFLAGS = -I/usr/include/libusb-1.0 -DMUDNAME=\"$(MUDNAME)\" -DCONFDIR=\"$(hplip_confdir)\"
++libhpmud_la_CFLAGS = -I/$(LIBUSBINCLUDEROOT)/libusb-1.0 -DMUDNAME=\"$(MUDNAME)\" -DCONFDIR=\"$(hplip_confdir)\"
+ libhpmud_la_SOURCES = io/hpmud/hpmud.c io/hpmud/mlc.c io/hpmud/model.c io/hpmud/pml.c \
+ 	  io/hpmud/hpmud.h io/hpmud/hpmudi.h io/hpmud/list.h io/hpmud/mlc.h io/hpmud/pml.h io/hpmud/dot4.c \
+ 	  io/hpmud/dot4.h io/hpmud/jd.c io/hpmud/jd.h io/hpmud/pp.c io/hpmud/pp.h io/hpmud/musb.h io/hpmud/musb.c
+@@ -286,7 +286,7 @@ hpmudext_la_LIBADD = libhpmud.la
+ if LIBUSB01_BUILD
+ hpmudext_la_CFLAGS = -I$(PYTHONINCLUDEDIR)
+ else
+-hpmudext_la_CFLAGS =-I/usr/include/libusb-1.0 -I$(PYTHONINCLUDEDIR)
++hpmudext_la_CFLAGS =-I$(LIBUSBINCLUDEROOT)/libusb-1.0 -I$(PYTHONINCLUDEDIR)
+ endif
+ 
+ # ui (qt3)
diff --git a/meta/recipes-extended/hplip/hplip-3.12.6/setup-add-sleep-after-cups-reset.patch b/meta/recipes-extended/hplip/hplip-3.12.6/setup-add-sleep-after-cups-reset.patch
new file mode 100644
index 0000000..0e1b6c4
--- /dev/null
+++ b/meta/recipes-extended/hplip/hplip-3.12.6/setup-add-sleep-after-cups-reset.patch
@@ -0,0 +1,12 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+--- hplip-3.11.10/setup.py.orig	2011-10-02 14:06:19.000000000 +1100
++++ hplip-3.11.10/setup.py	2012-02-29 08:21:39.167999938 +1100
+@@ -573,6 +573,7 @@
+ 
+             log.debug("Restarting CUPS...")
+             status, output = utils.run(restart_cups())
++            time.sleep(3)
+             log.debug("Restart CUPS returned: exit=%d output=%s" % (status, output))
+ 
+             cups.setPasswordPrompt("You do not have permission to add a printer.")
diff --git a/meta/recipes-extended/hplip/hplip_3.12.6.bb b/meta/recipes-extended/hplip/hplip_3.12.6.bb
new file mode 100644
index 0000000..2826a76
--- /dev/null
+++ b/meta/recipes-extended/hplip/hplip_3.12.6.bb
@@ -0,0 +1,68 @@
+DESCRIPTION = "HP Linux Imaging and Printing"
+LICENSE="GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=442bb3cbbeeb60643a87325718b8a8ee"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${PN}/${PN}-${PV}.tar.gz \
+           file://setup-add-sleep-after-cups-reset.patch \
+           file://fix-libusb-paths.patch \
+	  "
+
+DEPENDS += "cups python libusb"
+
+inherit autotools python-dir pythonnative
+
+export BUILD_SYS
+export HOST_SYS
+export STAGING_INCDIR
+export STAGING_LIBDIR
+
+EXTRA_OECONF += "\
+        LIBUSBINCLUDEROOT=${STAGING_INCDIR} \
+        --disable-network-build \
+        --disable-doc-build \
+        --disable-pp-build \
+        --disable-scan-build \
+        --disable-gui-build \
+        --disable-fax-build \
+        --disable-policykit  \
+        --disable-qt4 \
+        --disable-qt3 \
+        --disable-dbus-build \
+        --disable-foomatic-drv-install \
+        --enable-foomatic-ppd-install  \
+        --enable-foomatic-rip-hplip-install \
+        "
+
+PACKAGES += "${PN}-ppd ${PN}-cups ${PN}-backend ${PN}-filter ${PN}-hal"
+
+RDEPENDS_${PN} += " \
+        python-syslog \
+        python-pprint \
+        python-compression \
+        python-shell \
+        python-xml \
+        python-unixadmin \
+        python-html \
+        python-resource \
+        python-terminal \
+        python-subprocess\
+        "
+
+# need to snag the debug file or OE will fail on backend package
+FILES_${PN}-dbg += "\
+        ${libdir}/cups/backend/.debug \
+        ${PYTHON_SITEPACKAGES_DIR}/.debug \
+        ${libdir}/cups/filter/.debug "
+
+FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/*.la"
+FILES_${PN}-ppd = "${datadir}/ppd"
+FILES_${PN}-cups = "${datadir}/cups"
+FILES_${PN}-backend = "${libdir}/cups/backend"
+FILES_${PN}-filter = "${libdir}/cups/filter"
+FILES_${PN}-hal = "${datadir}/hal"
+
+FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}/*.so"
+
+SRC_URI[md5sum] = "5303938e8630775ea6fb383af85775e5"
+SRC_URI[sha256sum] = "54578000792969adb583e75efeacb9c46ab69659ec7e9424de390613f3595775"
+
-- 
1.7.7



