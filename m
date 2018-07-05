Return-Path: <prvs=6724e7e895=adrian.ratiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 32E48789F5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2018 08:55:51 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w658thtf017451 for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Jul 2018 03:55:52 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2k0dpfmvf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2018 03:55:52 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com
	(us-aus-exhub1.ni.corp.natinst.com [130.164.68.41])
	by us-aus-skprod3.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w658tp2x005155
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Jul 2018 03:55:51 -0500
Received: from us-aus-exch3.ni.corp.natinst.com (130.164.68.13) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Thu, 5 Jul 2018 03:55:51 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch3.ni.corp.natinst.com (130.164.68.13) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Thu, 5 Jul 2018 03:55:50 -0500
Received: from ionel-work.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Thu, 5 Jul 2018 03:55:50 -0500
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Jul 2018 11:57:19 +0300
Message-ID: <20180705085719.3184-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-07-05_04:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [PATCH] util-linux.inc: add fallocate & unshare to alternatives
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
X-List-Received-Date: Thu, 05 Jul 2018 08:55:51 -0000
Content-Type: text/plain

These binaries can be provided by busybox triggering a conflict in
do_rootfs so update-alternatives needs to know about them to properly
create the symlinks.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 8d8f3962ff..ed5c618750 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -206,7 +206,7 @@ do_install_append_class-native () {
 ALTERNATIVE_PRIORITY = "80"
 
 ALTERNATIVE_${PN}  = "dmesg kill more mkswap blockdev pivot_root switch_root"
-ALTERNATIVE_${PN} += "hexdump last lastb logger mesg renice wall"
+ALTERNATIVE_${PN} += "hexdump last lastb logger mesg renice wall fallocate unshare"
 ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject nologin taskset"
 
 ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
@@ -217,6 +217,8 @@ ALTERNATIVE_LINK_NAME[blockdev] = "${base_sbindir}/blockdev"
 ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
 ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
 ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
+ALTERNATIVE_LINK_NAME[unshare] = "${bindir}/unshare"
+ALTERNATIVE_LINK_NAME[fallocate] = "${bindir}/fallocate"
 ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
 
 ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 lastb.1 mesg.1 wall.1 nologin.8 sulogin.8 utmpdump.1 rfkill.8 kill.1 libblkid.3 blkid.8 findfs.8 fsck.8 uuid.3 eject.1 logger.1"
-- 
2.18.0


