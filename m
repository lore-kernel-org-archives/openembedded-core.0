Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB908FF8867
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 20:46:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5993.1777322810675823670
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 13:46:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=ttYcWlSr;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D7D1497
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 13:46:44 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B2FBA3F763
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 13:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777322810; bh=9l/0IISeAALwP0ogMyMIWQmfxj9Arpr1Aqmv/d1wLSw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ttYcWlSrt3UKBDIFKFPaks3ZSUVwEhkUayw3OMwLB9BOjVxCkDKdXsn6zYSYsjMCv
	 VEKTH60tYyXnxMvzcWjPhZPfo8oxnWyfUTokv5UQ8myrwpd35zPJV5sq8z15cDBgby
	 pjzVhwSDit9UUL/y+Ubob+Gy/QpnFdO0oJP8Gv+4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] p11-kit: explicitly disable tests and zsh-completions
Date: Mon, 27 Apr 2026 21:46:39 +0100
Message-ID: <20260427204640.2003231-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427204640.2003231-1-ross.burton@arm.com>
References: <20260427204640.2003231-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 20:46:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236023

There's no need to build the tests as we won't run them, and disable the
zsh completion to avoid having to package the files.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/p11-kit/p11-kit_0.26.2.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb b/meta/recipe=
s-support/p11-kit/p11-kit_0.26.2.bb
index a0e2e17d026..69fb76658ea 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb
@@ -19,7 +19,11 @@ PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue,-Dman=3Dfals=
e,libxslt-native"
 PACKAGECONFIG[trust] =3D "-Dtrust_module=3Denabled,-Dtrust_module=3Ddisa=
bled,libtasn1-native libtasn1"
 PACKAGECONFIG[trust-paths] =3D "-Dtrust_paths=3D/etc/ssl/certs/ca-certif=
icates.crt,,,ca-certificates"
=20
-EXTRA_OEMESON:append =3D " -Dnls=3D${@'false' if d.getVar('USE_NLS') =3D=
=3D 'no' else 'true'}"
+EXTRA_OEMESON =3D "\
+    -Dtest=3Dfalse \
+    -Dzsh_completion=3Ddisabled \
+    -Dnls=3D${@'false' if d.getVar('USE_NLS') =3D=3D 'no' else 'true'}"
+
 GTKDOC_MESON_OPTION =3D 'gtk_doc'
=20
 FILES:${PN} +=3D " \
--=20
2.43.0


