Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C33D5EB64DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 16:52:07 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.1310.1689094322581323520
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 09:52:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=EgECaHQO;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b701e1ca63so95080111fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 09:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689094321; x=1691686321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTWeDSk60JAu9xskA+eDTlSISMplFvBoPJUeFKEjhlc=;
        b=EgECaHQOxcTIPcX9sFhtTIgVG4KD6Ywq8TJbu7Ql3AhGTD6lMu/MV1Pnl9ZcsBD2p1
         7NulhDrjcPP4qpxe4nPQKek4UCdOkFEzCijYUfK2UVTVkbaxtBZ077iE7YBI+s+MsgLN
         Be8NLu+zdw7FnoGN7P0opnkC3TYzrs11I1O9ZuH9/AMmjRZWBT/vs5N7Y3K+e9GR9vWt
         ikbDZJGhv2pBBDS5Ebfg7Wpq+vqqKN+S7iSxb3kTUHwi3ZeomW5hYduSV26IkMRI4sIm
         NhpiNT8r7GXjx8XJa8/cf4pJBWaVA+wKnBL7+SQaao4NIeWmIW47cXT6VczOZGt6Qbxo
         MJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689094321; x=1691686321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xTWeDSk60JAu9xskA+eDTlSISMplFvBoPJUeFKEjhlc=;
        b=cF4YwQYa9BDiyrHjbbJHBUpsPq/bRXN43+dNVhVjP3H3Hx2EUbqw763PqQrmtJ1wtA
         //q3VFfx8fx0+6q+urbmGCfRUvip0wDFOCkWYZfuNw87FKU14R0TV+atDCkp87Y0mCB8
         HwgjkoEwLU8cYIrgRtqieJxV6JZS725+bbmFQxtWAN3QVGZpp6Xz4nMB0kwnXIbx0TpZ
         YIq8gev3ei6zRR39+pTN6i3Ci0NneSI3RIIpU27fvWNV0Y76MpppoF0cqRTKtrUG1nz3
         QUDTymwy7sXx152MNRujrGA4H9nY3BOpSuOkJA0L4oZPP3sOIY0oAAbPJCPMw2zduAPD
         /+Kg==
X-Gm-Message-State: ABy/qLZKGDGvo6FcGLxeqavKEDyCElT5Voy0PI2mCRd/IzDGVXwZJO27
	10mvrBbj3glEZqkY828sI5pMkypKENU6NC7NWq+p2LUHHeI=
X-Google-Smtp-Source: APBJJlEjPGJu2Tc2LeO8rWh4BKS2RbCQRKISDvxBAlrpP6p/A8m2Ic+ZhGnsMJILeOPieF1MmWyRQMtAO3DtmmHMzrY=
X-Received: by 2002:a2e:8050:0:b0:2b5:8c17:d0 with SMTP id p16-20020a2e8050000000b002b58c1700d0mr13368567ljg.2.1689094320490;
 Tue, 11 Jul 2023 09:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230711143320.255308-1-dit.kozmaj@kynetics.com> <CABU0hB++m5F_mNZx5C3qpL+NF0sScGVNy=hEJMBSVUcnjwRZvQ@mail.gmail.com>
In-Reply-To: <CABU0hB++m5F_mNZx5C3qpL+NF0sScGVNy=hEJMBSVUcnjwRZvQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Jul 2023 18:51:55 +0200
Message-ID: <CANNYZj-gnqLRBbeiwO9WjE6PhiXYpgH3yxyKzPB+siVya2WzJw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] fetch2: Set maxsplit to match expected variables
To: Dit Kozmaj <dit.kozmaj@kynetics.com>
Cc: openembedded-core@lists.openembedded.org, 
	Diego Rondini <diego.rondini@kynetics.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 16:52:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184148

The change should be submitted to the bitbake-devel list. It also
helps if you include everything a reviewer needs to know into the
commit message.

Alex

On Tue, 11 Jul 2023 at 17:28, Dit Kozmaj <dit.kozmaj@kynetics.com> wrote:
>
> Bitbucket added a new feature that provides limited access to a specific =
repository using a Repository Access Tokens. This token comes in the form t=
oken-auth:key.
>
> https://support.atlassian.com/bitbucket-cloud/docs/repository-access-toke=
ns/
> https://support.atlassian.com/bitbucket-cloud/docs/using-access-tokens/#I=
nclude-the-Repository-Access-Token-in-the-URL
>
> The token can be used in the user parameter of SRC_URI as this parameter =
is in the form user=3Duserid:password, and works correctly excluding the ca=
ses when the password contains a "=3D" symbol.
>
> The error comes from the split logic, which doesn't manage the case when =
the value contains the symbol "=3D".
>
> The proposed change guarantees that only two variables will be returned, =
splitted in "key" and "value" and the value can contain, especially in case=
s when it is a password, the "=3D" character.
>
>
> On Tue, Jul 11, 2023 at 4:33=E2=80=AFPM <dit.kozmaj@kynetics.com> wrote:
>>
>> From: Dit Kozmaj <dit.kozmaj@kynetics.com>
>>
>> Set the maxsplit value to match the expected number of variables.
>> This also avoids an unnecessary split as the parameters are in the form =
'key=3Dvalue'
>> and the 'value' could contain the '=3D' character.
>>
>> Signed-off-by: Dit Kozmaj <dit.kozmaj@kynetics.com>
>> ---
>>  bitbake/lib/bb/fetch2/__init__.py | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/bitbake/lib/bb/fetch2/__init__.py b/bitbake/lib/bb/fetch2/_=
_init__.py
>> index 3e6555bd67..79b289eaec 100644
>> --- a/bitbake/lib/bb/fetch2/__init__.py
>> +++ b/bitbake/lib/bb/fetch2/__init__.py
>> @@ -388,7 +388,7 @@ def decodeurl(url):
>>              if s:
>>                  if not '=3D' in s:
>>                      raise MalformedUrl(url, "The URL: '%s' is invalid: =
parameter %s does not specify a value (missing '=3D')" % (url, s))
>> -                s1, s2 =3D s.split('=3D')
>> +                s1, s2 =3D s.split('=3D', 1)
>>                  p[s1] =3D s2
>>
>>      return type, host, urllib.parse.unquote(path), user, pswd, p
>> --
>> 2.25.1
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184143): https://lists.openembedded.org/g/openembedde=
d-core/message/184143
> Mute This Topic: https://lists.openembedded.org/mt/100079813/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

