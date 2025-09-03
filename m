Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA982CA0FF2
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 16:24:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.17285.1756916656600627927
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 09:24:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A053D1655
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Sep 2025 09:24:07 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AAA113F6A8
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Sep 2025 09:24:15 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] perf: enable coresight if enabled in MACHINE_FEATURES
Date: Wed,  3 Sep 2025 17:24:11 +0100
Message-ID: <20250903162411.2709923-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 16:24:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222875

Enable the CoreSight[1] functionality in perf[2] if 'coresight' is in the
MACHINE_FEATURES.

Note that enabling this will mean a dependency on the opencsd recipe,
which is currently part of meta-arm[3]. I don't think this is a problem
as this recipe is Arm-specific, and as this is a new feature the
behaviour is opt-in so shouldn't break any existing machines.

[1] https://docs.kernel.org/trace/coresight/coresight.html
[2] https://docs.kernel.org/trace/coresight/coresight-perf.html
[3] https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-devtools/=
opencsd

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-kernel/perf/perf.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/=
perf.bb
index 4f29bd5bbc3..b142b090b55 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -10,7 +10,9 @@ HOMEPAGE =3D "https://perf.wiki.kernel.org/index.php/Ma=
in_Page"
 LICENSE =3D "GPL-2.0-only"
=20
 # zstd is required for kernels 6.14+ when libelf-zstd is detected
-PACKAGECONFIG ??=3D "python tui libunwind libtraceevent zstd"
+# Respect the coresight machine feature, but note this causes a
+# dependency on meta-arm.
+PACKAGECONFIG ??=3D "python tui libunwind libtraceevent zstd ${@bb.utils=
.filter('MACHINE_FEATURES', 'coresight', d)}"
 PACKAGECONFIG[dwarf] =3D ",NO_DWARF=3D1"
 PACKAGECONFIG[perl] =3D ",NO_LIBPERL=3D1,perl"
 PACKAGECONFIG[python] =3D ",NO_LIBPYTHON=3D1,python3 python3-setuptools-=
native"
@@ -28,7 +30,7 @@ PACKAGECONFIG[libtraceevent] =3D ",NO_LIBTRACEEVENT=3D1=
,libtraceevent"
 # jevents requires host python for generating a .c file, but is
 # unrelated to the python item.
 PACKAGECONFIG[jevents] =3D ",NO_JEVENTS=3D1,python3-native"
-# Arm CoreSight
+# Arm CoreSight support, requires meta-arm for opencsd
 PACKAGECONFIG[coresight] =3D "CORESIGHT=3D1,,opencsd"
 PACKAGECONFIG[pfm4] =3D ",NO_LIBPFM4=3D1,libpfm4"
 PACKAGECONFIG[babeltrace] =3D ",NO_LIBBABELTRACE=3D1,babeltrace"
--=20
2.43.0


