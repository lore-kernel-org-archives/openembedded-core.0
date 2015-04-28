Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0E43073D66
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 14:36:23 +0000 (UTC)
Received: by iedfl3 with SMTP id fl3so21938041ied.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 07:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=PRUxuyCsJcDoJFAILzWpTO1W4u7F6ULMnCompRbjcCc=;
	b=dz5BpIGqvxQi0doukLO4R4517/vSPeha8kh98exv8C+/XOeSf5nrua9x5r3Osa5kIu
	PibgDTZBrwOfhB6WuhYmpvaGC5O6BJ56RqCI7Dg1oSRfawr4IPXKLzEpl82IS0tT+1jT
	cL19gD7CRkL+n4uY7imgbf1nEt6/+or5cHDL2g+KYEMc/a2gSeCUUTeDt6wxbn1Xyghi
	rqjx9/+h88eBmwmtsIWYhNH9HB3vAyL5Sio7lR7fobx69o/J0Qna9QBglxuR9Y6zvssh
	gnSEC/Jr7riQ141uP4nRfXjBC+SRb4m5J/QZenoh1Q6n95SZNFWK/0lFabS9EO8TpoqO
	PHqw==
X-Received: by 10.42.164.7 with SMTP id e7mr18238846icy.70.1430231784883; Tue,
	28 Apr 2015 07:36:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.230.178 with HTTP; Tue, 28 Apr 2015 07:35:54 -0700 (PDT)
In-Reply-To: <1430218184.13022.162.camel@linuxfoundation.org>
References: <1430218184.13022.162.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Apr 2015 07:35:54 -0700
Message-ID: <CAMKF1sq9D23fdbqT1+dx=cybtT2bWRVxt-eqEeE1bDJpfDLZPQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-shared-source: Add PV to PN
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
X-List-Received-Date: Tue, 28 Apr 2015 14:36:25 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 28, 2015 at 3:49 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> This means you can have one gcc version for some gcc recipes
> (e.g. crosssdk/nativesdk) and another gcc version for target code which
> is useful for more obscure architecture toolchains.
>

looks good. I had similar issue with angstrom recently with linaro gcc.

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/recipes-devtools/gcc/gcc-shared-source.inc b/meta/recipes-devtools/gcc/gcc-shared-source.inc
> index cb5d907..9acffb1 100644
> --- a/meta/recipes-devtools/gcc/gcc-shared-source.inc
> +++ b/meta/recipes-devtools/gcc/gcc-shared-source.inc
> @@ -5,5 +5,5 @@ do_fetch[noexec] = "1"
>  deltask do_unpack
>  deltask do_patch
>
> -do_configure[depends] += "gcc-source:do_preconfigure"
> -do_populate_lic[depends] += "gcc-source:do_unpack"
> +do_configure[depends] += "gcc-source-${PV}:do_preconfigure"
> +do_populate_lic[depends] += "gcc-source-${PV}:do_unpack"
> diff --git a/meta/recipes-devtools/gcc/gcc-source.inc b/meta/recipes-devtools/gcc/gcc-source.inc
> index 10e9285..a4b27c8 100644
> --- a/meta/recipes-devtools/gcc/gcc-source.inc
> +++ b/meta/recipes-devtools/gcc/gcc-source.inc
> @@ -11,6 +11,7 @@ deltask do_package_qa
>  deltask do_packagedata
>  deltask do_rm_work
>
> +PN = "gcc-source-${PV}"
>  WORKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}"
>  SSTATE_SWSPEC = "sstate:gcc::${PV}:${PR}::${SSTATE_VERSION}:"
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

