Return-Path: <nicolas.gillen@agregio-solutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8258E6C610
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 07:21:02 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.14044.1733210460667624213
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 23:21:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agregio-solutions.com header.s=google header.b=goBaa/dN;
 spf=pass (domain: agregio-solutions.com, ip: 209.85.167.48, mailfrom: nicolas.gillen@agregio-solutions.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53df67d6659so7968583e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 23:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=agregio-solutions.com; s=google; t=1733210458; x=1733815258; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VxBDHJVMDJ++dCryRc70YS6zJuSTULPKvNmV/AhRxtU=;
        b=goBaa/dNPi1oylBc4rZxMZ2rmhMDAEyay2io5I2Q+O05PiVZUZAE5j2V+xMLjoxXC+
         xUbe3H5h0lclZnBlxStz1vR9DT2u2awp6kUlHk5FPF485ltEwzaBlJ3gQp5FqbLRchGH
         xqSQ49m4MpyA7gkJktb+3EhiOlXttbNRqkBhRdQhs+KjNckcOZBmNbxp/hY/57uVfg8b
         BYBYTiD7tv/b3mwkVXZB9+zCV0FYAQz14aVLGZ+dRUJpz79sX5etPVzs0uCdDBT+aU8+
         BGi/vbqEadzuw0xVD5KnAw9DE8fYZOOKDsIeJPDL3BAf694wwyiLzGeZWHzXlNncrVnD
         efNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733210458; x=1733815258;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VxBDHJVMDJ++dCryRc70YS6zJuSTULPKvNmV/AhRxtU=;
        b=RDlsU/UUCtViKnb2fn+xxabXe8iJbaRfbnKC6V0h+4+TdhK2Qnl33EmA3NXgSKKcON
         U8aGy1AN5pu+skGTJWNvSz7IxrhVvQ8JawFBhbNerF7phoA0aXqwYfFvmA8hx9znfJFF
         Ow5cb1Ym+91g0q8vaZ9WF5SHcsDo/Ywkj2K9pyx7KNpSLl8eY5kefEtB58OKs1Y6pfgP
         dA7lj9ROBcDZYMXanqfQ0t7cP1paZ/hd6WtJEsXAE4G0/yDWJBdsdKOJiiLpihiW/L8w
         Qb5MYF+/ZA3xeCQ33GAUkllbKsh7J/AZ4qdJTljb9X4j2Luaods1vKphjzD7Uv/p0bZb
         rC2g==
X-Gm-Message-State: AOJu0YypySoOrV6rkPJdiFBejQ48myCSSjy783XA5PYW6jJN0/jo3V+I
	d79+Qv3ZvLjMHMRjnjLJxWrshPzW22zkvzUbMYxd/Vlw57CyiFVs/VhB0nMpw1RL8oxzlMQUjWB
	p4UwVc/J7A+FNhEa7SP1CHOy9qDfksht4y6vhJg==
X-Gm-Gg: ASbGnctR4JuAg5ylviIFA62IqjWAO6ZP5d4+KAyIxXbJvUlXgmQp/6ukyiGkbrvuQ6A
	pQNtfV3igVkYudFzXtf4yw7gQPnhJMXWA
X-Google-Smtp-Source: AGHT+IGLlVVbVrDS0z2ZnFpNtWhklXCiRKT3n/Y67rq3ZymllGK/wIgN1ajs0F60smlMn5qGRv1QfNMreLorWCuVwp0=
X-Received: by 2002:ac2:4c15:0:b0:53e:12c3:a27 with SMTP id
 2adb3069b0e04-53e12c30ad8mr851248e87.0.1733210457955; Mon, 02 Dec 2024
 23:20:57 -0800 (PST)
MIME-Version: 1.0
References: <CADcMJG_mX3pXOexbA_Gk_VMY4qVaJTna5Gc5ZW-9_R-LncSBpQ@mail.gmail.com>
 <CAOSpxdaHk817fp+vXNieUV4XiZp4d9Qhb4BPK7YDv-+u+r3Wmg@mail.gmail.com>
In-Reply-To: <CAOSpxdaHk817fp+vXNieUV4XiZp4d9Qhb4BPK7YDv-+u+r3Wmg@mail.gmail.com>
From: Nicolas Gillen <nicolas.gillen@agregio-solutions.com>
Date: Tue, 3 Dec 2024 08:20:47 +0100
Message-ID: <CADcMJG9qObm0+HazM_Oqxh+samP6sN_khXBiEEwO7oO_R7D_pQ@mail.gmail.com>
Subject: Re: [BACKPORT] rootfs: Ensure run-postinsts is not uninstalled for read-only-rootfs-delayed-postinsts
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ab072a06285881b1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 07:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208182

--000000000000ab072a06285881b1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Steve,

You probably already noticed that the link I sent doesn't contain the full
patch.
The full patch is here :
https://git.openembedded.org/openembedded-core/commit?id=3D60f587475dda99ea=
a07848880058b69286b8900e

Thanks,

Nicolas

Le lun. 2 d=C3=A9c. 2024 =C3=A0 19:04, Steve Sakoman <steve@sakoman.com> a =
=C3=A9crit :

>
>
> On Thu, Nov 28, 2024 at 4:27=E2=80=AFAM Nicolas Gillen <
> nicolas.gillen@agregio-solutions.com> wrote:
>
>> Hello,
>>
>> I need to have postinstall scripts working on a read-only file system on
>> Scarthcap.
>> That's why I would like to have the commit
>> 60f587475dda99eaa07848880058b69286b8900e
>> <https://git.openembedded.org/openembedded-core/commit/meta/lib/oe/rootf=
s.py?id=3D60f587475dda99eaa07848880058b69286b8900e>
>> from master backported to Scarthgap.
>>
>> Please let me know if there is a better format to request this.
>>
>
> This is fine.  I've added the patch to my scarthgap test queue.
>
> Thanks,
>
> Steve
>


--=20
[image: Agregio Solutions]
<https://signature.agregio-solutions.com/l/VTRzejVHQVVjK00wVEp3Q3FKSnRKdz09=
-VzNGNG5oU1pWYjZRMTVQMUxBZ2xJZz09>
*Nicolas GILLEN*
*Tech Lead Syst=C3=A8mes Embarqu=C3=A9s et R=C3=A9seaux*


11 Avenue Albert Einstein
69100 Villeurbanne, France <nicolas.gillen@agregio-solutions.com>


nicolas.gillen@agregio-solutions.com
www.agregio-solutions.com
<https://signature.agregio-solutions.com/l/VTRzejVHQVVjK00wVEp3Q3FKSnRKdz09=
-VzNGNG5oU1pWYjZRMTVQMUxBZ2xJZz09>

--000000000000ab072a06285881b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Steve,<div><br></div><div>You probably already noti=
ced that the link I sent doesn&#39;t contain the full patch.<br>The full pa=
tch is here :=C2=A0<a href=3D"https://git.openembedded.org/openembedded-cor=
e/commit?id=3D60f587475dda99eaa07848880058b69286b8900e">https://git.openemb=
edded.org/openembedded-core/commit?id=3D60f587475dda99eaa07848880058b69286b=
8900e<br></a><br>Thanks,</div><div><br></div><div>Nicolas</div></div><br><d=
iv class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gm=
ail_attr">Le=C2=A0lun. 2 d=C3=A9c. 2024 =C3=A0=C2=A019:04, Steve Sakoman &l=
t;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt; a =C3=A9cr=
it=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 28, 2024 at 4:27=E2=80=AFAM Nic=
olas Gillen &lt;<a href=3D"mailto:nicolas.gillen@agregio-solutions.com" tar=
get=3D"_blank">nicolas.gillen@agregio-solutions.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>He=
llo,<br><br></div><div>I need to have postinstall scripts=C2=A0working on a=
 read-only file system on Scarthcap.</div><div>That&#39;s why I would like =
to have the commit=C2=A0<a href=3D"https://git.openembedded.org/openembedde=
d-core/commit/meta/lib/oe/rootfs.py?id=3D60f587475dda99eaa07848880058b69286=
b8900e" target=3D"_blank">60f587475dda99eaa07848880058b69286b8900e</a> from=
 master backported to Scarthgap.</div><div><br></div><div>Please let me kno=
w if there is a better format to request this.</div></div></blockquote><div=
><br></div><div>This is fine.=C2=A0 I&#39;ve added the patch to my scarthga=
p test queue.</div><div><br></div><div>Thanks,</div><div><br></div><div>Ste=
ve=C2=A0</div></div></div>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><div><table style=3D"font-family:Arial;backgroun=
d:transparent;font-size:13px;color:rgb(0,0,0);line-height:1.2;display:inlin=
e-table" cellspacing=3D"0"><tbody><tr style=3D"color:inherit"> <td style=3D=
"color:inherit;white-space:normal" rowspan=3D"1" colspan=3D"1"><table style=
=3D"width:100%;border-collapse:separate;font-family:Arial;background:transp=
arent;font-size:13px;color:rgb(0,0,0);line-height:1.2" cellspacing=3D"0"><t=
body><tr style=3D"height:auto;color:inherit"><td style=3D"color:inherit;tex=
t-align:left;height:127px;width:270px;vertical-align:top;padding-top:0px;wh=
ite-space:normal;border-width:initial;border-style:initial;border-color:rgb=
(255,255,255)" rowspan=3D"1" colspan=3D"1"><div width=3D"230" height=3D"50"=
><a style=3D"display:inline-block" href=3D"https://signature.agregio-soluti=
ons.com/l/VTRzejVHQVVjK00wVEp3Q3FKSnRKdz09-VzNGNG5oU1pWYjZRMTVQMUxBZ2xJZz09=
" target=3D"_blank"><img alt=3D"Agregio Solutions" style=3D"width: 230px; h=
eight: 42.6224px;" src=3D"https://signature.agregio-solutions.com/uploads/0=
f4e9fc0937dc77a1e035c31085139be.png" width=3D"230" height=3D"42.62237762237=
8"></a></div></td><td style=3D"color:inherit;width:319px;height:127px;text-=
align:left;padding:5px 0px 0px;white-space:normal;border-left:0px none rgb(=
255,255,255);border-top:0px none rgb(255,255,255);border-bottom:0px none rg=
b(255,255,255)" rowspan=3D"1" colspan=3D"1"> <div style=3D"white-space:norm=
al"><div style=3D"white-space:normal"><span style=3D"font-family:arial,sans=
-serif;font-size:12px"><b><span style=3D"color:rgb(254,87,22)">Nicolas GILL=
EN</span></b></span></div><div style=3D"white-space:normal"><span style=3D"=
font-family:arial,sans-serif;font-size:12px"><b><span style=3D"color:rgb(25=
4,87,22)">Tech Lead Syst=C3=A8mes Embarqu=C3=A9s et R=C3=A9seaux</span></b>=
</span><br><p style=3D"white-space:normal;margin:0px"><br><span style=3D"co=
lor:rgb(0,26,112)"></span></p><p style=3D"white-space:normal;margin:0px"><a=
 style=3D"color:rgb(0,26,112);text-decoration:none" href=3D"mailto:nicolas.=
gillen@agregio-solutions.com" target=3D"_blank"><font color=3D"#888888"><sp=
an style=3D"color:rgb(0,26,112)">11 Avenue Albert Einstein<br> 69100 Villeu=
rbanne, France</span></font></a></p><p style=3D"white-space:normal;margin:0=
px"><span style=3D"color:rgb(0,26,112)"><br></span></p><p style=3D"white-sp=
ace:normal;margin:0px"><span style=3D"color:rgb(0,26,112)"><a style=3D"colo=
r:rgb(0,26,112);text-decoration:none" href=3D"mailto:nicolas.gillen@agregio=
-solutions.com" target=3D"_blank">nicolas.gillen@agregio-solutions.com</a><=
br><a style=3D"color:rgb(0,26,112);text-decoration:none" href=3D"https://si=
gnature.agregio-solutions.com/l/VTRzejVHQVVjK00wVEp3Q3FKSnRKdz09-VzNGNG5oU1=
pWYjZRMTVQMUxBZ2xJZz09" target=3D"_blank">www.agregio-solutions.com</a></sp=
an></p> </div></div> </td></tr></tbody></table></td> </tr> </tbody></table>=
<p style=3D"margin-top:10px"></p><table></table></div></div></div>

--000000000000ab072a06285881b1--

