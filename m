Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B51D38FF2
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 17:13:16 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15489.1768410793500460368
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 09:13:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pTxJXhN4;
 spf=pass (domain: smile.fr, ip: 209.85.167.52, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59b6df3d6b4so75899e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 09:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768410792; x=1769015592; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GH50bBArSHXoL2T8g5nwTrZ2r8yLULmzsU77qDDMPhA=;
        b=pTxJXhN4EQYxAKUIPmGiXLWCDVXk6IYwOyWwVYNjie4qlKGCB59CZoA1Yp0Ae91bdp
         MjVwkkJHRIF1FiTj6nJqqCRTgql198Z2ry/QcXry3vZcdCCN7Zd2aXvfoNZyjvnk8Vqr
         5mr1PvolHQtFOVavJwvAR31lN6Kp+MNLl/yRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768410792; x=1769015592;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GH50bBArSHXoL2T8g5nwTrZ2r8yLULmzsU77qDDMPhA=;
        b=mI2b4K1RMHcj5rojK8m37bo5Y8jPvLPV+/KSQ6myczcudDFT5qcElr7aoTyKz6BIzX
         wHOWdajvTExbtn5eGIDXB84lcwFHiLcTJhAPgCOwHj2IA1xZj/QRNrsXaKvw/QIIT9Sh
         et6P8LMI5M6dsDG/NBYrhTOWNqTNWpXRxLFPktfCxqsQB2R3XsEKe+aJBXQq8EPurWjX
         s7tfXrVIkQUQG8gaqbXDFIsyUsY5CKUCot97vvqyvWYKeBDib5zRqe7ould4lMMNT/ER
         EuM9PQbSLhYquFzM7w3SFZco5GEDtg1MONnIr2/WBfYnqZRw75rr6CZVwjD1qHgGiLue
         vDJQ==
X-Gm-Message-State: AOJu0Yw02kjx72dRiIzFt8K/WpnIkoEpz8hRve487GcOPT04fMBwhZBK
	T4HQ8CmI3xFf1OGBRHfnwBjnpv2pazlqqAQHp1JdGtcAKCkAPnUkBl9/DreaAXHFiCkjqB03Ypa
	xCs8cGS1B7WSV6vv4c8n25FCeQ3MDcRaxIEZG2Bvrjw==
X-Gm-Gg: AY/fxX7AZ9oHNmJKtUVVG2g8Xu2zuVD0eEzMxfTYubKtWc2cQ7IKADCl2scboM7LTyB
	ADSBbQ29GSW/fwQY4kf3Tmx1diLJy01fnaHEnBK3rczyUWJRVPEQqUUHrFLmioCsvfBflNJ/fjG
	nwH/wl83WX/rLu2y8YBbxE2gLR2dq4cb5TGPhQRMe4HyQyk56SPGymPsUvA7s78/VhmPYfM6Ys8
	Mvs80O3ad83/qEQ4ri3rHc5plaa2z8usWqEKxfVRdTX3L97tCtwb4v3f+1+bOivP/lY5ntoo807
	FJ/FvSo/EJ+JJveWOCKqBwPAyUkWTK+fIIEjAWtJh6c8cA5Rc1PqNocL8cw/epyxemA=
X-Received: by 2002:a05:6512:304f:b0:591:ec11:7f93 with SMTP id
 2adb3069b0e04-59ba153797cmr1150712e87.23.1768410791473; Wed, 14 Jan 2026
 09:13:11 -0800 (PST)
MIME-Version: 1.0
References: <20260113144314.3563680-1-adam.duskett@amarulasolutions.com>
 <20260113144314.3563680-5-adam.duskett@amarulasolutions.com>
 <575011.1768317186376112526@lists.openembedded.org> <CAHDQB6M5xD30LAKA5T9T39v4ywXmZWHmceLx2HZxhNkyJW2pVA@mail.gmail.com>
 <CAHT-cZtVeggW=PiajsgtDT+y0+JCmMQV9aFXbk_CwvGXLA91PQ@mail.gmail.com> <CAHDQB6P3Hv-2q=0z90E0e-HbOL+z6tWao-2yEsK6wmB-sFtGOw@mail.gmail.com>
In-Reply-To: <CAHDQB6P3Hv-2q=0z90E0e-HbOL+z6tWao-2yEsK6wmB-sFtGOw@mail.gmail.com>
From: Pierre-loup GOSSE <pierre-loup.gosse@smile.fr>
Date: Wed, 14 Jan 2026 18:13:00 +0100
X-Gm-Features: AZwV_QjlOT1ypIbfNQ9CZuElNj7CX5CWXbQJyPhzQiJULjepPWcksoWc-5QdK2w
Message-ID: <CAHT-cZsWLK8pc11cpo_=8C2kKsQEeOz7J-U6EoW3KANkwnaiYw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/6] wic: extra-partitions: Make extra-files optional
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000b044306485c39f6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 17:13:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229355

--0000000000000b044306485c39f6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

That's understood. but does it really matter? Is it hurting anyone or
> anything if they use --source extra-partition?


This change could lead to unintended behavior if a user makes a typo in the
variable, for example "fooo" instead of "foo":

    IMAGE_EXTRA_PARTITION_FILES_label-fooo =3D "bar.conf"

    part --source extra-partition --fstype=3Dext4 --label foo

In this case, the user might expect the build to fail. The current version
throws a fatal error, while your version would only notice it with the
debug option, but still accept it.

People see the "extra partition" plugin and assume they can make extra
> partitions from it. The plugin isn't named "extra partition with mandator=
y
> files"


I understand that the plugin name might create this assumption, and it
could be renamed. However, the plugin's description is clear:

    Populates an extra partition with files listed in the
