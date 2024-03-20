Return-Path: <emil.kronborg@protonmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AFC8C6FD1F
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 15:36:53 +0000 (UTC)
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by mx.groups.io with SMTP id smtpd.web10.48147.1710949009317079074
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 08:36:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@protonmail.com header.s=protonmail3 header.b=aXknynZG;
 spf=pass (domain: protonmail.com, ip: 185.70.43.22, mailfrom: emil.kronborg@protonmail.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1710949007; x=1711208207;
	bh=bMz19RIqvlmYhqAEwRkGMTV6c7v1RckRx/QchgcBGmg=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=aXknynZGNFy4wo1m4JuQlbcWz2RN1cUVBOgfKh5aQGxHpWGqUmQn0KLnlKd5UHou0
	 +jUvWSjTPLVOCh9B3kMFLtYwO1rF8Dx5Xcypp1EkwkI9jgOQW2MekwD3KOWh9sDCZr
	 /LNCfRlaLiKHPzGGcFDGCzIeA4Hj8Jfwssrbzl47Jo7QRWvYLVhmjLS1cvvzJMegmi
	 +fOehXeATH7mL7I7C+QE+JUI7kVTsEiSG0vfZ09stOqEIZm6olPaqBfJXlGkYfad8i
	 ciAPLeFlvu83+ypN3wL6IW+GgglVOrFelC2Aj2Nv0fO+goroN+E5J/Qi57QRaGF1lg
	 xpmkgiH18X+4Q==
Date: Wed, 20 Mar 2024 15:36:29 +0000
To: openembedded-core@lists.openembedded.org
From: Emil Kronborg <emil.kronborg@protonmail.com>
Cc: rasmus.villemoes@prevas.dk, Emil Kronborg <emil.kronborg@protonmail.com>
Subject: [PATCH] pypi.bbclass: remove vendor from CVE_PRODUCT
Message-ID: <20240320152807.191065-2-emil.kronborg@protonmail.com>
Feedback-ID: 20949900:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 15:36:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197361

By specifying the CVE vendor as python, some CVEs are not found. For
instance, the CVE_PRODUCT for python3-pyopenssl becomes
python:pyopenssl, which yields no matches in the NIST NVD database
because the correct CVE vendor is pyopenssl.

Generally, CVE_PRODUCT ?=3D ${PYPI_PACKAGE}:${PYPI_PACKAGE} captures most
cases. However, some package names, such as python3-pytest, are
unrelated to the correct CVE product. In this case, the correct CVE
vendor is pytest, but the CVE product is py, resulting in no CVEs being
found. Therefore, not setting the CVE vendor is the most correct option.
---
 meta/classes-recipe/pypi.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/pypi.bbclass b/meta/classes-recipe/pypi.bb=
class
index b8c18ccf395a..64ef9148d27e 100644
--- a/meta/classes-recipe/pypi.bbclass
+++ b/meta/classes-recipe/pypi.bbclass
@@ -35,4 +35,4 @@ UPSTREAM_CHECK_PYPI_PACKAGE ?=3D "${@d.getVar('PYPI_PACKA=
GE').replace('_', '-')}"
 UPSTREAM_CHECK_URI ?=3D "https://pypi.org/project/${UPSTREAM_CHECK_PYPI_PA=
CKAGE}/"
 UPSTREAM_CHECK_REGEX ?=3D "/${UPSTREAM_CHECK_PYPI_PACKAGE}/(?P<pver>(\d+[\=
.\-_]*)+)/"
=20
-CVE_PRODUCT ?=3D "python:${PYPI_PACKAGE}"
+CVE_PRODUCT ?=3D "${PYPI_PACKAGE}"
--=20
2.44.0



