Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F8FFC3DA41
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 20:49:50 +0000 (UTC)
Received: from sinikuusama2.dnainternet.net (sinikuusama2.dnainternet.net [83.102.40.152])
 by mx.groups.io with SMTP id smtpd.web11.5697.1720644582549165623
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 13:49:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 83.102.40.152, mailfrom: niko.mauno@vaisala.com)
Received: from localhost (localhost [127.0.0.1])
	by sinikuusama2.dnainternet.net (Postfix) with ESMTP id 1E15DDD1E;
	Wed, 10 Jul 2024 23:49:40 +0300 (EEST)
X-Virus-Scanned: DNA Internet at dnainternet.net
Received: from sinikuusama2.dnainternet.net ([83.102.40.152])
	by localhost (sinikuusama2.dnainternet.net [127.0.0.1]) (DNA Internet, port 10041)
	with ESMTP id AFdl2GZ0bray; Wed, 10 Jul 2024 23:49:39 +0300 (EEST)
Received: from kirsikkapuu2.dnainternet.net (kirsikkapuu2.dnainternet.net [83.102.40.52])
	by sinikuusama2.dnainternet.net (Postfix) with ESMTP id CC6DADCE5;
	Wed, 10 Jul 2024 23:49:39 +0300 (EEST)
Received: from localhost.localdomain (82-181-238-66.bb.dnainternet.fi [82.181.238.66])
	by kirsikkapuu2.dnainternet.net (Postfix) with ESMTP id 81D963FF6;
	Wed, 10 Jul 2024 23:49:36 +0300 (EEST)
From: niko.mauno@vaisala.com
To: openembedded-core@lists.openembedded.org
Cc: Niko Mauno <niko.mauno@vaisala.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH] dnf/mesa: Fix missing leading whitespace with ':append'
Date: Wed, 10 Jul 2024 23:49:01 +0300
Message-Id: <20240710204901.31937-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 20:49:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201747

From: Niko Mauno <niko.mauno@vaisala.com>

Mitigate occurrences where ':append' operator is used and leading
whitespace character is obviously missing, risking inadvertent
string concatenation.

(From OE-Core rev: 314041fd126a4800a5a5d9fcd84c525319479256)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0b6ca9beeff927bbb6158c71596ac475550559d8)
---
 meta/recipes-devtools/dnf/dnf_4.19.0.bb | 2 +-
 meta/recipes-graphics/mesa/mesa.inc     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/dnf/dnf_4.19.0.bb b/meta/recipes-devto=
ols/dnf/dnf_4.19.0.bb
index 184dbea963..37a2cc7de2 100644
--- a/meta/recipes-devtools/dnf/dnf_4.19.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.19.0.bb
@@ -18,7 +18,7 @@ SRC_URI =3D "git://github.com/rpm-software-management/d=
nf.git;branch=3Dmaster;protoc
            file://0001-lock.py-fix-Exception-handling.patch \
            "
=20
-SRC_URI:append:class-native =3D "file://0001-dnf-write-the-log-lock-to-r=
oot.patch"
+SRC_URI:append:class-native =3D " file://0001-dnf-write-the-log-lock-to-=
root.patch"
=20
 SRCREV =3D "566a61f9d8a2830ac6dcc3a94c59224cef1c3d03"
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+(\.\d+)+)"
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 77e9c80fcb..a43fd2c701 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -91,7 +91,7 @@ PACKAGECONFIG =3D " \
 	${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)} \
 "
=20
-PACKAGECONFIG:append:class-native =3D "gallium-llvm r600"
+PACKAGECONFIG:append:class-native =3D " gallium-llvm r600"
=20
 # "gbm" requires "opengl"
 PACKAGECONFIG[gbm] =3D "-Dgbm=3Denabled,-Dgbm=3Ddisabled"
--=20
2.39.2


