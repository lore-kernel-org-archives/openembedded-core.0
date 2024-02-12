Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3140AC48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 10:04:48 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.3450.1707732279327726186
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 02:04:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BqIi4mYu;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d0b4ea773eso39545491fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 02:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707732277; x=1708337077; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eTEiC8gS4qCQ6NGDDgtQkMCt+bz3Pnw8eAqvnzfJkmM=;
        b=BqIi4mYuHw8P6NqU8wR6zdVmMx7LeUT4VX+MUPJ4gFdNTfh4iuTg06uUXPa37Ln2UK
         UOiRcplhAP+ahBZ0t2qxtmA/FVH0hZazGfkqav4ANmXzCcRKv41RkfQZph+htYQXzJcC
         3Y9jjEh9DNjcPJBvp5xul0xuD+AXp1rkT5o5G8CxlmKifnUJCZPGz8ghEVVpP+H8AMBR
         ggemtyKe0xZm9govxSKMq0KioRhSlX4SZjEItk6xGhrUncdoL0rft/rRLN69Os+cG3mD
         VKvl2Czx95HfcFPS0q5i/98xfR5sOOFaKvlK8AVQy0/tp3+d4PP1UgKeAFMhai60/UMd
         bYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707732277; x=1708337077;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eTEiC8gS4qCQ6NGDDgtQkMCt+bz3Pnw8eAqvnzfJkmM=;
        b=wQoeQ2ez/dJFWuFhu9FVQvLKre7NGWQKA3XeVdr43eBD5FU1F5BdP5D1k6jCxZrso9
         E80NFZuKuAIuCdWti6wKmREzORIcDxfHqQBzpe7cS58yPfWAQc6PadbnKRM6xIi6i1Dv
         LlhbIQ1OED007dTeMI4pSOYJHYPJDmeLFCQSFhSGdABlpOxlQCP1egkbLhIMZbiVvr13
         6aQ1vRqs7/HysGYKfazFJl7FvKG+4PRJxrnZNNtGZq0R7+1OjDaqDtkaXunfh9MobbqR
         ZI3zLcbQzlQOW30dmxZ7tytnqas9qQavHHq5FhAJjqM1RPI0WI694DOhFHEKbyNnVPqU
         Qo3A==
X-Gm-Message-State: AOJu0YyyYthl+It8CtKR48DTSL9mSlBcyL/ki4enEw+f0Hdyi4d0rdKt
	EGpl6b+B5nnENC2WsyC6yMCWu1+8In15CxVQ5fy3Ds4h4VpnElUgIHrLaS6OvArb47yt35HU/mX
	zrxjm2XG6CKN/BVVqnLyxG/rBpiM=
X-Google-Smtp-Source: AGHT+IGKh4gv52GAeRQD/DeZC5ImmVtF/XIQw7mjsApnz4Bi/xtxC8N1/YXyA5I0HvfaDTxDvU5Y6PbXhLdST+8zYeY=
X-Received: by 2002:a05:6512:1196:b0:511:944f:de5b with SMTP id
 g22-20020a056512119600b00511944fde5bmr10008lfr.38.1707732276586; Mon, 12 Feb
 2024 02:04:36 -0800 (PST)
MIME-Version: 1.0
References: <8d71c0f-9120-85b7-80ce-d985aa557f8@crashcourse.ca> <53fb346e-af6-36cc-3a17-d062a8fcefce@crashcourse.ca>
In-Reply-To: <53fb346e-af6-36cc-3a17-d062a8fcefce@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 12 Feb 2024 11:04:25 +0100
Message-ID: <CANNYZj_ZH1zr35eEJtc8_XBrrytQokLozS-B+Y5YBQ0+ZbhHyA@mail.gmail.com>
Subject: Re: [OE-core] more ptest pedantry: why conditionally include
 "run-ptest" in SRC_URI?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b7ad6606112c6765"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 10:04:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195306

