Return-Path: <joel.winarske@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 583DCC48292
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 18:09:48 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.1013.1707156583707949370
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 10:09:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WMZTryws;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: joel.winarske@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5ca29c131ebso4325701a12.0
        for <Openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 10:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707156583; x=1707761383; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PIie6bgNXFvIBfx7b/Fm/ZyOZb4RKsXvepnAhIfplC0=;
        b=WMZTrywsyoJW5+jcG4YZAMkDGBtKcDNwMsGNezclH4ago5EI9wrPI6SIv0Ru4Od4Tm
         a1Oh04ZAdoLysvD4dg1xEMfiOZv6oUii0Etf7/QAka18qBFy1fllvp1HMMPDv7NTVv3W
         3qWVutOi0XaZZzMV3FGQyZTYxd2OLgxriYoK30UXuRiehbEt8MkfnZCJN7ZSJMk2s4bj
         h/GWHAXmoKh6QqziL5y0dvllaAWoJTtcjTcgbbAAYoh9BZwUaBsQxce9h1alKp0u7Ffq
         Ma83+H4Ua5CkxBWHVH2uO61b5/gl1y2Is1ISmr5nJV+vgkz7SO4s0RYrnuWhixZcQTvn
         +bXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707156583; x=1707761383;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PIie6bgNXFvIBfx7b/Fm/ZyOZb4RKsXvepnAhIfplC0=;
        b=YtFnXBIjUuFU1KdLNhhnxVQabr4Hex/aP8sTLwbqrLJbCgNYdPt7Hil/fIN0wnALpR
         rpsRRKvTKC065ZtEE/e40JeaPpQbUaKQiDE6pHnwsjWJQOq3vgxRlKY4Tl9TCuxu+NLr
         FZ/wNjfsUXTBR2An1qjbUHRu9a+/hNqEV+C0P7ObM+idpkRCYAS8hy5l41/WOmXjoSvX
         1RhdAebJ1kyel5rZPqqIK/jLDcykweJcBSAh4YVmhiKNmquw0dK9fPm1GIjV3YkY/Zy3
         mhYXOcul3IW+TEwU9Vwl2q8ZE+nfuW473iBoxsWHjzIDJF6JOAb01BTfSchr6jM/Yx79
         rL4A==
X-Gm-Message-State: AOJu0Yz7LWpb9zF2ze4l9iyMUCQdeRPdlFq70kPyxQCPZB7+24wwyVAN
	Yd0bA4InRKq/47lavDbFehDdVW4B/67pykGINlgxrEx+CxsrX/6B/DPgcFlNlY5SCxj3iOnlwaQ
	akgey0tA4vOm/6fWPY2VQN7MSxXE=
X-Google-Smtp-Source: AGHT+IHLiQpzbMiLk0bJAEWTi1J9hJrUFVT/EUbzX7n+rFYgs+W+9Ad0n/owXMtT6EcCVBW7rXa3Cxx3YUtx8GP8q5Q=
X-Received: by 2002:a05:6a20:9186:b0:19a:112e:89dc with SMTP id
 v6-20020a056a20918600b0019a112e89dcmr284814pzd.62.1707156583039; Mon, 05 Feb
 2024 10:09:43 -0800 (PST)
MIME-Version: 1.0
References: <CABKMkP+ZA5byxRODV+BKdr_oNy=jXZnL9EoV74bM8VOv7tJuKA@mail.gmail.com>
 <AS1PR10MB5697FD1577DCA729C3B9FB0AFD472@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697FD1577DCA729C3B9FB0AFD472@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Joel Winarske <joel.winarske@gmail.com>
Date: Mon, 5 Feb 2024 10:09:32 -0800
Message-ID: <CABKMkP+UcA_cuTnqMyoT3e0BrHz3yA90Bcux7PzJZZQvy1pP-A@mail.gmail.com>
Subject: Re: [OE-core] do_unpack[depends] behavior
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b54af50610a65d2e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 18:09:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194962

--000000000000b54af50610a65d2e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That was it.  Thanks Peter!

On Mon, Feb 5, 2024 at 9:45=E2=80=AFAM Marko, Peter <Peter.Marko@siemens.co=
m> wrote:

