Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59910C433F5
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 17:44:19 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.9054.1636134258133179373
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 10:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FBgcl8UU;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id m14so34955111edd.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 10:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Px0uvO/iVEwwdjouPh2UjOGKnblVYab7PGK3ZL6UulU=;
        b=FBgcl8UU6Od7NMvIlTFa1EwX9bIRIAyzBsZf2gJtTXiRQCIInBFi5HgF6GtB9Mu9CV
         6aN83gSYrhJhIpYZXrKxkXD/CRgwZSy6Tuex5HabOGwxfrCU4aus5OflekoEV0rr2w1+
         UTOFrN8pm5BnhAOgv+zH3g6EA7abaHYWcjeXzOyOJT6lOGuXli4XZpKm3udMrDOcjEJw
         hiVNrCOkVUkSG6rPsqEY/cY9mAuZ+eX0RaqfTqJu1xWGD4abqcFctcY1l/g3KiQeqOpZ
         CgTT+xadmhlBWdYIee+L5ixwz5WloTqhBVG7Es8liXkf50heddBaHHMIQTtc6cotwOot
         DoNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Px0uvO/iVEwwdjouPh2UjOGKnblVYab7PGK3ZL6UulU=;
        b=iNYaxF2yeLAHxmanjOgQvqA4eOfcn5yMkEckVOwr+3sZ8QfJP/gONDVSUJqPT1IjFV
         TvLZ91ydBZ8mpzSOU8t0sc9YrpmYevn8BZZiqbzas6sqhICnnh9Z8SiKDic0wCJzSxii
         tFS6vhjLFy4HAiT0hM0jIqP573fEMoGRjfzxghAXsHF79hOJFodR6SJ+QldVq34qMGy0
         2zWPf/OvshObsn/Gh3Obig/k5EZW7SC+UkM5sKcReRri3pSqG09509ZYjSJFPtJUREpb
         6ifAELtQvlkS2qiCvlJ2/tu//kXc0OHcmmTih0J66kyzlrbqHkVbn6h3HDAmk9Q5h6vR
         SK+A==
X-Gm-Message-State: AOAM5313fO0St4f8Ph8rleKHlGHld6hAMwmZmNPirUF56URLWnV1FBRW
	fCabh51rhAhM9dPxdmb4fVyvKUvBNw3vQGZhB3E=
X-Google-Smtp-Source: 
 ABdhPJzeYgI/YONN7BGijL86v6HvQW6mbqtc2Pd+WnVLg/+8MMzAcw4GF/tVXXA2UtyNn2meREjI+YySxWu3XjlTcwo=
X-Received: by 2002:a05:6402:5161:: with SMTP id
 d1mr60936509ede.385.1636134256278;
 Fri, 05 Nov 2021 10:44:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1636054726.git.bruce.ashfield@gmail.com>
 <57d58cf2b9094e474cf01c17e475b0526ee969d8.1636054726.git.bruce.ashfield@gmail.com>
 <c13e0bd91696d38e2a42292f2098324591a6a6d0.camel@linuxfoundation.org>
 <CADkTA4PcSaeCTNOhencoQzydgcMfRByQYMOvq06=idJVirGm7Q@mail.gmail.com>
 <CAMKF1soD0m7QB3Yn3dSK1FZRUPiQ=BWQdmMFgjXn-2XgZN=Efw@mail.gmail.com>
 <CADkTA4OOUvBoNuwrzzeS0o4xDzf8EqsTujN8uT_FZetk0x=ZBg@mail.gmail.com>
 <cb13b04a-5f9a-6220-61b9-1561f3f9fe09@gmail.com>
In-Reply-To: <cb13b04a-5f9a-6220-61b9-1561f3f9fe09@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 5 Nov 2021 13:44:05 -0400
Message-ID: 
 <CADkTA4O6-0absYZSa+tsq8_xWjA1pFVM2iOZiVTXqewxW4MyyQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] linux-libc-headers: update to v5.15
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Nov 2021 17:44:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157921

