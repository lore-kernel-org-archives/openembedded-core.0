Return-Path: <emil.kronborg@protonmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B93B5C4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 07:52:01 +0000 (UTC)
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by mx.groups.io with SMTP id smtpd.web10.7658.1713426716558361850
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Apr 2024 00:51:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@protonmail.com header.s=protonmail3 header.b=BkKFaDRS;
 spf=pass (domain: protonmail.com, ip: 185.70.43.22, mailfrom: emil.kronborg@protonmail.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1713426713; x=1713685913;
	bh=HtCGHodJBrqwoiVNO7U2N2egtO8wvLzJcXE334/49uA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=BkKFaDRS0HWPFnvf4VFUPFxEYtoxmP3Jgjz1D1rgER1EVTVUMGKMfiLiDtW0U5KeR
	 OyoIVrLVsnd6gtwQjLrQp1HG4FY4C6CmaGtQNm5XUwXyrfsgNF19Hvam0msbBnLiH+
	 o3avoUgSNWKk8HQ+1nYO52DnNQj+IWt0wpCLUPB5zCozdBZ5VYFw7dfVb3lvVJ7VHz
	 iN+7qNwsnSaH03vdf8OVAgXgl2pZCIwzAdUhPoa5FqV77/9cs1BWrCVLflW0wbQbgv
	 b9VaBupbnawHRlSi5uIJWb6H0JW8iU97bHnvg9cX/WkXlFrgDnlrMc6zcdozaa29RH
	 TmSWfTYBwccsg==
Date: Thu, 18 Apr 2024 07:51:49 +0000
To: openembedded-core@lists.openembedded.org
From: Emil Kronborg <emil.kronborg@protonmail.com>
Cc: rasmus.villemoes@prevas.dk
Subject: [PATCH v3] at-spi2-core: add at-spi2-atk to CVE_PRODUCT
Message-ID: <20240418075144.13564-1-emil.kronborg@protonmail.com>
Feedback-ID: 20949900:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 07:52:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198503

Commit ad605662f1bc ("at-spi2-core: upgrade 2.44.1 -> 2.46.0") dropped
the at-spi2-atk recipe, because it was merged into at-spi2-core upstream
[1]. The PROVIDES variable was changed to also include at-spi2-atk, but
not CVE_PRODUCT.

[1]: https://gitlab.gnome.org/GNOME/at-spi2-core/-/merge_requests/78

Signed-off-by: Emil Kronborg <emil.kronborg@protonmail.com>
---
Changes in v3:
- Actually append to CVE_PRODUCT instead of setting it to at-spi2-atk.

Changes in v2:
- Add at-spi2-atk via CVE_PRODUCT +=3D to also include at-spi2-core.
- Add a commit message to make the patchtest bot happy.
- Rewrite the subject line to show that at-spi2-atk is appended.

 meta/recipes-support/atk/at-spi2-core_2.52.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.52.0.bb b/meta/recipes=
-support/atk/at-spi2-core_2.52.0.bb
index cf221e038927..913b408403eb 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.52.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.52.0.bb
@@ -7,6 +7,8 @@ BUGTRACKER =3D "http://bugzilla.gnome.org/"
 LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b364516=
c"
=20
+CVE_PRODUCT +=3D "at-spi2-atk"
+
 MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
=20
 SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"

base-commit: 946086abf5ac5172258ddb27af9c1c615258f62f
--=20
2.44.0



