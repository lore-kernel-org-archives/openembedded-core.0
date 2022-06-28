Return-Path: <shruthi.ravichandran@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 876A7C43334
	for <webhook@archiver.kernel.org>; Tue, 28 Jun 2022 20:13:29 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web08.3019.1656447205427455407
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 13:13:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=g0TA7X9z;
 spf=pass (domain: ni.com, ip: 148.163.156.75,
 mailfrom: prvs=417894e707=shruthi.ravichandran@ni.com)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25SFXSf5025285
	for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 15:13:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS11062020;
 bh=woaUBT0rnCG0+q+20C3x5Lsc0lDSWFvZsjzVjq7ow9o=;
 b=g0TA7X9zYoOGIG+qHXw9ddxKysF5HcKkGtKmPYfbMhGsZg1usXYOAQAyLv58HpQFURJd
 Ltz5ZD7j9HmFjjwzJ8HNBqxHCrvnYjhInA2V349BRCRWoRKry71JOTpmQK3l0ARMrJp3
 LQAGsqJaBGDebb5H4A9qc60FrVHS2g3CyazBCmrffU8QKEw1ZMLISObFzE95BXQ3Y68p
 V5thrZPwUZKy0gfnXUTsaVXKn+d7lfALHJnLwh7VhgLQ5cCdxDjsH1JkIsvur3QHOYOo
 IULiFXmaPR9wLzvzvznuDQ8/LRSAjHhD9h20sS/Vo+LmugV5p0jd+ZGUOVFbT0SB/W1o 7g==
Received: from ni.com ([130.164.80.24])
	by mx0a-00010702.pphosted.com (PPS) with ESMTPS id 3gwyvtyfs9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 15:13:24 -0500
Received: from us-aus-exch2.ni.corp.natinst.com
 (us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod3.natinst.com (8.16.1.2/8.16.1.2) with ESMTPS id
 25SKDEMc032437
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 15:13:14 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
 us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 28 Jun 2022 15:13:13 -0500
Received: from ravich.amer.corp.natinst.com (172.18.68.32) by
 us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP Server
 id 15.0.1497.32 via Frontend Transport; Tue, 28 Jun 2022 15:13:13 -0500
From: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
To: <openembedded-core@lists.openembedded.org>
CC: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
Subject: [OE-core][PATCH] package_manager/ipk: do not pipe stderr to stdout
Date: Tue, 28 Jun 2022 13:11:52 -0700
Message-ID: <20220628201152.25066-1-shruthi.ravichandran@ni.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: BQds3vkHxwfZCHWhkGihkMxj6sCZ7_uT
X-Proofpoint-GUID: BQds3vkHxwfZCHWhkGihkMxj6sCZ7_uT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-28_11,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Reason: orgsafe
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jun 2022 20:13:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167354

When parsing the output of a command, do not pipe stderr to stdout.
Opkg sometimes prints harmless error messages even when the opkg
command succeeds. When stderr is piped to stdout, these error
messages may clobber the stdout and cause unexpected results while
parsing the output.

Signed-off-by: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
---
 meta/lib/oe/package_manager/ipk/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
index 4cd3963111..d7f3f31853 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -103,7 +103,7 @@ class OpkgDpkgPM(PackageManager):
         """
 
         try:
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).decode("utf-8")
+            output = subprocess.check_output(cmd, shell=True).decode("utf-8")
         except subprocess.CalledProcessError as e:
             bb.fatal("Unable to list available packages. Command '%s' "
                      "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
-- 
2.20.1


