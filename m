Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 569DE7265B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Dec 2014 01:49:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBP1n49r001775
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 24 Dec 2014 17:49:04 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 24 Dec 2014 17:49:04 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Thu, 25 Dec 2014 09:48:55 +0800
Message-ID: <cover.1419471695.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/4] insane.bbclass: add QA check: package-missing
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
X-List-Received-Date: Thu, 25 Dec 2014 01:49:09 -0000
Content-Type: text/plain

Changed in V2:
Follow Richard Purdie suggestions, use packageinfo which saved in
$PKGDATA_DIR to collect all available packages RDEPENDS and RPROVIDES
rather than bb.persist_data.

V1:
We also tried to fix perl, linux-libc-headers and busybox according to
the result of QA checking.

Here is a test to explain what the QA check showing, we could figure out 
package missing issue at package generation time rather than do_rootfs
time.

Test Steps:

1. Edit xz and gzip recipe, to simulate a package missing situation (the manually added
rdepends is not real but):
..............
diff --git a/meta/recipes-extended/gzip/gzip.inc b/meta/recipes-extended/gzip/gzip.inc
index 671b1eb..7e643e5 100644
--- a/meta/recipes-extended/gzip/gzip.inc
+++ b/meta/recipes-extended/gzip/gzip.inc
@@ -32,3 +32,8 @@ ALTERNATIVE_LINK_NAME[gzip] = "${base_bindir}/gzip"
 ALTERNATIVE_LINK_NAME[zcat] = "${base_bindir}/zcat"
 
 export CONFIG_SHELL="/bin/sh"
+
+PACKAGES =+ "${PN}-missing1 ${PN}-missing2"
+FILES_${PN}-missing1 = ""
+FILES_${PN}-missing2 = ""
+RPROVIDES_${PN}-missing1 = "${PN}-missing"
diff --git a/meta/recipes-extended/xz/xz_5.1.3alpha.bb b/meta/recipes-extended/xz/xz_5.1.3alpha.bb
index 168e383..c5d8b57 100644
--- a/meta/recipes-extended/xz/xz_5.1.3alpha.bb
+++ b/meta/recipes-extended/xz/xz_5.1.3alpha.bb
@@ -37,6 +37,9 @@ FILES_liblzma-dev = "${includedir}/lzma* ${libdir}/liblzma*${SOLIBSDEV} ${libdir
 FILES_liblzma-staticdev = "${libdir}/liblzma.a"
 FILES_liblzma-dbg = "${libdir}/.debug/liblzma*"
 
+
+RDEPENDS_${PN}_class-target += "gzip-missing gzip-missing2"
+
 BBCLASSEXTEND = "native nativesdk"
 
 export CONFIG_SHELL="/bin/sh"
..............

2. Vim local.conf
...
IMAGE_INSTALL_append = " xz"
WARN_QA_append = " package-missing"
...

3. bitbake core-image-minimal
..............
|WARNING: QA Issue: package gzip-missing1 not generated, but listed in PACKAGES
|Compute rdepends chains, '-->' means 'runtime depends'
|("gzip-missing1" rprovides "gzip-missing")
|"xz" -> "gzip-missing"
| [package-missing]
|WARNING: QA Issue: package gzip-missing2 not generated, but listed in PACKAGES
|Compute rdepends chains, '-->' means 'runtime depends'
|"xz" -> "gzip-missing2"
| [package-missing]
|ERROR: Unable to install packages. Command '/home/jiahongxu/yocto/build-2014120
2-mips/tmp/sysroots/x86_64-linux/usr/bin/smart --quiet --data-dir=/home/jiahongx
u/yocto/build-20141202-mips/tmp/work/qemumips-poky-linux/core-image-minimal/1.0
-r0/rootfs/var/lib/smart install -y xz@mips32r2 run-postinsts@all packagegroup-
core-boot@qemumips' returned 1:
error: Can't install xz-5.1.3alpha-r0@mips32r2: no package provides gzip-missing


|ERROR: Function failed: do_rootfs
|ERROR: Logfile of failure stored in: /home/jiahongxu/yocto/build-20141202-mips/
tmp/work/qemumips-poky-linux/core-image-minimal/1.0-r0/temp/log.do_rootfs.24338
|ERROR: Task 7 (/home/jiahongxu/yocto/poky/meta/recipes-core/images/core-image-
minimal.bb, do_rootfs) failed with exit code '1'
..............

//Hongxu

The following changes since commit 15de188692d2572d897799424e2a22eab24c78e2:

  kernel-devsrc: Ensure we have a dependency on the actual source (2014-12-21 13:52:17 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/package-missing
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/package-missing

Hongxu Jia (4):
  insane.bbclass: add QA check: package-missing
  perl_5.20.0: fix QA package-missing warnings
  linux-libc-headers.inc: fix QA package-missing warnings
  busybox.inc: fix QA package-missing warnings

 meta/classes/insane.bbclass                        | 100 ++++++++++++++++++++-
 meta/recipes-core/busybox/busybox.inc              |  10 +++
 meta/recipes-devtools/perl/perl_5.20.0.bb          |  10 ++-
 .../linux-libc-headers/linux-libc-headers.inc      |   2 +
 4 files changed, 117 insertions(+), 5 deletions(-)

-- 
1.9.1


