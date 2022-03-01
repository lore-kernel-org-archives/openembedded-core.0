Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 099BEC433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 23:55:45 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web08.1981.1646178943049965089
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 15:55:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=TOOYBKu4;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 55E4680F47;
	Wed,  2 Mar 2022 00:55:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1646178940;
	bh=SI31fFEOG9B3oz+ue1AZehO5Dc02tIi8chN6yDstuAE=;
	h=From:To:Cc:Subject:Date:From;
	b=TOOYBKu4Z0GV2nM6xl6fjhJ3vFGcgONTovaSZWg4DqCqq2MIm6WI+GTkzsnSVaqxV
	 DsVTNSavLgkbiiQNjeIHOPl/NI3eidGvlYsZ/oZXaWHDa771yE4ND+7x3JHgYAYzZz
	 Lv5I+MjbFKJGySY+u02Wa1OgK4nsN4ygdFxV5OI7XVySh0WiLJjOHft2/NOW+qcy8v
	 8OIFfYdSlqj9c/+6vY5AG1LkM2XrXc5WFKTShsoA9AfS5jzi16ZylTQPsf57AWFtHP
	 slEmdvqxFznFgsNt77lMg4bmWjuI+4zdGe/3ogs6VmPoeMxMprqzuYg8gxF5gNMWwE
	 gWbC1pi3IhjOQ==
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Nathan Rossi <nathan@nathanrossi.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH] cml1.bbclass: Handle ncurses-native being available
 via pkg-config
Date: Wed,  2 Mar 2022 00:55:32 +0100
Message-Id: <20220301235532.2210708-1-marex@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 23:55:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162582

From: Nathan Rossi <nathan@nathanrossi.com>

The linux kernel will by default use pkg-config to get ncurses(w) paths,
falling back to absolute path checks otherwise. If the build host does
not have ncurses installed this will fail as pkg-config will not search
the native sysroot for ncurses.

To more all kernel/kconfig sources, inject the equivalent native
pkg-config variables similar to what is done by the pkg-config-native
script. This only affects the menuconfig python task itself and the
oe_terminal call inside it.

(cherry picked from commit abb95c421bb67d452691819e3f63dabd02e2ba37)
Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cml1.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index 8ab240589a..46a19fce32 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -36,6 +36,14 @@ python do_menuconfig() {
     except OSError:
         mtime =3D 0
=20
+    # setup native pkg-config variables (kconfig scripts call pkg-config=
 directly, cannot generically be overriden to pkg-config-native)
+    d.setVar("PKG_CONFIG_DIR", "${STAGING_DIR_NATIVE}${libdir_native}/pk=
gconfig")
+    d.setVar("PKG_CONFIG_PATH", "${PKG_CONFIG_DIR}:${STAGING_DATADIR_NAT=
IVE}/pkgconfig")
+    d.setVar("PKG_CONFIG_LIBDIR", "${PKG_CONFIG_DIR}")
+    d.setVarFlag("PKG_CONFIG_SYSROOT_DIR", "unexport", "1")
+    # ensure that environment variables are overwritten with this tasks =
'd' values
+    d.appendVar("OE_TERMINAL_EXPORTS", " PKG_CONFIG_DIR PKG_CONFIG_PATH =
PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR")
+
     oe_terminal("sh -c \"make %s; if [ \\$? -ne 0 ]; then echo 'Command =
failed.'; printf 'Press any key to continue... '; read r; fi\"" % d.getVa=
r('KCONFIG_CONFIG_COMMAND'),
                 d.getVar('PN') + ' Configuration', d)
=20
--=20
2.34.1