IMAGE_EXTRA_PARTITION_FILES
    BitBake variable. Files should be deployed to the DEPLOY_DIR_IMAGE
directory.

Our visions on the plugin differ. From my point of view, since creating a
blank empty partition is already supported by Wic without a plugin (though
perhaps not well-documented, that's another subject), I see no real reason
and a disadvantage in allowing the extra-partition plugin to work without
files (or directories).

Pierre-Loup,


On Wed, Jan 14, 2026 at 11:56=E2=80=AFAM Adam Duskett <
adam.duskett@amarulasolutions.com> wrote:

>
> Hey Pierre-loup;
>
>
>
> On Wed, Jan 14, 2026 at 11:25=E2=80=AFAM Pierre-loup GOSSE <
> pierre-loup.gosse@smile.fr> wrote:
>
>> Hi Adam,
>>
>> I'm not seeing the problem with making this optional. A bootimg partitio=
n
>>> requires certain files to be present for a system to boot.
>>> An extra partition doesn't.
>>>
>>
>> My point is, why use the extra-partition plugin without files if omittin=
g
>> --source already achieves the same result ?
>>
>>     part --source extra-partition --fstype=3Dext4 --label data --fixed-s=
ize
>> 500M
>>
>> Is equivalent to:
>>
>>     part --fstype=3Dext4 --label data --fixed-size 500M
>>
>> If your empty extra partition does not requires files, then there is not
>> need to use the extra-partition plugin.
>>
> That's understood. but does it really matter? Is it hurting anyone or
> anything if they use --source extra-partition?
>
>
>> This is why I designed the plugin to requires files, or creating
>> directories as in your patch 6/6. If both are optional, I don't see the
>> added value of using the extra-partition plugin for this use case.
>>
> People see the "extra partition" plugin and assume they can make extra
> partitions from it. The plugin isn't named "extra partition with mandator=
y
> files"
>
>>
>> That said, I'm open to making the plugin more flexible. It could allow n=
o
>> files or directories, but it should raise a warning or a notice.
>>
> With this patch series, It does throw a notice. For both empty directorie=
s
> and empty files.
>
>>
>> Pierre-Loup,
>>
>>
>> On Wed, Jan 14, 2026 at 10:26=E2=80=AFAM Adam Duskett <
>> adam.duskett@amarulasolutions.com> wrote:
>>
>>> Hi Pierre! Thanks for the review!
>>>
>>> On Tue, Jan 13, 2026 at 4:13=E2=80=AFPM Pierre-loup GOSSE via
>>> lists.openembedded.org <pierre-loup.gosse=3D
>>> smile.fr@lists.openembedded.org> wrote:
>>>
>>>> Hi Adam,
>>>>
>>>> Thanks for your contribution to the plugin.
>>>>
>>>>
>>>> There are many use cases where a user may need a blank partition of a
>>>> given
>>>> size and format with no extra files added. Such as an empty data
>>>> partition.
>>>>
>>>>
>>>> A blank partition can already be created without the extra-partition
>>>> plugin.
>>>>
>>>> Personally, I use the following example line in my WKS file:
>>>>
>>>>   part --fstype=3Dext4 --label data --fixed-size 500M
>>>>
>>>> This command creates a blank 500MB partition with an ext4 filesystem.
>>>>
>>>> In my opinion, the extra plugin should always requires files, similar
>>>> to the bootimg partition plugin (on which the extra partition plugin i=
s
>>>> based).
>>>>
>>>>
>>> I'm not seeing the problem with making this optional. A bootimg
>>> partition requires certain files to be present for a system to boot.
>>> An extra partition doesn't.
>>>
>>> Adam
>>>
>>>> Pierre-Loup,
>>>>
>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#229273):
>>>> https://lists.openembedded.org/g/openembedded-core/message/229273
>>>> Mute This Topic: https://lists.openembedded.org/mt/117243676/10152556
>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[
>>>> adam.duskett@amarulasolutions.com]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>
>>>>

--0000000000000b044306485c39f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">That&#39;s understood. but does it really matter? Is i=
t hurting anyone or anything if they use --source extra-partition?</blockqu=
ote><div><br></div><div>This change could lead to unintended behavior if a =
user makes a typo in the variable, for example &quot;fooo&quot; instead of =
&quot;foo&quot;:</div><div><br></div><div>=C2=A0 =C2=A0 <span style=3D"font=
-family:monospace">IMAGE_EXTRA_PARTITION_FILES_label-fooo =3D &quot;bar.con=
f&quot;</span></div><div><span style=3D"font-family:monospace"><br></span><=
/div><div><span style=3D"font-family:sans-serif">=C2=A0 =C2=A0 </span><span=
 style=3D"font-family:monospace">part --source extra-partition --fstype=3De=
xt4 --label foo</span></div><div><br></div><div>In
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
</div><br></div><br><div class=3D"gmail_quote gmail_quote_container"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 14, 2026 at 11:56=E2=80=AFAM Ad=
am Duskett &lt;<a href=3D"mailto:adam.duskett@amarulasolutions.com">adam.du=
skett@amarulasolutions.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div><br clear=
=3D"all"></div><div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"=
ltr"><span>Hey Pierre-loup;</span><span><div><br></div></span></div></div><=
/div><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Wed, Jan 14, 2026 at 11:25=E2=80=AFAM Pierre-loup GOSSE &lt;<a =
href=3D"mailto:pierre-loup.gosse@smile.fr" target=3D"_blank">pierre-loup.go=
sse@smile.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr"><div>Hi Adam,</div><div><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div>I&#39;m not seeing the problem w=
ith making this optional. A bootimg=20
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

--0000000000000b044306485c39f6--

