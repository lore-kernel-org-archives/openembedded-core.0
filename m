Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id AA5C8601F6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 14:49:38 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u2MEndB8029116 for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 09:49:39 -0500
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016032209493984-88662 ;
	Tue, 22 Mar 2016 09:49:39 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2016 16:49:01 +0200
Message-Id: <123f1a18e95c8aea9939e14a537b701de8137737.1458657317.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.4
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 03/22/2016 09:49:40 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 03/22/2016 09:49:40 AM,
	Serialize complete at 03/22/2016 09:49:40 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-03-22_08:, , signatures=0
Subject: [PATCH 1/3] util-linux: split out util-linux-mountpoint
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
X-List-Received-Date: Tue, 22 Mar 2016 14:49:42 -0000

From: Richard Tollerton <rich.tollerton@ni.com>

Allow mountpoint to be installed separately from the rest of util-linux,
to conserve disk space, and to minimize the impact of switching to/from
this version of mountpoint.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 08ca040..c2a91e1 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -31,7 +31,7 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid \
              util-linux-mkfs util-linux-mcookie util-linux-reset \
              util-linux-mkfs.cramfs util-linux-fsck.cramfs util-linux-fstrim \
-             util-linux-partx util-linux-hwclock \
+             util-linux-partx util-linux-hwclock util-linux-mountpoint \
              util-linux-findfs util-linux-getopt util-linux-sulogin"
 PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', 'util-linux-pylibmount', '', d)}"
 PACKAGES =+ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser', '', d)}"
@@ -100,6 +100,7 @@ FILES_util-linux-fsck.cramfs = "${sbindir}/fsck.cramfs"
 FILES_util-linux-mkfs.cramfs = "${sbindir}/mkfs.cramfs"
 
 FILES_util-linux-sulogin = "${base_sbindir}/sulogin*"
+FILES_util-linux-mountpoint = "${base_bindir}/mountpoint.${BPN}"
 
 # Util-linux' blkid replaces the e2fsprogs one
 FILES_util-linux-blkid = "${base_sbindir}/blkid*"
@@ -114,7 +115,7 @@ RDEPENDS_util-linux-runuser += "libpam"
 RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup util-linux-sulogin"
 RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser', '', d)}"
 
-RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs "
+RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs util-linux-mountpoint"
 
 RRECOMMENDS_${PN}_class-native = ""
 RRECOMMENDS_${PN}_class-nativesdk = ""
@@ -146,7 +147,7 @@ do_install () {
 
         sbinprogs="agetty ctrlaltdel cfdisk vipw vigr"
         sbinprogs_a="pivot_root hwclock mkswap mkfs.minix fsck.minix losetup swapon swapoff fdisk fsck blkid blockdev fstrim sulogin switch_root"
-        binprogs_a="dmesg getopt kill more umount mount login reset su"
+        binprogs_a="dmesg getopt kill more umount mount login reset su mountpoint"
 
         if [ "${base_sbindir}" != "${sbindir}" ]; then
         	mkdir -p ${D}${base_sbindir}
@@ -264,6 +265,9 @@ ALTERNATIVE_LINK_NAME[getopt] = "${base_bindir}/getopt"
 ALTERNATIVE_util-linux-sulogin = "sulogin"
 ALTERNATIVE_LINK_NAME[sulogin] = "${base_sbindir}/sulogin"
 
+ALTERNATIVE_util-linux-mountpoint = "mountpoint"
+ALTERNATIVE_LINK_NAME[mountpoint] = "${base_bindir}/mountpoint"
+
 BBCLASSEXTEND = "native nativesdk"
 
 python do_package_prepend () {
-- 
2.7.4


