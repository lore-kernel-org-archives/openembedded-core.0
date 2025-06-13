Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D86C61DB2
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 03:44:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1725.1749786257703652637
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 20:44:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8259073970=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D3OHJm017774
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 20:44:17 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474mxm66y1-14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 20:44:16 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 12 Jun 2025 20:44:14 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 12 Jun 2025 20:44:13 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH 20/20] libsoup: fix CVE-2025-2784
Date: Fri, 13 Jun 2025 11:43:52 +0800
Message-ID: <20250613034352.175878-21-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613034352.175878-1-changqing.li@windriver.com>
References: <20250613034352.175878-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: dlCicCkxzgZnhKBqFDj3nmnWYSCBMEe3
X-Authority-Analysis: v=2.4 cv=L74dQ/T8 c=1 sm=1 tr=0 ts=684b9e91 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=GHR8O2WEAAAA:20 a=QIhr-27iAAAA:8 a=SSmOFEACAAAA:8 a=L3Y5zZzAAAAA:8 a=t7CeM3EgAAAA:8 a=_enOPnqeAAAA:8
 a=V2sgnzSHAAAA:8 a=1WiJ8EELnH8tvs35IkwA:9 a=cgaYBWEFosGJW4rWv5Lf:22 a=FdTzh2GWekK77mhwV6Dw:22 a=XAbD3I9PDrnSMThV5XoS:22 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDAyNiBTYWx0ZWRfXwGDeXX6NriQk gz7Yhxw49KhTYTCoQ+Qi/gsp7+RZi6qAhZKB+xNGfkxsCA+musX6MXjMdOaJ8p95x6Us5oNi49S gKYX0jNeC1H2gNH/X/1q3brbkMJ0soZVCKTzNGSN155l6Q3diqr7UG5a7CQMgrftRzoYZ7EKV3Y
 sFL8qi8K69hSTNZ33BGI1jfg1OoHyaAptXw3pZE4igVL34mTejPG9it1iXroeZhmrc+QFP0Ribc 21U1FFBiNECmublPxyucBIDnlGFzqwNPgMRDFZaCv57tAOzrcEs6MOEa/wMWu8iRMgUhXq78JFR s7h4tFE1Kgf6aZwiGgl97U4SbTCE0TgHcbDSSX4dJVMIFVbR9lcbbYOemPS9UMpFCk1Y5UeirfC
 ttP1ktomg8jQiFOA+aQtJ6hdSyi5bQfJ5ddPMyGtnP1UtF7R+QwW+vmyI5KDA9IIa3ibfhic
X-Proofpoint-ORIG-GUID: dlCicCkxzgZnhKBqFDj3nmnWYSCBMEe3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=949 adultscore=0 spamscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506130026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 03:44:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218573

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/422

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup/CVE-2025-2784.patch       | 137 ++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |   1 +
 2 files changed, 138 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-2784.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-2784.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-2784.patch
