Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 894D2C5B559
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 06:50:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.27949.1749192633621468731
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 23:50:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8252d755fa=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565umRb017749
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Jun 2025 23:50:33 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rw0fg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 23:50:33 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 5 Jun 2025 23:50:17 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 5 Jun 2025 23:50:17 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH V3 12/12] libsoup: fix CVE-2025-2784
Date: Fri, 6 Jun 2025 14:50:03 +0800
Message-ID: <20250606065003.3681416-13-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250606065003.3681416-1-changqing.li@windriver.com>
References: <20250606065003.3681416-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: pv4_iWAoFqQJDccGeTh8qsxtGfajkvdG
X-Authority-Analysis: v=2.4 cv=VIHdn8PX c=1 sm=1 tr=0 ts=68428fb9 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=GHR8O2WEAAAA:20 a=QIhr-27iAAAA:8 a=SSmOFEACAAAA:8 a=L3Y5zZzAAAAA:8 a=t7CeM3EgAAAA:8 a=V2sgnzSHAAAA:8
 a=6Ti6dSN5qNGnjUcMqEUA:9 a=cgaYBWEFosGJW4rWv5Lf:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA2MiBTYWx0ZWRfXzLFS5jKPA20e WV0ytVVYVVaIuKj/0+NkJj4QQphFmki1JseaZNdcmvNJ8qn2fM0RUu6duggdqAOR4NZ12ZP3UY5 cw4VdYfUgyrs30uhOTbQjNLAij9JdrSYwi07bEQwgCQ0Y/s091Pz3chL3hDcQ80cjs/nLwYoPuY
 w2vza+NkPeElln4g8lAayznrmnxbCKwFsrYfDFE+FPkor/aeLAk9qzqy318Vk9G1yzTPioA+Vb3 eT89ioRLKDaOiDUaYIKqrnp92lpZU+DfDOzeuvNxoWKzLeiLCZN/MLVvyc3GwDs7kAmaRKldAcv 9nUj3BjU4WbfACT2oCz2nQiXQMKUeYphNJqhTdhz0CgiSHw/+IV7su88mmMAVqXTCU5Wis+qgqA
 3HBokycBp0++LTf6o9s8a5nxrv8+8T5aUO6eHgOzmN2VJOhnqun6dxZEfkYPsV+35v2eZlaA
X-Proofpoint-ORIG-GUID: pv4_iWAoFqQJDccGeTh8qsxtGfajkvdG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=998
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506060062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 06:50:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218111

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/422

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsoup/libsoup-3.4.4/CVE-2025-2784.patch | 137 ++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |   1 +
 2 files changed, 138 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-2784.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-2784.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-2784.patch
new file mode 100644
index 00000000000..b2e1c12d48d
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-2784.patch
@@ -0,0 +1,137 @@
+From dd10ae267e33bcc35646610d7cc1841da77d05e7 Mon Sep 17 00:00:00 2001
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
+index aeee2e2..a5e18d5 100644
+--- a/libsoup/content-sniffer/soup-content-sniffer.c
++++ b/libsoup/content-sniffer/soup-content-sniffer.c
+@@ -638,8 +638,11 @@ sniff_text_or_binary (SoupContentSniffer *sniffer, GBytes *buffer)
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
+@@ -659,7 +662,7 @@ sniff_feed_or_html (SoupContentSniffer *sniffer, GBytes *buffer)
+ 	gsize resource_length;
+ 	const char *resource = g_bytes_get_data (buffer, &resource_length);
+ 	resource_length = MIN (512, resource_length);
+-	int pos = 0;
++	gsize pos = 0;
+ 
+ 	if (resource_length < 3)
+ 		goto text_html;
+@@ -669,9 +672,6 @@ sniff_feed_or_html (SoupContentSniffer *sniffer, GBytes *buffer)
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
+index 7ef7ac5..95b13b8 100644
+--- a/tests/meson.build
++++ b/tests/meson.build
+@@ -95,7 +95,9 @@ tests = [
+   {'name': 'server-auth'},
+   {'name': 'server-mem-limit'},
+   {'name': 'server'},
+-  {'name': 'sniffing'},
++  {'name': 'sniffing',
++    'depends': [test_resources],
++  },
+   {'name': 'ssl',
+    'dependencies': [gnutls_dep],
+    'depends': mock_pkcs11_module,
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
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index 9b8bf5b9a2a..37319f007f4 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -43,6 +43,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32050.patch \
            file://CVE-2025-46421.patch \
            file://CVE-2025-4948.patch \
+           file://CVE-2025-2784.patch \
 "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.34.1


