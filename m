Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13C15EE49A3
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 17:00:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1529.1692723648377266758
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 10:00:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D64A411FB;
	Tue, 22 Aug 2023 10:01:28 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 224963F762;
	Tue, 22 Aug 2023 10:00:45 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/5] perf: fix perl binding support
Date: Tue, 22 Aug 2023 18:00:16 +0100
Message-Id: <20230822170018.315470-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230822170018.315470-1-ross.burton@arm.com>
References: <20230822170018.315470-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 17:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186515

From: Ross Burton <ross.burton@arm.com>

The build of the perl integration has been broken for some time.

Update the PERL_* variables so that it can find libperl in the new
location.

This then fails because the Perl headers cause warnings and the feature
checks run with -Werror, so disable the errors.

The perf-dbg package then has target build paths, so set INSANE_SKIP for
now until this is resolved.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-kernel/perf/perf-perl.inc | 10 +++++++---
 meta/recipes-kernel/perf/perf.bb       |  3 +++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf-perl.inc b/meta/recipes-kernel=
/perf/perf-perl.inc
index ae77319b203..491f54c3280 100644
--- a/meta/recipes-kernel/perf/perf-perl.inc
+++ b/meta/recipes-kernel/perf/perf-perl.inc
@@ -2,6 +2,10 @@ inherit perlnative cpan-base
=20
 # Env var which tells perl if it should use host (no) or target (yes) se=
ttings
 export PERLCONFIGTARGET =3D "${@is_target(d)}"
-export PERL_INC =3D "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_v=
ersion(d)}/CORE"
-export PERL_LIB =3D "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_v=
ersion(d)}"
-export PERL_ARCHLIB =3D "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_pe=
rl_version(d)}"
+export PERL_INC =3D "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl5/${@get_perl_=
version(d)}/${@get_perl_arch(d)}/CORE"
+export PERL_LIB =3D "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl5/${@get_perl_=
version(d)}"
+export PERL_ARCHLIB =3D "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl5/${@get_p=
erl_version(d)}/${@get_perl_arch(d)}"
+
+# The perl symbols CPPSTDIN and CPPRUN embed the sysroot into the
+# binaries, work needed to remove this
+INSANE_SKIP:${PN}-dbg +=3D "buildpaths"
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/=
perf.bb
index 9eeb1003f3a..327934b72a7 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -323,6 +323,9 @@ do_configure:prepend () {
     if [ -e "${S}/tools/build/Makefile.feature" ]; then
         sed -i 's,CFLAGS=3D,CC=3D"\$(CC)" CFLAGS=3D,' ${S}/tools/build/M=
akefile.feature
     fi
+    # The libperl feature check produces fatal warnings due to -Werror b=
eing
+    # used, silence enough errors that the check passes.
+    sed -i 's/\(FLAGS_PERL_EMBED=3D.*\)/\1 -Wno-error=3Dunused-function =
-Wno-error=3Dattributes/' ${S}/tools/build/feature/Makefile
=20
     # 3.17-rc1+ has a include issue for arm/powerpc. Temporarily sed in =
the appropriate include
     if [ -e "${S}/tools/perf/arch/$ARCH/util/skip-callchain-idx.c" ]; th=
en
--=20
2.34.1


