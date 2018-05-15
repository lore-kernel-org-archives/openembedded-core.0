Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id A973C74E17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 13:48:35 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id c5-v6so12549293itj.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 06:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=B5Lw6XElZ2rpvQGFe4x/UvmjrnVVjUufOHnsZitmH6s=;
	b=gwpAiaLpMJR6xa34CvO0RPMmPWcKC0rOp/tICAKcY67TmRTMUes4Iy9SrXafwguiby
	qpidBaCUmwnnE0kIItowvbwGpheV+7dAkDGUTx1QuBc8SDFo4d5dW5lozhXPrGTCyc4X
	g377mv+7YrqbSKEqcx2ItjDOcctJs1fv15T/dD/eSCI9TadkCMCgvBmh4y/Mzk9agMN7
	McyyxBdqtM92uBDOEJxEkVFEwquT27T8vJJaLDsuOBY3pKK5NwIwvaJoIltKFsG/ciyx
	rZ1tuTEi2eBU4Bdjl5VRCVMCI7d5TuxKBjgNEkLtVMsJq2MDD6So201dZKktgFG06UYk
	mW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=B5Lw6XElZ2rpvQGFe4x/UvmjrnVVjUufOHnsZitmH6s=;
	b=Q1YfAIZ7XCvGJhQR414n9E5PLT6FVtHFa/H5dy3ijW1aW4NNNWplaBlt/5egVYWtPJ
	4EFwHMB89NcGJnXxKOs92AOf6HoNdDUdAHOTjbNRWnTQBeOGnnAj6O7GJ4AnunnfzBd7
	jBzU0ibLKcoOxcneLujBvCS/SKbb0TuQQ/1kR0aVjNwIaB4g2FC00kVFDUWfe3mWFJf3
	OFl9Gl/ZbDETNaOFzL2shInZA2EXr7g7EraWcPInr7XRQXuW18Fyy6MDFz/ioowGIBqU
	qX4OEBeWlyDjNHUAVUJ51CExqr6oZ22TgbnPPE2yW95L5/BGOQYrAsKhoFzkd/CBYgwr
	D9hA==
X-Gm-Message-State: ALKqPweC+oczeQRdeUew/t2/0Cxpz9Z1kF8kzNi+fWmuzGNNOFqYBXVm
	dy0oioAq4hgZkuxAtAKnu9giHXXa7Raex4NNhvMP8A==
X-Google-Smtp-Source: AB8JxZpazMY67pr0kx2J2BUZKCM/OEK+Xkp5IHtWfbXpZr0OOznxTtBr+PTYo09qm0Ovi38fsSwEATyv6/QDJYvZzkE=
X-Received: by 2002:a6b:b74b:: with SMTP id
	h72-v6mr15391289iof.201.1526392116394; 
	Tue, 15 May 2018 06:48:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Tue, 15 May 2018 06:48:15 -0700 (PDT)
In-Reply-To: <1526337230-25723-1-git-send-email-armccurdy@gmail.com>
References: <1526337230-25723-1-git-send-email-armccurdy@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 15 May 2018 14:48:15 +0100
Message-ID: <CAJTo0LZ5-2Bubqj4xu8tGXvxm1SataL5gXyfRudZn_d+0e+JnQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kernel.bbclass: avoid duplicates in KERNEL_IMAGETYPE_FOR_MAKE
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
X-List-Received-Date: Tue, 15 May 2018 13:48:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andre,

The autobuilder is failing in mips64 builds and I suspect this patch
is to blame.  For example
https://autobuilder.yocto.io/builders/nightly-mips64/builds/1001.

Ross

On 14 May 2018 at 23:33, Andre McCurdy <armccurdy@gmail.com> wrote:
> Currently if KERNEL_IMAGETYPES contains both vmlinux and vmlinux.gz,
> KERNEL_IMAGETYPE_FOR_MAKE will end up containing two copies of
> vmlinux, which will result in two calls to "make vmlinux" from
> kernel_do_compile().
>
> Avoid duplicating vmlinux in KERNEL_IMAGETYPE_FOR_MAKE plus some
> minor non-functional updates to formatting and comments.
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  v2: refresh + make typeformake a set based on suggestion from Martin Hun=
deb=C3=B8ll
>
>  meta/classes/kernel.bbclass | 28 ++++++++++++++++------------
>  1 file changed, 16 insertions(+), 12 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 6595a04..68d2185 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -62,32 +62,36 @@ python __anonymous () {
>      type =3D d.getVar('KERNEL_IMAGETYPE') or ""
>      alttype =3D d.getVar('KERNEL_ALT_IMAGETYPE') or ""
>      types =3D d.getVar('KERNEL_IMAGETYPES') or ""
> -    kname =3D d.getVar('KERNEL_PACKAGE_NAME') or "kernel"
>      if type not in types.split():
>          types =3D (type + ' ' + types).strip()
>      if alttype not in types.split():
>          types =3D (alttype + ' ' + types).strip()
>      d.setVar('KERNEL_IMAGETYPES', types)
>
> +    # KERNEL_IMAGETYPES may contain a mixture of image types supported d=
irectly
> +    # by the kernel build system and types which are created by post-pro=
cessing
> +    # the output of the kernel build system (e.g. compressing vmlinux ->
> +    # vmlinux.gz in kernel_do_compile()).
> +    # KERNEL_IMAGETYPE_FOR_MAKE should contain only image types supporte=
d
> +    # directly by the kernel build system.
>      if not d.getVar('KERNEL_IMAGETYPE_FOR_MAKE'):
> -        # some commonly used kernel images aren't generated by the kerne=
l build system, such as vmlinux.gz
> -        # typeformake lists only valid kernel make targets, and post pro=
cessing can be done after the kernel
> -        # is built (such as using gzip to compress vmlinux)
> -        typeformake =3D types.replace('vmlinux.gz', 'vmlinux')
> -        d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake)
> +        typeformake =3D set()
> +        for type in types.split():
> +            if type =3D=3D 'vmlinux.gz':
> +                type =3D 'vmlinux'
> +            typeformake.add(type)
> +
> +        d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', ' '.join(typeformake))
> +
> +    kname =3D d.getVar('KERNEL_PACKAGE_NAME') or "kernel"
> +    imagedest =3D d.getVar('KERNEL_IMAGEDEST')
>
>      for type in types.split():
>          typelower =3D type.lower()
> -        imagedest =3D d.getVar('KERNEL_IMAGEDEST')
> -
>          d.appendVar('PACKAGES', ' %s-image-%s' % (kname, typelower))
> -
>          d.setVar('FILES_' + kname + '-image-' + typelower, '/' + imagede=
st + '/' + type + '-${KERNEL_VERSION_NAME}' + ' /' + imagedest + '/' + type=
)
> -
>          d.appendVar('RDEPENDS_%s-image' % kname, ' %s-image-%s' % (kname=
, typelower))
> -
>          d.setVar('PKG_%s-image-%s' % (kname,typelower), '%s-image-%s-${K=
ERNEL_VERSION_PKG_NAME}' % (kname, typelower))
> -
>          d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname, typelower), '1')
>
>      image =3D d.getVar('INITRAMFS_IMAGE')
> --
> 1.9.1
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