> You need to depend on do_populate_sysroot tasks, not
> do_prepare_recipe_sysroot tasks=E2=80=A6
>
> Peter
>
>
>
> *From:* openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org> *On Behalf Of *Joel Winarske
> via lists.openembedded.org
> *Sent:* Monday, February 5, 2024 18:29
> *To:* OE-core <Openembedded-core@lists.openembedded.org>
> *Subject:* [OE-core] do_unpack[depends] behavior
>
>
>
> I'm working with kirkstone and seeing some seemingly incorrect behavior.
>
>
>
> The issue revolves around do_unpack.
>
>
>
> ```
>
>     do_unpack[network] =3D "1"
>
>     python do_unpack:append() {}
>
> ```
>
>
>
> With the above I depending on the host machine core count I may see an
> error where one of the defined DEPENDENT recipes is not found; curl-nativ=
e
> in this case.
>
>
>
> With this change:
>
> ```
>
>     do_unpack[network] =3D "1"
>
>     do_unpack[depends] +=3D " \
>         ca-certificates-native:do_prepare_recipe_sysroot \
>         curl-native:do_prepare_recipe_sysroot \
>         ninja-native:do_prepare_recipe_sysroot \
>         unzip-native:do_prepare_recipe_sysroot \
>     "
>
>     python do_unpack:append() {}
>
> ```
>
> I would expect to see curl-native complete prior to my do_unpack running.
> The attached screen indicates otherwise.
>
>
>
> If I drop the build down to uni-proc using:
>
> ```
>
>     PARALLEL_MAKE =3D "-j 1"
>     BB_NUMBER_THREADS =3D "1"
>
> ```
>
> The recipes get serialized as expected.
>
>
>
> Is this a bug, or an implementation issue?
>
>
>
> Recipe in question:
>
> https://github.com/meta-flutter/meta-flutter/blob/kirkstone/recipes-graph=
ics/flutter-sdk/flutter-sdk_git.bb
>
>
>
> Thanks,
>
> Joel
>
>
>

--000000000000b54af50610a65d2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>That was it.=C2=A0 Thanks Peter!</div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 5, =
2024 at 9:45=E2=80=AFAM Marko, Peter &lt;<a href=3D"mailto:Peter.Marko@siem=
ens.com">Peter.Marko@siemens.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div class=3D"msg-5356114939750004004">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"m_-5356114939750004004WordSection1">
<p class=3D"MsoNormal">You need to depend on do_populate_sysroot tasks, not=
 do_prepare_recipe_sysroot tasks=E2=80=A6<u></u><u></u></p>
<p class=3D"MsoNormal">Peter<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border-width:1pt medium medium;border-style:solid none none;b=
order-color:rgb(225,225,225) currentcolor currentcolor;padding:3pt 0in 0in"=
>
<p class=3D"MsoNormal"><b>From:</b> <a href=3D"mailto:openembedded-core@lis=
ts.openembedded.org" target=3D"_blank">openembedded-core@lists.openembedded=
.org</a> &lt;<a href=3D"mailto:openembedded-core@lists.openembedded.org" ta=
rget=3D"_blank">openembedded-core@lists.openembedded.org</a>&gt;
<b>On Behalf Of </b>Joel Winarske via <a href=3D"http://lists.openembedded.=
org" target=3D"_blank">lists.openembedded.org</a><br>
<b>Sent:</b> Monday, February 5, 2024 18:29<br>
<b>To:</b> OE-core &lt;<a href=3D"mailto:Openembedded-core@lists.openembedd=
ed.org" target=3D"_blank">Openembedded-core@lists.openembedded.org</a>&gt;<=
br>
<b>Subject:</b> [OE-core] do_unpack[depends] behavior<u></u><u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">I&#39;m working with kirkstone and seeing some seemi=
ngly incorrect behavior.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">The issue revolves around do_unpack.<u></u><u></u></=
p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">```<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0 do_unpack[network] =3D &quot;1&qu=
ot;<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0 python do_unpack:append() {}<u></=
u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">```<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">With the above I depending on the host machine core =
count I may see an error where one of the defined DEPENDENT recipes is not =
found; curl-native in this case.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">With this change:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">```<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0 do_unpack[network] =3D &quot;1&qu=
ot;<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0 do_unpack[depends] +=3D &quot; \<=
br>
=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 ca-certificates-native:do_prepare_recipe_s=
ysroot \<br>
=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 curl-native:do_prepare_recipe_sysroot \<br=
>
=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 ninja-native:do_prepare_recipe_sysroot \<b=
r>
=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 unzip-native:do_prepare_recipe_sysroot \<b=
r>
=C2=A0=C2=A0=C2=A0 &quot;<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0 python do_unpack:append() {}<u></=
u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">```<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I would expect to see curl-native complete prior to =
my do_unpack running.=C2=A0 The attached screen indicates otherwise.<u></u>=
<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">If I drop the build down to uni-proc using:<u></u><u=
></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">```<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 PARALLEL_MAKE =3D &quot;-j 1&quot;<br>
=C2=A0 =C2=A0 BB_NUMBER_THREADS =3D &quot;1&quot;<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">```<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">The recipes get serialized as expected.<u></u><u></u=
></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>
<p class=3D"MsoNormal">Is this a bug, or an implementation issue?<u></u><u>=
</u></p>
<div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">Recipe in question:<br>
<a href=3D"https://github.com/meta-flutter/meta-flutter/blob/kirkstone/reci=
pes-graphics/flutter-sdk/flutter-sdk_git.bb" target=3D"_blank">https://gith=
ub.com/meta-flutter/meta-flutter/blob/kirkstone/recipes-graphics/flutter-sd=
k/flutter-sdk_git.bb</a><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Joel<u></u><u></u></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><u></u>=C2=A0<u></u></p=
>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

</div></blockquote></div>

--000000000000b54af50610a65d2e--

