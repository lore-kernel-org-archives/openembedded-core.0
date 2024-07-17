Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82951C3DA42
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 12:58:14 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.14462.1721221088962202764
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jul 2024 05:58:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DeXBrAlj;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.170, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6512866fa87so65086517b3.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 05:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721221088; x=1721825888; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRZZMXnKYz0EcMzcJHE1DY5BA/OxB7DtNHCdFfBFMWk=;
        b=DeXBrAljrd8NYM3yNZjoM6+fHuMf+Tavq4FKWjKpltizFJiOpCf2EgT+WyvjSkXb9g
         sLBC4SOZGG8DczLWFMd069EwdX8lqn4RZME2olZ4ca5pfoVEPh8SUkunm6CnOFFoUIL0
         cutQ7k7HnqtUAqCZf4ceXP2cQAkWF6KbOpRQ3u4WbWGE0U61VqXA7v9CZJLfDjURB+jA
         Kl7rh3jQpugCnfujhZDJI0MHy6kTzXWGkWgGDdUN9Yr/eN0/56tle7nlaqXV4fkZe5W1
         WWeriru6klggX9MdWDYtbXFBGaum8joHWn6BtxblYpTc0T44mic2cKYA0CE4ttxUcH3S
         Igeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721221088; x=1721825888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uRZZMXnKYz0EcMzcJHE1DY5BA/OxB7DtNHCdFfBFMWk=;
        b=U+FjRU5mm4xXdOYggD/2xuXIPEd1myaSJ6xFSP2jqhe8Pvq4f4WxVG5USuluf55k2I
         WVCWJKf2rmMH+ssETouPBxj1hGJVwj1OgdClER1CfQIprNgkMnkE+wQ5nXtSN8lvd4xZ
         grRCTa5CGvOP3kZodoJm5NAuacKIowmStrINuEV04+Wj4soHkcrrOKLmi93p83ykyVDp
         55QC3Jc+P4dS0lavViyHZ5lneY7zkQ2rxq4ymScvVNawL2Y9xwXZxZESjdoKasH3P0xB
         ypVeJBKx485n3lwI60QUsVQfxuVUa74bRJH+RdzBZLPYpLsyzQrij2I8EFIhHgkWnOom
         H/ww==
X-Gm-Message-State: AOJu0Yx9c4fKKJdta+7bOGQa8rSdRKy5CZg3XPYQ27HD22VT6e/fbLYD
	A4BIrqzqhc1eOePBowI0TaiHpPjl5MsXkNuduiNlGmoFVbyfUU31XaR8SzNRMDrmiAnSUl9d5Yq
	KrmUivD26jqCsLUVEeptUOMbMihzIz/1OLdM4HcfS063VgkVL
X-Google-Smtp-Source: AGHT+IFcUGbwaAZp1CkTY6kznH8RQmSEbhOLoIVNjh5VjkOzDDhWwKF16qfXMc4pKE4gvfBVLFC8yUUrzfPVWPRZADQ=
X-Received: by 2002:a0d:f104:0:b0:647:7782:421a with SMTP id
 00721157ae682-6650085aad3mr17456207b3.45.1721221088107; Wed, 17 Jul 2024
 05:58:08 -0700 (PDT)
MIME-Version: 1.0
References: <17D39C0F507EB7F4.7888@lists.openembedded.org> <1d0210ba-b44c-4e08-912d-b325f91a2665@windriver.com>
In-Reply-To: <1d0210ba-b44c-4e08-912d-b325f91a2665@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 17 Jul 2024 05:57:57 -0700
Message-ID: <CAOSpxdYS306cTdujh0Bt88kE_E-gVBEbRusd6MfL7YpcSNrSig@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gettext: fix a parallel build issue
To: Changqing Li <changqing.li@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 12:58:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202163

On Tue, Jul 16, 2024 at 7:55=E2=80=AFPM Changqing Li <changqing.li@windrive=
r.com> wrote:
>
> Hi, Steve
>
> Could you help to cherry-pick this patch to scarthgap? Thanks

Yes, will do.

Steve

