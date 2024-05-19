Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA479C41513
	for <webhook@archiver.kernel.org>; Sun, 19 May 2024 05:48:36 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.34020.1716097711184990926
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 May 2024 22:48:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from localhost.localdomain (unknown [37.19.221.174])
	by linux.microsoft.com (Postfix) with ESMTPSA id 4018F20B915A;
	Sat, 18 May 2024 22:48:30 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4018F20B915A
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH 2/4] meson: Allow exe_wrapper to be overriden
Date: Sat, 18 May 2024 23:50:48 -0600
Message-ID: <20240519055050.2331637-2-alejandro@enedino.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240519055050.2331637-1-alejandro@enedino.org>
References: <20240519055050.2331637-1-alejandro@enedino.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 May 2024 05:48:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199545

When the meson build configuration file is generated the exe_wrapper valu=
e
was being hardcoded, however, there may be applications which require for=
 us
to use a different value.

To allow for this value to be manually set; create a variable EXEWRAPPER_=
EXE
that defaults to ${WORKDIR}/meson-qemuwrapper, allowing us to easily chan=
ge
its when required without modifying its default functionality.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 meta/classes-recipe/meson.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meso=
n.bbclass
index 03fa2c06eb..864135d78b 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -8,6 +8,7 @@ inherit python3native meson-routines qemu
=20
 DEPENDS:append =3D " meson-native ninja-native"
=20
+EXEWRAPPER_EXE ?=3D "exe_wrapper =3D '${WORKDIR}/meson-qemuwrapper'"
 EXEWRAPPER_ENABLED:class-native =3D "False"
 EXEWRAPPER_ENABLED:class-nativesdk =3D "False"
 EXEWRAPPER_ENABLED ?=3D "${@bb.utils.contains('MACHINE_FEATURES', 'qemu-=
usermode', 'True', 'False', d)}"
@@ -61,7 +62,7 @@ def rust_tool(d, target_var):
     return "rust =3D %s" % repr(cmd)
=20
 addtask write_config before do_configure
-do_write_config[vardeps] +=3D "CC CXX AR NM STRIP READELF OBJCOPY CFLAGS=
 CXXFLAGS LDFLAGS RUSTC RUSTFLAGS EXEWRAPPER_ENABLED"
+do_write_config[vardeps] +=3D "CC CXX AR NM STRIP READELF OBJCOPY CFLAGS=
 CXXFLAGS LDFLAGS RUSTC RUSTFLAGS EXEWRAPPER_ENABLED EXEWRAPPER_EXE"
 do_write_config() {
     # This needs to be Py to split the args into single-element lists
     cat >${WORKDIR}/meson.cross <<EOF
@@ -80,7 +81,7 @@ cups-config =3D 'cups-config'
 g-ir-scanner =3D '${STAGING_BINDIR}/g-ir-scanner-wrapper'
 g-ir-compiler =3D '${STAGING_BINDIR}/g-ir-compiler-wrapper'
 ${@rust_tool(d, "RUST_HOST_SYS")}
-${@"exe_wrapper =3D '${WORKDIR}/meson-qemuwrapper'" if d.getVar('EXEWRAP=
PER_ENABLED') =3D=3D 'True' else ""}
+${@"${EXEWRAPPER_EXE}" if d.getVar('EXEWRAPPER_ENABLED') =3D=3D 'True' e=
lse ""}
=20
 [built-in options]
 c_args =3D ${@meson_array('CFLAGS', d)}
--=20
2.45.1


