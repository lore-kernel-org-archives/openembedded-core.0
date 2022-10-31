Return-Path: <yanxk.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E00FA3741
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 23:55:36 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web08.521.1667260528527729120
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 16:55:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=tOGThs+E;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: yanxk.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667260526; i=@fujitsu.com;
	bh=ZSeXommMw4kLEwL8pGWezAfEQ6mxVUkQlEtf4TL4vXA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=tOGThs+ExmaLrMbrue0F00Lg94wC+2WK0/5OLUGiEZgyys1ZYvkbgXrBSS+I/7INL
	 rK9dSVbCszR/ufouya0AVnwrZ+nN9YaWh4Eq2YeGscbVR0gvre7xEoqjZTPj9iuBvF
	 sXcob3A2h1e7t2bg1k3MmM5bGuAkXBtiwLbabzm8QHzqJ/+/Q1dZYNlMmBxEnFm1+g
	 pxjm/vfl/Hv8RTzaAPdtMv/q+cvF0hBiYPvWOEGxSKEt+knTjHWG7RgGZ031x6H5Qx
	 I3gK7rXHbnb4lIeIUt4DKiJxrxCcxm310jx86AdFDZiZ/Z3PQ0T7Ne4LqrTHlvRGZy
	 gRjNIgTV86dKQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8MxSTcnISH
  ZoGcNt8Wdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnHtkUfBA7GK453X2RoYtwh3MXJyCAk8ZpRY
  foSxi5ELyL7GJPFhZTMrhLOXUWJH+2U2kCo2ATmJxY+nAiU4OEQE9CSu/hMFCTMLeEp0zZvJA
  mILC5hItDbfYgaxWQRUJCb/Oc4EYvMKuEpc/bYNrEYCaMyO1U+g4oISJ2c+YYGYoynRuv03O4
  QtL9G8dTYzRL2SxJ1flxkh7AqJWbPamCBsNYmr5zYxT2AUmIVk1Cwko2YhGbWAkXkVo1lxalF
  ZapGuoYleUlFmekZJbmJmjl5ilW6iXmqpbnlqcYmuoV5iebFeanGxXnFlbnJOil5easkmRmDg
  phSzrdrB+GvZH71DjJIcTEqivP8lEpKF+JLyUyozEosz4otKc1KLDzHKcHAoSfDuDAXKCRalp
  qdWpGXmAKMIJi3BwaMkwlsXCJTmLS5IzC3OTIdInWI05vj45+JeZo6ps//tZxZiycvPS5US59
  0YB1QqAFKaUZoHNwgW3ZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfO+ApnCk5lXArfvFdA
  pTECnsLXHgZxSkoiQkmpgEtSLy7Cyl2VQqvZ78bbY14XzzXvOQoO5G2eFL5jL8HtVe/wyz8q8
  Cf4Zxy1VWT10bNq9pC5N8Pq8mLvf4ARXpueyZlm+VUYrVjL+mFNQc/rL3B9zP1lXPnWeLFK82
  23aSvlHh6Yv3HpIo3TrxEcfLnCxfNGauSRW4KBqmIqqfaBm26UTnj+lDXiO7pLS/cBv9uWCrA
  PT/i0mFRol0eclZ0x5G9cg999+Js8v5otRbVrcj+w+3Mqab2ah8da7jis4K11nge0kRYGelif
  lMks8H9xWZGxh/HzU2STn5r6GW1Urz8xvcar2rd7DvjTQtkxCYdPrl7NdRZ36U8PSrk4M3d0U
  u0SbMXMV40WFE3lKLMUZiYZazEXFiQDTGgViaQMAAA==
X-Env-Sender: yanxk.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-591.messagelabs.com!1667260523!868740!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7775 invoked from network); 31 Oct 2022 23:55:24 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-9.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 31 Oct 2022 23:55:24 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A26DB1000F5
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 23:55:23 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 9A38A1000E9
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 23:55:23 +0000 (GMT)
Received: from localhost.localdomain (10.167.218.229) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 31 Oct 2022 23:55:21 +0000
From: <yanxk.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: <fnstml-fujitsuten@fujitsu.com>, Yan Xinkuan <yanxk.fnst@fujitsu.com>
Subject: [meta-oe][oe-core][PATCH V5] bc: Add ptest.
Date: Tue, 1 Nov 2022 07:55:11 +0800
Message-ID: <1667260511-2913-1-git-send-email-yanxk.fnst@fujitsu.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.218.229]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 23:55:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172348

