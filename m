Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D0EC561E6
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 16:03:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43652.1785945821390548990
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 09:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=CfmOTiGN;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C75BC1713
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Aug 2026 09:03:36 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 665DA3F632
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Aug 2026 09:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785945820; bh=Q+H4YxqYRr0F2HJZSP6kyR5qAJH5Wb6XaQoR/V7vfj4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CfmOTiGNraaL7HC/ybBNS3nNGuKppEw5mi0kNcyezm7de/BF/QA2Za0WBG4Evya3e
	 Iiz7gttSPc/gr15IdEQRB3S/QmjZaninsg8f261uEYNzH5qIBUvhFXyhei4tAl6Ngm
	 gux8C5uKoIDGBR8hud6ALvLFhkCDCWvPY5ZQS/K8=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] glibc: remove obsolete shell override for make-syscalls.sh
Date: Wed,  5 Aug 2026 17:03:19 +0100
Message-ID: <20260805160320.41908-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805160320.41908-1-ross.burton@arm.com>
References: <20260805160320.41908-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 16:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242874

SHELL was set to /bin/bash back in 2012[1] because of non-portable use
of echo in eglibc.

As this non-portable use was fixed upstream in glibc in 2015[1] we can
remove this override.

[1] oe-core 9d002f7cdc5 ("eglibc: force make to use /bin/bash")
[2] glibc 95b07fbcc7 ("Fix non-portable echo usage in sysdeps/unix/make-s=
yscalls.sh")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/glibc/glibc.inc | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/=
glibc.inc
index 27a911dd8ff..47c15c116d8 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -29,11 +29,6 @@ CACHED_CONFIGUREVARS:append:mipsarch =3D " libc_cv_ld_=
gnu_indirect_function=3Dno"
 GLIBC_EXTRA_OECONF ?=3D ""
 GLIBC_EXTRA_OECONF:class-nativesdk =3D ""
=20
-# glibc make-syscalls.sh has a number of issues with /bin/dash and
-# it's output which make calls via the SHELL also has issues, so
-# ensure make uses /bin/bash
-EXTRA_OEMAKE +=3D "SHELL=3D/bin/bash"
-
 # We do not need bash to run tzselect script, the default is to use
 # bash but it can be configured by setting KSHELL Makefile variable
 EXTRA_OEMAKE +=3D "KSHELL=3D/bin/sh"
--=20
2.43.0


