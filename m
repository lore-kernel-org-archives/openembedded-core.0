Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A4FFF30950
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 11:51:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42569.1772711498415613495
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 03:51:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B935497
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Mar 2026 03:51:31 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9743C3F836
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Mar 2026 03:51:37 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] subversion: fix race in parallel builds
Date: Thu,  5 Mar 2026 11:51:30 +0000
Message-ID: <20260305115130.914001-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305115130.914001-1-ross.burton@arm.com>
References: <20260305115130.914001-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 11:51:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232485

In parallel build its possible for objects to be written into directories
that do not exist yet, as mkdir-init and local-all are executed at the
same time.

This fix is ugly, but a proper fix would be quite invasive. Upstream have
been informed of the problem.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../subversion/subversion/parallel.patch      | 25 +++++++++++++++++++
 .../subversion/subversion_1.14.5.bb           |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/subversion/subversion/parallel.=
patch

diff --git a/meta/recipes-devtools/subversion/subversion/parallel.patch b=
/meta/recipes-devtools/subversion/subversion/parallel.patch
new file mode 100644
index 0000000000..1fee1523ee
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion/parallel.patch
@@ -0,0 +1,25 @@
+Ensure that directories are created before files are compiled into them.
+
+This is a hacky workaround, upstream have been informed and a better
+solution proposed:
+
+https://lists.apache.org/thread/nr0w8hcpr9my2gkys09kj89rlxgd84of
+
+Upstream-Status: Inappropriate [discussion upstream]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git i/Makefile.in w/Makefile.in
+index 0fb9e39602..8bae2cc3d2 100644
+--- i/Makefile.in
++++ w/Makefile.in
+@@ -424,7 +424,9 @@ ECHO_N =3D @ECHO_N@
+=20
+ TESTS =3D $(TEST_PROGRAMS) @BDB_TEST_PROGRAMS@
+=20
+-all: mkdir-init local-all
++all: mkdir-init
++	$(MAKE) local-all
++
+ clean: local-clean
+ distclean: local-distclean
+ extraclean: local-extraclean
diff --git a/meta/recipes-devtools/subversion/subversion_1.14.5.bb b/meta=
/recipes-devtools/subversion/subversion_1.14.5.bb
index 56ef1019fc..47e2b6c693 100644
--- a/meta/recipes-devtools/subversion/subversion_1.14.5.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.14.5.bb
@@ -10,6 +10,7 @@ DEPENDS:append:class-native =3D " file-replacement-nati=
ve"
=20
 SRC_URI =3D "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://serfmacro.patch \
+           file://parallel.patch \
            "
=20
 SRC_URI[sha256sum] =3D "e78a29e7766b8b7b354497d08f71a55641abc53675ce1875=
584781aae35644a1"
--=20
2.43.0


