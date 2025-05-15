Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBFDAC2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 06:12:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6607.1747289554884131354
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 23:12:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7230aadd1b=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54F5UZxw014616
	for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 23:12:34 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46mbcba8an-11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 23:12:34 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 14 May 2025 23:12:31 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 14 May 2025 23:12:28 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Praveen Kumar <praveen.kumar@windriver.com>
Subject: [oe-core][scarthgap][PATCH 1/1] connman :fix CVE-2025-32366
Date: Thu, 15 May 2025 11:42:22 +0530
Message-ID: <20250515061222.2793080-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDA1OCBTYWx0ZWRfX3Ys3h//6xAmT EdkpVMr22jMKVJk85y9Bg0+mCglAoN54o0eaPqjGxcdJ7pszvW+dH7LC7ZX6efLaYhhBY+k7Ufw YlaL3lTNetPpH1UJ9nuqUXgWFwp3P85g6Tyd0gj4xWXxt3BzRBawMjMSSzKpa0M0bkhwyVDD95h
 lTyrsrY2iKVWa6pPBVe8lvBEo2DJeMj44PVJY+OTJ33wcLbHyqnIHnF5rN74Ras1gf2ipJq11wR ++uTuUepW7RbJlWQ0AjvmlxbajJ9gkRnAMlDltW1TEpvLRqw59gB4Y3nAlgtFKHRDDdGXwADTvP s+oUv3CXyQifsIOLy/vHoc0ir5VVWBUC9+AjUB+LEn3IzidOOmc2SRmaqFJVlxqsW9x7FUd1oXU
 u/IF9xndjiPjETRxhMGdvBxJdgoOEnWUUYqn1b33tZeYTs5VFaC3YnK1sg9c1oGpY8AFzQU1
X-Proofpoint-GUID: 7xzC3G_U9n6_mGbFdZoAEctZvuMU7mk2
X-Proofpoint-ORIG-GUID: 7xzC3G_U9n6_mGbFdZoAEctZvuMU7mk2
X-Authority-Analysis: v=2.4 cv=LpWSymdc c=1 sm=1 tr=0 ts=682585d2 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=dt9VzEwgFbYA:10 a=PYnjg3YJAAAA:8 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=IaIpj4D4Xh1TY2-Ox3UA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_02,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 mlxscore=0 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505070000 definitions=main-2505150058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 06:12:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216569

In ConnMan through 1.44, parse_rr in dnsproxy.c has a memcpy length
that depends on an RR RDLENGTH value, i.e., *rdlen=ntohs(rr->rdlen)
and memcpy(response+offset,*end,*rdlen) without a check for whether
the sum of *end and *rdlen exceeds max. Consequently, *rdlen may be
larger than the amount of remaining packet data in the current state
of parsing. Values of stack memory locations may be sent over the
network in a response.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-32366

Upstream-patch:
https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=8d3be0285f1d4667bfe85dba555c663eb3d704b4

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 .../connman/connman/CVE-2025-32366.patch      | 41 +++++++++++++++++++
 .../connman/connman_1.42.bb                   |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2025-32366.patch

diff --git a/meta/recipes-connectivity/connman/connman/CVE-2025-32366.patch b/meta/recipes-connectivity/connman/connman/CVE-2025-32366.patch
new file mode 100644
index 0000000000..0eb7360685
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/CVE-2025-32366.patch
@@ -0,0 +1,41 @@
+From 8d3be0285f1d4667bfe85dba555c663eb3d704b4 Mon Sep 17 00:00:00 2001
+From: Yoonje Shin <ioerts@kookmin.ac.kr>
+Date: Mon, 12 May 2025 10:48:18 +0200
+Subject: [PATCH] dnsproxy: Address CVE-2025-32366 vulnerability
+
+In Connman parse_rr in dnsproxy.c has a memcpy length
+that depends on an RR RDLENGTH value (i.e., *rdlen=ntohs(rr->rdlen)
+and memcpy(response+offset,*end,*rdlen)). Here, rdlen may be larger
+than the amount of remaining packet data in the current state of
+parsing. As a result, values of stack memory locations may be sent
+over the network in a response.
+
+This patch adds a check to ensure that (*end + *rdlen) does not exceed
+the valid range. If the condition is violated, the function returns
+-EINVAL.
+
+CVE: CVE-2025-32366
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=8d3be0285f1d4667bfe85dba555c663eb3d704b4]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ src/dnsproxy.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/dnsproxy.c b/src/dnsproxy.c
+index 1a5a4f3..50b2d55 100644
+--- a/src/dnsproxy.c
++++ b/src/dnsproxy.c
+@@ -985,6 +985,9 @@ static int parse_rr(const unsigned char *buf, const unsigned char *start,
+	if ((offset + *rdlen) > *response_size)
+		return -ENOBUFS;
+
++	if ((*end + *rdlen) > max)
++		return -EINVAL;
++
+	memcpy(response + offset, *end, *rdlen);
+
+	*end += *rdlen;
+--
+2.40.0
diff --git a/meta/recipes-connectivity/connman/connman_1.42.bb b/meta/recipes-connectivity/connman/connman_1.42.bb
index 3a1c9802bd..9b3abbe258 100644
--- a/meta/recipes-connectivity/connman/connman_1.42.bb
+++ b/meta/recipes-connectivity/connman/connman_1.42.bb
@@ -8,6 +8,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://0001-vpn-Adding-support-for-latest-pppd-2.5.0-release.patch \
            file://0001-src-log.c-Include-libgen.h-for-basename-API.patch \
            file://CVE-2025-32743.patch \
+           file://CVE-2025-32366.patch \
            "
 
 SRC_URI:append:libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
-- 
2.40.0


