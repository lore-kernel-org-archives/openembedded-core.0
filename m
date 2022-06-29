Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9740DC433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 00:09:50 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.5655.1656461380202144634
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 17:09:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=gbqWYlbq;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.46,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qv1-f46.google.com with SMTP id c1so22453148qvi.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 17:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=HOCwa8wvUCaroC4e7rZs66O9RHhTJGxtjOQ4GcJYC+w=;
        b=gbqWYlbq7RnvzRZaj/wZSsDEBg6jhVDzDLtI9fWqWQYqyNvb02D6cTUhTBLhWYOtHB
         pvMXQt76Xly5rMGi7Ic0HoXXtj4sF1SLez72rSyNeQ5TwvagniQK+N5B9h+qAKbXa4xA
         ZxqGchWzjEIdrp28xzXl7Bm21hK3UiITIfzs1NYbrhezcYMZ1IgDjIXtfMtYOpdMUplV
         RkTzRytFaV23BwzDkKUIKjYm8F/o4yz71m+QMMthy7jeuluVFVPsej5YyQqLM6vwA84B
         B3Db0E5AjPhsKsb6hlUWBTcBJ5JTUE9XeYC2S82BLZ1c5h5ARHxk+q2N3sYm8I6MFpbh
         n3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=HOCwa8wvUCaroC4e7rZs66O9RHhTJGxtjOQ4GcJYC+w=;
        b=iVmi8FOnOFmQLYAY1emU9oqDCwmGcHDO5A1G8IMqN2DIvdCpvoam1SvWDW/iks3tgA
         G8c7n03zBLr2SN/Fw4f3anonPuuJsbPjnhwziM6mTjV1YFKduNtM7Zh9BxBz7Ny2LfkR
         vPloYPnCEF0ASTQ5WD3O76y7ddbt519TGmqnooZN8QO6PyxkdUQqVOOxrxedI6J2p3yw
         XlzclZdzSfV0A8yuBObGm7vZRmsoJGxrDAZxmj+3F6iChe0U2PgsELaQvsiUONTKbOL3
         8kBOJL+Ip/pLneZPqeS4avP6wPRQVEU+LNYL1FKjuW/a09h4cbxxxk1umrhXxyGnFPoR
         2WTw==
X-Gm-Message-State: AJIora8yZtw2YJQbZbzq/uMHSgzgvAxgVoDlUAL3ZjtQQayQCD0y82J7
	/ofTWlOP//y2JjKiN1xU53tGfSXi/bX0NKXM
X-Google-Smtp-Source: 
 AGRyM1tnsp727fGwOtW51Bx3OTY4GYH/V8zEQG40XK9MtTn+HTImUlZ0Jtuf+KyzIXSsEGatsb34pA==
X-Received: by 2002:ac8:7d94:0:b0:304:fe52:7b87 with SMTP id
 c20-20020ac87d94000000b00304fe527b87mr521046qtd.482.1656461378719;
        Tue, 28 Jun 2022 17:09:38 -0700 (PDT)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com.
 [209.85.219.50])
        by smtp.gmail.com with ESMTPSA id
 l13-20020a05620a28cd00b006a6bbc2725esm12655589qkp.118.2022.06.28.17.09.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 17:09:38 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qv1-f50.google.com with SMTP id cs6so22501776qvb.6;
        Tue, 28 Jun 2022 17:09:38 -0700 (PDT)
X-Received: by 2002:a05:6214:c63:b0:470:8e17:1d87 with SMTP id
 t3-20020a0562140c6300b004708e171d87mr5723265qvj.105.1656461377774; Tue, 28
 Jun 2022 17:09:37 -0700 (PDT)
MIME-Version: 1.0
References: <29D9E4D8-7C19-4967-8681-0633D670B1AA@arm.com>
 <3e2f8efd-8bca-425e-065a-33035c0f1632@bootlin.com>
 <CE736DC4-765F-451F-98CB-B486A1AE1221@arm.com>
 <56828337-19fd-d032-dda8-83ffe7396623@bootlin.com>
