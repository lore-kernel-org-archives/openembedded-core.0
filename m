Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB68C02180
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 12:04:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.46951.1737029075254688046
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jan 2025 04:04:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D94511FB
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 04:05:03 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 55E453F673
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 04:04:34 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lttng-tools: disable patching our libtool.m4
Date: Thu, 16 Jan 2025 12:04:29 +0000
Message-ID: <20250116120429.3972367-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 12:04:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209946

Twelve years ago, libtool on Debian had a patch that meant it failed to
cross-compile lttng-tools correctly. The solution at the time was to
sed libtool.m4 whilst configure was being ran[1], which (assuming it
patches the correct file) results in a re-execution of configure during
do_compile.

This behaviour is undesired as we don't patch libtool in the way that
this fixup is needed (the sed only changes Haiku OS codepaths), so
disable it.

[1] https://github.com/lttng/lttng-tools/commit/6bd5984c2b1b1037e0345bbac=
3506b5503fe01bd

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-kernel/lttng/lttng-tools_2.13.14.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.14.bb b/meta/reci=
pes-kernel/lttng/lttng-tools_2.13.14.bb
index 65d19b6e5fd..98c2f9831b7 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.14.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.14.bb
@@ -47,6 +47,8 @@ inherit autotools ptest pkgconfig useradd python3-dir m=
anpages systemd
=20
 CACHED_CONFIGUREVARS =3D "PGREP=3D/usr/bin/pgrep"
=20
+EXTRA_OECONF +=3D "--disable-libtool-linkdep-fixup"
+
 SYSTEMD_SERVICE:${PN} =3D "lttng-sessiond.service"
 SYSTEMD_AUTO_ENABLE =3D "disable"
=20
--=20
2.43.0