From: Yan Xinkuan <yanxk.fnst@fujitsu.com>

Add ptest for OSS 'bc' by using 'bc' in the system to do calculation jobs according to the .b files from the source file.

Test example as below:
......
.00673400673400673400
=E2=80=9CPASS: bc/div.b=E2=80=9D
99836408603283573660347145562829683495827909199408566065153345558783\
9427595471.89114392327665123852
=E2=80=9CPASS: bc/exp.b=E2=80=9D
length(b)=3D 1406
=E2=80=9CPASS: bc/fact.b=E2=80=9D
......

If bc runs the .b files and does not crash, it would 'PASS', otherwise 'FAIL'.

Tested in qemux86-64, with kvm enabled, test cost 12 secs, so it should be a fast test.

Thanks to Ross Burton and Alexander Kanavin for the professional guidance.

Signed-off-by: Yan Xinkuan <yanxk.fnst@fujitsu.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 1 +
 meta/recipes-extended/bc/bc/run-ptest           | 9 +++++++++
 meta/recipes-extended/bc/bc_1.07.1.bb           | 9 +++++++--
 3 files changed, 17 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/bc/bc/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 56088e4e66..32b0e5297a 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -8,6 +8,7 @@ PTESTS_FAST =3D "\
     apr-ptest \
     apr-util-ptest \
     attr-ptest \
+    bc-ptest \
     bluez5-ptest \
     bzip2-ptest \
     diffstat-ptest \
diff --git a/meta/recipes-extended/bc/bc/run-ptest b/meta/recipes-extended/bc/bc/run-ptest
new file mode 100644
index 0000000000..66a1b9d708
--- /dev/null
+++ b/meta/recipes-extended/bc/bc/run-ptest
@@ -0,0 +1,9 @@
+#! /bin/sh
+
+for TEST in *.b; do
+	if bc -l $TEST </dev/null; then
+		echo =E2=80=9CPASS: bc/$TEST=E2=80=9D
+	else
+		echo =E2=80=9CFAIL: bc/$TEST=E2=80=9D
+	fi
+done
diff --git a/meta/recipes-extended/bc/bc_1.07.1.bb b/meta/recipes-extended/bc/bc_1.07.1.bb
index 1bec76bb2a..178588f11b 100644
--- a/meta/recipes-extended/bc/bc_1.07.1.bb
+++ b/meta/recipes-extended/bc/bc_1.07.1.bb
@@ -15,11 +15,12 @@ DEPENDS =3D "flex-native"
 SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://no-gen-libmath.patch \
            file://libmath.h \
-           file://0001-dc-fix-exit-code-of-q-command.patch"
+           file://0001-dc-fix-exit-code-of-q-command.patch \
+           file://run-ptest"
 SRC_URI[md5sum] =3D "cda93857418655ea43590736fc3ca9fc"
 SRC_URI[sha256sum] =3D "62adfca89b0a1c0164c2cdca59ca210c1d44c3ffc46daf9931cf4942664cb02a"
 
-inherit autotools texinfo update-alternatives
+inherit autotools texinfo update-alternatives ptest
 
 PACKAGECONFIG =3F=3F=3D "readline"
 PACKAGECONFIG[readline] =3D "--with-readline,--without-readline,readline"
@@ -29,6 +30,10 @@ do_compile:prepend() {
     cp -f ${WORKDIR}/libmath.h ${B}/bc/libmath.h
 }
 
+do_install_ptest() {
+        install ${S}/Test/*.b ${D}${PTEST_PATH}
+}
+
 ALTERNATIVE:${PN} =3D "bc dc"
 ALTERNATIVE_PRIORITY =3D "100"
 
-- 
2.25.1


