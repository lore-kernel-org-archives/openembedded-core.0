Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E14EC44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 12:32:54 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46837.1784723572422215567
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 05:32:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fP70fkeo;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so31225895e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 05:32:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784723571; cv=none;
        d=google.com; s=arc-20260327;
        b=TdlBOp7VuJpZLvHzsthDPyHYc7t5Z04nLYXH1Vqg6NXPZc2wJqo/jxLzBfgdlTrvAQ
         J77Nmdhj8IBrn5V5p7UoXZ4bEzUEqhTU+Jyc+xMRE6Zdw4jQm4cCzTZ1UPX5wyjxGxuc
         ywa1jwa/liREyIQ+bjpnQj0FSZS7oxlkz2TRRq/Qyq0M6Bf+bb/2BwXvwqJM4MI4hGjc
         lawUmPhek3dloTFRC8JIwo0vcN6bUaIA2+Pwkwv4oeYVML30Ge0GI/cAIW6J3YJ3yZ7Y
         2P4DYyKnx6IxuFv/zl3HithdJ3AV8bS0XQggoKcGHsJRzdT9yVya309vIvB1VYJenVMV
         07kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JQ/shmXBk06PFE6+hDs6XCFky+RbotDoDVV7UWu6rcA=;
        fh=cvVRkTdkM50qvF/wjALCpClc+7d9Hr0JhbIl8dAO9ps=;
        b=oSIw6Qz7zt5M8wus/uioNt/WKktZdemkXULerjkiUagYR9vXc1yV+RzyVaPZDPnXdJ
         GKzH0gwldM1BEH560SsFRQCKKSHGIV/1el0Ux1JrDAeQnYE7Axnt8ZGZMjKV7R64kZpH
         OzlERwlRmIDxPGQCHTM2op9lH/vBRe6p14Ea95Oyf69z6MbkPLDEETGgA4uwIkBkdObR
         Ld/LUQ83Q1h/Hl2DesjPyHoK8r8PzRWHT+2x+XQTxMSweD0M09LV9tWH/ll8TWPBtGAX
         7U1bVri00FUFZ08I7uR7CqjTOTcb5ZMwKAmAdNPte+73LXg+8lVmJo2d3Ph/9Fo5Luvr
         3NCA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784723571; x=1785328371; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JQ/shmXBk06PFE6+hDs6XCFky+RbotDoDVV7UWu6rcA=;
        b=fP70fkeoiYyE58RgzFyVNcEC2DWz9NSuTimxp5WohGiWKhUZedSeON1ipS/sVX8n9f
         7CoSqbFMWxpglHx1I9KHJNEfAKqst8KmNr2EWsEgJGCtIctCKynbAsZZGM66bhWAVTC2
         lBfJGBTqAZq3eQNa7i1nojHp9lwAOAKdEjwJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784723571; x=1785328371;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JQ/shmXBk06PFE6+hDs6XCFky+RbotDoDVV7UWu6rcA=;
        b=lTB6wFl4yt4W5ChWjy0P54DlaQsz7uJIonE6laxkimmUV53shvBX7uTYZ2hfaCSGgJ
         hutkenzR0QhBi+6PZbFUi04lJGvndmCPYV/RgUiFT+VJKUJiBKI18X7YgqCaeOj4aGb/
         RoqQpSF/wIPoMkFBBvIpKGMj3J/eRSijz+/av5S8Ro8gsOIuIiC5UqVqvqGQF9IFt4Lz
         H7vFcFnIK78N9mryFT/ZaobZPl9+1Wj6OfbRx81OM06gsyYuyyj3zJmxzAfLbO5XBmFK
         4DdgXLdZ8MOMRf9JDGDHcdQ5zY3e1RDKxWsWQLP3VtDsD85EOeOm85oP8ebW7nCi7ZBh
         UnwA==
X-Forwarded-Encrypted: i=1; AHgh+Rpu8mtGQfWpsWV+47p6oaWVkiApsKkcKIVts/rxaTYNQlo9HIXO+inc8Td0Vy9LFmza01L2jhgrGkiPCBL9Uwl6Yw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyDeS4sGIEls/JH6jKv0wDBpPC/9X2h13Og16KJy6roYahw2Ley
	bcFvMLd/Qc8X3b1doznv95aPe8uWVEiNP0vmiv7lsEuA7WBeRRCe9PFMJlpXmTs0kBe7+ua0imT
	sW/KG1Zi/8234uzOX7uiLDxWuWH3pXO1Nitw3BfS8rQ==
X-Gm-Gg: AR+sD10+tB9tp2+XbhYmhvqC038w6wj8rhZGLImn/3qzgE+g8hULBPx0FbBCUMTcRbs
	L1/ugSd+tN4a5sNzcPFxiixRVYrIHnfuGcNoPCuWajETgaDKk+7zqL8UTg7ZxDpNSEJRdYrOXAb
	n620hz2k2gwqJQInP9mtzpYU9h+NQYUt48Ho1nrZ/D8+HahRb867rxASIThXmjN1RG4u3IZGFli
	V9BHuFmqYvZ0lA6oK+5WI+eVkhrn+2K3AwfwQFOUHENa2Spu4UAne/uJpKkvJHZ
X-Received: by 2002:a05:600c:3114:b0:493:f278:ba2f with SMTP id
 5b1f17b1804b1-4954a3ed46bmr270319815e9.9.1784723570334; Wed, 22 Jul 2026
 05:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260722121119.888611-1-emailaddress.ashish@gmail.com>
 <978937.1784722525653637859@lists.openembedded.org> <DK53FLV3KVRE.3GAZN2WD4XNY9@smile.fr>
 <CAE_=ZzEVtYkPzW3F+an=5T7aRA++WsdXEgejrSZ6oX6Dz0xWjg@mail.gmail.com>
