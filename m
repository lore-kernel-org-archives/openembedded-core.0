Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA381D29FEC
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 10:56:33 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7655.1768388185689897829
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 02:56:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=OOLvl1Tp;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.43, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-64b686e7d04so1287309a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 02:56:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768388184; cv=none;
        d=google.com; s=arc-20240605;
        b=SGUf3aEtXzzYEfLUgrR+yGHlEYZmR5edDopTz16XgvMQvallW9RvheETAX5v53DjEU
         nN2mELQgZGDVG2cjkTRkuoBeasdB8Kgs3EXmkKI6pcBI9HIC/SxW8iwFG3L5C1af0CvQ
         rpaRDXLzEZT6LYmoU7mzqw4uG1BXfL9BKcKt+ELb4ALHJavS6fCA8yYkYNYBJY++yAJH
         TIR0Cv5vxxgcV+xd8j1eK5rT8nIG55VEszXmjMirwSFyh6dSX3Bjny0rTRNqVXcD5TR6
         bsGkE+REDPbqeTWZ7VMez3s7nuGqA1zCzf5iFEe8JI8uNQWPVKMsWskbFeLdewtMCDVy
         OPIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ras0YWIsapvZmM4aqBqZMdTYkyQDkJW+VcvLdZioG/g=;
        fh=jStBI1HRfQh370+Ez+tO/NSlVH+zosDaQO/ip8jArss=;
        b=a3Ao1hlsuQim4HUH/NGZrTdNYbETzPJAjZDrt+Jg+3L40cS4lDB2L/MULAbVCBvw/I
         O2wBKNSmEl0pxllif5VnO8fqNtOCynOJGOZm0zk9ADwF0m/rJzT8Nc4EWT+WIi+3N4+E
         rKIXP9BHvG4e+3CxCs/s2JyBMigdCE6YD7XNLTYnAg54snsFkxjFxjm2Dsp2VPORX3d0
         in/1afnQxjbh50goldP0ooO5zmdFtNztVd1SES5RNWeewlhOLiGI0MYCLCo/iN7prLih
         fUStNaJ7MscLeWaz1KPXWXs0LXbOpAtoIVC7cEpTez8W07XdVcVv3lGgv2ShSiDvxuz7
         n4Lw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768388184; x=1768992984; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ras0YWIsapvZmM4aqBqZMdTYkyQDkJW+VcvLdZioG/g=;
        b=OOLvl1TpzUaKB/wx+Kw3DGdyiOPuqEmSSCgeM+qMb7x0YzYJvaNv+pbf3dub77ATdb
         MfbMRWIfX9F/VrFc4qIj81vMK/iewK5kJxZSkLrYLtzBedeRqu/PKsHExrLjwV47QXDp
         OMS5CYsdUQ6XzC+awNBmMmyGaGvNDtctqEG24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768388184; x=1768992984;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ras0YWIsapvZmM4aqBqZMdTYkyQDkJW+VcvLdZioG/g=;
        b=FnqMxLD4GZ4rd15EW7JxPyuQRPWplbgI+aHF8KzI4y9ow5TdIQQI3autm2F7iI7G21
         yzLi0hKRNighbTJNEuom+Rro35bTZuiIEJFQmfjiFI0DsSE7nIz/1woWrrwbZRhO4yii
         SB3/nvlfmojGNAlbgzFpfj7N+TmT/hw3MbS2M04Jxw9t9UtKwc3iZmCK46fYPG8kX7oj
         SHZYyUgSMKXkrZ2Tcu0WlhTcFvj7zF7mlwgeHO3pJBhgc75ehxw370nUysorM4gEoP5q
         m9w0WDsaYpx8FbrWuWWWwk5MoLfFxD4NSgtR+5cPY9jDBriyrkzRMIEaH1LI0xS8LYde
         FW/w==
X-Gm-Message-State: AOJu0YxpOtbdDmK2MGbwsxJMN5ImSaQfWSDbEVLFnV8BtMOyW/ctXS6s
	yTwFNDYzPr6wN3cb6ml/jCiCFvFEJ5upGd9oOEtouHQ7b1t+6lY58CK409IkP0W1OwNVNnHtBoD
	mnMjWHR1H4OHnRREXOvy2Zfb3omNzWA8HncQl9SdcM8ytr+2Eo3S+K8k=
X-Gm-Gg: AY/fxX5oGhJ/EBu21+HZZeAw4lgM/vEWD2RMhVfBHoxmBxZxIMPALywxmzwLrkk/+0e
	lNg9T1peAWR2yXEKiNkvy6Z6vHzq4QYVb/9OQ048dnbTMx055gLqDP5eIzsNUuYYJOurUIpR4tD
	0J+an9LOFPGdZA4PkfgA7SSbYMJPK7RdFHVrz6EhMsL0N7FA1fEMyH3jfMaKeVoRwnKhLKNL4hL
	pRtMKqgOdyi3Q/UO0WRb758VdY2EdpPmYRfwwGLsBVqhLV/f2P2BHZmdkvZ1mNywJe+ORmlFArt
	V8HAm21Q5IqUwmVCipmJ/LgLZ1l5
