Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 713B9C7EE29
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 13:15:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.128329.1683033298778226589
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 06:14:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FE21C14;
	Tue,  2 May 2023 06:15:42 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 000BB3F64C;
	Tue,  2 May 2023 06:14:57 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] libinput: upgrade to 1.23.0
Date: Tue,  2 May 2023 14:14:56 +0100
Message-Id: <20230502131456.1447115-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 13:15:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180729

Remove determinism.patch, this is obsolete now that we set
GIT_CEILING_DIRECTORIES to stop git climbing the tree outside of the
work directory.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../wayland/libinput/determinism.patch        | 21 -------------------
 ...{libinput_1.22.1.bb =3D> libinput_1.23.0.bb} |  5 ++---
 2 files changed, 2 insertions(+), 24 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/libinput/determinism.pa=
tch
 rename meta/recipes-graphics/wayland/{libinput_1.22.1.bb =3D> libinput_1=
.23.0.bb} (93%)

diff --git a/meta/recipes-graphics/wayland/libinput/determinism.patch b/m=
eta/recipes-graphics/wayland/libinput/determinism.patch
deleted file mode 100644
index cb554030cf3..00000000000
--- a/meta/recipes-graphics/wayland/libinput/determinism.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-This finds our outer git tree and that version information breaks
-determinism of this recipe. Disable it.
-
-RP 2020/2/6
-
-Upstream-Status: Pending
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: libinput-1.14.3/meson.build
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- libinput-1.14.3.orig/meson.build
-+++ libinput-1.14.3/meson.build
-@@ -387,7 +387,7 @@ pkgconfig.generate(
- 	libraries : lib_libinput
- )
-=20
--git_version_h =3D vcs_tag(command : ['git', 'describe'],
-+git_version_h =3D vcs_tag(command : ['false'],
- 			fallback : 'unknown',
- 			input : 'src/libinput-git-version.h.in',
- 			output :'libinput-git-version.h')
diff --git a/meta/recipes-graphics/wayland/libinput_1.22.1.bb b/meta/reci=
pes-graphics/wayland/libinput_1.23.0.bb
similarity index 93%
rename from meta/recipes-graphics/wayland/libinput_1.22.1.bb
rename to meta/recipes-graphics/wayland/libinput_1.23.0.bb
index f86885d3e3c..b83d5fdb436 100644
--- a/meta/recipes-graphics/wayland/libinput_1.22.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.23.0.bb
@@ -12,11 +12,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbab4ac7dc1=
c10bc0fb037dc76c46ef8a"
=20
 DEPENDS =3D "libevdev udev mtdev libcheck"
=20
-SRC_URI =3D "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=
=3Dhttps;branch=3D1.22-branch \
+SRC_URI =3D "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=
=3Dhttps;branch=3Dmain \
            file://run-ptest \
-           file://determinism.patch \
            "
-SRCREV =3D "d9f45fd1261da85b4eb44f8aa82e1500b99f303b"
+SRCREV =3D "0b005eb64b12603e65a620a77c67ec62fd03f413"
 S =3D "${WORKDIR}/git"
=20
 UPSTREAM_CHECK_REGEX =3D "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
--=20
2.34.1


