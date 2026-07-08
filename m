Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73E9C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 16:10:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12459.1783527018999954103
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 09:10:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=j21baujM;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B200B1D14
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2026 09:10:13 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B6ABA3F7B4
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2026 09:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783527018; bh=E01dMaM0s1/SczRfkRY7lG1jExdM64wgBmwDESVcYM4=;
	h=From:To:Subject:Date:From;
	b=j21baujM0SbNRTuIwqvM7TbhgwD55qNnYK1g9ltJFOan2kBNmeA+lx5NNXK7ZU5Ls
	 KwSTb+qygRF1G4OoHNk5pLFWxrdDxovoxhbhNAM1ezf1pwE9MCtrD0paVYNaSwVtS4
	 XZXRVAbpvq3Ab59TXuhsWqRjMoodtd7Q5EHGiWK0=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lib/oe/utils: move INHIBIT_DEFAULT_DEPS from make_arch_independent() to allarch.bbclass
Date: Wed,  8 Jul 2026 17:10:09 +0100
Message-ID: <20260708161009.2997255-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 16:10:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240498

The bulk of the work in allarch recipes happens in handlers because the
finer details of how the recipe is configured varies. Specifically,
multilib recipes cannot be allarch and if multilib is enabled, the
packages are still tune-specific.

However, this means that recipes that are marked as allarch don't have
INHIBIT_DEFAULT_DEPS set in multilib environments, which is a problem
if it was being used to avoid dependency cycles.

Instead of assigning it at runtime if the recipe really does become
arch-independent, move the assignment from make_arch_independent() to
allarch.bbclass (the other caller in dummy-sdk-package.inc already sets
this). This means that recipes inheriting allarch always have
INHIBIT_DEFAULT_DEPS set.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/allarch.bbclass | 3 +++
 meta/lib/oe/utils.py                | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/allarch.bbclass b/meta/classes-recipe/al=
larch.bbclass
index 7cdaa63ae2..aa44e2bc61 100644
--- a/meta/classes-recipe/allarch.bbclass
+++ b/meta/classes-recipe/allarch.bbclass
@@ -8,6 +8,9 @@
 # This class is used for architecture independent recipes/data files (us=
ually scripts)
 #
=20
+# No need for virtual/libc or a cross compiler
+INHIBIT_DEFAULT_DEPS =3D "1"
+
 python allarch_package_arch_handler () {
     if bb.data.inherits_class("native", d) or bb.data.inherits_class("na=
tivesdk", d) \
         or bb.data.inherits_class("crosssdk", d):
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 558073d3b1..082f6cef74 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -515,9 +515,6 @@ def touch(filename):
 # Used by allarch recipes and other cases where arch independence is nee=
ded
 #
 def make_arch_independent(d):
-    # No need for virtual/libc or a cross compiler
-    d.setVar("INHIBIT_DEFAULT_DEPS","1")
-
     # Set these to a common set of values, we shouldn't be using them ot=
her that for WORKDIR directory
     # naming anyway
     d.setVar("baselib", "lib")
--=20
2.43.0


