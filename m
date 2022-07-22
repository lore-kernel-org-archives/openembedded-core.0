Return-Path: <shruthi.ravichandran@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0404C433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 01:01:42 +0000 (UTC)
Received: from mx0a-00010702.pphosted.com (mx0a-00010702.pphosted.com
 [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web11.2891.1658451702219258477
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jul 2022 18:01:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=4w7HkVMZ;
 spf=pass (domain: ni.com, ip: 148.163.156.75,
 mailfrom: prvs=4202f6fbb7=shruthi.ravichandran@ni.com)
Received: from pps.filterd (m0239462.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26LMnv8Z019645
	for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jul 2022 20:01:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS11062020;
 bh=8IdVr8OEZ/WlTlO7ONK5bK0K1xACf99tGjibvEGkpZA=;
 b=4w7HkVMZ8yLU5AxuQNJhwV8EMl3j7uLJbVzBf32zFlPnxiBfN6lV/gKFHtzRC3/qMBSB
 uuxlQ54Zl6Bl1M4LjwVi/NwuSzJivJOdavUfEj8RGKC2dsnj/LXDgw0uYPH3ivgcqXIH
 2c7WwvdGruwP5gmMP3lxlXn+5Swl3b2dZjFGmdo5IpjEK9RzIyE4RJDjP+aViKXzPunn
 MdbdhZWSk6Uj7mFjxVQvx3yL6/HTg+sdyaf3d4T5iSC5QpkPZJ9Xbf3nqfAlPftSlM/X
 ss9r5kDVRAdwD2qT14GeLzPxSLI2ZEkfpEIVHQ3D9DC6AKqafzpJtrxTsojVAKo5u+L5 4g==
Received: from ni.com ([130.164.80.23])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3hbsdf2s39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jul 2022 20:01:41 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com
 (us-aus-exhub1.ni.corp.natinst.com [130.164.68.41])
	by us-aus-skprod2.natinst.com (8.16.1.2/8.16.1.2) with ESMTPS id
 26M11UV2028190
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jul 2022 20:01:30 -0500
Received: from us-aus-exch5.ni.corp.natinst.com (130.164.68.15) by
 us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 21 Jul 2022 20:01:30 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
 us-aus-exch5.ni.corp.natinst.com (130.164.68.15) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 21 Jul 2022 20:01:30 -0500
Received: from ravich.amer.corp.natinst.com (172.18.68.32) by
 us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP Server
 id 15.0.1497.32 via Frontend Transport; Thu, 21 Jul 2022 20:01:30 -0500
From: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
To: <openembedded-core@lists.openembedded.org>
CC: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
Subject: [OE-core][PATCH] initscripts: run umountnfs as a KILL script
Date: Thu, 21 Jul 2022 17:59:54 -0700
Message-ID: <20220722005954.4591-1-shruthi.ravichandran@ni.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: BWPb4IhapKoS4RX8Bg2RRBqirK-6z8aw
X-Proofpoint-ORIG-GUID: BWPb4IhapKoS4RX8Bg2RRBqirK-6z8aw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-21_28,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Reason: orgsafe
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Jul 2022 01:01:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168397

`rc` runs all the KILL scripts in a runlevel before the START scripts.
The umountnfs script is currently configured as a START script, and
runs after the networking KILL script. During shutdown, this causes a
~3 minute timeout after networking is shutdown when the system tries
to connect to and unmount any mounted network shares.
Fix this by changing the script configuration to "stop" so that it can
run before networking is stopped and unmount any network shares
safely.

Signed-off-by: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
---
 meta/recipes-core/initscripts/initscripts_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 2244d1b292..7c9d9ca4f1 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -130,7 +130,7 @@ do_install () {
 	update-rc.d -r ${D} rmnologin.sh start 99 2 3 4 5 .
 	update-rc.d -r ${D} sendsigs start 20 0 6 .
 	update-rc.d -r ${D} urandom start 38 S 0 6 .
-	update-rc.d -r ${D} umountnfs.sh start 31 0 1 6 .
+	update-rc.d -r ${D} umountnfs.sh stop 31 0 1 6 .
 	update-rc.d -r ${D} umountfs start 40 0 6 .
 	update-rc.d -r ${D} reboot start 90 6 .
 	update-rc.d -r ${D} halt start 90 0 .
-- 
2.20.1


