Return-Path: <a.kikin@tano-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC37C61DA4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 13:18:44 +0000 (UTC)
Received: from forward108o.mail.yandex.net (forward108o.mail.yandex.net [37.140.190.206])
 by mx.groups.io with SMTP id smtpd.web10.6469.1676380715817024430
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 05:18:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@tano-systems.com header.s=mail header.b=D1o5kPYy;
 spf=pass (domain: tano-systems.com, ip: 37.140.190.206, mailfrom: a.kikin@tano-systems.com)
Received: from myt5-18b0513eae63.qloud-c.yandex.net (myt5-18b0513eae63.qloud-c.yandex.net [IPv6:2a02:6b8:c12:571f:0:640:18b0:513e])
	by forward108o.mail.yandex.net (Yandex) with ESMTP id EB4D55DD4A9A
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 16:18:31 +0300 (MSK)
Received: by myt5-18b0513eae63.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id 9IjrX83YwOs1-EV2Zu3jb;
	Tue, 14 Feb 2023 16:18:31 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tano-systems.com; s=mail;
	t=1676380711; bh=YU5aDgaIj5q4bMaKbS83R62TFsytSFc0fYweDMIFMao=;
	h=Message-Id:Date:Cc:Subject:To:From;
	b=D1o5kPYyO6khqkyvVQvhB+luLP2to6eK/Jyrg/y6H2BUy6aab9WLNqAOI2ZIOIVJw
	 KpZDm6Vhckgb/sImISL7VIHk68QAxZ+rlYgVH1ZNpb/JkKu3TMz7LQgmlYEp+iUcRv
	 KpOlNF89VN7dxhRM7VN056rLePoJ9r4maWxF2GCo=
Authentication-Results: myt5-18b0513eae63.qloud-c.yandex.net; dkim=pass header.i=@tano-systems.com
From: Anton Kikin <a.kikin@tano-systems.com>
To: openembedded-core@lists.openembedded.org
Cc: Anton Kikin <a.kikin@tano-systems.com>
Subject: [PATCH] busybox: Fix excluding .debug from depmod
Date: Tue, 14 Feb 2023 16:17:34 +0300
Message-Id: <20230214131734.2002-1-a.kikin@tano-systems.com>
X-Mailer: git-send-email 2.34.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 13:18:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177141

The previously added patch for excluding .debug from depmod has an
invalid expression in the condition. The strstr function returns
NULL if substring is NOT found [1]. Therefore, the existing patch,
on the opposite, handles only modules that have a .debug substring
in the path. This commit fixes the condition in the patch to the
correct one.

[1]: https://man7.org/linux/man-pages/man3/strstr.3.html

Signed-off-by: Anton Kikin <a.kikin@tano-systems.com>
---
 .../busybox/0001-depmod-Ignore-.debug-directories.patch    | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox/0001-depmod-Ignore-.debug-=
directories.patch b/meta/recipes-core/busybox/busybox/0001-depmod-Ignore-=
.debug-directories.patch
index 354f83a4a5..3398a354c5 100644
--- a/meta/recipes-core/busybox/busybox/0001-depmod-Ignore-.debug-directo=
ries.patch
+++ b/meta/recipes-core/busybox/busybox/0001-depmod-Ignore-.debug-directo=
ries.patch
@@ -1,6 +1,6 @@
 From 5f6ed003f10ee0bd4a508d5f59129a29f0920dfc Mon Sep 17 00:00:00 2001
-From: Saul Wold <saul.wold@windriver.com>
-Date: Thu, 31 Mar 2022 11:21:45 -0700
+From: Anton Kikin <a.kikin@tano-systems.com>
+Date: Tue, 14 Feb 2023 15:46:42 +0300
 Subject: [PATCH] depmod: Ignore .debug directories
=20
 The .debug/<module>.ko files do not have the correct symbol information
@@ -9,6 +9,7 @@ since it's split away from the actual <module>.ko file. J=
ust ignore it.
 Upstream-Status: Pending
=20
 Signed-off-by: Saul Wold <saul.wold@windriver.com>
+Signed-off-by: Anton Kikin <a.kikin@tano-systems.com>
 ---
  modutils/depmod.c | 3 +++
  1 file changed, 3 insertions(+)
@@ -21,7 +22,7 @@ index bb42bbe..aa5a2de 100644
  	/* Arbitrary. Was sb->st_size, but that breaks .gz etc */
  	size_t len =3D (64*1024*1024 - 4096);
 =20
-+	if (strstr(fname, ".debug") =3D=3D NULL)
++	if (strstr(fname, ".debug"))
 +		return TRUE;
 +
  	if (strrstr(fname, ".ko") =3D=3D NULL)
--=20
2.34.1.windows.1


