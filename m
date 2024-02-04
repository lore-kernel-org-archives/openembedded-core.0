Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C2C7C4828F
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 08:01:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.34620.1707033669888166900
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Feb 2024 00:01:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MZU5Ltrw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2764459116=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4147d35S021157
	for <openembedded-core@lists.openembedded.org>; Sun, 4 Feb 2024 08:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=x7Kax
	nH5U6DKjvgb2qZ4yKjlB7f6un0KPMiAlDMNhyE=; b=MZU5Ltrws93GAy20rJNQ/
	jt9tFwy61DwpM9y33eGIMYJ04/neV/vlhC/G1BBRQj+Xgmb1lernifRZSL6tJyda
	bw3MJQW41ektwIGcuPnHOWVgnQQ0Z1SFWjJELcQOq0H1QpEKd1IqPm71L2O5rMKk
	a/r0WKLGudRHN9K1ya7JPGp5BeXoDn9LC0m76g7GDnd8TjmTNv3Y3wJ3hAYFea/F
	hSulGwtbDV9LckkCFQNrm22+0gE6lB3mQJ5/MZDsLzRMWibBwq4274WSV59XCTUO
	M9GFLs2yoO+rVnv1f/vS3+ZFbShJotaSiSHSjCtfNRlbWUdt8HSw9+FjNrXsfa/G
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1cq0gv68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 08:01:08 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 4 Feb 2024 00:01:03 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Sun, 4 Feb 2024 00:01:03 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V2] systemd: fix a dead link under /var/log
Date: Sun, 4 Feb 2024 16:01:05 +0800
Message-ID: <20240204080105.3614423-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 9eNVK0zNgKLbF2NBWH4n9m8YkPYmcXY1
X-Proofpoint-GUID: 9eNVK0zNgKLbF2NBWH4n9m8YkPYmcXY1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-04_05,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxlogscore=968 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401310000
 definitions=main-2402040060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 08:01:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194878

From: Changqing Li <changqing.li@windriver.com>

Commit 6fe23ff31c0 changed README to a symlink to README.logs, and
install README.logs under systemd doc dir.

But for OE, systemd doc dir is splited into package systemd-doc, when it
is not installed on the target, there will be an dead link:
Eg:
root@intel-x86-64:/var/log# ls -l README
lrwxrwxrwx 1 root root 39 Jun 20 08:57 README -> ../../usr/share/doc/systemd/README.logs
root@intel-x86-64:/var/log# ls -l ../../usr/share/doc/systemd/README.logs
ls: cannot access '../../usr/share/doc/systemd/README.logs': No such file or directory

Meantime, relative path for a symlink also will meet issue like
"No such file or directory"

Since OE have set ForwardToSyslog=yes, this README is not needed.
So remove this symlink from package systemd

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-core/systemd/systemd_255.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_255.1.bb b/meta/recipes-core/systemd/systemd_255.1.bb
index 9e09c89355..3669d3cdc8 100644
--- a/meta/recipes-core/systemd/systemd_255.1.bb
+++ b/meta/recipes-core/systemd/systemd_255.1.bb
@@ -386,6 +386,10 @@ do_install() {
         sed -i -e 's/#RebootWatchdogSec=10min/RebootWatchdogSec=${WATCHDOG_TIMEOUT}/' \
             ${D}/${sysconfdir}/systemd/system.conf
     fi
+
+    if [ -f "${D}${prefix}/lib/tmpfiles.d/legacy.conf" ]; then
+        sed -i -e '/^L \/var\/log\/README/d' ${D}${prefix}/lib/tmpfiles.d/legacy.conf
+    fi
 }
 
 python populate_packages:prepend (){
-- 
2.25.1


