Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B68FFC433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 17:23:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.10212.1637169792706245838
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 09:23:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FB09D6E
	for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 09:23:11 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22FA13F5A1
	for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 09:23:10 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] scripts/lnr: remove
Date: Wed, 17 Nov 2021 17:23:08 +0000
Message-Id: <20211117172308.204731-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 17:23:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158437

lnr is a script that implements the same behaviour as 'ln --relative
--symlink', as at the time of creation --relative was only available in
coreutils 8.16 onwards which was too new for the older supported distros.

Now, however, everyone has a new enough coreutils, so we can remove this
script.

All users of lnr should be replaced with ln --relative --symbolic.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/lnr | 24 ------------------------
 1 file changed, 24 deletions(-)
 delete mode 100755 scripts/lnr

diff --git a/scripts/lnr b/scripts/lnr
deleted file mode 100755
index a2ac4fec0f..0000000000
--- a/scripts/lnr
+++ /dev/null
@@ -1,24 +0,0 @@
-#! /usr/bin/env python3
-#
-# SPDX-License-Identifier: GPL-2.0-only
-#
-
-# Create a *relative* symlink, just like ln --relative does but without =
needing
-# coreutils 8.16.
-
-import sys, os
-
-if len(sys.argv) !=3D 3:
-   print("$ lnr TARGET LINK_NAME")
-   sys.exit(1)
-
-target =3D sys.argv[1]
-linkname =3D sys.argv[2]
-
-if os.path.isabs(target):
-   if not os.path.isabs(linkname):
-      linkname =3D os.path.abspath(linkname)
-   start =3D os.path.dirname(linkname)
-   target =3D os.path.relpath(target, start)
-
-os.symlink(target, linkname)
--=20
2.25.1


