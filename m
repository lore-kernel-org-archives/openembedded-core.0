Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC2FD44C47
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 13:21:23 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35457.1768483279841510434
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 05:21:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=hrr1CsEu;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.47, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64b7d213fd6so156239a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 05:21:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768483278; cv=none;
        d=google.com; s=arc-20240605;
        b=KMp5RObTooN4GNnFUritSQ9tQ/6duOmYa7CsALQDbiDRbMq3PRL4IISHw1CS3F6MRa
         bHDmIEOkCA9EiZ8fKSQaAysKt8pJNImf97s3prrhfc9Nl+6pxBJNgbxOEJcEBUVYhcjx
         J120VsrzAEHTg/zJ6yyMgo1wylg/duK0usVcdESFcLY3p4+cBYmk0Q+gIWC6dVqn12hK
         hz3O38CyQ5hZJNYaUEcJpxX1JQI0aRJ4qU3ySF45V5lAuq5DG+DogRzXANlZAg8+wYD8
         ZcaUqtfvh82dNdi/ye9p7H8gp43w0mhLuvtGBax17lzsCxWMoQPj6/UEoH6Dc4SKd0KN
         N1kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TkP0hM67bjUhpg3/JQQDjTLNssee4v9f5cGmvtelswk=;
        fh=jStBI1HRfQh370+Ez+tO/NSlVH+zosDaQO/ip8jArss=;
        b=MhjCkFi2eUUuluNKfAVuWR5P4lnduNc0LWr0jNk0jmihlDuOcXaXr/wRgVPcXppQLj
         LAfj4WAYyDIx1b7fruUOCQuLIDr2J7vj/P8gJ2Utxi3m6nyIssAufz79DtgZBFk9kjaO
         sAcZXElqHsTmax2NDcPlqp4YfO286nM8v+vx+G7Fnm5BzytRstEZ/+JLweGLOLVian7f
         v6cT0UIKuo76ICfrzJsIm83F5JSGvJVTA0IONKHo/4zUHqpS227WR8DGMl24faVrfAOU
         Ze+0u8++X6YVyJ6kBchfsz/YQ0UboBWRTsyMGwRDeABO+P7PTTP4nmyunfk8qISLvZiT
         ZorQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768483278; x=1769088078; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TkP0hM67bjUhpg3/JQQDjTLNssee4v9f5cGmvtelswk=;
        b=hrr1CsEuH5pAquwXGEQb1OFVvYhhw+/HdL5Kr5oLgXtfSc9CcZY2GdjfVk/H0NWQ0g
         4ksS9K4r9LNkXjhwK7SPC2QIRbDqCFZYCj0f3XUuNUv8meoihB8xa/y09sU982875Q3/
         iBMfd1dHTeVOfsIZL4HudFyDLfOgCQqVMHB+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768483278; x=1769088078;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TkP0hM67bjUhpg3/JQQDjTLNssee4v9f5cGmvtelswk=;
        b=GW6NJtt/ClWbEVeQn3yvtX84De/OjYLemtIUl00DSiaMhOb5y9P06Tscp4RXOSXw91
         UX4/KNfX0gwLaMDtca/2CT79n/ftjioWADwu1pXLs0wJGAeWVebgNe51TN4R0G+Zlpf4
         MDZEQu6qlNohHI8PsqWwyPUl4fZwzdSYEHZYuIVzpFDBsHlyHu7A9vdvHF7/6l/0lYTu
         +j/7YnitIg/DWNoHpBx58vjVLga/NFPiXBlOzlyY/98vY1l2hfQXIAEyc5dQwiwEgylH
         BA8U62bJniJCmpe49o4aNqDY8xdkHltf2uWO3TH24fY8P6twXwE5CQqU58JGglhIESuj
         Craw==
X-Gm-Message-State: AOJu0YxTJdIyFjo55x/mNFRFtTNtwXJLwazTNNaGWpO6/12FHRyL46Rl
	+lPEMy6VGnPuXCCHWCqMS8qyDTN/WFVg/X9X7e1JAyvFb+fGM7mrbHGgFavstqcM8U/Pa+6w+ly
	qEBEDruFGj1uKsDh18EMj+ZBvIhR5GUccHDT+3mfXLg==
