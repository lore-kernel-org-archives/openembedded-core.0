Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58FD4C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 09:56:29 +0000 (UTC)
Received: from forward102o.mail.yandex.net (forward102o.mail.yandex.net
 [37.140.190.182])
 by mx.groups.io with SMTP id smtpd.web08.89793.1638352586439505784
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 01:56:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@zhukoff.net
 header.s=mail header.b=Y08Y7+lp;
 spf=pass (domain: zhukoff.net, ip: 37.140.190.182,
 mailfrom: pavel@zhukoff.net)
Received: from forward102q.mail.yandex.net (forward102q.mail.yandex.net
 [IPv6:2a02:6b8:c0e:1ba:0:640:516:4e7d])
	by forward102o.mail.yandex.net (Yandex) with ESMTP id D6D5E6FFAAD5;
	Wed,  1 Dec 2021 12:56:21 +0300 (MSK)
Received: from vla1-750737688af9.qloud-c.yandex.net
 (vla1-750737688af9.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:1389:0:640:7507:3768])
	by forward102q.mail.yandex.net (Yandex) with ESMTP id D2BEABF00012;
	Wed,  1 Dec 2021 12:56:21 +0300 (MSK)
Received: from vla5-47b3f4751bc4.qloud-c.yandex.net
 (vla5-47b3f4751bc4.qloud-c.yandex.net [2a02:6b8:c18:3508:0:640:47b3:f475])
	by vla1-750737688af9.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 IiYRWfYi16-uLe4rhhd;
	Wed, 01 Dec 2021 12:56:21 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; s=mail;
 t=1638352581;
	bh=/fzLebgbGdaz8fiR/zWKXgorYH34WhsvWiuefpOfuFo=;
	h=Date:Subject:To:From:Message-Id:Cc;
	b=Y08Y7+lppexPvn/INPKxcQ/VSUDfo3PJArxvp4AcW+ora1jW7ZIlDkZqTNYb6HS4n
	 tZckeJLq5y4IdA0hpRDyu7yGOjUCfTXi3IfypvCKmt5NVGMRD1foT/kWdKO/4UOei3
	 bnhhue2BqTQnLvvjScYnGgk0EcMuzg3Sb3Ip/MZk=
Authentication-Results: vla1-750737688af9.qloud-c.yandex.net;
 dkim=pass header.i=@zhukoff.net
Received: by vla5-47b3f4751bc4.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id D5sML5Cobq-uKR8pvtu;
	Wed, 01 Dec 2021 12:56:20 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
X-Yandex-Fwd: 2
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel.zhukov@huawei.com>,
	pavel@zhukoff.net
Subject: [dunfell][PATCH 1/2] busybox: Fix for CVE-2021-42374
Date: Wed,  1 Dec 2021 10:54:36 +0100
Message-Id: <20211201095437.15012-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 09:56:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159021

From: Pavel Zhukov <pavel.zhukov@huawei.com>

An out-of-bounds heap read in unlzma leads to information leak and
denial of service when crafted LZMA-compressed input is decompressed.
This can be triggered by any applet/format that internally supports
LZMA compression.

Reference: https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-42=
374

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
---
 .../busybox/busybox/CVE-2021-42374.patch      | 53 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.31.1.bb   |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2021-42374.patc=
h

diff --git a/meta/recipes-core/busybox/busybox/CVE-2021-42374.patch b/met=
a/recipes-core/busybox/busybox/CVE-2021-42374.patch
new file mode 100644
index 0000000000..aef8a3db85
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2021-42374.patch
@@ -0,0 +1,53 @@
+From 04f052c56ded5ab6a904e3a264a73dc0412b2e78 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Tue, 15 Jun 2021 15:07:57 +0200
+Subject: [PATCH] unlzma: fix a case where we could read before beginning=
 of
+ buffer
+Cc: pavel@zhukoff.net
+
+Testcase:
+
+  21 01 01 00 00 00 00 00 e7 01 01 01 ef 00 df b6
+  00 17 02 10 11 0f ff 00 16 00 00
+
+Unfortunately, the bug is not reliably causing a segfault,
+the behavior depends on what's in memory before the buffer.
+
+function                                             old     new   delta
+unpack_lzma_stream                                  2762    2768      +6
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
+
+CVE: CVE-2021-42374
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?h=3D1=
_33_stable&id=3Dd326be2850ea2bd78fe2c22d6c45c3b861d82937]
+Comment: testdata dropped because of binary format
+
+---
+ archival/libarchive/decompress_unlzma.c |   5 ++++-
+ testsuite/unlzma.tests                  |  17 +++++++++++++----
+ testsuite/unlzma_issue_3.lzma           | Bin 0 -> 27 bytes
+ 3 files changed, 17 insertions(+), 5 deletions(-)
+ create mode 100644 testsuite/unlzma_issue_3.lzma
+
+diff --git a/archival/libarchive/decompress_unlzma.c b/archival/libarchi=
ve/decompress_unlzma.c
+index 0744f231a1d64d92676b0cada2342f88f3b39b31..fb5aac8fe9ea0c53e0c2d7a7=
cbd05a753e39bc9d 100644
+--- a/archival/libarchive/decompress_unlzma.c
++++ b/archival/libarchive/decompress_unlzma.c
+@@ -290,8 +290,11 @@ unpack_lzma_stream(transformer_state_t *xstate)
+ 				uint32_t pos;
+=20
+ 				pos =3D buffer_pos - rep0;
+-				if ((int32_t)pos < 0)
++				if ((int32_t)pos < 0) {
+ 					pos +=3D header.dict_size;
++					if ((int32_t)pos < 0)
++						goto bad;
++				}
+ 				match_byte =3D buffer[pos];
+ 				do {
+ 					int bit;
+--=20
+2.34.0
+
diff --git a/meta/recipes-core/busybox/busybox_1.31.1.bb b/meta/recipes-c=
ore/busybox/busybox_1.31.1.bb
index d9d5f4f96b..55c00eb483 100644
--- a/meta/recipes-core/busybox/busybox_1.31.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.31.1.bb
@@ -52,6 +52,7 @@ SRC_URI =3D "https://busybox.net/downloads/busybox-${PV=
}.tar.bz2;name=3Dtarball \
            file://0001-hwclock-make-glibc-2.31-compatible.patch \
            file://0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patc=
h \
            file://0001-mktemp-add-tmpdir-option.patch \
+           file://CVE-2021-42374.patch \
            "
 SRC_URI_append_libc-musl =3D " file://musl.cfg "
=20
--=20
2.34.0


