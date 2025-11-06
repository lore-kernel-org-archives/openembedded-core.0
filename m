Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F4F8CCFA05
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 18:15:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4519.1762452903030491088
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 10:15:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E2EC215A1
	for <openembedded-core@lists.openembedded.org>; Thu,  6 Nov 2025 10:14:54 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5228C3F66E
	for <openembedded-core@lists.openembedded.org>; Thu,  6 Nov 2025 10:15:02 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] nativesdk: don't map packaging variables if the recipe inherits nativesdk
Date: Thu,  6 Nov 2025 18:14:57 +0000
Message-ID: <20251106181457.3214940-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106181457.3214940-1-ross.burton@arm.com>
References: <20251106181457.3214940-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 18:15:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225987

The nativesdk class uses a ClassExtender to remap variables and
references, for example turning foo to nativesdk-foo.  We need to do this
always because when the nativesdk class is inherited in a recipe these
need to update automatically: DEPENDS=3Dbar should be DEPENDS=3Dnativesdk=
-bar.

This mapping extends to the packaging variables (RDEPENDS, etc) as it is
usual for nativesdk to be used via BBCLASSEXTEND, so the recipe would be
written using RDEPENDS:${PN}=3Dbar and the class would turn that into
nativesdk-bar automatically.

Some recipes don't use BBCLASSEXTEND and instead inherit nativesdk
directly. These recipes typically use "nativesdk-bar" explicitly and the
remapping isn't needed.  However, the remapping still runs: it normally
has no effect but it will still run.

This is a problem for the recipes that use sdk-provides-dummy.inc to
provide names that we don't want to be in the SDK. Notably,
nativesdk-target-provides-dummy provides "pkgconfig" because packages
can have that literal dependency injected into them by rpmdeps, and
the remapping was changing this to nativesdk-pkgconfig: the intended
provides wasn't present and it became impossible to install pkgconfig
into the nativesdk sysroot.

Note that this broke when the class extension switched to use the new
bitbake filtering API[1], as this meant the remapping happens when the
variables are _read_ instead of at parse time.

[1] oe-core 24a9858a892 ("classes/lib: Switch classextend to use new filt=
er API")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/nativesdk.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/nativesdk.bbclass b/meta/classes-recipe/=
nativesdk.bbclass
index 9838d5a54b7..c2e53c8450a 100644
--- a/meta/classes-recipe/nativesdk.bbclass
+++ b/meta/classes-recipe/nativesdk.bbclass
@@ -104,9 +104,11 @@ python () {
=20
     clsextend.set_filter("DEPENDS", deps=3DTrue)
     clsextend.set_filter("PACKAGE_WRITE_DEPS", deps=3DFalse)
-    clsextend.map_packagevars()
     clsextend.set_filter("PROVIDES", deps=3DFalse)
=20
+    if "nativesdk" in (d.getVar("BBCLASSEXTEND") or ""):
+        clsextend.map_packagevars()
+
     d.setVar("LIBCEXTENSION", "")
     d.setVar("ABIEXTENSION", "")
 }
--=20
2.43.0