X-Gm-Gg: AY/fxX6xsWY7ZDFmmQLGg0CfiLb9Jl9Q8SlW2Q10VW91Rbkip/Ow5xDrxQiaDBXWwo4
	icsMD4IvKOFbLlHd6V8b7HcXi4x8zyTlZBSb5p3cPuCgay5XHZF3wjbQ9wUAa8JH8vhNVaYN9ph
	QBgJWjEOyIaUoFp7kVnH68Hl3ePeoi0+X3nLB6upT495I0FrWN4OL/1GUNATCpL8k4hPEDcMHAm
	7ZJLQLxVMURPr6Y3FRQE9vWDtxyQeyW6DX7ydlGVUsX8ui0+HTmSixtjfJl36z7ask52ZDq9/TB
	2LrUpBPLy//wHuEqLQI1Rxw+/IBA
X-Received: by 2002:a05:6402:2755:b0:64b:45db:3624 with SMTP id
 4fb4d7f45d1cf-653ec454513mr2990652a12.3.1768483277876; Thu, 15 Jan 2026
 05:21:17 -0800 (PST)
MIME-Version: 1.0
References: <20260113144314.3563680-1-adam.duskett@amarulasolutions.com>
 <20260113144314.3563680-5-adam.duskett@amarulasolutions.com>
 <575011.1768317186376112526@lists.openembedded.org> <CAHDQB6M5xD30LAKA5T9T39v4ywXmZWHmceLx2HZxhNkyJW2pVA@mail.gmail.com>
 <CAHT-cZtVeggW=PiajsgtDT+y0+JCmMQV9aFXbk_CwvGXLA91PQ@mail.gmail.com>
 <CAHDQB6P3Hv-2q=0z90E0e-HbOL+z6tWao-2yEsK6wmB-sFtGOw@mail.gmail.com> <CAHT-cZsWLK8pc11cpo_=8C2kKsQEeOz7J-U6EoW3KANkwnaiYw@mail.gmail.com>
In-Reply-To: <CAHT-cZsWLK8pc11cpo_=8C2kKsQEeOz7J-U6EoW3KANkwnaiYw@mail.gmail.com>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Thu, 15 Jan 2026 14:21:06 +0100
X-Gm-Features: AZwV_QgIbOOvSZ9jOJFenlGzUYKKX0cIcUeA5kDoUDcmoquokl3UPc08raGKmmI
Message-ID: <CAHDQB6MWcsKkJvt6kuZsGBrJNFW-+jJvN-D9koSrcwt8Y8FLog@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/6] wic: extra-partitions: Make extra-files optional
To: Pierre-loup GOSSE <pierre-loup.gosse@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000091bfee06486d1992"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 13:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229408

--00000000000091bfee06486d1992
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Pierre-loup;

I submitted a new patch series that:
 - Expands the WicError message if files are not present for clarity.
 - Extends the functionality of extra-partition to accept a
space-delineated list of directories.
 - Errors out if extra files and extra directories are not specified.

Hopefully this is a good compromise for you!


On Wed, Jan 14, 2026 at 6:13=E2=80=AFPM Pierre-loup GOSSE <
pierre-loup.gosse@smile.fr> wrote:

