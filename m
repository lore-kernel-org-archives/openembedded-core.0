Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6BE8473195
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 06:12:38 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id y89so134843729qge.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 22:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NVwGGTZAiacGnWfmRvsRf0Fo/zE7mRdLcqZznOHRKK4=;
	b=oAP9q4i1368Mm7qFHKXQ8dlKDKnKdUYpdaRHY+F8hzNh4beha7ENbEQAB9MCC4vUuT
	qc2THPdUdvLxiYHZTiHlh472PR6LMbOrNuMKn4NDlxxbqmACwrdrnsxC4BV73ZuMqXYK
	/hTlR4eh3EGoJs4D/TtBAKJdNSQLSdy/zi63bVgbtx2oEQUXPgDXazbSpbWo9j9tPQls
	BUuXZuLLruQIVNfByIGimbNh51mkFsLANGjTFm02seb2+/lW/ysZ7CJF00pJJIRrVHM9
	g7s7Aafdd0edoMoGykx2niBwyfO1nT6XWuMq4B0435gYMi3GK9IuSPPukSnuN+rg+7T/
	UMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NVwGGTZAiacGnWfmRvsRf0Fo/zE7mRdLcqZznOHRKK4=;
	b=dfCk2iBC/JuQztKoh8s85hZCAaqwoPXGEzQ/kkkyHcLLL5EMNYdOM/8XyF8D7YnQd8
	zsVUDhWqDcY9zir4eRh87wb92xiSWYbWYlyADfmw7bvjKg6Xzauu5T3gQ+DI5U4VyLWf
	SbVGC+zsG+EN6E4NpCocnNEyGHcPOplEAY50el+ehWx/vCdIpY0WI1efnt1vXWCnVDZ9
	NoUOo6KwIr+nkhF7ZdI8DU/zr3/iGR+urNTJFuzxhcJJHYkrr9doT+s8kwdsbOJh4qVT
	05x5YyH1KupgfiqmCV+gHdheuJyIyk50h4yNBfopfdpFMAtrIAplyVZ8g2xcqRXJlpBr
	eYFQ==
X-Gm-Message-State: AD7BkJJ4oBMcB6p+dF3kgAFrkTvTTIPZB7nqA/OcNLByj8ufM+VN74OgAQS8ptl79oo9X/C7VF/onAy5FEH1GQ==
X-Received: by 10.140.108.181 with SMTP id j50mr23943190qgf.104.1456812759328; 
	Mon, 29 Feb 2016 22:12:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Mon, 29 Feb 2016 22:12:09 -0800 (PST)
In-Reply-To: <1456798957-22223-1-git-send-email-li.zhou@windriver.com>
References: <1456798957-22223-1-git-send-email-li.zhou@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Feb 2016 22:12:09 -0800
Message-ID: <CAMKF1so9u_czYvBO_mhk6tf8-SCw2jSh4dd7rMvFJJF6VqT1BA@mail.gmail.com>
To: Li Zhou <li.zhou@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: add TUNE_CCARGS for CFLAGS_FOR_TARGET of gcc-cross-canadian
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
X-List-Received-Date: Tue, 01 Mar 2016 06:12:40 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 29, 2016 at 6:22 PM, Li Zhou <li.zhou@windriver.com> wrote:
> Add TUNE_CCARGS for CFLAGS_FOR_TARGET of gcc-cross-canadian to solve
> below errors when compiling gcc-cross-canadian-powerpc64 within a debug
> build:
>
> configure:3655: checking for suffix of object files
> configure:3677:  powerpc64-wrs-linux-gcc --sysroot=......bitbake_build/
> tmp/sysroots/fsl-t2xxx -isystem=/usr/include --sysroot=....../
> bitbake_build/tmp/sysroots/fsl-t2xxx   -c -O0 -fno-omit-frame-pointer -g
> -pipe -g -Os  conftest.c >&5
> {standard input}: Assembler messages:
> {standard input}:23: Error: register save offset not a multiple of 8
> {standard input}:24: Error: register save offset not a multiple of 8
>
> Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-cross-canadian.inc |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> index ec1d281..04ae981 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> @@ -51,7 +51,7 @@ do_configure () {
>         export CPPFLAGS_FOR_BUILD="${BUILD_CPPFLAGS}"
>         export CXXFLAGS_FOR_BUILD="${BUILD_CXXFLAGS}"
>         export LDFLAGS_FOR_BUILD="${BUILD_LDFLAGS}"
> -       export CFLAGS_FOR_TARGET="${TARGET_CFLAGS}"
> +       export CFLAGS_FOR_TARGET="${TARGET_CFLAGS} ${TUNE_CCARGS}"

Will this cause canadian builds to become too specific instead of
generic common arch

>         export CPPFLAGS_FOR_TARGET="${TARGET_CPPFLAGS}"
>         export CXXFLAGS_FOR_TARGET="${TARGET_CXXFLAGS}"
>         export LDFLAGS_FOR_TARGET="${TARGET_LDFLAGS}"
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

