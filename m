Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AFA0C02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 23:22:32 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by mx.groups.io with SMTP id smtpd.web10.652.1737760944581634321
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 15:22:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=mx-20241105 header.b=BhvOEXqM;
 spf=pass (domain: denx.de, ip: 89.58.32.78, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57332108796F8;
	Sat, 25 Jan 2025 00:22:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1737760942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=C6ZZnQl7Ep1Jj0IwkX1hVyP7tlGsZpHpOQXcYbDJSOk=;
	b=BhvOEXqMM8+kU0c7OLbbckgrtSceghLlY9i5BxFv2Sa8snYS/gMh/sG80p/yCKgHu3o/gh
	cOueK0kkMw/RYw+TnFpwMocy9RQwEWTXl1a3kXE35J3DPsPxVmVXJhahxVelhI5mAYvt6k
	efVjkHKLLbTaa5lb+aeZ6fVm122hSrf1rtmS6FreKqFZtqFhSxct3S5sp0Cfb1L3t8l9ZP
	fef1CcvIqp8TM5nWnvoIDfrBNqDvgLZL8jon+bW9d0FlKr9bhmZ9rVGOnvw133JkMnOUFj
	ktMafmz/r2xsIpaFcOiHQK9h5T0C7u4iLWI74WJuopVjuo6k4OyUPv1hgemADg==
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Alexander Kanavin <alex@linutronix.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mark Hatle <mark.hatle@kernel.crashing.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH v2] base-files: Drop /bin/sh dependency
Date: Sat, 25 Jan 2025 00:21:47 +0100
Message-ID: <20250124232203.285484-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 23:22:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210256

Remove /bin/sh from bash RPROVIDES as this has a side-effect which
confuses rpm package manager when also busybox provides /bin/sh and
base-files depend on /bin/sh . The problem is broken down below.

First, bash depends on base-files and bash pkg_postinst must run
after base-files was installed, because it requires /etc/shells
provided by base-files to be in place.

Second, base-files depends on /bin/sh, which is provided by either
bash or busybox in this case. This is the actual problem here, if
bash is selected as /bin/sh provider, then there is cyclic dependency
between bash and base-files, and that confuses dnf which may install
the packages in the wrong order, bash first and base-files second .

To make this worse, if busybox is also /bin/sh provider, it can and
does happen that some systems pick busybox as the /bin/sh provider,
while others pick bash as the /bin/sh provider, and that cyclic
dependency does not always appear.

Attempt to break this dependency, remove pre-inst script from the
base-files recipe, which removes its dependency on /bin/sh and
allows it to be installed very early, and always before bash.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexander Kanavin <alex@linutronix.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
V2: - Rename from bash: Drop /bin/sh from RPROVIDES
    - Replace the bash change with removal of base-files preinst script
    - Drop the RFC part
    - Update commit message
---
 .../base-files/base-files_3.0.14.bb           | 23 -------------------
 1 file changed, 23 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/rec=
ipes-core/base-files/base-files_3.0.14.bb
index 8bcd91e699d..60253fcd421 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -72,29 +72,6 @@ hostname =3D "${MACHINE}"
=20
 BASEFILESISSUEINSTALL ?=3D "do_install_basefilesissue"
=20
-# In previous versions of base-files, /run was a softlink to /var/run an=
d the
-# directory was located in /var/volatlie/run.  Also, /var/lock was a sof=
tlink
-# to /var/volatile/lock which is where the real directory was located.  =
Now,
-# /run and /run/lock are the real directories.  If we are upgrading, we =
may
-# need to remove the symbolic links first before we create the directori=
es.
-# Otherwise the directory creation will fail and we will have circular s=
ymbolic
-# links.
-#=20
-pkg_preinst:${PN} () {
-    #!/bin/sh -e
-    if [ x"$D" =3D "x" ]; then
-        if [ -h "/var/lock" ]; then
-            # Remove the symbolic link
-            rm -f /var/lock
-        fi
-
-        if [ -h "/run" ]; then
-            # Remove the symbolic link
-            rm -f /run
-        fi
-    fi    =20
-}
-
 do_install () {
 	for d in ${dirs555}; do
 		install -m 0555 -d ${D}$d
--=20
2.45.2


