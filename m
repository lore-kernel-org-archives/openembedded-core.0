Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66CECCC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 03:40:44 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5342.1792091175086563221
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 12:06:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=coEvpmDP;
 spf=pass (domain: baylibre.com, ip: 209.85.222.171, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93d92abf38dso527597685a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 12:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792091174; x=1792695974; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oeZEM8Z/t+BsglPVm600vo4mwKzIDMH+OIT9C5peO8k=;
        b=coEvpmDPIqVjgJ5t5pA4EtcgjpLS81zPIu1Igm414TJBgIN+QyDgVea67HysBINl3X
         mODHVhsJYFNhHB9t6xRC7dtbc/cXazwYeSRCSCcn8HbaSnVm5UQlHj5CyHpa/HrWevTe
         KE0WxI5e5aZ/HKeWMxS1eAQn13kWrK52p8PKgBgVd/yBwEinN+Z1SW6FG34Hz4ZWXyk7
         an3GnURGGeJnMoWUIXQAlDIzCnxavZXgK42KgW+LwPknuy41cJXgDtGFHlRoz5szTT2A
         0jO7X78Nbf2C56faqmZMD4dW0b5cU6FMlnrmgx/XcHCuif1N36ISNONdOz1ty41Ro0Y7
         0NDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792091174; x=1792695974;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oeZEM8Z/t+BsglPVm600vo4mwKzIDMH+OIT9C5peO8k=;
        b=YUB3AEb5W4o44pifqKdTL5IJG8OccJP7hvjer2HGy0+wW/saVRWCVmjaUy+ezerUDi
         0AdAbvihsUh2PTFXHXLIH/DTvQULIUxMX0U3rUO72qm+kmgguXJjzgyfj9l3Jis5+UPe
         Mn4Lze+JqLxd/llS47xxGxDtBP5DvBnX6zMO3WPparusDBSBqH5WaE7p8B+uHSMgV+w1
         NO/+KJ8IHQmIOcvCbL7C8nqcj3E+9328bP5eScQ3SGWtty/3YET2S7p8G8RW8yPH4q2l
         lMvY3gzAqZIc57Ta/TQbwLdA/KWHdJtJY+AGVE3+kkmBU256pmazZYbMU6pYCZgjSbs5
         +rEA==
X-Forwarded-Encrypted: i=1; AKwUvBw1msElovbsvfTpumMUcpoX5budvvz5A+NP47lrNAijRyaU2Wo3Aguss8UnkvaSHo7yHqyfP4SWAQC23Jycpk7+Qg==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJg19Q16xxr11bxhJE2qHma+TGjf0x3EaKbVNtMOoY+qG1N/3aX
	fbvWnrPCRe5/fSrfjytoCbydN0U/jR02ZhtqPxUTXOjweRRVW8BWaMUp489kjdIfFqk=
X-Gm-Gg: AYBFou3vhKf4Y9/WuuujGcum1wdIVJ18KpgKDTLhCg6HnjMDuOHTbHv6b2tWPtn9gjr
	okub/3FlC5kkI2F+mvda0WHb4n4OjhJFnQufvvfM6LdY0y4N7zYrJyaREzBHkscScwSF9hwOlEg
	Fwxi4KER5uaLIOt89PmSSnmLF/SL7UaKbj426v0+QfLpmG0cLapB3M7xwgBRJgmaWf1ZypaZ57v
	COn9xhWb/GhonhG9OxawTSUXMcHXyNZ+f3Ej+wHCgB/CwqQEVMbdgAjmpb+wSf4LIgG4ihtTFmZ
	G9vllwTdp7smBO04pSHETEGvhh351GZzam909SGfaG+uDvr8+wun6x5Agz/FrpscaOZ+T6NWA44
	uzdB0P3MPt7wapS51ct8G70S7OcHbLY+Tt6h0fQ0YjNuH9DwlMI22x+efsx3VehUHjGzxMyyavf
	ES9b44RAxN7DqHa6gVoA87M6bW0pSlQbtYGpCdOhDjv0q4oCWicgFkFCfel37N+OTwNcBtQYZWJ
	QGPB2Xq3WIuoz8jfytUnzcdAaI+OnY1rw==
X-Received: by 2002:a05:620a:4586:b0:93e:7ec0:7c63 with SMTP id af79cd13be357-93ebd2751d8mr3068861685a.57.1792091173912;
        Thu, 15 Oct 2026 12:06:13 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a0cf974sm9942585a.1.2026.10.15.12.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 12:06:12 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 15 Oct 2026 15:06:11 -0400
Message-Id: <DM5NAUK6FZO1.954AUSXYR7W8@baylibre.com>
To: "Mark Hatle" <mark.hatle@kernel.crashing.org>, "Trevor Gamblin"
 <tgamblin@baylibre.com>, <openembedded-core@lists.openembedded.org>
From: "Trevor Gamblin" <tgamblin@baylibre.com>
Subject: Re: [OE-core][PATCH RFC v2 12/19] meta/lib/oe/tune.py: add riscv_pkgarch()
Cc: <raj.khem@gmail.com>
X-Mailer: aerc 0.22.0
References: <20260930-riscv-tuning-rework-v2-0-9e29f3531d0e@baylibre.com>
 <20260930-riscv-tuning-rework-v2-12-9e29f3531d0e@baylibre.com>
 <effbb186-66cb-4a09-9337-92be41e8f9f3@kernel.crashing.org>
In-Reply-To: <effbb186-66cb-4a09-9337-92be41e8f9f3@kernel.crashing.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 03:40:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247908

On Thu Oct 8, 2026 at 11:26 AM EDT, Mark Hatle wrote:
>
>
> On 9/30/26 11:38 AM, Trevor Gamblin wrote:
>> Create a new function to help match RISC-V ISA extension combinations
>> against recognized profile strings (e.g. 'rva22u64'), so that we can use
>> simpler patterns for naming things like sstate/build paths.
>>=20
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> ---
>>   meta/lib/oe/tune.py | 29 +++++++++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>=20
>> diff --git a/meta/lib/oe/tune.py b/meta/lib/oe/tune.py
>> index 7296f39e66..0d8e4417e7 100644
>> --- a/meta/lib/oe/tune.py
>> +++ b/meta/lib/oe/tune.py
>> @@ -90,3 +90,32 @@ def riscv_isa_to_tune(isa):
>>       # Eliminate duplicates, but preserve the order
>>       feature =3D list(dict.fromkeys(feature))
>>       return ' '.join(feature)
>> +
>> +# riscv_pkgarch(features, exact_pkgarch)
>> +#
>> +# Prefer a RISCV_PROFILES name (plus any extensions enabled on top of i=
t) as the
>> +# package arch fragment, since otherwise the full ISA extension list wi=
ll exceed
>> +# what the sstate class can handle. When several profiles match, the on=
e with
>> +# the most extensions is preferred, as it is the more specific/clearer =
match.
>> +# If there's no clear profile matching the extension list, then fall ba=
ck to
>> +# exact_pkgarch.
>> +def riscv_pkgarch(features, exact_pkgarch):
>> +    if not features:
>> +        return exact_pkgarch
>> +
>> +    current =3D set(features.split())
>> +
>> +    best_match =3D None
>> +    best_features =3D None
>> +    for name in RISCV_PROFILES:
>
> Where is 'RISCV_PROFILES' defined?

