Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40491C61DB8
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 06:50:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.27941.1749192610577375134
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 23:50:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8252d755fa=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565V5g6012130
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Jun 2025 23:50:10 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rw0f9-10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 23:50:10 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 5 Jun 2025 23:50:09 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 5 Jun 2025 23:50:09 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH V3 05/12] libsoup: fix CVE-2025-32050
Date: Fri, 6 Jun 2025 14:49:56 +0800
Message-ID: <20250606065003.3681416-6-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250606065003.3681416-1-changqing.li@windriver.com>
References: <20250606065003.3681416-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: mibNqE5oAF2HKE6B8bIARKaCQSQh6X0n
X-Authority-Analysis: v=2.4 cv=VIHdn8PX c=1 sm=1 tr=0 ts=68428fa2 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=V2sgnzSHAAAA:8 a=eXHZBV4ZpkldoAy6WkEA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA2MSBTYWx0ZWRfXxpDEk8qtZq91 PTFOSN2RwNS6n0fk6YChy8zGAKRhFtX75xYy4P2FXgLdxwpudtr8xhmzQzhPo4jrAcYS2ODDpWl G9xEfZuAdfb930cB4YLoWMUlpesjnldQJHjpW0qSW3tvxIe/f6KI3M6OR2wOx4IwZlFCw9sw4/3
 DmaN5SPSQeDfuneUTYFwSmivQSMgoVMSPo5QecAMPQpiyJvVD2i5D2V2fbQl+ifwKlJlhmw3Dju L3ZVbv9zjrm+wo1tA+Z6LHreSpbhl5E/SupRkKw946x0gkK9kprtxUqlJoTlsw3wrYef0gFqW5J UQmazsQKnQpr/s9/K72AD66Bm61xVFweHWnm4ADzj+PcBLk+BVUGUUAKCnErv17LpDze+Lofy1N
 EkKyHxCzgjW3rWNelNcc1c4l3Fh0vJIjPHLL+32yI9LWaPk3h1i/DDxmEGXDsHx0aGv6CVDZ
X-Proofpoint-ORIG-GUID: mibNqE5oAF2HKE6B8bIARKaCQSQh6X0n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=900
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506060061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 06:50:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218103

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/424

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsoup-3.4.4/CVE-2025-32050.patch        | 29 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32050.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32050.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32050.patch
new file mode 100644
index 00000000000..e5a4d747a16
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32050.patch
@@ -0,0 +1,29 @@
+From 30c86c9a284cf6f366ac87df0bca3e18a5de8671 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Mon, 28 Oct 2024 12:29:48 -0500
+Subject: [PATCH] Fix using int instead of size_t for strcspn return
+
+CVE: CVE-2025-32050
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/9bb0a55de55c6940ced811a64fbca82fe93a9323]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-headers.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
+index 5fb32c2..52ef2ec 100644
+--- a/libsoup/soup-headers.c
++++ b/libsoup/soup-headers.c
+@@ -906,7 +906,7 @@ append_param_quoted (GString    *string,
+ 		     const char *name,
+ 		     const char *value)
+ {
+-	int len;
++	gsize len;
+ 
+ 	g_string_append (string, name);
+ 	g_string_append (string, "=\"");
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index 9af7de192fa..23d44d15725 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -40,6 +40,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32052.patch \
            file://CVE-2025-32051-1.patch \
            file://CVE-2025-32051-2.patch \
+           file://CVE-2025-32050.patch \
 "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.34.1


