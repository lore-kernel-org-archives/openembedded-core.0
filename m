Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00139C71153
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 03:44:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1714.1749786244068339153
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 20:44:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8259073970=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D2v2Hk001373
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 03:44:03 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474an2pe30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 03:44:03 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 12 Jun 2025 20:44:01 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 12 Jun 2025 20:44:01 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH 08/20] libsoup-2.4: fix CVE-2025-4476
Date: Fri, 13 Jun 2025 11:43:40 +0800
Message-ID: <20250613034352.175878-9-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613034352.175878-1-changqing.li@windriver.com>
References: <20250613034352.175878-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDAyNiBTYWx0ZWRfX+BnK66hGFw7U xcdziFM2fW6y4qzj08vUozqguoqa4pWl2VqcHBrGzouafdHRXfO6a1q+8y/dFaKs5zz/+IGDsNf rrAwSDFkBnjnk92fQ6cONhWbdHuhbyme2tggbXru/RePplF6NIdn+ozuG3tdLTUEbPcooXpq2zd
 h/hGWRNaB2gou8bewGo8yOh8aooKoWixnNC7y0ztlqfSucVnQjrxS0xE6uRHu5cUPxFUzDd5LA5 WwFs4FtwHnQ2BsrYMNE6Zl5dxi8mEPjNYiDFmkuBy8Z5R1ne2kkQMzt7wA0BSF2ux2I7yZvp32A m1rU4M3dCOBLMXAI0Ffg5ygLjZuD/PYCbtagfh/MwhB9ikUjCa1lGCDko8AdkFcBvSxSkSWCcgG
 HpXdHCPxkUNUN12o+6/56YAyc3DczG+6ZJEp/PFQIJcfzpPtNsr0MazNdTCRfIRPG2F1T2YT
X-Proofpoint-GUID: 9bQu9d3N-3_OcxE4WGl5lswx-mValah4
X-Authority-Analysis: v=2.4 cv=fdSty1QF c=1 sm=1 tr=0 ts=684b9e83 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=_enOPnqeAAAA:8 a=eXHZBV4ZpkldoAy6WkEA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=FdTzh2GWekK77mhwV6Dw:22 a=XAbD3I9PDrnSMThV5XoS:22
X-Proofpoint-ORIG-GUID: 9bQu9d3N-3_OcxE4WGl5lswx-mValah4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=903
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 mlxscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506130026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 03:44:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218561

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/440

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-4476.patch   | 38 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.2.bb             |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch
new file mode 100644
index 0000000000..874f62e7ad
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch
@@ -0,0 +1,38 @@
+From 52a0f9234d384b9dab368835b22e5a5a01542168 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 16 May 2025 14:16:10 +0800
+Subject: [PATCH] auth-digest: fix crash in
+ soup_auth_digest_get_protection_space()
+
+We need to validate the Domain parameter in the WWW-Authenticate header.
+
+Unfortunately this crash only occurs when listening on default ports 80
+and 443, so there's no good way to test for this. The test would require
+running as root.
+
+Fixes #440
+
+CVE: CVE-2025-4476
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/e64c221f9c7d09b48b610c5626b3b8c400f0907c?merge_request_iid=457]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-auth-digest.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
+index f1621ec..a2dc560 100644
+--- a/libsoup/soup-auth-digest.c
++++ b/libsoup/soup-auth-digest.c
+@@ -229,7 +229,7 @@ soup_auth_digest_get_protection_space (SoupAuth *auth, SoupURI *source_uri)
+ 			uri = soup_uri_new (d);
+ 			if (uri && uri->scheme == source_uri->scheme &&
+ 			    uri->port == source_uri->port &&
+-			    !strcmp (uri->host, source_uri->host))
++			    !g_strcmp0 (uri->host, source_uri->host))
+ 				dir = g_strdup (uri->path);
+ 			else
+ 				dir = NULL;
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
index 7b5b1b1370..eb88f11881 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
@@ -38,6 +38,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32050.patch \
            file://CVE-2025-46421.patch \
            file://CVE-2025-4948.patch \
+           file://CVE-2025-4476.patch \
           "
 SRC_URI[sha256sum] = "f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b7823b6018b40d01159"
 
-- 
2.34.1