It's at the top of this file, although it could make sense to separate it i=
nto
its own text file somewhere else.
>
> As long as someone is willing to keep this up to date with all of the new=
=20
> profiles, I don't have a concern with it.

I had intended this for myself (it seems almost all that I do is RISC-V the=
se
days :)).
>
> On my AMD platforms, we have dynamic (user defined) ISA for our parts, th=
e users=20
> don't really use 'profiles', but select individual isa components.  I wou=
ld LIKE=20
> (but only because it's easier for me) a way to see the ISA and not have i=
t=20
> converted back to a profile.  However, if profiles are the risc-v ISA sta=
ndard,=20
> I'm fine without a way to disable the translation.

That is a good point. I built the profile logic to help with shortening the
build paths, but also so that users who were selecting custom sets might en=
d up
seeing that (for example) their custom extension list was "just" RVA20 plus
vector, or something like that. This would work a lot better if it could do=
 a
comparison and also report subtractive matches, e.g. "your selection matche=
s
RVA22 minus Zfhmin and Zicboz". However, I think there's limited value in a=
dding
a capability like that, and it's out of scope for this series anyway. Maybe=
 it'd
be worth exploring as an add-on for bitbake(-setup) as a NOTE when a build
starts, sometime in the future and if people request it.
>
> --Mark
>
>> +        profile_features =3D set(riscv_isa_to_tune(name).split())
>> +        if profile_features.issubset(current):
>> +            if best_features is None or len(profile_features) > len(bes=
t_features):
>> +                best_match =3D name
>> +                best_features =3D profile_features
>> +
>> +    if best_match is None:
>> +        return exact_pkgarch
>> +
>> +    extra =3D sorted(current - best_features)
>> +    return '_'.join([best_match] + extra)
>>=20



