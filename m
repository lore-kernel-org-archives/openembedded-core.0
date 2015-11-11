Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 2328A75CF1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 08:48:12 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	tAB8m8fb003885; Wed, 11 Nov 2015 02:48:08 -0600
Received: from adi-pc-linux.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015111102480781-1968634 ;
	Wed, 11 Nov 2015 02:48:07 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Nov 2015 10:48:06 +0200
Message-Id: <1447231686-2610-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1447077707-31620-1-git-send-email-adrian.ratiu@ni.com>
References: <1447077707-31620-1-git-send-email-adrian.ratiu@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 11/11/2015 02:48:07 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 11/11/2015 02:48:08 AM,
	Serialize complete at 11/11/2015 02:48:08 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-11-11_07:, , signatures=0
Cc: mike.looijmans@topic.nl, paul.eggleton@linux.intel.com
Subject: [PATCH v3] util-linux: create util-linux-runuser package
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
X-List-Received-Date: Wed, 11 Nov 2015 08:48:14 -0000

Split runuser into its own package (previously provided by util-linux).
Since runuser is compiled only when DISTRO_FEATURES includes pam,
the creation of util-linux-runuser is also constrained by this.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 594108f..f84a415 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -34,6 +34,7 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-partx ${PN}-bash-completion util-linux-hwclock \
              util-linux-findfs util-linux-getopt util-linux-sulogin"
 PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', 'util-linux-pylibmount', '', d)}"
+PACKAGES =+ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser', '', d)}"
 
 PACKAGES_DYNAMIC = "^util-linux-lib.*"
 
@@ -85,6 +86,7 @@ FILES_util-linux-partx = "${sbindir}/partx"
 FILES_util-linux-hwclock = "${base_sbindir}/hwclock.${BPN}"
 FILES_util-linux-findfs = "${sbindir}/findfs"
 FILES_util-linux-getopt = "${base_bindir}/getopt.${BPN}"
+FILES_util-linux-runuser = "${sbindir}/runuser"
 
 FILES_util-linux-pylibmount = "${libdir}/${PYTHON_DIR}/dist-packages/libmount/pylibmount.so \
                                ${libdir}/${PYTHON_DIR}/dist-packages/libmount/__init__.*"
@@ -106,7 +108,11 @@ RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
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


