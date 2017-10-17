Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 96C6F78311
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 18:56:54 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b189so5702503wmd.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 11:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nA3PuX5Hnqk427AJmeBfzJswkSkgjTte9tfId6mqX5w=;
	b=EE5gXiWzHMWXLuiVn1tnVu5gOeKS5UO1HovM4OXFUobRoTqn9b4xR0kfSGB1qFgO0w
	IjgD9JgEfCfUYt0OH2t+gs59pvgBikZA//DTyNVD8ib+6Ci95wT1HJlM/a9j5Pswgy/h
	Dc6EwrxntPUp3FDDKFKpOqj6ebu0n2/uDFSoKPem/AUrLyNAL6Z5hlj2dXHU7BwKI6Ht
	BSSE6IasLrrw/hEB0plHd5G439kpkeuprOhlwlqTSZGxqHRyXOfxuqHg8Nud23tCMlQI
	EDBFcxpK5I+8EqTUlt9CJQnzrCeW4KL+D5oNrjk4Fp+lCA5+UOco9i8ZDEyDqUcGT9q8
	e04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nA3PuX5Hnqk427AJmeBfzJswkSkgjTte9tfId6mqX5w=;
	b=Cy0+Jbyi5DlsXbAcwBhzubkdxqNyfyqL/YU+pGazd1WKaPPk7TsJjfXjKbjNrTDMsT
	pQ5ajQ8t3JOriNgWuX2M6420IuzEc0U7HVAfCiohPWjXkOvPykf4mkADzIXf2PmkOv+3
	rtz6cz5CVs1uC0+natSPGvMed1EqqvQTfo68DijCfQO3Ii7izkDHuL9y1TdKDUVud9tg
	gslgDvXiQaei8qtV5R40/eUbUZrHnvRyddz7mPGVJ/bKk7SsKowoGQy9HUlz7sB/X3Hl
	lf34x5C0seOL8P2KbXBxxMDFG+sxj90wEn2HvWTJ2D4o0+xBJETPcfzpmjrs5KGvMRRt
	HAlg==
X-Gm-Message-State: AMCzsaXRmIIfJ2hgJAYvDzKQPTTEvgyHditeMjUAPdUixLPBUD8mK6jR
	SwOnohZDpIOCWMirSY1kU95XsfBZVbq02vp6/BU=
X-Google-Smtp-Source: ABhQp+QXx7M6krJoCR6nCgiSx4D45wxLN8G6o8o5LQdFhaeHUjC9MyMoST29sRIC6jZWuhrvhmq8X+bcny3Afdtu73c=
X-Received: by 10.28.54.89 with SMTP id d86mr4246750wma.101.1508266615117;
	Tue, 17 Oct 2017 11:56:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.166.19 with HTTP; Tue, 17 Oct 2017 11:56:54 -0700 (PDT)
In-Reply-To: <1470410231-21681-3-git-send-email-ross.burton@intel.com>
References: <1470410231-21681-1-git-send-email-ross.burton@intel.com>
	<1470410231-21681-3-git-send-email-ross.burton@intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 17 Oct 2017 11:56:54 -0700
Message-ID: <CAJ86T=W1=WObx6LwbtSR5pJYXn-Y=D+XC=jcrd-=y-_Nf6EuGA@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] autotools: move aclocal-copy to WORKDIR
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Oct 2017 18:56:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 5, 2016 at 8:17 AM, Ross Burton <ross.burton@intel.com> wrote:
> To save time move the temporary copy of the autoconf macros, aclocal-copy, from
> ${B} to ${WORKDIR}.  This ensures that it can't conflict with anything in ${S}
> and means the pruning code doesn't need to know about it.

Apparently this breaks recipes which copy all sources into ${WORKDIR}
and then set ${S} to ${WORKDIR}.

Obviously that's the recipe's problem, but wondering if we should add
a check in the autotools class to catch and flag that particular case?

Sorry to bring this up so late but I just recently came across a user
who's recipe broke when they updated from daisy to morty and their
proposed "fix" was to hack autotools.bbclass to re-instate the "grep
-v aclocal-copy" removed below...

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/autotools.bbclass | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
> index 1c884b4..22359d3 100644
> --- a/meta/classes/autotools.bbclass
> +++ b/meta/classes/autotools.bbclass
> @@ -134,7 +134,7 @@ EXTRACONFFUNCS ??= ""
>  do_configure[prefuncs] += "autotools_preconfigure autotools_copy_aclocals ${EXTRACONFFUNCS}"
>  do_configure[postfuncs] += "autotools_postconfigure"
>
> -ACLOCALDIR = "${B}/aclocal-copy"
> +ACLOCALDIR = "${WORKDIR}/aclocal-copy"
>
>  python autotools_copy_aclocals () {
>      s = d.getVar("AUTOTOOLS_SCRIPT_PATH", True)
> @@ -248,7 +248,7 @@ autotools_do_configure() {
>                 if [ x"${acpaths}" = xdefault ]; then
>                         acpaths=
>                         for i in `find ${AUTOTOOLS_SCRIPT_PATH} -ignore_readdir_race -maxdepth 2 -name \*.m4|grep -v 'aclocal.m4'| \
> -                               grep -v 'acinclude.m4' | grep -v 'aclocal-copy' | sed -e 's,\(.*/\).*$,\1,'|sort -u`; do
> +                               grep -v 'acinclude.m4' | sed -e 's,\(.*/\).*$,\1,'|sort -u`; do
>                                 acpaths="$acpaths -I $i"
>                         done
>                 else
> @@ -288,9 +288,7 @@ autotools_do_configure() {
>                                 fi
>                         fi
>                         for i in gettext.m4 iconv.m4 lib-ld.m4 lib-link.m4 lib-prefix.m4 nls.m4 po.m4 progtest.m4; do
> -                               for j in `find ${S} -ignore_readdir_race -name $i | grep -v aclocal-copy`; do
> -                                       rm $j
> -                               done
> +                               find ${S} -ignore_readdir_race -name $i -delete
>                         done
>                 fi
>                 mkdir -p m4
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

