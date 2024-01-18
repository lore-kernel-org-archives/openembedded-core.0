Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5FADC47DB3
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 18:04:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.21004.1705601073565874317
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 10:04:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XipyqnJX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1747397340=joe.slater@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40I8KcqA010382
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 18:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=+aP+6
	tXi1Y9iZq3Qz/4hGXyzb+uq8GOtXJHosAlktP4=; b=XipyqnJXMPdNZe9QBD+Zu
	QS/az+iGsIOJsVkEnR4x7TqLQY0zHSZDbDk/pSE4wfzRtaYCvMEu5bN7gJcpfEq7
	ntq2lGgFcfhj2lVmpQAWb4YK3dfdUT2dH27QDKFbChJNshmyefBOrgA1VoJoNOBd
	QDAws1Lr3B8kZfooW4G+mFrU+NrXlCs4FoxA/2FXaoNErGZDsMh+FXLMo0WFad35
	M5bQLM+tR0ShVwPGg4OMCiT98eEIk1YkVczATVPufooIyJy+vdFQ3RL8wtuqoiTA
	c6wuot9JyXvc4rxVMoKdRAQs6y1kRlTpYTpZ8t0f+4aq9H3l2fMHVn/QNbQKuHcQ
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkhg662uh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 18:04:32 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 10:04:42 -0800
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 10:04:42 -0800
From: <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [v3][oe-core][PATCH 1/1] eudev: modify predictable network if name search
Date: Thu, 18 Jan 2024 10:04:31 -0800
Message-ID: <20240118180431.1625838-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: HSkH2SGB8taPON5PZ6Yx2VffvNNaVJm9
X-Proofpoint-GUID: HSkH2SGB8taPON5PZ6Yx2VffvNNaVJm9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-18_08,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 mlxlogscore=502
 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401180130
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 18:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193997

From: Joe Slater <joe.slater@windriver.com>

Consider a name based on mac address in addition to
those based on slot or path.

Note that as of this commit predictable naming is
suppressed by eudev, but can be enabled by removing
/etc/udev/rules.d/80-net-name-slot.rules from the
root filesystem.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta/recipes-core/udev/eudev/netifnames.patch | 17 +++++++++++++++++
 meta/recipes-core/udev/eudev_3.2.14.bb        |  2 ++
 2 files changed, 19 insertions(+)
 create mode 100644 meta/recipes-core/udev/eudev/netifnames.patch

diff --git a/meta/recipes-core/udev/eudev/netifnames.patch b/meta/recipes-core/udev/eudev/netifnames.patch
new file mode 100644
index 0000000000..8f6e9a1538
--- /dev/null
+++ b/meta/recipes-core/udev/eudev/netifnames.patch
@@ -0,0 +1,17 @@
+eudev: consider ID_NET_NAME_MAC as an interface name
+
+eudev might not create names based on slot or path.
+
+Upstream-Status: Submitted [github.com/eudev-project/eudev/pull/274]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+--- a/rules/80-net-name-slot.rules
++++ b/rules/80-net-name-slot.rules
+@@ -10,5 +10,6 @@ ENV{net.ifnames}=="0", GOTO="net_name_sl
+ NAME=="", ENV{ID_NET_NAME_ONBOARD}!="", NAME="$env{ID_NET_NAME_ONBOARD}"
+ NAME=="", ENV{ID_NET_NAME_SLOT}!="", NAME="$env{ID_NET_NAME_SLOT}"
+ NAME=="", ENV{ID_NET_NAME_PATH}!="", NAME="$env{ID_NET_NAME_PATH}"
++NAME=="", ENV{ID_NET_NAME_MAC}!="", NAME="$env{ID_NET_NAME_MAC}"
+ 
+ LABEL="net_name_slot_end"
diff --git a/meta/recipes-core/udev/eudev_3.2.14.bb b/meta/recipes-core/udev/eudev_3.2.14.bb
index d0758691bd..ddb3c3340f 100644
--- a/meta/recipes-core/udev/eudev_3.2.14.bb
+++ b/meta/recipes-core/udev/eudev_3.2.14.bb
@@ -10,6 +10,7 @@ DEPENDS = "gperf-native"
 PROVIDES = "udev"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
+           file://netifnames.patch \
            file://init \
            file://local.rules \
            "
@@ -50,6 +51,7 @@ do_install:append() {
 
 	# Use classic network interface naming scheme
 	touch ${D}${sysconfdir}/udev/rules.d/80-net-name-slot.rules
+
 }
 
 do_install:prepend:class-target () {
-- 
2.25.1


