Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48063C04E69
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:24:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.21982.1691684694917875590
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:24:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9369D75;
	Thu, 10 Aug 2023 09:25:36 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CFF463F6C4;
	Thu, 10 Aug 2023 09:24:53 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/9] meson.bbclass: add MESON_TARGET
Date: Thu, 10 Aug 2023 17:24:43 +0100
Message-Id: <20230810162451.1766532-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:24:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185802

From: Ross Burton <ross.burton@arm.com>

Add a variable to control what target gets built in do_compile.  By
default this value is unset so meson builds the default target, but by
setting MESON_TARGET a specific target can be built.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/meson.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meso=
n.bbclass
index 7f5e9b19433..582b41a91b1 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -20,6 +20,9 @@ do_configure[cleandirs] =3D "${B}"
 # Where the meson.build build configuration is
 MESON_SOURCEPATH =3D "${S}"
=20
+# The target to build in do_compile. If unset the default targets are bu=
ilt.
+MESON_TARGET ?=3D ""
+
 def noprefix(var, d):
     return d.getVar(var).replace(d.getVar('prefix') + '/', '', 1)
=20
@@ -170,7 +173,7 @@ do_configure[postfuncs] +=3D "meson_do_qa_configure"
=20
 do_compile[progress] =3D "outof:^\[(\d+)/(\d+)\]\s+"
 meson_do_compile() {
-    meson compile -v ${PARALLEL_MAKE}
+    meson compile -v ${PARALLEL_MAKE} ${MESON_TARGET}
 }
=20
 meson_do_install() {
--=20
2.34.1


