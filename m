Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.95.1795121919594474332
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 12:58:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7ACCF40800;
	Thu, 19 Nov 2026 20:58:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id acXEXWxIm2zT; Thu, 19 Nov 2026 20:58:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 52637406B5;
	Thu, 19 Nov 2026 20:58:36 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 6390D169AD0;
	Thu, 19 Nov 2026 15:58:35 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [PATCH] kernel-fit-image: make loadables load address optional
Date: Thu, 19 Nov 2026 15:58:34 -0500
Message-Id: <20261119205834.697816-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 20:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250722
Content-Type: text/plain; charset="utf-8"

From: Denys Dmytriyenko <denys@konsulko.com>

When support for FIT image loadables was added, both the commit
message[1] and the configuration file[2] had this text:

> Sensible defaults will be used for some parameters (type, compression,
> description, arch, os) if the corresponding flag is not set, while
> others (load address and entry point) will be omitted in the final FIT
> image.

Yet, the code actually checks for the load address to be specified.
Let's make it optional, as intended.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D2535427d8=
de07f6e432d08cbdc046bdfd8788911
[2] https://git.openembedded.org/openembedded-core/tree/meta/conf/image-f=
itimage.conf#n104

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta/classes-recipe/kernel-fit-image.bbclass | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-=
recipe/kernel-fit-image.bbclass
index abf7327c97..0c8dac23ee 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -174,14 +174,11 @@ python do_compile() {
         if not loadable_file:
             bb.fatal("File for loadable %s not specified through FIT_LOA=
DABLE_FILENAME[%s]" % (loadable, loadable))
=20
-        loadable_loadaddress =3D d.getVarFlag('FIT_LOADABLE_LOADADDRESS'=
, loadable)
-        if not loadable_loadaddress:
-            bb.fatal("Load address for loadable %s not specified through=
 FIT_LOADABLE_LOADADDRESS[%s]" % (loadable, loadable))
-
         # Optional parameters
         loadable_arch =3D d.getVarFlag('FIT_LOADABLE_ARCH', loadable)
         loadable_compression =3D d.getVarFlag('FIT_LOADABLE_COMPRESSION'=
, loadable)
         loadable_description =3D d.getVarFlag('FIT_LOADABLE_DESCRIPTION'=
, loadable) or ("%s loadable" % loadable)
+        loadable_loadaddress =3D d.getVarFlag('FIT_LOADABLE_LOADADDRESS'=
, loadable)
         loadable_entrypoint =3D d.getVarFlag('FIT_LOADABLE_ENTRYPOINT', =
loadable)
         loadable_os =3D d.getVarFlag('FIT_LOADABLE_OS', loadable)
         loadable_type =3D d.getVarFlag('FIT_LOADABLE_TYPE', loadable)
--=20
2.25.1

