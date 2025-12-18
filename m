Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E622D711C2
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 20:53:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2971.1766091204048694741
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 12:53:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B1C8FEC
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 12:53:16 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D42253F73F
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 12:53:22 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] ofono: add missing mkdir when creating new files
Date: Thu, 18 Dec 2025 20:53:17 +0000
Message-ID: <20251218205318.1605573-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 20:53:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228165

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...g-mkdir-when-creating-unit-test-prov.patch | 27 +++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_2.19.bb |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/0001-build-add-=
missing-mkdir-when-creating-unit-test-prov.patch

diff --git a/meta/recipes-connectivity/ofono/ofono/0001-build-add-missing=
-mkdir-when-creating-unit-test-prov.patch b/meta/recipes-connectivity/ofo=
no/ofono/0001-build-add-missing-mkdir-when-creating-unit-test-prov.patch
new file mode 100644
index 00000000000..b6e816631dc
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/0001-build-add-missing-mkdir-=
when-creating-unit-test-prov.patch
@@ -0,0 +1,27 @@
+From e473db4ef4e418e78d04b8de712b5d280f762b43 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Thu, 18 Dec 2025 18:00:28 +0000
+Subject: [PATCH] build: add missing mkdir when creating unit/test-provis=
ion.db
+
+Upstream-Status: Submitted [https://lore.kernel.org/ofono/20251218180056=
.235274-1-ross.burton@arm.com/T/#u]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+---
+ Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index cf51cdf1..3bd414d6 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -947,6 +947,7 @@ unit_test_qmimodem_qmi_LDADD =3D @GLIB_LIBS@ $(ell_l=
dadd) -ldl
+ unit_objects +=3D $(unit_test_qmimodem_qmi_OBJECTS)
+=20
+ unit/test-provision.db: unit/test-provision.json
++	$(AM_V_at)$(MKDIR_P) unit
+ 	$(AM_V_GEN)$(srcdir)/tools/provisiontool generate \
+ 		--infile $< --outfile $@
+=20
+--=20
+2.43.0
+
diff --git a/meta/recipes-connectivity/ofono/ofono_2.19.bb b/meta/recipes=
-connectivity/ofono/ofono_2.19.bb
index 136c13fbebb..74fa70f609b 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.19.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.19.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539fee=
f013de476e68b5c50a \
 DEPENDS =3D "dbus glib-2.0 udev mobile-broadband-provider-info ell"
=20
 SRC_URI =3D "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
+           file://0001-build-add-missing-mkdir-when-creating-unit-test-p=
rov.patch \
            file://ofono \
            "
 SRC_URI[sha256sum] =3D "d554525ad2db1ccd2fe3ed733e437d76997e7f443c085b87=
e6be1fded020bc8f"
--=20
2.43.0


