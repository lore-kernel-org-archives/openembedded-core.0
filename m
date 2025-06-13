Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72F43C7115B
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 03:44:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1779.1749786251872374508
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 20:44:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8259073970=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D2WaIY000865
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 20:44:11 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474gq46bdq-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 20:44:11 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 12 Jun 2025 20:44:07 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 12 Jun 2025 20:44:07 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH 14/20] libsoup: fix CVE-2025-32053
Date: Fri, 13 Jun 2025 11:43:46 +0800
Message-ID: <20250613034352.175878-15-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613034352.175878-1-changqing.li@windriver.com>
References: <20250613034352.175878-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Qrde3Uyd c=1 sm=1 tr=0 ts=684b9e8b cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=_enOPnqeAAAA:8 a=sfOm8-O8AAAA:8 a=oTvTzFMrGgrRAghJrSUA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=XAbD3I9PDrnSMThV5XoS:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: CWk1tlHrhvNsoJSJ3_X8idQr-5ByUun2
X-Proofpoint-ORIG-GUID: CWk1tlHrhvNsoJSJ3_X8idQr-5ByUun2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDAyNiBTYWx0ZWRfXymdy/CGDN4Yz HuTwo5Rfowa8+xwtw5V+Er7yR6MUDxG//i0ehMd7PvwtJefpeLDAFtx113+z5Sxdo9UB7ZO3QWB 2KLl7aZ3pMOT2MYwlgOo/iWTIW5wxy7rCC1p+PrRH/om8Inzs439F3LXGzssNWAcZuT3iyBeYk3
 b66tcL3YYrJyEm/dQ4Z4QDKneNvjIQaelV+MIF/R53STpFj/gQUwCAt0Uz9AuHPTbaTYAKC653s 5hjyxmqzDVAPPGjsMCGFqtQzAz7St3REXs5zaQCqSeWm6MnZ2yviJ0TjQFX6Z+ZXuy0PLWMeD+k OqgoDXam0jIOcyXapT+4d4dG7Umu1FXdm/BxgJ82UJPVc+hn/9PsgFeHVKOkDZy3aWYjni/78+x
 VOvOzNzgiSNt0jgQZYmMyqtZiDl4A/hndV/RBL70uYFfyF3NaMvq5gFnO3IsaZafMZeYVc5H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 mlxscore=0 mlxlogscore=746
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506130026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 03:44:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218569

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/426

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup/CVE-2025-32053.patch      | 40 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32053.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32053.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-32053.patch
new file mode 100644
index 0000000000..93fa69e06c
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-32053.patch
@@ -0,0 +1,40 @@
+From 819dbc0fcf174b8182cdb279f7be15ea1cde649f Mon Sep 17 00:00:00 2001
+From: Ar Jun <pkillarjun@protonmail.com>
+Date: Mon, 18 Nov 2024 14:59:51 -0600
+Subject: [PATCH] Fix heap buffer overflow in
+ soup-content-sniffer.c:sniff_feed_or_html()
+
+CVE: CVE-2025-32053
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/commit/eaed42ca8d40cd9ab63764e3d63641180505f40a]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/content-sniffer/soup-content-sniffer.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libsoup/content-sniffer/soup-content-sniffer.c b/libsoup/content-sniffer/soup-content-sniffer.c
+index 2351c3f..23d5aaa 100644
+--- a/libsoup/content-sniffer/soup-content-sniffer.c
++++ b/libsoup/content-sniffer/soup-content-sniffer.c
+@@ -646,7 +646,7 @@ skip_insignificant_space (const char *resource, int *pos, int resource_length)
+ 	       (resource[*pos] == '\x0D')) {
+ 		*pos = *pos + 1;
+ 
+-		if (*pos > resource_length)
++		if (*pos >= resource_length)
+ 			return TRUE;
+ 	}
+ 
+@@ -709,7 +709,7 @@ sniff_feed_or_html (SoupContentSniffer *sniffer, GBytes *buffer)
+ 		do {
+ 			pos++;
+ 
+-			if (pos > resource_length)
++			if ((pos + 1) > resource_length)
+ 				goto text_html;
+ 		} while (resource[pos] != '>');
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
index ccfd69cd23..edf5de8453 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -34,6 +34,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-4969.patch \
            file://CVE-2025-32907-1.patch \
            file://CVE-2025-32907-2.patch \
+           file://CVE-2025-32053.patch \
           "
 SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
-- 
2.34.1


