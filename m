Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BB4C4707B
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 21:12:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5532.1704921125880449282
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jan 2024 13:12:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lFRNVwXZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1739c17419=joe.slater@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40ABKmPT007253
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 21:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=1DDFi
	Bun5tTLOdeTFYh4j2SCmmMQ/SGBwgyS5dlksPE=; b=lFRNVwXZDw/AmamuCFjDM
	perMECNHNO6vnt7dduCHGQamnLGkPhlWjsOlM8gJK+lFrRfkLaqwbdSXPKu31mJ3
	gGV3Pk4r65dzGl+6z6/I6anZHb7AIwI9f+2QiXt/zK1UYLDvbVrFU15c7ja7nMsx
	2QpWUWx6PiDjZ+VRvPsZuxlImEohKfo5c8kdjV8bIcL6XlfLxt08TW6s0b1LzPuS
	3rrhqtbETDl5nlIYXBl8H5Nt5uvKQlAkdIGy6/7e/EpfbeN0zWNo9EjPnJXq/WC0
	qKklNy0zvSE4E8VdWSO9HKTMiyL72z2YDp0GGOWTcNr6JSiKKYzs5wY+bMFMhiCo
	Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vewu5d2bm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 21:12:04 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Jan 2024 13:12:33 -0800
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 10 Jan 2024 13:12:33 -0800
From: <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [oe-core][PATCH 1/1] eudev: modify predictable network if name search
Date: Wed, 10 Jan 2024 13:12:03 -0800
Message-ID: <20240110211203.1471586-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: r4Yop8KIScnduYKU_2zyevLtck1u2KTk
X-Proofpoint-ORIG-GUID: r4Yop8KIScnduYKU_2zyevLtck1u2KTk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=289
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401100168
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 21:12:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193528

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
index 0000000000..a45b80118f
--- /dev/null
+++ b/meta/recipes-core/udev/eudev/netifnames.patch
@@ -0,0 +1,17 @@
+eudev: consider ID_NET_NAME_MAC as an interface name
+
+eudev might not create names based on slot or path.
+
+Upstream-Status: Pending
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


