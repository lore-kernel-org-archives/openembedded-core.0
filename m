Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775DED778A6
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 18:04:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1646.1769191496612710975
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jan 2026 10:04:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 859FE1476
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 10:04:49 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B5C503F694
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 10:04:55 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/8] Rationalise the pkg-config variables
Date: Fri, 23 Jan 2026 18:04:40 +0000
Message-ID: <20260123180448.2997378-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 18:04:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229903

Hi,

This series cleans up and rationalises the pkg-config variables, with the
goal of following the majority of major distros and later switching from
pkg-config (last release: 2017) to pkgconf (last release: June 2025).

However, this series doesn't do that.

The first three patches are adding missing inherits, or fixing a bug in
numpy that we were lucky enough not to hit.

The next two are the key patches, specifically "classes/pkgconfig: ration=
alise
variable usage" is the meat of the series that actually changes the
variables and contains the rationale.

The next two are improvements for pkgconf that we might as well apply now=
.

Finally, a controversial patch to drop support for a working menuconfig o=
n
kernels older than 5.15. If there is a need to support 5.10 then the smal=
l
fix to the kernel Makefiles should be an easy backport.  This patch is no=
t
needed though, and can be dropped.

Cheers,
Ross

Ross Burton (8):
  pkgconfig: inherit the pkgconfig class
  perf: inherit the pkgconfig class
  python3-numpy: backport a Meson patch to fix pkg-config lookups
  classes/pkgconfig: move variable exports to the class
  classes/pkgconfig: rationalise variable usage
  pkgconf: small cleanups
  pkgconf: add pkg-config-native to the nativesdk package
  kernel: remove pkg-config variables for old (<5.19) kernels

 meta/classes-recipe/cml1.bbclass              |  7 ++--
 meta/classes-recipe/cross-canadian.bbclass    |  3 +-
 meta/classes-recipe/cross.bbclass             |  4 +--
 meta/classes-recipe/kernel.bbclass            | 13 -------
 meta/classes-recipe/native.bbclass            |  1 -
 meta/classes-recipe/nativesdk.bbclass         |  3 --
 meta/classes-recipe/pkgconfig.bbclass         |  6 ++++
 meta/conf/bitbake.conf                        | 14 ++++----
 .../pkgconf/pkgconf/pkg-config-native.in      |  3 +-
 .../recipes-devtools/pkgconf/pkgconf_2.5.1.bb | 14 ++++++--
 .../pkgconfig/pkgconfig_git.bb                |  4 +--
 .../python3-numpy/0001-python-sysroot.patch   | 34 +++++++++++++++++++
 .../python/python3-numpy_2.3.5.bb             |  1 +
 meta/recipes-kernel/linux/linux-yocto.inc     |  8 ++---
 meta/recipes-kernel/perf/perf.bb              |  3 +-
 15 files changed, 72 insertions(+), 46 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-numpy/0001-pytho=
n-sysroot.patch

--=20
2.43.0


