Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 27D8973A05
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 13:48:15 +0000 (UTC)
Received: by wiwl15 with SMTP id l15so39153506wiw.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 06:48:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=N7qWkiGsQqZawcApVldSgrE/sI2CbpFQJFpeZ/A+Ch0=;
	b=JKO8SIaoCt7q8Zh/RVRR2YG+dWBTeqUS9K6bvx0C0r0125W8G8ULv0zx+H2QF/JTU7
	PI/9WLOxXcIIzPU/UdkmzOYi/kJCRgYSOy+agAlOYafLCIzDxpKqJAGbWgjHRVjgWOE6
	IVDgM5K7QQpKDBeR3TuAP/6iPjuO12LlfvNg71keNErvBgbKMdxKzKOUnyKy8YQtMouC
	8wi7zhmiEWrV7gwCeOsDP8FoBsUfKkVqj4mlQ/EThpYVskNBd+cYHwJUkaCCykblP9Sv
	kapxxeWAkAzKJdHmWwmFHOvDsrOVEl1QJS7qnFmRjbTq8EZKeQ73w+5+3RB+DFVxxd1Z
	JfWg==
X-Gm-Message-State: ALoCoQkQjR9wkQCUiXp030FszJFKvxc22E1k0BcsapFMCx3iixXf/zmuRXFRdzFfETM5nCDvN0dv
X-Received: by 10.180.207.237 with SMTP id lz13mr79076321wic.15.1426081695416; 
	Wed, 11 Mar 2015 06:48:15 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id l6sm5513570wjx.33.2015.03.11.06.48.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Mar 2015 06:48:14 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Mar 2015 13:45:34 +0000
Message-Id: <1426081534-21085-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] util-linux: split libraries dynamically
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
X-List-Received-Date: Wed, 11 Mar 2015 13:48:19 -0000

util-linux has a number of utility libraries and not noticing a new one being
added in an upgrade results in many of the split-out core tools depending on the
entire package for the library.  To prevent this happening in the future do the
library packaging dynamically.

As a side-effect libsmartcols.so is no longer packaged in util-linux so
util-linux-fdisk no longer depends on the full util-linux.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/util-linux/util-linux.inc |   15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index dd607ef..4cca897 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -27,8 +27,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
 
 PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfdisk \
              util-linux-swaponoff util-linux-losetup util-linux-umount \
-             util-linux-mount util-linux-readprofile util-linux-libblkid \
-             util-linux-libmount util-linux-libuuid util-linux-uuidd \
+             util-linux-mount util-linux-readprofile util-linux-uuidd \
              util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid \
              util-linux-mkfs util-linux-mcookie util-linux-reset \
              util-linux-mkfs.cramfs util-linux-fsck.cramfs util-linux-fstrim \
@@ -36,6 +35,8 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-findfs util-linux-getopt"
 PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', 'util-linux-pylibmount', '', d)}"
 
+PACKAGES_DYNAMIC = "^util-linux-lib.*"
+
 SHARED_EXTRA_OECONF = "--disable-use-tty-group \
                        --disable-makeinstall-chown \
                        --enable-kill --enable-last --enable-mesg --enable-partx \
@@ -85,11 +86,8 @@ FILES_util-linux-hwclock = "${base_sbindir}/hwclock.${BPN}"
 FILES_util-linux-findfs = "${sbindir}/findfs"
 FILES_util-linux-getopt = "${base_bindir}/getopt.${BPN}"
 
-FILES_util-linux-libblkid = "${base_libdir}/libblkid.so.*"
-FILES_util-linux-libmount = "${base_libdir}/libmount.so.*"
 FILES_util-linux-pylibmount = "${libdir}/${PYTHON_DIR}/dist-packages/libmount/pylibmount.so \
                                ${libdir}/${PYTHON_DIR}/dist-packages/libmount/__init__.*"
-FILES_util-linux-libuuid = "${base_libdir}/libuuid.so.*"
 FILES_util-linux-lscpu = "${bindir}/lscpu"
 
 FILES_util-linux-fsck = "${base_sbindir}/fsck*"
@@ -243,3 +241,10 @@ python do_package_prepend () {
         d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name, '%s/%s' % (d.getVar('base_bindir', True), alt_name))
         d.appendVar('ALTERNATIVE_%s' % (d.getVar('PN', True)), ' ' + alt_name)
 }
+
+python populate_packages_prepend() {
+    do_split_packages(d, '${base_libdir}', '^lib(.*)\.so\..*$',
+                      output_pattern='util-linux-lib%s',
+                      description='util-linux lib%s',
+                      extra_depends='', prepend=True, allow_links=True)
+}
-- 
1.7.10.4


