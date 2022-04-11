Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA4DC38161
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:39 +0000 (UTC)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web10.3866.1649716248540463002
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 15:30:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=LLFxueHD;
 spf=pass (domain: linaro.org, ip: 209.85.217.46,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-vs1-f46.google.com with SMTP id m14so4660677vsp.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 15:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zvFLeRkOiVKoraZniGu2qnIjy/LWjw+AkboNaGqJ/ik=;
        b=LLFxueHDezG7vWZouPb5EXBK2c4wq7VZIoHxAS14pZaReezjz9GxfIeYlARdyzDu8q
         nbG8Rygf0z8c1baUFjUkOC98uY8mV6Feu6xNB80cXK11p25I7RiN0zIO2n4sJ1ZVXfar
         RWyQewlHqzKKLWPUEcyDbV4HP4G1fuRPyuKgRloZc/UaFEIP/yRqm5vpp6eHWuW1d1Vx
         TAMIhJu0ubdsTEngGDmGipfFcbbMJ8FwPQW6Ziw20s6MFUy8upt5MEJxUCx8+reIcTz3
         2RK7/Sog+6rMZZMK/eQoy3BRuE6QlHTpeGMtyp5Q2pWH/BhJ+emxW3F8wK8n4G38/Yeg
         GkEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zvFLeRkOiVKoraZniGu2qnIjy/LWjw+AkboNaGqJ/ik=;
        b=0sfEEKu0orPE8Wdm+tbuOz1iSGED+HzWLBbsuPNOptRqvHaayokhbbxtjsvaVtzaRK
         rlXK0zkl7HzCBEcGyNeZ0+e13S8pV0S6kCuCIY8Y6HHxKy79QnClErkqzC6PnMLqMskf
         syWhR3zECf2avprO0jGNmcq432UkvfIbLqDbNwXORrl+h4X1MlNlzCj5Xwaw8oh1lMFA
         30/HAqemsmZGWJ6TmOo57ZlF5OwmxYnj3H9E5WipNtv9uDoP8Cf1YaqDMHCGgbggqVs4
         mwFqE2BNs2xPx0iO6cKgGUJDgfX52Pm1P/UwLWdVF/QxephbcLmvC5SlSf3NOk2JmEEq
         DIPg==
X-Gm-Message-State: AOAM532lJQaHVj/RCxa5pPmr1Y717QW4PziAyaE6v9g+U51Mpl7vtZkt
	HvhXB9lLOfMt5IiFn12O3TCvFXt1O6f6G9/ujyQnjg==
X-Google-Smtp-Source: 
 ABdhPJwFNJ/+bBHGFZHFWWRI5iRPqOT4/7goXCUKIf1o0ojdmuNzWlPcm4NhhBeGgCWXOqWox8DnyVbWKysI/mXN5Fs=
X-Received: by 2002:a05:6102:6d3:b0:325:cfa3:44b with SMTP id
 m19-20020a05610206d300b00325cfa3044bmr10684709vsg.23.1649716247657; Mon, 11
 Apr 2022 15:30:47 -0700 (PDT)
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
In-Reply-To: 
 <CAOSpxdamJ5KMKxKMQqa1C-qAf4M_0-vq6hSifch0efzEScft8Q@mail.gmail.com>
From: Ralph Siemsen <ralph.siemsen@linaro.org>
Date: Mon, 11 Apr 2022 18:30:36 -0400
Message-ID: 
 <CANp-EDa5OUxL_d301sXr5oV+q_UcmpU=bjd95v7ddyeCVS8w2g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell] zlib: backport the fix for
 CVE-2018-25032
To: Steve Sakoman <steve@sakoman.com>
Cc: Ross Burton <ross@burtonini.com>, "Mittal, Anuj" <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164242

On Mon, Apr 11, 2022 at 2:58 PM Steve Sakoman <steve@sakoman.com> wrote:

> Let me know if you make any progress!

After a clean build, and messing about with VNC, I am now able to
'bitbake core-image-sato:do_testimage'.

> Yes, either change will trigger the error.  Without the zlib or xz
> patches all is fine.  Adding just one or the other will fail the
> pkgman-deb-non-deb builds (and probably the pkgman-rpm-non-rpm builds
> too, though I've been concentrating on the deb version to try to
> isolate the offending patches)

I have both gzip and xz patches applied:
    $ git log --oneline
    52269ab7e7 (HEAD -> dunfell) gzip: fix CVE-2022-1271
    e7fa7a2a2c xz: fix CVE-2022-1271
    38c55bd388 (origin/dunfell) tzdata: update to 2022a
    86285152bd python3-jinja2: Correct HOMEPAGE

With default PACKAGE_CLASSES = package_rpm
    RESULTS - dnf.DnfBasicTest.test_dnf_help: PASSED (8.77s)
    ...
    SUMMARY:
    core-image-sato () - Ran 64 tests in 242.039s
    core-image-sato - OK - All required tests passed (successes=35,
skipped=29, failures=0, errors=0)

With PACKAGE_CLASSES = package_deb
    RESULTS - apt.AptRepoTest.test_apt_install_from_repo: PASSED (43.98s)
    ...
    SUMMARY:
    core-image-sato () - Ran 64 tests in 57.334s
    core-image-sato - OK - All required tests passed (successes=15,
skipped=49, failures=0, errors=0)

So I do not seem to reproduce the error. Any ideas what else might
differ in the autobuilder versus my local?

Ralph

