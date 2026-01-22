Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29EA7D3EE7F
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 15:34:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39961.1769096084451875572
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 07:34:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 781C71476
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 07:34:37 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ACF223F632
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 07:34:43 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] perl: provide pod2man
Date: Thu, 22 Jan 2026 15:34:34 +0000
Message-ID: <20260122153438.1546221-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 15:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229848

Many recipes uses pod2man to generate manpages from an almost
human-readable source format, which is part of the perl recipe.

This means that we have recipes that don't install manpages, or more
accurately don't install manpages if built from clean but _do_ if they
are a rebuild (because do_package -> rpm-native -> perl-native means the
sysroot now has pod2man in).

The obvious fix here is to DEPEND on perl-native but that an often look
like a redundant dependency that can be removed as removing it doesn't
cause problems (I'm fairly confident I'm responsible for patches like
this).

So, add a PROVIDES of pod2man to perl, so that recipes can DEPEND on
pod2man-native and this dependency is both obvious as to it's purpose
and easily removed if the manpages change source format.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/perl/perl_5.40.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl_5.40.2.bb b/meta/recipes-dev=
tools/perl/perl_5.40.2.bb
index a78d2ed0be..2225dc202b 100644
--- a/meta/recipes-devtools/perl/perl_5.40.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.40.2.bb
@@ -34,6 +34,8 @@ DEPENDS +=3D "perlcross-native zlib virtual/crypt"
 # make 4.1 has race issues with the double-colon usage of MakeMaker, see=
 #14096
 DEPENDS +=3D "make-native"
=20
+PROVIDES =3D "pod2man"
+
 PERL_LIB_VER =3D "${@'.'.join(d.getVar('PV').split('.')[0:2])}.0"
=20
 PACKAGECONFIG ??=3D "gdbm"
--=20
2.43.0


