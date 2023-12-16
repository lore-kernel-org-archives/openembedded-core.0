Return-Path: <mattwood2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4565EC41535
	for <webhook@archiver.kernel.org>; Sat, 16 Dec 2023 21:42:53 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.4701.1702762962986803904
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Dec 2023 13:42:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Am56YW9M;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: mattwood2000@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4259295ca72so16459651cf.1
        for <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 13:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702762962; x=1703367762; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zHWL9zddC1FvJ6PIbcV/ouIvW+kN5l4KidOXT4dX8h4=;
        b=Am56YW9MmFtErWAzrwOWPCFgBod0Rlz+VuZePvJaupxIxtV9lQ4v94buxixubR0sUl
         jurXeeEFk7ZIygcDVWhwnZENxhJuLapCrAlpL5LRrsyGFivDXPZUnTjQcHZlsUpq49ux
         7heL9XQFepORPTpMNXX7GNOQLQX4AXkvf3sXWScWMqqCcFXN7FkxbcyRaBMIkPpipa8D
         YUEw3Wt7gHoGyxzgOnXnWdmX5i//ChcpCO4V1Q1EDBlkdaW8ZVHhX3DLCTz2CD+uDoHV
         V6FLEJk1isLvtnNT7s7xipsP/O/Png0WBtD18kTUnfdLHFjRnYBNnp2mIdUZJMMN9DfM
         HTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702762962; x=1703367762;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zHWL9zddC1FvJ6PIbcV/ouIvW+kN5l4KidOXT4dX8h4=;
        b=McRbsPvDErvwJFOEaBoFPNdtiZxBKZUiXnaQppYvdeoAp9cCNGUbDbaPz4k5jV6AD3
         6uxFnuvBnJoKxN8T2GanZFHWnc7iwAvOAiMD3IAAobdD087V8uUNNF3vt9qnZWJ/NW4C
         QWbCjnlKuYcoS0KMl2f34ZW7LQ+FcLqAY9M+Z3uT/IPMTm1+lVyNRYueFuqcf7g6uyyi
         XQbP9LZbYJ0QosKPhPNLNZguT6WQA0ab0fcvDxV9t8HOtb/s2lKU95dPj/TwnDGCGJvz
         gg+XtzyHqYdkQT59a6P4swEtogY9NguSeEKZHm309djyT8gv0BTNA1/2uG0Bx3Tlfsqw
         J25w==
X-Gm-Message-State: AOJu0YwpnDhIQf2SlFltj5RzUtzdMn4pzz34xe8SCTqPVVekkX4jppq2
	VVSsFdNGw19O+jR+Hfl8OtE=
X-Google-Smtp-Source: AGHT+IEG2hTZK1jtWgsdcXqGLSrgvj0JAPtZfZt7MYncNSIaE9ImAf2z6q8EiGFHBXlHgw3jVUlHsg==
X-Received: by 2002:a05:622a:341:b0:425:a60b:4d94 with SMTP id r1-20020a05622a034100b00425a60b4d94mr19387830qtw.21.1702762961952;
        Sat, 16 Dec 2023 13:42:41 -0800 (PST)
Received: from [192.168.1.225] (pool-71-184-206-202.bstnma.fios.verizon.net. [71.184.206.202])
        by smtp.gmail.com with ESMTPSA id k11-20020ac8604b000000b00425615e0df5sm7823556qtm.34.2023.12.16.13.42.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Dec 2023 13:42:41 -0800 (PST)
Message-ID: <81df8e01-1431-4a9d-b478-4256f70fd555@gmail.com>
Date: Sat, 16 Dec 2023 16:42:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] mdns on musl
Content-Language: en-US
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <CADjezmaJ2RDnRc0S34iMMrY+-Ey2zqZ59s_qLXGYBCJu5art5Q@mail.gmail.com>
 <CAMKF1souVOjHqkd15+FX3NMGvggFFrhhR9nGs-BN53Y=yzYbSw@mail.gmail.com>
 <CANx9H-Cts0d7vRqaKSW4rPk__4=iEOG7pffaoUQBFn6mWDfWwQ@mail.gmail.com>
From: Matt Wood <mattwood2000@gmail.com>
In-Reply-To: <CANx9H-Cts0d7vRqaKSW4rPk__4=iEOG7pffaoUQBFn6mWDfWwQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 21:42:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192571

This is a fundamental issue with musl:
https://wiki.musl-libc.org/future-ideas

I thought there was a solution using the mdns package (mDNSResponder from Apple), but I could be misinterpreting what I have read.

I saw a go implementation of avahi2dns, but this is for an initramfs so trying to keep things small.

I'll keep looking around but if anyone else has any suggestions I'd appreciate it.

Thanks, Matt

On 12/16/23 15:42, Tim Orling wrote:
> 
> On Sat, Dec 16, 2023 at 12:16 PM Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>> wrote:
> 
>     is this issue specific to musl systems?
>     Maybe try to reproduce it with glibc on qemu or something?
> 
> 
> You might also search for mdns issues/solutions in Alpine Linux which is always musl.
> 
> 
>     On Sat, Dec 16, 2023 at 9:11 AM <mattwood2000@gmail.com <mailto:mattwood2000@gmail.com>> wrote:
>     >
>     > Hi all,
>     >
>     > I'm working on an embedded system and it needs mDNS in order to interact with .local hostnames.
>     >
>     > The image is based on musl so it cannot use the libnss-mdns library.
>     >
>     > From what I've read the mdns recipe is supposed to support mDNS on non-glibc systems.
>     >
>     > The recipe takes care of modifying /etc/nsswitch.conf and appends mdns to the hosts line.
>     >
>     > When the system boots it runs mdnsd and I can see it join the multicast group in wireshark, but I cannot ping any .local addresses.
>     >
>     > Is there some other configuration that needs to be done?
>     >
>     > Has anyone successfully done this with a musl system?
>     >
>     > Thanks, Matt.
>     >
>     >
>     >
>     >
>     >
> 
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#192569): https://lists.openembedded.org/g/openembedded-core/message/192569 <https://lists.openembedded.org/g/openembedded-core/message/192569>
>     Mute This Topic: https://lists.openembedded.org/mt/103211493/924729 <https://lists.openembedded.org/mt/103211493/924729>
>     Group Owner: openembedded-core+owner@lists.openembedded.org <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub <https://lists.openembedded.org/g/openembedded-core/unsub> [ticotimo@gmail.com <mailto:ticotimo@gmail.com>]
>     -=-=-=-=-=-=-=-=-=-=-=-
> 


