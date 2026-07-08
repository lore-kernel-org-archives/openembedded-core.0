Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03656C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 17:37:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14390.1783532220783973461
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 10:37:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=hgaCA2gz;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F7011756
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2026 10:36:56 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0C50B3F905
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2026 10:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783532220; bh=mMlQJoo365q+UeAXyEssm21iRoUvak9i9iVLgzJu3Hw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hgaCA2gz/J8Epq3YgMI1X64fMwP8eC08LFaMnIqou1ht7clmxlOGf7q4kKhKnUL6t
	 MJfCQXpSxwrwi+II3TyC9mAh4jVXFx4SRgMqQSCVi5UqutPD80s01RdcljzO3h6V+f
	 SVVfIsKcHPQxQj46Na7iUPmQfNpPvBLHe5IDEnTk=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] glibc: disable nscd by default
Date: Wed,  8 Jul 2026 18:36:51 +0100
Message-ID: <20260708173651.1435387-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708173651.1435387-1-ross.burton@arm.com>
References: <20260708173651.1435387-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 17:37:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240503

nscd is the Name Service Caching Daemon, which is useful when fetching
data from the configured Name Service Switch services is slow, for
example if NIS or LDAP is used.

This is unusual for typical OpenEmbedded deployments, and if caching is
needed there are a number of solutions (including nscd) that should be
considered.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/glibc/glibc_2.43.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-core/gl=
ibc/glibc_2.43.bb
index a52dcfd364..67f9e63f2c 100644
--- a/meta/recipes-core/glibc/glibc_2.43.bb
+++ b/meta/recipes-core/glibc/glibc_2.43.bb
@@ -87,7 +87,7 @@ EXTRA_OECONF +=3D "${@get_libc_fpu_setting(bb, d)}"
=20
 EXTRA_OECONF:append:x86-64 =3D " --enable-cet"
=20
-PACKAGECONFIG ??=3D "nscd memory-tagging"
+PACKAGECONFIG ??=3D "memory-tagging"
=20
 PACKAGECONFIG[nscd] =3D "--enable-nscd,--disable-nscd"
 PACKAGECONFIG[memory-tagging] =3D "--enable-memory-tagging,--disable-mem=
ory-tagging"
--=20
2.43.0


