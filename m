Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCDECEB64D7
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 08:32:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7682.1688113948688194697
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jun 2023 01:32:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ClqC3GiQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=65456dd8b3=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35U5e2vq009511
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 08:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=TW+Gg
	z9GAiIxyWIYIKvYyYSaWKrVPD2XtPPpubUopg0=; b=ClqC3GiQn/1Z9OkkvJy/G
	bddKedi572VcZWlRkKKNYCv7PYdYQUWg6jUHMLuoJZs2+1cIVrMrHhjw0tUqvX9P
	zHYr6bB5YGBLO/4df3fimfRECV4O2aRe4jjexuLbKlA0G1Ws75y/WGlqhaF6iJCF
	UfMOlrXz9TUxjOBbmdSdZ92kwg5JozDuS3irLIlj7h1bRMNUIWI2vgH0KWtTTEcA
	r/dkAB3B1co18Sa0kxrHQ0ycA6lf7EXwOAfppDg5jT7oH56DFEJiq+BJCR75WQZR
	2U6T219FSLnpuFGEmFXsgH1VBhaja+qX5+fjS7/McY9T4wg5aGOCrzSnMTOF7sVT
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdpqb5p22-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 08:32:27 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 30 Jun 2023 01:32:22 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Fri, 30 Jun 2023 01:32:21 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [mickledore][PATCH 1/2] dnf: only write the log lock to root for native dnf
Date: Fri, 30 Jun 2023 16:32:20 +0800
Message-ID: <20230630083221.3927027-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: WiS3ijBvugUlu6_B-j1b11UW5LJPTkbk
X-Proofpoint-GUID: WiS3ijBvugUlu6_B-j1b11UW5LJPTkbk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-30_04,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306300071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 08:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183685

From: Changqing Li <changqing.li@windriver.com>

From commit 742a1b7124, log_lock.pid is writen to root, but following
file is not changed, which will make it never deleted, and an unexpected
file exist in root dir after boot target.

$ tail  -n 1 etc/tmpfiles.d/dnf.conf
r /var/log/log_lock.pid

Besides, root dir may be read-only, so it is better still
keep the log_lock.pid under /var/log, only write the log lock to root
for native dnf for fixing issue mentioned in 742a1b7124

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/dnf/dnf_4.14.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dnf/dnf_4.14.0.bb b/meta/recipes-devtools/dnf/dnf_4.14.0.bb
index 62df8c4ace..95007c9c4b 100644
--- a/meta/recipes-devtools/dnf/dnf_4.14.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.14.0.bb
@@ -15,9 +15,10 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
            file://0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            file://0030-Run-python-scripts-using-env.patch \
            file://0001-set-python-path-for-completion_helper.patch \
-           file://0001-dnf-write-the-log-lock-to-root.patch \
            "
 
+SRC_URI:append:class-native = "file://0001-dnf-write-the-log-lock-to-root.patch"
+
 SRCREV = "e50875b3f5790f70720bdb670e1dd2bf4d828744"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.35.5


