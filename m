Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5230C54EE9
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 13:02:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7240.1662555732370201667
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 06:02:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09B28106F;
	Wed,  7 Sep 2022 06:02:18 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C2AF3F7B4;
	Wed,  7 Sep 2022 06:02:11 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/3] gcc-cross: pass -Werror=poison-system-directories to
 compiler stages
Date: Wed,  7 Sep 2022 14:02:06 +0100
Message-Id: <20220907130207.2258074-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220907130207.2258074-1-ross.burton@arm.com>
References: <20220907130207.2258074-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 13:02:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170390

The -Werror=3Dpoison-system-directories argument was being passed to runs
where _just_ CPP was being invoked, so it wasn't passed to runs which
also compile.  Add the options to cc1_options so that compile runs also
have fatal poisoning errors.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gcc/0002-gcc-poison-system-directories.patch    | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directo=
ries.patch b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directo=
ries.patch
index 5a51ae7d960..bfec4477c1e 100644
--- a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.pa=
tch
+++ b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.pa=
tch
@@ -185,6 +185,19 @@ index bb07cc244e3..ce161d3c853 100644
 =20
  /* Pass -d* flags, possibly modifying -dumpdir, -dumpbase et al.
 =20
+@@ -1265,7 +1270,11 @@ static const char *cc1_options =3D
+  %{coverage:-fprofile-arcs -ftest-coverage}\
+  %{fprofile-arcs|fprofile-generate*|coverage:\
+    %{!fprofile-update=3Dsingle:\
+-     %{pthread:-fprofile-update=3Dprefer-atomic}}}";
++     %{pthread:-fprofile-update=3Dprefer-atomic}}}"
++#ifdef POISON_BY_DEFAULT
++ " -Werror=3Dpoison-system-directories"
++#endif
++  ;
+
+ static const char *asm_options =3D
+ "%{-target-help:%:print-asm-header()} "
 diff --git a/gcc/incpath.cc b/gcc/incpath.cc
 index bd2a97938eb..c80f100f476 100644
 --- a/gcc/incpath.cc
--=20
2.34.1