In-Reply-To: <CAE_=ZzEVtYkPzW3F+an=5T7aRA++WsdXEgejrSZ6oX6Dz0xWjg@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 22 Jul 2026 14:32:24 +0200
X-Gm-Features: AUfX_mz0uOcW1ekCvRK8V52moxlIS83GhLbAB2Q5a4HuynulnFMSx4Q-s9Ervo0
Message-ID: <CAMSfU+6+thxpr5c-oCX-L1Pc678XpPnk6-PFBrRewvrZjtB6mA@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] package.bbclass: fix execution order
 bug in emit_pkgdata
To: Ashish Mishra <emailaddress.ashish@gmail.com>
Cc: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006eac8a06573256df"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 12:32:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241668

--0000000000006eac8a06573256df
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 22 juil. 2026 =C3=A0 14:25, Ashish Mishra <emailaddress.ashish@gmai=
l.com>
a =C3=A9crit :

> Hi Yoann ,
>
> I tested on Scarthgap today and hence shared for it
>
> Will create an patch for Wrynose and share after testing it once.
>
> In meantime, can you please take this in consideration for Scarthgap?
> Or as an process i should send Wrynose.
>
> So accordingly from next patch onwards, will follow the same.
>

As a policy, I can't accept a patch for scarthgap if it does not have a
wrynose equivalent.
So yes, you should send the wrynose patch. Then, I'll consider this one for
scarthgap.

Regards,


>
> Thanks ,
> Ashish
>
>
> On Wed, Jul 22, 2026, 5:50=E2=80=AFPM Yoann Congal via lists.openembedded=
.org
> <yoann.congal=3Dsmile.fr@lists.openembedded.org> wrote:
>
>> On Wed Jul 22, 2026 at 2:15 PM CEST, AshishKumar Mishra via
>> lists.openembedded.org wrote:
>> > Hi Yoann ,
>> >
>> > This is an bug fix patch which fixes the emit_pkgdata order
>> > The same have been merged in master at
>> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dross/=
wip/nasm&id=3Daa85baff9ebdd3f932811c3b43d1918c38373cb9
>> >
>> > Request to take this patch in scarthgap
>>
>> Hello,
>>
>> This also need backporting to wrynose, right?
>> If that's the case, please send a cherry-pick request (if trivial) or a
>> backported patch.
>>
>> Thanks!
>> --
>> Yoann Congal
>> Smile ECS
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#241665):
>> https://lists.openembedded.org/g/openembedded-core/message/241665
>> Mute This Topic: https://lists.openembedded.org/mt/120392420/1334323
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> emailaddress.ashish@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--=20
Yoann Congal
Smile ECS

--0000000000006eac8a06573256df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 22 juil. 2026 =C3=A0=C2=A014:25,=
 Ashish Mishra &lt;<a href=3D"mailto:emailaddress.ashish@gmail.com">emailad=
dress.ashish@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"auto">Hi Yoann ,<div dir=3D"=
auto"><br><div dir=3D"auto">I tested on Scarthgap today and hence shared fo=
r it=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Will create a=
n patch for Wrynose and share after testing it once.</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">In meantime, can you please take this in consi=
deration for Scarthgap?</div><div dir=3D"auto">Or as an process i should se=
nd Wrynose.</div><div dir=3D"auto"><br></div><div dir=3D"auto">So according=
ly from next patch onwards, will follow the=C2=A0same.</div></div></div></b=
lockquote><div><br></div><div>As a policy, I can&#39;t accept a patch for s=
carthgap if it does not have a wrynose equivalent.</div><div>So yes, you sh=
ould send the wrynose patch. Then, I&#39;ll consider this one for scarthgap=
.</div><div><br></div><div>Regards,</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"auto"><div dir=3D"auto"><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Thanks ,=C2=A0</div><div dir=3D"aut=
o">Ashish=C2=A0</div><div dir=3D"auto"><br></div></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 22, 2026=
, 5:50=E2=80=AFPM Yoann Congal via <a href=3D"http://lists.openembedded.org=
" target=3D"_blank">lists.openembedded.org</a> &lt;yoann.congal=3D<a href=
=3D"mailto:smile.fr@lists.openembedded.org" target=3D"_blank">smile.fr@list=
s.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Wed Jul 22, 2026 at 2:15 PM CEST, AshishKumar Mishra v=
ia <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer" =
target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; Hi Yoann ,<br>
&gt;<br>
&gt; This is an bug fix patch which fixes the emit_pkgdata order<br>
&gt; The same have been merged in master at <a href=3D"https://git.openembe=
dded.org/openembedded-core-contrib/commit/?h=3Dross/wip/nasm&amp;id=3Daa85b=
aff9ebdd3f932811c3b43d1918c38373cb9" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://git.openembedded.org/openembedded-core-contrib/commit/?=
h=3Dross/wip/nasm&amp;id=3Daa85baff9ebdd3f932811c3b43d1918c38373cb9</a><br>
&gt;<br>
&gt; Request to take this patch in scarthgap<br>
<br>
Hello,<br>
<br>
This also need backporting to wrynose, right?<br>
If that&#39;s the case, please send a cherry-pick request (if trivial) or a=
<br>
backported patch.<br>
<br>
Thanks!<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#241665): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/241665" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/241665</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120392420/133=
4323" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/120392420/1334323</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" rel=3D"noreferrer" target=3D"_blank">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:emailaddress.as=
hish@gmail.com" rel=3D"noreferrer" target=3D"_blank">emailaddress.ashish@gm=
ail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000006eac8a06573256df--

