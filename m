Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0830EC433F5
	for <webhook@archiver.kernel.org>; Wed, 29 Sep 2021 16:09:03 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web08.11167.1632931738840557123
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 09:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hYvBbS/F;
 spf=pass (domain: gmail.com, ip: 209.85.208.45,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id g7so10546117edv.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 09:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=V3N1V/wAUyGWiFjMvK4FJnYbvUW8N0TorSmagjDZaYY=;
        b=hYvBbS/FIZ94VdubVZgkdQ/2TxpfOXpUwA4DVc08rloGrYKmsVjSNMGUibDQQuHqHF
         BnExYjK7lwuFCSI3CIojEYO16Cogw9l1jbh9/32JKxFNVUmLPi9BqviyiOUEGFL4pYTg
         +HBAueKNvbg0gz+P3rMQYFHf1RB8Kg/zVPZDB3cBmsFmmcHxCQ/oNC2H852G7PQ3pfH+
         kdbXbZaeODPbcsxewrBKOto9AiWOtcIowGJq1lI6iCCZQTAL28RrqEIPxtGYbcDDkoyP
         OV2GqM6TUwFKvMOps2td846sbwgwWPOA3iM+zXa1FQR79yGZYiuSF58v4Rdu9zfXGQsY
         8gMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=V3N1V/wAUyGWiFjMvK4FJnYbvUW8N0TorSmagjDZaYY=;
        b=ZETApxu5iZ5u4FDb6iEGPxjHguTXdUlKy91cwZs6hffsYZHreo47w456IlAcuaY2OT
         BYZ+QG/cJJtX1V/viPkbEA2BzL28LrPuJ0eUK7WuEFj1tmXrAc6sjO5P7VDiTrDtA7or
         Bb5tHlgIzeRMbED55mYCf+HIQjTWOlTI9h2EwEzyt2/cHqyUMdRFLZ4yHrViKr7LGQDM
         I2LfNJ9OUTee0lMio+TUfP3iNkt4D9Z6KdqOi1FHAOiGdc6MZ4gsr3lKW8DZRVuB0geB
         jC9Vf0U6/2YUKUZWlIe5VCltc4HNv51q1qV9LESInYLZKhTEMNmK7JGadPFrxGt+I6FE
         2u3A==
X-Gm-Message-State: AOAM531gVTIyjUB6+W5u4lr4BwlBnQn9JFJOQHJXHm/ERTMwmzBg4L6e
	qfqndsq/A8ISaloPRcMdo3uFVcDpmmyY3sex2jQ=
X-Google-Smtp-Source: 
 ABdhPJypWp/+mRItpyxHC2XNKC4H8n96FIvdLa5m6jv3xK0CAjc6nNP6FyqIT81YVhwXr2HrsyW4OJWhQnuqjdQJwzs=
X-Received: by 2002:a17:906:3542:: with SMTP id
 s2mr575855eja.379.1632931686143;
 Wed, 29 Sep 2021 09:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210929053353.600644-1-zboszor@pr.hu>
 <20210929053353.600644-3-zboszor@pr.hu>
In-Reply-To: <20210929053353.600644-3-zboszor@pr.hu>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 29 Sep 2021 12:07:54 -0400
Message-ID: 
 <CADkTA4OW6i-VPn2zp_esDXkjgTe-hYfTFzOE7hQZgQ=E9pw0AA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] kernel.bbclass: Allow using update-alternatives
 for the kernel image
To: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@pr.hu>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	=?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
 Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Sep 2021 16:09:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156470

On Wed, Sep 29, 2021 at 1:34 AM Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zbo=
szor@pr.hu> wrote:
>
> From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
>
> When using dnf to install new kernel versions and installonly_limit
> is reached, dnf automatically removes the oldest kernel version.
>
> For the dnf.conf documentation on installonlypkgs, installonly_limit
> and others settings, see:
> https://dnf.readthedocs.io/en/latest/conf_ref.html
>
> However, the /boot/bzImage symlink (or whatever image type is used)
> is removed unconditionally.
>
> Allow using the alternative symlink machinery so the highest
> kernel version takes precedence and the symlink stays in place.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
> v2: Mention dnf.conf documentation link
>     Protect against "IndexError: list index out of range"

There were other comments / questions on v1 that were missed. I'll add them
in this reply again (at least in short form).

We also need to document the new variable that is controlling the functiona=
lity

As you mentioned in the RFC cover letter, If this only works with rpm
then that needs to be checked, and we shouldn't allow the enablement
to do anything if it doesn't work or if what update-alternatives + the
package manager of choice isn't fully understood in all cases.

