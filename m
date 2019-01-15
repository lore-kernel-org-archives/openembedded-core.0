Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f53.google.com (mail-yw1-f53.google.com
	[209.85.161.53])
	by mail.openembedded.org (Postfix) with ESMTP id 064637C0D7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 14:45:41 +0000 (UTC)
Received: by mail-yw1-f53.google.com with SMTP id g194so1110324ywe.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 06:45:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fMsLOumKCalD1VWwd1oVYgtCXryVLvxDe7PpEy7NJBA=;
	b=c4H6cCYUokx9EpTp3ytMqe/E/QT9XvCFFSPUFdHCRHUoSrTfkcM37yccej9qT1VDV6
	zzrlOx2rE9h1s5CoPtfm+JmK1V6BsRKvFtaCwY1Qo8nj/xZGO/Lhyw1sNSIXzRz27sVN
	HHqFerg2yAoMrFohiK0gdyUhaXtdQQZ1OVOy1owqyrYQqcOfia+jnCQV9SYb3XI2fWdG
	ab8oObMQTA9vcTYP0c+eot1H9W2dkj4zz5vh0cqDiPU5oY6JrgtC9EmDWQ1XyRDZjrPT
	s8rH2zhG4SmBDiVzixpIy6yWBE3cIlq/AmDspHtmjyxmpcZUiI9LLUzjbh9vbE8RXvJg
	PMnw==
X-Gm-Message-State: AJcUukcMleZKiAjV+JokuZvnbMPotG379XkASmZ641uWfYZJ53i19SmI
	I1CGhxuBh5gBgIg5pFFB+F7QV6nx
X-Google-Smtp-Source: ALg8bN7OwvGgM63NzcNs2kcYEi/JHhYBzmfqcNYJs7UvCa4UWAzXPmWHY17xvitXCvMh3nitNOTduA==
X-Received: by 2002:a81:5b07:: with SMTP id p7mr3344280ywb.468.1547563542746; 
	Tue, 15 Jan 2019 06:45:42 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	i13sm1261220ywe.53.2019.01.15.06.45.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 06:45:42 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 14:45:20 +0000
Message-Id: <20190115144525.29388-11-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190115144525.29388-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190115144525.29388-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2 10/15] util-linux: one package per binary (pt 3: sbindir)
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
X-List-Received-Date: Tue, 15 Jan 2019 14:45:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Similar to the previous patch.

Existing packages (and current dependency by main package):
* blkdiscard <- RRECOMMENDS
* findfs
* fsck.cramfs
* mkfs <- RRECOMMENDS
* mkfs.cramfs
* partx
* readprofile <- RRECOMMENDS
* rfkill
* runuser <- RDEPENDS
* sfdisk <- RRECOMMENDS
* uuidd

New packages:
* too many to list

To avoid breaking existing users, all the new packages
are added to the main package as RRECOMMENDS_${PN}, so
they are pulled into existing images etc.

The existing RDEPENDS_${PN} will need some further
clean-up in the future, as it appears a bit random which
packages the main package depends on vs. recommends.

Nevertheless, all existing packages have been added to
RRECOMMENDS this time, even if they weren't in RDEPENDS /
RRECOMMENDS before.

[YOCTO #13058]

Signed-off-by: André Draszik <andre.draszik@jci.com>

---
v2: * Fix handling of escape characters in regexs and hence fix python
      Deprecation warnings which will be problematic in python 3.8.
    * use PN for package name prefix, not BPN
---
 meta/recipes-core/util-linux/util-linux.inc | 42 ++++++++-------------
 1 file changed, 16 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 1d6ef6b3d9..d8cd8bbfff 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -28,17 +28,13 @@ MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP}.tar.xz \
            "
 
-PACKAGES =+ "util-linux-blkdiscard util-linux-sfdisk \
-             util-linux-swaponoff \
-             util-linux-readprofile util-linux-uuidd \
-             util-linux-uuidgen util-linux-lscpu util-linux-fsck.cramfs \
-             util-linux-mkfs util-linux-mcookie util-linux-rfkill \
-             util-linux-lsblk util-linux-mkfs.cramfs \
-             util-linux-partx \
-             util-linux-findfs util-linux-prlimit \
+PACKAGES =+ "util-linux-swaponoff \
+             util-linux-uuidgen util-linux-lscpu \
+             util-linux-mcookie \
+             util-linux-lsblk \
+             util-linux-prlimit \
              util-linux-ionice util-linux-unshare"
 PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', 'util-linux-pylibmount', '', d)}"