>
> Regards
>
> Changqing
>
> On 5/28/24 17:11, Changqing Li wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> Occasionally, gettext will build failed with error:
> In file included from ../../../gettext-0.22.5/gettext-runtime/intl/gettex=
tP.h:71,
>                  from ../../../gettext-0.22.5/gettext-runtime/intl/log.c:=
24:
> ./libgnuintl.h:98:1: error: unterminated comment
>    98 | /* The user can define _INTL_RE
>       | ^
> ./libgnuintl.h:17: error: unterminated #ifndef
>    17 | #ifndef _LIBINTL_H
>
> In file included from ../../../gettext-0.22.5/gettext-runtime/intl/gettex=
tP.h:71,
>                  from ../../../gettext-0.22.5/gettext-runtime/intl/langpr=
efs.c:25:
> ./libgnuintl.h:98:1: error: unterminated comment
>    98 | /* The user can define _INTL_RE
>       | ^
> ./libgnuintl.h:17: error: unterminated #ifndef
>    17 | #ifndef _LIBINTL_H
>
> It is a parallel build issue caused by missing dependencies, backport
> patch to fix it.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  ...1-intl-Fix-build-failure-with-make-j.patch | 35 +++++++++++++++++++
>  meta/recipes-core/gettext/gettext_0.22.5.bb   |  1 +
>  2 files changed, 36 insertions(+)
>  create mode 100644 meta/recipes-core/gettext/gettext/0001-intl-Fix-build=
-failure-with-make-j.patch
>
> diff --git a/meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failur=
e-with-make-j.patch b/meta/recipes-core/gettext/gettext/0001-intl-Fix-build=
-failure-with-make-j.patch
> new file mode 100644
> index 0000000000..144259dd3f
> --- /dev/null
> +++ b/meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failure-with-=
make-j.patch
> @@ -0,0 +1,35 @@
> +From 97a6a63ad61949663283f5fad68c9d5fb9be1f15 Mon Sep 17 00:00:00 2001
> +From: Bruno Haible <bruno@clisp.org>
> +Date: Tue, 12 Sep 2023 11:33:41 +0200
> +Subject: [PATCH] intl: Fix build failure with "make -j".
> +
> +Reported by Christian Weisgerber <naddy@mips.inka.de> at
> +<https://lists.gnu.org/archive/html/bug-gettext/2023-09/msg00005.html>.
> +
> +* gettext-runtime/intl/Makefile.am (langprefs.lo, log.lo): Depend on get=
textP.h
> +and its subordinate includes.
> +
> +Upstream-Status: Backport [https://git.savannah.gnu.org/gitweb/?p=3Dgett=
ext.git;a=3Dcommit;h=3D97a6a63ad61949663283f5fad68c9d5fb9be1f15]
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + gettext-runtime/intl/Makefile.am | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/gettext-runtime/intl/Makefile.am b/gettext-runtime/intl/Mak=
efile.am
> +index da7abb758..9e56978bc 100644
> +--- a/gettext-runtime/intl/Makefile.am
> ++++ b/gettext-runtime/intl/Makefile.am
> +@@ -387,8 +387,8 @@ dngettext.lo:        ../config.h $(srcdir)/gettextP.=
h libgnuintl.h $(srcdir)/gmo
> + ngettext.lo:         ../config.h $(srcdir)/gettextP.h libgnuintl.h $(sr=
cdir)/gmo.h $(srcdir)/loadinfo.h
> + plural.lo:           ../config.h $(srcdir)/plural-exp.h $(PLURAL_DEPS)
> + plural-exp.lo:       ../config.h $(srcdir)/plural-exp.h
> +-langprefs.lo:        ../config.h
> +-log.lo:              ../config.h
> ++langprefs.lo:        ../config.h $(srcdir)/gettextP.h libgnuintl.h $(sr=
cdir)/gmo.h $(srcdir)/loadinfo.h
> ++log.lo:              ../config.h $(srcdir)/gettextP.h libgnuintl.h $(sr=
cdir)/gmo.h $(srcdir)/loadinfo.h
> + printf.lo:           ../config.h
> + setlocale.lo:        ../config.h $(srcdir)/gettextP.h libgnuintl.h $(sr=
cdir)/gmo.h $(srcdir)/loadinfo.h
> + version.lo:          ../config.h libgnuintl.h
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-core/gettext/gettext_0.22.5.bb b/meta/recipes-c=
ore/gettext/gettext_0.22.5.bb
> index 1a66d37916..7eeb1a86fd 100644
> --- a/meta/recipes-core/gettext/gettext_0.22.5.bb
> +++ b/meta/recipes-core/gettext/gettext_0.22.5.bb
> @@ -28,6 +28,7 @@ SRC_URI +=3D " \
>             file://serial-tests-config.patch \
>             file://0001-tests-autopoint-3-unset-MAKEFLAGS.patch \
>             file://0001-init-env.in-do-not-add-C-CXX-parameters.patch \
> +           file://0001-intl-Fix-build-failure-with-make-j.patch \
>             "
>
>  inherit autotools texinfo pkgconfig ptest
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199962): https://lists.openembedded.org/g/openembedde=
d-core/message/199962
> Mute This Topic: https://lists.openembedded.org/mt/106345410/3616873
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ch=
angqing.li@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

