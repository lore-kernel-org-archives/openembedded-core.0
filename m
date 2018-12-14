Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5DDC36B79B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 23:37:03 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id p17so8122671qtl.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 15:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xhmAidSY+7cR/hCF91cgCmcH6ZoApy7OkJzbFWyaGrQ=;
	b=bJfNSDABGIPsgOinKl43GJqVPGkdiyafMqBhLIWY8rwcNQTJjI3jkB9QAv0wOb1xIz
	xvtiQQnVJPhS9BLRfp005fuPG8csrIbZ52Xs+W8fXpRwZIDmoeWMbaOi0GHA85rKk2vE
	woOvHHzptgeX/mEySzqPhk5J1bLgfawPVQtVC7Mn3lQmipD/VthtYZl2Atmn1m5rBBvl
	K0bAaeAJBnFhN5vw7GDGIFrZcsyb3x3hHZHBwwb6UaasZvT8tFpyqoRUk56ArFwdDJfY
	RhO6BsC1+Ja5h/rOVmwLhXWf9kNvspsOf9d9Ap5zGpoLiIgAJm62Ba4MItbj1PU01H+r
	DSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xhmAidSY+7cR/hCF91cgCmcH6ZoApy7OkJzbFWyaGrQ=;
	b=lIdJUYfXQuDnVkW8Bhq8CJDmwLx0XiSOAUUuG4AeAQQLZK0Dng0ZYeBMGbtsCNs8GL
	s0m8rl5yZaIrxYo/I1+hCjGW5xlA+NVX6ajuxpjLsKX02L3qSwRvv0WRM4J/lHukTuL1
	JWl2Y/Vg95q8c9nuBY85eKUlormZOQXG8JKIY/TZNMTjf/BI5xG7kolSRD81tlnfoz7O
	coS/G9mK1oP9bBlbb4HVfERhCgj6rq3ZdtFAs/obpkqN1AoLjMdduG5pAvu9QHpRsqty
	A4KdDU94nh83qXEkLrcUk9oTgGSMHeec7gyhlNJEWXzpy4gNKcswQha9vzEpjYd411oV
	2Uaw==
X-Gm-Message-State: AA+aEWZKnLYuernV12ZrgeIejg9hsTb7OohGa/HYCNk1eo7u3tItSj9c
	LxAGznneCCYyN69aMjGrqsqhnWDtYEzGpYOEvCE=
X-Google-Smtp-Source: AFSGD/WvEVmRJY0aIFDhHyEchgz4L+XMdiBIOTXb6EY6AG3oaAwECbELm6Zg0cVE990o2nAwwdNn+vOHdtMjcy0a6gc=
X-Received: by 2002:a0c:d80f:: with SMTP id h15mr4908152qvj.228.1544830623956; 
	Fri, 14 Dec 2018 15:37:03 -0800 (PST)
MIME-Version: 1.0
References: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
	<1544810082-22164-6-git-send-email-serhe.popovych@gmail.com>
In-Reply-To: <1544810082-22164-6-git-send-email-serhe.popovych@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Dec 2018 15:36:37 -0800
Message-ID: <CAMKF1spGeN_PxOKM5XC5CG6dPFSNv1H+OyDv2P9k6SoK6uAt5g@mail.gmail.com>
To: Serhey Popovych <serhe.popovych@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/13] arch-powerpc64.inc: Use elfv2 ABI when building with musl
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
X-List-Received-Date: Fri, 14 Dec 2018 23:37:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 14, 2018 at 9:56 AM Serhey Popovych
<serhe.popovych@gmail.com> wrote:
>
> Historically first PowerPC ABI was big-endian only (elfv1 currently). It
> is standard ABI for both 32-bit ppc and 64-bit ppc64 architectures.
>
> With PowerPC little-endian support new ABI was introduced (elfv2) and it
> is used primarily with ppc64le target only. While it has support for
> big-endian it is not commonly used and elfv1 still preferred.
>
> Musl does support only elfv2 ABI for both LE and BE and does not have
> any plans to support elfv1.
>
> Since then to build for powerpc64 with musl new ABI should be used. As
> expected it is not compatible with elfv1 but that isn't problem as long
> as there is no binary distributed software or assembly code written for
> elfv1 ABI.
>
> Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
> ---
>  meta/conf/machine/include/powerpc/arch-powerpc64.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc64.inc b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
> index f751c6b..d9916d4 100644
> --- a/meta/conf/machine/include/powerpc/arch-powerpc64.inc
> +++ b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
> @@ -7,6 +7,9 @@ TUNECONFLICTS[m64] = "m32 nf"
>  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'm64', ' -m64', '', d)}"
>  TUNE_ARCH .= "${@bb.utils.contains('TUNE_FEATURES', [ 'm64' ], 'powerpc64', '', d)}"
>
> +# musl only supports elfv2 ABI for ppc64
> +TUNE_CCARGS .= "${@['', ' -mabi=elfv2']['libc-musl' in d.getVar('OVERRIDES').split(':')]}"
> +

I wonder if we should change gcc to use this ABI by default when
configured for ppc64/musl ?
This would avoid us adding compiler options here, in bad cases it may
be that other compilers
call it out differently.

>  # user mode qemu doesn't support ppc64
>  MACHINE_FEATURES_BACKFILL_CONSIDERED_append = " ${@bb.utils.contains('TUNE_FEATURES', 'm64', 'qemu-usermode', '', d)}"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

