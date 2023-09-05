Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F035C83F2C
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 05:04:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14853.1693890247609806227
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Sep 2023 22:04:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=LWOFE6aL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=761274299c=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3854e2oI005607
	for <openembedded-core@lists.openembedded.org>; Tue, 5 Sep 2023 05:04:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=PPS06212021; bh=H5oMJe3NGKn2u9JIq7
	3+RKDTJB4KSss28gn+hqiMYoM=; b=LWOFE6aLo1r3yrkjNJUy/b2YM50d/Azi6z
	tp7gAG/H/p2j9m+qgZxYNL1NFLf/tM+mOyisxhN2vROp2mKj6bvshN5glHqQ/SYP
	I2Wazo0RKJYQaIhNfl0pJz72XvY04qHTuzfTNJnY6qo2N0qaBCjr01BgijgP/+5/
	mQu+tnOG5XHKrSIF94qFc7pUrExOHUt2pvawYNYpfikV+jmWCs2VBcvX33h1l22e
	cefXXkBf8ByFcfXJ6Sun41WBWcHcrTOdVHb29+H3Em6T4uQSLCzZCjHKdQRTOPnL
	M0gzxuLVathFY6jweX0arekc3DCwCgTeaAP25teAbzfddyBfSCOw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3suv15t4te-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 05:04:06 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 4 Sep 2023 22:04:01 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][mickledore][PATCH 1/1] nghttp2: fix CVE-2023-35945
Date: Tue, 5 Sep 2023 05:03:46 +0000
Message-ID: <20230905050346.1787412-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: ZzPmRpR0aJxZHzCBjdBsULgxSbBbzb4s
X-Proofpoint-GUID: ZzPmRpR0aJxZHzCBjdBsULgxSbBbzb4s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-05_03,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0 impostorscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309050044
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3854e2oI005607
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 05:04:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187197

From: Yogita Urade <yogita.urade@windriver.com>

Envoy is a cloud-native high-performance edge/middle/service
proxy. Envoy=E2=80=99s HTTP/2 codec may leak a header map and
bookkeeping structures upon receiving `RST_STREAM` immediately
followed by the `GOAWAY` frames from an upstream server. In
nghttp2, cleanup of pending requests due to receipt of the
`GOAWAY` frame skips de-allocation of the bookkeeping structure
and pending compressed header. The error return [code path] is
taken if connection is already marked for not sending more
requests due to `GOAWAY` frame. The clean-up code is right after
the return statement, causing memory leak. Denial of service
through memory exhaustion. This vulnerability was patched in
versions(s) 1.26.3, 1.25.8, 1.24.9, 1.23.11.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-35945
https://github.com/envoyproxy/envoy/security/advisories/GHSA-jfxv-29pc-x2=
2r

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../nghttp2/nghttp2/CVE-2023-35945.patch      | 151 ++++++++++++++++++
 .../recipes-support/nghttp2/nghttp2_1.52.0.bb |   1 +
 2 files changed, 152 insertions(+)
 create mode 100644 meta/recipes-support/nghttp2/nghttp2/CVE-2023-35945.p=
atch

