Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E537E702D9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 03:01:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8931IoV003662
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Sep 2014 20:01:18 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 8 Sep 2014 20:01:18 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Sep 2014 11:01:36 +0800
Message-ID: <b527ba898c66ab8e6666d6e06f812f3bec1a9b49.1410231534.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1410231534.git.Qi.Chen@windriver.com>
References: <cover.1410231534.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] util-linux: split out util-linux-sulogin
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
X-List-Received-Date: Tue, 09 Sep 2014 03:01:23 -0000
Content-Type: text/plain

Split out a new package, util-linux-sulogin.
This package is needed because busybox's sulogin cannot handle shadow
files if FEATURE_SHADOWPASSWORDS is not enabled.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index ffb84c4..1460498 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -37,7 +37,7 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-mkfs util-linux-mcookie util-linux-reset \
              util-linux-mkfs.cramfs util-linux-fsck.cramfs util-linux-fstrim \
              util-linux-partx ${PN}-bash-completion util-linux-hwclock \
-             util-linux-findfs"
+             util-linux-findfs util-linux-sulogin"
 
 SHARED_EXTRA_OECONF = "--disable-use-tty-group \
                        --disable-makeinstall-chown \
@@ -93,6 +93,7 @@ FILES_util-linux-mkfs = "${sbindir}/mkfs"
 FILES_util-linux-fsck.cramfs = "${sbindir}/fsck.cramfs"
 FILES_util-linux-mkfs.cramfs = "${sbindir}/mkfs.cramfs"
 
+FILES_util-linux-sulogin = "${base_sbindir}/sulogin*"
 
 # Util-linux' blkid replaces the e2fsprogs one
 FILES_util-linux-blkid = "${base_sbindir}/blkid*"
@@ -169,7 +170,7 @@ ALTERNATIVE_PRIORITY = "100"
 
 ALTERNATIVE_${PN}  = "dmesg kill more mkswap blockdev pivot_root"
 ALTERNATIVE_${PN} += "mkfs.minix hexdump last logger mesg renice wall"
-ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject getopt sulogin"
+ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject getopt"
 
 ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
 ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
@@ -180,7 +181,6 @@ ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
 ALTERNATIVE_LINK_NAME[mkfs.minix] = "${base_sbindir}/mkfs.minix"
 ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
 ALTERNATIVE_LINK_NAME[getopt] = "${base_bindir}/getopt"
-ALTERNATIVE_LINK_NAME[sulogin] = "${base_sbindir}/sulogin"
 ALTERNATIVE_TARGET[getopt] = "${bindir}/getopt"
 
 ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 mesg.1 wall.1 sulogin.8 utmpdump.1 reset.1"
@@ -233,6 +233,9 @@ ALTERNATIVE_util-linux-reset = "reset"
 ALTERNATIVE_LINK_NAME[reset] = "${bindir}/reset"
 ALTERNATIVE_TARGET[reset] = "${base_bindir}/reset"
 
+ALTERNATIVE_util-linux-sulogin = "sulogin"
+ALTERNATIVE_LINK_NAME[sulogin] = "${base_sbindir}/sulogin"
+
 BBCLASSEXTEND = "native nativesdk"
 
 python do_package_prepend () {
-- 
1.9.1


