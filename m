Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A17ECE64AA7
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 13:45:24 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web10.19559.1733233520060834155
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 05:45:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Hsja7E5w;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.178, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e398823d6aaso3524560276.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 05:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733233519; x=1733838319; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dZ9X95igFEDH8Ge822sQ1PCd7vrPsAAGDSAHtXhfCY8=;
        b=Hsja7E5w285/Cwvk9rH2t447I3k0+xTQ1Yk65FcsWSDf/pbrxGbeeVJZRwPQoEepvA
         /yFI+u69LcxCeQN8C3v//OsRtJ2X8Ul0B7ZO7OGWYHg4BSHFNbjvswURxdmSwv6d+gj4
         QMsoWwNIZzMF03DjBcsSQ65JAcLQ7fhTcJLuhr8fQPlBv+Sg75RUp8n65cjwgCUVLo9/
         wSddaCcK+RYt5L64xc5z2sdMgIVGY3BFL1WZ4w0Cy70xAsCf3XP8Ift7NjKk4ny3u3b/
         2PeZig/MAJnGjL/tKiuM46AliRhN3zGkpYet5W7Q8F5ishefTFndAfn0H8heM4634v0H
         6Dpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733233519; x=1733838319;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dZ9X95igFEDH8Ge822sQ1PCd7vrPsAAGDSAHtXhfCY8=;
        b=eDc/MFxNJdTZm1EKY6K6EL4zjmHIW9HethtjOo9TmG6S0H9rVemT+GL5wYr2z4aTTB
         QG6EC9NcggIsT5Rf9bfRfX2b8t7/qnVcf38OVgXq6M+0cl3UvG/Mh/WPf4P/TNVgCjGk
         6lv70mySc0CEYLaI7xKSo8LXc5rRQafhpXejC8rEZ94vdPoAc7cZwoFGnYLF/4hBqZUE
         rqjt7wYoo4wEQwoxnvq5irbWPAhKoSaae3+9P2EY1X7aPGCTlQ/lbiUX+iyAHtCO1C06
         vIxIPmtSZyslr9+gPhEqK5a7p8LKCPDqQ/86TlZJox5kMxulnKkvbpaSTW4ghSXG9gqT
         S43Q==
X-Gm-Message-State: AOJu0YxP+ieOedWGEV8I63yw8pc0PKiVG2I35pFv9Z6sKbCZhpxTcDxj
	UEdOKoyiGcE/3F7YRkp365MUHkCIjUHuBVPZ4BietarIC+dLRvRVT161VG4/Gv0FZYvThw0DYk7
	a7stG5wm3XfdvSf6ZjXWsEzi6nD9JeoKV9XNWtupVqSPDeUV8
X-Gm-Gg: ASbGncsAkKNzU5NiNV66/32vS8xhUAo0HxkqxYvF79gQauGG1Wm3kwsBjVZucdDWctj
	saibj77GgkWFnRJ+PBxKfSGn3v29ku3o=
X-Google-Smtp-Source: AGHT+IECIQQ07qfVs/+cEk9gni6IkdtnEMB/nIOPOZJ1WUXcn0DAGDLzC/63W8Y3HYL0SlEA4o6JWLkNl9Dss5s1qAY=
X-Received: by 2002:a25:d883:0:b0:e38:2dad:f40c with SMTP id
 3f1490d57ef6-e3971738e60mr19977551276.3.1733233519212; Tue, 03 Dec 2024
 05:45:19 -0800 (PST)
MIME-Version: 1.0
References: <CADcMJG_mX3pXOexbA_Gk_VMY4qVaJTna5Gc5ZW-9_R-LncSBpQ@mail.gmail.com>
 <CAOSpxdaHk817fp+vXNieUV4XiZp4d9Qhb4BPK7YDv-+u+r3Wmg@mail.gmail.com> <CADcMJG9qObm0+HazM_Oqxh+samP6sN_khXBiEEwO7oO_R7D_pQ@mail.gmail.com>
In-Reply-To: <CADcMJG9qObm0+HazM_Oqxh+samP6sN_khXBiEEwO7oO_R7D_pQ@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 3 Dec 2024 05:45:08 -0800
Message-ID: <CAOSpxdbFDSSy0R6no81Vj4Ld1rzbSntFFzs3d4kCtfPc+2tRCw@mail.gmail.com>
Subject: Re: [BACKPORT] rootfs: Ensure run-postinsts is not uninstalled for read-only-rootfs-delayed-postinsts
To: Nicolas Gillen <nicolas.gillen@agregio-solutions.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000039d56206285de0af"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 13:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208208

--00000000000039d56206285de0af
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 2, 2024 at 11:20=E2=80=AFPM Nicolas Gillen <
nicolas.gillen@agregio-solutions.com> wrote:

