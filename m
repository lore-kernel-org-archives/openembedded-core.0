Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D806EC5AD49
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 07:13:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1363.1748589204950184633
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 00:13:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8245d0438c=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U5A3OB003997
	for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 07:13:24 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u3b1699v-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 07:13:23 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 30 May 2025 00:13:03 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 30 May 2025 00:13:03 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [walnascar][PATCH 12/15] libsoup-2.4: fix CVE-2025-32910
Date: Fri, 30 May 2025 15:13:06 +0800
Message-ID: <20250530071309.1603334-13-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250530071309.1603334-1-changqing.li@windriver.com>
References: <20250530071309.1603334-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: LNn-uPufD_6KD3nWxcV-CvNm6Wzwm28f
X-Authority-Analysis: v=2.4 cv=VpYjA/2n c=1 sm=1 tr=0 ts=68395a93 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=dt9VzEwgFbYA:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=HSGOHi6-cxt6zTWKGw0A:9 a=QrmQ1pHUhKzEwlcV:21
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: LNn-uPufD_6KD3nWxcV-CvNm6Wzwm28f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDA1OSBTYWx0ZWRfX0meb0pYmLtKz noxIlD8s1wtaHsiDRd8qkVG3OnZ4rStv9uxEtJAgQrFhs2zcavTypZNX/P3JFBGPdBFWSyvM4fC BiAkzrzIk9ulZ+YbL8Lg8Sq73LK+PbcvTZHNGQxE5s5PPDktepneGKqrEeHC6KNJOYP+V4hqOHS
 17qWq9yvjI6cpsp+ObxOVJFG3872510bRvtpFlXAdtG9fv7EAYIHuA/0c8OaJuPcTuYpoKCfTp5 g//OkOYmrEFoIPHnZy81puYTsUYYzZY7RkqrxYwgEAEwJpPOnQL4Rkdv6fNLuAdJsmcZN3qfg1S uOAsFp0m8tDhLmYBjbjGJNNjOI1CNnckfwjK9OxKw85K5sXTKRaSrYpf7NaBViVyHi+YdsPjW1U
 arZcZMzIBVQVHHhePQLbXb/sClq48aXdtcKJ0w5G9MB6/UjAWCkafoGYh3RWkMigEawd3epx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_03,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=872 malwarescore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505300059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 07:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217481

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/432

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsoup-2.4/CVE-2025-32910-1.patch        | 32 +++++++
 .../libsoup-2.4/CVE-2025-32910-2.patch        | 94 +++++++++++++++++++
 .../libsoup-2.4/CVE-2025-32910-3.patch        | 28 ++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  3 +
 4 files changed, 157 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch
