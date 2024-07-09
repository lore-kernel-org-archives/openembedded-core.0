Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2ADFC2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 12:02:29 +0000 (UTC)
Received: from sypressi2.dnainternet.net (sypressi2.dnainternet.net [83.102.40.154])
 by mx.groups.io with SMTP id smtpd.web11.11242.1720526548134354689
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 05:02:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 83.102.40.154, mailfrom: niko.mauno@vaisala.com)
Received: from localhost (localhost [127.0.0.1])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id 5C7D813FF8;
	Tue,  9 Jul 2024 15:02:25 +0300 (EEST)
X-Virus-Scanned: DNA Internet at dnainternet.net
Received: from sypressi2.dnainternet.net ([83.102.40.154])
	by localhost (sypressi2.dnainternet.net [127.0.0.1]) (DNA Internet, port 10041)
	with ESMTP id 5mq6i-GKAVyW; Tue,  9 Jul 2024 15:02:25 +0300 (EEST)
Received: from oliivipuu2.dnainternet.net (oliivipuu2.dnainternet.net [83.102.40.53])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id 1A79513BFF;
	Tue,  9 Jul 2024 15:02:25 +0300 (EEST)
Received: from localhost.localdomain (82-181-238-66.bb.dnainternet.fi [82.181.238.66])
	by oliivipuu2.dnainternet.net (Postfix) with ESMTP id DDC58B1;
	Tue,  9 Jul 2024 15:02:22 +0300 (EEST)
From: niko.mauno@vaisala.com
To: openembedded-core@lists.openembedded.org
Cc: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH] Fix missing leading whitespace with ':append'
Date: Tue,  9 Jul 2024 15:02:09 +0300
Message-Id: <20240709120209.65344-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 12:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201655

From: Niko Mauno <niko.mauno@vaisala.com>

Mitigate occurrences where ':append' operator is used and leading
whitespace character is obviously missing, risking inadvertent
string concatenation.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-devtools/dnf/dnf_4.20.0.bb | 2 +-
 meta/recipes-graphics/mesa/mesa.inc     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/dnf/dnf_4.20.0.bb b/meta/recipes-devto=
ols/dnf/dnf_4.20.0.bb
index 4757346cbf..98edab0614 100644
--- a/meta/recipes-devtools/dnf/dnf_4.20.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.20.0.bb
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
 SRCREV =3D "e3cb438c0fd08c79676c0f3276aa7d75cd8557c6"
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+(\.\d+)+)"
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 272d57c749..d56def2916 100644
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


