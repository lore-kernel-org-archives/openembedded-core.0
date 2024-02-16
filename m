Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BFB1C48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 14:46:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20444.1708094765956050752
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 06:46:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 190D9DA7
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 06:46:46 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 018A83F694
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 06:46:04 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] meson: set the sysroot in the cross files
Date: Fri, 16 Feb 2024 14:46:03 +0000
Message-Id: <20240216144603.3083337-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 14:46:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195775

From: Ross Burton <ross.burton@arm.com>

When cross compiling we have a sysroot, so by telling Meson where it is
explicitly it can do the right thing.

Currently this means it just sets PKG_CONFIG_SYSROOT_DIR to the value
that we already set it to, but in the future this can be used to stop
Meson looking directly in /usr when it shouldn't.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/meson.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meso=
n.bbclass
index a849e872976..03fa2c06eb4 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -90,6 +90,7 @@ cpp_link_args =3D ${@meson_array('LDFLAGS', d)}
=20
 [properties]
 needs_exe_wrapper =3D true
+sys_root =3D '${STAGING_DIR_HOST}'
=20
 [host_machine]
 system =3D '${@meson_operating_system('HOST_OS', d)}'
--=20
2.34.1


