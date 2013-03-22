Received: from mail-we0-f176.google.com ([74.125.82.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UJ6Eg-0007hR-0Y
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 18:58:44 +0100
Received: by mail-we0-f176.google.com with SMTP id s10so332557wey.21
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2013 10:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=kQi1tSMCjpDbqM2zdkMZhLdYPoYtYECiuZEKIP1y0hA=;
	b=Q/QPtjyoud4VHQfdaXDXvPIqp+wtwNK/XJ+5Cjh843VVdAy3Ac4mvdSnVvrikkw93q
	Mt3n8NK3biWF39FWiCCHnnjvIZZ7lZFr6zkqv0/ISJ1QVzYsfco5DKupf7c37gWhqUzy
	B/6m5bmPjBtKvFgfOTzfzxRBUJUUTdRqq05gTSHoNZSLQaX2ivwZ/WVzGnsUg7wv5eKv
	8UgTPNc1wEKCzi3f9NeR9Jg1+HS6ih/ztMit4x9V2fUXCP+72YHdAX3dtCfxVylASX0t
	deohUmgpeNQTYTTU56SoMr3PYwerW2yra3NnV4LAjVCjlnMuz0uHfL5eB+ECTrldHJhb
	VcKg==
X-Received: by 10.194.119.33 with SMTP id kr1mr4713790wjb.36.1363974104186;
	Fri, 22 Mar 2013 10:41:44 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm9sm12260880wib.3.2013.03.22.10.41.43
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 10:41:43 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 17:38:30 +0000
Message-Id: <aee32f66f2b04b1b1d08659cd6d7d9c16ee3e7f1.1363973088.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQm7dEj9rm8XHqFcIGv9iT7hx67rdWdcA/nuxSq+i3eU2HJ+Cr+/qNkHSNCVvTq6w1QsKMg2
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 10/22] util-linux: split uuidd into it's own package, and enable for systemd
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
X-List-Received-Date: Fri, 22 Mar 2013 17:59:39 -0000
X-List-Received-Date: Fri, 22 Mar 2013 17:59:39 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/util-linux/util-linux.inc |   11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 41a5471..46daab7 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=679af3e410ee112a5ec94de6501bf5c3
                     file://libmount/COPYING;md5=152f98bc301a5ea649769ede7203ac82 \
                     file://libblkid/COPYING;md5=152f98bc301a5ea649769ede7203ac82"
 
-inherit autotools gettext pkgconfig
+inherit autotools gettext pkgconfig systemd
 DEPENDS = "zlib ncurses"
 DEPENDS_append_class-native = " lzo-native"
 
@@ -34,7 +34,7 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-libmount util-linux-libmount-dev \
              util-linux-libblkid-dev util-linux-libuuid util-linux-libuuid-dev \
              util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid \
-             util-linux-mkfs util-linux-mcookie util-linux-reset"
+             util-linux-mkfs util-linux-mcookie util-linux-reset util-linux-uuidd"
 
 EXTRA_OECONF = "--libdir=${base_libdir} --disable-use-tty-group \
                 --disable-makeinstall-chown --enable-elvtune --enable-init \
@@ -46,6 +46,10 @@ EXTRA_OECONF = "--libdir=${base_libdir} --disable-use-tty-group \
 		usrsbin_execdir='${sbindir}' \
 "
 
+# Respect the systemd feature for uuidd
+EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--enable-socket-activation', '--disable-socket-activation', d)}"
+EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
+
 EXTRA_OECONF_append_class-native = " --disable-login --disable-su"
 
 FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
@@ -61,6 +65,7 @@ FILES_util-linux-mcookie = "${bindir}/mcookie"
 FILES_util-linux-umount = "${base_bindir}/umount.${BPN}"
 FILES_util-linux-readprofile = "${base_sbindir}/readprofile.${BPN}"
 FILES_util-linux-uuidgen = "${bindir}/uuidgen"
+FILES_util-linux-uuidd = "${sbindir}/uuidd"
 FILES_util-linux-reset = "${base_bindir}/reset"
 
 FILES_util-linux-libblkid = "${base_libdir}/libblkid.so.*"
@@ -88,6 +93,8 @@ RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-l
 RRECOMMENDS_${PN}_class-native = ""
 RDEPENDS_${PN}_class-native = ""
 
+SYSTEMD_PACKAGES = "util-linux-uuidd"
+SYSTEMD_SERVICE_util-linux-uuidd = "uuidd.service"
 
 do_compile () {
 	set -e
-- 
1.7.10.4



