Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.9587.1626968360571443327
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 08:39:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F128A106F
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 08:39:18 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A5B33F694
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 08:39:18 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glew: fix Makefile race
Date: Thu, 22 Jul 2021 16:39:16 +0100
Message-Id: <20210722153916.2550020-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Fix a Makefile race resulting in the target creating a directory being
executed after the target to write into that directory.

[ YOCTO #14485 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../0001-Fix-build-race-in-Makefile.patch     | 56 +++++++++++++++++++
 meta/recipes-graphics/glew/glew_2.2.0.bb      |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-graphics/glew/glew/0001-Fix-build-race-i=
n-Makefile.patch

diff --git a/meta/recipes-graphics/glew/glew/0001-Fix-build-race-in-Makef=
ile.patch b/meta/recipes-graphics/glew/glew/0001-Fix-build-race-in-Makefi=
le.patch
new file mode 100644
index 0000000000..7edcfe8de8
--- /dev/null
+++ b/meta/recipes-graphics/glew/glew/0001-Fix-build-race-in-Makefile.pat=
ch
@@ -0,0 +1,56 @@
+Upstream-Status: Submitted [https://github.com/nigels-com/glew/pull/311]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 0ce0a85597db48a2fca619bd95e34af091e54ae8 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Thu, 22 Jul 2021 16:31:11 +0100
+Subject: [PATCH] Fix build race in Makefile
+
+The current rule for the binaries is:
+
+glew.bin: glew.lib bin bin/$(GLEWINFO.BIN) bin/$(VISUALINFO.BIN)
+
+In parallel builds, all of those targets happen at the same time. This
+means that 'bin' can happen *after* 'bin/$(GLEWINFO.BIN)', which is a
+problem as the 'bin' target's responsibility is to create the directory
+that the other target writes into.
+
+Solve this by not having a separate 'create directory' target which is
+fundamentally racy, and simply mkdir in each target which writes into it=
.
+---
+ Makefile | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index d0e4614..04af44c 100644
+--- a/Makefile
++++ b/Makefile
+@@ -171,21 +171,20 @@ VISUALINFO.BIN.OBJ :=3D $(VISUALINFO.BIN.OBJ:.c=3D=
.o)
+ # Don't build glewinfo or visualinfo for NaCL, yet.
+=20
+ ifneq ($(filter nacl%,$(SYSTEM)),)
+-glew.bin: glew.lib bin
++glew.bin: glew.lib
+ else
+-glew.bin: glew.lib bin bin/$(GLEWINFO.BIN) bin/$(VISUALINFO.BIN)=20
++glew.bin: glew.lib bin/$(GLEWINFO.BIN) bin/$(VISUALINFO.BIN)
+ endif
+=20
+-bin:
+-	mkdir bin
+-
+ bin/$(GLEWINFO.BIN): $(GLEWINFO.BIN.OBJ) $(LIB.SHARED.DIR)/$(LIB.SHARED=
)
++	@mkdir -p $(dir $@)
+ 	$(CC) $(CFLAGS) -o $@ $(GLEWINFO.BIN.OBJ) $(BIN.LIBS)
+ ifneq ($(STRIP),)
+ 	$(STRIP) -x $@
+ endif
+=20
+ bin/$(VISUALINFO.BIN): $(VISUALINFO.BIN.OBJ) $(LIB.SHARED.DIR)/$(LIB.SH=
ARED)
++	@mkdir -p $(dir $@)
+ 	$(CC) $(CFLAGS) -o $@ $(VISUALINFO.BIN.OBJ) $(BIN.LIBS)
+ ifneq ($(STRIP),)
+ 	$(STRIP) -x $@
+--=20
+2.25.1
+
diff --git a/meta/recipes-graphics/glew/glew_2.2.0.bb b/meta/recipes-grap=
hics/glew/glew_2.2.0.bb
index 8948444e08..92b6083648 100644
--- a/meta/recipes-graphics/glew/glew_2.2.0.bb
+++ b/meta/recipes-graphics/glew/glew_2.2.0.bb
@@ -6,6 +6,7 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D2ac251558de685c6b9478d89b=
e3149c2"
=20
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tg=
z \
+           file://0001-Fix-build-race-in-Makefile.patch \
            file://no-strip.patch"
=20
 SRC_URI[md5sum] =3D "3579164bccaef09e36c0af7f4fd5c7c7"
--=20
2.25.1

