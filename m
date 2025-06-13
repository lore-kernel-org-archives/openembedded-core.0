Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33E37C61DB2
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 03:44:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1781.1749786256849890601
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 20:44:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8259073970=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D3OHJk017774
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 20:44:16 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474mxm66y1-13
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 20:44:16 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 12 Jun 2025 20:44:13 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 12 Jun 2025 20:44:12 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH 19/20] libsoup: fix CVE-2025-4948
Date: Fri, 13 Jun 2025 11:43:51 +0800
Message-ID: <20250613034352.175878-20-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613034352.175878-1-changqing.li@windriver.com>
References: <20250613034352.175878-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: UVIxXuxVdzpnugm6tz5VF_Ry2ZeZ1T3Z
X-Authority-Analysis: v=2.4 cv=L74dQ/T8 c=1 sm=1 tr=0 ts=684b9e90 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=_enOPnqeAAAA:8 a=20KFwNOVAAAA:8 a=o19dcwqJu1wBlOUGTbIA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=XAbD3I9PDrnSMThV5XoS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDAyNiBTYWx0ZWRfX2uYWnBRZTVtm BTdpcWd8k+wQfp70HyyQrv94m6lQL3WPAXPYDS+Y1yfjzqQMWIVlTIHZsVE5GMnTtNdZKQlsA3v F1jYBBIu2YBgyMwgjJP1Z6dxitX7chEXA48t/BIk1cisG4A0XheqU5tdxjF7lVXi8XMNhX7vYIA
 jz2jn1UNoLhXNb3Lhg+mARNdNf3Z+lRY2b9UbnY72tIaNPLq9ysLX4Qslds6/8qCVPoaFzwkC2m JH5Uxe/CxCLs8HX+bRi8UXmw2E7/z2T5pAAC2sQlCY2P9cJhpef0e8Abz43wd7MOAdCUvCXICj+ ErUN6qOWJQ+h86zPiiGFGJqCANHZPW8utO+lMb5BG1efTjXgNerX4iJ0evgaRpWGXjit+5+q2iy
 10bO2V3ulXU3mzyd83zgHrTiwbBsUHI5fl8hiPrbfsvkNvbBU0/81FN6tRL1GG33E/mefFTL
X-Proofpoint-ORIG-GUID: UVIxXuxVdzpnugm6tz5VF_Ry2ZeZ1T3Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=747 adultscore=0 spamscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506130026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 03:44:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218572

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/449

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup/CVE-2025-4948.patch       | 97 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4948.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-4948.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-4948.patch
new file mode 100644
index 0000000000..07c85f5381
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-4948.patch
@@ -0,0 +1,97 @@
+From a23ce8f8e60e79990e26376c8b0d40841aed4b81 Mon Sep 17 00:00:00 2001
+From: Milan Crha <mcrha@redhat.com>
+Date: Thu, 15 May 2025 17:49:11 +0200
+Subject: [PATCH] soup-multipart: Verify boundary limits for multipart body
+
+It could happen that the boundary started at a place which resulted into
+a negative number, which in an unsigned integer is a very large value.
+Check the body size is not a negative value before setting it.
+
+Closes https://gitlab.gnome.org/GNOME/libsoup/-/issues/449
+
+Part-of: <https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/463>
+
+CVE: CVE-2025-4948
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/463/diffs?commit_id=f2f28afe0b3b2b3009ab67d6874457ec6bac70c0]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-multipart.c |  2 +-
+ tests/multipart-test.c   | 40 ++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 41 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
+index e1c442e..27257e4 100644
+--- a/libsoup/soup-multipart.c
++++ b/libsoup/soup-multipart.c
+@@ -204,7 +204,7 @@ soup_multipart_new_from_message (SoupMessageHeaders *headers,
+ 		 */
+ 		part_body = g_bytes_new_from_bytes (body, // FIXME
+ 						    split - body_data,
+-						    end - 2 - split);
++						    end - 2 >= split ? end - 2 - split : 0);
+ 		g_ptr_array_add (multipart->bodies, part_body);
+ 
+ 		start = end;
+diff --git a/tests/multipart-test.c b/tests/multipart-test.c
+index 84852e2..2ae888c 100644
+--- a/tests/multipart-test.c
++++ b/tests/multipart-test.c
+@@ -548,6 +548,45 @@ test_multipart_bounds_bad_2 (void)
+ 	g_bytes_unref (bytes);
+ }
+ 
++static void
++test_multipart_too_large (void)
++{
++	const char *raw_body =
++		"-------------------\r\n"
++		"-\n"
++		"Cont\"\r\n"
++		"Content-Tynt----e:n\x8erQK\r\n"
++		"Content-Disposition:   name=  form-; name=\"file\"; filename=\"ype:i/  -d; ----\xae\r\n"
++		"Content-Typimag\x01/png--\\\n"
++		"\r\n"
++		"---:\n\r\n"
++		"\r\n"
++		"-------------------------------------\r\n"
++		"---------\r\n"
++		"----------------------";
++	GBytes *body;
++	GHashTable *params;
++	SoupMessageHeaders *headers;
++	SoupMultipart *multipart;
++
++	params = g_hash_table_new (g_str_hash, g_str_equal);
++	g_hash_table_insert (params, (gpointer) "boundary", (gpointer) "-----------------");
++	headers = soup_message_headers_new (SOUP_MESSAGE_HEADERS_MULTIPART);
++	soup_message_headers_set_content_type (headers, "multipart/form-data", params);
++	g_hash_table_unref (params);
++
++	body = g_bytes_new_static (raw_body, strlen (raw_body));
++	multipart = soup_multipart_new_from_message (headers, body);
++	soup_message_headers_unref (headers);
++	g_bytes_unref (body);
++
++	g_assert_nonnull (multipart);
++	g_assert_cmpint (soup_multipart_get_length (multipart), ==, 1);
++	g_assert_true (soup_multipart_get_part (multipart, 0, &headers, &body));
++	g_assert_cmpint (g_bytes_get_size (body), ==, 0);
++	soup_multipart_free (multipart);
++}
++
+ int
+ main (int argc, char **argv)
+ {
+@@ -578,6 +617,7 @@ main (int argc, char **argv)
+ 	g_test_add_func ("/multipart/bounds-good", test_multipart_bounds_good);
+ 	g_test_add_func ("/multipart/bounds-bad", test_multipart_bounds_bad);
+ 	g_test_add_func ("/multipart/bounds-bad-2", test_multipart_bounds_bad_2);
++	g_test_add_func ("/multipart/too-large", test_multipart_too_large);
+ 
+ 	ret = g_test_run ();
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
index 868787fcb7..57f6ecac1a 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -40,6 +40,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32051-2.patch \
            file://CVE-2025-32050.patch \
            file://CVE-2025-46421.patch \
+           file://CVE-2025-4948.patch \
           "
 SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
-- 
2.34.1


