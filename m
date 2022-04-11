Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF86C352B6
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:39 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web08.4153.1649716988121167763
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 15:43:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=oNF2PqL5;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.45,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f45.google.com with SMTP id u15so15140226ejf.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 15:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cy6MuydbY7tbvFzcTITOyneJKUuFOqb90MtKdDcBhWY=;
        b=oNF2PqL5W9g+O0MNWTwyrPurnznZ3O2Bgul7SNcBqc8QijoLtR/MaNCxofRIS6eRNq
         ZGRjVWgZHoqWZQAaxVpFk3cISEAJFLnyMvW9bZnC9eXydUj+dCDEkaPJfBJ3CJtLTVW5
         TiTY6cbBGj3HXP2goOxOe380JojDRwVp0M2tC53/mTiceSMg5zuZ0u9k0YwwzVx/efgo
         xIzCtB61F7v9TVO1ozopfg60zcn2jFHJpODtZzcxWVib0KnjXQrpCsViqm+GHF7Qu3q1
         U/NzmywFSsuMZ44BR042mxrdpO8ErAsQt1YT7MwkckJMkq6jdw2cPySWjuCl0mG2aB12
         eiyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cy6MuydbY7tbvFzcTITOyneJKUuFOqb90MtKdDcBhWY=;
        b=EcwA3vPBSBjFfV/HFYvA9u/Kgd6p2EvJ7IPiq8/bc9GkzP7fD0ElqtjzDGi2ViH+y3
         neXfMRe6kizXnJA84AI4zt8oGcDQcwvdcymfBqevuMYUHHbFL3dVTRwI4dbaK1L7ZEYh
         fp4CyTsBTRisojNv75nkzghC1aXFcLNPBaFbI3sTaHBn4NK5p2r18OAblx55f4b6ucM4
         D6J3KUpxh1gwo/uf1wJI0qPPGDwi1MeI9eb4Jc3AjIj2fGoNQSV1ECuuk6I5lemYISU+
         PhBJwEy7uaDScQg8SHkjHrkEAOuNWSHkwSwha92xK77TooEoyWnu07XCHXwF7oVl8dNa
         N7PQ==
X-Gm-Message-State: AOAM533clXikoQBKMiAAhweG/KVsXy7QdIiHETPTk8qirclFdAa0nOMO
	xxS2Dfl5Xm7Mqwgl/VCbE9lUbyQS1sF0dnopIO8H5g==
X-Google-Smtp-Source: 
 ABdhPJwnkswerx7jTiAyP1xVOhME1jbBqU5TCyFtq6uRXb98FZen5XYjQloZXvEOxZLXvUHObpVNeV2MesK8H/Qy3oE=
X-Received: by 2002:a17:906:4d1a:b0:6e8:8860:8a72 with SMTP id
 r26-20020a1709064d1a00b006e888608a72mr8098081eju.540.1649716986407; Mon, 11
 Apr 2022 15:43:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220329130741.2430737-1-ross.burton@arm.com>
 <CAOSpxdap6UjLpy9M--b_EMYV+m3oYOQJT002Hqw5qcpCwgTVyw@mail.gmail.com>
 <CAAnfSTuHjbiN2NKVwZOut+MjxLhuFMwn+xAWkFHaqAXmM_8Ypg@mail.gmail.com>
 <CAOSpxdZGOwUs86K6bEX3WTgVu-+fFjonKxiGEe+u1OL=ivqx+w@mail.gmail.com>
 <CAOSpxdb+O=iDpDNr7S62wut=GErTXg8cvpYsj0nn6DM9G1CL-A@mail.gmail.com>
 <CANp-EDaVN-4Z_iYXJq7OcJ1QEtpAsHTGOQkCHeW+gJ6u2b=0xQ@mail.gmail.com>
 <CAOSpxdZdi+xiJcFeyOgrLTATOaaD0hf9k-+yQmsH2+GJm8xcQw@mail.gmail.com>
 <CANp-EDaN76FxTBEjWFe5WD3W+tHbqbfJuA=kcuW8eeyF_O8vHQ@mail.gmail.com>
 <CAOSpxdamJ5KMKxKMQqa1C-qAf4M_0-vq6hSifch0efzEScft8Q@mail.gmail.com>
 <CANp-EDa5OUxL_d301sXr5oV+q_UcmpU=bjd95v7ddyeCVS8w2g@mail.gmail.com>
In-Reply-To: 
 <CANp-EDa5OUxL_d301sXr5oV+q_UcmpU=bjd95v7ddyeCVS8w2g@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 11 Apr 2022 12:42:55 -1000
Message-ID: 
 <CAOSpxdbuJOH8R9a9XWGcFNL6nvSaMB=au1sQ4AgiYr+b00Op6Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell] zlib: backport the fix for
 CVE-2018-25032
To: Ralph Siemsen <ralph.siemsen@linaro.org>
Cc: Ross Burton <ross@burtonini.com>, "Mittal, Anuj" <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164243

On Mon, Apr 11, 2022 at 12:30 PM Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
>
> On Mon, Apr 11, 2022 at 2:58 PM Steve Sakoman <steve@sakoman.com> wrote:
>
> > Let me know if you make any progress!
>
> After a clean build, and messing about with VNC, I am now able to
> 'bitbake core-image-sato:do_testimage'.
>
> > Yes, either change will trigger the error.  Without the zlib or xz
> > patches all is fine.  Adding just one or the other will fail the
> > pkgman-deb-non-deb builds (and probably the pkgman-rpm-non-rpm builds
> > too, though I've been concentrating on the deb version to try to
> > isolate the offending patches)
>
> I have both gzip and xz patches applied:
>     $ git log --oneline
>     52269ab7e7 (HEAD -> dunfell) gzip: fix CVE-2022-1271
>     e7fa7a2a2c xz: fix CVE-2022-1271
>     38c55bd388 (origin/dunfell) tzdata: update to 2022a
>     86285152bd python3-jinja2: Correct HOMEPAGE
>
> With default PACKAGE_CLASSES = package_rpm
>     RESULTS - dnf.DnfBasicTest.test_dnf_help: PASSED (8.77s)
>     ...
>     SUMMARY:
>     core-image-sato () - Ran 64 tests in 242.039s
>     core-image-sato - OK - All required tests passed (successes=35,
> skipped=29, failures=0, errors=0)
>
> With PACKAGE_CLASSES = package_deb
>     RESULTS - apt.AptRepoTest.test_apt_install_from_repo: PASSED (43.98s)
>     ...
>     SUMMARY:
>     core-image-sato () - Ran 64 tests in 57.334s
>     core-image-sato - OK - All required tests passed (successes=15,
> skipped=49, failures=0, errors=0)
>
> So I do not seem to reproduce the error. Any ideas what else might
> differ in the autobuilder versus my local?

Sigh, I just ran the same experiment here with the same results - all is fine.

The setup json for the autobuilder run is:

        "pkgman-deb-non-deb" : {
            "MACHINE" : "qemux86",
            "PACKAGE_CLASSES" : "package_deb",
            "BBTARGETS" : "core-image-sato core-image-sato-sdk
core-image-minimal core-image-minimal-dev
core-image-sato:do_populate_sdk",
            "SANITYTARGETS" : "core-image-minimal:do_testimage
core-image-sato:do_testimage core-image-sato-sdk:do_testimage
core-image-sato:do_testsdk"
        },

I was using qemux86-64 for my experiment, so I guess I need to redo it
now using the correct machine!

Steve

