Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF9E4EB64D7
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 09:14:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8072.1688116495757055957
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jun 2023 02:14:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=hwmDpugs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=65456dd8b3=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35U7UhJe032529
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:14:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=U5sL5Nwbi9+VuMBc5bACTR+UAz5qgJ8uWqEwxGXLhHg=; b=
	hwmDpugsYgsc4H3GHNnxxE8/GTl9jFohaelKQti0TWf+ZsvRpTU+uehphy3QWhen
	uFcL9gqhdwfbXrvmsKuxspcFHOcXDXkUtll3eNUOSBduDEo5/lqQ1eJbFgEH50JY
	iewDdD0Qk+wO8Uf11TGrehENBTHbfFP8QFxKUCVshQeQlNxULOX4K3FF17r1fc6i
	34WAdTwB73lfn+tBsPswnz5xlyZD1z6cRcNhkwErF8VnteXAKoYGWtoRNcS+73jH
	6l4JAow4zOYsA0enBnDcq7JtnUDneCcwQ7HhXv3D1UDZygm8VxCEJj6Yn5ozjAI+
	pVRVtwUebPuFe7K/PmWQGQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdurxwm4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:14:55 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 30 Jun 2023 02:14:54 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Fri, 30 Jun 2023 02:14:53 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [master][PATCH 2/2] rootfs-postcommands.bbclass: add post func remove_unused_dnf_log_lock
Date: Fri, 30 Jun 2023 17:14:51 +0800
Message-ID: <20230630091451.3331563-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230630091451.3331563-1-changqing.li@windriver.com>
References: <20230630091451.3331563-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: fiekoxmH0L3gsBJiycPv5_i6b6p8vQYG
X-Proofpoint-GUID: fiekoxmH0L3gsBJiycPv5_i6b6p8vQYG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-30_05,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 mlxlogscore=899 lowpriorityscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306300077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 09:14:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183688

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
index 4492c9c0aa..53b241413e 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -49,6 +49,8 @@ ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile;'
 
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "overlayfs", "overlayfs_qa_check; overlayfs_postprocess;", "", d)}'
 
+ROOTFS_POSTPROCESS_COMMAND += 'remove_unused_dnf_log_lock;'
+
 inherit image-artifact-names
 
 # Sort the user and group entries in /etc by ID in order to make the content
@@ -361,6 +363,11 @@ empty_var_volatile () {
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
2.25.1


