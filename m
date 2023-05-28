Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3712C7EE29
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 17:15:28 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.33250.1685294121007228148
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 May 2023 10:15:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1805B40C24
	for <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 17:15:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wK4NrjvF6ulb
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 May 2023 17:15:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0597B40A03
	for <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 17:15:19 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id B26001638F5;
	Sun, 28 May 2023 13:14:33 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH] u-boot: do_compile depends on the value of UBOOT_LOCALVERSION
Date: Sun, 28 May 2023 17:15:15 +0000
Message-Id: <20230528171515.832179-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 17:15:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181848

UBOOT_LOCALVERSION is often used to pass SCM commit SHA to the code
via populating .scmversion file at the start of do_compile(). Let's
explicitly mark do_compile() as depending on the the value of this
variable to avoid errors like this:

$ echo 'UBOOT_LOCALVERSION =3D "${SRCPV}"' >> conf/local.conf
$ bitbake u-boot
Loading cache: 100%
Loaded 0 entries from dependency cache.
WARNING: /OE/poky-master/meta/recipes-bsp/u-boot/u-boot_2023.04.bb: Excep=
tion during build_dependencies for do_compile
WARNING: /OE/poky-master/meta/recipes-bsp/u-boot/u-boot_2023.04.bb: Error=
 during finalise of /OE/poky-master/meta/recipes-bsp/u-boot/u-boot_2023.0=
4.bb
ERROR: ExpansionError during parsing /OE/poky-master/meta/recipes-bsp/u-b=
oot/u-boot_2023.04.bb
Traceback (most recent call last):
  File "Var <SRCPV>", line 1, in <module>
  File "/OE/poky-master/bitbake/lib/bb/fetch2/__init__.py", line 784, in =
get_srcrev(d=3D<bb.data_smart.DataSmart object at 0x7fa0604a7100>, method=
_name=3D'sortable_revision'):
         if not scms:
    >        raise FetchError("SRCREV was used yet no valid SCM was found=
 in SRC_URI")

bb.data_smart.ExpansionError: Failure expanding variable SRCPV, expressio=
n was ${@bb.fetch2.get_srcrev(d)} which triggered exception FetchError: F=
etcher failure: SRCREV was used yet no valid SCM was found in SRC_URI
The variable dependency chain for the failure is: SRCPV -> UBOOT_LOCALVER=
SION -> do_compile

ERROR: Parsing halted due to errors, see error messages above

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot=
/u-boot.inc
index b3482dcef3..ec8108f5c9 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -23,6 +23,7 @@ PACKAGECONFIG[openssl] =3D ",,openssl-native"
 # u-boot build system and appended to the u-boot version.  If the .scmve=
rsion
 # file already exists it will not be overwritten.
 UBOOT_LOCALVERSION ?=3D ""
+do_compile[vardepvalue] =3D "${UBOOT_LOCALVERSION}"
=20
 require u-boot-configure.inc
=20
--=20
2.25.1


