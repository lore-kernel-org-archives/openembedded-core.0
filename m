Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web09.14777.1630315837362180937
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 02:30:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rjd7ZWu1;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: andrey.z@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id m28so29912263lfj.6
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Aug 2021 02:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=a3H0FwnMu/puqa/BPmYi0cNKjHHxrwsN08jaLM9vbgo=;
        b=rjd7ZWu1VyOKZGdlZYswLFnBPPQh8bkpin7ik9wBmzLagA4TVwKsJOgx5XoulQECQP
         WgNmNWMT+BzU5lZQ9T9MhZaw1OjqtJwq5oan9GDcrvjfJ1ya/aei4X+AEfNaS5eJmijX
         6PtfNf6Zz7jxaOsvvSQr3y94YWI2xWDbSbNt5tAMo1tp7+BAxseR4DHs+LzXFtdjdqT+
         DNfXvwwDiURNFTOWS035EKcFrE+buesds2e6TGBBFKXuk0PIlSx9ZhcYg9cID5DjWVqh
         6wk64g/v7AT+RXf9OtbZVQ8pDUoIsHqGi3EdiE+EXHBsaD/LtlnncJBYIQUzbVndqg9K
         3HrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=a3H0FwnMu/puqa/BPmYi0cNKjHHxrwsN08jaLM9vbgo=;
        b=HDG7+0F5Xo5kqCFleDyeIarDRVxCRWu0GMlfb2ljT6xN41XDTvb+Ie0iizvRA7mfkC
         jfIp/tMrs/n6hriJNDK8JYAtCkUZVwEToWb0H0KIRCJfkdmx+UAFQtTQQPrfKNWtI93g
         hmplSIziget+lbc6Tcw3/04da04zWLQx7rrxPZSKYRP6LxLb2q4C1vyrF0K2/LDIsgJS
         zIzy7JpVIgv6EtGJ0E6Y7dkM2zSpCIWlN+DNbbYdoIlAj/Zymy6AcfcLzwdkT1IwzYvx
         741iUCies6TmiH8ye9Xzhe7hlAiANlo6hdVbwfntMW+xX0SpzOCyOOGqLNeePJFVCK53
         OqEg==
X-Gm-Message-State: AOAM532BJFQoICQBOZQbf5YV5KSW4YstkEccbdWML705F0D4ptS6dO8O
	wTRn+H7boUOHWbjVD6hhv4D1gDR1S1keJiTnUaE=
X-Google-Smtp-Source: ABdhPJzALPMTU8+8KhfiGg/vbEZdqcxkDsXlq5iTEJijA7YvHxqAcaF/uACLI1t8UKY+PBnDoopkxyftrha537EcvYY=
X-Received: by 2002:a05:6512:31c1:: with SMTP id j1mr14818846lfe.442.1630315835389;
 Mon, 30 Aug 2021 02:30:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210823145450.103319-1-zboszor@pr.hu> <20210827073712.2766816-1-zboszor@pr.hu>
 <20210827073712.2766816-4-zboszor@pr.hu>
In-Reply-To: <20210827073712.2766816-4-zboszor@pr.hu>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Mon, 30 Aug 2021 11:30:02 +0200
Message-ID: <CAHtQpK4iV0cFG-60oW5cY9sDES6BBj+zfSDZUHATXem3LBnKSg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 3/4] kernel.bbclass: Use full versions for inter-package dependencies
To: zboszor@pr.hu
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, zboszor@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Zoltan,

On Fri, Aug 27, 2021 at 9:37 AM Zoltan Boszormenyi via
lists.openembedded.org <zboszor=3Dpr.hu@lists.openembedded.org> wrote:
>
> From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
>
> If the kernel configuration enables module signing but no key
> is provided, then the kernel generates one during the kernel build.
>
> The current runtime-dependency references (with only package names
> without full versions) allow mixed package installations from different
> rebuilds of the same kernel version.
>
> This creates an issue because then the modules either don't work
> or taint the kernel.
>
> Tighten RDEPENDS with the full package version, i.e. use (=3D ${EXTENDPKG=
V})
> markers for inter-package dependencies.
>
> The kernel will pull in the kernel-modules subpackage of the same
> exact version automatically if KERNEL_SPLIT_MODULES=3D"0" is set.
> Otherwise the situation is the same as with the old default with
> one subpackage per kernel module where they have to be upgraded
> manually.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  meta/classes/kernel.bbclass | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>

I'm seeing errors during the do_rootfs() with this patch applied,
there are few messages like this:

 * Solver encountered 1 problem(s):
 * Problem 1/1:
 *   - package kernel-module-libchacha-5.13.13+g91381833a4e2-5.13.13+git0+9=
1381833a4-r0.imx8mp_lpddr4_evk
requires kernel-5.13.13+g91381833a4e2, but none of the providers can
be installed
 *   - package kernel-modules-5.13.13+git0+91381833a4-r0.imx8mp_lpddr4_evk
requires kernel-module-libchacha-5.13.13+g91381833a4e2, but none of
the providers can be installed
 *   - package kernel-5.13.13+g91381833a4e2-5.13.13+git0+91381833a4-r0.imx8=
mp_lpddr4_evk
requires kernel-image-5.13.13+g91381833a4e2 =3D
5.13.13+git0+91381833a4-r0, but none of the providers can be installed
 *   - conflicting requests
 *   - nothing provides kernel-image-image-5.13.13+g91381833a4e2 =3D
5.13.13+gitAUTOINC+91381833a4-r0 needed by
kernel-image-5.13.13+g91381833a4e2-5.13.13+git0+91381833a4-r0.imx8mp_lpddr4=
_evk
 *
 * Solution 1:
 *   - do not ask to install a package providing kernel-modules

Reverting this commit does solve it, but I would like to understand
more on what should be done in order to use this new mechanism you've
introduced. Do you have any suggestion on what should be adapted in
the BSP layer to have those RDEPENDS properly resolved?

Package manager is set for me to IPK.

Setting KERNEL_SPLIT_MODULES=3D"1" does not solve the issue.

--=20
Regards,
Andrey.
