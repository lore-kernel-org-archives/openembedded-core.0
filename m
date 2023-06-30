Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE462EB64DD
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 08:32:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7718.1688113948975311255
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jun 2023 01:32:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=B8184qbm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=65456dd8b3=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35U5e2vr009511
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 08:32:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=mUPw64sUw9rjmavJRL+XDCja2Nu7z5gUP+e1viqJBqQ=; b=
	B8184qbm3kZ2g2xHWZt1p7RWS6DEDYPgWf8SZqm7SIMotuBDx0VZy5fABUJ9k0af
	/2vgaHGWl5wAM59Nfv5xyRJCWKOV5jqhdP6CeGOmcTn07dGBqw5UVQjPqa68iGBD
	asn56Hhdp3HwxsNfqRaFnAqfffzDcW2twxpFVnIMukxseKFfxGN56u6TpiVfSswI
	0Kwoz6fYdO0JyPTcHNgOuxY9hZzoEoRCcyZ9wiSIepspxqgiNHrhNi5XCeW670Xc
	11GxvPS8f7ByzxojWtTUilfFxppx27+96GoIq97sLb/vL1p/A+wvGYh7gtN5WWpR
	lmnAtY2e6U/e/gzmDvFIxg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdpqb5p22-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 08:32:28 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 30 Jun 2023 01:32:23 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Fri, 30 Jun 2023 01:32:22 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [mickledore][PATCH 2/2] rootfs-postcommands.bbclass: add post func remove_unused_dnf_log_lock
Date: Fri, 30 Jun 2023 16:32:21 +0800
Message-ID: <20230630083221.3927027-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230630083221.3927027-1-changqing.li@windriver.com>
References: <20230630083221.3927027-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: cPUiDnR9j3fgjDNOIsOiHD3Q8dKk6y_v
X-Proofpoint-GUID: cPUiDnR9j3fgjDNOIsOiHD3Q8dKk6y_v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-30_04,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 mlxlogscore=829 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306300071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 08:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183686

From: Changqing Li <changqing.li@windriver.com>

Remove log_lock.pid which maybe created during do_rootfs. In commit
[dnf: only write the log lock to root for native dnf],
native dnf changed to write log lock to root, and target dnf still
use /var/log, so log_lock.pid need to be removed post do_rootfs.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/classes-recipe/rootfs-postcommands.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index 690fa976aa..7538c8b0b5 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -49,6 +49,8 @@ ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile;'
 
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "overlayfs", "overlayfs_qa_check; overlayfs_postprocess;", "", d)}'
 
+ROOTFS_POSTPROCESS_COMMAND += 'remove_unused_dnf_log_lock;'
+
 inherit image-artifact-names
 
 # Sort the user and group entries in /etc by ID in order to make the content
@@ -276,6 +278,11 @@ empty_var_volatile () {
 	fi
 }
 
+remove_unused_dnf_log_lock() {
+	if [ -e ${IMAGE_ROOTFS}/log_lock.pid ]; then
+		rm -rf ${IMAGE_ROOTFS}/log_lock.pid
+	fi
+}
 # Turn any symbolic /sbin/init link into a file
 remove_init_link () {
 	if [ -h ${IMAGE_ROOTFS}/sbin/init ]; then
-- 
2.35.5


