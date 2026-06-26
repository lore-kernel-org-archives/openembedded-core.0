Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F1E8C43602
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 15:13:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37267.1782486816575940079
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 08:13:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=b2KiWR8a;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 814371E7D
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 08:13:31 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9F2203F99C
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 08:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782486816; bh=F7kKOK8HpXrHkrcAhm8HlZH0O90JGPDR9GEK9O+QEcs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=b2KiWR8aE3/J00XcZDJ5C9B1P+4iHt6GgqfeaU6+Gnv2Z+GEQtPFPOpqkGpH3lSIf
	 37GRXYHJpyD3rW01STDJpVrCJWkHUcnhAk+VezFTErBTucMN6IfU600gzcFp/4S1zt
	 wdaTAhRDFeCD3Ex4cH7LIwp9IMyasHnaASNH5Bgs=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] classes/gtk-doc: inherit python3native only if gtk-doc is enabled
Date: Fri, 26 Jun 2026 16:13:25 +0100
Message-ID: <20260626151325.1735368-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626151325.1735368-1-ross.burton@arm.com>
References: <20260626151325.1735368-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 15:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239649

Use inherit_defer to only inherit python3native (thus, a dependency on
python3-native) when gtk-doc is actually enabled.

This is useful in native builds where gtk-doc is disabled and so will no
longer depend on python3-native.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/gtk-doc.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/gtk-doc.bbclass b/meta/classes-recipe/gt=
k-doc.bbclass
index 9d3911966bb..33f6617e1bd 100644
--- a/meta/classes-recipe/gtk-doc.bbclass
+++ b/meta/classes-recipe/gtk-doc.bbclass
@@ -35,9 +35,11 @@ DEPENDS:append =3D " gtk-doc-native"
=20
 export STAGING_DIR_HOST
=20
-inherit python3native pkgconfig qemu
+inherit pkgconfig qemu
 DEPENDS:append =3D "${@' qemu-native' if d.getVar('GTKDOC_ENABLED') =3D=3D=
 'True' else ''}"
=20
+inherit_defer ${@bb.utils.contains('GTKDOC_ENABLED', 'True', 'python3nat=
ive', '', d)}
+
 do_compile:prepend:class-target () {
     if [ ${GTKDOC_ENABLED} =3D True ]; then
         # Write out a qemu wrapper that will be given to gtkdoc-scangobj=
 so that it
--=20
2.43.0


