Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA65CC4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 16:52:14 +0000 (UTC)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web11.17756.1672851125737643758
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 08:52:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e8oTYygz;
 spf=pass (domain: gmail.com, ip: 209.85.217.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id i10so13775468vsr.12
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 08:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O9HgCR+r0br7dpJ+ePGiU5XwEyh/LewqF0TJIh1/0Fg=;
        b=e8oTYygzumPFTxYCfq/Bl2FmjjoKSULCwfH8Es6HKwRUUslJF2zTJVc8Rnu9uOUgJ2
         y90ti9uREtSNnS47+CCPczlqmcjjsqFnYqAYyTaU9LWeshuxRSIAaCTaVvi4uTxPGOwm
         CI8phEANcAjt73c1NizyFe3i78RPiymsrqrCBg7mukQtNPQwd7Qw90sPIqmdjobrQOsE
         gAKz9XqU5yBGL690R63fDzKeqlttczUptVCbOd8B+oRbU9+MsDXfoVjWoJGkROAUFHRY
         TPBpdTJOkHSrmgzxyUakoi8jEKJtK4f65ssNk+XUYoQreqcVta/gYwNTdOiQmgU+x5ye
         fMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O9HgCR+r0br7dpJ+ePGiU5XwEyh/LewqF0TJIh1/0Fg=;
        b=kIk9/N/p1J3qCy+cZm0WZiScX8AbJ2XYDGZhiA2RjM9zXJIpaR8QDd2ghONjvMqG3W
         aPL/n0QRg71bDc1n8c/OSxpitECibNsCrc5kd0OO5/S5/Cn/4BByd75xNqQmr0hbAeIw
         LyhQg5FVchbc3dvvSqAX4xcOhn767hr1InRH64j5hFE85+cDGuL4hzdo3HO47nP2L6B8
         fqc0Gd0tSzOtH9qquM3jhDtsxAKrQ6EAusgcSx1ZdAwhEQIVFL5kQkRchWzuFtK1/rhD
         kKmSoSv0/eU7as+sndkcAlO+CxZ6zJxceBA2gyRdsFtbHscau9n91mrmgN/1YRcU9vw8
         ZofQ==
X-Gm-Message-State: AFqh2kre4pC703nFxv/5rW9HbybKjfCU0rh86mMLXj5/ZWkc1RWyGcCC
	ghklvE9M7KCErqsPrk2IaTwthXaY5Om5KvfPwLI=
X-Google-Smtp-Source: AMrXdXvA77AmuwvPv7ZX34Ih2N5CO3+v8SeveKjHKVSvQx0nLvuF4042J/wN7Rd7zGYsRqBHEAJajMPVgakKx6NSdT0=
X-Received: by 2002:a05:6102:2912:b0:3ce:a98f:151e with SMTP id
 cz18-20020a056102291200b003cea98f151emr675560vsb.60.1672851124798; Wed, 04
 Jan 2023 08:52:04 -0800 (PST)
MIME-Version: 1.0
References: <20230102070327.55373-1-rybczynska@gmail.com> <20230102070327.55373-2-rybczynska@gmail.com>
 <CANPvuRkzZFCYEFXpECrf3d1ea3tcCajMdQmz0r=x7-PyBgXNCA@mail.gmail.com>
 <CAApg2=RLRmbnMzYR6O+L=ob7Jp1d1uDXVrGo1Se9dEMzPq=QTA@mail.gmail.com>
 <CANPvuRk51aAcDyXkeN28fkpbb8XHPEJYRoAihEBM=_oYTggW_w@mail.gmail.com>
 <1736CC316B4E1D03.4716@lists.openembedded.org> <CAApg2=Rck5Q4qhmacAJvkBE9eG_RKhpRpU-qvsswz5uGBdSx8w@mail.gmail.com>
In-Reply-To: <CAApg2=Rck5Q4qhmacAJvkBE9eG_RKhpRpU-qvsswz5uGBdSx8w@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 4 Jan 2023 16:51:53 +0000
Message-ID: <CANPvuRnNY2+tJfw6SowcfX26xVNDgy9hX1R+cpoaTGqtWKbXRQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] cve-update-db-native: avoid partial updates
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alberto Pianon <alberto@pianon.eu>, Marta Rybczynska <marta.rybczynska@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000000e4a8605f173015c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 16:52:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175501

--0000000000000e4a8605f173015c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Marta Rybczynska <rybczynska@gmail.com> escreveu no dia quarta, 4/01/2023
=C3=A0(s) 15:28:

>
>>>>
>>>> Hi Jose,
>>>> Thanks for looking into that. The function is not a total duplicate:
>>>> the difference is that
>>>> the it always removes the db_tmp_file, not only if the journal file
>>>> exists (Python code
>>>> formatting!).
>>>>
>>>
>>> Don't see on the first time that the db_tmp_file is always removed, I
>>> need new glasses :)
>>>
>>>
>>>>
>>>> I was hesitating on this part a bit, because with the old path could b=
e
>>>> taken only in some
>>>> specific situations: at the code update and if you share the DL_DIR an=
d
>>>> some of the builds
>>>> use the old code, some the new version. I think we should keep both fo=
r
>>>> now for safety.
>>>>
>>>
>>> makes sense, thanks for your explanation.
>>>
>>>
>> Well... I'll submit a v2 with comments to make sure nobody tries to
>> optimize that piece :)
>>
>
> And here it is (with a minor title change):
> https://lists.openembedded.org/g/openembedded-core/message/175355
>

Thanks,
Jose


>
> Regards,
> Marta
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000000e4a8605f173015c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Marta Rybczynska &lt;<a href=3D"mailt=
o:rybczynska@gmail.com">rybczynska@gmail.com</a>&gt; escreveu no dia quarta=
, 4/01/2023 =C3=A0(s) 15:28:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div class=3D"gmail_quote"><br><div><br></div><div>Hi Jose,</d=
iv><div>Thanks for looking into that. The function is not a total duplicate=
: the difference is that</div><div><span style=3D"background:none 0% 0% rep=
eat scroll rgba(0,0,0,0)">the it</span> always removes the db_tmp_file, not=
 only if the journal file exists (Python code</div><div>formatting!).<br></=
div></div></div></blockquote><div><br></div><div>Don&#39;t see on the first=
 time that the db_tmp_file is always=C2=A0removed,=C2=A0I need new glasses =
:)</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr"><div class=3D"gmail_quote"><div></div><div><br></div><div>=
I was hesitating on this part a bit, because with the old path could be tak=
en only in some</div><div>specific situations: at the code update and if yo=
u share the DL_DIR and some of the builds</div><div>use the old code, some =
the new version. I think we should keep both for now for safety.=C2=A0</div=
></div></div></blockquote><div><br>makes sense, thanks for your explanation=
.<br><br></div></div></div></blockquote><div><br></div><div>Well... I&#39;l=
l submit a v2 with comments to make sure nobody tries to optimize that piec=
e :)</div></div></div></blockquote><div><br></div><div>And here it is (with=
 a minor title change): <a href=3D"https://lists.openembedded.org/g/openemb=
edded-core/message/175355" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-core/message/175355</a></div></div></div></blockquote><div>=
<br></div><div>Thanks,<br>Jose<br>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><br><=
/div><div>Regards,</div><div>Marta<br></div></div></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--0000000000000e4a8605f173015c--

