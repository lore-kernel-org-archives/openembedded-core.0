Return-Path: <matthias.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1034FC28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 11:03:08 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web11.4822.1742468582489515698
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 04:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=A9737AXN;
 dkim=fail reason="dkim: no key for signature: lookup dkim._domainkey.ew.tq-group.com on 100.100.100.100:53: no such host" header.i=@ew.tq-group.com header.s=dkim header.b=jXVbFfFa;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: matthias.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1742468585; x=1774004585;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lNvaabSbCaJTKKqTdgeUQXASh4Y6R98aBolgHolUtdU=;
  b=A9737AXNraplescXaWVqYhXDzqEElYernBB91qUezxNw/t0hGQHFklgl
   wMBv3FG0Jml0rgAw4uqU8UAiYC3PoCpzGJpPxBoNVjTM+QsO4owuozSct
   OO1cLs0EYAGD0+vVQ1zmP1o10c1Acda8rNo4/PWn4c9b7UDiNf5ZTOewi
   9UqHKJKCn4w3eQtf+SogOdP//pAv8XcGh2DW2KUgwVGGJpmHS6JwdKYOZ
   38dkNzlhexx+Ly8AHLkBTjs576ilV0YTIbuYVPfkpkn3zeK7mPnQe5HS7
   N/3Bzkia37D5BcXlD4tHRntGGGqdvjdgL8c4POnaHuaiO8ISzrCkms6Cb
   w==;
X-CSE-ConnectionGUID: lp8n4vnIQ5ahlongppKvZg==
X-CSE-MsgGUID: yyCP9zuISmK6Q+ZgdBzN+A==
X-IronPort-AV: E=Sophos;i="6.14,261,1736809200"; 
   d="scan'208";a="43068526"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 20 Mar 2025 12:03:04 +0100
X-CheckPoint: {67DBF5E8-2F-F35B2447-E1635CDE}
X-MAIL-CPID: E11CF532E22E97E913F3D8C12B6BE571_1
X-Control-Analysis: str=0001.0A00636B.67DBF5ED.006A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2091B16922F;
	Thu, 20 Mar 2025 12:03:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1742468580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lNvaabSbCaJTKKqTdgeUQXASh4Y6R98aBolgHolUtdU=;
	b=jXVbFfFaMwj776VCNCvuwfq6TDUA5rGHwQu89WKASg1F99e7JcKUQVB/vN7OulHf8QNmvt
	28d5+nq/USCFGvZSbT1VXM/otlduMwpRcrcMv6a6ORvdZzv4AAedfWMxOEJuBpC4Gv63dj
	oPe8XIFiNoJ3IgxHU67JohgUY9uMXy89tf7tq7qxcX7UuKJWsy/bUVIoydn7qAnkOQywx4
	9mo+bn1OM0QZLMrJ7xnuDoF6oYEJhWlHvGH12siWhAzEypm4nfyWqcrShzcaMN8+5a9aOS
	hn9S1aKWubJQLWr72kltN/++S4mCLV70ZTvtegLzugDPWscyAfz2LGBZzpPrcA==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	oss@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v2 2/2] Revert "git: git-replacement-native: depend on ca-certificate"
Date: Thu, 20 Mar 2025 12:02:34 +0100
Message-ID: <48cc62ab319e2fa89a9fcfdeeb84346872f99987.1742467277.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <c6dc4b6aead7933112e653982dccbb8f5db55928.1742467277.git.matthias.schiffer@ew.tq-group.com>
References: <c6dc4b6aead7933112e653982dccbb8f5db55928.1742467277.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 11:03:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213382

This reverts commit 2e99ffda70fd95b5eab3de47048032349cd66f4b.

git-replacement-native is used only to provide a newer version than may
be installed on the system; apart from that, it should work more or less
the same.

In particular, it is using the host system's /etc/gitconfig; it should
also use the system CA certificates, otherwise it will break HTTPS
connections in environments that need local certificates, for example
for a corporate HTTP proxy. The override had been added to deal with
curl-native relying on the existence of its workdir to access CA
certificates, which has been fixed in the curl recipe now.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

v2: extended commit message to explain why the patch is not necessary
    anymore

 meta/recipes-devtools/git/git_2.49.0.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-devtools/git/git_2.49.0.bb b/meta/recipes-devtools/git/git_2.49.0.bb
index 66082d0bde..2ca8711f75 100644
--- a/meta/recipes-devtools/git/git_2.49.0.bb
+++ b/meta/recipes-devtools/git/git_2.49.0.bb
@@ -4,7 +4,6 @@ DESCRIPTION = "Git is a free and open source distributed version control system
 SECTION = "console/utils"
 LICENSE = "GPL-2.0-only & GPL-2.0-or-later & BSD-3-Clause & MIT & BSL-1.0 & LGPL-2.1-or-later"
 DEPENDS = "openssl zlib"
-DEPENDS:class-native += "ca-certificates"
 
 PROVIDES:append:class-native = " git-replacement-native"
 
@@ -97,7 +96,6 @@ perl_native_fixup () {
 
 REL_GIT_EXEC_PATH = "${@os.path.relpath(libexecdir, bindir)}/git-core"
 REL_GIT_TEMPLATE_DIR = "${@os.path.relpath(datadir, bindir)}/git-core/templates"
-REL_GIT_SSL_CAINFO = "${@os.path.relpath(sysconfdir, bindir)}/ssl/certs/ca-certificates.crt"
 
 do_install:append:class-target () {
 	perl_native_fixup
@@ -106,7 +104,6 @@ do_install:append:class-target () {
 do_install:append:class-native() {
 	create_wrapper ${D}${bindir}/git \
 		GIT_EXEC_PATH='`dirname $''realpath`'/${REL_GIT_EXEC_PATH} \
-		GIT_SSL_CAINFO='`dirname $''realpath`'/${REL_GIT_SSL_CAINFO} \
 		GIT_TEMPLATE_DIR='`dirname $''realpath`'/${REL_GIT_TEMPLATE_DIR}
 }
 
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


