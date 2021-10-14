Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 213E9C433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 22:36:59 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.1964.1634251016627076710
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 15:36:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=GmNSlZaC;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 17AB083676;
	Fri, 15 Oct 2021 00:36:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1634251008;
	bh=vvIbkQ+ivNj5BjzlZHpAQqjU5pncC1vl3x7nxNzEJps=;
	h=From:To:Cc:Subject:Date:From;
	b=GmNSlZaCoc+4yBRftiYOM4HDvnfAm21t9R3zArnsQsErYV4BjVtjwKrnjPkyEc7ku
	 Pr+G9PF5G2j60ZmjxcSQiELfHDYwpkjohLRhdZO+B4RnC6t5Wi/SHbhsa8+DVjNAVv
	 k/Fpx/Uua69cw/GZbmasZ8n7PVmSQHG07CTL8fUqGjqXuoYIQUrZ7r3+yFWdW9HfcH
	 aW4EevR0uosa5PBqm8UbJI7VVlMBCEZiWg8lK736uvOE2tNZ3h+tOI6QTyRMuqIeDN
	 BCnQ/VtTFX83lZQSVtDNx9AP2FNGLo10h0X3MU1JRP+DwHMo7rLL3lSZYy5jf7uPHq
	 j5iDkMtnArHvw==
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Anuj Mittal <anuj.mittal@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] piglit: upgrade to latest revision
Date: Fri, 15 Oct 2021 00:36:21 +0200
Message-Id: <20211014223621.84426-1-marex@denx.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 22:36:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156979

Update piglit to latest git revision and update the branch name,
since the original one is no longer updated. Make sure the VK
tests are only enabled if VK is also enabled in PACKAGECONFIG,
and that this is opt-in, otherwise older systems fail to build.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Anuj Mittal <anuj.mittal@intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-gr=
aphics/piglit/piglit_git.bb
index 2e0dfeee42..4b515cc537 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -6,7 +6,7 @@ BUGTRACKER =3D "https://gitlab.freedesktop.org/mesa/pigli=
t/-/issues"
 LICENSE =3D "MIT & LGPLv2+ & GPLv3 & GPLv2+ & BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db2beded7103a3d8a442a2a0391d60=
7b0"
=20
-SRC_URI =3D "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=3Dhtt=
ps \
+SRC_URI =3D "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=3Dhtt=
ps;branch=3Dmain \
            file://0001-cmake-install-bash-completions-in-the-right-place=
.patch \
            file://0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.pa=
tch \
            file://0001-Add-a-missing-include-for-htobe32-definition.patc=
h \
@@ -18,7 +18,7 @@ SRC_URI =3D "git://gitlab.freedesktop.org/mesa/piglit.g=
it;protocol=3Dhttps \
            "
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-SRCREV =3D "6a4be9e9946df310d9402f995f371c7deb8c27ba"
+SRCREV =3D "014c9d09115e15f5a074457a753bf3a43173ef7f"
 # (when PV goes above 1.0 remove the trailing r)
 PV =3D "1.0+gitr${SRCPV}"
=20
@@ -43,6 +43,7 @@ do_compile[dirs] =3D+ "${B}/temp/"
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[freeglut] =3D "-DPIGLIT_USE_GLUT=3D1,-DPIGLIT_USE_GLUT=3D0=
,freeglut,"
 PACKAGECONFIG[x11] =3D "-DPIGLIT_BUILD_GL_TESTS=3DON,-DPIGLIT_BUILD_GL_T=
ESTS=3DOFF,${X11_DEPS}, ${X11_RDEPS}"
+PACKAGECONFIG[vulkan] =3D "-DPIGLIT_BUILD_VK_TESTS=3DON,-DPIGLIT_BUILD_V=
K_TESTS=3DOFF,vulkan-loader"
=20
 export PIGLIT_BUILD_DIR =3D "../../../../git"
=20
--=20
2.33.0


