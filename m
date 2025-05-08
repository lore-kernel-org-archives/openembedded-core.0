Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CCFBC3ABC0
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 16:39:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.732.1746722374178216420
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 09:39:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=72237940aa=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5488bVdH030047
	for <openembedded-core@lists.openembedded.org>; Thu, 8 May 2025 16:39:32 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46e430ngwt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 16:39:32 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 8 May 2025 09:39:30 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 8 May 2025 09:39:29 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Praveen Kumar <praveen.kumar@windriver.com>
Subject: [oe-core][walnascar][PATCH 1/1] connman :fix CVE-2025-32743
Date: Thu, 8 May 2025 16:39:10 +0000
Message-ID: <20250508163910.1451448-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=BajY0qt2 c=1 sm=1 tr=0 ts=681cde44 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=dt9VzEwgFbYA:10 a=PYnjg3YJAAAA:8 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=orGBpfcN-aQqT5LYJdQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: rbSOwGkG0LfaYZkiBImHvID-6knk174j
X-Proofpoint-ORIG-GUID: rbSOwGkG0LfaYZkiBImHvID-6knk174j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDE0NSBTYWx0ZWRfX0EDoHYFu/9eU DBDuOKQC5HvDuEvM5Mxe8HryvDjxdqAeqSpUzgU7uqxE28yklC019QnLpQ11kNUNL3zPlesZMnD JCjLZpJ2fIkAbwLYiQMlfryd5J/TaSFA6anoBWqFLVG04xhLxbilehRSfhAprgjK7z02/8l7toa
 gDZAifLmQQgz3pTpXjafyvbvfLasghcp4yad+72FZmV2CLU9ih/DCbd65VqNMP5vDT8UbEe9/gQ m1liLUjnGrnNqAD+iiRVfk7F5aC9CANn2Wi9bKwx6ZiTuZ0MzZLq76FODtjksszSuhxxpDw0Axt /xefxnHqxOHfqhIacIa6k14S2JysjoYgACqVb08+YX6ahpnX5/bPiXp+3Hbr4AxzWd07eHUfIDp
 tNYLujNeHjGtBfJWchG7OP2MMVi7JHRfHUHbszbWqvu0ap/CwLTdrFMiyAeSEkQMdMPLQxUU
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-08_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505080145
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 16:39:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216153

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
 .../connman/connman_1.43.bb                   |  1 +
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
diff --git a/meta/recipes-connectivity/connman/connman_1.43.bb b/meta/recipes-connectivity/connman/connman_1.43.bb
index 1100599490..02abda568f 100644
--- a/meta/recipes-connectivity/connman/connman_1.43.bb
+++ b/meta/recipes-connectivity/connman/connman_1.43.bb
@@ -6,6 +6,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://connman \
            file://no-version-scripts.patch \
            file://0002-resolve-musl-does-not-implement-res_ninit.patch \
+           file://CVE-2025-32743.patch \
            "
 
 
-- 
2.40.0


