Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D04C5B549
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 11:34:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14440.1749036882935244144
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 04:34:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8250671ff5=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5547o5n7016945
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Jun 2025 04:34:42 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rtdcj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 04:34:42 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 4 Jun 2025 04:34:42 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 4 Jun 2025 04:34:41 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH V2 12/14] libsoup-2.4: fix CVE-2025-4476
Date: Wed, 4 Jun 2025 19:34:24 +0800
Message-ID: <20250604113426.464818-13-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250604113426.464818-1-changqing.li@windriver.com>
References: <20250604113426.464818-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: n4Dc8X_K3ymJ2mpQM6ScuPbD8bs3It7I
X-Authority-Analysis: v=2.4 cv=VIHdn8PX c=1 sm=1 tr=0 ts=68402f52 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=eXHZBV4ZpkldoAy6WkEA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA4OCBTYWx0ZWRfXz1ZgP+kIX48O O2R8C/c2/49yQstm66zF8Up9CyBMwbngQbo1Jt3RJJyXR9UmYG4Wzr9yuFsBwQLqtgEa3YrYiNE xONbNcvatYMU36FsyWtJ1cbf5z2DwgJ2kmnKO6IbnFKi1J2wEDNIX87pkHL9Z6DLaxmZbItBDar
 ajjcRkDhGAO4MVTLoFXp+yD94e9by77TOIHGb7cgWwhdJYzJfcdYijQltLmkijMIj0W0pq7cph2 X3F/kk7+/9hsvTMu9WJYSTTolY3iE5bz3RHMWc7Z+tsONSTaFyL/2RVDKx9q15v2eFrLbT3XBmm WrGqIVnhA7/T7juzxmNQ52OhAFQE0/eMaSRTzQBdULbo78hwHuSbF8lmlfYS7eWQ6L688Clc1HC
 Gj8SpvsruTZr8n7brUbdLxRocdQ7TfUAUEvKykDIppNHEqEOaUTCpoc3O/dSC8tOLqRNfc8z
X-Proofpoint-ORIG-GUID: n4Dc8X_K3ymJ2mpQM6ScuPbD8bs3It7I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=953
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506040088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 11:34:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217938

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/440

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-4476.patch   | 38 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
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
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index f2ed9945cf..b36bd64e89 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -38,6 +38,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-46421.patch \
            file://CVE-2025-4948.patch \
            file://CVE-2025-4969.patch \
+           file://CVE-2025-4476.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.34.1


