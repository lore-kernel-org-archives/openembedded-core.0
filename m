Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5593AC678DA
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 06:50:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.27984.1749192609869096297
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 23:50:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8252d755fa=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565V5g4012130
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Jun 2025 23:50:09 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rw0f9-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 23:50:09 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 5 Jun 2025 23:50:07 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 5 Jun 2025 23:50:06 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH V3 03/12] libsoup: fix CVE-2025-32051
Date: Fri, 6 Jun 2025 14:49:54 +0800
Message-ID: <20250606065003.3681416-4-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250606065003.3681416-1-changqing.li@windriver.com>
References: <20250606065003.3681416-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: dBpdXxyIc7TKoCELG9RyaFhB1GyX0GMx
X-Authority-Analysis: v=2.4 cv=VIHdn8PX c=1 sm=1 tr=0 ts=68428fa1 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=sfOm8-O8AAAA:8 a=V2sgnzSHAAAA:8 a=lz8H-ZI_o7jANyl0rCQA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=TvTJqdcANYtsRzA46cdi:22 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA2MSBTYWx0ZWRfX+ZsZlvcGh1is c4XfiLlNGEO34ri4zMWGIbeQZodReLLjG54eSunNhm2+2duM9qzv4fIqrOS53gRUjWVJyTU5VlV iWg7hcBXs/15W8MfE/mfrf9dUYi2qsBbkGCw93sSTBjvHm7P9aJYu68v4V0HOfx4C74ZUB5WbLZ
 kJT1O7W/tMKGa6fBm0eLqVax4R2817wkubcWJUFEsxKxOqqhd19h7AOVwsbp26axVKLMmC8CSqy +m8GZZ5xVM5jluZs0011MKL0wmqo92q8Hx9Mn6evcdEzX3To0SoKpNaYOIRFHNQKbbWDtpGj9I7 +WCg3Q3zct6qYsG3ONLSeDmlBMBHXF4wFBS99DdHqqhcAT/4/auR/iinm//ApsjVu1qmvCAQwja
 x/Y1ZjTzvIVA6JZlynczXUx3sJKIKShUC6+kZIdtyUfF81un6+AlcSxvg+I8q1o4/1mdPIfU
X-Proofpoint-ORIG-GUID: dBpdXxyIc7TKoCELG9RyaFhB1GyX0GMx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506060061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 06:50:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218101

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/401

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsoup-3.4.4/CVE-2025-32051-1.patch      | 29 ++++++++++
 .../libsoup-3.4.4/CVE-2025-32051-2.patch      | 57 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  2 +
 3 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32051-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32051-2.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32051-1.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32051-1.patch
new file mode 100644
index 00000000000..efeda48b11f
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32051-1.patch
@@ -0,0 +1,29 @@
+From dc5db30989f385303c79ec3188c52e33f6f5886e Mon Sep 17 00:00:00 2001
+From: Ar Jun <pkillarjun@protonmail.com>
+Date: Sat, 16 Nov 2024 11:50:09 -0600
+Subject: [PATCH 1/2] Fix possible NULL deref in soup_uri_decode_data_uri
+
+CVE: CVE-2025-32051
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/0713ba4a719da938dc8facc89fca99cd0aa3069f]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-uri-utils.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libsoup/soup-uri-utils.c b/libsoup/soup-uri-utils.c
+index be2b79b..0251279 100644
+--- a/libsoup/soup-uri-utils.c
++++ b/libsoup/soup-uri-utils.c
+@@ -303,6 +303,8 @@ soup_uri_decode_data_uri (const char *uri,
+ 
+         uri_string = g_uri_to_string (soup_uri);
+         g_uri_unref (soup_uri);
++        if (!uri_string)
++                return NULL;
+ 
+         start = uri_string + 5;
+         comma = strchr (start, ',');
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32051-2.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32051-2.patch
new file mode 100644
index 00000000000..24c184bb86f
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32051-2.patch
@@ -0,0 +1,57 @@
+From 7d1557a60145927806c88d321e8322a9d9f49bb2 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Fri, 22 Nov 2024 13:39:51 -0600
+Subject: [PATCH 2/2] soup_uri_decode_data_uri(): Handle URIs with a path
+ starting with //
+
+CVE: CVE-2025-32051
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/79cfd65c9bd8024cd45dd725c284766329873709]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-uri-utils.c | 8 ++++++++
+ tests/uri-parsing-test.c | 2 ++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/libsoup/soup-uri-utils.c b/libsoup/soup-uri-utils.c
+index 0251279..1ff11cd 100644
+--- a/libsoup/soup-uri-utils.c
++++ b/libsoup/soup-uri-utils.c
+@@ -286,6 +286,7 @@ soup_uri_decode_data_uri (const char *uri,
+         gboolean base64 = FALSE;
+         char *uri_string;
+         GBytes *bytes;
++        const char *path;
+ 
+         g_return_val_if_fail (uri != NULL, NULL);
+ 
+@@ -301,6 +302,13 @@ soup_uri_decode_data_uri (const char *uri,
+         if (content_type)
+                 *content_type = NULL;
+ 
++        /* g_uri_to_string() is picky about paths that start with `//` and will assert. */
++        path = g_uri_get_path (soup_uri);
++        if (path[0] == '/' && path[1] == '/') {
++                g_uri_unref (soup_uri);
++                return NULL;
++        }
++
+         uri_string = g_uri_to_string (soup_uri);
+         g_uri_unref (soup_uri);
+         if (!uri_string)
+diff --git a/tests/uri-parsing-test.c b/tests/uri-parsing-test.c
+index 1f16273..418391e 100644
+--- a/tests/uri-parsing-test.c
++++ b/tests/uri-parsing-test.c
+@@ -141,6 +141,8 @@ static struct {
+         { "data:text/plain;base64,aGVsbG8=", "hello", "text/plain" },
+         { "data:text/plain;base64,invalid=", "", "text/plain" },
+         { "data:,", "", CONTENT_TYPE_DEFAULT },
++        { "data:.///", NULL, NULL },
++        { "data:/.//", NULL, NULL },
+ };
+ 
+ static void
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index e7dccb63802..9af7de192fa 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -38,6 +38,8 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32907-2.patch \
            file://CVE-2025-32053.patch \
            file://CVE-2025-32052.patch \
+           file://CVE-2025-32051-1.patch \
+           file://CVE-2025-32051-2.patch \
 "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.34.1


