Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id DD9A46D001
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 17:47:08 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id ec20so6462949lab.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 09:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=VET4B1S8w9gAz2Ucnw50L7CqMgSz+CgMuwGB1fbC1Ok=;
	b=so51NGyfO8eAQZ4SV2+kkG6clDcx2UxM+ETJPGyKW/ezAuoorQsH97oRE5VuTHFKiM
	bBdwci80cXLBJfkl5RC9RrHHQlNRGZmADzcbH4eR8ufJHhHN0qilFT9LEq4ujxPkXlvB
	qyb/+v70Vi1GVHiymI6Dp728M5/E0Uknc1wULUnKJafWtBLtgkN26DAuHCo/ktV0X6Me
	2Nvmk8VjesQDBTfQHpUswTlcaepnbpGoiuyaI+qYGjlJzSJbCLnWY9rAmSXGlx8m+voV
	4l4bH2ZohA8Sk4U9w31+gM3M8lwuF0cLRn0pkCZ+mZEZErESzpA1IWVoWNfcla/+4a6u
	nIWg==
MIME-Version: 1.0
X-Received: by 10.112.168.170 with SMTP id zx10mr18576058lbb.0.1384883230195; 
	Tue, 19 Nov 2013 09:47:10 -0800 (PST)
Received: by 10.112.14.200 with HTTP; Tue, 19 Nov 2013 09:47:10 -0800 (PST)
In-Reply-To: <1384882665-26840-1-git-send-email-mac@mcrowe.com>
References: <20131119173725.GA13018@mcrowe.com>
	<1384882665-26840-1-git-send-email-mac@mcrowe.com>
Date: Tue, 19 Nov 2013 12:47:10 -0500
Message-ID: <CADkTA4OngLFW4A0AL+QCWd=Wwo8kdbK9FgcEGHvpxeZVEKmgaQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] kernel.bbclass: Ensure compiler is available for do_populate_sysroot_setscene
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
X-List-Received-Date: Tue, 19 Nov 2013 17:47:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 19, 2013 at 12:37 PM, Mike Crowe <mac@mcrowe.com> wrote:
> kernelscripts_sstate_postinst uses the compiler (and therefore binutils) to
> generate the kernel scripts so it must declare a dependency on them. The
> ones in DEPENDS don't apply to do_populate_sysroot_setscene.
>
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> ---
>  meta/classes/kernel.bbclass |    2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 6959aa1..2fad6e0 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -312,6 +312,8 @@ kernelscripts_sstate_postinst () {
>         fi
>  }
>
> +do_populate_sysroot_setscene[depends] += "virtual/${TARGET_PREFIX}gcc:do_populate_sysroot virtual/${TARGET_PREFIX}binutils:do_populate_sysroot"

This makes sense, we have a bug about this that I was never able to
reproduce:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=5390

Bruce

> +
>  python sysroot_stage_all () {
>      oe.path.copyhardlinktree(d.expand("${D}${KERNEL_SRC_PATH}"), d.expand("${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}"))
>  }
> --
> 1.7.10.4
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

