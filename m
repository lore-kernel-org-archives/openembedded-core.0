Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.1619.1596608290793209683
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2020 23:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q9pc3Ssi;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id 77so8426448qkm.5
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2020 23:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TRmfapmCJR9kjmHTWXCu5AgiCM3zhbdJ7rhJdCdBhBM=;
        b=q9pc3SsiRPelV2D++rwrYkkZxcqGYR1+Saj5FcUnkpLOOlQd39af4MDBOoi+h4rvfg
         X794CB92si4xCre71vSNIG3FHZPLHSmwO9Sx3vqZzrUrr8bZH7vSNtya72MS6m+QVcTL
         itDuRESwCvdDlmhiYks4WEe1nIKpL5K9UK4hMNiJlLszvfWUFAibqbCx5nHNymJjOKj1
         5PjtWutRK8O4ZIOnntYAFz9khGp/2OlzuOA80V/IE+PFTsRjLbUKaKw1yB+11N0tEzjS
         9XI+ykMMl3UeDbeHL7tntICM91WasEBFZN+ZfZQlki8NJ9epsXVZW7NDJkw7gJQ4/DMf
         nWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TRmfapmCJR9kjmHTWXCu5AgiCM3zhbdJ7rhJdCdBhBM=;
        b=F74cmNsTnBi4vXwolUSuKjesT3p9kiqg5HKlnc/w2cu7hnBzX8o/RxYj69U6YFi8uX
         S15Ptenp/3H7GcbVShJfTTQDkgLRaFJiVSO8Z5AwWDgIdxPSlNpd/n3lAs76S4WPkOSB
         XiFeavMVECc+iV1LIum8djEqvuXXGrFznZLTVPV+jBVU+EnP1wrNnh00sAlLBAT9BlTk
         Y8lOg3+o2lR380my1Ko1LeKzzClXCi0cIOEpQwX6stu1s/Mld52q9dqOgJFPbwrtHnA9
         WGiXfhVHgrfOU954E5xBw6xevleoGm2XRRi7Es+3CFRNeq0Ud3wlGyfTESlC/P1TZOsj
         gSfw==
X-Gm-Message-State: AOAM531qUyXU7gaMizviIzNVWdxc4PraF1ekJRhy35yQK3Yzkvz4LC4K
	aHBqd4WKHcGZzy5XCpV0u7/6EZDeiScgfwjTTEM=
X-Google-Smtp-Source: ABdhPJwewjW8PnUjvfcQ73s06QRf9S3F9yra9lMdlIZk+/DJJUD/4EZB87MYoMMInO1yRphniiqIg9ot1TxZ9Zva/IA=
X-Received: by 2002:a37:9d0d:: with SMTP id g13mr1775943qke.165.1596608289869;
 Tue, 04 Aug 2020 23:18:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200804082019.76320-1-jacob.kroon@gmail.com> <CAMKF1soyMVB0jpLRA0v8WnCMaJ8DHf=id0xyvdoJ+78CL=UKwA@mail.gmail.com>
 <9e59ca1e-26f3-08a2-d43d-c4d4545d031a@gmail.com> <CAMKF1srkVAXV4NS7xL2mA+D8z7v4x612qjFG_0H_XFmvG3tx3A@mail.gmail.com>
In-Reply-To: <CAMKF1srkVAXV4NS7xL2mA+D8z7v4x612qjFG_0H_XFmvG3tx3A@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 4 Aug 2020 23:17:43 -0700
Message-ID: <CAMKF1sonGf4BT-XtktYVO02MtO_XA_SN_8N55WjjKgKafUPXJA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc10: Don't default back to -fcommon
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

here is a recent build with clang11 which also switched to using
-fno-common and errors are pretty much same you will see with gcc10
with this patch to revert the -fcommon defaults.

https://errors.yoctoproject.org/Errors/Build/107234/?limit=100

I was waiting for upstream packages to get fixed before switching the
defaults back to -fno-common.

On Tue, Aug 4, 2020 at 11:00 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On Tue, Aug 4, 2020 at 10:05 PM Jacob Kroon <jacob.kroon@gmail.com> wrote:
>>
>> On 8/5/20 2:14 AM, Khem Raj wrote:
>> > On Tue, Aug 4, 2020 at 1:20 AM Jacob Kroon <jacob.kroon@gmail.com> wrote:
>> >>
>> >> It has been almost 3 months since the upgrade to gcc 10. Switch back to
>> >> relying on gcc default configuration (-fno-common).
>> >>
>> >
>> > have you done a world build with this? In core+meta-oe I still see 70+
>> > recipes failing
>> > what will be good is if people start sending fixes before switching
>> > the defaults.
>> >
>>
>> Ah, that I haven't, only the images I use. Is there a list of failing
>> recipes available somewhere ?
>
>
> I think I posted the list when I submitted the gcc10 upgrade but this patch is already in master-next so Richard will soon share the Oe-core list atleast
>>
>>
>>
>> Jacob
