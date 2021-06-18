Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web12.14727.1624054470172978205
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Jun 2021 15:14:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y4KVG4kT;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id d196so14547135qkg.12
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Jun 2021 15:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dE4PzaV8czQzMxcxbziR3q35IW3sE1qV3i8BgGkIMQ4=;
        b=Y4KVG4kT0rebEzcoeyzJisOZLTmhIQWw6876xfM/aXY7Bo1pgvhmdyS4nI+GUVp+dq
         uYGuTLelErCA3n728umImxsJtwC1YCxh1/YnXg721xLcNbZh98CT9hHWE34rX5y6ozUw
         ZK17BuRbfYavpkAbV7WhuZVqFgCpdZVtxm4WIrJc+5Jdjhbzad4VX/5kI1lYE9+Xpe7t
         unE2Hz6Iwa76CnQ9SSTGLwuGDsF61MVoK/EWU5rQd4zHur36qWWACyrJ9jNG8+/aDAJ4
         4ukOqUhhTMKs4Gr4xuB510isVCdFHOqfDDyuRCjX+CPle85Sk1Va1VChCoh7ymuyclzC
         uprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dE4PzaV8czQzMxcxbziR3q35IW3sE1qV3i8BgGkIMQ4=;
        b=kQfvM6R/DhPoUrSCkXdOxZeCUSElC2ceRNjgv1m9TR5B4S92+8p4flPSxfuNWTduDZ
         IDLDoxn0m7bjIEB9yel2SuleA6ldSeYJ25LbDZTATzprYlymK8CR/U5xyc3laKz7vbuQ
         aoBF8uU9Yux+kVxa6heDYbsYo/oJamkv/jueiNOT2T6yOY3/yjoLEnki90FC/DGQuXnM
         Zx+qw+sxX5I3FDvnhAiRRO6gn+5rpkPxCKfXx3amMSsJ2wkcpPrDvPsHjg4WLoMn8tdX
         PGL2OGlq/TiR2HKC6+8yeOjAWmf9UYYzpcaZeneAO//TG06WojJU2eqbjD4sz+PEQejS
         TA1Q==
X-Gm-Message-State: AOAM533GYBvOMorDf9hMfAIDqt2kL/6rpcJRZM3Lw1UFFmM/1Rjt0TtF
	aXbFF0mBUaSU7I4+AB5jDdHWYBNXcvYYJfTUrN0=
X-Google-Smtp-Source: ABdhPJzFOM8BkRFZBixDvXBYrqeDgac86xPuDYxoD1ioONhfGkqGIGARZ9M85BpkZPmu4dtyuC3+EZOfNcaf2TQM/lQ=
X-Received: by 2002:a05:620a:12e8:: with SMTP id f8mr11538300qkl.125.1624054468815;
 Fri, 18 Jun 2021 15:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <1688B34361FD8BD3.6379@lists.openembedded.org> <16890800366CFBBE.20493@lists.openembedded.org>
 <1689153CED767CA8.15085@lists.openembedded.org> <CANNYZj-dOgJrNXNkTgT144RcdgGn4fDdoR47URAuSZzUTghefA@mail.gmail.com>
In-Reply-To: <CANNYZj-dOgJrNXNkTgT144RcdgGn4fDdoR47URAuSZzUTghefA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 18 Jun 2021 15:14:02 -0700
Message-ID: <CAMKF1sr-FSHjibWVqsdaMOPPzeso3e6a+DKB0pRbnw8CJ0T4zg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/31] core-image-weston: bump QB_MEM to 1G in qemuarm64
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton <ross.burton@arm.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I think we should disable this by default, its a good feature during
development though to catch memory bugs. So please turn it into a
PACKAGECONFIG which is disabled
by default instead of revert.

On Fri, Jun 18, 2021 at 1:49 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Sadly, I can confirm: weston swelling to double size on qemuarm64 is caused by this recent change in glibc:
>
> +EXTRA_OECONF_append_aarch64 = " --enable-memory-tagging"
>
> You can verify with this innocent looking program. Run 'free' while it is running and compare with and without tagging:
>
> main()
> {
>    for (int i=0; i<768; i++)
>        calloc(1,262368);
>    sleep(200);
> }
>
> I'll queue a revert.
>
> Alex
>
> On Wed, 16 Jun 2021 at 16:08, Alexander Kanavin via lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org> wrote:
>>
>> It seems that mesa, for some reason, allocates a lot more RAM in qemuarm64 (150 Mb more or so), than it does in qemux86_64. I'll investigate.
>>
>> Alex
>>
>> On Wed, 16 Jun 2021 at 12:06, Alexander Kanavin via lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org> wrote:
>>>
>>> I'd like to take a deeper look at this, please hold.
>>>
>>> Alex
>>>
>>> On Tue, 15 Jun 2021 at 10:12, Alexander Kanavin via lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org> wrote:
>>>>
>>>> weston tests start additional compositors, other tests are also
>>>> heavy on RAM, weston itself takes 256M with opengl enabled,
>>>> so 512M causes OOM errors on arm64.
>>>>
>>>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>>>> ---
>>>>  meta/recipes-graphics/images/core-image-weston.bb | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/meta/recipes-graphics/images/core-image-weston.bb b/meta/recipes-graphics/images/core-image-weston.bb
>>>> index 62305cc1ce..e332e19368 100644
>>>> --- a/meta/recipes-graphics/images/core-image-weston.bb
>>>> +++ b/meta/recipes-graphics/images/core-image-weston.bb
>>>> @@ -10,3 +10,4 @@ CORE_IMAGE_BASE_INSTALL += "gtk+3-demo"
>>>>  CORE_IMAGE_BASE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'weston-xwayland matchbox-terminal', '', d)}"
>>>>
>>>>  QB_MEM = "-m 512"
>>>> +QB_MEM_qemuarm64 = "-m 1024"
>>>> --
>>>> 2.31.1
>>>>
>>>>
>>>>
>>>>
>>>
>>>
>>>
>>
>> 
>>
