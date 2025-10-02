Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E14CCD182
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 00:08:19 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.953.1759363697277299696
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 17:08:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3E89C40CC4;
	Thu,  2 Oct 2025 00:08:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RruW7Q6o1onk; Thu,  2 Oct 2025 00:08:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1AC6F40A20;
	Thu,  2 Oct 2025 00:08:15 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 2B6AA163E3C;
	Wed,  1 Oct 2025 20:08:13 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [RFC PATCH 1/5] baremetal, linux-dummy: bypass kernel dependencies for baremetal
Date: Wed,  1 Oct 2025 20:08:06 -0400
Message-Id: <20251002000810.226673-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 00:08:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224337

From: Denys Dmytriyenko <denys@konsulko.com>

When building something for baremetal configs (such as firmware
images for heterogeneous cores), you don't normally include Linux
kernel. But yocto-check-layer (and possibly other tools) tend to
dump "world" signatures and trip over a large number of Linux
kernel depdencies from other recipes and packagegroups. Those
aren't limited to directly depending on virtual/kernel, but also
everything else kernel-related, such as tools, device trees and
especially a large number of specific kernel module RRECOMMENDS.

As linux-dummy was originally created to specifically cut down all
such kernel dependencies when it's not built or packaged normally,
we can re-use it for baremetal configs as well.

Since linux-dummy can now be used outside of Linux host, update
COMPATIBLE_HOST accordingly.

Also, cut out kernel-devsrc (kernel sources) from the world build
completely - it is quite weird and very custom on its own.

[YOCTO #15982]

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta/conf/distro/include/tclibc-baremetal.inc | 1 +
 meta/recipes-kernel/linux/kernel-devsrc.bb    | 2 ++
 meta/recipes-kernel/linux/linux-dummy.bb      | 2 --
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/tclibc-baremetal.inc b/meta/conf/di=
stro/include/tclibc-baremetal.inc
index abea5a7162..adac212dc0 100644
--- a/meta/conf/distro/include/tclibc-baremetal.inc
+++ b/meta/conf/distro/include/tclibc-baremetal.inc
@@ -8,6 +8,7 @@ LIBCOVERRIDE =3D ":libc-baremetal"
=20
 ASSUME_PROVIDED +=3D "virtual/libc virtual/libiconv virtual/crypt"
=20
+PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-dummy"
 PREFERRED_PROVIDER_virtual/libc ?=3D "musl"
 PREFERRED_PROVIDER_virtual/libiconv ?=3D "musl"
 PREFERRED_PROVIDER_virtual/libintl ?=3D "gettext"
diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-ke=
rnel/linux/kernel-devsrc.bb
index 04dd683dde..dbad6f113a 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -423,3 +423,5 @@ RDEPENDS:${PN} +=3D "${@bb.utils.contains('ARCH', 'po=
werpc', 'elfutils-dev', '', d
 RDEPENDS:${PN} +=3D "gcc-plugins libmpc-dev"
 # 5.13+ needs grep for powerpc
 RDEPENDS:${PN}:append:powerpc =3D " grep"
+
+EXCLUDE_FROM_WORLD =3D "1"
diff --git a/meta/recipes-kernel/linux/linux-dummy.bb b/meta/recipes-kern=
el/linux/linux-dummy.bb
index d7f39a452d..6199787a71 100644
--- a/meta/recipes-kernel/linux/linux-dummy.bb
+++ b/meta/recipes-kernel/linux/linux-dummy.bb
@@ -25,8 +25,6 @@ DESCRIPTION:kernel-vmlinux =3D "Kernel vmlinux meta pac=
kage"
=20
 INHIBIT_DEFAULT_DEPS =3D "1"
=20
-COMPATIBLE_HOST =3D ".*-linux"
-
 SRC_URI =3D "file://COPYING.GPL"
=20
 S =3D "${UNPACKDIR}"
--=20
2.25.1