> Hi,
>
> That's understood. but does it really matter? Is it hurting anyone or
>> anything if they use --source extra-partition?
>
>
> This change could lead to unintended behavior if a user makes a typo in
> the variable, for example "fooo" instead of "foo":
>
>     IMAGE_EXTRA_PARTITION_FILES_label-fooo =3D "bar.conf"
>
>     part --source extra-partition --fstype=3Dext4 --label foo
>
> In this case, the user might expect the build to fail. The current versio=
n
> throws a fatal error, while your version would only notice it with the
> debug option, but still accept it.
>
> People see the "extra partition" plugin and assume they can make extra
>> partitions from it. The plugin isn't named "extra partition with mandato=
ry
>> files"
>
>
> I understand that the plugin name might create this assumption, and it
> could be renamed. However, the plugin's description is clear:
>
>     Populates an extra partition with files listed in the
> IMAGE_EXTRA_PARTITION_FILES
>     BitBake variable. Files should be deployed to the DEPLOY_DIR_IMAGE
> directory.
>
> Our visions on the plugin differ. From my point of view, since creating a
> blank empty partition is already supported by Wic without a plugin (thoug=
h
> perhaps not well-documented, that's another subject), I see no real reaso=
n
> and a disadvantage in allowing the extra-partition plugin to work without
> files (or directories).
>
> Pierre-Loup,
>
>
> On Wed, Jan 14, 2026 at 11:56=E2=80=AFAM Adam Duskett <
> adam.duskett@amarulasolutions.com> wrote:
>
>>
>> Hey Pierre-loup;
>>
>>
>>
>> On Wed, Jan 14, 2026 at 11:25=E2=80=AFAM Pierre-loup GOSSE <
>> pierre-loup.gosse@smile.fr> wrote:
>>
>>> Hi Adam,
>>>
>>> I'm not seeing the problem with making this optional. A bootimg
>>>> partition requires certain files to be present for a system to boot.
>>>> An extra partition doesn't.
>>>>
>>>
>>> My point is, why use the extra-partition plugin without files if
>>> omitting --source already achieves the same result ?
>>>
>>>     part --source extra-partition --fstype=3Dext4 --label data
>>> --fixed-size 500M
>>>
>>> Is equivalent to:
>>>
>>>     part --fstype=3Dext4 --label data --fixed-size 500M
>>>
>>> If your empty extra partition does not requires files, then there is no=
t
>>> need to use the extra-partition plugin.
>>>
>> That's understood. but does it really matter? Is it hurting anyone or
>> anything if they use --source extra-partition?
>>
>>
>>> This is why I designed the plugin to requires files, or creating
>>> directories as in your patch 6/6. If both are optional, I don't see the
>>> added value of using the extra-partition plugin for this use case.
>>>
>> People see the "extra partition" plugin and assume they can make extra
>> partitions from it. The plugin isn't named "extra partition with mandato=
ry
>> files"
>>
>>>
>>> That said, I'm open to making the plugin more flexible. It could allow
>>> no files or directories, but it should raise a warning or a notice.
>>>
>> With this patch series, It does throw a notice. For both empty
>> directories and empty files.
>>
>>>
>>> Pierre-Loup,
>>>
>>>
>>> On Wed, Jan 14, 2026 at 10:26=E2=80=AFAM Adam Duskett <
>>> adam.duskett@amarulasolutions.com> wrote:
>>>
>>>> Hi Pierre! Thanks for the review!
>>>>
>>>> On Tue, Jan 13, 2026 at 4:13=E2=80=AFPM Pierre-loup GOSSE via
>>>> lists.openembedded.org <pierre-loup.gosse=3D
>>>> smile.fr@lists.openembedded.org> wrote:
>>>>
>>>>> Hi Adam,
>>>>>
>>>>> Thanks for your contribution to the plugin.
>>>>>
>>>>>
>>>>> There are many use cases where a user may need a blank partition of a
>>>>> given
>>>>> size and format with no extra files added. Such as an empty data
>>>>> partition.
>>>>>
>>>>>
>>>>> A blank partition can already be created without the extra-partition
>>>>> plugin.
>>>>>
>>>>> Personally, I use the following example line in my WKS file:
>>>>>
>>>>>   part --fstype=3Dext4 --label data --fixed-size 500M
>>>>>
>>>>> This command creates a blank 500MB partition with an ext4 filesystem.
>>>>>
>>>>> In my opinion, the extra plugin should always requires files, similar
>>>>> to the bootimg partition plugin (on which the extra partition plugin =
is
>>>>> based).
>>>>>
>>>>>
>>>> I'm not seeing the problem with making this optional. A bootimg
>>>> partition requires certain files to be present for a system to boot.
>>>> An extra partition doesn't.
>>>>
>>>> Adam
>>>>
>>>>> Pierre-Loup,
>>>>>
>>>>>
>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>> Links: You receive all messages sent to this group.
>>>>> View/Reply Online (#229273):
>>>>> https://lists.openembedded.org/g/openembedded-core/message/229273
>>>>> Mute This Topic: https://lists.openembedded.org/mt/117243676/10152556
>>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
>>>>> [adam.duskett@amarulasolutions.com]
>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>>
>>>>>

--00000000000091bfee06486d1992
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hello Pierre-loup;</div><div><br></d=
iv><div>I submitted a new patch series that:</div><div><div>=C2=A0- Expands=
 the WicError message if files are not present for clarity.</div></div><div=
>=C2=A0- Extends the functionality of extra-partition to accept a space-del=
ineated list of directories.</div><div>=C2=A0- Errors out if extra files an=
d extra directories are not specified.</div><div><br></div><div>Hopefully t=
his is a good compromise for you!</div><br></div><br><div class=3D"gmail_qu=
ote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Ja=
n 14, 2026 at 6:13=E2=80=AFPM Pierre-loup GOSSE &lt;<a href=3D"mailto:pierr=
e-loup.gosse@smile.fr">pierre-loup.gosse@smile.fr</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hi,<=
/div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">That&=
#39;s understood. but does it really matter? Is it hurting anyone or anythi=
ng if they use --source extra-partition?</blockquote><div><br></div><div>Th=
is change could lead to unintended behavior if a user makes a typo in the v=
ariable, for example &quot;fooo&quot; instead of &quot;foo&quot;:</div><div=
><br></div><div>=C2=A0 =C2=A0 <span style=3D"font-family:monospace">IMAGE_E=
XTRA_PARTITION_FILES_label-fooo =3D &quot;bar.conf&quot;</span></div><div><=
span style=3D"font-family:monospace"><br></span></div><div><span style=3D"f=
ont-family:sans-serif">=C2=A0 =C2=A0 </span><span style=3D"font-family:mono=
space">part --source extra-partition --fstype=3Dext4 --label foo</span></di=
v><div><br></div><div>In
 this case, the user might expect the build to fail.=C2=A0The current versi=
on
 throws a fatal error, while your version would only notice it with the deb=
ug
 option, but still accept it.</div><div><br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">People see the &quot;extra partition&quot; plugin =
and assume they can make extra=20
partitions from it. The plugin isn&#39;t named &quot;extra partition with=
=20
mandatory files&quot;</blockquote><div><br></div><div>I understand that the=
=20
plugin name might create this assumption, and it could be renamed.=20
However, the plugin&#39;s description is clear:</div><div><span style=3D"fo=
nt-family:monospace"><br></span></div><div><span style=3D"font-family:monos=
pace">=C2=A0 =C2=A0 Populates an extra partition with files listed in the I=
MAGE_EXTRA_PARTITION_FILES</span></div><span style=3D"font-family:monospace=
">=C2=A0 =C2=A0 BitBake variable. Files should be deployed to the DEPLOY_DI=
R_IMAGE directory.</span><div><br></div><div>Our
 visions on the plugin differ. From my point of view, since creating a=20
blank empty partition is already supported by Wic without a plugin=20
(though perhaps not well-documented, that&#39;s another subject), I see no=
=20
real reason and a disadvantage in allowing the extra-partition plugin to
 work without files (or directories).</div><div><br></div><div>Pierre-Loup,=
</div><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Wed, Jan 14, 2026 at 11:56=E2=80=AFAM Adam Duskett &lt;<a href=
=3D"mailto:adam.duskett@amarulasolutions.com" target=3D"_blank">adam.dusket=
t@amarulasolutions.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div><br clear=3D"a=
ll"></div><div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr">=
<span>Hey Pierre-loup;</span><span><div><br></div></span></div></div></div>=
<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Wed, Jan 14, 2026 at 11:25=E2=80=AFAM Pierre-loup GOSSE &lt;<a href=
=3D"mailto:pierre-loup.gosse@smile.fr" target=3D"_blank">pierre-loup.gosse@=
smile.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div dir=3D"ltr"><div>Hi Adam,</div><div><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div>I&#39;m not seeing the problem with =
making this optional. A bootimg=20
partition requires certain files to be present for a system to boot.</div><=
div>An extra partition doesn&#39;t.</div></blockquote><div><br></div><div>M=
y point is, why use the extra-partition plugin without files if omitting <s=
pan style=3D"font-family:monospace">--source</span> already achieves the sa=
me result ?</div><div><br></div><div><span style=3D"font-family:&quot;couri=
er new&quot;,courier">=C2=A0 =C2=A0 part --source extra-partition --fstype=
=3Dext4 --label data --fixed-size 500M</span></div><div><br></div><div>Is e=
quivalent to:</div><div><br></div><div><span style=3D"font-family:&quot;cou=
rier new&quot;,courier">=C2=A0 =C2=A0 part --fstype=3Dext4 --label data --f=
ixed-size 500M</span></div><div><br></div></div></blockquote><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div></div><div>If you=
r empty extra partition does not requires files, then there is not need to =
use the extra-partition plugin.</div></div></blockquote><div><div>That&#39;=
s understood. but does it really matter? Is it hurting anyone or anything i=
f they use --source extra-partition?</div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div dir=3D"ltr"><div>This is why I designed t=
he plugin to requires files, or creating directories as in your patch 6/6. =
If both are optional, I don&#39;t see the added value of using the extra-pa=
rtition plugin for this use case.</div></div></blockquote><div>People see t=
he &quot;extra partition&quot; plugin and assume they can make extra partit=
ions from it. The plugin isn&#39;t named &quot;extra partition with mandato=
ry files&quot;</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"ltr"><div><br></div><div>That said, I&#39;m open to making the plugi=
n more flexible. It could allow no files or directories, but it should rais=
e a warning or a notice.</div></div></blockquote><div>With this patch serie=
s, It does throw a notice. For both empty directories and empty files.</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><b=
r></div><div>Pierre-Loup,</div><div><br></div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 14, 2026 at 10:26=
=E2=80=AFAM Adam Duskett &lt;<a href=3D"mailto:adam.duskett@amarulasolution=
s.com" target=3D"_blank">adam.duskett@amarulasolutions.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">=
<div dir=3D"ltr"><div>Hi Pierre! Thanks for the review!</div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 13=
, 2026 at 4:13=E2=80=AFPM Pierre-loup GOSSE via <a href=3D"http://lists.ope=
nembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;pierre-loup=
.gosse=3D<a href=3D"mailto:smile.fr@lists.openembedded.org" target=3D"_blan=
k">smile.fr@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div>Hi Adam,</div>
<div>=C2=A0</div>
<div>Thanks for your contribution to the plugin.</div>
<div>=C2=A0</div>
<blockquote>
<div>There are many use cases where a user may need a blank partition of a =
given<br>size and format with no extra files added. Such as an empty data p=
artition.</div>
</blockquote>
<div>=C2=A0</div>
<div>A blank partition can already be created without the extra-partition p=
lugin.</div>
<div>=C2=A0</div>
<div>Personally, I use the following example line in my WKS file:</div>
<div>=C2=A0</div>
<div><span style=3D"font-family:&quot;courier new&quot;,courier">=C2=A0 par=
t --fstype=3Dext4 --label data --fixed-size 500M</span></div>
<div>=C2=A0</div>
<div>This command creates a blank 500MB partition with an ext4 filesystem.<=
/div>
<div>=C2=A0</div>
<div>In my opinion, the extra plugin should always requires files, similar =
to the bootimg partition plugin (on which the extra partition plugin is bas=
ed).</div>
<div>=C2=A0</div></blockquote><div>I&#39;m not seeing the problem with maki=
ng this optional. A bootimg partition requires certain files to be present =
for a system to boot.</div><div>An extra partition doesn&#39;t.</div><div><=
br></div><div>Adam=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
<div>Pierre-Loup,</div>
<div>=C2=A0</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#229273): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/229273" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/229273</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117243676/101=
52556" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
mt/117243676/10152556</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:adam.duskett@amarulasoluti=
ons.com" target=3D"_blank">adam.duskett@amarulasolutions.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>
</blockquote></div>
</blockquote></div></div>
</blockquote></div>
</blockquote></div></div>

--00000000000091bfee06486d1992--

