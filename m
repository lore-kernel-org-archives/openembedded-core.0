Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B280C43602
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 12:56:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68467.1782996989781161973
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 05:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=REWWyHEd;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF2011FCD
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Jul 2026 05:56:24 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E91223F673
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Jul 2026 05:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782996989; bh=Cxq9TnoovTuGkTXlCYcmvDBOW7wlFj8NICcYtOkXmgw=;
	h=From:To:Subject:Date:From;
	b=REWWyHEdRwtyFI+lfpR6bVSWkMwUSUfe+riQZxHQsBXXF5/JXmOSob34Wlbq7WzIo
	 dIZW6CH+O4VZ62TV92BP7QJczm82QtTuO6kdWkmKTBWA/FhxkeYwvZoFkV6LkXfuU+
	 3uAjUOfHraCN5oFLMpOZu7jis81GKPniM0y/efRM=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/6] classes/meson: set python install locations in the cross file
Date: Thu,  2 Jul 2026 13:56:22 +0100
Message-ID: <20260702125627.977563-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 12:56:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240037

Instead of needing recipes to inherit python3targetconfig so that Python
when asked will report the correct target directory to install into, we
can pass the right directory via meson's cross file.

This means recipes that currently inherit python3targetconfig to get
this path no longer need to.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/meson.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meso=
n.bbclass
index a4643591103..553f63872de 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -94,6 +94,8 @@ c_args =3D ${@meson_array('CFLAGS', d)}
 c_link_args =3D ${@meson_array('LDFLAGS', d)}
 cpp_args =3D ${@meson_array('CXXFLAGS', d)}
 cpp_link_args =3D ${@meson_array('LDFLAGS', d)}
+python.platlibdir =3D '${PYTHON_SITEPACKAGES_DIR}'
+python.purelibdir =3D '${PYTHON_SITEPACKAGES_DIR}'
=20
 [properties]
 needs_exe_wrapper =3D true
--=20
2.43.0


