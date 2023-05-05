Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51C20C7EE23
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 13:21:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.26950.1683292907991512833
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 06:21:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEE231FB;
	Fri,  5 May 2023 06:22:31 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 21E7B3F64C;
	Fri,  5 May 2023 06:21:47 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/3] python3: use libedit instead of readline
Date: Fri,  5 May 2023 14:21:42 +0100
Message-Id: <20230505132144.2951723-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 13:21:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180917

From: Ross Burton <ross.burton@arm.com>

libedit has feature parity with readline but is more permissively
licensed (BSD verses GPLv3), so switch to libedit by default.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3_3.11.2.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.11.2.bb b/meta/recipe=
s-devtools/python/python3_3.11.2.bb
index 5bd8d32b140..4a9aa9306bc 100644
--- a/meta/recipes-devtools/python/python3_3.11.2.bb
+++ b/meta/recipes-devtools/python/python3_3.11.2.bb
@@ -95,10 +95,10 @@ CACHED_CONFIGUREVARS =3D " \
 "
=20
 # PGO currently causes builds to not be reproducible so disable by defau=
lt, see YOCTO #13407
-PACKAGECONFIG:class-target ??=3D "readline gdbm ${@bb.utils.filter('DIST=
RO_FEATURES', 'lto', d)}"
-PACKAGECONFIG:class-native ??=3D "readline gdbm"
+PACKAGECONFIG:class-target ??=3D "editline gdbm ${@bb.utils.filter('DIST=
RO_FEATURES', 'lto', d)}"
+PACKAGECONFIG:class-native ??=3D "editline gdbm"
 PACKAGECONFIG:class-nativesdk ??=3D "readline gdbm"
-PACKAGECONFIG[readline] =3D ",,readline"
+PACKAGECONFIG[readline] =3D "--with-readline=3Dreadline,,readline,,,edit=
line"
 PACKAGECONFIG[editline] =3D "--with-readline=3Deditline,,libedit,,,readl=
ine"
 # Use profile guided optimisation by running PyBench inside qemu-user
 PACKAGECONFIG[pgo] =3D "--enable-optimizations,,qemu-native"
--=20
2.34.1