diff --git a/meta/recipes-support/nghttp2/nghttp2/CVE-2023-35945.patch b/=
meta/recipes-support/nghttp2/nghttp2/CVE-2023-35945.patch
new file mode 100644
index 0000000000..04d2086e1c
--- /dev/null
+++ b/meta/recipes-support/nghttp2/nghttp2/CVE-2023-35945.patch
@@ -0,0 +1,151 @@
+From ce385d3f55a4b76da976b3bdf71fe2deddf315ba Mon Sep 17 00:00:00 2001
+From: Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
+Date: Mon, 4 Sep 2023 06:48:30 +0000
+Subject: [PATCH] Fix memory leak
+
+This commit fixes memory leak that happens when PUSH_PROMISE or
+HEADERS frame cannot be sent, and nghttp2_on_stream_close_callback
+fails with a fatal error.  For example, if GOAWAY frame has been
+received, a HEADERS frame that opens new stream cannot be sent.
+
+This issue has already been made public via CVE-2023-35945 [1] issued
+by envoyproxy/envoy project.  During embargo period, the patch to fix
+this bug was accidentally submitted to nghttp2/nghttp2 repository [2].
+And they decided to disclose CVE early.  I was notified just 1.5 hours
+before disclosure.  I had no time to respond.
+
+PoC described in [1] is quite simple, but I think it is not enough to
+trigger this bug.  While it is true that receiving GOAWAY prevents a
+client from opening new stream, and nghttp2 enters error handling
+branch, in order to cause the memory leak,
+nghttp2_session_close_stream function must return a fatal error.
+nghttp2 defines 2 fatal error codes:
+
+- NGHTTP2_ERR_NOMEM
+- NGHTTP2_ERR_CALLBACK_FAILURE
+
+NGHTTP2_ERR_NOMEM, as its name suggests, indicates out of memory.  It
+is unlikely that a process gets short of memory with this simple PoC
+scenario unless application does something memory heavy processing.
+
+NGHTTP2_ERR_CALLBACK_FAILURE is returned from application defined
+callback function (nghttp2_on_stream_close_callback, in this case),
+which indicates something fatal happened inside a callback, and a
+connection must be closed immediately without any further action.  As
+nghttp2_on_stream_close_error_callback documentation says, any error
+code other than 0 or NGHTTP2_ERR_CALLBACK_FAILURE is treated as fatal
+error code.  More specifically, it is treated as if
+NGHTTP2_ERR_CALLBACK_FAILURE is returned.  I guess that envoy returns
+NGHTTP2_ERR_CALLBACK_FAILURE or other error code which is translated
+into NGHTTP2_ERR_CALLBACK_FAILURE.
+
+[1] https://github.com/envoyproxy/envoy/security/advisories/GHSA-jfxv-29=
pc-x22r
+[2] https://github.com/nghttp2/nghttp2/pull/1929
+
+CVE: CVE-2023-35945
+
+Upstream-Status: Backport [https://github.com/nghttp2/nghttp2/commit/ce3=
85d3f55a4b76da976b3bdf71fe2deddf315ba]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ lib/nghttp2_session.c        | 10 +++++-----
+ tests/nghttp2_session_test.c | 34 ++++++++++++++++++++++++++++++++++
+ 2 files changed, 39 insertions(+), 5 deletions(-)
+
+diff --git a/lib/nghttp2_session.c b/lib/nghttp2_session.c
+index 93f3f07..9bb32b2 100644
+--- a/lib/nghttp2_session.c
++++ b/lib/nghttp2_session.c
+@@ -3300,6 +3300,7 @@ static ssize_t nghttp2_session_mem_send_internal(n=
ghttp2_session *session,
+       if (rv < 0) {
+         int32_t opened_stream_id =3D 0;
+         uint32_t error_code =3D NGHTTP2_INTERNAL_ERROR;
++        int rv2 =3D 0;
+
+         DEBUGF("send: frame preparation failed with %s\n",
+                nghttp2_strerror(rv));
+@@ -3342,19 +3343,18 @@ static ssize_t nghttp2_session_mem_send_internal=
(nghttp2_session *session,
+         }
+         if (opened_stream_id) {
+           /* careful not to override rv */
+-          int rv2;
+           rv2 =3D nghttp2_session_close_stream(session, opened_stream_i=
d,
+                                              error_code);
+-
+-          if (nghttp2_is_fatal(rv2)) {
+-            return rv2;
+-          }
+         }
+
+         nghttp2_outbound_item_free(item, mem);
+         nghttp2_mem_free(mem, item);
+         active_outbound_item_reset(aob, mem);
+
++        if (nghttp2_is_fatal(rv2)) {
++          return rv2;
++        }
++
+         if (rv =3D=3D NGHTTP2_ERR_HEADER_COMP) {
+           /* If header compression error occurred, should terminiate
+              connection. */
+diff --git a/tests/nghttp2_session_test.c b/tests/nghttp2_session_test.c
+index 08152d4..14ab132 100644
+--- a/tests/nghttp2_session_test.c
++++ b/tests/nghttp2_session_test.c
+@@ -585,6 +585,15 @@ static int on_stream_close_callback(nghttp2_session=
 *session, int32_t stream_id,
+   return 0;
+ }
+
++static int fatal_error_on_stream_close_callback(nghttp2_session *sessio=
n,
++                                                int32_t stream_id,
++                                                uint32_t error_code,
++                                                void *user_data) {
++  on_stream_close_callback(session, stream_id, error_code, user_data);
++
++  return NGHTTP2_ERR_CALLBACK_FAILURE;
++}
++
+ static ssize_t pack_extension_callback(nghttp2_session *session, uint8_=
t *buf,
+                                        size_t len, const nghttp2_frame =
*frame,
+                                        void *user_data) {
+@@ -4297,6 +4306,8 @@ void test_nghttp2_session_on_goaway_received(void)=
 {
+   nghttp2_frame frame;
+   int i;
+   nghttp2_mem *mem;
++  const uint8_t *data;
++  ssize_t datalen;
+
+   mem =3D nghttp2_mem_default();
+   user_data.frame_recv_cb_called =3D 0;
+@@ -4338,6 +4349,29 @@ void test_nghttp2_session_on_goaway_received(void=
) {
+
+   nghttp2_frame_goaway_free(&frame.goaway, mem);
+   nghttp2_session_del(session);
++
++  /* Make sure that no memory leak when stream_close callback fails
++     with a fatal error */
++  memset(&callbacks, 0, sizeof(nghttp2_session_callbacks));
++  callbacks.on_stream_close_callback =3D fatal_error_on_stream_close_ca=
llback;
++
++  memset(&user_data, 0, sizeof(user_data));
++
++  nghttp2_session_client_new(&session, &callbacks, &user_data);
++
++  nghttp2_frame_goaway_init(&frame.goaway, 0, NGHTTP2_NO_ERROR, NULL, 0=
);
++
++  CU_ASSERT(0 =3D=3D nghttp2_session_on_goaway_received(session, &frame=
));
++
++  nghttp2_submit_request(session, NULL, reqnv, ARRLEN(reqnv), NULL, NUL=
L);
++
++  datalen =3D nghttp2_session_mem_send(session, &data);
++
++  CU_ASSERT(NGHTTP2_ERR_CALLBACK_FAILURE =3D=3D datalen);
++  CU_ASSERT(1 =3D=3D user_data.stream_close_cb_called);
++
++  nghttp2_frame_goaway_free(&frame.goaway, mem);
++  nghttp2_session_del(session);
+ }
+
+ void test_nghttp2_session_on_window_update_received(void) {
+--
+2.35.5
diff --git a/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb b/meta/recipe=
s-support/nghttp2/nghttp2_1.52.0.bb
index f57a15954d..0fba554919 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D764abdf30b2ead=
d37ce47dcbce0ea1ec"
 SRC_URI =3D "\
     ${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz \
     file://0001-fetch-ocsp-response-use-python3.patch \
+    file://CVE-2023-35945.patch \
 "
 SRC_URI[sha256sum] =3D "3ea9f0439e60469ad4d39cb349938684ffb929dd7e8e06a7=
bffe9f9d21f8ba7d"
=20
--=20
2.35.5


