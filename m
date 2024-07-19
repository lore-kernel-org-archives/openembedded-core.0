Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D6EC3DA59
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 06:18:43 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.13156.1721369918984340140
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 23:18:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aXRfCXWi;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ee920b0781so19015781fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 23:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721369917; x=1721974717; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hSQH7Aiw47d2huqQ1LSGQBrkWN+MKFDD2RPBdkKg9Gk=;
        b=aXRfCXWiZgQZjkInz7J0xh8vZ2TowIuvFQjcKuH4D1tkNyAttY+uMPR4Hcyr8h8nEn
         U9Lth9b0mE6jWt5A906Xkqag/9kbhm8kbv0miOi0Rw9/PDrPP+pLbRFecPhGvNkqGuRQ
         Xs0gUhpZmR6nTPBs5f+pU5pj0byzuSr5ZjYxz4kBCJW7VmVYhaBfZLHNFJCeGhUOnqpa
         1I/a+1zKuF9b1GF//qX87GHJU0w28qD4+kTbSX10bT/bONTElFMXWzdpTGliNvragGi3
         RrC4QAvNRL05b6lSfKKsX5fUSnVky/aRk9/KmGySK941BbSI13SlxATc1Ztg+IXdJcQY
         Y63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721369917; x=1721974717;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hSQH7Aiw47d2huqQ1LSGQBrkWN+MKFDD2RPBdkKg9Gk=;
        b=k6oCadY0lRaWTJWW8BmdZn0R7N8VnratM776VaTeOgUUNJXoFC0iQfXa4calgo4bzl
         gabpfwviWF/w6t8SoAnJs4Mp0DuX/W/bvn8TGI1DG9IDFrvG/CX4F2r09FYoB6OmHMDl
         EJ8u6ffy8Serp+Ed33ihIpiFbJ35k7CI2Xg0bYEWoZU5FEWNlSQIom4uBah1+HY27gl6
         hAGpd70p87kFmM0qQ1gsXVndn/IGHbxD9Uq+3V9tZ7Cevf/xxhcGQlOMroVkZHxTH51u
         tctNCJw05WF9q6WHi8MZpZ1r7ObRJoTaiP70kSuL+s4KW4eVB8WuYD8YV4j1vVACoKSr
         oAxA==
X-Forwarded-Encrypted: i=1; AJvYcCU5+Lj/+ZxKe6tzDeTvQMxziFDWHcZAXLFMqAzweB0MPCZpIux3p1ytzmrslxmhGBxKp15yLVbxfFfOfHy0SPt7xUQXglpGXVmiI9fTL5lJLJm3eGfUM7X3
X-Gm-Message-State: AOJu0Yxl1v5QJbxg0WQQBlMjqxJsBmqp1hRQ2jqi2O0CJOfR5PAYoVdH
	+zQ64/Msqx1eESaTkljrVh68WqBfqNM0QLV2YuJRPyPD//W26XLDo/Ukkmu0GNKvyEiZeUdF29/
	iBpP4oDAsJhtXw8SCowr3duQYsoGpTA==
X-Google-Smtp-Source: AGHT+IFm8EGBC7IBwf8dE8OrpiKB/tzaVU46vmuJkPpZv4tLBPBjkLEXb4jXI7iooPRNRjxaAN7ejR2KspzR0rQ7NeQ=
X-Received: by 2002:a05:651c:210f:b0:2ee:f365:3694 with SMTP id
 38308e7fff4ca-2ef05d2f584mr32137721fa.35.1721369916649; Thu, 18 Jul 2024
 23:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240717023201.861394-1-jiaying.song.cn@windriver.com>
 <20240718224715.GM17572@denix.org> <CANNYZj_PDL3P6WKEkN1BdioyPEMbYVJZP=WmuVkbKeW7=O_vVA@mail.gmail.com>
In-Reply-To: <CANNYZj_PDL3P6WKEkN1BdioyPEMbYVJZP=WmuVkbKeW7=O_vVA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 19 Jul 2024 08:18:26 +0200
Message-ID: <CANNYZj_6miWR2kz3qQpMNFEtNQM6v1iwr6ia9a-=T5hTUje92g@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][master][PATCH] python3: provide
 /usr/bin/python as a symlink to python3
To: Denys Dmytriyenko <denis@denix.org>
Cc: Jiaying.Song.CN@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000068b715061d93aa3c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 06:18:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202249

--00000000000068b715061d93aa3c
Content-Type: text/plain; charset="UTF-8"

There was a proposal with two option (maybe that was missed) and I
suggested just adding the link and be done with it. We can drop lots of
patches and send tweaks then.

Alex

