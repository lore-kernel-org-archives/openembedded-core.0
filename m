Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 40E9B6116C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 20:29:43 +0000 (UTC)
Received: by mail-ie0-f180.google.com with SMTP id at20so2824707iec.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 13:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=CBlteaQd6C/Q+9SHUYW+cUFBhVqEAV7NsIgQyPRJ7q8=;
	b=P4KsXD9Y8WmH/KmGedNUNXWQ41tk7pRi8JiF63I6GQMeaqQbW/lQulqjiRwXcuLd69
	nahtzyROH1ytb2rxGuhCSXKI4frBsbOkbbgAnTA+Lfr6PdTfyxPedbJwU/rvfcZlgDEi
	DVh8dm07aVuHMhvqvfA6310KUb3FIy4Ep4KZ+uQxVZI9xsSikUTiVT5ld9WvjxWQvBeW
	QkCzkvwZkHMgvCDDWm6wsfKFUXzY9u03VCXPXN8e43JpCHZvZBIZDj/2SgDSIYTHtkNh
	SOQRV3BRJEZSlJt1nrjJOzbfzqmVq/rGGCoDfij+wjBBmZmr8Ds7OipHhW0HkApIlDoa
	arBQ==
X-Received: by 10.42.90.74 with SMTP id j10mr15466367icm.29.1406233784844;
	Thu, 24 Jul 2014 13:29:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Thu, 24 Jul 2014 13:29:14 -0700 (PDT)
In-Reply-To: <1406201093-1546-1-git-send-email-mac@mcrowe.com>
References: <1406201093-1546-1-git-send-email-mac@mcrowe.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Jul 2014 13:29:14 -0700
Message-ID: <CAMKF1sq9FROjuThgDvQpDE33AG=qReMZ_oXXEha4yJHALYZK-g@mail.gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] allarch: Generate same package for MIPS and non-MIPS targets
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
X-List-Received-Date: Thu, 24 Jul 2014 20:29:50 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 24, 2014 at 4:24 AM, Mike Crowe <mac@mcrowe.com> wrote:
> LINKER_HASH_STYLE differs between MIPS and non-MIPS targets. This means
> that LDFLAGS differs too. LDFLAGS is exported so it influences all task
> hashes. Unfortunately this means that packages with architecture "all"
> differ depending on whether they are built for a MIPS or non-MIPS target.
> This causes a lot of unnecessary churn in the ipk/all directory when
> switching build targets.
>
> The simplest way to fix this is to ensure that LDFLAGS stays the same for
> architecture "all" packages by clearing it. It shouldn't being used by such
> packages anyway.
>
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> ---
>  meta/classes/allarch.bbclass | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
> index d41dd4b..c953e7c 100644
> --- a/meta/classes/allarch.bbclass
> +++ b/meta/classes/allarch.bbclass
> @@ -28,6 +28,11 @@ python () {
>          d.setVar("SDK_ARCH", "none")
>          d.setVar("SDK_CC_ARCH", "none")
>
> +        # Avoid this being unnecessarily different due to nuances of
> +        # the target machine that aren't important for "all" arch
> +        # packages.
> +        d.setVar("LDFLAGS", "")
> +


Looks good.

>          # No need to do shared library processing or debug symbol handling
>          d.setVar("EXCLUDE_FROM_SHLIBS", "1")
>          d.setVar("INHIBIT_PACKAGE_DEBUG_SPLIT", "1")
> --
> 2.0.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

