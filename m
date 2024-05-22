Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B10C25B78
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 06:07:28 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.3298.1716358039727119701
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 23:07:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from localhost.localdomain (unknown [37.19.221.174])
	by linux.microsoft.com (Postfix) with ESMTPSA id 8623C20679B6;
	Tue, 21 May 2024 23:07:18 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8623C20679B6
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH 3/4 v2] meson.bbclass: Allow early compiler tests to be bypassed if necessary
Date: Wed, 22 May 2024 00:10:16 -0600
Message-ID: <20240522061016.1763718-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 06:07:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199686

Setting skip_sanity_check=3Dtrue in the [properties] section of meson.cro=
ss allows
early compiler tests to be skipped on cross compilation environments wher=
e
sanity applications cant be compiled or tested.

Setting MESON_SKIP_SANITY_CHECK=3D1 enables this behavior.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 meta/classes-recipe/meson.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meso=
n.bbclass
index 03fa2c06eb..492243c3c0 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -61,7 +61,7 @@ def rust_tool(d, target_var):
     return "rust =3D %s" % repr(cmd)
=20
 addtask write_config before do_configure
-do_write_config[vardeps] +=3D "CC CXX AR NM STRIP READELF OBJCOPY CFLAGS=
 CXXFLAGS LDFLAGS RUSTC RUSTFLAGS EXEWRAPPER_ENABLED"
+do_write_config[vardeps] +=3D "CC CXX AR NM STRIP READELF OBJCOPY CFLAGS=
 CXXFLAGS LDFLAGS RUSTC RUSTFLAGS EXEWRAPPER_ENABLED MESON_SKIP_SANITY_CH=
ECK"
 do_write_config() {
     # This needs to be Py to split the args into single-element lists
     cat >${WORKDIR}/meson.cross <<EOF
@@ -89,6 +89,7 @@ cpp_args =3D ${@meson_array('CXXFLAGS', d)}
 cpp_link_args =3D ${@meson_array('LDFLAGS', d)}
=20
 [properties]
+${@"skip_sanity_check =3D true" if d.getVar('MESON_SKIP_SANITY_CHECK') =3D=
=3D '1' else ""}
 needs_exe_wrapper =3D true
 sys_root =3D '${STAGING_DIR_HOST}'
=20
--=20
2.45.1


