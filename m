Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51243C04FDF
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:25:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.21896.1691684700869491669
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:25:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB2CFD75;
	Thu, 10 Aug 2023 09:25:42 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 075093F6C4;
	Thu, 10 Aug 2023 09:24:59 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 9/9] graphene: fix runtime detection of IEEE754 behaviour
Date: Thu, 10 Aug 2023 17:24:51 +0100
Message-Id: <20230810162451.1766532-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810162451.1766532-1-ross.burton@arm.com>
References: <20230810162451.1766532-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:25:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185810

From: Ross Burton <ross.burton@arm.com>

Graphene gates a runtime check on whether it is cross-compiling, when it
should be whether it can run target binaries.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../graphene/files/float-div.patch            | 28 +++++++++++++++++++
 .../graphene/graphene_1.10.8.bb               |  2 ++
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-graphics/graphene/files/float-div.patch

diff --git a/meta/recipes-graphics/graphene/files/float-div.patch b/meta/=
recipes-graphics/graphene/files/float-div.patch
new file mode 100644
index 00000000000..bf74101b1c7
--- /dev/null
+++ b/meta/recipes-graphics/graphene/files/float-div.patch
@@ -0,0 +1,28 @@
+From c19d1f4a7e44e071df3a2612ae2eb20c84e831a6 Mon Sep 17 00:00:00 2001
+From: Emmanuele Bassi <ebassi@gnome.org>
+Date: Thu, 10 Aug 2023 12:44:49 +0100
+Subject: [PATCH] build: Allow host builds when cross-compiling
+
+Environments that set up execution wrappers when cross-compiling should
+be allowed to run code. We only fall back on external properties if we
+really can't run any native code on the host machine.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 48f22d7..7dcb9e6 100644
+--- a/meson.build
++++ b/meson.build
+@@ -270,7 +270,7 @@ int main() {
+  return 0;
+ }
+ '''
+-if meson.is_cross_build()
++if not meson.can_run_host_binaries()
+   ieee754_float_div =3D meson.get_external_property('ieee754_float_div'=
, cc.get_id() in ['gcc', 'clang'])
+   message('Cross-building, assuming IEEE 754 division:', ieee754_float_=
div)
+ else
diff --git a/meta/recipes-graphics/graphene/graphene_1.10.8.bb b/meta/rec=
ipes-graphics/graphene/graphene_1.10.8.bb
index 9f5b4d0e2d3..55d8a2d74ee 100644
--- a/meta/recipes-graphics/graphene/graphene_1.10.8.bb
+++ b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
@@ -7,6 +7,8 @@ GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gobject-introspection gtk-doc
=20
+SRC_URI +=3D "file://float-div.patch"
+
 SRC_URI[archive.sha256sum] =3D "a37bb0e78a419dcbeaa9c7027bcff52f5ec2367c=
25ec859da31dfde2928f279a"
=20
 # Disable neon support by default on ARM-32 platforms because of the
--=20
2.34.1


