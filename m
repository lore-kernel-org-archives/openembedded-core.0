Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F98C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 18:50:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.34318.1680202210244772779
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 11:50:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40F53168F;
	Thu, 30 Mar 2023 11:50:54 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 789083F663;
	Thu, 30 Mar 2023 11:50:09 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/3] webkitgtk: clean up Python variables
Date: Thu, 30 Mar 2023 19:50:06 +0100
Message-Id: <20230330185006.306389-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230330185006.306389-1-ross.burton@arm.com>
References: <20230330185006.306389-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 18:50:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179350

The cmake bbclass already sets the path to the correct Python for us,
and there appears to be no more scripts in the build which use 'python'
explicitly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.38.5.bb | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.38.5.bb
index e52920883a0..832c8327ddc 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
@@ -70,20 +70,11 @@ PACKAGECONFIG[soup2] =3D "-DUSE_SOUP2=3DON,-DUSE_SOUP=
2=3DOFF,libsoup-2.4,,,soup3"
 PACKAGECONFIG[soup3] =3D ",,libsoup,,,soup2"
 PACKAGECONFIG[journald] =3D "-DENABLE_JOURNALD_LOG=3DON,-DENABLE_JOURNAL=
D_LOG=3DOFF,systemd"
=20
-# webkitgtk is full of /usr/bin/env python, particular for generating do=
cs
-do_configure[postfuncs] +=3D "setup_python_link"
-setup_python_link() {
-	if [ ! -e ${STAGING_BINDIR_NATIVE}/python ]; then
-		ln -s `which python3` ${STAGING_BINDIR_NATIVE}/python
-	fi
-}
-
 EXTRA_OECMAKE =3D " \
 		-DPORT=3DGTK \
 		${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTIO=
N=3DON', '-DENABLE_INTROSPECTION=3DOFF', d)} \
 		${@bb.utils.contains('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATI=
ON=3DON', '-DENABLE_DOCUMENTATION=3DOFF', d)} \
 		-DENABLE_MINIBROWSER=3DON \
-                -DPYTHON_EXECUTABLE=3D`which python3` \
                 -DENABLE_BUBBLEWRAP_SANDBOX=3DOFF \
                 -DENABLE_GAMEPAD=3DOFF \
 		"
--=20
2.34.1


