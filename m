Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8579BC55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 16:03:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43622.1785945820617489107
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 09:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=lP0Qeb6N;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FF8616F2
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Aug 2026 09:03:36 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AC63A3F632
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Aug 2026 09:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785945820; bh=8C0fTEhWc8dZtsoIciskMMxNFGaq6JhncnuEpU4Uw+A=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lP0Qeb6NMX2oGbgx6E/lyWok6JoGJ4sbOe+7OoAmh4MUEZdT8jLLOCqrdaSDmC8r4
	 1pkgirH3vQzxZc6adevITE+rD0N2V1GuNBurYnzTyCkU0o57jayWSi6xhvxNEjqYQ6
	 T6S4165S6fsYgZPDKVcYeb5pCDKDSDdMVTjPM0ss=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] glibc: remove obsolete parallelism flag handling
Date: Wed,  5 Aug 2026 17:03:18 +0100
Message-ID: <20260805160320.41908-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805160320.41908-1-ross.burton@arm.com>
References: <20260805160320.41908-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 16:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242873

Several problems here: the comment refers to PARALLELMFLAGS (which is a
variable in glibc's Makefile) but the actual assignment is to
EGLIBCPARALLELISM, which is an eglibc-ism and thus not respected by
glibc. Thus we were emptying PARALLEL_MAKE and so not actually doing the
build in parallel.

The Makefiles as of glibc 2.44[1] actually build in parallel well using
the standard way to pass flags, so drop all of this logic.

On my machine this has noticable improvements to walltime:

  do_compile:  86s -> 44s
  do_install:  55s -> 40s

Note that there is a PARALLELMFLAGS variable in the Makefiles, but using
it has marginal gains over not and upstream are looking at removing it
entirely.

[1] glibc 7cac99621e ("Makefile: Run the subdirectory recursion in parall=
el")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/glibc/glibc.inc | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/=
glibc.inc
index 560ebef677c..27a911dd8ff 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -29,13 +29,6 @@ CACHED_CONFIGUREVARS:append:mipsarch =3D " libc_cv_ld_=
gnu_indirect_function=3Dno"
 GLIBC_EXTRA_OECONF ?=3D ""
 GLIBC_EXTRA_OECONF:class-nativesdk =3D ""
=20
-# glibc uses PARALLELMFLAGS variable to pass parallel build info so tran=
sfer
-# PARALLEL_MAKE into PARALLELMFLAGS and empty out PARALLEL_MAKE
-EGLIBCPARALLELISM :=3D "PARALLELMFLAGS=3D"${PARALLEL_MAKE}""
-EXTRA_OEMAKE[vardepsexclude] +=3D "EGLIBCPARALLELISM"
-EXTRA_OEMAKE +=3D "${EGLIBCPARALLELISM}"
-PARALLEL_MAKE =3D ""
-
 # glibc make-syscalls.sh has a number of issues with /bin/dash and
 # it's output which make calls via the SHELL also has issues, so
 # ensure make uses /bin/bash
--=20
2.43.0


