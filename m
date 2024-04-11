Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF9FCD11C2
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 01:17:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7097.1712798266357901385
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Apr 2024 18:17:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qxN/Te7J;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=48317d0765=joe.slater@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43ANALvC026126
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 18:17:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=dx/4f
	LCF4XfECvdgLi5fISX31P4FsWk6oAc5ME8s+s4=; b=qxN/Te7Jnmq6QGdKXXnj9
	ySueX7znvHGO3C7fMF1cyr2QXB7nzZTDkcj0N5fUsQ5+9pk4h+kMPBlR1GQBHrXY
	67+Ze0F8qzoK3stKf8xREPS8l3Z8l7pXrVMD183i8JYdvL5GDal2jlJ75WO6t0Pc
	2DGZ8/ul9jSrmVzvoobFXbZpsYC8SiNtkVYk65k/9wXy4MACWg/ILYFUsxNIf0FB
	K8SazBnHddf8WyHPYms9cpD8PiLPFwHz7hZluvAPCBQ2T1+NxzmLG4EwODrTnw5d
	3HGnRVzZEjxYAuFoGDcexrF9On2i+kfIohisGEMvHZuPlNGo/1IQWKi3vAFYEiNn
	Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xb1p0dec9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 18:17:45 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 10 Apr 2024 18:17:45 -0700
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Wed, 10 Apr 2024 18:17:45 -0700
From: <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [oe-core][PATCH 1/2] init-ifupdown: modify interfaces for busybox
Date: Wed, 10 Apr 2024 18:17:44 -0700
Message-ID: <20240411011745.574202-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: iyTmLRVJAbMvQdYy20Te5ADCDosiDIOr
X-Proofpoint-GUID: iyTmLRVJAbMvQdYy20Te5ADCDosiDIOr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-10_08,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=744 spamscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404110008
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 01:17:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198113

From: Joe Slater <joe.slater@windriver.com>

Busybox ifupdown does not recognize /xxx names, so we
use eth0 instead of /eth0.  If we want to find "predictable name"
interfaces starting with en..., we will have to use the
real ifupdown.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta/recipes-core/init-ifupdown/init-ifupdown-1.0/interfaces | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/interfaces b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/interfaces
index e617fcf69b..3d0f0c6768 100644
--- a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/interfaces
+++ b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/interfaces
@@ -14,10 +14,11 @@ iface wlan0 inet dhcp
 iface atml0 inet dhcp
 
 # Wired or wireless interfaces including predictable names
-auto /eth0
+auto eth0
 iface eth0 inet dhcp
 iface eth1 inet dhcp
 
+# Busybox ifupdown won't process /en* correctly
 auto /en*=eth
 iface eth inet dhcp
 
-- 
2.25.1


