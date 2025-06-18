Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E54C71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 02:59:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.37495.1750215590025089162
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 19:59:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82648703cf=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I2v3Pk005276
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 02:59:49 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 478xa1m2gu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 02:59:48 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 17 Jun 2025 19:59:47 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 17 Jun 2025 19:59:47 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH V2 01/11] libsoup: patch CVE-2025-4476
Date: Wed, 18 Jun 2025 10:59:35 +0800
Message-ID: <20250618025945.2504711-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250618025945.2504711-1-changqing.li@windriver.com>
References: <20250618025945.2504711-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=PuiTbxM3 c=1 sm=1 tr=0 ts=68522ba4 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=GHR8O2WEAAAA:20 a=fk1lIlRQAAAA:8 a=_enOPnqeAAAA:8 a=20KFwNOVAAAA:8 a=NolvJAtuIQBC2-SIXlgA:9
 a=U75ogvRika4pmaD_UPO0:22 a=XAbD3I9PDrnSMThV5XoS:22
X-Proofpoint-ORIG-GUID: _rHed51pEuSinZaSQ2Xh-Ah67ebpSyjV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDAyNCBTYWx0ZWRfX0w74A6aFKbR/ pLmRzhbaP1or1L9U8ITTX1Z1K4LTfU0A8TIzKpOxtNqStL6aWTJVLOmUYZ9Dy9UH7lXMGbPybwI Bx6FfjGlrxmrzbEYABO5Wa23+srciZL0EnnfN7SHx0oJ4lcRK0abEHadv1G11dJXJFMe2UWhPK5
 0pQ29naescGkytrWzumjZW8Wpi7t0JbMRcEIP1xVThwwzhhlaLEJvYDiJ4lsv5qsUlw/PDF12uH d2FqtI3tzZGdLSHZFPtTtakJtWr2d6Hpr0TpIq6FQj0X2oSjqmgef+OBhBFDWS05Z9f80JfZ4h3 /WuDSgSpaUFDTWJ5SPnfPDoTU6POoUP+APnerGQEnSv1wd6ar2dufNEMJNN9TujdkhT511Lnb+v
 sBjOoB7WVyJCZRw8ug7ZMR5zMYIbFayIns+MouaubtxJw2T6BS6Nus+Dl3Kmrrchm9Fh6arI
X-Proofpoint-GUID: _rHed51pEuSinZaSQ2Xh-Ah67ebpSyjV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=991 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506180024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 02:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218957

From: Ashish Sharma <asharma@mvista.com>

Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/e64c221f9c7d09b48b610c5626b3b8c400f0907c]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup/CVE-2025-4476.patch       | 38 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4476.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-4476.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-4476.patch
new file mode 100644
index 00000000000..cd5619d6209
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-4476.patch
@@ -0,0 +1,38 @@
+From e64c221f9c7d09b48b610c5626b3b8c400f0907c Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/e64c221f9c7d09b48b610c5626b3b8c400f0907c]
+CVE: CVE-2025-4476
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+
+ libsoup/auth/soup-auth-digest.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsoup/auth/soup-auth-digest.c b/libsoup/auth/soup-auth-digest.c
+index d8bb2910..292f2045 100644
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
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
index 67aa180612e..83ed88e785c 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -36,6 +36,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32052.patch \
            file://CVE-2025-32053.patch \
            file://CVE-2025-46420.patch \
+           file://CVE-2025-4476.patch \
           "
 SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
-- 
2.34.1


