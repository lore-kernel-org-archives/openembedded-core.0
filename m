Return-Path: <PritamSrichandan.Sahoo@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C082C43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 15:33:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12405.1783611206588016247
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 08:33:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jHQTBwow;
 spf=none, err=permanent DNS error (domain: oak-lpgbuild11.wrs.com, ip: 205.220.178.238, mailfrom: prvs=1650dddb60=psahoo1@oak-lpgbuild11.wrs.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669EdQEG2440672;
	Thu, 9 Jul 2026 15:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=xeFv+LQI0nHghje1d0KaK7Vd+KxnvMdb1ED2i7+xdKc=; b=
	jHQTBwowBYsbQRPupCN3bigzO1WaxlMhoBcARMebaonofiAKNY/J0ok3RketwHsi
	zC+hvuxc90Ul2vroeO6ncC12BDdTPS1fRfXy9EmJ92TtYTFAX5HQAANybEt3ZPsA
	Wy0+GvU6zPvN8kYUjSRnhcM6SRtuGscBvaJBH5gdc9zg65sg9yw9A3lFMBdqvYZL
	Vl0pkgP2RC2mHHg0XMobgnmaGcDwnbpp7atfqaRC65Gj2ObSfleBnSe9S2pZCMRP
	VXYuXKOPiaJry0P8ViHPZoOiYfiy/tEmZ90q6/FtM7ohuRKSGVsyOVpLQC8R+r3A
	MzA4POr3/pxXy/6FE+FVag==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fa1h215jr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 09 Jul 2026 15:33:25 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 9 Jul 2026 08:33:22 -0700
Received: from oak-lpgbuild11.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 9 Jul 2026 08:33:22 -0700
Received: by oak-lpgbuild11.wrs.com (Postfix, from userid 1762445297)
	id 021FD404061A; Thu,  9 Jul 2026 15:33:22 +0000 (UTC)
From: Pritam Srichandan Sahoo <PritamSrichandan.Sahoo@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Randy.MacLeod@windriver.com>, <Yi.Zhao@windriver.com>,
        <Shiva.Komati@windriver.com>, <Qi.Chen@windriver.com>,
        <Libo.Chen.CN@windriver.com>, <Jinfeng.Wang.CN@windriver.com>,
        <Shailesh.Masih@windriver.com>, <Tomas.Holmberg@windriver.com>,
        <Haixiao.Yan.CN@windriver.com>, <yoann.congal@smile.fr>,
        "Pritam Srichandan
 Sahoo" <PritamSrichandan.Sahoo@windriver.com>
Subject: [wrynose][PATCH v4 1/1] gnutls: fix CVE-2026-33846
Date: Thu, 9 Jul 2026 15:33:21 +0000
Message-ID: <20260709153321.2000551-2-PritamSrichandan.Sahoo@windriver.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260709153321.2000551-1-PritamSrichandan.Sahoo@windriver.com>
References: <20260709153321.2000551-1-PritamSrichandan.Sahoo@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=LbIMLDfi c=1 sm=1 tr=0 ts=6a4fbf45 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=p0WdMEafAAAA:8 a=mDV3o1hIAAAA:8 a=NEAV23lmAAAA:8
 a=GwUem0DFAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=Le0Og2LGpXSXxqE2RsgA:9
 a=2-NmuGI-n9uWd7q-:21 a=O8hF6Hzn-FEA:10 a=r0dl5i_q2XGqDZkti5dn:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE1MyBTYWx0ZWRfX033Z+hHG9dI6
 r7t2Ge51xVAr7phlMwk9As9VEo8ypvay6y4t5NwSWGxec3nMQCQbGv+vOD/BIlYdXEubRRWzsCM
 e++YGEBlENVpUoei/cBGlOr9kMDrO0hhfusFbPKUou0I1lycCV0U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE1MyBTYWx0ZWRfX3E+LFiF5x3xQ
 8xcgiHktPbZWlibAajVI0KeQdRr67d7+Dt+VqHtMHGjd1/5MwpHnAEoLKRx+cX6juJ9E3LO+Exg
 q6oewhdVkvcTt88hyyhuNV/GIHf+hzgHpXHyJb7TARWzjomI/Gw2Xmb17nhxQ9+48R36oBaOFZI
 MSwwr91WBqiKfLotlfubLXU0+82gQTwIO+Y9jJfjBCG0CE2KOqpLTkEYcyJTCPA36VJzbIslhXF
 8ODqA3PnUH1CdytlxiOifTDuK9Tqa7J22Gfc7wNJ0BPHyHGmDIEM3PQitLcELq6Owa5r+ayrV+H
 cRewb1RDeuhFQRqFwbv2WYGt/muQYfQTSqTYxyu7At9UqKXmQk8G832dUT00L7tTKKFyfG1vg19
 G5hjcSxNH1DAE9xmNx2jW8/t1wiCxSPZjtgbppccRwgWMMIZIDqI7Z9mzG8/JpatSVh4M4LoPU1
 gm9PP03IvUra/0YJWcQ==
X-Proofpoint-ORIG-GUID: 0K6z5ihmeAFeFsE4ICanc95iwmA5_DoL
X-Proofpoint-GUID: 0K6z5ihmeAFeFsE4ICanc95iwmA5_DoL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090153
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 15:33:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240586

Backport upstream fixes for DTLS handshake fragment reassembly
vulnerability (CVE-2026-33846).

Includes:
- 4f94e5cfe1f2: add basic DTLS fragment reassembly test
- 9deffca528c2: shorten merge_handshake_packet using recv_buf
- 65ab33fa54e3: add validation checks for DTLS fragment length and bounds
- cf3f1955e58c: add reproducer for DTLS fragment reassembly bug (#1816)
- bb427ff74dba: add fragmented ClientHello test coverage
- 092c65d004e2: match DTLS datagrams by handshake sequence number
- a2b41be83a1a: add test for mismatched message_seq handling (#1839)
- 68b2fb63c8df: link mini-dtls-fragments test to gnulib

These commits are included in gnutls 3.8.13 and are backported by
both Debian (gnutls28_3.8.9-3+deb13u4) and CentOS 10-stream
(gnutls-3.8.10-4.el10) using identical commit selection.

Signed-off-by: Pritam Srichandan Sahoo <PritamSrichandan.Sahoo@windriver.com>
---
 ...fragments-implement-a-basic-DTLS-tes.patch | 258 ++++++++++++++++++
 ...merge_handshake_packet-using-recv_bu.patch |  96 +++++++
 ...s-add-more-checks-to-DTLS-reassembly.patch |  65 +++++
 ...fragments-extend-with-a-1816-reprodu.patch | 159 +++++++++++
 ...fragments-extend-with-fragmenting-Cl.patch | 149 ++++++++++
 ...ch-DTLS-datagrams-by-sequence-number.patch |  42 +++
 ...fragments-1839-mismatching-message_s.patch | 104 +++++++
 ...ts-mini-dtls-framents-link-to-gnulib.patch |  27 ++
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   8 +
 9 files changed, 908 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-fragments-implement-a-basic-DTLS-tes.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/0002-buffers-shorten-merge_handshake_packet-using-recv_bu.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/0003-buffers-add-more-checks-to-DTLS-reassembly.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/0004-tests-mini-dtls-fragments-extend-with-a-1816-reprodu.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/0005-tests-mini-dtls-fragments-extend-with-fragmenting-Cl.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/0006-buffers-match-DTLS-datagrams-by-sequence-number.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/0007-tests-mini-dtls-fragments-1839-mismatching-message_s.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/0008-tests-mini-dtls-framents-link-to-gnulib.patch

diff --git a/meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-fragments-implement-a-basic-DTLS-tes.patch b/meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-fragments-implement-a-basic-DTLS-tes.patch
new file mode 100644
index 0000000000..8519bb2d2d
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-fragments-implement-a-basic-DTLS-tes.patch
@@ -0,0 +1,258 @@
+From 9dce4b38fd94997c0fb2b3e33e997d1c33256e0e Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Fri, 20 Mar 2026 16:09:40 +0100
+Subject: [PATCH 1/8] tests/mini-dtls-fragments: implement a basic DTLS test
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/4f94e5cfe1f252a431e41642b0752e7e0daf43b9]
+CVE: CVE-2026-33846
+Signed-off-by: Pritam Srichandan Sahoo <PritamSrichandan.Sahoo@windriver.com>
+---
+ tests/Makefile.am           |   7 +-
+ tests/mini-dtls-fragments.c | 208 ++++++++++++++++++++++++++++++++++++
+ 2 files changed, 214 insertions(+), 1 deletion(-)
+ create mode 100644 tests/mini-dtls-fragments.c
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index db5aa4e3a..ee95198ff 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -241,7 +241,8 @@ ctests += mini-record-2 simple gnutls_hmac_fast set_pkcs12_cred cert certuniquei
+ 	 x509cert-dntypes id-on-xmppAddr tls13-compat-mode ciphersuite-name \
+ 	 x509-upnconstraint xts-key-check cipher-padding pkcs7-verify-double-free \
+ 	 fips-rsa-sizes tls12-rehandshake-ticket pathbuf tls-force-ems \
+-	 psk-importer privkey-derive dh-compute2 ecdh-compute2
++	 psk-importer privkey-derive dh-compute2 ecdh-compute2 \
++	 mini-dtls-fragments
+ 
+ ctests += tls-channel-binding
+ 
+@@ -505,6 +506,10 @@ pathbuf_CPPFLAGS = $(AM_CPPFLAGS) \
+ 	-I$(top_srcdir)/gl	\
+ 	-I$(top_builddir)/gl
+ 
++mini_dtls_fragments_CPPFLAGS = $(AM_CPPFLAGS) \
++	-I$(top_srcdir)/gl	\
++	-I$(top_builddir)/gl
++
+ if ENABLE_PKCS11
+ if !WINDOWS
+ ctests += tls13/post-handshake-with-cert-pkcs11 pkcs11/tls-neg-pkcs11-no-key \
+diff --git a/tests/mini-dtls-fragments.c b/tests/mini-dtls-fragments.c
+new file mode 100644
+index 000000000..ee75feeb6
+--- /dev/null
++++ b/tests/mini-dtls-fragments.c
+@@ -0,0 +1,208 @@
++/*
++ * Copyright (C) 2026 Red Hat, Inc.
++ *
++ * Author: Alexander Sosedkin
++ *
++ * This file is part of GnuTLS.
++ *
++ * GnuTLS is free software; you can redistribute it and/or modify it
++ * under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 3 of the License, or
++ * (at your option) any later version.
++ *
++ * GnuTLS is distributed in the hope that it will be useful, but
++ * WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * General Public License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General Public License
++ * along with this program.  If not, see <https://www.gnu.org/licenses/>
++ */
++
++#ifdef HAVE_CONFIG_H
++#include "config.h"
++#endif
++
++#include <stdio.h>
++#include <stdlib.h>
++
++#if defined(_WIN32)
++
++int main(void)
++{
++	exit(77);
++}
++
++#else
++
++#include <assert.h>
++#include <errno.h>
++#include <stdbool.h>
++#include <stdint.h>
++#include <string.h>
++#include <gnutls/gnutls.h>
++#include <gnutls/dtls.h>
++#include "cert-common.h"
++#include "utils.h"
++
++#include "attribute.h"
++
++static void server_log_func(int level, const char *str)
++{
++	fprintf(stderr, "server|<%d>| %s", level, str);
++}
++
++static void client_log_func(int level, const char *str)
++{
++	fprintf(stderr, "client|<%d>| %s", level, str);
++}
++
++#define QUEUE_SIZE 1024
++#define PACKET_SIZE 2048
++
++typedef struct {
++	uint8_t buf[PACKET_SIZE];
++	size_t len;
++} packet_t;
++typedef struct {
++	packet_t packets[QUEUE_SIZE];
++	size_t head;
++	size_t tail;
++} queue_t;
++
++static queue_t c2s, s2c;
++
++static int queue_put(queue_t *q, const void *buf, size_t len)
++{
++	assert(len <= PACKET_SIZE);
++	memcpy(q->packets[q->tail].buf, buf, len);
++	q->packets[q->tail].len = len;
++	q->tail++;
++	q->tail %= QUEUE_SIZE;
++	assert(q->tail != q->head);
++	return len;
++}
++
++static ssize_t queue_get(queue_t *q, gnutls_session_t s, void *buf, size_t len)
++{
++	if (q->head == q->tail) {
++		gnutls_transport_set_errno(s, EAGAIN);
++		return -1;
++	}
++	size_t n = q->packets[q->head].len;
++	memcpy(buf, q->packets[q->head].buf, n);
++	q->head++;
++	q->head %= QUEUE_SIZE;
++	return n;
++}
++
++static void queue_reset(queue_t *q)
++{
++	q->head = q->tail = 0;
++}
++
++static int pull_timeout(gnutls_transport_ptr_t tr, unsigned ms)
++{
++	return 1;
++}
++
++static ssize_t server_pull(gnutls_transport_ptr_t tr, void *b, size_t l)
++{
++	return queue_get(&c2s, (gnutls_session_t)tr, b, l);
++}
++
++static ssize_t client_pull(gnutls_transport_ptr_t tr, void *b, size_t l)
++{
++	return queue_get(&s2c, (gnutls_session_t)tr, b, l);
++}
++
++static ssize_t server_push(gnutls_transport_ptr_t tr, const void *b, size_t l)
++{
++	return queue_put(&s2c, b, l);
++}
++
++static ssize_t client_push_normal(gnutls_transport_ptr_t tr, const void *b,
++				  size_t l)
++{
++	return queue_put(&c2s, b, l);
++}
++
++static void test(gnutls_push_func client_push)
++{
++	gnutls_session_t client, server;
++	gnutls_certificate_credentials_t ccred, scred;
++	int cr = 0, sr = 0;
++	bool cdone = false, sdone = false;
++
++	if (debug)
++		gnutls_global_set_log_level(4711);
++
++	gnutls_certificate_allocate_credentials(&scred);
++	gnutls_certificate_set_x509_key_mem(scred, &server_cert, &server_key,
++					    GNUTLS_X509_FMT_PEM);
++	gnutls_certificate_allocate_credentials(&ccred);
++
++	gnutls_init(&server, GNUTLS_SERVER | GNUTLS_DATAGRAM);
++	gnutls_init(&client, GNUTLS_CLIENT | GNUTLS_DATAGRAM);
++
++	gnutls_priority_set_direct(server, "NORMAL:-VERS-ALL:+VERS-DTLS1.2",
++				   NULL);
++	gnutls_priority_set_direct(client, "NORMAL:-VERS-ALL:+VERS-DTLS1.2",
++				   NULL);
++
++	gnutls_credentials_set(server, GNUTLS_CRD_CERTIFICATE, scred);
++	gnutls_credentials_set(client, GNUTLS_CRD_CERTIFICATE, ccred);
++
++	gnutls_dtls_set_timeouts(client, get_dtls_retransmit_timeout(),
++				 get_timeout());
++	gnutls_dtls_set_timeouts(server, get_dtls_retransmit_timeout(),
++				 get_timeout());
++
++	gnutls_transport_set_ptr(client, client);
++	gnutls_transport_set_push_function(client, client_push);
++	gnutls_transport_set_pull_function(client, client_pull);
++	gnutls_transport_set_pull_timeout_function(client, pull_timeout);
++
++	gnutls_transport_set_ptr(server, server);
++	gnutls_transport_set_push_function(server, server_push);
++	gnutls_transport_set_pull_function(server, server_pull);
++	gnutls_transport_set_pull_timeout_function(server, pull_timeout);
++
++	while (!cdone || !sdone) {
++		gnutls_global_set_log_function(client_log_func);
++		if (!cdone)
++			cr = gnutls_handshake(client);
++		if (!cr || gnutls_error_is_fatal(cr))
++			cdone = true;
++
++		gnutls_global_set_log_function(server_log_func);
++		if (!sdone)
++			sr = gnutls_handshake(server);
++		if (!sr || gnutls_error_is_fatal(sr))
++			sdone = true;
++	}
++
++	if (cr)
++		fail("client: %s\n", gnutls_strerror(cr));
++	if (sr)
++		fail("server: %s\n", gnutls_strerror(sr));
++
++	success("OK\n");
++
++	queue_reset(&c2s);
++	queue_reset(&s2c);
++
++	gnutls_deinit(client);
++	gnutls_deinit(server);
++	gnutls_certificate_free_credentials(ccred);
++	gnutls_certificate_free_credentials(scred);
++}
++
++void doit(void)
++{
++	global_init();
++	test(client_push_normal);
++	gnutls_global_deinit();
++}
++
++#endif /* _WIN32 */
+-- 
+2.53.0
+
diff --git a/meta/recipes-support/gnutls/gnutls/0002-buffers-shorten-merge_handshake_packet-using-recv_bu.patch b/meta/recipes-support/gnutls/gnutls/0002-buffers-shorten-merge_handshake_packet-using-recv_bu.patch
new file mode 100644
index 0000000000..aaf51992c2
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/0002-buffers-shorten-merge_handshake_packet-using-recv_bu.patch
@@ -0,0 +1,96 @@
+From 3ff7f6be9bb08463dd06765ab501430c4965ee05 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Fri, 17 Apr 2026 17:49:31 +0200
+Subject: [PATCH 2/8] buffers: shorten merge_handshake_packet using recv_buf
+
+I had vague concerns about thread-safety of this,
+but then this pattern already exists within the file.
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/9deffca528c23bbb218f5ec3bd4bb1bf4cbd1fc0]
+CVE: CVE-2026-33846
+Signed-off-by: Pritam Srichandan Sahoo <PritamSrichandan.Sahoo@windriver.com>
+---
+ lib/buffers.c | 52 +++++++++++++++++----------------------------------
+ 1 file changed, 17 insertions(+), 35 deletions(-)
+
+diff --git a/lib/buffers.c b/lib/buffers.c
+index 672380b05..d54c77022 100644
+--- a/lib/buffers.c
++++ b/lib/buffers.c
+@@ -967,9 +967,11 @@ static int merge_handshake_packet(gnutls_session_t session,
+ 	int exists = 0, i, pos = 0;
+ 	int ret;
+ 
++	handshake_buffer_st *recv_buf =
++		session->internals.handshake_recv_buffer;
++
+ 	for (i = 0; i < session->internals.handshake_recv_buffer_size; i++) {
+-		if (session->internals.handshake_recv_buffer[i].htype ==
+-		    hsk->htype) {
++		if (recv_buf[i].htype == hsk->htype) {
+ 			exists = 1;
+ 			pos = i;
+ 			break;
+@@ -1005,44 +1007,24 @@ static int merge_handshake_packet(gnutls_session_t session,
+ 		_gnutls_write_uint24(0, &hsk->header[6]);
+ 		_gnutls_write_uint24(hsk->length, &hsk->header[9]);
+ 
+-		_gnutls_handshake_buffer_move(
+-			&session->internals.handshake_recv_buffer[pos], hsk);
++		_gnutls_handshake_buffer_move(&recv_buf[pos], hsk);
+ 
+ 	} else {
+-		if (hsk->start_offset <
+-			    session->internals.handshake_recv_buffer[pos]
+-				    .start_offset &&
+-		    hsk->end_offset + 1 >=
+-			    session->internals.handshake_recv_buffer[pos]
+-				    .start_offset) {
+-			memcpy(&session->internals.handshake_recv_buffer[pos]
+-					.data.data[hsk->start_offset],
++		if (hsk->start_offset < recv_buf[pos].start_offset &&
++		    hsk->end_offset + 1 >= recv_buf[pos].start_offset) {
++			memcpy(&recv_buf[pos].data.data[hsk->start_offset],
+ 			       hsk->data.data, hsk->data.length);
+-			session->internals.handshake_recv_buffer[pos]
+-				.start_offset = hsk->start_offset;
+-			session->internals.handshake_recv_buffer[pos]
+-				.end_offset = MIN(
+-				hsk->end_offset,
+-				session->internals.handshake_recv_buffer[pos]
+-					.end_offset);
+-		} else if (hsk->end_offset >
+-				   session->internals.handshake_recv_buffer[pos]
+-					   .end_offset &&
+-			   hsk->start_offset <=
+-				   session->internals.handshake_recv_buffer[pos]
+-						   .end_offset +
+-					   1) {
+-			memcpy(&session->internals.handshake_recv_buffer[pos]
+-					.data.data[hsk->start_offset],
++			recv_buf[pos].start_offset = hsk->start_offset;
++			recv_buf[pos].end_offset =
++				MIN(hsk->end_offset, recv_buf[pos].end_offset);
++		} else if (hsk->end_offset > recv_buf[pos].end_offset &&
++			   hsk->start_offset <= recv_buf[pos].end_offset + 1) {
++			memcpy(&recv_buf[pos].data.data[hsk->start_offset],
+ 			       hsk->data.data, hsk->data.length);
+ 
+-			session->internals.handshake_recv_buffer[pos]
+-				.end_offset = hsk->end_offset;
+-			session->internals.handshake_recv_buffer[pos]
+-				.start_offset = MIN(
+-				hsk->start_offset,
+-				session->internals.handshake_recv_buffer[pos]
+-					.start_offset);
++			recv_buf[pos].end_offset = hsk->end_offset;
++			recv_buf[pos].start_offset = MIN(
++				hsk->start_offset, recv_buf[pos].start_offset);
+ 		}
+ 		_gnutls_handshake_buffer_clear(hsk);
+ 	}
+-- 
+2.53.0
+
diff --git a/meta/recipes-support/gnutls/gnutls/0003-buffers-add-more-checks-to-DTLS-reassembly.patch b/meta/recipes-support/gnutls/gnutls/0003-buffers-add-more-checks-to-DTLS-reassembly.patch
new file mode 100644
index 0000000000..d9c3c0d3c6
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/0003-buffers-add-more-checks-to-DTLS-reassembly.patch
@@ -0,0 +1,65 @@
+From dcd891a02e11dc13417800042d5272777fca0e97 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Fri, 17 Apr 2026 18:21:36 +0200
+Subject: [PATCH 3/8] buffers: add more checks to DTLS reassembly
+
+Previously, gnutls didn't check that DTLS fragments claimed
+a consistent message_length value.
+Additionally, a crucial array size check was missing,
+enabling an attacker to cause a heap overwrite.
+The updated version rejects fragments with mismatching length
+and adds a missing boundary check.
+
+Reported-by: Haruto Kimura (Stella)
+Reported-by: Oscar Reparaz
+Reported-by: Zou Dikai
+Fixes: #1816
+Fixes: #1838
+Fixes: #1839
+Fixes: CVE-2026-33846
+Fixes: GNUTLS-SA-2026-04-29-1
+CVSS: 7.4 High CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:N/I:H/A:H
+CVSS: 7.5 High CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/65ab33fa54e34fba69d793735b7df3d383d1ff78]
+CVE: CVE-2026-33846
+Signed-off-by: Pritam Srichandan Sahoo <PritamSrichandan.Sahoo@windriver.com>
+---
+ lib/buffers.c | 20 ++++++++++++++++++++
+ 1 file changed, 20 insertions(+)
+
+diff --git a/lib/buffers.c b/lib/buffers.c
+index d54c77022..5d4d16276 100644
+--- a/lib/buffers.c
++++ b/lib/buffers.c
+@@ -1010,6 +1010,26 @@ static int merge_handshake_packet(gnutls_session_t session,
+ 		_gnutls_handshake_buffer_move(&recv_buf[pos], hsk);
+ 
+ 	} else {
++		if (hsk->length != recv_buf[pos].length) {
++			/* inconsistent across fragments */
++			_gnutls_handshake_buffer_clear(hsk);
++			return gnutls_assert_val(
++				GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
++		}
++		/* start_offset + data.length <= hsk->length <= max_length */
++		if (hsk->length < hsk->start_offset + hsk->data.length) {
++			/* impossible claims, overflow requested */
++			_gnutls_handshake_buffer_clear(hsk);
++			return gnutls_assert_val(
++				GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
++		}
++		if (hsk->length > recv_buf[pos].data.max_length) {
++			/* we don't have this much allocated, overflow guard */
++			_gnutls_handshake_buffer_clear(hsk);
++			return gnutls_assert_val(
++				GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
++		}
++
+ 		if (hsk->start_offset < recv_buf[pos].start_offset &&
+ 		    hsk->end_offset + 1 >= recv_buf[pos].start_offset) {
+ 			memcpy(&recv_buf[pos].data.data[hsk->start_offset],
+-- 
+2.53.0
+
diff --git a/meta/recipes-support/gnutls/gnutls/0004-tests-mini-dtls-fragments-extend-with-a-1816-reprodu.patch b/meta/recipes-support/gnutls/gnutls/0004-tests-mini-dtls-fragments-extend-with-a-1816-reprodu.patch
new file mode 100644
index 0000000000..9b4760450f
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/0004-tests-mini-dtls-fragments-extend-with-a-1816-reprodu.patch
@@ -0,0 +1,159 @@
+From 2fa72585f927d340827eccdf91bb69cf60ac169e Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Wed, 1 Apr 2026 19:51:45 +0200
+Subject: [PATCH 4/8] tests/mini-dtls-fragments: extend with a #1816 reproducer
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/cf3f1955e58cbcc10373b841bb101fb058565d87]
+CVE: CVE-2026-33846
+Signed-off-by: Pritam Srichandan Sahoo <PritamSrichandan.Sahoo@windriver.com>
+---
+ tests/mini-dtls-fragments.c | 120 ++++++++++++++++++++++++++++++++++++
+ 1 file changed, 120 insertions(+)
+
+diff --git a/tests/mini-dtls-fragments.c b/tests/mini-dtls-fragments.c
+index ee75feeb6..8d5a18acd 100644
+--- a/tests/mini-dtls-fragments.c
++++ b/tests/mini-dtls-fragments.c
+@@ -106,6 +106,11 @@ static int pull_timeout(gnutls_transport_ptr_t tr, unsigned ms)
+ 	return 1;
+ }
+ 
++static int c2s_pull_timeout_once(gnutls_transport_ptr_t tr, unsigned ms)
++{
++	return c2s.head != c2s.tail ? 1 : 0;
++}
++
+ static ssize_t server_pull(gnutls_transport_ptr_t tr, void *b, size_t l)
+ {
+ 	return queue_get(&c2s, (gnutls_session_t)tr, b, l);
+@@ -198,10 +203,125 @@ static void test(gnutls_push_func client_push)
+ 	gnutls_certificate_free_credentials(scred);
+ }
+ 
++static void test_malicious1816(void)
++{
++	/* dgram1: msg_len=50, frag_offset=25, frag_len=25 */
++	static const uint8_t dgram1_hdr[] = {
++		0x16, /* type: handshake */
++		0xfe, 0xfd, /* version: DTLS 1.2 */
++		0x00, 0x00, /* epoch: 0 */
++		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* seq: 0 */
++		0x00, 0x25, /* record_length: 37 */
++		0x01, /* msg_type: ClientHello */
++		0x00, 0x00, 0x32, /* msg_length: 50 */
++		0x00, 0x00, /* msg_seq: 0 */
++		0x00, 0x00, 0x19, /* frag_offset: 25 */
++		0x00, 0x00, 0x19, /* frag_length: 25 */
++	};
++	/* dgram2: msg_len=3000, frag_offset=0, frag_len=48 */
++	static const uint8_t dgram2_hdr[] = {
++		0x16, /* type: handshake */
++		0xfe, 0xfd, /* version: DTLS 1.2 */
++		0x00, 0x00, /* epoch: 0 */
++		0x00, 0x00, 0x00, 0x00, 0x00, 0x01, /* seq: 1 */
++		0x00, 0x3c, /* record_length: 60 */
++		0x01, /* msg_type: ClientHello */
++		0x00, 0x0b, 0xb8, /* msg_length: 3000 */
++		0x00, 0x00, /* msg_seq: 0 */
++		0x00, 0x00, 0x00, /* frag_offset: 0 */
++		0x00, 0x00, 0x30, /* frag_length: 48 */
++	};
++	/* dgram3: msg_len=3000, frag_offset=40, frag_len=1475 */
++	static const uint8_t dgram3_hdr[] = {
++		0x16, /* type: handshake */
++		0xfe, 0xfd, /* version: DTLS 1.2 */
++		0x00, 0x00, /* epoch: 0 */
++		0x00, 0x00, 0x00, 0x00, 0x00, 0x02, /* seq: 2 */
++		0x05, 0xcf, /* record_length: 1487 */
++		0x01, /* msg_type: ClientHello */
++		0x00, 0x0b, 0xb8, /* msg_length: 3000 */
++		0x00, 0x00, /* msg_seq: 0 */
++		0x00, 0x00, 0x28, /* frag_offset: 40 */
++		0x00, 0x05, 0xc3, /* frag_length: 1475 */
++	};
++	/* dgram4: msg_len=3000, frag_offset=1500, frag_len=1475 */
++	static const uint8_t dgram4_hdr[] = {
++		0x16, /* type: handshake */
++		0xfe, 0xfd, /* version: DTLS 1.2 */
++		0x00, 0x00, /* epoch: 0 */
++		0x00, 0x00, 0x00, 0x00, 0x00, 0x03, /* seq: 3 */
++		0x05, 0xcf, /* record_length: 1487 */
++		0x01, /* msg_type: ClientHello */
++		0x00, 0x0b, 0xb8, /* msg_length: 3000 */
++		0x00, 0x00, /* msg_seq: 0 */
++		0x00, 0x05, 0xdc, /* frag_offset: 1500 */
++		0x00, 0x05, 0xc3, /* frag_length: 1475 */
++	};
++	gnutls_session_t server;
++	gnutls_certificate_credentials_t scred;
++	uint8_t dgram[1500];
++	int sr;
++
++	if (debug)
++		gnutls_global_set_log_level(4711);
++
++	gnutls_certificate_allocate_credentials(&scred);
++	gnutls_certificate_set_x509_key_mem(scred, &server_cert, &server_key,
++					    GNUTLS_X509_FMT_PEM);
++
++	gnutls_init(&server, GNUTLS_SERVER | GNUTLS_DATAGRAM);
++	gnutls_priority_set_direct(server, "NORMAL:+VERS-DTLS1.2", NULL);
++	gnutls_credentials_set(server, GNUTLS_CRD_CERTIFICATE, scred);
++
++	gnutls_dtls_set_timeouts(server, get_dtls_retransmit_timeout(),
++				 get_timeout());
++
++	gnutls_transport_set_ptr(server, server);
++	gnutls_transport_set_push_function(server, server_push);
++	gnutls_transport_set_pull_function(server, server_pull);
++	gnutls_transport_set_pull_timeout_function(server,
++						   c2s_pull_timeout_once);
++
++	memset(dgram, 0, sizeof(dgram));
++	memcpy(dgram, dgram1_hdr, 25);
++	queue_put(&c2s, dgram, 25 + 25);
++
++	memset(dgram, 0, sizeof(dgram));
++	memcpy(dgram, dgram2_hdr, 25);
++	queue_put(&c2s, dgram, 25 + 48);
++
++	memset(dgram, 0, sizeof(dgram));
++	memcpy(dgram, dgram3_hdr, 25);
++	queue_put(&c2s, dgram, 25 + 1475);
++
++	memset(dgram, 0, sizeof(dgram));
++	memcpy(dgram, dgram4_hdr, 25);
++	queue_put(&c2s, dgram, 25 + 1475);
++
++	gnutls_global_set_log_function(server_log_func);
++	do {
++		sr = gnutls_handshake(server); /* invalid write if vulnerable */
++	} while (c2s.head != c2s.tail && !gnutls_error_is_fatal(sr));
++	if (sr != GNUTLS_E_UNEXPECTED_PACKET_LENGTH)
++		fail("server: expected GNUTLS_E_UNEXPECTED_PACKET_LENGTH, "
++		     "got: %s\n",
++		     gnutls_strerror(sr));
++
++	success("OK\n");
++
++	queue_reset(&c2s);
++	queue_reset(&s2c);
++
++	gnutls_deinit(server);
++	gnutls_certificate_free_credentials(scred);
++}
++
+ void doit(void)
+ {
+ 	global_init();
+ 	test(client_push_normal);
++	success("malicious reassembly bug exploitation (#1816):\n");
++	test_malicious1816();
+ 	gnutls_global_deinit();
+ }
+ 
+-- 
+2.53.0
+
diff --git a/meta/recipes-support/gnutls/gnutls/0005-tests-mini-dtls-fragments-extend-with-fragmenting-Cl.patch b/meta/recipes-support/gnutls/gnutls/0005-tests-mini-dtls-fragments-extend-with-fragmenting-Cl.patch
new file mode 100644
index 0000000000..83c201926d
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/0005-tests-mini-dtls-fragments-extend-with-fragmenting-Cl.patch
@@ -0,0 +1,149 @@
+From cee203d6ba4d49332a49e46a7d59e9ef7b33a741 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Mon, 20 Apr 2026 16:08:11 +0200
+Subject: [PATCH 5/8] tests/mini-dtls-fragments: extend with fragmenting
+ ClientHello
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/bb427ff74dba849d40753ed9c8511e873f762743]
+CVE: CVE-2026-33846
+Signed-off-by: Pritam Srichandan Sahoo <PritamSrichandan.Sahoo@windriver.com>
+---
+ tests/mini-dtls-fragments.c | 107 ++++++++++++++++++++++++++++++++++++
+ 1 file changed, 107 insertions(+)
+
+diff --git a/tests/mini-dtls-fragments.c b/tests/mini-dtls-fragments.c
+index 8d5a18acd..93490bac2 100644
+--- a/tests/mini-dtls-fragments.c
++++ b/tests/mini-dtls-fragments.c
+@@ -132,6 +132,39 @@ static ssize_t client_push_normal(gnutls_transport_ptr_t tr, const void *b,
+ 	return queue_put(&c2s, b, l);
+ }
+ 
++static void write_u16(uint8_t *p, uint16_t val)
++{
++	p[0] = val >> 8;
++	p[1] = val & 0xff;
++}
++
++static void write_u24(uint8_t *p, uint32_t val)
++{
++	p[0] = (val >> 16) & 0xff;
++	p[1] = (val >> 8) & 0xff;
++	p[2] = val & 0xff;
++}
++
++static void write_u48(uint8_t *p, uint64_t seq)
++{
++	int i;
++	for (i = 5; i >= 0; i--) {
++		p[i] = seq & 0xff;
++		seq >>= 8;
++	}
++}
++
++static uint64_t read_u48(const uint8_t *p)
++{
++	uint64_t seq = 0;
++	int i;
++	for (i = 5; i >= 0; i--) {
++		seq <<= 8;
++		seq |= p[i];
++	}
++	return seq;
++}
++
+ static void test(gnutls_push_func client_push)
+ {
+ 	gnutls_session_t client, server;
+@@ -316,12 +349,86 @@ static void test_malicious1816(void)
+ 	gnutls_certificate_free_credentials(scred);
+ }
+ 
++static ssize_t queue_put_renumbered(queue_t *q, const uint8_t *data, size_t l,
++				    int delta_n)
++{
++	if (delta_n == 0 || l < 13 || data[3] != 0 || data[4] != 0)
++		return queue_put(&c2s, data, l);
++
++	uint8_t *p = malloc(l);
++	assert(p);
++	memcpy(p, data, l);
++	write_u48(p + 5, read_u48(p + 5) + delta_n);
++	ssize_t ret = queue_put(q, p, l);
++	free(p);
++	return ret;
++}
++
++static void split_client_hello(const uint8_t *data, size_t len, uint8_t **frag1,
++			       size_t *frag1_len, uint8_t **frag2,
++			       size_t *frag2_len)
++{
++	size_t body_size = len - 25;
++	*frag1_len = 13 + 12 + 1;
++	*frag2_len = 13 + 12 + (body_size - 1);
++
++	*frag1 = malloc(13 + 12 + 1);
++	assert(*frag1);
++	*frag2 = malloc(13 + 12 + body_size - 1);
++	assert(*frag2);
++
++	/* first fragment: record header + handshake header + first body byte */
++	memcpy(*frag1, data, 13); /* record header */
++	write_u16(*frag1 + 11, 12 + 1); /* record length */
++	memcpy(*frag1 + 13, data + 13, 12); /* handshake header */
++	write_u24(*frag1 + 19, 0); /* fragment_offset = 0 */
++	write_u24(*frag1 + 22, 1); /* fragment_length = 1 */
++	(*frag1)[25] = data[25]; /* first body byte */
++
++	/* second fragment: record header + handshake header + remaining body */
++	memcpy(*frag2, data, 13); /* record header */
++	write_u16(*frag2 + 11, *frag2_len - 13); /* record length */
++	write_u48(*frag2 + 5, read_u48(*frag2 + 5) + 1); /* sequence number */
++	memcpy(*frag2 + 13, data + 13, 12); /* handshake header */
++	write_u24(*frag2 + 19, 1); /* fragment_offset = 1 */
++	write_u24(*frag2 + 22, body_size - 1); /* shortened fragment_length */
++	memcpy(*frag2 + 25, data + 26, body_size - 1); /* remaining body */
++}
++
++static ssize_t client_push_split_hello(gnutls_transport_ptr_t tr, const void *b,
++				       size_t l)
++{
++	static int seq_offset = 0; /* for renumbering follow-up epoch0 ones */
++
++	const uint8_t *data = (const uint8_t *)b;
++	uint8_t *frag1, *frag2;
++	size_t frag1_len, frag2_len;
++
++	/* Pass through anything that isn't an epoch0 ClientHello with body */
++	if (l < 13 + 12 + 1 || /* too short for DTLS record header */
++	    data[0] != 22 || /* not a handshake record */
++	    data[3] != 0 || data[4] != 0 || /* not epoch 0 */
++	    data[13] != 1) /* not ClientHello */
++		return queue_put_renumbered(&c2s, b, l, seq_offset);
++
++	/* epoch0 Client Hello: special treatment of splitting into fragments */
++	split_client_hello(data, l, &frag1, &frag1_len, &frag2, &frag2_len);
++	queue_put(&c2s, frag1, frag1_len);
++	queue_put(&c2s, frag2, frag2_len);
++	free(frag1);
++	free(frag2);
++	seq_offset++;
++	return l;
++}
++
+ void doit(void)
+ {
+ 	global_init();
+ 	test(client_push_normal);
+ 	success("malicious reassembly bug exploitation (#1816):\n");
+ 	test_malicious1816();
++	success("split client hello smoke-test\n");
++	test(client_push_split_hello);
+ 	gnutls_global_deinit();
+ }
+ 
+-- 
+2.53.0
+
diff --git a/meta/recipes-support/gnutls/gnutls/0006-buffers-match-DTLS-datagrams-by-sequence-number.patch b/meta/recipes-support/gnutls/gnutls/0006-buffers-match-DTLS-datagrams-by-sequence-number.patch
new file mode 100644
index 0000000000..1627291512
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/0006-buffers-match-DTLS-datagrams-by-sequence-number.patch
@@ -0,0 +1,42 @@
+From bd8f76ce12a57962a62ce2818a6263fb04304c3f Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Mon, 20 Apr 2026 16:32:02 +0200
+Subject: [PATCH 6/8] buffers: match DTLS datagrams by sequence number
+
+DTLS handshake fragment reassembly previously matched incoming fragments
+by handshake type only, without checking the sequence number.
+This allowed fragments from different handshake messages
+to be merged into the same reassembly buffer.
+
+Now sequence number is accounted for during reassembly,
+ensuring fragments are only merged when they belong
+to the same handshake message.
+
+Reported-by: Zou Dikai
+Fixes: #1839
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/092c65d004e2f125f2fea3db84d801ac49a09f78]
+CVE: CVE-2026-33846
+Signed-off-by: Pritam Srichandan Sahoo <PritamSrichandan.Sahoo@windriver.com>
+---
+ lib/buffers.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/lib/buffers.c b/lib/buffers.c
+index 5d4d16276..62f140ed3 100644
+--- a/lib/buffers.c
++++ b/lib/buffers.c
+@@ -971,7 +971,8 @@ static int merge_handshake_packet(gnutls_session_t session,
+ 		session->internals.handshake_recv_buffer;
+ 
+ 	for (i = 0; i < session->internals.handshake_recv_buffer_size; i++) {
+-		if (recv_buf[i].htype == hsk->htype) {
++		if (recv_buf[i].htype == hsk->htype &&
++		    recv_buf[i].sequence == hsk->sequence) {
+ 			exists = 1;
+ 			pos = i;
+ 			break;
+-- 
+2.53.0
+
diff --git a/meta/recipes-support/gnutls/gnutls/0007-tests-mini-dtls-fragments-1839-mismatching-message_s.patch b/meta/recipes-support/gnutls/gnutls/0007-tests-mini-dtls-fragments-1839-mismatching-message_s.patch
new file mode 100644
index 0000000000..34bae2f57b
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/0007-tests-mini-dtls-fragments-1839-mismatching-message_s.patch
@@ -0,0 +1,104 @@
+From f7a5e7f3a7d05c7d558abd2f56f86e4c201be48b Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Mon, 20 Apr 2026 16:36:08 +0200
+Subject: [PATCH 7/8] tests/mini-dtls-fragments: #1839 mismatching message_seq
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/a2b41be83a1a3529c551ccf54958da91a656550e]
+CVE: CVE-2026-33846
+Signed-off-by: Pritam Srichandan Sahoo <PritamSrichandan.Sahoo@windriver.com>
+---
+ tests/mini-dtls-fragments.c | 54 ++++++++++++++++++++++++++++++++-----
+ 1 file changed, 47 insertions(+), 7 deletions(-)
+
+diff --git a/tests/mini-dtls-fragments.c b/tests/mini-dtls-fragments.c
+index 93490bac2..499a92a92 100644
+--- a/tests/mini-dtls-fragments.c
++++ b/tests/mini-dtls-fragments.c
+@@ -165,7 +165,7 @@ static uint64_t read_u48(const uint8_t *p)
+ 	return seq;
+ }
+ 
+-static void test(gnutls_push_func client_push)
++static void test(gnutls_push_func client_push, bool expect_success)
+ {
+ 	gnutls_session_t client, server;
+ 	gnutls_certificate_credentials_t ccred, scred;
+@@ -218,12 +218,22 @@ static void test(gnutls_push_func client_push)
+ 			sr = gnutls_handshake(server);
+ 		if (!sr || gnutls_error_is_fatal(sr))
+ 			sdone = true;
++
++		if (c2s.head == c2s.tail && s2c.head == s2c.tail)
++			break; /* speed the test up */
+ 	}
+ 
+-	if (cr)
+-		fail("client: %s\n", gnutls_strerror(cr));
+-	if (sr)
+-		fail("server: %s\n", gnutls_strerror(sr));
++	if (expect_success) {
++		if (cr)
++			fail("client: %s\n", gnutls_strerror(cr));
++		if (sr)
++			fail("server: %s\n", gnutls_strerror(sr));
++
++	} else {
++		if (cr == 0 && sr == 0)
++			fail("handshake unexpectedly succeeded: %s / %s\n",
++			     gnutls_strerror(cr), gnutls_strerror(sr));
++	}
+ 
+ 	success("OK\n");
+ 
+@@ -421,14 +431,44 @@ static ssize_t client_push_split_hello(gnutls_transport_ptr_t tr, const void *b,
+ 	return l;
+ }
+ 
++static ssize_t client_push_split_hello_bad_seq(gnutls_transport_ptr_t tr,
++					       const void *b, size_t l)
++{
++	/* gnutls wasn't matching on message_seq on merging, see #1839 */
++	static int seq_offset = 0; /* for renumbering follow-up epoch0 ones */
++
++	const uint8_t *data = (const uint8_t *)b;
++	uint8_t *frag1, *frag2;
++	size_t frag1_len, frag2_len;
++
++	/* Pass through anything that isn't an epoch0 ClientHello with body */
++	if (l < 13 + 12 + 1 || /* too short for DTLS record header */
++	    data[0] != 22 || /* not a handshake record */
++	    data[3] != 0 || data[4] != 0 || /* not epoch 0 */
++	    data[13] != 1) /* not ClientHello */
++		return queue_put_renumbered(&c2s, b, l, seq_offset);
++
++	/* epoch0 Client Hello: special treatment of splitting into fragments */
++	split_client_hello(data, l, &frag1, &frag1_len, &frag2, &frag2_len);
++	queue_put(&c2s, frag1, frag1_len);
++	frag2[18]++; /* WRONG, message_seq mismatch must be rejected, #1839 */
++	queue_put(&c2s, frag2, frag2_len);
++	free(frag1);
++	free(frag2);
++	seq_offset++;
++	return l;
++}
++
+ void doit(void)
+ {
+ 	global_init();
+-	test(client_push_normal);
++	test(client_push_normal, true);
+ 	success("malicious reassembly bug exploitation (#1816):\n");
+ 	test_malicious1816();
+ 	success("split client hello smoke-test\n");
+-	test(client_push_split_hello);
++	test(client_push_split_hello, true);
++	success("split client hello smoke-test and mangle sequence number\n");
++	test(client_push_split_hello_bad_seq, false);
+ 	gnutls_global_deinit();
+ }
+ 
+-- 
+2.53.0
+
diff --git a/meta/recipes-support/gnutls/gnutls/0008-tests-mini-dtls-framents-link-to-gnulib.patch b/meta/recipes-support/gnutls/gnutls/0008-tests-mini-dtls-framents-link-to-gnulib.patch
new file mode 100644
index 0000000000..9c4cfa8a94
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/0008-tests-mini-dtls-framents-link-to-gnulib.patch
@@ -0,0 +1,27 @@
+From ed40056cdcfdf9ff815f4e2df93f0a263769a563 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Thu, 30 Apr 2026 13:08:01 +0200
+Subject: [PATCH 8/8] tests/mini-dtls-framents: link to gnulib
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+Upstream-Status: Backport [https://github.com/gnutls/gnutls/commit/68b2fb63c8df61d1480121a859f8c955f4910c01]
+Signed-off-by: Pritam Srichandan Sahoo <PritamSrichandan.Sahoo@windriver.com>
+---
+ tests/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -509,6 +509,7 @@ pathbuf_CPPFLAGS = $(AM_CPPFLAGS) \
+ mini_dtls_fragments_CPPFLAGS = $(AM_CPPFLAGS) \
+ 	-I$(top_srcdir)/gl	\
+ 	-I$(top_builddir)/gl
++mini_dtls_fragments_LDADD = $(LDADD) ../gl/libgnu.la
+ 
+ if ENABLE_PKCS11
+ if !WINDOWS
+-- 
+2.53.0
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
index 8554ab943d..b92470768c 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
@@ -24,6 +24,14 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://run-ptest \
            file://Add-ptest-support.patch \
            file://c99.patch \
+           file://0001-tests-mini-dtls-fragments-implement-a-basic-DTLS-tes.patch \
+           file://0002-buffers-shorten-merge_handshake_packet-using-recv_bu.patch \
+           file://0003-buffers-add-more-checks-to-DTLS-reassembly.patch \
+           file://0004-tests-mini-dtls-fragments-extend-with-a-1816-reprodu.patch \
+           file://0005-tests-mini-dtls-fragments-extend-with-fragmenting-Cl.patch \
+           file://0006-buffers-match-DTLS-datagrams-by-sequence-number.patch \
+           file://0007-tests-mini-dtls-fragments-1839-mismatching-message_s.patch \
+           file://0008-tests-mini-dtls-framents-link-to-gnulib.patch \
            "
 
 SRC_URI[sha256sum] = "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51"
-- 
2.53.0


