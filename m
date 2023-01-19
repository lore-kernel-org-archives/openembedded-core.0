Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26AD2C004D4
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 09:44:20 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.41732.1674121457998524923
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 01:44:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Q9sQwmoM;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0B48110000E;
	Thu, 19 Jan 2023 09:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674121456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JQoi23W/nZEdYm95uBEXSNtrWURTb4sQQ+tVsZej2cY=;
	b=Q9sQwmoMrm6MVUl9yOAdu5ZxJH/e7VIfBReFhQKrXedZwP4PUAMvoh2qYNi3kDRf7Zhrmp
	XJiUs2VeM9+8HRQsYmkZiyCr7OS2gzfA4hhN2Zk/wCkVxWVyHPjHlBHsoQpi1382/Z/qTl
	LynUh9OlRHvpCLPj4+dwDuziqw/0mI0SYT4dPr34O4twjGoElmpxb+25JO3Pmt3Dv5GGJX
	obAuKlU1OlQpZpW0eJBdejXVu41nZSdP+5yNKkvwS7UarykbYdqxY4m44UGnqoPLUdiCff
	NAka02xIiRxKCEliuzC/Ro3pxdB5B+oqIeUVI3UIByvxUgfuXmT8HpdHhQYBew==
Date: Thu, 19 Jan 2023 10:44:13 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Khem Raj" <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alejandro Hernandez
 <aehs29@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
Subject: Re: [OE-core] [PATCH v2 1/3] binutils: Upgrade to 2.40 release
Message-ID: <20230119104413.0afa6711@booty>
In-Reply-To: <20230119042724.1413857-1-raj.khem@gmail.com>
References: <20230119042724.1413857-1-raj.khem@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 09:44:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176131

Hi Khem,

On Wed, 18 Jan 2023 20:27:22 -0800
"Khem Raj" <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v1 -> v2:
> - Fix build on mingw
> - Backport fix to build with --disable-gdb
> 
>  meta/conf/distro/include/tcmode-default.inc   |     2 +-
>  .../{binutils-2.39.inc => binutils-2.40.inc}  |    22 +-
>  ....39.bb => binutils-cross-canadian_2.40.bb} |     0
>  ...39.bb => binutils-cross-testsuite_2.40.bb} |     0
>  ...s-cross_2.39.bb => binutils-cross_2.40.bb} |     0
>  ...ssdk_2.39.bb => binutils-crosssdk_2.40.bb} |     0
>  ...s-crosssdk-Generate-relocatable-SDKs.patch |    10 +-
>  ...o-not-generate-linker-script-directo.patch |     4 +-
>  ...dk-Search-for-alternative-ld.so.conf.patch |    18 +-
>  ...004-Point-scripts-location-to-libdir.patch |    10 +-
>  ...stro-compiler-point-to-the-wrong-ins.patch |     4 +-
>  ...-system-directories-when-cross-linki.patch |    44 +-
>  ...ect-assembling-for-ppc-wait-mnemonic.patch |     8 +-
>  .../binutils/0008-Use-libtool-2.4.patch       | 19254 ++++++++++------
>  ...h-in-libtool-when-sysroot-is-enabled.patch |     2 +-
>  .../0010-sync-with-OE-libtool-changes.patch   |     2 +-
>  ...or-clang-before-checking-gcc-version.patch |    10 +-
>  ...-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch |     4 +-
>  .../binutils/0013-CVE-2022-38533.patch        |    36 -
>  ...sing-_Alignof-when-using-C11-or-newe.patch |    48 +
>  .../binutils/0014-CVE-2022-38128-1.patch      |   350 -
>  .../binutils/0014-CVE-2022-38128-2.patch      |   536 -
>  .../binutils/0014-CVE-2022-38128-3.patch      |    95 -
>  ...-dependencies-on-gmp-and-mpfr-when-g.patch |    56 +
>  .../binutils/0015-CVE-2022-4285.patch         |    37 -
>  ...-pe-dll.o-entry-deom-targ_extra_ofil.patch |    41 +
>  .../{binutils_2.39.bb => binutils_2.40.bb}    |     0
>  27 files changed, 11820 insertions(+), 8773 deletions(-)
>  rename meta/recipes-devtools/binutils/{binutils-2.39.inc => binutils-2.40.inc} (71%)
>  rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.39.bb => binutils-cross-canadian_2.40.bb} (100%)
>  rename meta/recipes-devtools/binutils/{binutils-cross-testsuite_2.39.bb => binutils-cross-testsuite_2.40.bb} (100%)
>  rename meta/recipes-devtools/binutils/{binutils-cross_2.39.bb => binutils-cross_2.40.bb} (100%)
>  rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.39.bb => binutils-crosssdk_2.40.bb} (100%)
>  delete mode 100644 meta/recipes-devtools/binutils/binutils/0013-CVE-2022-38533.patch
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
>  delete mode 100644 meta/recipes-devtools/binutils/binutils/0014-CVE-2022-38128-1.patch
>  delete mode 100644 meta/recipes-devtools/binutils/binutils/0014-CVE-2022-38128-2.patch
>  delete mode 100644 meta/recipes-devtools/binutils/binutils/0014-CVE-2022-38128-3.patch
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0014-configure-remove-dependencies-on-gmp-and-mpfr-when-g.patch
>  delete mode 100644 meta/recipes-devtools/binutils/binutils/0015-CVE-2022-4285.patch
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0015-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch
>  rename meta/recipes-devtools/binutils/{binutils_2.39.bb => binutils_2.40.bb} (100%)
> 
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index 4d4929529a..bcc5f7ce1f 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -18,7 +18,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
>  
>  GCCVERSION ?= "12.%"
>  SDKGCCVERSION ?= "${GCCVERSION}"
> -BINUVERSION ?= "2.39%"
> +BINUVERSION ?= "2.40%"
>  GDBVERSION ?= "12.%"
>  GLIBCVERSION ?= "2.37"
>  LINUXLIBCVERSION ?= "6.1%"

Applying this patch on an oe-core repository fails with 'git am':

error: sha1 information is lacking or useless (meta/conf/distro/include/tcmode-default.inc).
error: could not build fake ancestor
Patch failed at 0001 binutils: Upgrade to 2.40 release

And also with 'git apply'

error: patch failed: meta/conf/distro/include/tcmode-default.inc:18
error: meta/conf/distro/include/tcmode-default.inc: patch does not apply

I noticed you prepared the patch in a poky repository, so I did apply
it there, re-extracted it via 'git format-patch' and the resulting
patch applied perfectly on my oe-core. This happened with your v1 as
well a couple days ago.

I don't understand the root cause and definitely there are no recent
commits that create conflicts. However I'm wondering whether you could
move to working on actual oe-core instead of poky. It would certainly
help me.

Kind regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

