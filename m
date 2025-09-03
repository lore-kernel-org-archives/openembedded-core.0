Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B48FCA0FF2
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 12:49:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11575.1756903765985540499
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 05:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2ABF21688
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Sep 2025 05:49:17 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 08AB93F6A8
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Sep 2025 05:49:24 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] perf: enable coresight if enabled in MACHINE_FEATURES
Date: Wed,  3 Sep 2025 13:49:20 +0100
Message-ID: <20250903124920.1922332-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 12:49:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222859

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
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/=
perf.bb
index 4f29bd5bbc3..194c30831dd 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -10,7 +10,7 @@ HOMEPAGE =3D "https://perf.wiki.kernel.org/index.php/Ma=
in_Page"
 LICENSE =3D "GPL-2.0-only"
=20
 # zstd is required for kernels 6.14+ when libelf-zstd is detected
-PACKAGECONFIG ??=3D "python tui libunwind libtraceevent zstd"
+PACKAGECONFIG ??=3D "python tui libunwind libtraceevent zstd ${@bb.utils=
.filter('MACHINE_FEATURES', 'coresight', d)}"
 PACKAGECONFIG[dwarf] =3D ",NO_DWARF=3D1"
 PACKAGECONFIG[perl] =3D ",NO_LIBPERL=3D1,perl"
 PACKAGECONFIG[python] =3D ",NO_LIBPYTHON=3D1,python3 python3-setuptools-=
native"
--=20
2.43.0


