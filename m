Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.10097.1623144052137773169
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jun 2021 02:20:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C9dgRWAP;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: andrea.adami@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id g20so31531155ejt.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jun 2021 02:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=evbGk3+xYLtch5VsYYEllwJH5URRxAHo7KgBC/66Mcs=;
        b=C9dgRWAPjqwSlT+AfiqquGsMyFI8/6ErH+0AyLqYpiD/DM8AIML0bXe+F8LSV6idCE
         q6mE+Jp1jbudPghZNn7jGPs5Ezk+fuqhuFDsx1E7XOMy5/edKedNJxnvTD/F4/Jv6MAf
         3hQ7dXDBQ7V2is4Ax1tZvzM+nL1fcZzHD8+xf7SyFuL+Q4EvBW8FAW57c3A3yyzStZtr
         IEidAHEYxPsWdPg/Nb4qv0lVfhq9k5HDctKclo84sos9L/OmfV0tdb5+p3YKv105z8WF
         oHjRK2PzfS7nxFwS79CvsNyGkwe3kc8Qzf2HXbyZeEtILA9B18jBHc0AXGMPsBHMKOsg
         bXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=evbGk3+xYLtch5VsYYEllwJH5URRxAHo7KgBC/66Mcs=;
        b=QioNBKn4CLuwHbht8XL1p567c+wTTZvVrA3FNjh3OWFbqvdP7bzFiINduNupdAk9+v
         FdvC7vGJJW/24cci6veeTA002DBit5kyvVdHhfMQfRGTJdHTkk0IwcgfMawzDw+uiPPX
         AqClCsT6D1ly52BYNsh8u8OEBogVirxv2HYfD9Jvjr/jzsqDm50lBG6kAH4klRotvmQk
         aw/+1b7KV2LDFeRVU69VRAwtCUhRoGTzYcfNdusnQoxND3UdLZLt1rayN4tO2AukHD/r
         qKmCpSaAaGnUvdwlAP8GOchHKdrPv2GtU73jV9Qzr0q337/lBSP2Xr8P9Fa4pME6yWOQ
         ouUQ==
X-Gm-Message-State: AOAM532lQmRP+x2GHkSl5KIQpyemx6mHoEXl/nA+Ftu33qr46XxrZmuK
	8DDa+Ctjqf9IpeGYVwgSCfnO0l9jKOt8GRvhQ4I=
X-Google-Smtp-Source: ABdhPJxDfiW7IK3Togi7RK16MUfO3F43IpquQ4xOirDnMlhYimOkS7CgDZixgmFhzIJJDQwvz+bVDi0rSknF1eOocuY=
X-Received: by 2002:a17:906:6d43:: with SMTP id a3mr22566922ejt.142.1623144050542;
 Tue, 08 Jun 2021 02:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210607212558.86624-1-bkylerussell@gmail.com> <01B7D818-661B-4A57-A3DB-C6AC0F0DD217@pbcl.net>
In-Reply-To: <01B7D818-661B-4A57-A3DB-C6AC0F0DD217@pbcl.net>
From: "Andrea Adami" <andrea.adami@gmail.com>
Date: Tue, 8 Jun 2021 11:20:39 +0200
Message-ID: <CAAQYJAsr=Rh-ie=KKrW=QFg=W2OhbTFNaLOKqeq7sxoH_gRB-Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lib: oe: utils: always append host gcc version to NATIVELSBSTRING
To: pb@pbcl.net
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, wesley.lindauer@gmail.com, 
	Kyle Russell <bkylerussell@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 8, 2021 at 12:02 AM Phil Blundell via
lists.openembedded.org <pb=pbcl.net@lists.openembedded.org> wrote:
>
> Wouldn't it be easier to just force -fPIE on for those users for whom this is a problem? Or force -fPIE off for native everywhere. I'm not sure that doing something based on GCC version is obviously the right plan.
>
> p.
>

I was exactly wondering about distro/include/uninative-flags.inc which
at the time was supposed to fix the changes btw ubuntu 16.x and 18.x.
But this doesn't seem included nowhere.

A.A.

>
> On 7 June 2021 22:25:58 BST, bkylerussell@gmail.com wrote:
>>
>> By having multiple uninative feeds based on host gcc version (rather than a
>> single uninative feed for all possible host gcc versions), we avoid a general
>> class of problems (as first observed in the bug below) where changes in native
>> gcc don't cause native sstate to regenerate.  Below is another example where
>> this problem is encountered across multiple supported host distros for a given
>> poky version.
>>
>> gcc 6 supports default generation of PIE, which gets enabled between Ubuntu
>> 16.04 (default gcc 5.4) and 18.04 (default gcc 7.5), both supported distros
>> of warrior.  Consider a native package dependency chain as follows:
>>
>>      A
>>    / | \
>>   B  C  D
>>
>> If a complete set of native sstate for the above packages is built prior
>> to the default PIE change, but a workstation upgrades its distro to a version
>> that natively compiles PIE by default, the sstate hash is not currently tainted,
>> so the newer compiler version will pull from sstate not compiled for PIE.
>>
>> For example, if a source change to C causes part of the above chain to rebuild
>> (C -> A), then this may result in non-PIE sstate (B and D) giving link errors
>> with A.
>>
>> ld: relocation R_X86_64_32 against `.rodata.str1.8' can not be used when making a PIE object; recompile with -fPIC
>> ld: final link failed: Nonrepresentable section on output
>>
>> This appears to have been considered previously as an option to address
>> the following bug, but appears to have been set aside only because of
>> proximity to the end of a release cycle.
>>
>> [YOCTO #10441]
>>
>> Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
>> ________________________________
>>  meta/lib/oe/utils.py | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
>> index a84039f585..8afe19fd99 100644
>> --- a/meta/lib/oe/utils.py
>> +++ b/meta/lib/oe/utils.py
>> @@ -426,7 +426,7 @@ def host_gcc_version(d, taskcontextonly=False):
>>          bb.fatal("Can't get compiler version from %s --version output" % compiler)
>>
>>      version = match.group(1)
>> -    return "-%s" % version if version in ("4.8", "4.9") else ""
>> +    return "-%s" % version
>>
>>
>>  def get_multilib_datastore(variant, d):
>
>
> --
> Sent from my Android device with K-9 Mail. Please excuse my brevity.
>
> 
>
