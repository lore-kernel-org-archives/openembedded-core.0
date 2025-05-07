Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E9DEC369DC
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 06:48:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2330.1746600518650992258
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 23:48:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7222048fe2=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5475cJfv032364
	for <openembedded-core@lists.openembedded.org>; Wed, 7 May 2025 06:48:37 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46e430kcj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 06:48:37 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 6 May 2025 23:48:36 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 6 May 2025 23:48:34 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Praveen Kumar <praveen.kumar@windriver.com>
Subject: [oe-core][PATCH 1/1] connman :fix CVE-2025-32743
Date: Wed, 7 May 2025 06:48:23 +0000
Message-ID: <20250507064823.1843463-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=BajY0qt2 c=1 sm=1 tr=0 ts=681b0245 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=dt9VzEwgFbYA:10 a=PYnjg3YJAAAA:8 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=orGBpfcN-aQqT5LYJdQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: yPwxDi7XpbDxclZ3U8hsicobjJNnXio-
X-Proofpoint-ORIG-GUID: yPwxDi7XpbDxclZ3U8hsicobjJNnXio-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA2MiBTYWx0ZWRfX2E/V44QBK5Px 3zrQ57HVup9MFLjgs0tTXo0AsjvAHeN+5vjFcrZ6mZfbo9VkGUq7BcgiLMAQyTuAJ31M36CfbS6 dUdM/nYBhglvPV8kNPg7x02J2aQ8Cg4GVSaRLrtHi/VRtjgwfw9b7kEgzGCSCj/sNCfUREsL3Yr
 sgPWyV3oX61SiW1iuC1NFKtPX6CwT58d0UeIQGscVkm5ZmO3b61bd/K9gRSEZ5axQoeuIP3L9Nt 6m9JmXrGGM8bx3w5NZ5HRKccnBYsbCz2L7Lk3fiVx7Am0bvMGKdPAKgqFDsNCY7rmLagAhJqNkp FIVW0KRu4nkGo/bCGNr3YClfCXWGK775RL38Q/iUJ80KUXNR0+DWgweOa4sSb2qEFzS8fCDtLbY
 bzseD8SC9GjIaN94SKOdyYXsi/iveEt4aXhONnP1Q4/sf8B9qWSDScfMeLGiGCzk4gsTU/fV
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505070062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 06:48:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216092

In ConnMan through 1.44, the lookup string in ns_resolv in dnsproxy.c
can be NULL or an empty string when the TC (Truncated) bit is set in
a DNS response. This allows attackers to cause a denial of service
(application crash) or possibly execute arbitrary code, because those
lookup values lead to incorrect length calculations and incorrect
memcpy operations.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-32743

Upstream-patch:
https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=d90b911f6760959bdf1393c39fe8d1118315490f

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 .../connman/connman/CVE-2025-32743.patch      | 48 +++++++++++++++++++
 .../connman/connman_1.44.bb                   |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2025-32743.patch

diff --git a/meta/recipes-connectivity/connman/connman/CVE-2025-32743.patch b/meta/recipes-connectivity/connman/connman/CVE-2025-32743.patch
new file mode 100644
index 0000000000..c114589679
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/CVE-2025-32743.patch
@@ -0,0 +1,48 @@
+From d90b911f6760959bdf1393c39fe8d1118315490f Mon Sep 17 00:00:00 2001
+From: Praveen Kumar <praveen.kumar@windriver.com>
+Date: Thu, 24 Apr 2025 11:39:29 +0000
+Subject: [PATCH] dnsproxy: Fix NULL/empty lookup causing potential crash
+
+In ConnMan through 1.44, the lookup string in ns_resolv in dnsproxy.c
+can be NULL or an empty string when the TC (Truncated) bit is set in
+a DNS response. This allows attackers to cause a denial of service
+(application crash) or possibly execute arbitrary code, because those
+lookup values lead to incorrect length calculations and incorrect
+memcpy operations.
+
+This patch includes a check to make sure loookup value is valid before
+using it. This helps avoid unexpected value when the input is empty or
+incorrect.
+
+Fixes: CVE-2025-32743
+
+CVE: CVE-2025-32743
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=d90b911f6760959bdf1393c39fe8d1118315490f]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ src/dnsproxy.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/dnsproxy.c b/src/dnsproxy.c
+index f28a5d7..7ee26d9 100644
+--- a/src/dnsproxy.c
++++ b/src/dnsproxy.c
+@@ -1685,8 +1685,13 @@ static int ns_resolv(struct server_data *server, struct request_data *req,
+				gpointer request, gpointer name)
+ {
+	int sk = -1;
++	int err;
+	const char *lookup = (const char *)name;
+-	int err = ns_try_resolv_from_cache(req, request, lookup);
++
++	if (!lookup || strlen(lookup) == 0)
++		return -EINVAL;
++
++	err = ns_try_resolv_from_cache(req, request, lookup);
+
+	if (err > 0)
+		/* cache hit */
+--
+2.40.0
diff --git a/meta/recipes-connectivity/connman/connman_1.44.bb b/meta/recipes-connectivity/connman/connman_1.44.bb
index 00e69182d7..b25a435577 100644
--- a/meta/recipes-connectivity/connman/connman_1.44.bb
+++ b/meta/recipes-connectivity/connman/connman_1.44.bb
@@ -21,6 +21,7 @@ DEPENDS  = "dbus glib-2.0"
 SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://connman \
            file://0002-resolve-musl-does-not-implement-res_ninit.patch \
+           file://CVE-2025-32743.patch \
            "
 
 SRC_URI[sha256sum] = "2be2b00321632b775f9eff713acd04ef21e31fbf388f6ebf45512ff4289574ff"
-- 
2.40.0


