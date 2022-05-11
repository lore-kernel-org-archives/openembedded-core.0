Return-Path: <jonas.hoeppner@garz-fricke.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E509C433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 16:05:48 +0000 (UTC)
Received: from mx2.garz-fricke.com (mx2.garz-fricke.com [213.23.127.198])
 by mx.groups.io with SMTP id smtpd.web12.1391.1652285145212333138
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 09:05:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garz-fricke.com header.s=dkim-key-2022r
 header.b=NiVNtqWD;
 spf=pass (domain: garz-fricke.com, ip: 213.23.127.198,
 mailfrom: jonas.hoeppner@garz-fricke.com)
DKIM-Signature: v=1; c=relaxed/relaxed; d=garz-fricke.com; s=dkim-key-2022e;
 t=1652285141; bh=QcEN4AeRj0dSDGzynycu+ktfogiaVOnhXM5oTaj5hUI=; h=
 "Subject:Subject:From:From:Date:Date:ReplyTo:ReplyTo:Cc:Cc:Message-Id:Message-Id";
 a=ed25519-sha256; b=
 HmSiLyG8L+UfFGbVZGBG33eXOTxkVtY3oYv+0ItoyVuqWcsHPhNfCA9+e1hHEdAVdv2Gq0+cXJA60SIIZYnyBg==
DKIM-Signature: v=1; c=relaxed/relaxed; d=garz-fricke.com; s=dkim-key-2022r;
 t=1652285141; bh=QcEN4AeRj0dSDGzynycu+ktfogiaVOnhXM5oTaj5hUI=; h=
 "Subject:Subject:From:From:Date:Date:ReplyTo:ReplyTo:Cc:Cc:Message-Id:Message-Id";
 a=rsa-sha256; b=
 NiVNtqWDJ6bUQpuswmtAGcC8ssxF7nXfPp/ARxXaHNHFwjEAaIrusljBQ/apFdlGsy9VRa171hqkykwdZST9IH1RKeUGGL2sXxqZIR0KZd4/tFFhz1xqaY8GKETMBKtzIlN6Jg+0WszXeIqLMYOy5cLviYCX1uhGnMNb/qiBKg6FLebuJj3aHAwA//1IX3UvGIPltD9cg7jX2RwXnqw+fo3irfBdUgw/+itgkM1hGTjx6F/l+ID3cuHWxcIIyJbzVHRqqu3d2V2IyqQKE0x+irdZBSqcmcJj006M2HfUZ/NnapOlzDijV6F1sOo8/PzPZc6OeEv6yjBnHpabMjx+/Q==
From: =?iso-8859-1?Q?Jonas_H=F6ppner?= <jonas.hoeppner@garz-fricke.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] classes/kernel.bbclass: allow disabling symlink
 creation also for pkg_postinst
Thread-Topic: [OE-core] [PATCH] classes/kernel.bbclass: allow disabling
 symlink creation also for pkg_postinst
Thread-Index: AQHYZVBILzJzYssaKEqXTyafdCjSMw==
Date: Wed, 11 May 2022 16:05:39 +0000
Message-ID: <ccb29f6aba164c4fa6ff8a1ae4718c91@garz-fricke.com>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 16:05:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165503

The commit d7341f1f22c32ff6cc95d7127f26f87d7fc9c6bd has introduced a
variable to disable the symlink creation for kernel images.
kernel.bbclass contains code to generate a pkg_posinst step for the
kernel-image package which will generate a symlink after installation
on target/during rootfs creation. This part didn't checked the
KERNEL_IMAGETYPE_SYMLINK variable.


This patch adds this check, so that it is possible to disable this
symlink also.


Signed-off-by: Jonas H=F6ppner <jonas.hoeppner@garz-fricke.com>
---
=A0meta/classes/kernel.bbclass | 6 ++++--
=A01 file changed, 4 insertions(+), 2 deletions(-)


diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 8299b394a7..87e0970f00 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -93,6 +93,7 @@ python __anonymous () {
=A0
=A0 =A0 =A0kname =3D d.getVar('KERNEL_PACKAGE_NAME') or "kernel"
=A0 =A0 =A0imagedest =3D d.getVar('KERNEL_IMAGEDEST')
+=A0 =A0 kernel_imagetype_symlink =3D d.getVar('KERNEL_IMAGETYPE_SYMLINK')
=A0
=A0 =A0 =A0for type in types.split():
=A0 =A0 =A0 =A0 =A0if bb.data.inherits_class('nopackages', d):
@@ -110,7 +111,8 @@ python __anonymous () {
=A0
=A0 =A0 =A0 =A0 =A0d.setVar('PKG:%s-image-%s' % (kname,typelower), '%s-imag=
e-%s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
=A0 =A0 =A0 =A0 =A0d.setVar('ALLOW_EMPTY:%s-image-%s' % (kname, typelower),=
 '1')
-=A0 =A0 =A0 =A0 d.setVar('pkg_postinst:%s-image-%s' % (kname,typelower), "=
""set +e
+=A0 =A0 =A0 =A0 if kernel_imagetype_symlink =3D=3D 1:
+=A0 =A0 =A0 =A0 =A0 =A0 d.setVar('pkg_postinst:%s-image-%s' % (kname,typel=
ower), """set +e
=A0if [ -n "$D" ]; then
=A0 =A0 =A0ln -sf %s-${KERNEL_VERSION} $D/${KERNEL_IMAGEDEST}/%s > /dev/nul=
l 2>&1
=A0else
@@ -122,7 +124,7 @@ else
=A0fi
=A0set -e
=A0""" % (type, type, type, type, type, type, type))
-=A0 =A0 =A0 =A0 d.setVar('pkg_postrm:%s-image-%s' % (kname,typelower), """=
set +e
+=A0 =A0 =A0 =A0 =A0 =A0 d.setVar('pkg_postrm:%s-image-%s' % (kname,typelow=
er), """set +e
=A0if [ -f "${KERNEL_IMAGEDEST}/%s" -o -L "${KERNEL_IMAGEDEST}/%s" ]; then
=A0 =A0 =A0rm -f ${KERNEL_IMAGEDEST}/%s=A0 > /dev/null 2>&1
=A0fi




  =20
     =


