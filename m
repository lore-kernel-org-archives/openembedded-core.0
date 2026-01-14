Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99647D30CF8
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 10:25:53 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7156.1768386347486404350
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 02:25:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OEqdpVgq;
 spf=pass (domain: smile.fr, ip: 209.85.208.182, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-382f9930e54so5456631fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 02:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768386345; x=1768991145; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+AV/ORN4g9t+Ty+JS1ax1zq49k+O3DiePrFrt9lmrKU=;
        b=OEqdpVgqSX3S7aj0uKPNXN7G7opU8ApKH0xy0CQzGYuDTPpqszmQbw4qeuu5C9OJBe
         nepxo+Wsn3PyBHJwCbs81rxykhgwmS27YDK7bMpJdNHQmc+onm4OrIr42h2fAsWdH71u
         eayo0VaZp5VkjkqE5xgEszqHoMkNUmV0s+2+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768386345; x=1768991145;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+AV/ORN4g9t+Ty+JS1ax1zq49k+O3DiePrFrt9lmrKU=;
        b=Pu993jNnxYjI9qRMk5S62lZogmC5npYGrMBxKJUTLBIHAPaatUoHN4uyUZm6omr6TI
         udoyuEBv+bVa+b864QWvGoAfCzPeZ5iOFlShkCBBWGsvx2Xosbz5zpJ8g6/V0Glyc6fq
         mz6XX4lwj51OAhEtzCrPQgz0rVh6I9VwjvViBuIfXJWbC5V2cXNGS4OYAoE227NfQCPe
         LtR4r3xMGfXnjsLG78hF8HXsQO33JsBQ4muNDak7Oi/AZGUU8wBsNCD+mtzwI3DQIM11
         e0k5k8tICX3cXLTJozoTxY59EZaQmNIcFv1/WEioeP3ontT2wiao1uKlEdCBeYdDv2Y5
         PcQg==
X-Gm-Message-State: AOJu0Yx+DiUogKhDRJDoSpsgfWJe8aflSJ/veykZw1xNbsQe1dNu/IMQ
	85OGy4mLSFQDx5hNXCKysdftPsSBeyqHgwPyIUzfIDJqrS16ll38eoNeZFsXhu/vH3WQjLM6Itl
	P48XK9oUYouRBA9ZU/ArWENYXgL7s0To+HFmB29bs4w==
X-Gm-Gg: AY/fxX7J/bD5TRsW34XDSXZPdHQbyo2PccS7VNS8tX+ziuZuxXKc9CbCpupa9fjaUP+
	XwgRbrS3bHotg+qn2zpztS4azdvfbtfES2Hg9McBANzl63vTUmVaoeMtl0cRW/bmFJf7xt16HVb
	0kOxGHigSgyw+9UkOjs9Y/+z4C5rDAwkgvmjLlfr+5+tOTHnhtUE09aeotgbODxuW1tc/DNtReE
	pUgenCfyAH5UEjivaMZhDqrSpx/MVmY71ImCi8vYI5TRkAmEKsbSM0H2sf7X0dxgJjRC9AqGnxX
	9ZefidIrtu4mYNfFFrFwvntTsEiBLqG0Fy9nlpIwAbMWl1AEercmHdj4
X-Received: by 2002:a05:651c:991:b0:37f:8f33:e9f7 with SMTP id
 38308e7fff4ca-38360b8e30fmr6789481fa.17.1768386345312; Wed, 14 Jan 2026
 02:25:45 -0800 (PST)
MIME-Version: 1.0
References: <20260113144314.3563680-1-adam.duskett@amarulasolutions.com>
 <20260113144314.3563680-5-adam.duskett@amarulasolutions.com>
 <575011.1768317186376112526@lists.openembedded.org> <CAHDQB6M5xD30LAKA5T9T39v4ywXmZWHmceLx2HZxhNkyJW2pVA@mail.gmail.com>
In-Reply-To: <CAHDQB6M5xD30LAKA5T9T39v4ywXmZWHmceLx2HZxhNkyJW2pVA@mail.gmail.com>
From: Pierre-loup GOSSE <pierre-loup.gosse@smile.fr>
Date: Wed, 14 Jan 2026 11:25:33 +0100
X-Gm-Features: AZwV_QhngmZU7bt1kALDaMJuw6mRMT_jDM9wNCvAMY-oRRneGVOj5BvtiPoSzr0
Message-ID: <CAHT-cZtVeggW=PiajsgtDT+y0+JCmMQV9aFXbk_CwvGXLA91PQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/6] wic: extra-partitions: Make extra-files optional
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f038280648568747"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 10:25:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229315

