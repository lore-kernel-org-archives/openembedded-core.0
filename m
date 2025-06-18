Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59DD9C7115D
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 02:59:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.37431.1750215593504034261
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 19:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82648703cf=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I0sJPB022283
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 02:59:52 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4790283yr5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 02:59:52 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 17 Jun 2025 19:59:50 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 17 Jun 2025 19:59:50 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH V2 04/11] libsoup: fix CVE-2025-32051
Date: Wed, 18 Jun 2025 10:59:38 +0800
Message-ID: <20250618025945.2504711-5-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250618025945.2504711-1-changqing.li@windriver.com>
References: <20250618025945.2504711-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDAyNCBTYWx0ZWRfX3H0RxcDB2xES W06vfLYButR0zbalGgUYSTBno/E+mHieICcxN7WnHbAj70g8OFx8XC+43Xef+PZSVEfMHZoT5KC yUONfPjwZzaidp5D1RCCntLn6KvwsD8ImhEtw0qfricg3n4/29Y5iLHj+19Cv3i1POv4B/zAeaG
 dHZLLNdRpzitfV4jTqWutWzMaqWn0WLNiWc4hN6k48yvaWBzAX4UWw+1u3S+q95wfvXd/M2PWzu Pjs1VFGVyH4DmhcR9EW8CaVPHOA7b126V8zDgW18tmIst3XlJlfZOFYH5Z+e0WOJl6y/6SrRfWh iAMFIv3ekR1ETOoK+NwwycF2JOgttLrjeFzgLUsEXIFH8oBk4ocqcY29l/RvRqa0vwmDFfqF/OZ
 KanZZq15ml1VefDkApjwKk/o+AmmL3N1Sk11SlQfNi+3rX+5AGe6gx4ncCLtHt7Rh+WpSc+B
X-Proofpoint-GUID: 1fVyW25iQXjOz740aOYEyX9Q377_eOJo
X-Authority-Analysis: v=2.4 cv=ar2yCTZV c=1 sm=1 tr=0 ts=68522ba8 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=_enOPnqeAAAA:8 a=sfOm8-O8AAAA:8 a=V2sgnzSHAAAA:8
 a=lz8H-ZI_o7jANyl0rCQA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=XAbD3I9PDrnSMThV5XoS:22 a=TvTJqdcANYtsRzA46cdi:22 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-ORIG-GUID: 1fVyW25iQXjOz740aOYEyX9Q377_eOJo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 bulkscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506180024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 02:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218960

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/401

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup/CVE-2025-32051-1.patch    | 29 ++++++++++
 .../libsoup/libsoup/CVE-2025-32051-2.patch    | 57 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |  2 +
 3 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32051-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32051-2.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32051-1.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-32051-1.patch
new file mode 100644
index 00000000000..efeda48b11f
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-32051-1.patch
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
diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32051-2.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-32051-2.patch
new file mode 100644
index 00000000000..24c184bb86f
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-32051-2.patch
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
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
index 90733a73e85..be29ff0e5d0 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -40,6 +40,8 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-4969.patch \
            file://CVE-2025-32907-1.patch \
            file://CVE-2025-32907-2.patch \
+           file://CVE-2025-32051-1.patch \
+           file://CVE-2025-32051-2.patch \
           "
 SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
-- 
2.34.1