-PACKAGES =+ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser', '', d)}"
 
 python apply_update_alternative_renames_prepend () {
     def pkg_hook(f, pkg, file_regex, output_pattern, modulename):
@@ -47,6 +43,11 @@ python apply_update_alternative_renames_prepend () {
         if d.getVarFlag('ALTERNATIVE_LINK_NAME', modulename):
             d.setVar('ALTERNATIVE_' + pkg, modulename)
 
+    def pkg_hook_with_recommends(f, pkg, file_regex, output_pattern, modulename):
+        pn = d.getVar('PN')
+        d.appendVar('RRECOMMENDS_%s' % pn, ' %s' % pkg)
+        pkg_hook(f, pkg, file_regex, output_pattern, modulename)
+
     do_split_packages(d, root='${base_sbindir}',
                       file_regex=r'(.*)', output_pattern='${PN}-%s',
                       description='${PN} %s',
@@ -55,6 +56,10 @@ python apply_update_alternative_renames_prepend () {
                       file_regex=r'(.*)', output_pattern='${PN}-%s',
                       description='${PN} %s',
                       hook=pkg_hook, extra_depends='', prepend=True)
+    do_split_packages(d, root='${sbindir}',
+                      file_regex=r'(.*)', output_pattern='${PN}-%s',
+                      description='${PN} %s',
+                      hook=pkg_hook_with_recommends, extra_depends='', prepend=True)
 }
 
 PACKAGES_DYNAMIC = "^util-linux-.*"
@@ -91,16 +96,8 @@ FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
 
 FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.la"
 
-FILES_util-linux-blkdiscard = "${sbindir}/blkdiscard"
-FILES_util-linux-sfdisk = "${sbindir}/sfdisk"
 FILES_util-linux-mcookie = "${bindir}/mcookie"
-FILES_util-linux-readprofile = "${sbindir}/readprofile.${BPN}"
 FILES_util-linux-uuidgen = "${bindir}/uuidgen"
-FILES_util-linux-uuidd = "${sbindir}/uuidd"
-FILES_util-linux-rfkill = "${sbindir}/rfkill.${BPN}"
-FILES_util-linux-partx = "${sbindir}/partx"
-FILES_util-linux-findfs = "${sbindir}/findfs"
-FILES_util-linux-runuser = "${sbindir}/runuser"
 FILES_util-linux-prlimit = "${bindir}/prlimit"
 FILES_util-linux-ionice = "${bindir}/ionice.${BPN}"
 FILES_util-linux-runuser = "${sysconfdir}/pam.d/runuser*"
@@ -113,11 +110,6 @@ FILES_util-linux-pylibmount = "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.so
 FILES_util-linux-lsblk = "${bindir}/lsblk"
 FILES_util-linux-lscpu = "${bindir}/lscpu"
 
-FILES_util-linux-mkfs = "${sbindir}/mkfs"
-
-FILES_util-linux-fsck.cramfs = "${sbindir}/fsck.cramfs"
-FILES_util-linux-mkfs.cramfs = "${sbindir}/mkfs.cramfs"
-
 FILES_util-linux-unshare = "${bindir}/unshare.${BPN}"
 
 # Util-linux' blkid replaces the e2fsprogs one
@@ -127,7 +119,7 @@ RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
 RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup util-linux-sulogin util-linux-lsblk"
 RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser util-linux-su', '', d)}"
 
-RRECOMMENDS_${PN} = "util-linux-blkdiscard util-linux-sfdisk util-linux-readprofile util-linux-mkfs util-linux-prlimit util-linux-ionice"
+RRECOMMENDS_${PN} = "util-linux-prlimit util-linux-ionice"
 RRECOMMENDS_${PN} += "${PN}-blockdev ${PN}-cfdisk ${PN}-ctrlaltdel ${PN}-fdisk ${PN}-mkswap ${PN}-nologin ${PN}-pivot-root ${PN}-switch-root"
 RRECOMMENDS_${PN} += "${PN}-dmesg ${PN}-kill ${PN}-more ${PN}-mount ${PN}-mountpoint"
 
@@ -214,7 +206,7 @@ ALTERNATIVE_PRIORITY = "80"
 ALTERNATIVE_${PN}  = " \
     hexdump last lastb logger mesg renice wall \
     setsid chrt flock utmpdump eject taskset fallocate \
-    fsfreeze nsenter cal rev \
+    nsenter cal rev \
 "
 
 ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
@@ -266,7 +258,6 @@ ALTERNATIVE_LINK_NAME[mount] = "${base_bindir}/mount"
 ALTERNATIVE_LINK_NAME[su] = "${base_bindir}/su"
 ALTERNATIVE_LINK_NAME[umount] = "${base_bindir}/umount"
 
-ALTERNATIVE_util-linux-readprofile = "readprofile"
 ALTERNATIVE_LINK_NAME[readprofile] = "${sbindir}/readprofile"
 
 ALTERNATIVE_LINK_NAME[losetup] = "${base_sbindir}/losetup"
@@ -278,7 +269,6 @@ ALTERNATIVE_LINK_NAME[fsck] = "${base_sbindir}/fsck"
 
 ALTERNATIVE_LINK_NAME[blkid] = "${base_sbindir}/blkid"
 
-ALTERNATIVE_util-linux-rfkill = "rfkill"
 ALTERNATIVE_LINK_NAME[rfkill] = "${sbindir}/rfkill"
 
 ALTERNATIVE_LINK_NAME[getopt] = "${base_bindir}/getopt"
-- 
2.20.1