new file mode 100644
index 0000000000..c1dc6860f2
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch
@@ -0,0 +1,32 @@
+From a7e711d0f162c6edc8acad2a96981d4890784ea3 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 12 May 2025 17:02:55 +0800
+Subject: [PATCH] auth-digest: Handle missing realm/nonce in authenticate
+ header
+
+CVE: CVE-2025-32910
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/417/diffs?commit_id=e40df6d48a1cbab56f5d15016cc861a503423cfe]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-auth-digest.c |  3 +++
+ 1 files changed, 3 insertions(+)
+
+diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
+index e8ba990..0ab3499 100644
+--- a/libsoup/soup-auth-digest.c
++++ b/libsoup/soup-auth-digest.c
+@@ -142,6 +142,9 @@ soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
+ 	guint qop_options;
+ 	gboolean ok = TRUE;
+ 
++	 if (!soup_auth_get_realm (auth))
++		return FALSE;
++
+ 	g_free (priv->domain);
+ 	g_free (priv->nonce);
+ 	g_free (priv->opaque);
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch
new file mode 100644
index 0000000000..019a35e3be
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch
@@ -0,0 +1,94 @@
+From eccfca1074fc485a0b60dfb9c8385429a226bf73 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 16 May 2025 13:19:38 +0800
+Subject: [PATCH] auth-digest: Handle missing nonce
+
+CVE: CVE-2025-32910
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/417/diffs?commit_id=405a8a34597a44bd58c4759e7d5e23f02c3b556a]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-auth-digest.c | 45 ++++++++++++++++++++++++++++----------
+ 1 files changed, 28 insertions(+), 10 deletions(-)
+
+diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
+index 0ab3499..10a8591 100644
+--- a/libsoup/soup-auth-digest.c
++++ b/libsoup/soup-auth-digest.c
+@@ -132,6 +132,19 @@ soup_auth_digest_get_qop (SoupAuthDigestQop qop)
+ 	return g_string_free (out, FALSE);
+ }
+ 
++static gboolean
++validate_params (SoupAuthDigest *auth_digest)
++{
++	SoupAuthDigestPrivate *priv = soup_auth_digest_get_instance_private (auth_digest);
++
++	if (priv->qop || priv->algorithm == SOUP_AUTH_DIGEST_ALGORITHM_MD5_SESS) {
++		if (!priv->nonce)
++			return FALSE;
++	}
++
++	return TRUE;
++}
++
+ static gboolean
+ soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
+ 			 GHashTable *auth_params)
+@@ -169,17 +182,22 @@ soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
+ 	if (priv->algorithm == -1)
+ 		ok = FALSE;
+ 
+-	stale = g_hash_table_lookup (auth_params, "stale");
+-	if (stale && !g_ascii_strcasecmp (stale, "TRUE") && *priv->hex_urp)
+-		recompute_hex_a1 (priv);
+-	else {
+-		g_free (priv->user);
+-		priv->user = NULL;
+-		g_free (priv->cnonce);
+-		priv->cnonce = NULL;
+-		memset (priv->hex_urp, 0, sizeof (priv->hex_urp));
+-		memset (priv->hex_a1, 0, sizeof (priv->hex_a1));
+-        }
++	if (!validate_params (auth_digest))
++		ok = FALSE;
++
++	if (ok) {
++		stale = g_hash_table_lookup (auth_params, "stale");
++		if (stale && !g_ascii_strcasecmp (stale, "TRUE") && *priv->hex_urp)
++			recompute_hex_a1 (priv);
++		else {
++			g_free (priv->user);
++			priv->user = NULL;
++			g_free (priv->cnonce);
++			priv->cnonce = NULL;
++			memset (priv->hex_urp, 0, sizeof (priv->hex_urp));
++			memset (priv->hex_a1, 0, sizeof (priv->hex_a1));
++		}
++	}
+ 
+ 	return ok;
+ }
+@@ -359,6 +377,8 @@ soup_auth_digest_compute_response (const char        *method,
+ 	if (qop) {
+ 		char tmp[9];
+ 
++		g_assert (cnonce);
++
+ 		g_snprintf (tmp, 9, "%.8x", nc);
+ 		g_checksum_update (checksum, (guchar *)tmp, strlen (tmp));
+ 		g_checksum_update (checksum, (guchar *)":", 1);
+@@ -422,6 +442,9 @@ soup_auth_digest_get_authorization (SoupAuth *auth, SoupMessage *msg)
+ 	g_return_val_if_fail (uri != NULL, NULL);
+ 	url = soup_uri_to_string (uri, TRUE);
+ 
++	g_assert (priv->nonce);
++	g_assert (!priv->qop || priv->cnonce);
++
+ 	soup_auth_digest_compute_response (msg->method, url, priv->hex_a1,
+ 					   priv->qop, priv->nonce,
+ 					   priv->cnonce, priv->nc,
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch
new file mode 100644
index 0000000000..bdf4d64ca3
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch
@@ -0,0 +1,28 @@
+From 74c95d54fe42041fe161cb74c76d942ffd37a5dd Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 16 May 2025 13:21:43 +0800
+Subject: [PATCH] auth-digest: Fix leak
+
+CVE: CVE-2025-32910
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/417/diffs?commit_id=ea16eeacb052e423eb5c3b0b705e5eab34b13832]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-auth-digest.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
+index 10a8591..6d965d2 100644
+--- a/libsoup/soup-auth-digest.c
++++ b/libsoup/soup-auth-digest.c
+@@ -66,6 +66,7 @@ soup_auth_digest_finalize (GObject *object)
+ 	g_free (priv->nonce);
+ 	g_free (priv->domain);
+ 	g_free (priv->cnonce);
++	g_free (priv->opaque);
+ 
+ 	memset (priv->hex_urp, 0, sizeof (priv->hex_urp));
+ 	memset (priv->hex_a1, 0, sizeof (priv->hex_a1));
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 510d1128db..b8b7bc1df7 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -27,6 +27,9 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32050.patch \
            file://CVE-2025-32052.patch \
            file://CVE-2025-32909.patch \
+           file://CVE-2025-32910-1.patch \
+           file://CVE-2025-32910-2.patch \
+           file://CVE-2025-32910-3.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.34.1


