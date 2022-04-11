Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F34DFC47081
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:38 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web08.1382.1649703536099427236
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 11:58:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=HnABUAij;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.46,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f46.google.com with SMTP id l7so27367452ejn.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 11:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ql/NJWUq3VY/6tGPv9e03c1F3mgyrtimrqkiiiBS8zc=;
        b=HnABUAijZJdh75cpKUxQgw/o1EcjoU+SheUH6nhk8LXhCG+xtisoRvNhQvGZXKPyPJ
         ku6o6b1CKCA0bWm7H8vDmTs47GfKNo1ewWiumMgyPLj7OZTBc4tRrryzrEp1FMHedFvT
         9nvnmGRsf08mGzRxFhgjJegzIYucdqJSjoNVVedSXV3A0BQKPLIWZkb6Olz2P/GesruR
         Ll43bFhPRKtYDXCVki6X6hLLpaTxg+YSgL9see2Oo1Ok2cr50v8y5Ekz4/50Bn3bnGuU
         MoQr5Aj7QtastJnff958c/ClpXsLBzD2mQ3II+Nr1jOeh4ajbd3C69J/o+IHTx4q0JMs
         sOSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ql/NJWUq3VY/6tGPv9e03c1F3mgyrtimrqkiiiBS8zc=;
        b=YybKwkDtiZx4u1RDlThvWeMTWnfSSwxTnA8S1thG1rmoXaxrDC6xibAct7xRASLeud
         GSzEm6glG9zrcvpcbibbT0hYcDQ0YDgdtqT26RVS4E39yxTPIgJbwfQFVP2GpnK8WwKG
         XtM5DPyA2GuOJTZ26cg6GTQyZcWtRdaY+OhmwoD85f7RKhtP+TZ80GOJoHQGKqhSn/1R
         MWEjU30h1slvKMKsvr05dAo4C5J38Ti0WfQkQX8OaA4FS8OQzOIV1rn7J8K9XyOig+EO
         8y5T5eimsEmsra+/OF4GzhfEiGxyt8TuEWufcxuj5WpFZpFTPgev/4dbujFM6Qud4E7g
         6NzA==
X-Gm-Message-State: AOAM5315erxAG7jhOdZedOsiXUhbJ/VXsQXFVAXtpFQg14dIt0EUcGfg
	1qxgGBf70D83wdEzEsID8+l6rMoF6Ky06NKsYe5t7g==
X-Google-Smtp-Source: 
 ABdhPJxSX0tRd7mYCQM424HdZ0+/xXvphimRzo77czQPXNqd3bRX0k17t+VflzIgjKzwN9gdcwK0nHIz+eQz4PiRqBQ=
X-Received: by 2002:a17:906:a1c8:b0:6da:a635:e402 with SMTP id
 bx8-20020a170906a1c800b006daa635e402mr31513838ejb.598.1649703534332; Mon, 11
 Apr 2022 11:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220329130741.2430737-1-ross.burton@arm.com>
 <CAOSpxdap6UjLpy9M--b_EMYV+m3oYOQJT002Hqw5qcpCwgTVyw@mail.gmail.com>
 <CAAnfSTuHjbiN2NKVwZOut+MjxLhuFMwn+xAWkFHaqAXmM_8Ypg@mail.gmail.com>
 <CAOSpxdZGOwUs86K6bEX3WTgVu-+fFjonKxiGEe+u1OL=ivqx+w@mail.gmail.com>
 <CAOSpxdb+O=iDpDNr7S62wut=GErTXg8cvpYsj0nn6DM9G1CL-A@mail.gmail.com>
 <CANp-EDaVN-4Z_iYXJq7OcJ1QEtpAsHTGOQkCHeW+gJ6u2b=0xQ@mail.gmail.com>
 <CAOSpxdZdi+xiJcFeyOgrLTATOaaD0hf9k-+yQmsH2+GJm8xcQw@mail.gmail.com>
 <CANp-EDaN76FxTBEjWFe5WD3W+tHbqbfJuA=kcuW8eeyF_O8vHQ@mail.gmail.com>
In-Reply-To: 
 <CANp-EDaN76FxTBEjWFe5WD3W+tHbqbfJuA=kcuW8eeyF_O8vHQ@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 11 Apr 2022 08:58:42 -1000
Message-ID: 
 <CAOSpxdamJ5KMKxKMQqa1C-qAf4M_0-vq6hSifch0efzEScft8Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell] zlib: backport the fix for
 CVE-2018-25032
To: Ralph Siemsen <ralph.siemsen@linaro.org>
Cc: Ross Burton <ross@burtonini.com>, "Mittal, Anuj" <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164238

On Mon, Apr 11, 2022 at 8:17 AM Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
>
> On Mon, Apr 11, 2022 at 1:52 PM Steve Sakoman <steve@sakoman.com> wrote:
>
> > I see from irc that you've discovered INHERIT += "testimage".  I think
> > that might help with the above issue.
>
> Indeed, I added that, which solved the missing do_testimage problem.
> However even after rebuilding core-image sato, I do not have /etc/apt
> nor apt in the image.
>
> Looking at https://git.yoctoproject.org/poky/tree/meta/lib/oeqa/runtime/cases/apt.py?h=dunfell#n43
> the apt test should be skipped. Seemingly relevant bits of "bitbake -e":
>
> IMAGE_FEATURES=" debug-tweaks"
> IMAGE_PKGTYPE="rpm"
> INHERIT=" cve-check testimage poky-sanity uninative reproducible_build
> package_rpm buildstats image-mklibs image-prelink debian devshell
> sstate license remove-l
> ibtool blacklist sanity"
> TESTIMAGEDEPENDS=" cpio-native:do_populate_sysroot
> dnf-native:do_populate_sysroot createrepo-c-native:do_populate_sysroot
>   qemu-native:do_populate_sysroot
> qemu-helper-native:do_populate_sysroot
> qemu-helper-native:do_addto_recipe_sysroot"

I've been busy setting up my systems to start doing the kirkstone LTS
maintenance too, so I haven't yet dug into this. But I will try to
reproduce this locally in the next day or so.  Let me know if you make
any progress!

> > FWIW, I'm seeing the same error with the xz CVE fix patch too.
>
> Interesting... and without those the tests are successful (with all
> other current changes)?

Yes, either change will trigger the error.  Without the zlib or xz
patches all is fine.  Adding just one or the other will fail the
pkgman-deb-non-deb builds (and probably the pkgman-rpm-non-rpm builds
too, though I've been concentrating on the deb version to try to
isolate the offending patches)

Steve

