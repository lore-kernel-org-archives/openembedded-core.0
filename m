Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D00C4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 15:28:23 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.14849.1672846099687767367
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 07:28:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R20PcMq3;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id v23so25615294ljj.9
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 07:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QX0w5HDTQeMUF9nsm360Fj7tEJP1bnw6dcfnaywUaLA=;
        b=R20PcMq3M3VKpvS2wBlAsh1dDwKuo86bVmX32nZSU9z4/K8UKjSKZ6eAOusEE+h3I4
         kl5eMjiUPll+rS0W8WeFlXqqxAdzzbO8azFtVqGwY9sJqOb2x2B2Dh/1hWEMqavPKa0G
         dMIBGxpdDgTA8gWSW1xre1x041siMGg23JZAFNgeRDoTZS9k7+okeIBJPltr0ZnCL36G
         CBP9ybtgoYcXQ86KtYo9aO1dno7/x7hLXAPY/PxK58Q+TWdtdL5lEabwYh07n/Kz/WqG
         GaJoq/v6i4R0wCDT84q25LfmKb1PIpoVYofZF4q4Ko1p7QWU+/PrjOTn88ljiphA/Esw
         Zkcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QX0w5HDTQeMUF9nsm360Fj7tEJP1bnw6dcfnaywUaLA=;
        b=iF9B6LLRvPDyakvcSfmdaIDvq4BLLrycuWMFhhw+Lo5kMp9WVkDUwedCo37uoxd/a3
         w44CTBfoAokbsFaP3eJrTs4sjcVpek7iPnZJfdKUz0faGLi/Hje+S2tpsJE8UC0tVjb1
         PCZeXQjB0tmfEuOLwMZ9tQSNZPos9g4dx2gDDZanJdqpV2FJbERZqMuiZiKgGynHtUHC
         DDhk8eWlkpzCJg8S8Bmq0aX6pY+hlT5wgw2WrYJGHb/Ie93TB8W/uGEU71//7qCEVbIc
         QrkXTZE017sYyGUd7/SQu9kzgi/5IOVhZ9QaVqeznc7UKhNWiVTmxpgJRKpNEFbc1nQQ
         DK7w==
X-Gm-Message-State: AFqh2kpkNN7d3BtUiK1P288HbGZw/aXNuBEEyBM7ZR+YVXATYbq7+ibU
	mcFvChZZxpTuiVW8bXc9J8gAWaQO9Hk3KpA6v7w=
X-Google-Smtp-Source: AMrXdXt2fho0PPOlkjGm/1CeCjyj5m411caLBPLRLYr7pFsmLBNXtp7uesDsuYMhU5MnwPDz7WB86/fXv8a7JxrAL8s=
X-Received: by 2002:a2e:bc83:0:b0:27f:df8c:fee9 with SMTP id
 h3-20020a2ebc83000000b0027fdf8cfee9mr861231ljf.228.1672846097858; Wed, 04 Jan
 2023 07:28:17 -0800 (PST)
MIME-Version: 1.0
References: <20230102070327.55373-1-rybczynska@gmail.com> <20230102070327.55373-2-rybczynska@gmail.com>
 <CANPvuRkzZFCYEFXpECrf3d1ea3tcCajMdQmz0r=x7-PyBgXNCA@mail.gmail.com>
 <CAApg2=RLRmbnMzYR6O+L=ob7Jp1d1uDXVrGo1Se9dEMzPq=QTA@mail.gmail.com>
 <CANPvuRk51aAcDyXkeN28fkpbb8XHPEJYRoAihEBM=_oYTggW_w@mail.gmail.com> <1736CC316B4E1D03.4716@lists.openembedded.org>
In-Reply-To: <1736CC316B4E1D03.4716@lists.openembedded.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 4 Jan 2023 16:28:06 +0100
Message-ID: <CAApg2=Rck5Q4qhmacAJvkBE9eG_RKhpRpU-qvsswz5uGBdSx8w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] cve-update-db-native: avoid partial updates
To: rybczynska@gmail.com
Cc: Jose Quaresma <quaresma.jose@gmail.com>, openembedded-core@lists.openembedded.org, 
	Alberto Pianon <alberto@pianon.eu>, Marta Rybczynska <marta.rybczynska@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000006d458e05f171d56a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 15:28:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175486

--0000000000006d458e05f171d56a
Content-Type: text/plain; charset="UTF-8"

>
>
>>>
>>> Hi Jose,
>>> Thanks for looking into that. The function is not a total duplicate: the
>>> difference is that
>>> the it always removes the db_tmp_file, not only if the journal file
>>> exists (Python code
>>> formatting!).
>>>
>>
>> Don't see on the first time that the db_tmp_file is always removed, I
>> need new glasses :)
>>
>>
>>>
>>> I was hesitating on this part a bit, because with the old path could be
>>> taken only in some
>>> specific situations: at the code update and if you share the DL_DIR and
>>> some of the builds
>>> use the old code, some the new version. I think we should keep both for
>>> now for safety.
>>>
>>
>> makes sense, thanks for your explanation.
>>
>>
> Well... I'll submit a v2 with comments to make sure nobody tries to
> optimize that piece :)
>

And here it is (with a minor title change):
https://lists.openembedded.org/g/openembedded-core/message/175355

Regards,
Marta

--0000000000006d458e05f171d56a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><=
div class=3D"gmail_quote"><br><div><br></div><div>Hi Jose,</div><div>Thanks=
 for looking into that. The function is not a total duplicate: the differen=
ce is that</div><div><span style=3D"background:rgba(0,0,0,0) none repeat sc=
roll 0% 0%">the it</span> always removes the db_tmp_file, not only if the j=
ournal file exists (Python code</div><div>formatting!).<br></div></div></di=
v></blockquote><div><br></div><div>Don&#39;t see on the first time that the=
 db_tmp_file is always=C2=A0removed,=C2=A0I need new glasses :)</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr"><div class=3D"gmail_quote"><div></div><div><br></div><div>I was hesitat=
ing on this part a bit, because with the old path could be taken only in so=
me</div><div>specific situations: at the code update and if you share the D=
L_DIR and some of the builds</div><div>use the old code, some the new versi=
on. I think we should keep both for now for safety.=C2=A0</div></div></div>=
</blockquote><div><br>makes sense, thanks for your explanation.<br><br></di=
v></div></div></blockquote><div><br></div><div>Well... I&#39;ll submit a v2=
 with comments to make sure nobody tries to optimize that piece :)</div></d=
iv></div></blockquote><div><br></div><div>And here it is (with a minor titl=
e change): <a href=3D"https://lists.openembedded.org/g/openembedded-core/me=
ssage/175355">https://lists.openembedded.org/g/openembedded-core/message/17=
5355</a></div><div><br></div><div>Regards,</div><div>Marta<br></div></div><=
/div>

--0000000000006d458e05f171d56a--

