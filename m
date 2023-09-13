Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE9FCA5506
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 08:02:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6644.1694592169798665016
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 01:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=IEDr4KB3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7620aff610=yogita.urade@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38D6vtI7000605
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 01:02:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=PPS06212021; bh=dtVJKpId2dhMrVhTBN
	oOf9JAINhEI5M2fYsKFXmVBDU=; b=IEDr4KB3Wyrzg74oMLLPnchtVho3JjRuEt
	KIw8b3MZSdmYqZMuNKTd/WcKDiInIt6FXu3VHCLhVYUXpYOeAXkmfmgZX2RGzutQ
	SBF8+ioqDqSMB/ReOT1ZyFJWFHgWE+1K54vDi9DMcOJJGVODBFrZ2rQ29c389Mzg
	4qPoUraG1jjbTi8H1caFZcObNij3AC+7l9jZ54CuM2HkMrb/d1mhdkq8EFcWtWWI
	5mAFxC1OAOyLfBOIjXOqfzGZe7NXAH8217zsebZqM0Zs0GE1EU+TMMRqoY/6zZS+
	WilvPHwOlypkD97vrTInrHLZm0yp8OPNR6+gq84ScnXHSKflBQyA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t2yafgdaf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 01:02:49 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 01:02:46 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][mickledore][PATCH 1/2] qemu: fix CVE-2023-3354
Date: Wed, 13 Sep 2023 08:02:28 +0000
Message-ID: <20230913080229.196711-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: nhwQQcZURSvhJe3oJDHHEor4PHpGX_xj
X-Proofpoint-ORIG-GUID: nhwQQcZURSvhJe3oJDHHEor4PHpGX_xj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_24,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309130066
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 38D6vtI7000605
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 08:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187552

From: Yogita Urade <yogita.urade@windriver.com>

A flaw was found in the QEMU built-in VNC server. When a client connects
to the VNC server, QEMU checks whether the current number of connections
crosses a certain threshold and if so, cleans up the previous connection.
If the previous connection happens to be in the handshake phase and fails=
,
QEMU cleans up the connection again, resulting in a NULL pointer derefere=
nce
issue. This could allow a remote unauthenticated client to cause a denial
of service.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2023-3354

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2023-3354.patch             | 88 +++++++++++++++++++
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3354.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index bc0d956e18..2efe63cdc0 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -40,6 +40,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
 	   file://CVE-2023-3301.patch \
 	   file://CVE-2023-3255.patch \
 	   file://CVE-2023-2861.patch \
+	   file://CVE-2023-3354.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-3354.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2023-3354.patch
new file mode 100644
index 0000000000..b3958ecbf5
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-3354.patch
@@ -0,0 +1,88 @@
+From 10be627d2b5ec2d6b3dce045144aa739eef678b4 Mon Sep 17 00:00:00 2001
+From: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
+Date: Tue, 12 Sep 2023 06:38:03 +0000
+Subject: [PATCH] io: remove io watch if TLS channel is closed during han=
dshake
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+The TLS handshake make take some time to complete, during which time an
+I/O watch might be registered with the main loop. If the owner of the
+I/O channel invokes qio_channel_close() while the handshake is waiting
+to continue the I/O watch must be removed. Failing to remove it will
+later trigger the completion callback which the owner is not expecting
+to receive. In the case of the VNC server, this results in a SEGV as
+vnc_disconnect_start() tries to shutdown a client connection that is
+already gone / NULL.
+
+CVE-2023-3354
+Reported-by: jiangyegen <jiangyegen@huawei.com>
+Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
+
+CVE: CVE-2023-3354
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/10be627d2b5ec2d6b3dce045144aa739eef678b4]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ include/io/channel-tls.h |  1 +
+ io/channel-tls.c         | 18 ++++++++++++------
+ 2 files changed, 13 insertions(+), 6 deletions(-)
+
+diff --git a/include/io/channel-tls.h b/include/io/channel-tls.h
+index 5672479e9..ccd510ade 100644
+--- a/include/io/channel-tls.h
++++ b/include/io/channel-tls.h
+@@ -48,6 +48,7 @@ struct QIOChannelTLS {
+     QIOChannel *master;
+     QCryptoTLSSession *session;
+     QIOChannelShutdown shutdown;
++    guint hs_ioc_tag;
+ };
+
+ /**
+diff --git a/io/channel-tls.c b/io/channel-tls.c
+index 4ce890a53..17d73f02e 100644
+--- a/io/channel-tls.c
++++ b/io/channel-tls.c
+@@ -195,12 +195,13 @@ static void qio_channel_tls_handshake_task(QIOChan=
nelTLS *ioc,
+         }
+
+         trace_qio_channel_tls_handshake_pending(ioc, status);
+-        qio_channel_add_watch_full(ioc->master,
+-                                   condition,
+-                                   qio_channel_tls_handshake_io,
+-                                   data,
+-                                   NULL,
+-                                   context);
++        ioc->hs_ioc_tag =3D
++            qio_channel_add_watch_full(ioc->master,
++                                       condition,
++                                       qio_channel_tls_handshake_io,
++                                       data,
++                                       NULL,
++                                       context);
+     }
+ }
+
+@@ -215,6 +216,7 @@ static gboolean qio_channel_tls_handshake_io(QIOChan=
nel *ioc,
+     QIOChannelTLS *tioc =3D QIO_CHANNEL_TLS(
+         qio_task_get_source(task));
+
++    tioc->hs_ioc_tag =3D 0;
+     g_free(data);
+     qio_channel_tls_handshake_task(tioc, task, context);
+
+@@ -374,6 +376,10 @@ static int qio_channel_tls_close(QIOChannel *ioc,
+ {
+     QIOChannelTLS *tioc =3D QIO_CHANNEL_TLS(ioc);
+
++    if (tioc->hs_ioc_tag) {
++        g_clear_handle_id(&tioc->hs_ioc_tag, g_source_remove);
++    }
++
+     return qio_channel_close(tioc->master, errp);
+ }
+
+--
+2.35.5
--=20
2.40.0


