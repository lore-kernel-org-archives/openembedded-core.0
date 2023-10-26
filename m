Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D229EC25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 07:04:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.64903.1698303884381190891
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Oct 2023 00:04:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=i5Re1O5e;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8663421558=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39Q68PYr000909
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 07:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=g5r3j
	WTNeG7AnCnYWzwhWgIm4abB9Jxsxi2dBrX/1/0=; b=i5Re1O5eCRBdCa/wqURCp
	99WYqLNk38Bd6TbuWL7Ei/liAvC0glLTJsW0RV66lYZZo3+ZhiOZN3kyE1RriAio
	d5Was/L3/E+LWgVuBrGJWgdNYBt7J30ooHChZbXXLeq9ucfweXkSiskwBvPsEP/8
	8wWqYykuRPE7oIP7k1+EsQAkHtxyk8QTgSLpw9sccvOaO2c2Y4BZ3Kw+nYZW0mYN
	wuivsdqrsMyVtOKMUyYY0N69iGvNvZan0qpfUJczBbnnXPqrVanA8u/kpbEk0u3G
	0tPEOWhp8B5/KZQtz7zo9lut3o2Q8GugL5qsBWWmPjrap1i7Pm8SqpNGmSYq04Ih
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tv3ux5fkb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 07:04:43 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 26 Oct 2023 00:04:43 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.34 via Frontend Transport; Thu, 26 Oct 2023 00:04:42 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] openssh: Don't hardcode the dir in sshd.service
Date: Thu, 26 Oct 2023 15:04:40 +0800
Message-ID: <20231026070440.737673-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Qa7pD_HcQWgA9a9raswlsDQ9P97YQYsn
X-Proofpoint-GUID: Qa7pD_HcQWgA9a9raswlsDQ9P97YQYsn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-26_04,2023-10-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=535
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 clxscore=1015 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310170000 definitions=main-2310260058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 07:04:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189699

From: Mingli Yu <mingli.yu@windriver.com>

Don't hardcode the directory of the binary in sshd.service.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-connectivity/openssh/openssh/sshd.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/sshd.service b/meta/recipes-connectivity/openssh/openssh/sshd.service
index 6ace67d8ae..2a997b656a 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshd.service
+++ b/meta/recipes-connectivity/openssh/openssh/sshd.service
@@ -6,7 +6,7 @@ After=sshdgenkeys.service
 [Service]
 Environment="SSHD_OPTS="
 EnvironmentFile=-/etc/default/ssh
-ExecStartPre=/usr/bin/mkdir -p /var/run/sshd
+ExecStartPre=@BASE_BINDIR@/mkdir -p /var/run/sshd
 ExecStart=-@SBINDIR@/sshd -D $SSHD_OPTS
 ExecReload=@BASE_BINDIR@/kill -HUP $MAINPID
 KillMode=process
-- 
2.25.1


