Return-Path: <yanxk.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E6DC38A02
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 09:56:00 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.7372.1667210154038193605
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 02:55:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=tFebZQoj;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: yanxk.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667210151; i=@fujitsu.com;
	bh=O4djf1GDe8bA6ALJLQPOnKt2Uem03Teyqx7BRf/y8Kk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=tFebZQojyaLC7++2F+kpTILlfVdG8urFnl39ZLCW1Dnli3WGyXI4ySPnDd0X46K33
	 qDpOg7edMGQdBgfPocGrNlxdjgBpkLAmdFn7PZbDjEW3tEMoSme6YeElR84XtijBs7
	 dy2Xb5TrNGTOF6kxLdX8aqwPRG/KTZx3ZYhUxjm0ycVEsLqUVZBQcb+fzsj//cPI0J
	 qC0F5OBkbv3GaIlIvnNCLMI1d0mGlBieu2tKQStDRICIsNLQddNW8dy4OsdlyZCg+m
	 y0I9gIg4APKBSpyZo38t3YluA7bSXHj5OggpXu1VYqS+8y+Y79meFFdnL6dMm7i0+8
	 iBaDerIGA7YKw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRWlGSWpSXmKPExsViZ8MxSXf57Ph
  kg/MT2C3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oy2s6dYC06KV/xqes/cwDhJpIuRi0NI4DGj
  xI9N11ghnGtMEluPLGODcPYySiw8vxgow8nBJiAnsfjxVCCbg0NEQE/i6j9RkDCzgKdE17yZL
  CC2sICJxKJt71hASlgEVCVmPrQFCfMKuElc37KUGcSWAJqyY/UTJoi4oMTJmU9YIMZoSrRu/8
  0OYctLNG+dDVWvJHHn12VGCLtCYtasNiYIW03i6rlNzBMYBWYhGTULyahZSEYtYGRexWhWnFp
  Ullqka6aXVJSZnlGSm5iZo5dYpZuol1qqm5dfVJKha6iXWF6sl1pcrFdcmZuck6KXl1qyiREY
  uinFSZw7GOcs+6N3iFGSg0lJlLerLz5ZiC8pP6UyI7E4I76oNCe1+BCjDAeHkgRv9xSgnGBRa
  npqRVpmDjCOYNISHDxKIrxTZgCleYsLEnOLM9MhUqcYLTnuLty7l5nj45+LQHLq7H/7mYVY8v
  LzUqXEeVfNAmoQAGnIKM2DGweL9UuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHnng6zlycw
  rgdv6CuggJqCD2NrjQA4qSURISTUwGXWl/Ui72Hiu0K7kbSRfiES4uHGjydzwTNnNbC6XLsco
  FLQ9ZqzQNdl0V+29rTrT0pO++QKrjjl4zJVVOyqx4u98xS5T+bsrFMI9Gd6+8Vdlr3+ga1V5v
  9Ph6VzVdfX7PD0S/i2QLdye7tITqTDFTayrLPPFvEbG4riW2z3MXT/Uha+z54a+0DrWp5eunv
  Xj/pulX1Tup9wvyPi8cG+g7BN+1R2z5nV1sv6XnSZ3c/HLtC9Hoydc+Xz48w49g3v+FfGsB97
  3eu9YrmDD8Nd3f4iR3h/h2Zvfzd1wUljv99Z4LuUjWl0TeC4kWqbw57P8eTvznfB704cM3urr
  7kw+mTvlz2GrXapfbs0Wm+ekxFKckWioxVxUnAgAJkeVaXADAAA=
X-Env-Sender: yanxk.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-732.messagelabs.com!1667210150!115357!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9598 invoked from network); 31 Oct 2022 09:55:51 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 31 Oct 2022 09:55:51 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 8DEF91000D7
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 09:55:50 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 817C31000C1
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 09:55:50 +0000 (GMT)
Received: from localhost.localdomain (10.167.218.229) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 31 Oct 2022 09:55:48 +0000
From: <yanxk.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: <fnstml-fujitsuten@fujitsu.com>, Yan Xinkuan <yanxk.fnst@fujitsu.com>
Subject: [meta-oe][oe-core][PATCH V4] bc: Add ptest.
Date: Thu, 27 Oct 2022 11:09:12 +0800
Message-ID: <1666840152-10530-1-git-send-email-yanxk.fnst@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 09:56:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172300

From: Yan Xinkuan <yanxk.fnst@fujitsu.com>

Add package test function for OSS 'bc',
using bc in the system to do calculation
jobs according to the .b files from the
source code file of 'bc'.

Test example as below:
......
.00673400673400673400
=E2=80=9CPASS: bc/div.b=E2=80=9D
9983640860328357366034714556282968349582
7909199408566065153345558783\
9427595471.89114392327665123852
=E2=80=9CPASS: bc/exp.b=E2=80=9D
length(b)=3D 1406
=E2=80=9CPASS: bc/fact.b=E2=80=9D
......

If bc runs the .b files and does not crash,
it would 'PASS', otherwise it would 'FAIL'.

Tested in qemux86-64, with kvm enabled, test
cost 12 secs, so it should be a fast test.

Thanks to Ross Burton and Alexander Kanavin
for the professional guidance.

Signed-off-by: Yan Xinkuan <yanxk.fnst@fujitsu.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 1 +
 meta/recipes-extended/bc/bc/run-ptest           | 9 +++++++++
 meta/recipes-extended/bc/bc_1.07.1.bb           | 9 +++++++--
 3 files changed, 17 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/bc/bc/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 56088e4e66..0a52a48ef1 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -69,6 +69,7 @@ PTESTS_FAST =3D "\
     slang-ptest \
     wayland-ptest \
     zlib-ptest \
+    bc-ptest \
 "
 PTESTS_FAST:append:libc-glibc =3D " glibc-tests-ptest"
 PTESTS_PROBLEMS:remove:libc-glibc =3D "glibc-tests-ptest"
diff --git a/meta/recipes-extended/bc/bc/run-ptest b/meta/recipes-extended/bc/bc/run-ptest
new file mode 100644
index 0000000000..da2156f8cd
--- /dev/null
+++ b/meta/recipes-extended/bc/bc/run-ptest
@@ -0,0 +1,9 @@
+#! /bin/sh
+
+for TEST in *.b; do
+	if bc -l $TEST </dev/null; then
+		echo =E2=80=9CPASS: bc/$TEST=E2=80=9D
+        else
+		echo =E2=80=9CFAIL: bc/$TEST=E2=80=9D
+        fi
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


