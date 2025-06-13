Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED01C7114A
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 03:44:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1780.1749786253078132327
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 20:44:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8259073970=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D3OHJe017774
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 20:44:12 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474mxm66y1-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 20:44:12 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 12 Jun 2025 20:44:10 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 12 Jun 2025 20:44:10 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH 17/20] libsoup: fix CVE-2025-32050
Date: Fri, 13 Jun 2025 11:43:49 +0800
Message-ID: <20250613034352.175878-18-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613034352.175878-1-changqing.li@windriver.com>
References: <20250613034352.175878-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: hT8lnigmCfYN0ur1y_wV3m1Tq7cXGiMF
X-Authority-Analysis: v=2.4 cv=L74dQ/T8 c=1 sm=1 tr=0 ts=684b9e8c cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=_enOPnqeAAAA:8 a=V2sgnzSHAAAA:8 a=eXHZBV4ZpkldoAy6WkEA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=XAbD3I9PDrnSMThV5XoS:22 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDAyNiBTYWx0ZWRfXwiSZxTDRm2q5 6dH8yzhXRPGrXL7nXmPt6X/wU7E84g9jdk5QQy0yZu/d70sK0QT/68e/NWk76asFHf+UtSYigS/ U+Anq2Ur1xuRjaGPnTpDuyYdNUoxdlSN7JfO6/IlvbvZRv8v8X1lfh4EPTH4nPTSaRz0cBKoW3K
 pgwUq2ga/V+YU8WOfMdN/BlaovIRmzy1FBTIdCv8+zAQHRXKS8JoR8XISCjRoo5WomVnz2bLhuJ SMOK6T7VC8iMBQqdoA9Snmx6LXQWfDNf/MBCUhhyQuRY03x1ksM6YHpgOm0v8APRM8VBMG2jHoa tu8jwdg4zxXpMCQCj5TJhnBP2vtKH96DNwmBn64GGMau0fxdXXyc8DNOqbESvg5D4zjXRoXKRW9
 jdj/JKyy8OyeuRR+MTJ089J0+bx66CjLM21KIqaGoF1wyIb5IM5saDRb/WXtMyTDlB7jBwf1
X-Proofpoint-ORIG-GUID: hT8lnigmCfYN0ur1y_wV3m1Tq7cXGiMF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=844 adultscore=0 spamscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506130026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 03:44:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218570

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/424

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup/CVE-2025-32050.patch      | 29 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32050.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32050.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-32050.patch
new file mode 100644
index 0000000000..e5a4d747a1
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-32050.patch
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
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
index 62dc123b79..abfbf0c7e0 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -38,6 +38,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32052.patch \
            file://CVE-2025-32051-1.patch \
            file://CVE-2025-32051-2.patch \
+           file://CVE-2025-32050.patch \
           "
 SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
-- 
2.34.1


