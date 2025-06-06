Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7AE0C5B549
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 04:41:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.26712.1749184913163127824
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 21:41:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8252d755fa=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5562RJL8026176;
	Fri, 6 Jun 2025 04:41:52 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9q4vm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 06 Jun 2025 04:41:52 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 5 Jun 2025 21:41:50 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 5 Jun 2025 21:41:49 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <steve@sakoman.com>
Subject: [walnascar][PATCH V2] libsoup-2.4: fix CVE-2025-32914
Date: Fri, 6 Jun 2025 12:41:49 +0800
Message-ID: <20250606044149.2094438-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <18443C9C9F8B536B.2267@lists.openembedded.org>
References: <18443C9C9F8B536B.2267@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: N0hR5CUpV0Ja0yzaqlscXcsYv9fQYqGQ
X-Authority-Analysis: v=2.4 cv=X8RSKHTe c=1 sm=1 tr=0 ts=68427190 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=eXHZBV4ZpkldoAy6WkEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA0MSBTYWx0ZWRfX9L8UNRtP0fAG UA2Od6CcFlbSs7Up2bRAAKrp+oGx3EI139H2TF1kjfdsgcPnhDzp0tFd29ZcLg9FQImgxzEyTN/ 4HbBXRl5f/aN21LZXmx2fY3WsarB1x260Bm78JtR+V/KhjZ714dSqVVJzzRAQkEvDnvJlaan6jN
 cicdefmUyNqnt8PH3oCoHinvCvQkROkiUvIIzyq0jYuW0bT/Sf5hh4ziK5VoCr1GdilHvqEk2Ev r+oZgyeHDyC0kiuJCcgmwQFY9z+khqQf8qNjngSguY4w2Z26i+iEaSpBdoMzAFMiFwI99Ie5Na4 RKXDUvY4rPMsJtLsGodgwNeWRaL/9yBVRlgwBwJtNdltxsog0I94bp47BHfkeUWSZikt9o7wBiu
 RJXbcdxBQSucC5s27Sjd06TrZIYZTYLm+IRUJcNFOSjsoLdR99zn+iWi4auxbqJKxocgQ1AZ
X-Proofpoint-ORIG-GUID: N0hR5CUpV0Ja0yzaqlscXcsYv9fQYqGQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 mlxlogscore=706 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506060041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 04:41:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218095

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/450

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-32914.patch  | 35 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch
new file mode 100644
index 0000000000..9f3bb21a25
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch
@@ -0,0 +1,35 @@
+From ac844b9fc7945c38ea21fb7cf1a49a5c226d7c9c Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 12 May 2025 16:17:20 +0800
+Subject: [PATCH] Resolve "(CVE-2025-32914) (#YWH-PGM9867-23) OOB Read on
+ libsoup through function "soup_multipart_new_from_message" in
+ soup-multipart.c leads to crash or exit of process"
+
+CVE: CVE-2025-32914
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/450/diffs?commit_id=5bfcf8157597f2d327050114fb37ff600004dbcf]
+
+Test code are not added since some functions not aligned with version
+2.74.3
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-multipart.c |  2 +-
+ 1 files changed, 1 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
+index a7e550f..dd93973 100644
+--- a/libsoup/soup-multipart.c
++++ b/libsoup/soup-multipart.c
+@@ -181,7 +181,7 @@ soup_multipart_new_from_message (SoupMessageHeaders *headers,
+ 			return NULL;
+ 		}
+ 
+-		split = strstr (start, "\r\n\r\n");
++		split = g_strstr_len (start, body_end - start, "\r\n\r\n");
+ 		if (!split || split > end) {
+ 			soup_multipart_free (multipart);
+ 			soup_buffer_free (flattened);
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 79ffa19c20..7c1de29fd5 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-2784.patch \
            file://CVE-2024-52530.patch \
            file://CVE-2025-32906.patch \
+           file://CVE-2025-32914.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.34.1


