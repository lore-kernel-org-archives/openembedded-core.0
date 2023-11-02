Return-Path: <Lizhi.Xu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5336C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 02:40:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.22600.1698892804129200655
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 19:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rsNXKb1v;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9670653994=lizhi.xu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A22cTwC010692
	for <openembedded-core@lists.openembedded.org>; Wed, 1 Nov 2023 19:40:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=hhYXE
	UbLyyRSY02tKa/Xs0oA8GmoW3w3R/pRkQ71+EY=; b=rsNXKb1vMmcBGyePMTNFY
	m3yem1HvmKIaPwH9u+ezxcZauavfLTUdvoz937tZ//3DVkkIOM0KBvNdInFddnXa
	PjU6ThZRlIEsW91YRNBKIwTrcCqcvlh4yMwXGadcg72DXVagqc2zPJ7Tp5vK3unV
	vWefEqFMS6SsQlqBHMVFQxO4dumgWmqAUdj0yn0uTE2+ZQqKnMF4SBNSlgXrIzyl
	ar8/smJFqZriRCgVKRsMJ3Zw+pdku0oKl9HXc86ab/tNEx1vr5OCoyNzJXvgHypm
	Y5zdIFx4FsdT2s1zk1UAWcBqmcSTYFxBrfTPdMCeQgXJX35Zqa9svalBu86+qFhM
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u430cr07g-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 19:40:03 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 1 Nov 2023 19:40:04 -0700
Received: from pek-lpd-ccm6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.34 via Frontend Transport; Wed, 1 Nov 2023 19:40:04 -0700
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] tzdata: Reduced time zone configuration
Date: Thu, 2 Nov 2023 10:40:01 +0800
Message-ID: <20231102024001.1671273-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: BU2iFcKj9zxWHiz-WSDUt7gmPCDVzpnn
X-Proofpoint-ORIG-GUID: BU2iFcKj9zxWHiz-WSDUt7gmPCDVzpnn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-01_23,2023-11-01_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 phishscore=0 mlxscore=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310240000 definitions=main-2311020019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 02:40:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190056

The tzdata.bb by default pulls in all possible timezone data packages which 
increases size of the final root filesystem considerably.
The customer would like to have extra timezones configurable so that only 
tzdata-core is chosen by default and rest of the zones are optional.
This change would make the fs size a lot smaller.

Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
---
 meta/recipes-extended/timezone/README.txt     |   8 ++
 meta/recipes-extended/timezone/tzd.inc        |   3 +
 .../recipes-extended/timezone/tzdata.bbappend | 115 ++++++++++++++++++
 3 files changed, 126 insertions(+)
 create mode 100644 meta/recipes-extended/timezone/README.txt
 create mode 100644 meta/recipes-extended/timezone/tzd.inc
 create mode 100644 meta/recipes-extended/timezone/tzdata.bbappend

