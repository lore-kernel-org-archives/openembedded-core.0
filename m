Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E45C7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 12:43:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6267.1750250610084912675
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 05:43:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8264ad95c1=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IB1VSH017076;
	Wed, 18 Jun 2025 12:43:28 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4790284gke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 18 Jun 2025 12:43:28 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 18 Jun 2025 05:43:27 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 18 Jun 2025 05:43:24 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Niko Mauno <niko.mauno@vaisala.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>,
        Praveen Kumar
	<praveen.kumar@windriver.com>
Subject: [oe-core][walnascar][PATCH 4/7] glib: Support using alternative runtime D-Bus
Date: Wed, 18 Jun 2025 18:12:53 +0530
Message-ID: <20250618124256.3261625-4-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250618124256.3261625-1-praveen.kumar@windriver.com>
References: <20250618124256.3261625-1-praveen.kumar@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDEwNyBTYWx0ZWRfX+VKLWYxTQOWa Udil4srXPnqUYeLaJ1+yzwpanb55UqkiS8pffsP8R+Varxi3bBhQccwSr/Cyn2c2jQxL+XJaEVI 4aAKfUmFKC+iWlcHIAzigXEjoDijnppSczkbawjruuJYtVrweSrYLi/NVMFtvJyGbneEa54/Y2h
 uDBxXc5HPdXBwKg0k44V4QSXSjsP/OfvzaL8D/Q0ZBK9jo6K1wMs32ZhbItlUyy0O+XneYj6em9 gQ7mTpBwJ4al7GA8gcXZMMc/s9ZaD5RH80SV3YXjbSINEZyRWolVFZUG23fFM2/aVsSoVJAtXe1 NxvRgSGUB6CIkeshCAabi3tWtSq7rWlv63QMS8X4Wgwq2+rfjUfA72dVZHEFWBmXUKfXDxP9EHd
 JtwaKA+MZkLr2VtHdZIUz4qwicZh8GVOXnIbbkTB3G7ZCBIh5Eix8I6qt+5hXS10wdMkzj4l
X-Proofpoint-GUID: 9VIUKYdzA8aSwx_m98Tjo3qttkm1nn7c
X-Authority-Analysis: v=2.4 cv=ar2yCTZV c=1 sm=1 tr=0 ts=6852b470 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=eWRtdWc1AAAA:8 a=e5mUnYsNAAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=VC12D2wAoTkOnlANP6EA:9
 a=fQEa9puXOWAy-YWvlEz7:22 a=Vxmtnl_E_bksehYqCbjh:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 9VIUKYdzA8aSwx_m98Tjo3qttkm1nn7c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=939 impostorscore=0 clxscore=1011 bulkscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506180107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 12:43:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219003

From: Niko Mauno <niko.mauno@vaisala.com>

In order to facilitate oe-core users who wish to use e.g. dbus-broker
as their runtime D-Bus implementation, change the Freedesktop.org
specific D-Bus runtime dependency to honor the new VIRTUAL-RUNTIME_dbus
variable.

(From OE-Core rev: c0c874c577910833a7dd90122b22c20fe33bf681)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 61e1a3ef17..2cc48f0a06 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -160,7 +160,7 @@ RDEPENDS:${PN}-codegen += "${CODEGEN_PYTHON_RDEPENDS}"
 RDEPENDS:${PN}-ptest += "\
             coreutils \
             libgcc \
-            dbus \
+            ${VIRTUAL-RUNTIME_dbus} \
             desktop-file-utils \
             gnome-desktop-testing \
             tzdata \
-- 
2.40.0