In-Reply-To: <56828337-19fd-d032-dda8-83ffe7396623@bootlin.com>
Date: Tue, 28 Jun 2022 21:09:26 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKom4uGmY0ZxTf-U-bLR=hY0Smi5Pu-D7Bx3R5_MYxFtnw@mail.gmail.com>
Message-ID: 
 <CAP9ODKom4uGmY0ZxTf-U-bLR=hY0Smi5Pu-D7Bx3R5_MYxFtnw@mail.gmail.com>
Subject: Re: [OE-core] Announcing pkgexp
To: michael.opdenacker@bootlin.com
Cc: Ross Burton <Ross.Burton@arm.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Yocto <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000001b6ad05e28af8ed"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jun 2022 00:09:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167358

--00000000000001b6ad05e28af8ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 28 de jun. de 2022 =C3=A0s 11:26, Michael Opdenacker via
lists.openembedded.org <michael.opdenacker=3D
bootlin.com@lists.openembedded.org> escreveu:

>
> On 6/28/22 16:24, Ross Burton wrote:
> >
> >> On 28 Jun 2022, at 15:11, Michael Opdenacker <
> michael.opdenacker@bootlin.com> wrote:
> >> Hey, this looks very nice and very easy to use!
> >> One minor complaint, though: the "What Depends on" button didn't
> immediately catch my eye.
> >> Would it be possible to show such reverse dependencies in the same way
> you show RDEPENDS? The result may look better and everything would be on
> the same page.
> > The immediate problem with that is that for some packages, like libc,
> the reverse depends list can be huuuuge.  If the page is redesigned to ha=
ve
> scrollable regions then sure.  That would likely involve someone more
> skilled in web design than me getting involved ;)
>

Ross, take a look on ye (https://github.com/OSSystemsEmbeddedLinux/ye) it
does have some things worth adding as well.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--00000000000001b6ad05e28af8ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em ter., 28 de jun. de 2022 =C3=A0s 1=
1:26, Michael Opdenacker via <a href=3D"http://lists.openembedded.org">list=
s.openembedded.org</a> &lt;michael.opdenacker=3D<a href=3D"mailto:bootlin.c=
om@lists.openembedded.org">bootlin.com@lists.openembedded.org</a>&gt; escre=
veu:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
On 6/28/22 16:24, Ross Burton wrote:<br>
&gt;<br>
&gt;&gt; On 28 Jun 2022, at 15:11, Michael Opdenacker &lt;<a href=3D"mailto=
:michael.opdenacker@bootlin.com" target=3D"_blank">michael.opdenacker@bootl=
in.com</a>&gt; wrote:<br>
&gt;&gt; Hey, this looks very nice and very easy to use!<br>
&gt;&gt; One minor complaint, though: the &quot;What Depends on&quot; butto=
n didn&#39;t immediately catch my eye.<br>
&gt;&gt; Would it be possible to show such reverse dependencies in the same=
 way you show RDEPENDS? The result may look better and everything would be =
on the same page.<br>
&gt; The immediate problem with that is that for some packages, like libc, =
the reverse depends list can be huuuuge.=C2=A0 If the page is redesigned to=
 have scrollable regions then sure.=C2=A0 That would likely involve someone=
 more skilled in web design than me getting involved ;)<br></blockquote><di=
v><br></div><div>Ross, take a look on ye (<a href=3D"https://github.com/OSS=
ystemsEmbeddedLinux/ye">https://github.com/OSSystemsEmbeddedLinux/ye</a>) i=
t does have some things worth adding as well.</div><div>=C2=A0</div></div>-=
- <br><div dir=3D"ltr" class=3D"gmail_signature">Otavio Salvador =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 O.S. Systems<br><a href=3D"http://www.ossystems.com.br" targe=
t=3D"_blank">http://www.ossystems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a =
href=3D"http://code.ossystems.com.br" target=3D"_blank">http://code.ossyste=
ms.com.br</a><br>Mobile: +55 (53) 9 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Mobile: +1 (347) 903-9750</div></div>

--00000000000001b6ad05e28af8ed--

