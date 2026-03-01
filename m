Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71F83FD0064
	for <webhook@archiver.kernel.org>; Sun,  1 Mar 2026 12:26:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.136986.1772367976546302708
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 04:26:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=S372Jupl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75206bce17=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621CKmI93942698;
	Sun, 1 Mar 2026 04:26:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=PjfKnySvtg1cNHTK6TWXcUZw5h8Syj8GvfRtrmAzODA=; b=
	S372JuplZH8e54JwGliXUTJ9i3wGUnvUdg2vT2kXZ3hCtwUBaCfTFrI5XrM9APMM
	eZ8FtQYFCGcYREft20w/e3mQtdI68K8mJwAZ8D7U9/fRp9OG0l4f3VNSSLJwAGvZ
	nUTxhjXW3YQsKXg1YvUO3JxAbCnSB436BY4xNX9PwR/MBSqy/DaHZwv1vOoBERUQ
	1qqZ/VfYM5XtXgnnehEA6kT2OI5R8Ft893vmP8FbsmIpiW8o+LtIp2akMgu5x4n6
	7LRMj34zGdNK4RSfMkh0mkS+0KjifhjVNiwJo5LSoH1x6Xfqif5WIHSy1k8UC0CV
	si84e/WhNSYpeUTFJHOtzQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckvh41456-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 01 Mar 2026 04:26:06 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 1 Mar 2026 04:26:05 -0800
Received: from ala-lpggp3.wrs.com (10.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (10.11.232.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 1 Mar 2026 04:26:05 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>, <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v7 5/7] lib/oe/package.py: Don't redirect stderr
Date: Sun, 1 Mar 2026 04:26:02 -0800
Message-ID: <64734e7740511cf4486113468f01970b0a09b698.1772367692.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <cover.1772367692.git.liezhi.yang@windriver.com>
References: <cover.1772367692.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: WIcy35Jx92Q39g3hyJrsTmMeeqmJmTa2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDExMiBTYWx0ZWRfX8Vu0p9JNvxxE
 abZBnsKLnnoefEC+6agauJ08QMd9wGwdDfarRI3hODpte0DbeEzmOq5Nzdq/M0oxAO17QwCf65x
 AyK45wYTrCoo/6Po3BrE5Hsc4F7CiFtcs9pmgiNH+18cHYiHcg2hlo9YtgDJiVnILInO+xDAUuI
 Ar8nkIqKPC+mgZtCPmTNja/Msv33zEdgxT1WYA0Xg2kqueqBa1DGpN5z0rT9oK4cSIoYQYvT7iC
 Uxa1zKGj8OUjoXnoTS0wXekHZnQkJ3T3ndfXouS9ioOauY/osX+PepIbsnmdJtgIh3Iq59+gFrY
 7/Yo4B6libAtY6Faq0VMc0G1TMU74W+CFglXs+Ln6pwPdCfF5EBll7aS/b1MsYDokU9W9idNOmo
 /vNhEk9sTzdDETs9ZCXXnEBiXOJJN5sb5sBd2UVWThK6CUfbFjmIMENYiOqSsokBD7EKBaqvuUQ
 gTfx+JBw+XCqxvKh5IQ==
X-Proofpoint-GUID: WIcy35Jx92Q39g3hyJrsTmMeeqmJmTa2
X-Authority-Analysis: v=2.4 cv=Z/3h3XRA c=1 sm=1 tr=0 ts=69a4305e cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8 a=G_CNgP1_34ZBAdHNgzoA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010112
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Mar 2026 12:26:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232134

From: Robert Yang <liezhi.yang@windriver.com>

This can make the debug easier.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oe/package.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index d389a9f43b..f97eae104f 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -276,7 +276,7 @@ def filedeprunner(pkg, pkgfiles, rpmdeps, pkgdest):
 
         return provides, requires
 
-    output = subprocess.check_output(shlex.split(rpmdeps) + pkgfiles, stderr=subprocess.STDOUT).decode("utf-8")
+    output = subprocess.check_output(shlex.split(rpmdeps) + pkgfiles).decode("utf-8")
     provides, requires = process_deps(output, pkg, pkgdest, provides, requires)
 
     return (pkg, provides, requires)
-- 
2.49.1


