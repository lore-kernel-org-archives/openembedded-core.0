Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2577EC79FBB
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 13:07:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13537.1789045630013857287
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 06:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=qCq9+mNM;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B242C1570
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 06:07:05 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0C8353F528
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 06:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789045629; bh=VqVaxIKZiAA6Tit+40trsHNPK+I5klaZK2KoH9EApm4=;
	h=From:To:Subject:Date:From;
	b=qCq9+mNMaAph92mHLH3sbq18H4lbykhjiJrPCvMMgtFF7OwPSfGLM43O2BQnVc44M
	 2aiD9DhrkXdneBWEl+ZSHmxJsklBN4OeebGYi/jiWabb00BnIOj6H6JcmftpRfdUf+
	 99HWFeQd1YSMwOzglT+TOZUQsqNy44YITshc1uYg=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] conf/bitbake.conf: fix GNU mirror URL
Date: Thu, 10 Sep 2026 14:06:59 +0100
Message-ID: <20260910130700.2587601-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 13:07:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245565

Previously we moved GNU_MIRROR from ftp.gnu.org to ftpmirror.gnu.org[1],
however for reasons whilst ftp.gnu.org puts the content under a /gnu/
subdirectory, ftpmirror.gnu.org redirects to inside /gnu/.

This can be verified with curl. With /gnu/ included in the URL:

$ curl -vL https://ftpmirror.gnu.org/gnu/automake/automake-1.19.tar.gz
* Connected to ftpmirror.gnu.org (2001:470:142:5::200) port 443 (#0)
< HTTP/1.1 302 Moved Temporarily
< Location: https://mirror.cs.odu.edu/gnu//gnu/automake/automake-1.19.tar=
.gz
* Connected to mirror.cs.odu.edu (128.82.4.140) port 443 (#1)
> GET /gnu//gnu/automake/automake-1.19.tar.gz HTTP/1.1
< HTTP/1.1 404 Not Found

However, removing it:

$ curl -vL https://ftpmirror.gnu.org/automake/automake-1.19.tar.gz
* Connected to ftpmirror.gnu.org (2001:470:142:5::200) port 443 (#0)
< HTTP/1.1 302 Moved Temporarily
< Location: https://mirror.ibcp.fr/pub/gnu//automake/automake-1.19.tar.gz
* Connected to mirror.ibcp.fr (2001:660:500b:245::145) port 443 (#1)
> GET /pub/gnu//automake/automake-1.19.tar.gz HTTP/2
< HTTP/2 200
< content-length: 2517494
< content-type: application/x-gzip

This wasn't noticed as we have a default mirrors.bbclass which uses the
kernel.org mirror network.

It's also interesting that ftpmirror's attempt at providing local
mirrors is far from optimal: in testing this from the UK I was given
mirrors in the USA and China as often as Europe.

[1] oe-core d8c6f01d746 ("conf/bitbake.conf: use gnu mirror instead of ma=
in server")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a21223e216a..8a102d5e8f1 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -709,7 +709,7 @@ DEBIAN_MIRROR =3D "http://deb.debian.org/debian/pool"
 GENTOO_MIRROR =3D "http://distfiles.gentoo.org/distfiles"
 GNOME_GIT =3D "git://gitlab.gnome.org/GNOME"
 GNOME_MIRROR =3D "https://download.gnome.org/sources/"
-GNU_MIRROR =3D "https://ftpmirror.gnu.org/gnu"
+GNU_MIRROR =3D "https://ftpmirror.gnu.org/"
 GNUPG_MIRROR =3D "https://www.gnupg.org/ftp/gcrypt"
 KERNELORG_MIRROR =3D "https://cdn.kernel.org/pub"
 SAMBA_MIRROR =3D "http://samba.org/samba/ftp"
--=20
2.43.0


