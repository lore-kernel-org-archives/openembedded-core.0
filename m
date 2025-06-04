Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1654C5B549
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 11:29:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14319.1749036541383672511
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 04:29:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8250671ff5=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5545UBt7000350
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Jun 2025 04:29:01 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rtcsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 04:29:00 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 4 Jun 2025 04:29:00 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 4 Jun 2025 04:28:59 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATH 11/14] libsoup: fix CVE-2025-4969
Date: Wed, 4 Jun 2025 19:28:38 +0800
Message-ID: <20250604112841.424355-12-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250604112841.424355-1-changqing.li@windriver.com>
References: <20250604112841.424355-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ZwID91JrmHInfhr_sxnsGBdn1LhcaWb1
X-Authority-Analysis: v=2.4 cv=VIHdn8PX c=1 sm=1 tr=0 ts=68402dfd cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=EBpV3xrsuWrfeO8Jag4A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA4NyBTYWx0ZWRfX7RJrdc+OYeKy 95M6ijo8qe+RhgrF7wblZ2wJ/5kPwZIJ2JD6OZewUmsaNzLYHeZ7nopDX+Tw3AdtevXB/snCz5g NwD4UwSULOGkp85IoOsk9VA9YAvp0NWH8Wvt2gTL57DZmmCQWcZ8cMU7KhF2Q6Gj8AGLrSkrakS
 ZV728dNS7vTgiHkwtrVF6syXvZE3yDdySYxwmRTJzkR7DnZ5yGHwzVk41f7Qg1r1vOw2GNK7I6Q 7ryKE+y/Kj+223SCbg2D5hwBb/cLF59MCD1osC2iCdJpIWO5QpeZxTnUF6EPK7xkfSmq7xc6HWL hsxVpWJCapTlh5kWCTw5aeTP/AaNytmwikhFXH11n4TgEDJh00LzacaDdv/7UKPlvZmfYN6bEaZ
 nY7bL7yVwtwkfoMyamjKjZ4SHd/mTa5V9FL3BWaxS/xtFe33/YItpD+2gsZonEYDFky8svMM
X-Proofpoint-ORIG-GUID: ZwID91JrmHInfhr_sxnsGBdn1LhcaWb1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=745
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506040087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 11:29:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217922

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/447

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsoup/libsoup-3.4.4/CVE-2025-4969.patch | 78 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4969.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4969.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4969.patch
new file mode 100644
index 0000000000..97702a3d08
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4969.patch
@@ -0,0 +1,78 @@
+From e8ef88ed86929c9a0dc343a4c7d29a8f2bcf400f Mon Sep 17 00:00:00 2001
+From: Milan Crha <mcrha@redhat.com>
+Date: Mon, 19 May 2025 17:48:27 +0200
+Subject: [PATCH] soup-multipart: Verify array bounds before accessing its
+ members
+
+The boundary could be at a place which, calculated, pointed
+before the beginning of the array. Check the bounds, to avoid
+read out of the array bounds.
+
+Closes https://gitlab.gnome.org/GNOME/libsoup/-/issues/447
+
+CVE: CVE-2025-4969
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/467/commits]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-multipart.c |  2 +-
+ tests/multipart-test.c   | 22 ++++++++++++++++++++++
+ 2 files changed, 23 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
+index a587fe7..27257e4 100644
+--- a/libsoup/soup-multipart.c
++++ b/libsoup/soup-multipart.c
+@@ -104,7 +104,7 @@ find_boundary (const char *start, const char *end,
+ 			continue;
+ 
+ 		/* Check that it's at start of line */
+-		if (!(b == start || (b[-1] == '\n' && b[-2] == '\r')))
++		if (!(b == start || (b - start >= 2 && b[-1] == '\n' && b[-2] == '\r')))
+ 			continue;
+ 
+ 		/* Check for "--" or "\r\n" after boundary */
+diff --git a/tests/multipart-test.c b/tests/multipart-test.c
+index 92b673e..3792563 100644
+--- a/tests/multipart-test.c
++++ b/tests/multipart-test.c
+@@ -527,6 +527,27 @@ test_multipart_bounds_bad (void)
+ 	g_bytes_unref (bytes);
+ }
+ 
++static void
++test_multipart_bounds_bad_2 (void)
++{
++	SoupMultipart *multipart;
++	SoupMessageHeaders *headers;
++	GBytes *bytes;
++	const char *raw_data = "\n--123\r\nline\r\n--123--\r";
++
++	headers = soup_message_headers_new (SOUP_MESSAGE_HEADERS_MULTIPART);
++	soup_message_headers_append (headers, "Content-Type", "multipart/mixed; boundary=\"123\"");
++
++	bytes = g_bytes_new (raw_data, strlen (raw_data));
++
++	multipart = soup_multipart_new_from_message (headers, bytes);
++	g_assert_nonnull (multipart);
++
++	soup_multipart_free (multipart);
++	soup_message_headers_unref (headers);
++	g_bytes_unref (bytes);
++}
++
+ static void
+ test_multipart_too_large (void)
+ {
+@@ -595,6 +616,7 @@ main (int argc, char **argv)
+ 	g_test_add_data_func ("/multipart/async-small-reads", GINT_TO_POINTER (ASYNC_MULTIPART_SMALL_READS), test_multipart);
+ 	g_test_add_func ("/multipart/bounds-good", test_multipart_bounds_good);
+ 	g_test_add_func ("/multipart/bounds-bad", test_multipart_bounds_bad);
++	g_test_add_func ("/multipart/bounds-bad-2", test_multipart_bounds_bad_2);
+ 	g_test_add_func ("/multipart/too-large", test_multipart_too_large);
+ 
+ 	ret = g_test_run ();
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index 0510511b24..a650eed520 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -42,6 +42,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32050.patch \
            file://CVE-2025-46421.patch \
            file://CVE-2025-4948.patch \
+           file://CVE-2025-4969.patch \
 "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.34.1


