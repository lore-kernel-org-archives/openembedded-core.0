Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E97CF044A
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 10:47:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.13326.1728470846069447473
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Oct 2024 03:47:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35267139F;
	Wed,  9 Oct 2024 03:47:55 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1B2003F64C;
	Wed,  9 Oct 2024 03:47:24 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: [PATCH 2/2] insane: remove now obsolete special case for musl on mips
Date: Wed,  9 Oct 2024 11:47:16 +0100
Message-Id: <20241009104716.711424-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009104716.711424-1-ross.burton@arm.com>
References: <20241009104716.711424-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 10:47:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205347

We don't need to special-case musl-on-mips now that the link hash is the
correct type by default.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-global/insane.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
index 231d6390ff8..c6991a7a621 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -419,8 +419,6 @@ def package_qa_hash_style(path, name, d, elf):
             has_syms =3D True
         if "GNU_HASH" in line or "MIPS_XHASH" in line:
             sane =3D True
-        if ("[mips32]" in line or "[mips64]" in line) and d.getVar('TCLI=
BC') =3D=3D "musl":
-            sane =3D True
     if has_syms and not sane:
         path =3D package_qa_clean_path(path, d, name)
         oe.qa.handle_error("ldflags", "File %s in package %s doesn't hav=
e GNU_HASH (didn't pass LDFLAGS?)" % (path, name), d)
--=20
2.34.1