diff --git a/meta/recipes-extended/timezone/README.txt b/meta/recipes-extended/timezone/README.txt
new file mode 100644
index 0000000000..e0c6bfdc2e
--- /dev/null
+++ b/meta/recipes-extended/timezone/README.txt
@@ -0,0 +1,8 @@
+# Timezones Config 
+Set the parameter "OP_TZ" in the file "tzd.inc" to increase or 
+decrease the time zone in rootfs, as shown in the following example:
+
+1. Add time zone Asia and Americas, set OP_TZ=" tzdata-asia tzdata-americas"
+
+2. Delete time zone Americas, set OP_TZ=" tzdata-asia"
+
diff --git a/meta/recipes-extended/timezone/tzd.inc b/meta/recipes-extended/timezone/tzd.inc
new file mode 100644
index 0000000000..fd59531063
--- /dev/null
+++ b/meta/recipes-extended/timezone/tzd.inc
@@ -0,0 +1,3 @@
+OP_TZ=" tzdata-americas \
+	tzdata-asia \
+"
diff --git a/meta/recipes-extended/timezone/tzdata.bbappend b/meta/recipes-extended/timezone/tzdata.bbappend
new file mode 100644
index 0000000000..c57e961392
--- /dev/null
+++ b/meta/recipes-extended/timezone/tzdata.bbappend
@@ -0,0 +1,115 @@
+FILESEXTRAPATHS:append := "${THISDIR}/files:"
+require tzd.inc
+# Packages are primarily organized by directory with a major city in most time
+# zones in the base package
+TZ_PACKAGES = " \
+    tzdata-core \
+    ${OP_TZ} \
+"
+
+# delete posix
+do_install:append() { 
+	if ! echo "${TZ_PACKAGES}" | grep -c "tzdata-posix" 2>&1; then
+		rm -rf ${D}${datadir}/zoneinfo/posix
+	fi
+}
+
+# delete right
+do_install:append() {      
+	if ! echo "${TZ_PACKAGES}" | grep -c "tzdata-right" 2>&1; then
+		rm -rf ${D}${datadir}/zoneinfo/right
+	fi
+}
+
+# delete america
+do_install:append() {      
+	if ! echo "${TZ_PACKAGES}" | grep -c "tzdata-americas" 2>&1; then
+		rm -rf ${D}${datadir}/zoneinfo/America
+		rm -rf ${D}${datadir}/zoneinfo/US
+		rm -rf ${D}${datadir}/zoneinfo/Brazil
+		rm -rf ${D}${datadir}/zoneinfo/Canada
+		rm -rf ${D}${datadir}/zoneinfo/Mexico
+		rm -rf ${D}${datadir}/zoneinfo/Chile
+	fi
+}
+
+# delete europe
+do_install:append() {      
+	if ! echo "${TZ_PACKAGES}" | grep -c "tzdata-europe" 2>&1; then
+		rm -rf ${D}${datadir}/zoneinfo/Europe
+	fi
+}
+
+# delete africa
+do_install:append() {      
+	if ! echo "${TZ_PACKAGES}" | grep -c "tzdata-africa" 2>&1; then
+		rm -rf ${D}${datadir}/zoneinfo/Africa
+	fi
+}
+
+# delete atlantic
+do_install:append() {      
+	if ! echo "${TZ_PACKAGES}" | grep -c "tzdata-atlantic" 2>&1; then
+		rm -rf ${D}${datadir}/zoneinfo/Atlantic
+	fi
+}
+
+# delete pacific
+do_install:append() {      
+	if ! echo "${TZ_PACKAGES}" | grep -c "tzdata-pacific" 2>&1; then
+		rm -rf ${D}${datadir}/zoneinfo/Pacific
+	fi
+}
+
+# delete antarctica
+do_install:append() {      
+	if ! echo "${TZ_PACKAGES}" | grep -c "tzdata-antarctica" 2>&1; then
+		rm -rf ${D}${datadir}/zoneinfo/Antarctica
+	fi
+}
+
+# delete australia
+do_install:append() {      
+	if ! echo "${TZ_PACKAGES}" | grep -c "tzdata-australia" 2>&1; then
+		rm -rf ${D}${datadir}/zoneinfo/Australia
+	fi
+}
+
+# delete arctic
+do_install:append() {      
+	if ! echo "${TZ_PACKAGES}" | grep -c "tzdata-arctic" 2>&1; then
+		rm -rf ${D}${datadir}/zoneinfo/Arctic
+	fi
+}
+
+# delete misc
+do_install:append() {      
+	if ! echo "${TZ_PACKAGES}" | grep -c "tzdata-misc" 2>&1; then
+		rm ${D}${datadir}/zoneinfo/Cuba
+		rm ${D}${datadir}/zoneinfo/Egypt
+		rm ${D}${datadir}/zoneinfo/Eire
+		rm ${D}${datadir}/zoneinfo/Factory
+		rm ${D}${datadir}/zoneinfo/GB-Eire
+		rm ${D}${datadir}/zoneinfo/Hongkong
+		rm ${D}${datadir}/zoneinfo/Iceland
+		rm ${D}${datadir}/zoneinfo/Iran
+		rm ${D}${datadir}/zoneinfo/Israel
+		rm ${D}${datadir}/zoneinfo/Jamaica
+		rm ${D}${datadir}/zoneinfo/Japan
+		rm ${D}${datadir}/zoneinfo/Kwajalein
+		rm ${D}${datadir}/zoneinfo/Libya
+		rm ${D}${datadir}/zoneinfo/Navajo
+		rm ${D}${datadir}/zoneinfo/Poland
+		rm ${D}${datadir}/zoneinfo/Portugal
+		rm ${D}${datadir}/zoneinfo/Singapore
+		rm ${D}${datadir}/zoneinfo/Turkey
+	fi
+}
+
+# delete asia
+do_install:append() {      
+	if ! echo "${TZ_PACKAGES}" | grep -c "tzdata-asia" 2>&1; then
+		rm -rf ${D}${datadir}/zoneinfo/Asia 
+		rm -rf ${D}${datadir}/zoneinfo/Indian
+	fi
+}
-- 
2.25.1


