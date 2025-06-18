Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D060C7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 12:43:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6233.1750250603085539039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 05:43:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8264ad95c1=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I3e2Hd011628;
	Wed, 18 Jun 2025 05:43:22 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4798kkm96y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 18 Jun 2025 05:43:22 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 18 Jun 2025 05:43:21 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 18 Jun 2025 05:43:19 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Niko Mauno <niko.mauno@vaisala.com>,
        Praveen Kumar
	<praveen.kumar@windriver.com>
Subject: [oe-core][walnascar][PATCH 3/7] systemd: Support using alternative runtime D-Bus
Date: Wed, 18 Jun 2025 18:12:52 +0530
Message-ID: <20250618124256.3261625-3-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250618124256.3261625-1-praveen.kumar@windriver.com>
References: <20250618124256.3261625-1-praveen.kumar@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: AtCz-SQkJsKv46BYok8deg360b4wtGoq
X-Proofpoint-ORIG-GUID: AtCz-SQkJsKv46BYok8deg360b4wtGoq
X-Authority-Analysis: v=2.4 cv=MaFsu4/f c=1 sm=1 tr=0 ts=6852b46a cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=eWRtdWc1AAAA:8 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=VC12D2wAoTkOnlANP6EA:9 a=fQEa9puXOWAy-YWvlEz7:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDEwNyBTYWx0ZWRfX9JWxY3dtuuk2 dSxc4wCWnxrabcA/FvodAEe4OKpVYP7IFdz8XdFWceMCrrEMCNxG0QbJ3mT7NoOrHjr1SavWjeL gOc7jgryIBSYF+cnEUFjkx48CVO7Bkw8isw4l1Xzzzu4L5dvr+nWxyVXapcI+w88Qv1AwIP3+gG
 4YOdWkoEys5YF5DIc6rMifS+MfG1ixA9VMA2c9dwuhTkqZHKTBMZ8mCXmmu3HefsU+i6BfpnCZW 2eaFZ8c29jeCaYi4ajjCFaEt8uzzcV+otJfEsrarUt+QRZ/myGlO0tDEw7mvuG2uKk7iBrFK9Kl ymqsnaq1wDp4rQ78K6rBhLKF+aknhAOQTs4EEOIcPUSGidwIpvNOesdnq52NV08U2qzJQZfgV2h
 V/wqSj9+tqXXVU3kUx0xp4SX/GQ0j/voy3W909zSMeIc+iHlnr8Kcgusnp3WvGrCkIvqggip
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=687 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506180107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 12:43:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219002

From: Niko Mauno <niko.mauno@vaisala.com>

In order to facilitate oe-core users who wish to use e.g. dbus-broker
as their runtime D-Bus implementation, change the Freedesktop.org
specific D-Bus runtime dependency to honor the new VIRTUAL-RUNTIME_dbus
variable.

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 meta/recipes-core/systemd/systemd_257.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_257.4.bb b/meta/recipes-core/systemd/systemd_257.4.bb
index 5865c017e8..5615ee18ae 100644
--- a/meta/recipes-core/systemd/systemd_257.4.bb
+++ b/meta/recipes-core/systemd/systemd_257.4.bb
@@ -753,7 +753,7 @@ FILES:${PN} = " ${base_bindir}/* \
 
 FILES:${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
 
-RDEPENDS:${PN} += "kmod dbus util-linux-mount util-linux-umount udev (= ${EXTENDPKGV}) systemd-udev-rules util-linux-agetty util-linux-fsck util-linux-swaponoff util-linux-mkswap"
+RDEPENDS:${PN} += "kmod ${VIRTUAL-RUNTIME_dbus} util-linux-mount util-linux-umount udev (= ${EXTENDPKGV}) systemd-udev-rules util-linux-agetty util-linux-fsck util-linux-swaponoff util-linux-mkswap"
 RDEPENDS:${PN} += "systemd-serialgetty"
 RDEPENDS:${PN} += "volatile-binds"
 
-- 
2.40.0


