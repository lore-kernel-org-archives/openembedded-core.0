Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08384ECAAA1
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 15:52:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.1141.1666972367906654918
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Oct 2022 08:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=VK7GeJPp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8300e855dc=narpat.mali@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 29SBMTsW028959;
	Fri, 28 Oct 2022 15:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=EFqOjZyP8yYtJvFIreegYdxboCn+cbzv7VzKzaBXqN4=;
 b=VK7GeJPpFrCA5Qwl5frDdFh8HPbhKC089KrCLwjrKlDmx0XiNjRjgoi0Inn4OEnPCXO6
 aM7FXa/emeO0RA9mDDJY//Nor26fPricAXIC6dvMyO1Y8PoureizjjBXo9pqBZY7w3tA
 g3YodYDXN6rmXIAkrc3xTTBW2GP0IelowlpwmyFadxs8oqf1zHICbdxI5Riw4sBHW6pB
 Z3/VE95Yc258RH4K01RPPRXo5a2bqLjCxoDIEpL58xNar3JzV/xGjPhK6IovpNuTgdLA
 39F6vqpFMqw669R6DUt/EfmdCuhAr2E0CArFEuKxcGjGiDF2V0l6abUV5I8Xi/tEY6NE 2Q== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kfg56hjhx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 28 Oct 2022 15:52:32 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 28 Oct 2022 08:52:30 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 28 Oct 2022 08:52:28 -0700
From: Narpat Mali <narpat.mali@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <archana.polampalli@windriver.com>, <hari.gpillai@windriver.com>,
        "Narpat
 Mali" <narpat.mali@windriver.com>,
        Alexander Kanavin <alex@linutronix.de>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [OE-core][kirkstone][PATCH 1/2] wayland: exclude pre-releases from version check
Date: Fri, 28 Oct 2022 15:52:23 +0000
Message-ID: <20221028155223.1593888-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: az7oYx457FzHfLyyIA_1W4LyAyb7qF88
X-Proofpoint-ORIG-GUID: az7oYx457FzHfLyyIA_1W4LyAyb7qF88
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_07,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 phishscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210280099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 15:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172261

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Upstream master commit:
https://git.openembedded.org/openembedded-core/commit/?id=7a006009ee2310ace163ddf6d25d45b24a377200

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 meta/recipes-graphics/wayland/wayland_1.20.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/wayland/wayland_1.20.0.bb b/meta/recipes-graphics/wayland/wayland_1.20.0.bb
index bd437767b2..dd48a29dc4 100644
--- a/meta/recipes-graphics/wayland/wayland_1.20.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.20.0.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
 SRC_URI[sha256sum] = "b8a034154c7059772e0fdbd27dbfcda6c732df29cae56a82274f6ec5d7cd8725"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
+UPSTREAM_CHECK_REGEX = "wayland-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
 inherit meson pkgconfig ptest
 
-- 
2.34.1


