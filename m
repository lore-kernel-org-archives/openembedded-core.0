Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD89EC5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 04:38:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.26672.1749184685498847577
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 21:38:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8252d755fa=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5564M0pd023495;
	Thu, 5 Jun 2025 21:38:05 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rvyqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 05 Jun 2025 21:38:04 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 5 Jun 2025 21:38:04 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 5 Jun 2025 21:38:03 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <steve@sakoman.com>
Subject: [walnascar][PATCH V2] libsoup-2.4: fix CVE-2025-46421
Date: Fri, 6 Jun 2025 12:38:03 +0800
Message-ID: <20250606043803.2089139-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <18443C9D1F2E161A.18767@lists.openembedded.org>
References: <18443C9D1F2E161A.18767@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA0MCBTYWx0ZWRfX/PyRcyLS+39v 38ApATkVNoGvzdgvMYuiEXQxBW3c4BXuDQiqqP6hnqvf5/aOWtFaMLwd9aearlmHGBlEWhqO/Dm tQQkofrE8qhJRVizEBJsoJnpwo/gsMC11OCARGdi5lpEiUUrn3IhooqZpmjPxxlfr0kx5hFbQf0
 6JRbqnr8MnGrsHBvZcIjmBzuReCeeDlQg5agpUr4USSqhGjz+IqM6B0aBYBbxyFzr3JCBtVv6pJ Nito5ctAvntzNaEEy0QhLW5F5lS8VJYAYM8tc/SwOfC00BScF2hgE8UE7ziPOIgXt8crKfd9kQ7 TT7O1a8VXnEqCXPk95HVTX40kcDp7BU2z9T6jkKzcET3n1wvSD1v1RVqFzLrJY8dtxKiy8dYz0W
 rZIg6GwX3xRuN1x+b/n9qgH2IRRADRvL3vo0N2WNK5nI5xgeUmDmiEReWav62mljmvSVcTov
X-Authority-Analysis: v=2.4 cv=PvyTbxM3 c=1 sm=1 tr=0 ts=684270ac cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=V2sgnzSHAAAA:8 a=eXHZBV4ZpkldoAy6WkEA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-GUID: HWNkr1dQlp2oQQdiHPTuoMzWWTNQpA-f
X-Proofpoint-ORIG-GUID: HWNkr1dQlp2oQQdiHPTuoMzWWTNQpA-f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506060040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 04:38:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218093

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/439

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-46421.patch  | 47 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
new file mode 100644
index 0000000000..9c62b85936
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
@@ -0,0 +1,47 @@
+From 5eb225f02bb35de56cfeedd87bde716bf1cb750b Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Wed, 5 Feb 2025 16:18:10 -0600
+Subject: [PATCH] session: Strip authentication credentails on
+ cross-origin redirect
+
+This should match the behavior of Firefox and Safari but not of Chromium.
+
+CVE: CVE-2025-46421
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/436/diffs?commit_id=3e5c26415811f19e7737238bb23305ffaf96f66b]
+
+Test code not added since it included some headers not in version 2.74.3
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-session.c |  6 ++++++
+ 1 files changed, 6 insertions(+)
+
+diff --git a/libsoup/soup-session.c b/libsoup/soup-session.c
+index 83421ef..8d6ac61 100644
+--- a/libsoup/soup-session.c
++++ b/libsoup/soup-session.c
+@@ -1189,12 +1189,18 @@ soup_session_redirect_message (SoupSession *session, SoupMessage *msg)
+ 						   SOUP_ENCODING_NONE);
+ 	}
+ 
++	/* Strip all credentials on cross-origin redirect. */
++	if (!soup_uri_host_equal (soup_message_get_uri (msg), new_uri)) {
++		soup_message_headers_remove (msg->request_headers, "Authorization");
++		soup_message_set_auth (msg, NULL);
++	}
++
+ 	soup_message_set_uri (msg, new_uri);
+ 	soup_uri_free (new_uri);
+ 
+ 	soup_session_requeue_message (session, msg);
+ 	return TRUE;
+-}
++}
+ 
+ static void
+ redirect_handler (SoupMessage *msg, gpointer user_data)
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 1ef9303fb8..3b460852f3 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -23,6 +23,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32906.patch \
            file://CVE-2025-32914.patch \
            file://CVE-2025-46420.patch \
+           file://CVE-2025-46421.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.34.1


