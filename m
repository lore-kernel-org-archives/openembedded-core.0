Return-Path: <esben@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F94FC433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 14:35:22 +0000 (UTC)
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web08.26926.1640615719931861654
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Dec 2021 06:35:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@huawei.com header.s=first
 header.b=EGrrTG1s;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: esben@geanix.com)
Received: from localhost (80-62-117-153-mobile.dk.customer.tdc.net
 [80.62.117.153])
	by first.geanix.com (Postfix) with ESMTPSA id B80DDE1B67;
	Mon, 27 Dec 2021 14:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=huawei.com; s=first;
	t=1640615714; bh=m+DPyro5WbQNDzJJuTAVW8Wovd5kGnm18UI7CZVIYdU=;
	h=From:To:Cc:Subject:Date;
	b=EGrrTG1sT7GStL3xvL/fzXfn1sFcDLpCROwqTA7JE7MWB3OzDP6DNozIpQU2Z9kRW
	 iG3O+gUgKNZdhoMcze92nBAXPn1IEMQFaIu9mIjCkZOIM8C2kvfpMWHq244AHegOpE
	 2RrKcYEVBt2AA9Q2g0ZCt68A0I6QxqloXs9jkP1KO3308hEh3d9tGNqwHyAal/eowu
	 e5t30bfRum4KhD5nClsWG/YiFby8e/GgwdRdJvD8q2ZBWDYX6skGLufST2s+UqWidF
	 yUJAgeFGQlEN40qeCNZZThxrBKPYv1Rj/3Vvyan987AItjYiw6ATMblt44j0H8s99w
	 LokT5W9Rt5OLQ==
From: esben.haabendal@huawei.com
To: openembedded-core@lists.openembedded.org
Cc: Esben Haabendal <esben.haabendal@huawei.com>
Subject: [PATCH] musl: Fix building with pure LLVM toolchain
Date: Mon, 27 Dec 2021 15:35:08 +0100
Message-Id: 
 <58e0250eb36fccc1e43bf6f667073e87bac0a82f.1640615708.git.esben.haabendal@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Dec 2021 14:35:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160029

From: Esben Haabendal <esben.haabendal@huawei.com>

When building musl with a pure LLVM toolchain, we need compiler-rt instea=
d of
libgcc-initial.

Signed-off-by: Esben Haabendal <esben.haabendal@huawei.com>
---
 meta/recipes-core/musl/musl_git.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/=
musl_git.bb
index 06b0e060d015..2b307482c7aa 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -23,7 +23,7 @@ PROVIDES +=3D "virtual/libc virtual/libiconv virtual/li=
bintl virtual/crypt"
=20
 DEPENDS =3D "virtual/${TARGET_PREFIX}binutils \
            virtual/${TARGET_PREFIX}gcc \
-           libgcc-initial \
+           ${DEPENDS_COMPILER_RT} \
            linux-libc-headers \
            bsd-headers \
            libssp-nonshared \
@@ -31,6 +31,9 @@ DEPENDS =3D "virtual/${TARGET_PREFIX}binutils \
 GLIBC_LDSO =3D "${@get_glibc_loader(d)}"
 MUSL_LDSO_ARCH =3D "${@get_musl_loader_arch(d)}"
=20
+DEPENDS_COMPILER_RT =3D "libgcc-initial"
+DEPENDS_COMPILER_RT:toolchain-clang =3D "${@bb.utils.contains('COMPILER_=
RT', 'libgcc', 'libgcc-initial', 'compiler-rt', d)}"
+
 export CROSS_COMPILE=3D"${TARGET_PREFIX}"
=20
 LDFLAGS +=3D "-Wl,-soname,libc.so"
--=20
2.34.1