On Fri, Nov 5, 2021 at 1:38 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 11/5/21 10:37 AM, Bruce Ashfield wrote:
> > On Fri, Nov 5, 2021 at 1:08 PM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> Couple of failures in meta-openembedded not too bad
> >>
> >> https://errors.yoctoproject.org/Errors/Build/135189/
> >
> > I'll have a look!
> >
> > Doesn't look ipx related, so another removal perhaps.
> >
> > Let me know if you are fixing it, just to save duplicated effort.
>
> I am looking at mctp you can look into sdbus-c++

Sounds good. likely the same root cause (I see mctp in the sdbus one
as well), they unified the structures in the kernel ... hopefully the
upstream for the packages have updated.

Bruce

>
> >
> > Bruce
> >
> >>
> >> On Fri, Nov 5, 2021 at 5:46 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >>>
> >>> On Fri, Nov 5, 2021 at 7:18 AM Richard Purdie
> >>> <richard.purdie@linuxfoundation.org> wrote:
> >>>>
> >>>> On Thu, 2021-11-04 at 15:48 -0400, bruce.ashfield@gmail.com wrote:
> >>>>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >>>>>
> >>>>> No patches needed refreshing or removal, so we just update the
> >>>>> SRC_URI and pick up the latest uapi / kernel headers.
> >>>>>
> >>>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> >>>>> ---
> >>>>>   meta/conf/distro/include/tcmode-default.inc                   | 2 +-
> >>>>>   ...{linux-libc-headers_5.14.bb => linux-libc-headers_5.15.bb} | 4 ++--
> >>>>>   2 files changed, 3 insertions(+), 3 deletions(-)
> >>>>>   rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_5.14.bb => linux-libc-headers_5.15.bb} (81%)
> >>>>>
> >>>>> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> >>>>> index 58f49800c4..86a6b50433 100644
> >>>>> --- a/meta/conf/distro/include/tcmode-default.inc
> >>>>> +++ b/meta/conf/distro/include/tcmode-default.inc
> >>>>> @@ -21,7 +21,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
> >>>>>   BINUVERSION ?= "2.37%"
> >>>>>   GDBVERSION ?= "10.%"
> >>>>>   GLIBCVERSION ?= "2.34"
> >>>>> -LINUXLIBCVERSION ?= "5.14%"
> >>>>> +LINUXLIBCVERSION ?= "5.15%"
> >>>>>   QEMUVERSION ?= "6.1%"
> >>>>>   GOVERSION ?= "1.16%"
> >>>>>   # This can not use wildcards like 8.0.% since it is also used in mesa to denote
> >>>>> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.14.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.15.bb
> >>>>> similarity index 81%
> >>>>> rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.14.bb
> >>>>> rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.15.bb
> >>>>> index 282c04d79c..588cc3acd1 100644
> >>>>> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.14.bb
> >>>>> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.15.bb
> >>>>> @@ -14,7 +14,7 @@ SRC_URI:append = "\
> >>>>>
> >>>>>   LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
> >>>>>
> >>>>> -SRC_URI[md5sum] = "a082ef5748b813abca0649dab8be5f52"
> >>>>> -SRC_URI[sha256sum] = "7e068b5e0d26a62b10e5320b25dce57588cbbc6f781c090442138c9c9c3271b2"
> >>>>> +SRC_URI[md5sum] = "071d49ff4e020d58c04f9f3f76d3b594"
> >>>>> +SRC_URI[sha256sum] = "57b2cf6991910e3b67a1b3490022e8a0674b6965c74c12da1e99d138d1991ee8"
> >>>>>
> >>>>>
> >>>>
> >>>> Looks like there is a musl issue with the ipx.h header in ppp:
> >>>>
> >>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/4299
> >>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/4313
> >>>
> >>> ahah. Something my a-quick build didn't hit.
> >>>
> >>> I'll fire up a build here and see how we work around ipx.h going away.
> >>>
> >>> Bruce
> >>>
> >>>>
> >>>> Cheers,
> >>>>
> >>>> Richard
> >>>>
> >>>>
> >>>>
> >>>>
> >>>
> >>>
> >>> --
> >>> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >>> thee at its end
> >>> - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

