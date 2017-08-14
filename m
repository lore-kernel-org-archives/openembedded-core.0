Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f42.google.com (mail-pg0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id E3A867846F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 22:02:31 +0000 (UTC)
Received: by mail-pg0-f42.google.com with SMTP id u5so55282117pgn.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 15:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mS0bX1jILK2y15YR5FB+WtlsuuoId7NoozXlcCHrprg=;
	b=HveMiIvBk67ZPcxb3k65UESDo9Lo2Exd13nQCqOGjvMQtJQQt6s4tI6CTdvOJoTO1/
	fRldgaUqDq4qNwZZc/HZ0ZDKK6Iw3ttJyR1V6868dNcHQ7hO7+dG/5ciAsPt1iyAkH0D
	rSR/ZOVXx0JW5G6Q5ehe8POCe5rlbcJuZgV5L3tWGFP2i3habzj7VRny+5BT3fPQ+yce
	SlK4pTNXXhFdo+n5F6DVjr1B+wbtFrtKuVcwCbzMLPQyUdOl0EMKuhcKDJtHgtAlLY8i
	W3ofwsOxl9x8il+tyPv0UwGCWquSKduHVgoDoMQZaq4nu2ZprUrjS3HAAWGuXXhzgAnk
	nrFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mS0bX1jILK2y15YR5FB+WtlsuuoId7NoozXlcCHrprg=;
	b=KLdGRUjZcapXYrIoC1E36Tlhznc/O393PpWbXGguhQh5khI/m7DJTwCRvn1xCUkRUf
	Yt/G9qmmQPKLUosoRbKfYCqOMpv9pJotoDCAgkDxBGzO2irNCB36uPj+XnuSTTi2HbiT
	jRlNngoQ6Pas7i6wQxBmNKR2Xb4thH7c5Emqqer1il4yVOMwEKUkLBWQzQHoIDSzshaZ
	4SoGqFMOVnGKeKH5s/4zOjJEAyREV6QDJsSuAr14Qh5S+km1UhwQVNDYgURnnJCk4Fdk
	umw09QHmdQRp+UpulpYc6+lt+Vd4xnYUC4d1aNAVqNit2y/mi0bL9H4Bp/39sW+7Rp3Z
	TNfA==
X-Gm-Message-State: AHYfb5hpbmc4O1306Xuy6S+44Aklqj/NtD31TbRtfgTcZPzt/UAi/04l
	pq74omC5G0Basal8ekn9T8ngBjzC3A==
X-Received: by 10.99.3.197 with SMTP id 188mr26367840pgd.288.1502748153144;
	Mon, 14 Aug 2017 15:02:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Mon, 14 Aug 2017 15:02:02 -0700 (PDT)
In-Reply-To: <1502715748-6769-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1502715748-6769-1-git-send-email-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Aug 2017 15:02:02 -0700
Message-ID: <CAMKF1sp+FoKcNDV_UCo1_R7SQkXW2ne424mm6KsJFKYL5oFYkA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3-native: Avoid use of getentropy
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
X-List-Received-Date: Mon, 14 Aug 2017 22:02:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 14, 2017 at 6:02 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> getentropy() is only available in glibc 2.25+ and uninative may relocate binaries
> onto systems that don't have this function. For now, force the code to the older
> codepath until we can come up with a better solution for this kind of issue.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/python/python3-native_3.5.3.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/python/python3-native_3.5.3.bb b/meta/recipes-devtools/python/python3-native_3.5.3.bb
> index 3467d29..66371aa 100644
> --- a/meta/recipes-devtools/python/python3-native_3.5.3.bb
> +++ b/meta/recipes-devtools/python/python3-native_3.5.3.bb
> @@ -44,7 +44,8 @@ inherit native
>
>  require python-native-${PYTHON_MAJMIN}-manifest.inc
>
> -EXTRA_OECONF_append = " --bindir=${bindir}/${PN} --without-ensurepip"
> +# uninative may be used on pre glibc 2.25 systems which don't have getentropy
> +EXTRA_OECONF_append = " --bindir=${bindir}/${PN} --without-ensurepip ac_cv_func_getentropy=no"

getentropy is quite non standard function, I think this is better disabled for
portability.

>
>  EXTRA_OEMAKE = '\
>    LIBC="" \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

