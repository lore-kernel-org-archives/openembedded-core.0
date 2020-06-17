Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web11.8041.1592401726119205825
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 06:48:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KLLxer8R;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id l27so2422847ejc.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2020 06:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZB0fCR507EW5E9wQ9CYltVsupTFPh7vR9U7jZC+GQ+A=;
        b=KLLxer8R/AB4XsOWseplH16j+Ik2FCKC8tu3eiIRrTsngEXKu9sruCmtSq4iEF8ETJ
         qkDlp4BZuZyCmth7i69KPIxkt1GTeSkU0wQlMP4/QprqLobLsPKoFcuDDa7K0ek1VgrY
         58mKbqDuCr7Fez0dPlSk8jiKbfZXLAHP0uV9PJBkrtBKn77CruLygm18DYwcGThOfsSJ
         XbtFuMQTCn8WEaCAUhWM/SaTV61l7kkMX9tNwHGNFHqV8osA1mwmvsK/AIo3qOkqAoBS
         zICx+IF8vb8JHUNJcuL0u0+X4uLiKw+9QGWkJ71oZrvO2Y8T8nOanqih7LlO9+T4jvRR
         S8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZB0fCR507EW5E9wQ9CYltVsupTFPh7vR9U7jZC+GQ+A=;
        b=nSalU8I8EcYZwyHnjFG+vltCeCirJrzboShfAwA1gLRDJKkejKLE1KJtZ7d9Ewc858
         DlNqjD4W0RgTB0R9mIKdOL9swt+4KjDWmxS2HmWBn0HPy6w9aNVDBeE5GjP5zMZ9VkD5
         jmSVm65nZCqB/uc1P95FF68e4HI13Q+W4cbVwN/76chZNwoXL+xR056i+QpObpL/dOGp
         WnLmxWnDFPgZAEU8/OC7GYsmqS/4c51l2Bs7twWvsJChb6LxS+IJ6+G/qB0xpGAcMpgb
         +FmxmihuFYVpGTRPkw4nfxFt9bR28C8V6PlF33tU3HzUGOpn/cjL0FCag8/oUo+zVynl
         bPKQ==
X-Gm-Message-State: AOAM531XQoOHB5E0+StdVZGuhOflE2JEukbghwKC9Mg+20fB+SqPWdwQ
	iye1KGizFc4k6+TGkKV2o6sqpCPGxXpe84mTQyo=
X-Google-Smtp-Source: ABdhPJwDZoGukiNq+uQ1+4KB9QxtTRr3Ac7hMruIceV1jlX7JGZC21A9ciz6ZKu/wPJz3gWFMoHxktS50OLFbitBOSo=
X-Received: by 2002:a17:907:4030:: with SMTP id nr24mr7365774ejb.247.1592401724474;
 Wed, 17 Jun 2020 06:48:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200617062028.5542-1-yanfei.xu@windriver.com> <20200617062028.5542-2-yanfei.xu@windriver.com>
In-Reply-To: <20200617062028.5542-2-yanfei.xu@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 17 Jun 2020 09:48:33 -0400
Message-ID: <CADkTA4PiqVvnmZFEoBSTX1g7JxpqAkRQbAozScYtOWJ_6omQBg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] classes/kernel: Use a copy for kernel*.rpm when fs don't support symlink
To: "Xu, Yanfei" <yanfei.xu@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, He Zhe <zhe.he@windriver.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 17, 2020 at 2:20 AM <yanfei.xu@windriver.com> wrote:
>
> From: Yanfei Xu <yanfei.xu@windriver.com>
>
> Some filesystems don't support symlink, then you will get failed when
> you install or update the kernel rpm package. Now we use a copy for
> these filesystems instead of symlink.
>
> Suggested-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> ---
>  meta/classes/kernel.bbclass | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 41101a64a0..e9b5a84de7 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -94,6 +94,14 @@ python __anonymous () {
>          d.appendVar('RDEPENDS_%s-image' % kname, ' %s-image-%s' % (kname, typelower))
>          d.setVar('PKG_%s-image-%s' % (kname,typelower), '%s-image-%s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
>          d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname, typelower), '1')
> +        d.setVar('pkg_postinst_ontarget_%s-image-%s' % (kname,typelower), """
> +set +e
> +ln -sf %s-${KERNEL_VERSION} ${KERNEL_IMAGEDEST}/%s > /dev/null 2>&1
> +if [ $? -ne 0 ]; then
> +    echo "Filesystem on ${KERNEL_IMAGEDEST}/ doesn't support symlink, then use a copy."

This could say "... doesn't support symlinks, falling back to copied
image (%s)" (and fill in the image file we are actually using).

> +fi

I expected to see the fallback copy here in the postinstall, but this
looks ok to me .. I'm going to just type in my process of reading the
patch so you can correct me if I'm wrong.

The logic is split between the two places. Below during the build
(do_install), and here in the postinstall.

In do_install(), we no longer symlink, but instead copy the versioned
image into the non versioned 'image' file. And then in the
postinstall, we try and make a symlink (which may fail) to the same
thing (the versioned image to a non versioned one), and that's a force
symlink so it will clobber the previously copied one if possible, or
implicitly fall back if the symlink fails.

So yes, that logic seems fine to me.

The reason I went through all that, is that for on-target upgrades.
You won't have the do_install() to place the versioned image, have you
confirmed that the versioned image file is packaged and will be
present on an on-target install ? So the logic is the same with the
symlink ? It should be, otherwise this would never work, but I just
wanted to be sure.

> +set -e
> +""" % (type, type))
>
>      image = d.getVar('INITRAMFS_IMAGE')
>      # If the INTIRAMFS_IMAGE is set but the INITRAMFS_IMAGE_BUNDLE is set to 0,
> @@ -386,7 +394,7 @@ kernel_do_install() {
>         for imageType in ${KERNEL_IMAGETYPES} ; do
>                 install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} ${D}/${KERNEL_IMAGEDEST}/${imageType}-${KERNEL_VERSION}
>                 if [ "${KERNEL_PACKAGE_NAME}" = "kernel" ]; then
> -                       ln -sf ${imageType}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${imageType}
> +                       install -m 0644 ${D}/${KERNEL_IMAGEDEST}/${imageType}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${imageType}

Looking at this, can the existing line:

 install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}
${D}/${KERNEL_IMAGEDEST}/${imageType}-${KERNEL_VERSION}

be combined with the one you added ?

We are copying the non-versioned image into a versioned image file,
and then in the new logic, coping that versioned image into a
non-versioned one. Couldn't we just have one copy of the non-versioned
image, into the non-versioned image in KERNEL_IMAGEDEST ?

Cheers,

Bruce

>                 fi
>         done
>         install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
> @@ -602,6 +610,7 @@ pkg_postinst_${KERNEL_PACKAGE_NAME}-base () {
>         fi
>  }
>
> +
>  PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
>
>  python split_kernel_packages () {
> --
> 2.18.2
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
