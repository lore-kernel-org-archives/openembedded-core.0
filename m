Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37190C7EE2A
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 14:38:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.28074.1684507128972907283
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 May 2023 07:38:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA72E1FB;
	Fri, 19 May 2023 07:39:32 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9D8873F793;
	Fri, 19 May 2023 07:38:47 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/3] libcheck: add ghetto automake output
Date: Fri, 19 May 2023 15:38:44 +0100
Message-Id: <20230519143846.378675-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 May 2023 14:38:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181553

From: Ross Burton <ross.burton@arm.com>

---
 .../libcheck/libcheck/automake-output.patch   | 82 +++++++++++++++++++
 .../libcheck/libcheck_0.15.2.bb               |  2 +-
 2 files changed, 83 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libcheck/libcheck/automake-outpu=
t.patch

diff --git a/meta/recipes-support/libcheck/libcheck/automake-output.patch=
 b/meta/recipes-support/libcheck/libcheck/automake-output.patch
new file mode 100644
index 00000000000..c860f0cc0f4
--- /dev/null
+++ b/meta/recipes-support/libcheck/libcheck/automake-output.patch
@@ -0,0 +1,82 @@
+Add optional output in automake style, for integration with ptest.
+Export CK_AUTOMAKE=3D1 when running a test suite and you'll get
+PASS/FAIL lines on standard output.
+
+Marking this as Inappropriate right now as it's a little rough on the
+edges. Filed https://github.com/libcheck/check/issues/349 to discuss
+with upstream.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/src/check_log.c b/src/check_log.c
+index 0844661..ad23c65 100644
+--- a/src/check_log.c
++++ b/src/check_log.c
+@@ -26,6 +26,7 @@
+ #if ENABLE_SUBUNIT
+ #include <subunit/child.h>
+ #endif
++#include <libgen.h>
+=20
+ #include "check_error.h"
+ #include "check_list.h"
+@@ -381,6 +382,34 @@ void tap_lfun(SRunner * sr CK_ATTRIBUTE_UNUSED, FIL=
E * file,
+     }
+ }
+=20
++void am_lfun(SRunner * sr CK_ATTRIBUTE_UNUSED, FILE * file,
++             enum print_output printmode CK_ATTRIBUTE_UNUSED, void *obj=
,
++             enum cl_event evt)
++{
++    TestResult *tr;
++    const char* types[] =3D { "INVALID", "PASS", "FAIL", "ERROR"};
++
++    switch (evt)
++    {
++        case CLINITLOG_SR:
++        case CLENDLOG_SR:
++        case CLSTART_SR:
++        case CLSTART_S:
++        case CLEND_SR:
++        case CLEND_S:
++        case CLSTART_T:
++            break;
++        case CLEND_T:
++            tr =3D (TestResult *)obj;
++            fprintf(file, "%s: %s:%s:%s %s\n",
++                    types[tr->rtype], basename(tr->file), tr->tcname, t=
r->tname, tr->msg);
++            fflush(file);
++            break;
++        default:
++            eprintf("Bad event type received in am_lfun", __FILE__, __L=
INE__);
++    }
++}
++
+ #if ENABLE_SUBUNIT
+ void subunit_lfun(SRunner * sr, FILE * file, enum print_output printmod=
e,
+                   void *obj, enum cl_event evt)
+@@ -527,6 +556,9 @@ void srunner_init_logging(SRunner * sr, enum print_o=
utput print_mode)
+     {
+         srunner_register_lfun(sr, f, f !=3D stdout, tap_lfun, print_mod=
e);
+     }
++    if (getenv("CK_AUTOMAKE"))
++        srunner_register_lfun(sr, stdout, 0, am_lfun, print_mode);
++
+     srunner_send_evt(sr, NULL, CLINITLOG_SR);
+ }
+=20
+diff --git a/src/check_log.h b/src/check_log.h
+index 7223b98..bfe1de3 100644
+--- a/src/check_log.h
++++ b/src/check_log.h
+@@ -40,6 +40,9 @@ void xml_lfun(SRunner * sr, FILE * file, enum print_ou=
tput,
+ void tap_lfun(SRunner * sr, FILE * file, enum print_output,
+               void *obj, enum cl_event evt);
+=20
++void am_lfun(SRunner * sr, FILE * file, enum print_output,
++             void *obj, enum cl_event evt);
++
+ void subunit_lfun(SRunner * sr, FILE * file, enum print_output,
+                   void *obj, enum cl_event evt);
+=20
diff --git a/meta/recipes-support/libcheck/libcheck_0.15.2.bb b/meta/reci=
pes-support/libcheck/libcheck_0.15.2.bb
index 83f3c3f46ef..5ab67b87286 100644
--- a/meta/recipes-support/libcheck/libcheck_0.15.2.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.15.2.bb
@@ -11,6 +11,7 @@ LICENSE  =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING.LESSER;md5=3D2d5025d4aa3495befef8f1=
7206a5b0a1"
=20
 SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/check-${PV}.tar.gz \
+           file://automake-output.patch \
            file://not-echo-compiler-info-to-check_stdint.h.patch"
 SRC_URI[sha256sum] =3D "a8de4e0bacfb4d76dd1c618ded263523b53b85d92a146d88=
35eb1a52932fa20a"
 GITHUB_BASE_URI =3D "https://github.com/libcheck/check/releases/"
@@ -33,4 +34,3 @@ PACKAGES =3D+ "checkmk"
 FILES:checkmk =3D "${bindir}/checkmk"
=20
 RDEPENDS:checkmk =3D "gawk"
-
--=20
2.34.1


