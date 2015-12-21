Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id A0EF56FF72
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 20:38:03 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id p187so85070380wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 12:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=E9bsvNKP9+mVBEZlmo0YqDbEh42FgyvZntff9nqW4O4=;
	b=Jfz46tnotz6rG5ZmCHk4qjDyjtsvHvgoAJmB66i0Z49BIm8W1U3mRdV+Wz7K4XJO2E
	mtuJl+E3f6ReXLoLyCtaZakducWoLupOT9n02Y01Cv99qiqZ6ea9e6uxODzQXXLDjgvt
	f6AyzjEdKigsVrzVCCoqqDYiFqD6wi4TVG+Tp7YPJPlW7AMXdngAW4pnOpN2uGfjNafV
	abrId1BEZQSdTLgOeG+AYw8fJwKOgDR6ayrNJtGdyYatMBkDifpbBCUrCP3RkJtQuhiy
	S2LyEa8Ixhmb7xnBqtDBsbkItaTIZU9MmJeN6VcaAQbRuQmAeKa/rtX+YwCIFHYqpnfl
	FcJQ==
MIME-Version: 1.0
X-Received: by 10.194.24.226 with SMTP id x2mr23011305wjf.43.1450730283395;
	Mon, 21 Dec 2015 12:38:03 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Mon, 21 Dec 2015 12:38:03 -0800 (PST)
In-Reply-To: <ab5e796a793f112dbfb186d31d9006c6ed78d03b.1450568936.git.raj.khem@gmail.com>
References: <cover.1450568936.git.raj.khem@gmail.com>
	<81170e1970685f34735007c496ce175279d46304.1450568936.git.raj.khem@gmail.com>
	<ab5e796a793f112dbfb186d31d9006c6ed78d03b.1450568936.git.raj.khem@gmail.com>
Date: Mon, 21 Dec 2015 12:38:03 -0800
Message-ID: <CAJ86T=UwarUoEkGNkDG8Y9m6_6NOOW+YhDTN53AkgqJBCsNw3g@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 09/17] valgrind: Define __UCLIBC__ for uclibc based systems
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
X-List-Received-Date: Mon, 21 Dec 2015 20:38:04 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Dec 19, 2015 at 3:52 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Helps configure valgrind for uclibc targets otherwise it tries to assume
> funcitons that are implemented in glibc like __free_res

This is going to conflict with the valgrind version update patches
already posted to the list.

Ross, any thoughts on which set of patches might get merged first, so
that either Khem or I can rebase accordingly? Or perhaps I could just
pull this one change into the valgrind update series and Khem could
drop it?

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/valgrind/valgrind_3.10.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
> index c38a07b..c1c11d4 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
> @@ -44,6 +44,8 @@ EXTRA_OECONF_armv7a = "--enable-tls -host=armv7-none-linux-gnueabi --without-mpi
>  EXTRA_OECONF += "${@['--enable-only32bit','--enable-only64bit'][d.getVar('SITEINFO_BITS', True) != '32']}"
>  EXTRA_OEMAKE = "-w"
>
> +CFLAGS_append_libc-uclibc = " -D__UCLIBC__ "
> +
>  do_install_append () {
>      install -m 644 ${B}/default.supp ${D}/${libdir}/valgrind/
>  }
> --
> 2.6.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

