Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE1BE7718B
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 18:12:42 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.17001.1735323161251252741
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Dec 2024 10:12:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RvEaWsTW;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53f22fd6887so7192265e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Dec 2024 10:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735323159; x=1735927959; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WrjcEObJptxej1ohEeOsO8SI5mtYbapkoqe/2r5x0pE=;
        b=RvEaWsTWebtEDNrWUBp1nfpGakOL4Lvz7zvTbSPmKO3OZ1fT58oh5D52yakCqH42LQ
         usn8UpNN+ZJ9PXkuN/khD7xoJSYS8pnaitImWK5AZEF1UQTSfcIiZm3H0uvTXaN3HKuh
         C6VJSqJynA+4uYnNJb7IxCkniNVrUBysc9Wb0BZHsYkor7CDcyOnnaq86/Hoi5669DaF
         MHmiNv5Jvk3TLTmUmwLelDHSeqbqEiab7hvIpJsMfeU0TzIqm67PY5v8lUD8LMcT+LWc
         bSZ+LTrzA7bG0jpuFUJd1TryW1DmlubqsKRgZwjkhQFZ4eo3ZQAIZUpfo14ctF9GbP1G
         KwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735323159; x=1735927959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WrjcEObJptxej1ohEeOsO8SI5mtYbapkoqe/2r5x0pE=;
        b=G/gnFeHYPxPE19iglUxJzaUsxt65WpZMt/tYKpO1vlFSkVTiznmrjQB5ECreigAyKN
         tWujT152m75HIRU8uPzlDooprxi5o9swtR26DdVZpMCxHQ9O3n9MofxRd40OTpn7ppBT
         CHzBjJMV4b7As9zthm7fe30i8jNRaOedGi65uekqyQUwc/5kK3p0O1mYhKzAOfm8rz/b
         DAUdwS9UvjsjPJTkc3cw64k/Dx7n+OQ4OJbJNu/Vxi1dSaRf0ZUBcyIilBujvap47x9i
         PWsDC219OW8AAaNIV3WxN4YCSPFUoxBT338vkplgreaVMVWAlUexbNmP11q5Dtva7pld
         KJdw==
X-Forwarded-Encrypted: i=1; AJvYcCVtVQNV6a7hQXcZtXkIJEW232Kx1xGDzOm7PULZrBuUpzZk3Gm02xSazqyFjYacHGCn2kF0WZ5ulYNoepHK6DPx/g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyP1d5AkHhPWFIdUULDPzbKjqN3XVLQKKVKKDIN4w6FAoM8Yp+Z
	wUb4yH3426xI8oWxxzkBx1wqUm3adccWP09jVa3hbitdgS+xvwpIFushA+4WP8xm3b8YHdYU3b7
	1WJIlLekWm7DZhMYmfgqzOcQa8b4=
X-Gm-Gg: ASbGncs6McNGSd8p+2wz7TlSjHNmOsCKANLcrMrrQWqtLtYgfZnm1YQC1wISt1o7Pe7
	4PuZlcz4RyMaQYmculSdUJi8FVAVIdpV+77FQStgOv1oeJqgEjHxx
X-Google-Smtp-Source: AGHT+IH8TU1jyXfsYTu8UtZNMnqAmCXttOynDpdx0a/9Zj25FV3+r+Qq4F1XQW3F/8M5IZHI8UuRCORfxkF4+weEgVE=
X-Received: by 2002:a05:6512:2245:b0:540:2549:b6ca with SMTP id
 2adb3069b0e04-54229586177mr9333923e87.55.1735323159068; Fri, 27 Dec 2024
 10:12:39 -0800 (PST)
MIME-Version: 1.0
References: <20241118162643.1423409-1-alex.kanavin@gmail.com>
 <20241118162643.1423409-3-alex.kanavin@gmail.com> <c799588bada27abdf2b412115868c5b84c24a0e2.camel@linuxfoundation.org>
 <CANNYZj_ONOGam=9um4qqqAc_D0gQHrQML3a9eXBEgHLCiRtM1A@mail.gmail.com>
 <4254d23ae9ad100e70f199fa4949ce00bfe7063c.camel@linuxfoundation.org>
 <CANNYZj-Ox6t8yV7Bh2NePmseYCW843Z5ozq50y2Tyoa=GeDPyg@mail.gmail.com>
 <1647f808543a0851f5a1a17e293f1a68970f7c0e.camel@linuxfoundation.org>
 <CAJdd5GYwyLGFs_nreXDNV6F8_GAiTBMhWOe6V_TiO9aw+MCOng@mail.gmail.com>
 <CANNYZj8_OShX4sPqhGpb3HSbN0quMKUcoFtKhLrcGTLtG1d-Qw@mail.gmail.com> <CAJdd5GbRf731WsnMZujR3SUCVUhm080f=F_iZsFTuZxt1kQH=A@mail.gmail.com>
