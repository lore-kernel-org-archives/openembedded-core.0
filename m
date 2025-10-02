Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B667CCD185
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 00:08:19 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.890.1759363697315395689
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 17:08:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4B4AD40CC7;
	Thu,  2 Oct 2025 00:08:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S8ClvmChjlyo; Thu,  2 Oct 2025 00:08:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 21B9340CC3;
	Thu,  2 Oct 2025 00:08:15 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 5C93C16405C;
	Wed,  1 Oct 2025 20:08:13 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [RFC PATCH 5/5] packagegroups, dpkg: extend musl conditionals to baremetal
Date: Wed,  1 Oct 2025 20:08:10 -0400
Message-Id: <20251002000810.226673-5-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251002000810.226673-1-denis@denix.org>
References: <20251002000810.226673-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 00:08:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224334

From: Denys Dmytriyenko <denys@konsulko.com>

Some packagegroups have conditional inclusion of packages based on
their compatibility with specific libc providers. Add baremetal
config, which is mostly similar to musl, that baremetal uses as libc.

[YOCTO #15982]

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-sdk.bb        | 1 +
 .../packagegroups/packagegroup-core-tools-profile.bb            | 2 ++
 .../packagegroups/packagegroup-core-tools-testapps.bb           | 1 +
 meta/recipes-devtools/dpkg/dpkg.inc                             | 1 +
 4 files changed, 5 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/m=
eta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index e6d704b5ba..2fd815508f 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -42,6 +42,7 @@ SANITIZERS:nios2 =3D ""
 SANITIZERS:riscv64 =3D ""
 SANITIZERS:riscv32 =3D ""
 SANITIZERS:libc-musl =3D ""
+SANITIZERS:libc-baremetal =3D ""
=20
 RRECOMMENDS:packagegroup-core-sdk =3D "\
     libgomp \
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-prof=
ile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.=
bb
index 9c09f5ab44..501559771e 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -28,6 +28,7 @@ PERF:riscv32 =3D ""
 # systemtap needs elfutils which is not fully buildable on some arches/l=
ibcs
 SYSTEMTAP =3D "systemtap"
 SYSTEMTAP:libc-musl =3D ""
+SYSTEMTAP:libc-baremetal =3D ""
 SYSTEMTAP:nios2 =3D ""
 SYSTEMTAP:riscv32 =3D ""
=20
@@ -41,6 +42,7 @@ BABELTRACE2 =3D "babeltrace2"
=20
 VALGRIND =3D "valgrind"
 VALGRIND:libc-musl =3D ""
+VALGRIND:libc-baremetal =3D ""
 VALGRIND:mipsarch =3D ""
 VALGRIND:nios2 =3D ""
 VALGRIND:arc =3D ""
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-test=
apps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapp=
s.bb
index 25561f6878..b77739871e 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -17,6 +17,7 @@ KEXECTOOLS:nios2 ?=3D ""
 KEXECTOOLS:riscv64 ?=3D ""
 KEXECTOOLS:riscv32 ?=3D ""
 KEXECTOOLS:loongarch64 ?=3D ""
+KEXECTOOLS:libc-baremetal ?=3D ""
=20
 # go does not support ppc32, only ppc64
 # https://github.com/golang/go/issues/22885
diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/=
dpkg/dpkg.inc
index b4e9667107..e091fdb5cd 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -116,6 +116,7 @@ ALTERNATIVE_PRIORITY =3D "100"
=20
 EXTRA_RDPENDS =3D "ldconfig"
 EXTRA_RDPENDS:libc-musl =3D ""
+EXTRA_RDPENDS:libc-baremetal =3D ""
 RDEPENDS:${PN} +=3D "${PN}-start-stop ${EXTRA_RDPENDS}"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


