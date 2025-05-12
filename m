Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A947C3ABC3
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 05:21:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.43278.1747027266498985877
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 May 2025 22:21:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=72272af644=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C55kSB005782
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 05:21:05 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46hws89b8d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 05:21:04 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 11 May 2025 22:21:03 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 11 May 2025 22:21:02 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [walnascar][PATCH] libsoup-2.4: fix CVE-2024-52532
Date: Mon, 12 May 2025 13:21:02 +0800
Message-ID: <20250512052102.2807316-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: cxjlsBCZ7XYY6NlCep8TVWAAGmhmc4Js
X-Proofpoint-GUID: cxjlsBCZ7XYY6NlCep8TVWAAGmhmc4Js
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDA1NCBTYWx0ZWRfXwW3YZy4U2e1I 42weH4NLtwWuruXtZKtI2mxaPcfXSgf+nTDUnxaqBqwoJhLtW7Yp5ISrYtfqWqetiK9uwDmUCsu JVz2UvBddIXDeaxx2ismo4Z+mdwIgzr+3gujx7J6zmdF/ZjFw1cWV4Qz7Cyf9H8QNl0kh1zAodh
 6dRkTzzxCWPO0uJGElrQdF9K1jE7nkgShvwMzgp1Ak7QbB+SANTGYINlrcbvITv6oZMoGAHQchN jgYQpaSZry3vmL5ex6XsHfwukdNwSlrpuKKLe+q2YhbDL3Mp4kIG9mGbCWvBCxGYPtxSg3AgnbF D05zSlNMcr4Hqdkj8AtERgXEBm5dACNQ/N+VEzrpbjpJTKvPq+0w3YzWA9tMjBtTUcvmmj27iH1
 vdO9CwJiK18CLnTBgaWo7ztvqErnGGd15Z/cDRIyvyKuTFxslhIoNJbkRPlenHYMaLP1OINv
X-Authority-Analysis: v=2.4 cv=Q+HS452a c=1 sm=1 tr=0 ts=68218540 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=dt9VzEwgFbYA:10 a=PYnjg3YJAAAA:8 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=vggBfdFIAAAA:8 a=xNf9USuDAAAA:8
 a=9MbTc5Otos7jAG5MShYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxlogscore=912 bulkscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505120054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 05:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216297

From: Changqing Li <changqing.li@windriver.com>

CVE-2024-52532:
GNOME libsoup before 3.6.1 has an infinite loop, and memory consumption.
during the reading of certain patterns of WebSocket data from clients.

Refer:
https://nvd.nist.gov/vuln/detail/CVE-2024-52532

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsoup-2.4/CVE-2024-52532-1.patch        | 37 ++++++++++++++
 .../libsoup-2.4/CVE-2024-52532-2.patch        | 43 +++++++++++++++++
 .../libsoup-2.4/CVE-2024-52532-3.patch        | 48 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  5 +-
 4 files changed, 132 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch
new file mode 100644
index 0000000000..cb1f096110
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch
@@ -0,0 +1,37 @@
+From a693d49bff058fc20a448dc4e7d324ff0dc6597e Mon Sep 17 00:00:00 2001
+From: Ignacio Casal Quinteiro <qignacio@amazon.com>
+Date: Wed, 11 Sep 2024 11:52:11 +0200
+Subject: [PATCH 1/3] websocket: process the frame as soon as we read data
+
+Otherwise we can enter in a read loop because we were not
+validating the data until the all the data was read.
+
+Fixes #391
+
+CVE: CVE-2024-52532
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/6adc0e3eb74c257ed4e2a23eb4b2774fdb0d67be#f1d67ca0386b145ea201cf88d27f72724d7c6715]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-websocket-connection.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-websocket-connection.c
+index a4095e1..65c1492 100644
+--- a/libsoup/soup-websocket-connection.c
++++ b/libsoup/soup-websocket-connection.c
+@@ -1140,9 +1140,8 @@ soup_websocket_connection_read (SoupWebsocketConnection *self)
+ 		}
+ 
+ 		pv->incoming->len = len + count;
+-	} while (count > 0);
+-
+-	process_incoming (self);
++		process_incoming (self);
++	} while (count > 0 && !pv->close_sent && !pv->io_closing);
+ 
+ 	if (end) {
+ 		if (!pv->close_sent || !pv->close_received) {
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch
new file mode 100644
index 0000000000..dcadafe944
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch
@@ -0,0 +1,43 @@
+From f5b76410de1318f49844dacf6e68692522b6c856 Mon Sep 17 00:00:00 2001
+From: Ignacio Casal Quinteiro <qignacio@amazon.com>
+Date: Wed, 2 Oct 2024 11:17:19 +0200
+Subject: [PATCH] websocket-test: disconnect error copy after the test ends
+
+Otherwise the server will have already sent a few more wrong
+bytes and the client will continue getting errors to copy
+but the error is already != NULL and it will assert
+
+CVE: CVE-2024-52532
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/29b96fab2512666d7241e46c98cc45b60b795c0c]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ tests/websocket-test.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/tests/websocket-test.c b/tests/websocket-test.c
+index 5e40cf3..1ec9ff6 100644
+--- a/tests/websocket-test.c
++++ b/tests/websocket-test.c
+@@ -1331,8 +1331,9 @@ test_receive_invalid_encode_length_64 (Test *test,
+ 	GError *error = NULL;
+ 	InvalidEncodeLengthTest context = { test, NULL };
+ 	guint i;
++	guint error_id;
+ 
+-	g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &error);
++	error_id = g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &error);
+ 	g_signal_connect (test->client, "message", G_CALLBACK (on_binary_message), &received);
+ 
+ 	/* We use 127(\x7f) as payload length with 65535 extended length */
+@@ -1345,6 +1346,7 @@ test_receive_invalid_encode_length_64 (Test *test,
+ 	WAIT_UNTIL (error != NULL || received != NULL);
+ 	g_assert_error (error, SOUP_WEBSOCKET_ERROR, SOUP_WEBSOCKET_CLOSE_PROTOCOL_ERROR);
+ 	g_clear_error (&error);
++	g_signal_handler_disconnect (test->client, error_id);
+ 	g_assert_null (received);
+ 
+         g_thread_join (thread);
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch
new file mode 100644
index 0000000000..ab6af72291
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch
@@ -0,0 +1,48 @@
+From d97bb2e340f5a6d7e56a7738403f9d18bc406b70 Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@debian.org>
+Date: Wed, 13 Nov 2024 14:14:23 +0000
+Subject: [PATCH 3/3] websocket-test: Disconnect error signal in another place
+
+This is the same change as commit 29b96fab "websocket-test: disconnect
+error copy after the test ends", and is done for the same reason, but
+replicating it into a different function.
+
+Fixes: 6adc0e3e "websocket: process the frame as soon as we read data"
+Resolves: https://gitlab.gnome.org/GNOME/libsoup/-/issues/399
+Signed-off-by: Simon McVittie <smcv@debian.org>
+
+CVE: CVE-2024-52532
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/commit/4c9e75c6676a37b6485620c332e568e1a3f530ff]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ tests/websocket-test.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/tests/websocket-test.c b/tests/websocket-test.c
+index 2b19a7b..0699a06 100644
+--- a/tests/websocket-test.c
++++ b/tests/websocket-test.c
+@@ -1300,8 +1300,9 @@ test_receive_invalid_encode_length_16 (Test *test,
+ 	GError *error = NULL;
+ 	InvalidEncodeLengthTest context = { test, NULL };
+ 	guint i;
++	guint error_id;
+ 
+-	g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &error);
++	error_id = g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &error);
+ 	g_signal_connect (test->client, "message", G_CALLBACK (on_binary_message), &received);
+ 
+ 	/* We use 126(~) as payload length with 125 extended length */
+@@ -1314,6 +1315,7 @@ test_receive_invalid_encode_length_16 (Test *test,
+ 	WAIT_UNTIL (error != NULL || received != NULL);
+ 	g_assert_error (error, SOUP_WEBSOCKET_ERROR, SOUP_WEBSOCKET_CLOSE_PROTOCOL_ERROR);
+ 	g_clear_error (&error);
++        g_signal_handler_disconnect (test->client, error_id);
+ 	g_assert_null (received);
+ 
+ 	g_thread_join (thread);
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 25e0d7dcbc..22cbbdb1b8 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -13,7 +13,10 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch \
-           file://0001-CVE-2025-32911.patch"
+           file://0001-CVE-2025-32911.patch \
+           file://CVE-2024-52532-1.patch \
+           file://CVE-2024-52532-2.patch \
+           file://CVE-2024-52532-3.patch"
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
 CVE_PRODUCT = "libsoup"
-- 
2.34.1