new file mode 100644
index 0000000000..a106355fea
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-2784.patch
@@ -0,0 +1,137 @@
+From eccf5de94afbd32acd78c00c685b30cfa0f44fe4 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Wed, 5 Feb 2025 14:39:42 -0600
+Subject: [PATCH] Fix CVE-2025-2784
+
+CVE: CVE-2025-2784
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/435/diffs?commit_id=242a10fbb12dbdc12d254bd8fc8669a0ac055304
+https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/442/diffs?commit_id=c415ad0b6771992e66c70edf373566c6e247089d]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ .../content-sniffer/soup-content-sniffer.c    | 10 ++--
+ tests/meson.build                             |  4 +-
+ tests/sniffing-test.c                         | 48 +++++++++++++++++++
+ 3 files changed, 56 insertions(+), 6 deletions(-)
+
+diff --git a/libsoup/content-sniffer/soup-content-sniffer.c b/libsoup/content-sniffer/soup-content-sniffer.c
+index 6ca9cc9..3d0e831 100644
+--- a/libsoup/content-sniffer/soup-content-sniffer.c
++++ b/libsoup/content-sniffer/soup-content-sniffer.c
+@@ -635,8 +635,11 @@ sniff_text_or_binary (SoupContentSniffer *sniffer, GBytes *buffer)
+ }
+ 
+ static gboolean
+-skip_insignificant_space (const char *resource, int *pos, int resource_length)
++skip_insignificant_space (const char *resource, gsize *pos, gsize resource_length)
+ {
++        if (*pos >= resource_length)
++	        return TRUE;
++
+ 	while ((resource[*pos] == '\x09') ||
+ 	       (resource[*pos] == '\x20') ||
+ 	       (resource[*pos] == '\x0A') ||
+@@ -656,7 +659,7 @@ sniff_feed_or_html (SoupContentSniffer *sniffer, GBytes *buffer)
+ 	gsize resource_length;
+ 	const char *resource = g_bytes_get_data (buffer, &resource_length);
+ 	resource_length = MIN (512, resource_length);
+-	int pos = 0;
++	gsize pos = 0;
+ 
+ 	if (resource_length < 3)
+ 		goto text_html;
+@@ -666,9 +669,6 @@ sniff_feed_or_html (SoupContentSniffer *sniffer, GBytes *buffer)
+ 		pos = 3;
+ 
+  look_for_tag:
+-	if (pos > resource_length)
+-		goto text_html;
+-
+ 	if (skip_insignificant_space (resource, &pos, resource_length))
+ 		goto text_html;
+ 
+diff --git a/tests/meson.build b/tests/meson.build
+index 164094e..2919eef 100644
+--- a/tests/meson.build
++++ b/tests/meson.build
+@@ -93,7 +93,9 @@ tests = [
+   {'name': 'server-auth'},
+   {'name': 'server-mem-limit'},
+   {'name': 'server'},
+-  {'name': 'sniffing'},
++  {'name': 'sniffing',
++    'depends': [test_resources],
++  },
+   {'name': 'socket'},
+   {'name': 'ssl',
+    'dependencies': [gnutls_dep],
+diff --git a/tests/sniffing-test.c b/tests/sniffing-test.c
+index 6116719..7857732 100644
+--- a/tests/sniffing-test.c
++++ b/tests/sniffing-test.c
+@@ -342,6 +342,52 @@ test_disabled (gconstpointer data)
+ 	g_uri_unref (uri);
+ }
+ 
++static const gsize MARKUP_LENGTH = strlen ("<!--") + strlen ("-->");
++
++static void
++do_skip_whitespace_test (void)
++{
++        SoupContentSniffer *sniffer = soup_content_sniffer_new ();
++        SoupMessage *msg = soup_message_new (SOUP_METHOD_GET, "http://example.org");
++        const char *test_cases[] = {
++                "",
++                "<rdf:RDF",
++                "<rdf:RDFxmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"",
++                "<rdf:RDFxmlns=\"http://purl.org/rss/1.0/\"",
++        };
++
++        soup_message_headers_set_content_type (soup_message_get_response_headers (msg), "text/html", NULL);
++
++        for (guint i = 0; i < G_N_ELEMENTS (test_cases); i++) {
++                const char *trailing_data = test_cases[i];
++                gsize leading_zeros = 512 - MARKUP_LENGTH - strlen (trailing_data);
++                gsize testsize = MARKUP_LENGTH + leading_zeros + strlen (trailing_data);
++                guint8 *data = g_malloc0 (testsize);
++                guint8 *p = data;
++                char *content_type;
++                GBytes *buffer;
++
++                // Format of <!--[0x00 * $leading_zeros]-->$trailing_data
++                memcpy (p, "<!--", strlen ("<!--"));
++                p += strlen ("<!--");
++                p += leading_zeros;
++                memcpy (p, "-->", strlen ("-->"));
++                p += strlen ("-->");
++                if (strlen (trailing_data))
++                        memcpy (p, trailing_data, strlen (trailing_data));
++                // Purposefully not NUL terminated.                
++
++                buffer = g_bytes_new_take (g_steal_pointer (&data), testsize);
++                content_type = soup_content_sniffer_sniff (sniffer, msg, buffer, NULL);
++
++                g_free (content_type);
++                g_bytes_unref (buffer);
++        }
++
++        g_object_unref (msg);
++        g_object_unref (sniffer);
++}
++
+ int
+ main (int argc, char **argv)
+ {
+@@ -517,6 +563,8 @@ main (int argc, char **argv)
+ 			      "/text_or_binary/home.gif",
+ 			      test_disabled);
+ 
++	g_test_add_func ("/sniffing/whitespace", do_skip_whitespace_test);
++
+ 	ret = g_test_run ();
+ 
+ 	g_uri_unref (base_uri);
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
index 57f6ecac1a..7f4513afca 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -41,6 +41,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32050.patch \
            file://CVE-2025-46421.patch \
            file://CVE-2025-4948.patch \
+           file://CVE-2025-2784.patch \
           "
 SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
-- 
2.34.1


