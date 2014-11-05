Return-Path: <ben.shelton@ni.com>
X-Greylist: delayed 1106 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 05 Nov 2014 21:26:29 UTC
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 585F271F5A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 21:26:29 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	sA5LQT8k013757 for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Nov 2014 15:26:29 -0600
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014110515262892-711011 ;
	Wed, 5 Nov 2014 15:26:28 -0600 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 5 Nov 2014 15:26:15 -0600
Message-Id: <1415222777-6782-1-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.1.3
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 11/05/2014 03:26:28 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 11/05/2014 03:26:29 PM,
	Serialize complete at 11/05/2014 03:26:29 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.28,
	0.0.0000
	definitions=2014-11-05_08:2014-11-05, 2014-11-05,
	1970-01-01 signatures=0
Subject: [PATCH 1/3] util-linux: break out util-linux-getopt
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
X-List-Received-Date: Wed, 05 Nov 2014 21:26:36 -0000

From: Richard Tollerton <rich.tollerton@ni.com>

The getopt binary itself is only a few kb, while the util-linux package
is much larger. The lsb package is very small and depends only on
getopt. Break it out into util-linux-getopt in order to reduce the disk
requirements of lsb on systems that don't otherwise bring in util-linux.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
Acked-by: Ken Sharp <ken.sharp@ni.com>
Acked-by: Ben Shelton <ben.shelton@ni.com
Acked-by: Brad Mouring <brad.mouring@ni.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index ffb84c4..a37efe9 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -37,7 +37,7 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-mkfs util-linux-mcookie util-linux-reset \
              util-linux-mkfs.cramfs util-linux-fsck.cramfs util-linux-fstrim \
              util-linux-partx ${PN}-bash-completion util-linux-hwclock \
-             util-linux-findfs"
+             util-linux-findfs util-linux-getopt"
 
 SHARED_EXTRA_OECONF = "--disable-use-tty-group \
                        --disable-makeinstall-chown \
@@ -81,6 +81,7 @@ FILES_util-linux-reset = "${base_bindir}/reset"
 FILES_util-linux-partx = "${sbindir}/partx"
 FILES_util-linux-hwclock = "${base_sbindir}/hwclock.${BPN}"
 FILES_util-linux-findfs = "${sbindir}/findfs"
+FILES_util-linux-getopt = "${bindir}/getopt.${BPN}"
 
 FILES_util-linux-libblkid = "${base_libdir}/libblkid.so.*"
 FILES_util-linux-libmount = "${base_libdir}/libmount.so.*"
@@ -169,7 +170,7 @@ ALTERNATIVE_PRIORITY = "100"
 
 ALTERNATIVE_${PN}  = "dmesg kill more mkswap blockdev pivot_root"
 ALTERNATIVE_${PN} += "mkfs.minix hexdump last logger mesg renice wall"
-ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject getopt sulogin"
+ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject sulogin"
 
 ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
 ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
@@ -179,9 +180,7 @@ ALTERNATIVE_LINK_NAME[blockdev] = "${base_sbindir}/blockdev"
 ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
 ALTERNATIVE_LINK_NAME[mkfs.minix] = "${base_sbindir}/mkfs.minix"
 ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
-ALTERNATIVE_LINK_NAME[getopt] = "${base_bindir}/getopt"
 ALTERNATIVE_LINK_NAME[sulogin] = "${base_sbindir}/sulogin"
-ALTERNATIVE_TARGET[getopt] = "${bindir}/getopt"
 
 ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 mesg.1 wall.1 sulogin.8 utmpdump.1 reset.1"
 
@@ -233,6 +232,8 @@ ALTERNATIVE_util-linux-reset = "reset"
 ALTERNATIVE_LINK_NAME[reset] = "${bindir}/reset"
 ALTERNATIVE_TARGET[reset] = "${base_bindir}/reset"
 
+ALTERNATIVE_util-linux-getopt = "getopt"
+
 BBCLASSEXTEND = "native nativesdk"
 
 python do_package_prepend () {
-- 
2.1.3


