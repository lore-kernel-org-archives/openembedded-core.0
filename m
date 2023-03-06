Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D42C61DA4
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 14:08:24 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.33994.1678111702321921050
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Mar 2023 06:08:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=3MEUNNa6;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.50, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f50.google.com with SMTP id s11so39016120edy.8
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 06:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678111700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rvvide2uuD9VGB/W2kg3h4Vv1v9u3HvGFOs3JLFXHgA=;
        b=3MEUNNa62KVB8YCQ7JtqkVSBTC1zA6+Bcx+0kPnwvCRfTnuTX95Lb3KbGufFfA4h1I
         I4TMLC+zo5O/ZqVJIRKwmiDLMYgGoMp23HTlHImp6jCAyjTTrhJWrBbeaLIo48IApD1f
         Pp26E2lc6D9e9IK6AakEgfW/5/CEqKcDuCbByDI1Rsrzxqn4Uf7wHU78Lu4uVDp3QfXn
         59tYBkUiujuMT2SD8zI2H1YfLEWtdf53GY8RO3mX3YGXEgwYTyCmY+7TTLp6QtfG93an
         DzWEQVnmNB/c8VdV21yUpg345CUDdbm0FiORtBnJiZNiwFNt2ltlbiA8GKNqFlupAUx5
         JZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678111700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rvvide2uuD9VGB/W2kg3h4Vv1v9u3HvGFOs3JLFXHgA=;
        b=l3vzMWrGl9NaqNXLypwYim9Veunh3dCSBb9ASKd7MT5XxDmVmfN93IcvgafT5BoCCK
         WJ5g4Pd7a6oVf+K7vEBdC+qZ3S5T+1hKVr0U27Uiqg02tufhejfTb7PFFA3BJhbB9aXO
         G1diVdjf8xjCndsdfScU3XF1XEMD1MNxCyPzxy7rvBGel99jHif9sPgzQ+OLWFiX80UO
         kC6/lJ7bdu+g0Udv7zgIvE5N8Pn1uKRq0RGJYU2GZyQ/Vi4DMotC+tqxORg7dlfJDIFE
         2EYDcvN/Ms4olicsMR9U8RHeOrZE3g2yOUQQw6wCXsdu0HWxebSBUWYTTNWYiat3kKQb
         8pLA==
X-Gm-Message-State: AO0yUKVBcaT8d5zQ3j7Gl14oQ7LsO8JaC602xLPwZP+EXCzaA9fnBJvB
	6XsH49MRujOR8S/1iMJ28z43iNP60N9kux3CjNlQeA==
X-Google-Smtp-Source: AK7set8J7OK8UB1MBFdWvymH4Tz3PjNx6Y8MYHM3Bv1yB4Zv9gSawAU5GfAzQIR2LRjd2lhvnpdK3bpO+wb1NnyQ4PA=
X-Received: by 2002:a50:c313:0:b0:4be:7259:bed7 with SMTP id
 a19-20020a50c313000000b004be7259bed7mr6081548edb.3.1678111700137; Mon, 06 Mar
 2023 06:08:20 -0800 (PST)
MIME-Version: 1.0
References: <g24C.1678079873441089494.XMJ4@lists.openembedded.org> <CAPun1rHE7_itbRjbMpBXY+YrG357bBBfQ0BD93zLmV6nkQSj0w@mail.gmail.com>
In-Reply-To: <CAPun1rHE7_itbRjbMpBXY+YrG357bBBfQ0BD93zLmV6nkQSj0w@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 6 Mar 2023 04:08:09 -1000
Message-ID: <CAOSpxdZkfwr9ogTuTvpFMxOXXsF=1k9TZ1t4ZrbcJ_FbJaKFmQ@mail.gmail.com>
Subject: Re: [OE-core] [Kirkstone][Patch review] harfbuzz: CVE-2023-25193
 doesn't fix the issue and still exhibits O(n^2) behaviour #kirkstone
To: vkumbhar <vkumbhar@mvista.com>
Cc: DC <davidcorbe@outlook.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 14:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178072

On Sun, Mar 5, 2023 at 7:36=E2=80=AFPM vkumbhar <vkumbhar@mvista.com> wrote=
:
>
> Yes, will revert that patch and backport the correct one.

I will remove that patch from the current kirkstone queue and await a
V2.  It hasn't moved out of my testing branch, so a revert isn't
needed.

Steve

> On Mon, Mar 6, 2023 at 10:47=E2=80=AFAM DC <davidcorbe@outlook.com> wrote=
:
>>
>> The patches submitted to
>> dunfell -> https://lists.openembedded.org/g/openembedded-core/message/17=
7768
>> Kirkstone -> https://lists.openembedded.org/g/openembedded-core/message/=
177767
>>
>> Still exhibits O(n^2) behaviour upon testing with applications and fonts=
 and in worst cases Harfbuzz is not printing anything.
>> Upon closer examination, looks to me that a wrong fix is pushed for the =
issue.
>>
>> The patch [ https://github.com/harfbuzz/harfbuzz/commit/85be877925ddbf34=
f74a1229f3ca1716bb6170dc ] is known to causes erroneous results and regress=
ion already reverted by Behdad as a developer of Harfbuzz in the commit [ h=
ttps://github.com/harfbuzz/harfbuzz/commit/661050b4659ee490dfe622821bc7fde7=
d1c40510 ].
>>
>> (ref-> https://github.com/harfbuzz/harfbuzz/commit/85be877925ddbf34f74a1=
229f3ca1716bb6170dc#commitcomment-101326711)
>>
>> The new fix was already introduced (https://github.com/harfbuzz/harfbuzz=
/commit/85be877925ddbf34f74a1229f3ca1716bb6170dc#commitcomment-101335712) a=
nd needs to be backported properly.
>>
>> It doesn't look correct to patch Harfbuzz with code already reverted.
>>
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178057): https://lists.openembedded.org/g/openembedde=
d-core/message/178057
> Mute This Topic: https://lists.openembedded.org/mt/97419449/3620601
> Mute #kirkstone:https://lists.openembedded.org/g/openembedded-core/muteha=
shtag/kirkstone
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