X-Received: by 2002:a05:6402:2346:b0:649:5709:aafc with SMTP id
 4fb4d7f45d1cf-653ec4825e0mr996366a12.7.1768388183519; Wed, 14 Jan 2026
 02:56:23 -0800 (PST)
MIME-Version: 1.0
References: <20260113144314.3563680-1-adam.duskett@amarulasolutions.com>
 <20260113144314.3563680-5-adam.duskett@amarulasolutions.com>
 <575011.1768317186376112526@lists.openembedded.org> <CAHDQB6M5xD30LAKA5T9T39v4ywXmZWHmceLx2HZxhNkyJW2pVA@mail.gmail.com>
 <CAHT-cZtVeggW=PiajsgtDT+y0+JCmMQV9aFXbk_CwvGXLA91PQ@mail.gmail.com>
In-Reply-To: <CAHT-cZtVeggW=PiajsgtDT+y0+JCmMQV9aFXbk_CwvGXLA91PQ@mail.gmail.com>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Wed, 14 Jan 2026 11:56:11 +0100
X-Gm-Features: AZwV_Qi7VcgKrm63NJVu6VR3bNibqNIIGVQ9lHpBrpn1_azR0yJ95CjFSMf5Nz0
Message-ID: <CAHDQB6P3Hv-2q=0z90E0e-HbOL+z6tWao-2yEsK6wmB-sFtGOw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/6] wic: extra-partitions: Make extra-files optional
To: Pierre-loup GOSSE <pierre-loup.gosse@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000081039c064856f51e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 10:56:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229319

--00000000000081039c064856f51e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Pierre-loup;



On Wed, Jan 14, 2026 at 11:25=E2=80=AFAM Pierre-loup GOSSE <
pierre-loup.gosse@smile.fr> wrote:

> Hi Adam,
>
> I'm not seeing the problem with making this optional. A bootimg partition
>> requires certain files to be present for a system to boot.
>> An extra partition doesn't.
>>
>
> My point is, why use the extra-partition plugin without files if omitting
> --source already achieves the same result ?
>
>     part --source extra-partition --fstype=3Dext4 --label data --fixed-si=
ze
> 500M
>
> Is equivalent to:
>
>     part --fstype=3Dext4 --label data --fixed-size 500M
>
> If your empty extra partition does not requires files, then there is not
> need to use the extra-partition plugin.
>
That's understood. but does it really matter? Is it hurting anyone or
anything if they use --source extra-partition?


> This is why I designed the plugin to requires files, or creating
> directories as in your patch 6/6. If both are optional, I don't see the
> added value of using the extra-partition plugin for this use case.
>
People see the "extra partition" plugin and assume they can make extra
partitions from it. The plugin isn't named "extra partition with mandatory
files"

>
> That said, I'm open to making the plugin more flexible. It could allow no
> files or directories, but it should raise a warning or a notice.
>
With this patch series, It does throw a notice. For both empty directories
and empty files.

>
> Pierre-Loup,
>
>
> On Wed, Jan 14, 2026 at 10:26=E2=80=AFAM Adam Duskett <
> adam.duskett@amarulasolutions.com> wrote:
>
>> Hi Pierre! Thanks for the review!
>>
>> On Tue, Jan 13, 2026 at 4:13=E2=80=AFPM Pierre-loup GOSSE via
>> lists.openembedded.org <pierre-loup.gosse=3Dsmile.fr@lists.openembedded.=
org>
>> wrote:
>>
>>> Hi Adam,
>>>
>>> Thanks for your contribution to the plugin.
>>>
>>>
>>> There are many use cases where a user may need a blank partition of a
>>> given
>>> size and format with no extra files added. Such as an empty data
>>> partition.
>>>
>>>
>>> A blank partition can already be created without the extra-partition
>>> plugin.
>>>
>>> Personally, I use the following example line in my WKS file:
>>>
>>>   part --fstype=3Dext4 --label data --fixed-size 500M
>>>
>>> This command creates a blank 500MB partition with an ext4 filesystem.
>>>
>>> In my opinion, the extra plugin should always requires files, similar t=
o
>>> the bootimg partition plugin (on which the extra partition plugin is ba=
sed).
>>>
>>>
>> I'm not seeing the problem with making this optional. A bootimg partitio=
n
>> requires certain files to be present for a system to boot.
>> An extra partition doesn't.
>>
>> Adam
>>
>>> Pierre-Loup,
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#229273):
>>> https://lists.openembedded.org/g/openembedded-core/message/229273
>>> Mute This Topic: https://lists.openembedded.org/mt/117243676/10152556
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>>> adam.duskett@amarulasolutions.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>>

--00000000000081039c064856f51e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><br clear=3D"all"></div><div><div di=
r=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><span>Hey Pierre-loup;=
</span><span><div><br></div></span></div></div></div><br></div><br><div cla=
ss=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Wed, Jan 14, 2026 at 11:25=E2=80=AFAM Pierre-loup GOSSE &lt;<a href=
=3D"mailto:pierre-loup.gosse@smile.fr">pierre-loup.gosse@smile.fr</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div>Hi Adam,</div><div><br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div>I&#39;m not seeing the problem with making this opti=
onal. A bootimg=20
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

--00000000000081039c064856f51e--