--000000000000f038280648568747
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Adam,

I'm not seeing the problem with making this optional. A bootimg partition
> requires certain files to be present for a system to boot.
> An extra partition doesn't.
>

My point is, why use the extra-partition plugin without files if omitting
--source already achieves the same result ?

    part --source extra-partition --fstype=3Dext4 --label data --fixed-size
500M

Is equivalent to:

    part --fstype=3Dext4 --label data --fixed-size 500M

If your empty extra partition does not requires files, then there is not
need to use the extra-partition plugin.
This is why I designed the plugin to requires files, or creating
directories as in your patch 6/6. If both are optional, I don't see the
added value of using the extra-partition plugin for this use case.

That said, I'm open to making the plugin more flexible. It could allow no
files or directories, but it should raise a warning or a notice.

Pierre-Loup,


On Wed, Jan 14, 2026 at 10:26=E2=80=AFAM Adam Duskett <
adam.duskett@amarulasolutions.com> wrote:

> Hi Pierre! Thanks for the review!
>
> On Tue, Jan 13, 2026 at 4:13=E2=80=AFPM Pierre-loup GOSSE via
> lists.openembedded.org <pierre-loup.gosse=3Dsmile.fr@lists.openembedded.o=
rg>
> wrote:
>
>> Hi Adam,
>>
>> Thanks for your contribution to the plugin.
>>
>>
>> There are many use cases where a user may need a blank partition of a
>> given
>> size and format with no extra files added. Such as an empty data
>> partition.
>>
>>
>> A blank partition can already be created without the extra-partition
>> plugin.
>>
>> Personally, I use the following example line in my WKS file:
>>
>>   part --fstype=3Dext4 --label data --fixed-size 500M
>>
>> This command creates a blank 500MB partition with an ext4 filesystem.
>>
>> In my opinion, the extra plugin should always requires files, similar to
>> the bootimg partition plugin (on which the extra partition plugin is bas=
ed).
>>
>>
> I'm not seeing the problem with making this optional. A bootimg partition
> requires certain files to be present for a system to boot.
> An extra partition doesn't.
>
> Adam
>
>> Pierre-Loup,
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#229273):
>> https://lists.openembedded.org/g/openembedded-core/message/229273
>> Mute This Topic: https://lists.openembedded.org/mt/117243676/10152556
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> adam.duskett@amarulasolutions.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--000000000000f038280648568747
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Adam,</div><div><br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div>I&#39;m not seeing the problem with making t=
his optional. A bootimg=20
partition requires certain files to be present for a system to boot.</div><=
div>An extra partition doesn&#39;t.</div></blockquote><div><br></div><div>M=
y point is, why use the extra-partition plugin without files if omitting <s=
pan style=3D"font-family:monospace">--source</span> already achieves the sa=
me result ?</div><div><br></div><div><span style=3D"font-family:&quot;couri=
er new&quot;,courier">=C2=A0 =C2=A0 part --source extra-partition --fstype=
=3Dext4 --label data --fixed-size 500M</span></div><div><br></div><div>Is e=
quivalent to:</div><div><br></div><div><span style=3D"font-family:&quot;cou=
rier new&quot;,courier">=C2=A0 =C2=A0 part --fstype=3Dext4 --label data --f=
ixed-size 500M</span></div><div><br></div><div>If your empty extra partitio=
n does not requires files, then there is not need to use the extra-partitio=
n plugin.</div><div>This is why I designed the plugin to requires files, or=
 creating directories as in your patch 6/6. If both are optional, I don&#39=
;t see the added value of using the extra-partition plugin for this use cas=
e.</div><div><br></div><div>That said, I&#39;m open to making the plugin mo=
re flexible. It could allow no files or directories, but it should raise a =
warning or a notice.</div><div><br></div><div>Pierre-Loup,</div><div><br></=
div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"=
ltr" class=3D"gmail_attr">On Wed, Jan 14, 2026 at 10:26=E2=80=AFAM Adam Dus=
kett &lt;<a href=3D"mailto:adam.duskett@amarulasolutions.com">adam.duskett@=
amarulasolutions.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Pierre! Thank=
s for the review!</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Tue, Jan 13, 2026 at 4:13=E2=80=AFPM Pierre-loup =
GOSSE via <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists=
.openembedded.org</a> &lt;pierre-loup.gosse=3D<a href=3D"mailto:smile.fr@li=
sts.openembedded.org" target=3D"_blank">smile.fr@lists.openembedded.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
>Hi Adam,</div>
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

--000000000000f038280648568747--

