Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF096C001DF
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 13:52:58 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.55031.1697809969714584480
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 06:52:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LpNCIAFs;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.41, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-53e08b60febso1247854a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 06:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697809968; x=1698414768; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BKzLaPIlDwTd37aWX3dXTwTDdemfLOmbS7qv/mPprZ0=;
        b=LpNCIAFs8sNbkQY0hgTPStZKP6cwwzQPNlsjBdaBQ5nlHxGIKnnSlTA/AFr40vch9x
         ukJIWa2KgsAYLlUBId3e46MX88FsdVJJEil8fyEmZfChSx0YdFwBcaxRyjThyHg2G8mb
         VaDQ6tNuWuZGuY9OrpjQl4/EIIS3VlOrCL4auEGFd7W/nHSUs6n7GdmBz5+seOenDVhB
         sRbDY8l79KETBvGBxwbA/+gDWXfW8HTOqtXSWolM2RxdruGpf+Hmkfjk1MzXcO35RCgs
         2A8hSilS4oMKJGwFlutpVEnEffOAi2OwzRLly83T9wrl4/2K1CaeXNz7Vei9PTZL+w7Y
         c95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697809968; x=1698414768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BKzLaPIlDwTd37aWX3dXTwTDdemfLOmbS7qv/mPprZ0=;
        b=Od7oiLSNgHi4jIax76+6s7aPyeieE+XHkKK5lyScxi2Iv1SyJdjuwdQEHFZ9ncv2t9
         q+ssE+kSaJBX7foAAPtFssYcp5D0l4SEtGeu4THSUVzSsR9oXXHO9U/bAqZU4sxWeiCf
         +FC3/iLGRhoGgRlGSKEEi3j1ZvuO3erSWDsIgNTKL+JjV0CNAtf0UBbfBW/wNAY+/8d9
         6psj0fHkGfS5AXa/ME9tTHhgHgsOWQDdPKi/D5gkO6JFkTnLRC0KCvpmAWm5RHKnOQ62
         u+Ha/4S5lN3JtKqU4vVH32E+82KyOJFxIIjZDwxlXJM9m38bGGzxO60zSHe6bGS7SSqr
         HbVg==
X-Gm-Message-State: AOJu0YwALARJe/jQsYSA9rUX/ryV+uDnJSDivuSSRmpRpXHKwDiPUrIA
	OKmviHZSB+6uO28UE2SEtAqB78OS6khNzKgFlJyDJlAHGh0opJVz
X-Google-Smtp-Source: AGHT+IEyhf/IEkFNkf5QNqZTjSJTawtrnVGamLyU2ZWuYQ6AmzM07+uVsbBWma6ogm6XGpkQ5TK0wkaRKLXV+tKdv9Y=
X-Received: by 2002:a17:907:720f:b0:9be:e6d4:575a with SMTP id
 dr15-20020a170907720f00b009bee6d4575amr1472560ejc.13.1697809967889; Fri, 20
 Oct 2023 06:52:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1soFcxfbe04ptQ48oKrcMYtS9UMoauqX3KbN2VF98seuMw@mail.gmail.com>
 <19195.1697717816202918718@lists.openembedded.org> <CAMKF1sq4pvaaSFUTpMUCsiSu8rVar3uYsuzW8v9RrH+PqaTJcw@mail.gmail.com>
In-Reply-To: <CAMKF1sq4pvaaSFUTpMUCsiSu8rVar3uYsuzW8v9RrH+PqaTJcw@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 20 Oct 2023 03:52:36 -1000
Message-ID: <CAOSpxdZOAbBWeXaLg_y3fyGWpbB3tgoq73kbOVPPpA+3eZfVRw@mail.gmail.com>
Subject: Re: [OE-core] [mickledore] glibc: stable 2.37 branch updates.
To: Khem Raj <raj.khem@gmail.com>
Cc: Sanjana.Venkatesh@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 13:52:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189534

On Thu, Oct 19, 2023 at 1:02=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
>
>
> On Thu, Oct 19, 2023 at 5:16 AM Sanjana.Venkatesh via lists.openembedded.=
org <Sanjana.Venkatesh=3Dwindriver.com@lists.openembedded.org> wrote:
>>
>> Hi Khem,
>>
>> We tried increasing the memory and no regression failures were found.
>>
>
>
> Thanks for following up
>
> Steve
>
> We can cherry pick this for mickledore I think now

Done!

Steve

>
>> Here is the test results:
>>
>> Regression testing is done and below are the test results.
>> Before glibc update
>> Summary of test results:
>> PASS:4727
>> FAIL:240
>> XPASS:4
>> XFAIL:16
>> UNSUPPORTED:220
>>
>> After glibc update
>> Summary of test results:
>> PASS:4733
>> FAIL:235
>> XPASS:4
>> XFAIL:16
>> UNSUPPORTED:221
>>
>> These are the newly added test cases
>> PASS: io/tst-fcntl-lock-lfs
>> UNSUPPORTED: nss/mtrace-tst-nss-gai-hv2-canonname
>>
>> These are the tests which were failing before and passed after increasin=
g the memory:
>> PASS: nptl/tst-thread-affinity-pthread
>> PASS: nptl/tst-thread-affinity-pthread2
>> PASS: nptl/tst-thread-affinity-sched
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189488): https://lists.openembedded.org/g/openembedde=
d-core/message/189488
> Mute This Topic: https://lists.openembedded.org/mt/101774187/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

