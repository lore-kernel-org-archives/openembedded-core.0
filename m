Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E28D4C433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 03:00:44 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web12.6312.1647313243904561512
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 20:00:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ci1FmqLj;
 spf=pass (domain: gmail.com, ip: 209.85.222.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id b189so171714qkf.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 20:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i+rYZHw37WMiKkH9kZafosRnDMp5+Egpz0UCc038naw=;
        b=Ci1FmqLjbPAhE02fk8b1P7rXZgnFHsmerrEgas7zz2AXowtJdkoj5zE7p46Ipko/r7
         fMW37gH2yy77MSuuBR23d4T3R+/XSHNbWmTWGEAGcuYbCUanu3FapOoVGkcZmO//DFPt
         1fVEYgtOj93D+jvSMRbTjjI9wkyaGbEqoLnaWF3oLS3VNPso8YeMt9LWYfqRITdNhDt7
         rctFEkII+CyCfb4tcrosKrkFCPW02+gnaCG+2hT2z8YWCRXIUbNV5slSrdsU+B8iHG4g
         l/ztQJzVokg4f1qhY5wGPxVLVbcPwdWSO7B/XfKzxTTkw/MFu20u+7NOGZSOyv6SZU9v
         4Ubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i+rYZHw37WMiKkH9kZafosRnDMp5+Egpz0UCc038naw=;
        b=0oMyvwAypq7uKlJtzBxBUOt/+nzz/RNG/gqgyZn2q+LZuuvypZKSiICUjqvqVcOep4
         2FORstO+B0Y/+viAgfKZuGJ/4DGqwnsQPNWhrXjAlzND7HLiBe+GrjDrJn8a03qNIl3M
         lNVRM/mMHnXcq9hJPHeV4lw5z7NEcffK1xYAQpPBQY7bho0tzgfdKaZgp7DV/aqs9wDd
         5ZmLnPqNDgIkz0ho6gzqgitv0J8D0UiNUJrTux2i1AasknJm7Hp5O8tdocrGRvHC+Ifs
         2kG1WK3dwouI++ajFIKntHYZGcLij+uG2mHq98384Qn88VoSMHoYlFqCwiQrxLKNb3H/
         BQbA==
X-Gm-Message-State: AOAM532z2+N0FOcT1HC9yclU5Ny4Id2J02Y6KTBJId0gwOpoPiHEn86g
	kLYVjQJ9/rycUX2+Semdpg399aakp1IsMwSpaL0=
X-Google-Smtp-Source: 
 ABdhPJwaXBHQY1ux0L8bQV6581pP8BVMO8+6Dqa/T5rUV+X92ixGMWOxd3TULLu5/79psch1lAk5bSetGZwhrW1qTrg=
X-Received: by 2002:a05:620a:4103:b0:67b:49f4:3ee4 with SMTP id
 j3-20020a05620a410300b0067b49f43ee4mr17441972qko.72.1647313242977; Mon, 14
 Mar 2022 20:00:42 -0700 (PDT)
MIME-Version: 1.0
References: <16DC60EA44823A9F.11325@lists.openembedded.org>
 <426ed1452a5cc0c052c0218ce4865bf935e4aac1.camel@linuxfoundation.org>
 <CAMKF1soQUjMeTOvKdfXQYjO93f5ZSx3MKAxhsJLO05dcgdDZ-Q@mail.gmail.com>
 <CANx9H-Co3tLC_7X7hw-E_8cDJ=-Zwtd3rtD5M8f1o6WbMGmBBw@mail.gmail.com>
 <CAMKF1soRb2L1y+gB9NnS42VWkaho=UfVtsYmNLRKUXhsuCE9dQ@mail.gmail.com>
 <CANx9H-DzYPGkXk7HBuzuGQnusu6OPSN=iiGkJBsGf3U5L75Cig@mail.gmail.com>
In-Reply-To: 
 <CANx9H-DzYPGkXk7HBuzuGQnusu6OPSN=iiGkJBsGf3U5L75Cig@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Mar 2022 20:00:17 -0700
Message-ID: 
 <CAMKF1sqYLGmdMPWE76in9dFLXVYyBEf86n2HCexv9DfT-PnFBA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/33] Add python3-cryptography from meta-oe
To: Tim Orling <ticotimo@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
 Tim Orling <tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 03:00:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163223

On Mon, Mar 14, 2022 at 7:56 PM Tim Orling <ticotimo@gmail.com> wrote:
>
>
>
> On Mon, Mar 14, 2022 at 6:38 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On Mon, Mar 14, 2022 at 5:15 PM Tim Orling <ticotimo@gmail.com> wrote:
>>>
>>>
>>>
>>> On Mon, Mar 14, 2022 at 5:10 PM Khem Raj <raj.khem@gmail.com> wrote:
>>>>
>>>> we need to remove all of them from meta-python too.
>>>
>>>
>>> Alejandro sent a patch for that, no?
>>
>>
>> Yes but it was not
>> Comprehensive I have staged couple of more removals which were missed see master-next however I just want to say that someone should ensure that the move is clean
>>
> Ok. It was hard to review the mega mono patch. I will take another look in the morning for thoroughness.
>

Thanks, just ensure that there are no duplicates left in meta-python,
since the oe-core changes might have gone through revisions, there
might be more recipes or less recipes
moving to core. Just make sure the meta-python patch is in sync, its
currently staged in master-next

>>
>>
>>>>
>>>> On Mon, Mar 14, 2022 at 3:54 PM Richard Purdie
>>>> <richard.purdie@linuxfoundation.org> wrote:
>>>> >
>>>> > It is late in the cycle but is has become apparent that the dependencies we're
>>>> > weaving with layers and meta-arm was reaching a point where it wasn't working
>>>> > well for anyone. BSPs and hardware layers needing to pull in meta-oe/meta-python
>>>> > isn't a good situation. Whilst late, it does seem better to sort this now before
>>>> > the LTS ships rather than live with it for much longer.
>>>> >
>>>> > This series brings in python3-cryptography and it's dependencies to OE-Core,
>>>> > bringing everything to the standard needed (maintainers entries, homepages,
>>>> > reproducibility), tweaks to match the recent python changes and some ptest
>>>> > fixes.
>>>> >
>>>> > It also namespaces the classes with a python_ prefix since this makes it much
>>>> > more obvious in core what area of the system the classes belong to.
>>>> >
>>>> > Cheers,
>>>> >
>>>> > Richard
>>>> >
>>>> >
>>>> >
>>>> >
>>>> >
>>>> >
>>>> >
>>>> >
>>>>
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#163218): https://lists.openembedded.org/g/openembedded-core/message/163218
>>>> Mute This Topic: https://lists.openembedded.org/mt/89786369/924729
>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ticotimo@gmail.com]
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>

