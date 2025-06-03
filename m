Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0071BC5AE59
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 05:21:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4391.1748928061112905019
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 22:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8249232b55=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5534KBeJ030988
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Jun 2025 22:21:01 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rrh7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 22:21:00 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 2 Jun 2025 22:20:25 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 2 Jun 2025 22:20:25 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [walnascar][PATCH 2/4] libsoup: fix CVE-2025-4476
Date: Tue, 3 Jun 2025 13:20:55 +0800
Message-ID: <20250603052057.40111-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250603052057.40111-1-changqing.li@windriver.com>
References: <20250603052057.40111-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 0okgl9q1_l5VaAuNl4vwcEahGqPMV3zu
X-Authority-Analysis: v=2.4 cv=VIHdn8PX c=1 sm=1 tr=0 ts=683e863c cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=eXHZBV4ZpkldoAy6WkEA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA0NCBTYWx0ZWRfX06Dowi65cMOL m8PvfHm8I2gWqv609v+oyqdf4x9y6/mpqOk73i3ZVY+cUTm+AGY3pN0qC5bi191hE9G05E/K7sp 2juOH8bVVBBAPrNWGrtNEQkvupMOILduCEVGJDncLMQl4OCxpwsOSdJHFcS/Kce9GUdzjcPGNCF
 oEtjFyxsd34sQ7Rbp8JnZM9bkEQfnCvat7IVYGwU5xkQhXkM1mFuYQC2dlF+F0RneN9BxrwzbfZ B2tzZdrgKAJVrsGtZw+VmJVp1mGLRaVCeD/6BFSBWsmsrR3EFlxYJ3gadVHkOkm1b/DeF1w2Ozy Cz3xsJB3ajTxK8H8uh4jm6xDaF3AMqBCk69dRdUUFhCgdkx9H7+twhVIwfI+fKNrwvq9VAFMQ2w
 m1vQu9G/gYVDuq58fdVf8S7VwGEkEfwICIV3KIYx1ii6lk0OFcW2Y/+GzsTajpyUcn+TB3gS
X-Proofpoint-ORIG-GUID: 0okgl9q1_l5VaAuNl4vwcEahGqPMV3zu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=937
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506030044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 05:21:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217754

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/440

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsoup/libsoup/CVE-2025-4476.patch       | 39 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.6.5.bb |  3 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4476.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-4476.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-4476.patch
new file mode 100644
index 0000000000..d0b1f12709
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-4476.patch
@@ -0,0 +1,39 @@
+From 71d33e37139fee6216ad2bf4e926f987076a6cff Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Thu, 8 May 2025 09:27:01 -0500
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
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/457/diffs?commit_id=e64c221f9c7d09b48b610c5626b3b8c400f0907c]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.c
+---
+ libsoup/auth/soup-auth-digest.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsoup/auth/soup-auth-digest.c b/libsoup/auth/soup-auth-digest.c
+index d8bb291..292f204 100644
+--- a/libsoup/auth/soup-auth-digest.c
++++ b/libsoup/auth/soup-auth-digest.c
+@@ -220,7 +220,7 @@ soup_auth_digest_get_protection_space (SoupAuth *auth, GUri *source_uri)
+ 			if (uri &&
+                             g_strcmp0 (g_uri_get_scheme (uri), g_uri_get_scheme (source_uri)) == 0 &&
+ 			    g_uri_get_port (uri) == g_uri_get_port (source_uri) &&
+-			    !strcmp (g_uri_get_host (uri), g_uri_get_host (source_uri)))
++			    !g_strcmp0 (g_uri_get_host (uri), g_uri_get_host (source_uri)))
+ 				dir = g_strdup (g_uri_get_path (uri));
+ 			else
+ 				dir = NULL;
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.6.5.bb b/meta/recipes-support/libsoup/libsoup_3.6.5.bb
index 2faf50c223..2bed009e0a 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.5.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.5.bb
@@ -12,7 +12,8 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
-           file://CVE-2025-32914.patch"
+           file://CVE-2025-32914.patch \
+           file://CVE-2025-4476.patch"
 SRC_URI[sha256sum] = "6891765aac3e949017945c3eaebd8cc8216df772456dc9f460976fbdb7ada234"
 
 PROVIDES = "libsoup-3.0"
-- 
2.34.1


