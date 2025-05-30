Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF02C5B558
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 07:13:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1357.1748589197902454773
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 00:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8245d0438c=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U415Fp011491
	for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 07:13:17 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u5396879-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 07:13:16 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 30 May 2025 00:12:56 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 30 May 2025 00:12:55 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [walnascar][PATCH 05/15] libsoup-2.4: fix CVE-2025-32906
Date: Fri, 30 May 2025 15:12:59 +0800
Message-ID: <20250530071309.1603334-6-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250530071309.1603334-1-changqing.li@windriver.com>
References: <20250530071309.1603334-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDA1OSBTYWx0ZWRfX4eB8+9oY7xjO q/9i76KKiasvv1JBqDLxd1QPg0O3bTqx0MHtpqVI9mCI6qcGCLAzGSrph5U/N6mW1nW5zC8+MWy y0NCMHt4DXc/P3LTA2ptl/26IRC5rL2izCI8ELPH4hzdRdAKU9AwUWUIA2UWiD9R7GkeJxejs1U
 YCBvVOxKXSgJR4tD2ZCwpdFmTNnICO1yzZ6iLrC+0AOmhEBhfmx2TSbOtKGWcajvwyOBCZrmquj HqixZClkqN7f8PouZ+94KlG3/M6qGK/+/1jpKYwFWNsE/lNu7bnudhgIb0bYXs7EoNYMhSq5fny djz2HWGPDJaFLHSsn3yK4m60fg3glGIAwT9/NTwuyecQfnAPr4m68nLIo6HOUHR0Waf/l6lE2Gg
 jGiQ/me1SkpFBext1mKFJKnpZyuUVYPnuSKDi1voCE4wprtd2vl+CBSTHT+/yA+DfHuBcP//
X-Authority-Analysis: v=2.4 cv=NsDRc9dJ c=1 sm=1 tr=0 ts=68395a8c cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=dt9VzEwgFbYA:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=V2sgnzSHAAAA:8 a=HORPgCXZuz7RhFxCGcgA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-ORIG-GUID: rnDJTQn-5YmMwUc3u6_E1mudJbmj7Kri
X-Proofpoint-GUID: rnDJTQn-5YmMwUc3u6_E1mudJbmj7Kri
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_03,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=933
 impostorscore=0 mlxscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505300059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 07:13:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217474

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/404

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-32906.patch  | 71 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906.patch
new file mode 100644
index 0000000000..c33ebf8056
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906.patch
@@ -0,0 +1,71 @@
+From 4b8809cca4bbcbf9514314d86227f985362258b0 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Wed, 12 Feb 2025 11:30:02 -0600
+Subject: [PATCH] headers: Handle parsing only newlines
+
+Closes #404
+Closes #407
+
+CVE: CVE-2025-32906
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/af5b9a4a3945c52b940d5ac181ef51bb12011f1f]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-headers.c      |  4 ++--
+ tests/header-parsing-test.c | 11 +++++++++++
+ 2 files changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
+index e5d3c03..87bb3dc 100644
+--- a/libsoup/soup-headers.c
++++ b/libsoup/soup-headers.c
+@@ -185,7 +185,7 @@ soup_headers_parse_request (const char          *str,
+ 	/* RFC 2616 4.1 "servers SHOULD ignore any empty line(s)
+ 	 * received where a Request-Line is expected."
+ 	 */
+-	while ((*str == '\r' || *str == '\n') && len > 0) {
++	while (len > 0 && (*str == '\r' || *str == '\n')) {
+ 		str++;
+ 		len--;
+ 	}
+@@ -369,7 +369,7 @@ soup_headers_parse_response (const char          *str,
+ 	 * after a response, which we then see prepended to the next
+ 	 * response on that connection.
+ 	 */
+-	while ((*str == '\r' || *str == '\n') && len > 0) {
++	while (len > 0 && (*str == '\r' || *str == '\n')) {
+ 		str++;
+ 		len--;
+ 	}
+diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
+index c1d3b33..b811115 100644
+--- a/tests/header-parsing-test.c
++++ b/tests/header-parsing-test.c
+@@ -6,6 +6,10 @@ typedef struct {
+ 	const char *name, *value;
+ } Header;
+ 
++static char only_newlines[] = {
++        '\n', '\n', '\n', '\n'
++};
++
+ static struct RequestTest {
+ 	const char *description;
+ 	const char *bugref;
+@@ -445,6 +449,13 @@ static struct RequestTest {
+ 	  SOUP_STATUS_BAD_REQUEST,
+            NULL, NULL, -1,
+ 	  { { NULL } }
++	},
++
++	{ "Only newlines", NULL,
++	  only_newlines, sizeof (only_newlines),
++	  SOUP_STATUS_BAD_REQUEST,
++           NULL, NULL, -1,
++	  { { NULL } }
+ 	}
+ };
+ static const int num_reqtests = G_N_ELEMENTS (reqtests);
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 64383e1221..79ffa19c20 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -20,6 +20,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32053.patch \
            file://CVE-2025-2784.patch \
            file://CVE-2024-52530.patch \
+           file://CVE-2025-32906.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.34.1