In-Reply-To: <CAJdd5GbRf731WsnMZujR3SUCVUhm080f=F_iZsFTuZxt1kQH=A@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 27 Dec 2024 11:12:26 -0700
Message-ID: <CAJdd5GZwku_0yGY0qb82tnmHopj_D9xH=_vYMfPnKtcYuJdz3A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 3/3] bitbake-config-build: add a plugin for
 config fragments
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Dec 2024 18:12:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209105

Ok, I tried it again, and it didn't work for me (or at least, didn't
do what I would have liked). You can set MACHINE and DISTRO in config
fragments, *but* it doesn't affect the machine or distro include in
bitbake.conf. This means you can't really specify MACHINE or DISTRO in
a fragment, or you're likely to get really strange results. You can
see this pretty easily in the environment output; the MACHINE variable
proper may be set to whatever is in the fragment, but the included
machine file is not the one that is specified and thus the actual
machine settings will be really weird (same for DISTRO).

I won't claim to speak for everyone who wants config fragments, but in
my experience, this means that these config fragments aren unlikely to
be able to replace many of the existing tooling that does
configuration (e.g. whisk, kas, et. al). As the number of developers
working on project grows, and you try to build more and more
builds/projects/products (hereafter just called "products") out of the
same repo, it gets increasing difficult to expect users to manage
switching between different products by changing environment variables
and/or local.conf settings. What the existing configuration management
tools have going for them is that they make this very easy; it's just
a single pretty easy to understand system that allows an end user to
exactly replicate the product "as intended" (e.g. you can precisely
replicate the configuration that all other users are using). In the
case of whisk specifically, it's designed such that everything the
user needs to replicate the build is specified by whisk, and
local.conf only needs to have anything in it if they want to change
something for their local build. This has worked extremely well for us
in our use cases, as it's well understood that if you are having
problems, the first step is to see what changes you've made in
local.conf and/or remove them to see if the problem can still be
replicated.

https://github.com/JPEWdev/oe-doom-demo works in a very similar vein,
except it does so without using whisk. The idea is that the user can
set a single environment variable (BUILD_DEVICE) and precisely
replicate the intended build. I would love to be able to do this with
config fragements instead, as like pretty much all the other features
of them, but if I can't set MACHINE and DISTRO, it doesn't really feel
worth it (IMHO).

On Wed, Dec 25, 2024 at 8:33=E2=80=AFAM Joshua Watt <jpewhacker@gmail.com> =
wrote:
>
> Hmm, ok, I'll try again.
>
> On Wed, Dec 25, 2024, 8:29=E2=80=AFAM Alexander Kanavin <alex.kanavin@gma=
il.com> wrote:
>>
>> On Fri, 20 Dec 2024 at 18:39, Joshua Watt <jpewhacker@gmail.com> wrote:
>> > 1) bitbake-config-build is way too aggressive in the files it looks
>> > for as fragments. My editor (vim) creates hidden temporary files that
>> > I kept having to manually delete or the tool would attempt to parse
>> > them and fail. I would recommend that it only consider non-hidden
>> > files that end in .conf as valid fragments.
>> > 2) It would be convenient if `bitbake-config-build enable-fragment`
>> > and `bitbake-config-build disable-fragment` could take more than one
>> > fragment, as this would make scripting in CI more straight forward.
>>
>> I see the patches for these have been sent, thanks.
>>
>> > 3) The biggest problem I had with this is that I can't set variables
>> > like MACHINE/DISTRO etc. in fragments, I think this is due to how
>> > deferred the evaluation of this is. Without being able to do this, I'm
>> > not sure how useful this system will be for me (or at least, it won't
>> > be able to replace any of the current mechanisms I use). I think what
>> > users are generally after here is that they can really easily share a
>> > configuration in source control (which this does well), but if it
>> > can't control everything it's of limited use.
>>
>> I tried this locally with poky and adding DISTRO/MACHINE to one of the
>> selftest fragments, and it works properly, so if you can provide a way
>> to reproduce this problem I'd appreciate. Or there's something else on
>> your side that gets in the way.
>>
>> Here's the output of bitbake -e (DISTRO is similarly adjusted as expecte=
d):
>>
>> #
>> # $MACHINE [3 operations]
>> #   set /srv/storage/alex/yocto/build-64/conf/local.conf:38
>> #     [_defaultval] "qemux86-64"
>> #   set /srv/work/alex/poky/meta/conf/documentation.conf:279
>> #     [doc] "Specifies the target device for which the image is built.
>> You define MACHINE in the conf/local.conf file in the Build
>> Directory."
>> #   set /srv/work/alex/poky/meta-selftest/conf/fragments/test-fragment.c=
onf:5
>> #     "qemuarm"
>> # pre-expansion value:
>> #   "qemuarm"
>> MACHINE=3D"qemuarm"
>>
>> Alex

