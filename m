Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80AF9C433FE
	for <webhook@archiver.kernel.org>; Sat,  8 Oct 2022 19:01:04 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web10.6810.1665255660775821732
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Oct 2022 12:01:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=Hs0+nOLy;
 spf=pass (domain: ossystems.com.br, ip: 209.85.161.42,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-oo1-f42.google.com with SMTP id
 g15-20020a4a894f000000b0047f8e899623so5594568ooi.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Oct 2022 12:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=oYz40koPjh3YU0FlxH9CLrUSJ3z2iBvSN+ybHD2WV2Y=;
        b=Hs0+nOLyckSSB0l8EfvcqWw9IzXy0zu3aSIYkSVBRpiuZ2W2QL0f8JmtyfZX9hkRiU
         gT6ZogFtq6sVy07CUiJPhj+BdbHD2aW+O7Ke5olwFrOATk0HFouEo6xKw89SgS6RM4JY
         tS84ENNxzQE+Fek5qtt6c5mlkttDZYWbnj74smPpbcBGXvVrn3fWmLSVep+RzuiB25bD
         ok3TmWMYpolshYwlVPrQBr6NqE7P72buVCfd5QYh0UBC1k52gIhlpMeR65nPG9LBzjzS
         9F3J5l90ziPmA5ow3GQeODaEAqacUMFCHjd7Zofsfee2RXLwe4435yxRJ9tNMvKu7o60
         +qYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oYz40koPjh3YU0FlxH9CLrUSJ3z2iBvSN+ybHD2WV2Y=;
        b=Xxy3waCaavg1Oec+MtZCfu65CLlI+VTavtvWO0otgJFd8GxfQc7kpRoP2pPNmRU2Ny
         qFfNsCy0vwxPFomQCpilUUTsRUbBaS9Uoj5PC4RTQPq+Ih6vY4jL49A/TvbdFcjxJ23V
         UKrrByNi/Z5lxDWgjzBCBum/1TrHVj2d5vw9/Jtwa7rxpPhwgtfFJQAv4BKCGIIP/K9/
         1660Z46ABPbdkmrZU8nqQ461p0HR6G+bBZJwYjGCrKwVskRWO8Fa4py9DwPD9yuDGOaA
         XYFmyKzI8k55PMIIuPW+IlI24LxANbxEm6KrfS+FIbV8OWzD+8nzPK4xhoqUta3/+vey
         AGxg==
X-Gm-Message-State: ACrzQf3neScNCZ0iTbTEI7sJ/IScb2dWjAe2VXx7j/XRq/FOuC/lyFCR
	Hs2HP4SB0YR1hZfLUpZ6JxNWmhMFhuz7y80j
X-Google-Smtp-Source: 
 AMsMyM6k413HIe+5svHfrlK2f/8rbAa4+ShJ6xpOSY0xr38NZ37gVxQ+pHwj5NLDiS2qknCtMM7ruw==
X-Received: by 2002:a05:6830:648d:b0:65b:a27d:f547 with SMTP id
 ck13-20020a056830648d00b0065ba27df547mr4554968otb.259.1665255659780;
        Sat, 08 Oct 2022 12:00:59 -0700 (PDT)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com.
 [209.85.167.177])
        by smtp.gmail.com with ESMTPSA id
 20-20020a544194000000b00342ece494ffsm2434456oiy.46.2022.10.08.12.00.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Oct 2022 12:00:59 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi1-f177.google.com with SMTP id m130so9004716oif.6
        for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Oct 2022 12:00:59 -0700 (PDT)
X-Received: by 2002:aca:2808:0:b0:2f7:34db:691e with SMTP id
 8-20020aca2808000000b002f734db691emr10399811oix.252.1665255659195; Sat, 08
 Oct 2022 12:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <20221007164640.17471-1-alex.kiernan@gmail.com>
 <20221007164640.17471-2-alex.kiernan@gmail.com>
In-Reply-To: <20221007164640.17471-2-alex.kiernan@gmail.com>
Date: Sat, 8 Oct 2022 16:00:47 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKqO1ONyXNE=yL4dOhwUALjSdcTd-NoevQq3vyNYuN3VoQ@mail.gmail.com>
Message-ID: 
 <CAP9ODKqO1ONyXNE=yL4dOhwUALjSdcTd-NoevQq3vyNYuN3VoQ@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 2/2] u-boot: Add savedefconfig task
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000006d21905ea8a8c62"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Oct 2022 19:01:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171535

--00000000000006d21905ea8a8c62
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em sex., 7 de out. de 2022 =C3=A0s 13:47, Alex Kiernan <alex.kiernan@gmail.=
com>
escreveu:

> Add savedefconfig task which U-Boot supports (unfortunately not all
> consumers of cml1 support this).
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>

Kernel also does, so might be nice to add it to a specific class and reuse.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--00000000000006d21905ea8a8c62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em sex., 7 de out. de 2022 =C3=A0s 13=
:47, Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com">alex.kierna=
n@gmail.com</a>&gt; escreveu:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Add savedefconfig task which U-Boot supports (unfortunately n=
ot all<br>
consumers of cml1 support this).<br>
<br>
Signed-off-by: Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com" t=
arget=3D"_blank">alex.kiernan@gmail.com</a>&gt;<br></blockquote><div><br></=
div><div>Kernel also does, so might be nice to add it to a specific class a=
nd reuse.</div><div>=C2=A0</div></div>-- <br><div dir=3D"ltr" class=3D"gmai=
l_signature">Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br><a hre=
f=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.co=
m.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossystems.com.br=
" target=3D"_blank">http://code.ossystems.com.br</a><br>Mobile: +55 (53) 9 =
9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) 903-9750</div>=
</div>

--00000000000006d21905ea8a8c62--

