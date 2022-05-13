Return-Path: <jonas.hoeppner@garz-fricke.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9660CC433F5
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 11:05:10 +0000 (UTC)
Received: from mx2.garz-fricke.com (mx2.garz-fricke.com [213.23.127.198])
 by mx.groups.io with SMTP id smtpd.web08.6847.1652439906615419706
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 04:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garz-fricke.com header.s=dkim-key-2022r
 header.b=lTWJTmGE;
 spf=pass (domain: garz-fricke.com, ip: 213.23.127.198,
 mailfrom: jonas.hoeppner@garz-fricke.com)
DKIM-Signature: v=1; c=relaxed/relaxed; d=garz-fricke.com; s=dkim-key-2022e;
 t=1652439902; bh=23FNfOqBKyXaYKpFCFUxzPTO8ffYrNePnrH3nNb01NM=; h=
 "Subject:Subject:From:From:Date:Date:ReplyTo:ReplyTo:Cc:Cc:Message-Id:Message-Id";
 a=ed25519-sha256; b=
 HeixZm9dtAeCLPn5vttbvUzXVqk7ehUjpK4PqKZNyYGj2u8yTjKVFvy91ru0wESq2rJp6Z3IBeqE3AyqJ13SCA==
DKIM-Signature: v=1; c=relaxed/relaxed; d=garz-fricke.com; s=dkim-key-2022r;
 t=1652439902; bh=23FNfOqBKyXaYKpFCFUxzPTO8ffYrNePnrH3nNb01NM=; h=
 "Subject:Subject:From:From:Date:Date:ReplyTo:ReplyTo:Cc:Cc:Message-Id:Message-Id";
 a=rsa-sha256; b=
 lTWJTmGEqGzfqBQyHZhFA3RgfwEGFNBSahcMiiEo9h1gckZyKUSjehQsEmqafrwGy96FHBG7R4KmV2l7WYFg9xBnJSKwQj8YzHrTm0KQiAIRr2Ivn241Jv2HePdbuhNBBLHsJaFeREiHrzJPhP4JCR0MT1uSposXBb6N95opDGLQpJvsZwHQSU452mjxalLKv+ZX8L+1si2OouaYRbTGIrxX0kjfzBeoloL6Lu69p7wtQiwesIac0+Ce8yixjMcR5hKTUm2U3/RglQKlT7UiEiZOP1n9nksz0OaKZju2LBYVGB/abteXJPyygjaj+PdbIS8/02lkx9YH66YVCssyJQ==
From: =?UTF-8?q?Jonas=20H=C3=B6ppner?= <jonas.hoeppner@garz-fricke.com>
To: <openembedded-core@lists.openembedded.org>
CC: =?UTF-8?q?Jonas=20H=C3=B6ppner?= <jonas.hoeppner@garz-fricke.com>
Subject: [OE-Core][PATCH v2] classes/kernel.bbclass: allow disabling symlink
 creation also for pkg_postinst
Date: Fri, 13 May 2022 13:04:49 +0200
Message-ID: <20220513110449.167244-1-jonas.hoeppner@garz-fricke.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SRV99.hamburg.garz-fricke.de
 (2a00:3:e0c:32e:4537:3e4b:56fa:2bb4) To srv99.hamburg.garz-fricke.de
 (2a00:3:e0c:32e:4537:3e4b:56fa:2bb4)
Content-Transfer-Encoding: QUOTED-PRINTABLE
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 May 2022 11:05:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165555

From: Jonas H=C3=B6ppner <jonas.hoeppner@garz-fricke.com>

The commit d7341f1f22c32ff6cc95d7127f26f87d7fc9c6bd has introduced a
variable to disable the symlink creation for kernel images.
kernel.bbclass contains code to generate a pkg=5Fposinst step for the
kernel-image package which will generate a symlink after installation
on target/during rootfs creation. This part didn't checked the
KERNEL=5FIMAGETYPE=5FSYMLINK variable.

This patch adds this check, so that it is possible to disable this
symlink also.

Signed-off-by: Jonas H=C3=B6ppner <jonas.hoeppner@garz-fricke.com>
---
 meta/classes/kernel.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 8299b394a7..87e0970f00 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -93,6 +93,7 @@ python =5F=5Fanonymous () {
 
     kname =3D d.getVar('KERNEL=5FPACKAGE=5FNAME') or "kernel"
     imagedest =3D d.getVar('KERNEL=5FIMAGEDEST')
+    kernel=5Fimagetype=5Fsymlink =3D d.getVar('KERNEL=5FIMAGETYPE=5FSYMLINK')
 
     for type in types.split():
         if bb.data.inherits=5Fclass('nopackages', d):
@@ -110,7 +111,8 @@ python =5F=5Fanonymous () {
 
         d.setVar('PKG:%s-image-%s' % (kname,typelower), '%s-image-%s-${KERNEL=
=5FVERSION=5FPKG=5FNAME}' % (kname, typelower))
         d.setVar('ALLOW=5FEMPTY:%s-image-%s' % (kname, typelower), '1')
-        d.setVar('pkg=5Fpostinst:%s-image-%s' % (kname,typelower), """set +e
+        if kernel=5Fimagetype=5Fsymlink =3D=3D 1:
+            d.setVar('pkg=5Fpostinst:%s-image-%s' % (kname,typelower), """set=
 +e
 if [ -n "$D" ]; then
     ln -sf %s-${KERNEL=5FVERSION} $D/${KERNEL=5FIMAGEDEST}/%s > /dev/null 2>&=
1
 else
@@ -122,7 +124,7 @@ else
 fi
 set -e
 """ % (type, type, type, type, type, type, type))
-        d.setVar('pkg=5Fpostrm:%s-image-%s' % (kname,typelower), """set +e
+            d.setVar('pkg=5Fpostrm:%s-image-%s' % (kname,typelower), """set +=
e
 if [ -f "${KERNEL=5FIMAGEDEST}/%s" -o -L "${KERNEL=5FIMAGEDEST}/%s" ]; then
     rm -f ${KERNEL=5FIMAGEDEST}/%s  > /dev/null 2>&1
 fi
-- 
2.25.1

