Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id E03F3731AD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 10:21:08 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	tBNAL8cb030759; Wed, 23 Dec 2015 04:21:08 -0600
Received: from adi-pc-linux.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015122304210803-1447965 ;
	Wed, 23 Dec 2015 04:21:08 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: ross.burton@intel.com, openembedded-core@lists.openembedded.org
Date: Wed, 23 Dec 2015 12:21:06 +0200
Message-Id: <1450866066-22217-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1450172969-11076-1-git-send-email-adrian.ratiu@ni.com>
References: <1450172969-11076-1-git-send-email-adrian.ratiu@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 12/23/2015 04:21:08 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 12/23/2015 04:21:08 AM,
	Serialize complete at 12/23/2015 04:21:08 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-12-23_08:, , signatures=0
Subject: [PATCH v4] util-linux: create util-linux-runuser package
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
X-List-Received-Date: Wed, 23 Dec 2015 10:21:09 -0000

Split runuser into its own package (previously provided by util-linux).
runuser is compiled only when DISTRO_FEATURES includes pam and also the
package is created only when runuser exists.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index cf321c6..551ffbb 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -29,7 +29,7 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-swaponoff util-linux-losetup util-linux-umount \
              util-linux-mount util-linux-readprofile util-linux-uuidd \
              util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid \
-             util-linux-mkfs util-linux-mcookie util-linux-reset \
+             util-linux-mkfs util-linux-mcookie util-linux-reset util-linux-runuser \
              util-linux-mkfs.cramfs util-linux-fsck.cramfs util-linux-fstrim \
              util-linux-partx ${PN}-bash-completion util-linux-hwclock \
              util-linux-findfs util-linux-getopt util-linux-sulogin"
@@ -84,6 +84,7 @@ FILES_util-linux-partx = "${sbindir}/partx"
 FILES_util-linux-hwclock = "${base_sbindir}/hwclock.${BPN}"
 FILES_util-linux-findfs = "${sbindir}/findfs"
 FILES_util-linux-getopt = "${base_bindir}/getopt.${BPN}"
+FILES_util-linux-runuser = "${sbindir}/runuser"
 
 FILES_util-linux-pylibmount = "${libdir}/${PYTHON_DIR}/dist-packages/libmount/pylibmount.so \
                                ${libdir}/${PYTHON_DIR}/dist-packages/libmount/__init__.*"
@@ -105,7 +106,11 @@ RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
 # reset calls 'tput'
 RDEPENDS_util-linux-reset += "ncurses"
 
+RDEPENDS_util-linux-runuser += "libpam"
+
 RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup util-linux-sulogin"
+RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser', '', d)}"
+
 RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs "
 
 RRECOMMENDS_${PN}_class-native = ""
-- 
2.1.4


