Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 174B2C4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 11:45:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.29843.1702035895097144389
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 03:44:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=o2U2NDmr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=07065978db=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B894DAk007693
	for <openembedded-core@lists.openembedded.org>; Fri, 8 Dec 2023 11:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=KBVoP
	Fs6o3pL361YbKQxJcTBCf8N1MjeKfIsFGY5r8o=; b=o2U2NDmrBH/+D4tdw5y34
	Qr/Vtn4rrtvFjoq9FIpRyBhUw9qikjPjV+QcCPhC3UptW0UmvQYPeZdkro7jkWlI
	FaEcxKBW5oeGsKp977reUi1uzxdThEbYO8R/mxrl+SXKqJfuxYGW2H34oNKgN4Tt
	vEA1AO87DM/aQCtJ5WwjixL9KXPSDsQI6iv2ec7chHq0ySXstmY5Al5WwxJgV/Z3
	Pjw0bZ0aMH4cKptn13kgciQ1sYXGyNdkeiE6hVm1tSKBbRLE/tpIFhdAozxhaKhK
	O0l+RaDlMkUyyTALmfpbH2RZ3EaAoY3q2CEmV342u4yJCv0QVJKGrKPFreOn3dSh
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3utd53tswx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 11:44:54 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 03:44:46 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][PATCH 1/1] bluez5: fix CVE-2023-45866
Date: Fri, 8 Dec 2023 11:44:15 +0000
Message-ID: <20231208114415.416204-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: bwUCD_OEsHFGXonaBpT_yxMszWvaCipz
X-Proofpoint-ORIG-GUID: bwUCD_OEsHFGXonaBpT_yxMszWvaCipz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312080098
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 11:45:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192045

From: Archana Polampalli <archana.polampalli@windriver.com>

Bluetooth HID Hosts in BlueZ may permit an unauthenticated Peripheral role
HID Device to initiate and establish an encrypted connection, and accept HID
keyboard reports,potentially permitting injection of HID messages when no user
interaction has occurred in the Central role to authorize such access. An example
affected package is bluez 5.64-0ubuntu1 in Ubuntu 22.04LTS. NOTE: in some cases,
a CVE-2020-0556 mitigation would have already addressed this Bluetooth HID Hosts issue.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-45866

Upstream patches:
https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/profiles/input?id=25a471a83e02e1effb15d5a488b3f0085eaeb675

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 .../bluez5/bluez5/CVE-2023-45866.patch        | 56 +++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2023-45866.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index a23e4e58a6..0bb157e202 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -56,6 +56,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-test-gatt-Fix-hung-issue.patch \
            file://0004-src-shared-util.c-include-linux-limits.h.patch \
            file://0002-input-Fix-.device_probe-failing-if-SDP-record-is-not.patch \
+	   file://CVE-2023-45866.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/CVE-2023-45866.patch b/meta/recipes-connectivity/bluez5/bluez5/CVE-2023-45866.patch
new file mode 100644
index 0000000000..5bb31d866a
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/CVE-2023-45866.patch
@@ -0,0 +1,56 @@
+From 25a471a83e02e1effb15d5a488b3f0085eaeb675 Mon Sep 17 00:00:00 2001
+From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
+Date: Tue, 10 Oct 2023 13:03:12 -0700
+Subject: [PATCH] input.conf: Change default of ClassicBondedOnly
+
+This changes the default of ClassicBondedOnly since defaulting to false
+is not inline with HID specification which mandates the of Security Mode
+4:
+
+BLUETOOTH SPECIFICATION Page 84 of 123
+Human Interface Device (HID) Profile:
+
+  5.4.3.4.2 Security Modes
+  Bluetooth HID Hosts shall use Security Mode 4 when interoperating with
+  Bluetooth HID devices that are compliant to the Bluetooth Core
+  Specification v2.1+EDR[6].
+
+Upstream-Status: Backport
+[https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/profiles/input?id=25a471a83e02e1effb15d5a488b3f0085eaeb675]
+
+CVE: CVE-2023-45866
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ profiles/input/device.c   | 2 +-
+ profiles/input/input.conf | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/profiles/input/device.c b/profiles/input/device.c
+index 4a50ea9..4310dd1 100644
+--- a/profiles/input/device.c
++++ b/profiles/input/device.c
+@@ -81,7 +81,7 @@ struct input_device {
+
+ static int idle_timeout = 0;
+ static bool uhid_enabled = false;
+-static bool classic_bonded_only = false;
++static bool classic_bonded_only = true;
+
+ void input_set_idle_timeout(int timeout)
+ {
+diff --git a/profiles/input/input.conf b/profiles/input/input.conf
+index 4c70bc5..d8645f3 100644
+--- a/profiles/input/input.conf
++++ b/profiles/input/input.conf
+@@ -17,7 +17,7 @@
+ # platforms may want to make sure that input connections only come from bonded
+ # device connections. Several older mice have been known for not supporting
+ # pairing/encryption.
+-# Defaults to false to maximize device compatibility.
++# Defaults to true for security.
+ #ClassicBondedOnly=true
+
+ # LE upgrade security
+--
+2.40.0
-- 
2.40.0


