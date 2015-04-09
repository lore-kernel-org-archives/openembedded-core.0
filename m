Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D6E0F606BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 05:49:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t395nHdn016429
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Apr 2015 22:49:17 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Wed, 8 Apr 2015 22:49:17 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Apr 2015 13:49:28 +0800
Message-ID: <83af41eda698917a427db049762c2220983b0a5f.1428558305.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1428558305.git.Qi.Chen@windriver.com>
References: <cover.1428558305.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/2] util-linux: split out util-linux-sulogin
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
X-List-Received-Date: Thu, 09 Apr 2015 05:49:17 -0000
Content-Type: text/plain

[YOCTO #6698]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 2d17fa2..80065e3 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -32,7 +32,7 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-mkfs util-linux-mcookie util-linux-reset \
              util-linux-mkfs.cramfs util-linux-fsck.cramfs util-linux-fstrim \
              util-linux-partx ${PN}-bash-completion util-linux-hwclock \
-             util-linux-findfs util-linux-getopt"
+             util-linux-findfs util-linux-getopt util-linux-sulogin"
 PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', 'util-linux-pylibmount', '', d)}"
 
 PACKAGES_DYNAMIC = "^util-linux-lib.*"
@@ -96,6 +96,8 @@ FILES_util-linux-mkfs = "${sbindir}/mkfs"
 FILES_util-linux-fsck.cramfs = "${sbindir}/fsck.cramfs"
 FILES_util-linux-mkfs.cramfs = "${sbindir}/mkfs.cramfs"
 
+FILES_util-linux-sulogin = "${base_sbindir}/sulogin*"
+
 # Util-linux' blkid replaces the e2fsprogs one
 FILES_util-linux-blkid = "${base_sbindir}/blkid*"
 RCONFLICTS_util-linux-blkid = "e2fsprogs-blkid"
@@ -104,7 +106,7 @@ RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
 # reset calls 'tput'
 RDEPENDS_util-linux-reset += "ncurses"
 
-RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup"
+RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup util-linux-sulogin"
 RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs "
 
 RRECOMMENDS_${PN}_class-native = ""
@@ -173,7 +175,7 @@ ALTERNATIVE_PRIORITY = "100"
 
 ALTERNATIVE_${PN}  = "dmesg kill more mkswap blockdev pivot_root switch_root"
 ALTERNATIVE_${PN} += "mkfs.minix hexdump last logger mesg renice wall"
-ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject sulogin"
+ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject"
 
 ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
 ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
@@ -184,7 +186,6 @@ ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
 ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
 ALTERNATIVE_LINK_NAME[mkfs.minix] = "${base_sbindir}/mkfs.minix"
 ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
-ALTERNATIVE_LINK_NAME[sulogin] = "${base_sbindir}/sulogin"
 
 ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 lastb.1 mesg.1 wall.1 nologin.8 sulogin.8 utmpdump.1 reset.1"
 
@@ -241,6 +242,9 @@ ALTERNATIVE_TARGET[reset] = "${base_bindir}/reset"
 ALTERNATIVE_util-linux-getopt = "getopt"
 ALTERNATIVE_LINK_NAME[getopt] = "${base_bindir}/getopt"
 
+ALTERNATIVE_util-linux-sulogin = "sulogin"
+ALTERNATIVE_LINK_NAME[sulogin] = "${base_sbindir}/sulogin"
+
 BBCLASSEXTEND = "native nativesdk"
 
 python do_package_prepend () {
-- 
1.9.1


