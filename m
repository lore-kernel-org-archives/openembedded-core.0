Return-Path: <erick.shepherd@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB9BC3ABC9
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 17:38:44 +0000 (UTC)
Received: from mx0a-00300601.pphosted.com (mx0a-00300601.pphosted.com [148.163.146.64])
 by mx.groups.io with SMTP id smtpd.web11.4544.1746812316095597992
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 10:38:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=PPS11142024 header.b=DC0kh3xj;
 spf=pass (domain: ni.com, ip: 148.163.146.64, mailfrom: prvs=4224e4afdf=erick.shepherd@ni.com)
Received: from pps.filterd (m0142705.ppops.net [127.0.0.1])
	by mx0b-00300601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549GDOa5004237
	for <openembedded-core@lists.openembedded.org>; Fri, 9 May 2025 17:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS11142024; bh=dZtZJzZu6ZEjWsGlvzgs
	YsIbo7xYf8qBcfE04WGtTKY=; b=DC0kh3xjZ6UYHtTu8/q0bvXUKDUXhp4V7LQz
	MfrL1fvBZu5Hi6wWozzqDuAMR6sXcQHpnTQ/jZ2Wm41PFhZGrM2lw3w3ukb0heEP
	Ofvi5c0H0HgOk7Fgan3HRd8Q7ObT/PuUV1j4o1gSVI0uoOAiI6gPyBnnsS1KNISN
	9/Ev7v3VhWcY4Kx36jAeiyOghPYN0yHmaKTgn+uH3yW0MgrvAw5k4SF8fOZHT/Lr
	wjnpva4ONZZmL1cdcEHa95y4ZDTkpsDhMQFjW7z4xm7cqSIryTlDhRrsa6j3/dd9
	hCtKzHJ6Yb0oS7GVAzYfJeA7xhlQOEH9F51lp5pRU2WRV4tiGA==
Received: from us-aus-excas-p2.ni.corp.natinst.com ([130.164.94.74])
	by mx0b-00300601.pphosted.com (PPS) with ESMTPS id 46hn1c93ag-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 17:38:35 +0000 (GMT)
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 9 May 2025 12:38:23 -0500
Received: from ershephe-ubuntu.ni.corp.natinst.com (172.18.68.33) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Fri, 9 May 2025 12:38:23 -0500
From: Erick Shepherd <erick.shepherd@ni.com>
To: <openembedded-core@lists.openembedded.org>
CC: Erick Shepherd <erick.shepherd@ni.com>
Subject: [PATCH RFC] kernel-devsrc.bb: Stop copying the System.map files
Date: Fri, 9 May 2025 12:38:16 -0500
Message-ID: <20250509173816.1250479-1-erick.shepherd@ni.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=efA9f6EH c=1 sm=1 tr=0 ts=681e3d9b cx=c_pps a=VUOoxcgKHUMpfFMIT0tLvw==:117 a=VUOoxcgKHUMpfFMIT0tLvw==:17 a=dt9VzEwgFbYA:10 a=gVGD3344AAAA:8 a=697aNiapx2Y-GGsev04A:9 a=xQEvYfgLW3QvObN0DhJi:22
X-Proofpoint-ORIG-GUID: _7dVKQzbL-rDWTVk1D6ak4CNPob0NSuQ
X-Proofpoint-GUID: _7dVKQzbL-rDWTVk1D6ak4CNPob0NSuQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDE3NSBTYWx0ZWRfX+N20/DIEGdz7 1PcG9cBzvR5lMzX7SgsdA2FE2u81x1XZzneb4aNl2LyFMXQa7qU8p9N7/yzvV67dX9npsjS7vjF 9z4TfPcC3WSe2e0lziNg65sVunFAfXADE/2mmpcx77mr6pzopoYZ6c8t0EKR4JayY/rMmK4dzvl
 ZmwbEDrZzc3wqoSGD8T7zPtviCncup4UupEBCMBpRs51voYZOQhkLv8RmPUjJHa0B0JsoIRjd4D h7WKsAn+o0xRBLpSU3wu1OnZ9dkHifbtFQfIM7Gc3BQnUFbM8A6tTVGGzkge5XHabWhPqtwMN7v IyK5HtM+5n5rv0BRk+zSYWBzB6yGr9CZ29TSkr2wP6ngO0RU5zXMelsQAHm/jxwooMTpZk4tRic
 eSb0f41DQBZQqrlNT09CZ00B/XYGh8XSTYnluqOo375azWCUT87/SGs6lKFLRZxW3dPjCP3o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 mlxlogscore=571 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090175
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 17:38:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216244

Currently there are two .map files being copied to $kerneldir/build.
One file is System.map and the other is System.map-<kernel-version>.
Each .map file takes up about 5MB and does not seem to be required for
the compilation of driver software via dkms. This change stops copying
both .map files to save disk space.

Another solution could also be to only copy one .map file to
$kerneldir/build or have one of the .map files by a symlink. If both
.map files are required then this patch can be abandoned.

Signed-off-by: Erick Shepherd <erick.shepherd@ni.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 1500aff2e2..298be27ac7 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -75,7 +75,7 @@ do_install() {
         if [ -s Module.symvers ]; then
             cp Module.symvers $kerneldir/build
         fi
-        cp System.map* $kerneldir/build
+
         if [ -s Module.markers ]; then
             cp Module.markers $kerneldir/build
         fi
-- 
2.43.0


