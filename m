Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4FFEC5B554
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 07:13:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1361.1748589202260398151
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 00:13:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8245d0438c=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U5qgWt014684
	for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 07:13:21 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u539687n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 07:13:21 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 30 May 2025 00:13:00 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 30 May 2025 00:12:59 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [walnascar][PATCH 09/15] libsoup-2.4: fix CVE-2025-32050
Date: Fri, 30 May 2025 15:13:03 +0800
Message-ID: <20250530071309.1603334-10-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250530071309.1603334-1-changqing.li@windriver.com>
References: <20250530071309.1603334-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDA1OSBTYWx0ZWRfXx1gtC1XiaBBd seerDyjWWthjtznhlHCBjnCwYmpDi/C4PI4SpCTX7pxtnU5I90BSQ4Y+NPV0y1IQ23WzoWeJ9Mm XA18VKJ2gqhuXv9lsif+iFkV6bEi7xX8ldrh8Z/Ka07fGH3SOu3oUvueqyVvBhxu1TU9kiMev23
 fjyN5GaTMmzGt8tKwmTdSSfkNezydYwnz919YSXTu3FDWolxHPiLBs5h3AnhrMWUNJaOJaQwfwF DAbwc6z3cCJ9/mo6AyC9A/vFr1LjPSvKszN3FOo+ffta5QPdS106V0NuziwA8n4WWKin5IkvTIV St+UXuULgy4lbn1rDeJxBRmdC7rjaFadFJ8bPF0CGggbeFT1cE4/Oi9qJ0lLID/zfC6rii2ce24
 2M6BopfkbXr5pLRm9VD48ojvh+MsUhAPsseyfHKnRygx2btqVro7cHDMgAq3e1W1JK4GnO3a
X-Authority-Analysis: v=2.4 cv=NsDRc9dJ c=1 sm=1 tr=0 ts=68395a91 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=dt9VzEwgFbYA:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=V2sgnzSHAAAA:8 a=eXHZBV4ZpkldoAy6WkEA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-ORIG-GUID: 2O8-yt2WxSdixYDwe7aH4RId0qzXw-X_
X-Proofpoint-GUID: 2O8-yt2WxSdixYDwe7aH4RId0qzXw-X_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_03,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=839
 impostorscore=0 mlxscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505300059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 07:13:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217478

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/424

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-32050.patch  | 29 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch
new file mode 100644
index 0000000000..c032846ef0
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch
@@ -0,0 +1,29 @@
+From 5709dfffb6fdc5b66ce001bf82a755ad8ad1d992 Mon Sep 17 00:00:00 2001
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
+index 9707ca0..67905b2 100644
+--- a/libsoup/soup-headers.c
++++ b/libsoup/soup-headers.c
+@@ -902,7 +902,7 @@ append_param_quoted (GString    *string,
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
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 3b460852f3..4ddcd1734d 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -24,6 +24,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32914.patch \
            file://CVE-2025-46420.patch \
            file://CVE-2025-46421.patch \
+           file://CVE-2025-32050.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.34.1


