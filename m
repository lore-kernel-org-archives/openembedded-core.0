Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AD1AC282DE
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 00:39:41 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.3034.1741912780831649773
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 17:39:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=mROaQmf9;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52E0dUuP1480976
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Mar 2025 19:39:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741912770;
	bh=mb2Nxy3CViWUQWGbOvYm0DFVSMQji8AH4V+Y/HduzmU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=mROaQmf9Zj5OTA45IyKockJyC/bauPNRlJok9fHXBavA/04vwqCXpkolhhfiLgy+h
	 pXwCUVIYJSyUsBI+O//GOYGYQ8hitr7LnsDgBTL10ZtWkme3eu+eraUrF5x/G9zib1
	 xqYnYKCSiXybG16itwcDJjEX6QZIi3C7ENFSTYCw=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52E0dTY5114821
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Mar 2025 19:39:29 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Mar 2025 19:39:29 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Mar 2025 19:39:29 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52E0dTvk073972;
	Thu, 13 Mar 2025 19:39:29 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 13 Mar 2025 19:39:29 -0500
Message-ID: <D8FKJJ43Y8WT.IS6A9FAONCT@ti.com>
From: Randolph Sapp <rs@ti.com>
To: <rs@ti.com>, <otavio.salvador@ossystems.com.br>, <alex.kanavin@gmail.com>
CC: <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>,
        <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>,
        <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: Re: [OE-core] [PATCH] Revert "gettext: fix a parallel build issue"
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250314002937.672768-1-rs@ti.com>
 <182C83EE5DCDDC9F.6194@lists.openembedded.org>
In-Reply-To: <182C83EE5DCDDC9F.6194@lists.openembedded.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 00:39:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212815

On Thu Mar 13, 2025 at 7:29 PM CDT, Randolph Sapp via lists.openembedded.or=
g wrote:
> From: Randolph Sapp <rs@ti.com>
>
> This reverts commit e18fc96f9d4c0a0525c21371d3f36e8dfe008b35.
> ---
>  ...1-intl-Fix-build-failure-with-make-j.patch | 35 -------------------
>  meta/recipes-core/gettext/gettext_0.22.5.bb   |  1 -
>  2 files changed, 36 deletions(-)
>  delete mode 100644 meta/recipes-core/gettext/gettext/0001-intl-Fix-build=
-failure-with-make-j.patch
>
> diff --git a/meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failur=
e-with-make-j.patch b/meta/recipes-core/gettext/gettext/0001-intl-Fix-build=
-failure-with-make-j.patch
> deleted file mode 100644
> index 144259dd3f..0000000000
> --- a/meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failure-with-=
make-j.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 97a6a63ad61949663283f5fad68c9d5fb9be1f15 Mon Sep 17 00:00:00 2001
> -From: Bruno Haible <bruno@clisp.org>
> -Date: Tue, 12 Sep 2023 11:33:41 +0200
> -Subject: [PATCH] intl: Fix build failure with "make -j".
> -
> -Reported by Christian Weisgerber <naddy@mips.inka.de> at
> -<https://lists.gnu.org/archive/html/bug-gettext/2023-09/msg00005.html>.
> -
> -* gettext-runtime/intl/Makefile.am (langprefs.lo, log.lo): Depend on get=
textP.h
> -and its subordinate includes.
> -
> -Upstream-Status: Backport [https://git.savannah.gnu.org/gitweb/?p=3Dgett=
ext.git;a=3Dcommit;h=3D97a6a63ad61949663283f5fad68c9d5fb9be1f15]
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - gettext-runtime/intl/Makefile.am | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/gettext-runtime/intl/Makefile.am b/gettext-runtime/intl/Mak=
efile.am
> -index da7abb758..9e56978bc 100644
> ---- a/gettext-runtime/intl/Makefile.am
> -+++ b/gettext-runtime/intl/Makefile.am
> -@@ -387,8 +387,8 @@ dngettext.lo:        ../config.h $(srcdir)/gettextP.=
h libgnuintl.h $(srcdir)/gmo
> - ngettext.lo:         ../config.h $(srcdir)/gettextP.h libgnuintl.h $(sr=
cdir)/gmo.h $(srcdir)/loadinfo.h
> - plural.lo:           ../config.h $(srcdir)/plural-exp.h $(PLURAL_DEPS)
> - plural-exp.lo:       ../config.h $(srcdir)/plural-exp.h
> --langprefs.lo:        ../config.h
> --log.lo:              ../config.h
> -+langprefs.lo:        ../config.h $(srcdir)/gettextP.h libgnuintl.h $(sr=
cdir)/gmo.h $(srcdir)/loadinfo.h
> -+log.lo:              ../config.h $(srcdir)/gettextP.h libgnuintl.h $(sr=
cdir)/gmo.h $(srcdir)/loadinfo.h
> - printf.lo:           ../config.h
> - setlocale.lo:        ../config.h $(srcdir)/gettextP.h libgnuintl.h $(sr=
cdir)/gmo.h $(srcdir)/loadinfo.h
> - version.lo:          ../config.h libgnuintl.h
> ---=20
> -2.25.1
> -
> diff --git a/meta/recipes-core/gettext/gettext_0.22.5.bb b/meta/recipes-c=
ore/gettext/gettext_0.22.5.bb
> index 7eeb1a86fd..1a66d37916 100644
> --- a/meta/recipes-core/gettext/gettext_0.22.5.bb
> +++ b/meta/recipes-core/gettext/gettext_0.22.5.bb
> @@ -28,7 +28,6 @@ SRC_URI +=3D " \
>             file://serial-tests-config.patch \
>             file://0001-tests-autopoint-3-unset-MAKEFLAGS.patch \
>             file://0001-init-env.in-do-not-add-C-CXX-parameters.patch \
> -           file://0001-intl-Fix-build-failure-with-make-j.patch \
>             "
> =20
>  inherit autotools texinfo pkgconfig ptest

Sorry for the spam. These are not part of the RFC series and should be igno=
red.
Old patches I forgot to clean out of my pwd.

