Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F11CC71156
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 03:44:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1717.1749786250975729280
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 20:44:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8259073970=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D2WaIW000865
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 20:44:10 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474gq46bdq-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 20:44:10 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 12 Jun 2025 20:44:05 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 12 Jun 2025 20:44:05 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH 12/20] libsoup: Fix CVE-2025-4969
Date: Fri, 13 Jun 2025 11:43:44 +0800
Message-ID: <20250613034352.175878-13-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613034352.175878-1-changqing.li@windriver.com>
References: <20250613034352.175878-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Qrde3Uyd c=1 sm=1 tr=0 ts=684b9e8a cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=GHR8O2WEAAAA:20 a=fk1lIlRQAAAA:8 a=_enOPnqeAAAA:8 a=20KFwNOVAAAA:8 a=ExAG2EzZOsbCA4H3ouoA:9
 a=U75ogvRika4pmaD_UPO0:22 a=XAbD3I9PDrnSMThV5XoS:22
X-Proofpoint-GUID: mzii4az4M-Dz7cuaKMqlptibE4UZaylU
X-Proofpoint-ORIG-GUID: mzii4az4M-Dz7cuaKMqlptibE4UZaylU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDAyNiBTYWx0ZWRfX84q2nd5VvBlv XABdP44c7eMuti067lGfu8KDv2+wMmu2d2jNdBCzZyaH3ItISI3WOhw21CmASljwMT5dhJPSpz0 vhrblie2ONLLZyrAyBEGzO4A3IDYZE5GGlP3XdZvUf5C8yPISWb2DzajjHZPEpzklOUGeo2TRqd
 hMYwll3Zl+nwodgdiZZakMugvXCwb7y8dl2M2wmEGwl3nDD1yVZ4JHXvUVmzrd1hsUMpjBjs8nl h0iXFQoT4+2uwuVhhs/K6wDGzPI+ICEJL67fUH4MysNWDwShXxJOXGK7zy8r9q8Ji5BxJWF91rx UGslBjUDYEOf5PkQs55G1yT8YrjOs2fh96cWfeTiGI7FdFHODp41MM+VyLxlKub8YgkwlZYj9eA
 aY2PT/ptaNqYgycSnJUfJ4XQnKBddMlMx6Awagv6TwXVq7zmEEll+F2KlEtyK9GaAKZARVQg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 mlxscore=0 mlxlogscore=877
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506130026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 03:44:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218566

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libsoup/-/commit/07b94e27afafebf31ef3cd868866a1e383750086

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup/CVE-2025-4969.patch       | 76 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4969.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-4969.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-4969.patch
new file mode 100644
index 0000000000..70c5fd5593
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-4969.patch
@@ -0,0 +1,76 @@
+From 07b94e27afafebf31ef3cd868866a1e383750086 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/07b94e27afafebf31ef3cd868866a1e383750086]
+CVE: CVE-2025-4969
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ libsoup/soup-multipart.c |  2 +-
+ tests/multipart-test.c   | 22 ++++++++++++++++++++++
+ 2 files changed, 23 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
+index 102ce37..e1c442e 100644
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
+index ab5f41c..84852e2 100644
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
+ int
+ main (int argc, char **argv)
+ {
+@@ -556,6 +577,7 @@ main (int argc, char **argv)
+ 	g_test_add_data_func ("/multipart/async-small-reads", GINT_TO_POINTER (ASYNC_MULTIPART_SMALL_READS), test_multipart);
+ 	g_test_add_func ("/multipart/bounds-good", test_multipart_bounds_good);
+ 	g_test_add_func ("/multipart/bounds-bad", test_multipart_bounds_bad);
++	g_test_add_func ("/multipart/bounds-bad-2", test_multipart_bounds_bad_2);
+ 
+ 	ret = g_test_run ();
+ 
+-- 
+2.49.0
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
index 968ad0a15d..3076437ac4 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -31,6 +31,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32912-2.patch \
            file://CVE-2025-32914.patch \
            file://CVE-2025-4476.patch \
+           file://CVE-2025-4969.patch \
           "
 SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
-- 
2.34.1