>
>  meta/classes/kernel.bbclass | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 882858e22e..47a78f0dd2 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -43,9 +43,23 @@ KERNEL_VERSION_PKG_NAME =3D "${@legitimize_package_nam=
e(d.getVar('KERNEL_VERSION')
>  KERNEL_VERSION_PKG_NAME[vardepvalue] =3D "${LINUX_VERSION}"
>
>  python __anonymous () {
> +    import re
>      pn =3D d.getVar("PN")
>      kpn =3D d.getVar("KERNEL_PACKAGE_NAME")
>
> +    # KERNEL_VERSION cannot be used here as it would cause
> +    # "basehash value changed" issues.
> +    kver =3D  d.getVar("PV")
> +    kverp =3D re.compile('[\.-]')
> +    kvparts =3D kverp.split(kver)
> +    # It seems PV is unset or empty for early recipe parsing
> +    # but __anonymous functions are run nevertheless.
> +    # Protect against "IndexError: list index out of range".
> +    if len(kvparts) >=3D 3:
> +        kverstr =3D str(kvparts[0])+str(kvparts[1]).zfill(2)+str(kvparts=
[2]).zfill(3)
> +    else:
> +        kverstr =3D '000000'
> +

I was asking about using something else than PV, since we are now up
to about three different variables being used to check versions. The
basehash question / issue is valid, but at this point we are packaging
based on something parsed out of the Makefile and then doing postinst
/ update alternatives steps based on PV. It is just going to cause a
lot of pain. And as you mentioned in your cover letter, it isn't
consistently used .. and hence we can't rely on it in this common
code.

I've asked around a bit, and we need to consider getting this code out
of the anonymous python completely. See how classes/fontcache.bbclass
uses PACKAGEFUNCS to create the postfunc steps. Since this isn't used
until packaging time, then it does need to move something that is run
in the proper context and we can avoid basehash and other issues.


>      # XXX Remove this after bug 11905 is resolved
>      #  FILES:${KERNEL_PACKAGE_NAME}-dev doesn't expand correctly
>      if kpn =3D=3D pn:
> @@ -117,6 +131,9 @@ python __anonymous () {
>          d.setVar('PKG:%s-image-%s' % (kname,typelower), '%s-image-%s-${K=
ERNEL_VERSION_PKG_NAME}' % (kname, typelower))
>          d.setVar('ALLOW_EMPTY:%s-image-%s' % (kname, typelower), '1')
>          d.setVar('pkg_postinst:%s-image-%s' % (kname,typelower), """set =
+e
> +if [ "${KERNEL_IMAGEDEST_USE_UPDATE_ALTERNATIVES}" !=3D "0" ]; then
> +    update-alternatives --install ${KERNEL_IMAGEDEST}/%s %s %s-${KERNEL_=
VERSION_NAME} %s
> +else

Here is where I was asking about why this isn't checking $D like the
previous code block.  Unless we want this running on both the host and
the target, it needs a check.

>  if [ -n "$D" ]; then

And now this block of code isn't indented and is in a big 'else'
block. Sure it is just a scriptlet, but it is getting hard to read and
follow.

Cheers,

Bruce

>      ln -sf %s-${KERNEL_VERSION} $D/${KERNEL_IMAGEDEST}/%s > /dev/null 2>=
&1
>  else
> @@ -126,14 +143,19 @@ else
>          install -m 0644 ${KERNEL_IMAGEDEST}/%s-${KERNEL_VERSION} ${KERNE=
L_IMAGEDEST}/%s
>      fi
>  fi
> +fi
>  set -e
> -""" % (type, type, type, type, type, type, type))
> +""" % (type, type, type, kverstr, type, type, type, type, type, type, ty=
pe))
>          d.setVar('pkg_postrm:%s-image-%s' % (kname,typelower), """set +e
> +if [ "${KERNEL_IMAGEDEST_USE_UPDATE_ALTERNATIVES}" !=3D "0" ]; then
> +    update-alternatives --remove %s %s-${KERNEL_VERSION_NAME}
> +else
>  if [ -f "${KERNEL_IMAGEDEST}/%s" -o -L "${KERNEL_IMAGEDEST}/%s" ]; then
>      rm -f ${KERNEL_IMAGEDEST}/%s  > /dev/null 2>&1
>  fi
> +fi
>  set -e
> -""" % (type, type, type))
> +""" % (type, type, type, type, type))
>
>
>      image =3D d.getVar('INITRAMFS_IMAGE')
> @@ -214,6 +236,7 @@ KERNEL_RELEASE ?=3D "${KERNEL_VERSION}"
>  # The directory where built kernel lies in the kernel tree
>  KERNEL_OUTPUT_DIR ?=3D "arch/${ARCH}/boot"
>  KERNEL_IMAGEDEST ?=3D "boot"
> +KERNEL_IMAGEDEST_USE_UPDATE_ALTERNATIVES ?=3D "0"
>
>  #
>  # configuration
> --
> 2.31.1
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

