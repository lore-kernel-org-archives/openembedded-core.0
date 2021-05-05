Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web09.1753.1620242594022297120
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 12:23:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=xIu0VN2O;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 5F83882CA8;
	Wed,  5 May 2021 21:23:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1620242590;
	bh=o/+hjwS0Z6Lzr3gGMVD4H3Bvgo+oA+SN3/JKpHkhRQo=;
	h=From:To:Cc:Subject:Date:From;
	b=xIu0VN2O6uCDk7PqYKvsg8BlUDVui1vXUHeDG2A3pvLKu02dOAf7N4G9I2fS1/L53
	 mHJKc65PhDumhjRe+BRQpqqv0lPVw5PDXJTuGfdYkzRha0l2Dnwygk2FzQ7THuSwXq
	 OJSnKZwLXe+U7ws9WjPM8cJzfh3cUIhq1S/d1b4k9UPemqvfBr4b9f/0/aZ4Xq1oBT
	 WdaNUIoDGg5irTB2imvmhLGEsIillAlRSjI/luM+EOd3BILkxLYdAWyltjN1/aMJlz
	 UjNkFjVPl0Yv5oBJcoeejXl+gUP3fgWuenUXgqfojsGbQM7DetEnvCD49exlDWYwrn
	 f/8DHbQVb7Xuw==
From: "Marek Vasut" <marex@denx.de>
To: openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH] make-mod-scripts: add HOSTCXX definitions and gmp-native dependency
Date: Wed,  5 May 2021 21:23:03 +0200
Message-Id: <20210505192303.124067-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable

From: Bruce Ashfield <bruce.ashfield@gmail.com>

With kernel v5.8+ and gcc10 plugins, we can run into the following build =
error:

      HOSTCXX -fPIC scripts/gcc-plugins/arm_ssp_per_task_plugin.o
    In file included from
    /home/pokybuild/yocto-worker/qemuarm/build/build/tmp/work/qemuarm-pok=
y-linux-gnueabi/make-mod-scripts/1.0-r0/recipe-sysroot-native/usr/bin/arm=
-poky-linux-gnueabi/../../lib/arm-poky-linux-gnueabi/gcc/arm-poky-linux-g=
nueabi/10.1.0/plugin/include/gcc-plugin.h:28,
                     from
    /home/pokybuild/yocto-worker/qemuarm/build/build/tmp/work-shared/qemu=
arm/kernel-source/scripts/gcc-plugins/gcc-common.h:7,
                     from
    /home/pokybuild/yocto-worker/qemuarm/build/build/tmp/work-shared/qemu=
arm/kernel-source/scripts/gcc-plugins/arm_ssp_per_task_plugin.c:3:
    /home/pokybuild/yocto-worker/qemuarm/build/build/tmp/work/qemuarm-pok=
y-linux-gnueabi/make-mod-scripts/1.0-r0/recipe-sysroot-native/usr/bin/arm=
-poky-linux-gnueabi/../../lib/arm-poky-linux-gnueabi/gcc/arm-poky-linux-g=
nueabi/10.1.0/plugin/include/system.h:687:10:
    fatal error: gmp.h: No such file or directory
      687 | #include <gmp.h>
          |          ^~~~~~~

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cb055446e0fe4771c8bd6122e79d43ef8db2e45b)
---
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb=
 b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 87b7d240f5..b58fa9a603 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -16,8 +16,10 @@ do_compile[depends] +=3D "virtual/kernel:do_compile_ke=
rnelmodules"
 RDEPENDS_${PN}-dev =3D ""
=20
 DEPENDS +=3D "bc-native bison-native"
+DEPENDS +=3D "gmp-native"
=20
 EXTRA_OEMAKE =3D " HOSTCC=3D"${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS=
}" HOSTCPP=3D"${BUILD_CPP}""
+EXTRA_OEMAKE +=3D " HOSTCXX=3D"${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LD=
FLAGS}""
=20
 # Build some host tools under work-shared.  CC, LD, and AR are probably
 # not used, but this is the historical way of invoking "make scripts".
--=20
2.30.2