On Fri 19. Jul 2024 at 8.17, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> But there is no alternative. Python is python3 and has been for years.
>
> Alex
>
> On Fri 19. Jul 2024 at 0.47, Denys Dmytriyenko <denis@denix.org> wrote:
>
>> Should this be done via update-alternatives, like many other Linux
>> distros do?
>>
>>
>> On Wed, Jul 17, 2024 at 10:32:01AM +0800, Song, Jiaying (CN) via
>> lists.openembedded.org wrote:
>> > From: Jiaying Song <jiaying.song.cn@windriver.com>
>> >
>> > The /usr/bin/python cannot find the correct Python interpreter, so a
>> symbolic
>> > link is added to point it to the Python3 interpreter.
>> >
>> > Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
>> > ---
>> >  meta/recipes-devtools/python/python3/python3-manifest.json | 1 +
>> >  meta/recipes-devtools/python/python3_3.12.4.bb             | 1 +
>> >  2 files changed, 2 insertions(+)
>> >
>> > diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json
>> b/meta/recipes-devtools/python/python3/python3-manifest.json
>> > index 46092d4004..f9259e1450 100644
>> > --- a/meta/recipes-devtools/python/python3/python3-manifest.json
>> > +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
>> > @@ -220,6 +220,7 @@
>> >          "files": [
>> >              "${bindir}/python${PYTHON_MAJMIN}",
>> >              "${bindir}/python${PYTHON_MAJMIN}.real",
>> > +            "${bindir}/python",
>> >              "${bindir}/python3",
>> >              "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h",
>> >              "${libdir}/python${PYTHON_MAJMIN}/UserDict.py",
>> > diff --git a/meta/recipes-devtools/python/python3_3.12.4.bb
>> b/meta/recipes-devtools/python/python3_3.12.4.bb
>> > index 743ba0b1f1..94535e7678 100644
>> > --- a/meta/recipes-devtools/python/python3_3.12.4.bb
>> > +++ b/meta/recipes-devtools/python/python3_3.12.4.bb
>> > @@ -165,6 +165,7 @@ do_install:prepend() {
>> >
>> >  do_install:append:class-target() {
>> >          oe_multilib_header python${PYTHON_MAJMIN}/pyconfig.h
>> > +        ln -sf ${bindir}/python3 ${D}${bindir}/python
>> >  }
>> >
>> >  do_install:append:class-native() {
>> > --
>> > 2.44.0
>>
>

--00000000000068b715061d93aa3c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">There was a proposal with two option (maybe that was miss=
ed) and I suggested just adding the link and be done with it. We can drop l=
ots of patches and send tweaks then.</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Fri 19. Jul 2024 at 8.17, Alexander Kanavin &lt;<a=
 href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-=
left-color:rgb(204,204,204)"><div dir=3D"auto">But there is no alternative.=
 Python is python3 and has been for years.</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri 19. Jul 2024 at 0.47, Denys Dmytriyenk=
o &lt;<a href=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left=
:1ex;border-left-color:rgb(204,204,204)">Should this be done via update-alt=
ernatives, like many other Linux distros do?<br>
<br>
<br>
On Wed, Jul 17, 2024 at 10:32:01AM +0800, Song, Jiaying (CN) via <a href=3D=
"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.=
openembedded.org</a> wrote:<br>
&gt; From: Jiaying Song &lt;<a href=3D"mailto:jiaying.song.cn@windriver.com=
" target=3D"_blank">jiaying.song.cn@windriver.com</a>&gt;<br>
&gt; <br>
&gt; The /usr/bin/python cannot find the correct Python interpreter, so a s=
ymbolic<br>
&gt; link is added to point it to the Python3 interpreter.<br>
&gt; <br>
&gt; Signed-off-by: Jiaying Song &lt;<a href=3D"mailto:jiaying.song.cn@wind=
river.com" target=3D"_blank">jiaying.song.cn@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/python/python3/python3-manifest.json | 1 +=
<br>
&gt;=C2=A0 meta/recipes-devtools/python/<a href=3D"http://python3_3.12.4.bb=
" rel=3D"noreferrer" target=3D"_blank">python3_3.12.4.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 2 files changed, 2 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/python/python3/python3-manifest.jso=
n b/meta/recipes-devtools/python/python3/python3-manifest.json<br>
&gt; index 46092d4004..f9259e1450 100644<br>
&gt; --- a/meta/recipes-devtools/python/python3/python3-manifest.json<br>
&gt; +++ b/meta/recipes-devtools/python/python3/python3-manifest.json<br>
&gt; @@ -220,6 +220,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${bindir}/python=
${PYTHON_MAJMIN}&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${bindir}/python=
${PYTHON_MAJMIN}.real&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${bindir}/python&quot=
;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${bindir}/python=
3&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${includedir}/py=
thon${PYTHON_MAJMIN}/pyconfig*.h&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python=
${PYTHON_MAJMIN}/UserDict.py&quot;,<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3_3.=
12.4.bb" rel=3D"noreferrer" target=3D"_blank">python3_3.12.4.bb</a> b/meta/=
recipes-devtools/python/<a href=3D"http://python3_3.12.4.bb" rel=3D"norefer=
rer" target=3D"_blank">python3_3.12.4.bb</a><br>
&gt; index 743ba0b1f1..94535e7678 100644<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3_3.12.4.bb=
" rel=3D"noreferrer" target=3D"_blank">python3_3.12.4.bb</a><br>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3_3.12.4.bb=
" rel=3D"noreferrer" target=3D"_blank">python3_3.12.4.bb</a><br>
&gt; @@ -165,6 +165,7 @@ do_install:prepend() {<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 do_install:append:class-target() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_multilib_header python${PYTHON_MA=
JMIN}/pyconfig.h<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf ${bindir}/python3 ${D}${bindir}/py=
thon<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 do_install:append:class-native() {<br>
&gt; -- <br>
&gt; 2.44.0<br>
</blockquote></div></div>
</blockquote></div></div>

--00000000000068b715061d93aa3c--