> Thanks Steve,
>
> You probably already noticed that the link I sent doesn't contain the ful=
l
> patch.
> The full patch is here :
> https://git.openembedded.org/openembedded-core/commit?id=3D60f587475dda99=
eaa07848880058b69286b8900e
>

Yes, I did notice :-)

Steve


>
> <https://git.openembedded.org/openembedded-core/commit?id=3D60f587475dda9=
9eaa07848880058b69286b8900e>
> Le lun. 2 d=C3=A9c. 2024 =C3=A0 19:04, Steve Sakoman <steve@sakoman.com> =
a =C3=A9crit :
>
>>
>>
>> On Thu, Nov 28, 2024 at 4:27=E2=80=AFAM Nicolas Gillen <
>> nicolas.gillen@agregio-solutions.com> wrote:
>>
>>> Hello,
>>>
>>> I need to have postinstall scripts working on a read-only file system o=
n
>>> Scarthcap.
>>> That's why I would like to have the commit
>>> 60f587475dda99eaa07848880058b69286b8900e
>>> <https://git.openembedded.org/openembedded-core/commit/meta/lib/oe/root=
fs.py?id=3D60f587475dda99eaa07848880058b69286b8900e>
>>> from master backported to Scarthgap.
>>>
>>> Please let me know if there is a better format to request this.
>>>
>>
>> This is fine.  I've added the patch to my scarthgap test queue.
>>
>> Thanks,
>>
>> Steve
>>
>
>
> --
> [image: Agregio Solutions]
> <https://signature.agregio-solutions.com/l/VTRzejVHQVVjK00wVEp3Q3FKSnRKdz=
09-VzNGNG5oU1pWYjZRMTVQMUxBZ2xJZz09>
> *Nicolas GILLEN*
> *Tech Lead Syst=C3=A8mes Embarqu=C3=A9s et R=C3=A9seaux*
>
>
> 11 Avenue Albert Einstein
> 69100 Villeurbanne, France <nicolas.gillen@agregio-solutions.com>
>
>
> nicolas.gillen@agregio-solutions.com
> www.agregio-solutions.com
> <https://signature.agregio-solutions.com/l/VTRzejVHQVVjK00wVEp3Q3FKSnRKdz=
09-VzNGNG5oU1pWYjZRMTVQMUxBZ2xJZz09>
>
>

--00000000000039d56206285de0af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 2, 2024 at 11:20=E2=80=AF=
PM Nicolas Gillen &lt;<a href=3D"mailto:nicolas.gillen@agregio-solutions.co=
m">nicolas.gillen@agregio-solutions.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Thanks Steve,<div><=
br></div><div>You probably already noticed that the link I sent doesn&#39;t=
 contain the full patch.<br>The full patch is here :=C2=A0<a href=3D"https:=
//git.openembedded.org/openembedded-core/commit?id=3D60f587475dda99eaa07848=
880058b69286b8900e" target=3D"_blank">https://git.openembedded.org/openembe=
dded-core/commit?id=3D60f587475dda99eaa07848880058b69286b8900e<br></a></div=
></div></blockquote><div><br></div><div>Yes, I did notice :-)</div><div><br=
></div><div>Steve</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div dir=3D"ltr"><div><a href=3D"https://git.openembedded.or=
g/openembedded-core/commit?id=3D60f587475dda99eaa07848880058b69286b8900e" t=
arget=3D"_blank"></a></div></div><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">Le=C2=A0lun. 2 d=C3=A9c. 2024 =C3=A0=C2=A019:04, Ste=
ve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" target=3D"_blank">steve=
@sakoman.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov =
28, 2024 at 4:27=E2=80=AFAM Nicolas Gillen &lt;<a href=3D"mailto:nicolas.gi=
llen@agregio-solutions.com" target=3D"_blank">nicolas.gillen@agregio-soluti=
ons.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"ltr"><div>Hello,<br><br></div><div>I need to have postin=
stall scripts=C2=A0working on a read-only file system on Scarthcap.</div><d=
iv>That&#39;s why I would like to have the commit=C2=A0<a href=3D"https://g=
it.openembedded.org/openembedded-core/commit/meta/lib/oe/rootfs.py?id=3D60f=
587475dda99eaa07848880058b69286b8900e" target=3D"_blank">60f587475dda99eaa0=
7848880058b69286b8900e</a> from master backported to Scarthgap.</div><div><=
br></div><div>Please let me know if there is a better format to request thi=
s.</div></div></blockquote><div><br></div><div>This is fine.=C2=A0 I&#39;ve=
 added the patch to my scarthgap test queue.</div><div><br></div><div>Thank=
s,</div><div><br></div><div>Steve=C2=A0</div></div></div>
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
</blockquote></div></div>

--00000000000039d56206285de0af--

