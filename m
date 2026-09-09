Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1425C79FB6
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 11:52:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10263.1788954738597355833
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 04:52:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=twfPbwEB;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 196E11477
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Sep 2026 04:52:14 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5F6673F528
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Sep 2026 04:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788954737; bh=7BS/43A1FdsQe+9GxeawZJv277nQ1meLCuy1DaH2JEQ=;
	h=From:To:Subject:Date:From;
	b=twfPbwEBZiHJ4KlRDi0FTFvhrSKTb8Y2lCpjkrEk1MFB8FyAEwxNk+pAVnNTjUFqf
	 yMIglI1wK8WH5xJ6DV2WROPJcFXkD16HzCDDEUIYWJj7uUJ1T57eff+QLZRtkr5qoY
	 2h+tGm1XkYxsGbG4jtZphTjvDxBOTD+9Prv4aNDs=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glib: backport patch to fix compile warnings with clang
Date: Wed,  9 Sep 2026 12:52:13 +0100
Message-ID: <20260909115213.3002439-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 11:52:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245458

clang 23 added -Wunused-but-set-global, which fires on the
type_name##_parent_class variable that _G_DEFINE_TYPE_EXTENDED_BEGIN_PRE
emits whenever a type never chains up to its parent:

As this causes warnings in all builds which some projects (eg, pango)
then make fatal, backport the patch to silence this warning.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ..._DEFINE_TYPE-parent_class-variable-a.patch | 44 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib.inc           |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/files/0001-gtype-Mark-the-=
G_DEFINE_TYPE-parent_class-variable-a.patch

diff --git a/meta/recipes-core/glib-2.0/files/0001-gtype-Mark-the-G_DEFIN=
E_TYPE-parent_class-variable-a.patch b/meta/recipes-core/glib-2.0/files/0=
001-gtype-Mark-the-G_DEFINE_TYPE-parent_class-variable-a.patch
new file mode 100644
index 00000000000..642e02550bd
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/0001-gtype-Mark-the-G_DEFINE_TYPE-=
parent_class-variable-a.patch
@@ -0,0 +1,44 @@
+From 1567250294e9666747ee63f5c6364bbceadd300b Mon Sep 17 00:00:00 2001
+From: Sunil Dora <sunilkumar.dora@windriver.com>
+Date: Sun, 30 Aug 2026 11:39:28 +0530
+Subject: [PATCH] gtype: Mark the G_DEFINE_TYPE parent_class variable as =
unused
+
+clang 23 added -Wunused-but-set-global, which fires on the
+type_name##_parent_class variable that _G_DEFINE_TYPE_EXTENDED_BEGIN_PRE
+emits whenever a type never chains up to its parent:
+
+  error: variable 'my_thing_parent_class' set but not used
+  [-Werror,-Wunused-but-set-global]
+
+Projects that promote the unused-but-set group to an error (pango, for
+one) now fail to build with clang 23, and they cannot fix it on their
+side because the variable comes from this macro.
+
+Annotate it G_GNUC_UNUSED, the same treatment the adjacent
+get_instance_private helper already gets.
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+Fixes: #4038
+
+Upstream-Status: Backport [1567250294e9666747ee63f5c6364bbceadd300b]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ gobject/gtype.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gobject/gtype.h b/gobject/gtype.h
+index 1d383a8ea..de5188f9f 100644
+--- a/gobject/gtype.h
++++ b/gobject/gtype.h
+@@ -2295,7 +2295,7 @@ static void     type_name##_class_intern_init (gpo=
inter klass) \
+ static void     type_name##_init              (TypeName        *self); =
\
+ static void     type_name##_class_init        (TypeName##Class *klass);=
 \
+ static GType    type_name##_get_type_once     (void); \
+-static gpointer type_name##_parent_class =3D NULL; \
++G_GNUC_UNUSED static gpointer type_name##_parent_class =3D NULL; \
+ static gint     TypeName##_private_offset; \
+ \
+ _G_DEFINE_TYPE_EXTENDED_CLASS_INIT(TypeName, type_name) \
+--=20
+2.43.0
+
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib=
-2.0/glib.inc
index 903d56e05fb..d80cf6f2671 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -239,6 +239,7 @@ SRC_URI +=3D "\
            file://CVE-2026-58016-1.patch \
            file://CVE-2026-58016-2.patch \
            file://0001-gio-tests-services-Fix-installed-service-file-usi=
ng-.patch \
+           file://0001-gtype-Mark-the-G_DEFINE_TYPE-parent_class-variabl=
e-a.patch \
            "
 SRC_URI:append:class-native =3D " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pi=
dfd-features-on-native-g.patch \
--=20
2.43.0