--000000000000b7ad6606112c6765
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Don=E2=80=99t assume intent where mindless copy paste would suffice Robert.=
 :)

Alex

On Mon 12. Feb 2024 at 7.48, Robert P. J. Day <rpjday@crashcourse.ca> wrote=
:

> On Mon, 12 Feb 2024, Robert P. J. Day wrote:
>
> >
> >   more annoying nitpickery ... here:
> >
> >
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-extended=
/xz/xz_5.4.5.bb#n28
> >
> > it's not clear why someone would go to the trouble of conditionally
> > including run-ptest in SRC_URI as i would have thought the only
> > benefit would be to avoid the triviality of copying run-ptest into
> > WORKDIR, but beyond that, i don't see what the point is, and that's
> > the only recipe i've run across that bothers to do that.
> >
> >   is there something more subtle happening here?
>
>   just for fun, tripped over a number of recipes in meta-openembedded
> that do the same thing, like this:
>
>
> https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-suppo=
rt/re2/re2_2023.03.01.bb#n10
>
> https://git.openembedded.org/meta-openembedded/tree/meta-networking/recip=
es-protocols/freediameter/freediameter_1.4.0.bb#n21
>
> and more. i'm *guessing* that's not necessary, but it doesn't hurt.
>
> rday
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195301):
> https://lists.openembedded.org/g/openembedded-core/message/195301
> Mute This Topic: https://lists.openembedded.org/mt/104307351/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b7ad6606112c6765
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Don=E2=80=99t assume intent where mindless copy paste wou=
ld suffice Robert. :)</div><div dir=3D"auto"><br></div><div dir=3D"auto">Al=
ex=C2=A0</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Mon 12. Feb 2024 at 7.48, Robert P. J. Day &lt;<a href=3D"m=
ailto:rpjday@crashcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:r=
gb(204,204,204)">On Mon, 12 Feb 2024, Robert P. J. Day wrote:<br>
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0more annoying nitpickery ... here:<br>
&gt;<br>
&gt; <a href=3D"https://git.openembedded.org/openembedded-core/tree/meta/re=
cipes-extended/xz/xz_5.4.5.bb#n28" rel=3D"noreferrer" target=3D"_blank">htt=
ps://git.openembedded.org/openembedded-core/tree/meta/recipes-extended/xz/x=
z_5.4.5.bb#n28</a><br>
&gt;<br>
&gt; it&#39;s not clear why someone would go to the trouble of conditionall=
y<br>
&gt; including run-ptest in SRC_URI as i would have thought the only<br>
&gt; benefit would be to avoid the triviality of copying run-ptest into<br>
&gt; WORKDIR, but beyond that, i don&#39;t see what the point is, and that&=
#39;s<br>
&gt; the only recipe i&#39;ve run across that bothers to do that.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0is there something more subtle happening here?<br>
<br>
=C2=A0 just for fun, tripped over a number of recipes in meta-openembedded<=
br>
that do the same thing, like this:<br>
<br>
<a href=3D"https://git.openembedded.org/meta-openembedded/tree/meta-oe/reci=
pes-support/re2/re2_2023.03.01.bb#n10" rel=3D"noreferrer" target=3D"_blank"=
>https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-suppor=
t/re2/re2_2023.03.01.bb#n10</a><br>
<a href=3D"https://git.openembedded.org/meta-openembedded/tree/meta-network=
ing/recipes-protocols/freediameter/freediameter_1.4.0.bb#n21" rel=3D"norefe=
rrer" target=3D"_blank">https://git.openembedded.org/meta-openembedded/tree=
/meta-networking/recipes-protocols/freediameter/freediameter_1.4.0.bb#n21</=
a><br>
<br>
and more. i&#39;m *guessing* that&#39;s not necessary, but it doesn&#39;t h=
urt.<br>
<br>
rday<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#195301): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/195301" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/195301</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104307351/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/104307351/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000b7ad6606112c6765--

