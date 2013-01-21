Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TxGYq-0005pS-SN
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 13:33:36 +0100
Received: from mail-la0-f70.google.com ([209.85.215.70])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 21 Jan 2013 04:17:42 -0800
Received: by mail-la0-f70.google.com with SMTP id eb20so5769738lab.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 04:17:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=ItKkke5tSAq//qq6uUlUOlObYOSqFT02rZjayuPf1PQ=;
	b=T7ipHHYpt0co7lzDTUxnZvXPH3ihqgi5jvi1gmTSz02MyK5aHBVnM9Y0qNe0qfXZmP
	ar+r3EYvdCqq3oMe0TRaviAg9j4pbE9+z4YzekRQUn/6tf+w4+L3bsITYow+0W6U+50S
	1igq548D764UsJom8fS+L/AOTTERVgILlAAQdZyf2oEqRJUsMBFpU6U0qz/VV5985fDG
	dRAxrUVfopAVAbV+2Apv7RnJ56nOw+DHn8KKkedY8WO251Bl1LtnrbLqF5gDYY7vlKSW
	TeEQKlF+yGIghunF/9v2lR1hbNtb26wbjxz/NvRN07Unb41iuTMYU7ys+k2guBSxDxCw
	lHmQ==
X-Received: by 10.194.90.238 with SMTP id bz14mr26122536wjb.9.1358770660595;
	Mon, 21 Jan 2013 04:17:40 -0800 (PST)
X-Received: by 10.194.90.238 with SMTP id bz14mr26122372wjb.9.1358770658917;
	Mon, 21 Jan 2013 04:17:38 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id s10sm18415972wiw.4.2013.01.21.04.17.37
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Jan 2013 04:17:38 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jan 2013 12:15:34 +0000
Message-Id: <f669e40a7f7bb2a8de0c6da4f6fdac21a0676b0d.1358770449.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <53d6b4110f4e12cfde4dcfbef992cc44d8c58c1e.1358770449.git.ross.burton@intel.com>
References: <53d6b4110f4e12cfde4dcfbef992cc44d8c58c1e.1358770449.git.ross.burton@intel.com>
In-Reply-To: <cover.1358770449.git.ross.burton@intel.com>
References: <cover.1358770449.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnhztgpZ8XT/ZH4Km7gwZ87k3e5qcFXv7gcsu60s/snErU8mXymk9xwDEofv/RddMsqrKKnZkVX9iI6uMGskQ0e6Emfz8GC/DIbJQ7xofB2nVhwY7FFUFfTveX5uAc9pjTlA7rTqRBJUyIwIJP2Crre5res2qxbPVd39O60P4S4kEw1//YzE20cgaPH6AsruIoxwf/5
Subject: [PATCH 5/5] systemd: use new GTKDOC_DOCDIR and clean up
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
X-List-Received-Date: Mon, 21 Jan 2013 12:33:39 -0000

Now that gtk-doc.bbclass supports overriding the documentation directory,
systemd can just inherit gtk-doc and all of the manual operations can be
removed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_196.bb |   10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_196.bb b/meta/recipes-core/systemd/systemd_196.bb
index ba42a40..5242b5a 100644
--- a/meta/recipes-core/systemd/systemd_196.bb
+++ b/meta/recipes-core/systemd/systemd_196.bb
@@ -8,14 +8,14 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
 
 PROVIDES = "udev"
 
-DEPENDS = "xz kmod gtk-doc-stub-native docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers usbutils glib-2.0 libgcrypt"
+DEPENDS = "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers usbutils glib-2.0 libgcrypt"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SERIAL_CONSOLE ?= "115200 /dev/ttyS0"
 
 SECTION = "base/shell"
 
-inherit useradd pkgconfig autotools perlnative
+inherit gtk-doc useradd pkgconfig autotools perlnative
 
 SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
            file://0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch \
@@ -47,6 +47,8 @@ CACHED_CONFIGUREVARS = "ac_cv_file__usr_share_pci_ids=no \
                         ac_cv_file__usr_share_hwdata_pci_ids=no \
                         ac_cv_file__usr_share_misc_pci_ids=yes"
 
+GTKDOC_DOCDIR = "${S}/docs/"
+
 # The gtk+ tools should get built as a separate recipe e.g. systemd-tools
 EXTRA_OECONF = " --with-distro=${SYSTEMDDISTRO} \
                  --with-rootprefix=${base_prefix} \
@@ -59,7 +61,6 @@ EXTRA_OECONF = " --with-distro=${SYSTEMDDISTRO} \
                  --disable-coredump \
                  --disable-introspection \
                  --with-pci-ids-path=/usr/share/misc \
-                 --disable-gtk-doc-html \
                  --disable-tcpwrap \
                  --enable-split-usr \
                  --disable-microhttpd \
@@ -69,12 +70,9 @@ EXTRA_OECONF = " --with-distro=${SYSTEMDDISTRO} \
 # There's no docbook-xsl-native, so for the xsltproc check to false
 do_configure_prepend() {
 	export CPP="${HOST_PREFIX}cpp ${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}"
-	sed -i /xsltproc/d configure.ac
 
 	# we only have /home/root, not /root
 	sed -i -e 's:=/root:=/home/root:g' units/*.service*
-
-	gtkdocize --docdir ${S}/docs/
 }
 
 do_install() {
-- 
1.7.10.4



