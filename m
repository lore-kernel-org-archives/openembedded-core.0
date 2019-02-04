Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
	[209.85.208.54])
	by mail.openembedded.org (Postfix) with ESMTP id 961CE7C208
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Feb 2019 10:05:58 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id f23so10728230edb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 02:05:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5Mp2jMtdFkarTAl1NDy7ElGDvPrciUU6pLnfUKX5ecM=;
	b=jHNpPljD4ZPZSHa+w5Xz/NRhQwsP4ofq5c4yDryZ4kq9d1XL7EY8c6tjNJYOS28gsh
	HGGhBB4uA3mhwjfml55pokMOHzF0+jdsVG8ITzLUwrb6IeFgpqg5QZSWVSFkjWWmjQfb
	2vndR5LEZq9OYF73rPdK5M8OD8ixaMnOUwAkVv4V+/GEOd5D8pVZqQRRhgP3nfVnkSwv
	ShxD3SkPLVylecv+NMIoRkxluF0ch//Bvocke0bxcjuS+Lq9RdOOBO7muk6Tk2YBc6IF
	t9HJ6U6znFBIBa4Ds57Rm8iZvYo1EMjbsMFG0/vCi15SpSp6kEYs+e6oFsMb9nmOmcOg
	mbHQ==
X-Gm-Message-State: AJcUukcEWg1n2HMVKpzs0GyUl4ZmxDQQA6lo1z2Nzi9Z+/mOpcAe1vGH
	SN1WlW4wDxtomNpJzXZnvjPZl4VZ
X-Google-Smtp-Source: ALg8bN6qegbRK38FIuZKASJv16iODKJ3xx1xz4k6YPZU2fhsD83/HBAgsl92wx6m+W47o5ZsnUgeKQ==
X-Received: by 2002:aa7:c0d0:: with SMTP id j16mr49199196edp.173.1549274758955;
	Mon, 04 Feb 2019 02:05:58 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	p36sm4102358edc.78.2019.02.04.02.05.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 02:05:57 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2019 10:05:43 +0000
Message-Id: <20190204100552.25880-3-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190204100552.25880-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190204100552.25880-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v5 02/11] util-linux: fix the su and runuser packages
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
X-List-Received-Date: Mon, 04 Feb 2019 10:05:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

The packages get an automatic RDEPENDS via shlibs, no
need to explicitly state it, so we can drop those
useless explicit assignments.

su is moved into ${base_bindir} in do_install(), so
because of a mismatched FILES specification su is
actually packaged into the main package at the moment,
not into the -su package as likely originally intended.

runuser needs the pam configuration files, so they should
be in the -runuser package, not in the main package.

While fixing this, we can simplify the update alternatives
processing for su.

[YOCTO #13058]

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index e479fc24e1..4a72e3d40e 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -96,7 +96,8 @@ FILES_util-linux-getopt = "${base_bindir}/getopt.${BPN}"
 FILES_util-linux-runuser = "${sbindir}/runuser"
 FILES_util-linux-prlimit = "${bindir}/prlimit"
 FILES_util-linux-ionice = "${bindir}/ionice.${BPN}"
-FILES_util-linux-su = "${bindir}/su.util-linux ${sysconfdir}/pam.d/su-l"
+FILES_util-linux-runuser = "${sysconfdir}/pam.d/runuser*"
+FILES_util-linux-su = "${base_bindir}/su.${BPN} ${sysconfdir}/pam.d/su-l"
 CONFFILES_util-linux-su = "${sysconfdir}/pam.d/su-l"
 
 FILES_util-linux-pylibmount = "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.so \
@@ -122,9 +123,6 @@ FILES_util-linux-blkid = "${base_sbindir}/blkid.${BPN}"
 RCONFLICTS_util-linux-blkid = "e2fsprogs-blkid"
 RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
 
-RDEPENDS_util-linux-runuser += "libpam"
-RDEPENDS_util-linux-su += "libpam"
-
 RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup util-linux-sulogin util-linux-lsblk"
 RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser util-linux-su', '', d)}"
 
@@ -228,6 +226,7 @@ ALTERNATIVE_LINK_NAME[fsfreeze] = "${sbindir}/fsfreeze"
 ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
 
 ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 lastb.1 mesg.1 wall.1 nologin.8 sulogin.8 utmpdump.1 rfkill.8 kill.1 libblkid.3 blkid.8 findfs.8 fsck.8 uuid.3 eject.1 logger.1"
+ALTERNATIVE_${PN}-doc += "${@bb.utils.contains('PACKAGECONFIG', 'pam', 'su.1', '', d)}"
 
 ALTERNATIVE_LINK_NAME[last.1] = "${mandir}/man1/last.1"
 ALTERNATIVE_LINK_NAME[lastb.1] = "${mandir}/man1/lastb.1"
@@ -235,6 +234,7 @@ ALTERNATIVE_LINK_NAME[mesg.1] = "${mandir}/man1/mesg.1"
 ALTERNATIVE_LINK_NAME[mountpoint.1] = "${mandir}/man1/mountpoint.1"
 ALTERNATIVE_LINK_NAME[nologin.8] = "${mandir}/man8/nologin.8"
 ALTERNATIVE_LINK_NAME[rfkill.8] = "${mandir}/man8/rfkill.8"
+ALTERNATIVE_LINK_NAME[su.1] = "${mandir}/man1/su.1"
 ALTERNATIVE_LINK_NAME[sulogin.8] = "${mandir}/man8/sulogin.8"
 ALTERNATIVE_LINK_NAME[utmpdump.1] = "${mandir}/man1/utmpdump.1"
 ALTERNATIVE_LINK_NAME[wall.1] = "${mandir}/man1/wall.1"
@@ -263,6 +263,9 @@ ALTERNATIVE_TARGET[getty] = "${base_sbindir}/agetty"
 ALTERNATIVE_util-linux-mount = "mount"
 ALTERNATIVE_LINK_NAME[mount] = "${base_bindir}/mount"
 
+ALTERNATIVE_${PN}-su = "su"
+ALTERNATIVE_LINK_NAME[su] = "${base_bindir}/su"
+
 ALTERNATIVE_util-linux-umount = "umount"
 ALTERNATIVE_LINK_NAME[umount] = "${base_bindir}/umount"
 
@@ -305,15 +308,6 @@ ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
 
 BBCLASSEXTEND = "native nativesdk"
 
-python do_package_prepend () {
-    if '--enable-su' in d.getVar('EXTRA_OECONF').split():
-        d.appendVar(d.expand('ALTERNATIVE_${PN}'), ' su')
-        d.appendVar(d.expand('ALTERNATIVE_${PN}-doc'), ' su.1')
-
-        d.setVarFlag('ALTERNATIVE_LINK_NAME', "su", d.expand('${base_bindir}/su'))
-        d.setVarFlag('ALTERNATIVE_LINK_NAME', "su.1", d.expand('${mandir}/man1/su.1'))
-}
-
 python populate_packages_prepend() {
     do_split_packages(d, '${base_libdir}', r'^lib(.*)\.so\..*$',
                       output_pattern='util-linux-lib%s',
-- 
2.20.1


