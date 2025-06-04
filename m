Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4676C5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 09:49:00 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.12819.1749030534232277873
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 02:48:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oUUFt4ZU;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-451d7b50815so27398415e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 02:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1749030533; x=1749635333; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PV8PZZYV5tZlX/bQHJzl1XhElryzSe3z94HHMFLC9fE=;
        b=oUUFt4ZUDcgeqaTzxfK/F6/5AiMnJmzrnST0GR+IMnIv4pPOR+a/0OOuBTFyihBq1b
         dJhgE5YALqd8bFqjjr+sI7b2hov8LhseNOpGV4C3+WFfWfbr0tzmjxQd2bPN/2ZvAwqG
         11RHJxxMkwJ5CMHuxqdWXKRcEQPRHJB1lY10E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749030533; x=1749635333;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PV8PZZYV5tZlX/bQHJzl1XhElryzSe3z94HHMFLC9fE=;
        b=IU+VGAMuOGkSIfkh1IumuqhAT5meAp+wKAPK3F6PCrG2agLDGOah2GLV6AUlAfcNj6
         572i97bUh/8J+AfPVd7EEOJVA7oLFKZ0SWUk5bzpNvrT35USAx5hbmJnE5ETq0Hv9Wgf
         xuSLMWcZ6ap/q6jpc49UtBKlWxQteEEit51bZK9HBjV7YG1lEDi5qJ2StN9B47nBhC84
         RNhpHBxBvoSn0TfzvzViLmj6CnlViy9JBxl6v/P3NVKA9C5dtGrtRqB25Nbpjw2/DqXd
         1kridlrnCxn/mv8FItHuEqie2v71HQc36XE5acCPcRKHWiEarNXoU97OvjWVTjQtGvj4
         S8RQ==
X-Gm-Message-State: AOJu0YwEsRPDW/7/eTXxDA897g4Yza11C0SA+fHk57kJt0SS1JLwtzeA
	JZDp4DO9x4dK6wJTwuu6b5ojZPs5FSvzU3E7hogbTgGQNiGrPpwzzz3fh+MzRJ+bjVpiYbu4vdz
	QEz6mXZMFfPSs6xnYv8MUhCYusZrF7V5GIrg/JcXXnA==
X-Gm-Gg: ASbGncuwjCINE6gt4OGLettlsP/Fr0KD9Aa8eok9qgUIlqUk/27QZ6JVZ9cn2t0jrJp
	Eubm0osxkAn6jyiHMvNMXxLvHVsfKtGTtPTSmhcRgviCnWR532aNg983vz7zHZ3YU8B0jy3lEMT
	Jvz9CRhxauJb5Gw0FlDdaeEcbG+98V8rajWin9TS3laNNxAfY6o2vYBfOhFKXBJLTChH8=
X-Google-Smtp-Source: AGHT+IECsk6EdInISdX3ydNWAxkr8tb4GZaZStE+/glTP9kBYiA7IGe7x/t1QJ8AXS7Tz6UAFYfyQTB4uLxZF9+4hLI=
X-Received: by 2002:a05:600c:585a:b0:43d:26e3:f2f6 with SMTP id
 5b1f17b1804b1-451f1673127mr11877425e9.5.1749030532421; Wed, 04 Jun 2025
 02:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250603215916.2429422-1-yoann.congal@smile.fr> <4c4f6b74-1397-43c1-991e-3176d2873880@cherry.de>
In-Reply-To: <4c4f6b74-1397-43c1-991e-3176d2873880@cherry.de>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 4 Jun 2025 11:48:25 +0200
X-Gm-Features: AX0GCFuhzYzyMACcUiCERFoLurYPPMXP6yzv74pJXn_S61-wE_JN8NU-D3ivVDs
Message-ID: <CAMSfU+5WE_fJ8ij_s1aowOgVbW6MeuKTP65GXQ03RRTyrn=Wzw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] reproducible: allow each layer to define its
 known non-repro packages
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org, 
	Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
Content-Type: multipart/alternative; boundary="000000000000962cd80636bbe7d2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 09:49:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217897

--000000000000962cd80636bbe7d2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 4 juin 2025 =C3=A0 11:22, Quentin Schulz <quentin.schulz@cherry.de>=
 a
=C3=A9crit :

> Hi Yoann,
>
> On 6/3/25 11:59 PM, Yoann Congal via lists.openembedded.org wrote:
> > From: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
> >
> > With this change, layers can use a conf/include/known_non_repro.inc fil=
e
> > to extend the KNOWN_NON_REPRO_PACKAGES_LIST variable with its own known
> > non-reproducible packages to make them automatically excluded from the
> > reproducible test.
> >
> > Example of usage, in conf/include/known_non_repro.inc:
> >    KNOWN_NON_REPRO_PACKAGES_LIST +=3D " \
> >          this-package-is-not-reproducible \
> >    "
> >
> > This uses the new "include_all" in the reproducible test and will move
> > the maintenance burden from AB config[0] to the layers themselves.
> >
>
> A few points unrelated to implementation:
> - maybe we can shorten the variable name? NON_REPRO_PACKAGES would be
> enough no? If a package is listed in there, it's necessarily that we
> know it's non reproducible, would we have a variable for "unknown"
> non-reproducible packages? Additionally, we already have a PACKAGES
> variable which contains a space-separated list of packages to build, so
> maybe we can drop the _LIST as the plural of PACKAGES kind of imply it's
> a list?
>

Yes, I can shorten it a lot (I was kind of afraid to clash with existing
variables).

I agree on NON_REPRO_PACKAGES (if we don't switch to the more
direct OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES)


> - once this gets merged, please provide documentation in yocto-docs for
> it :)
>

That was planned :)


> - why packages and not recipes? Do we need a per-package granularity?
>

The reproducibility test works at package level. (I don't know if that's by
choice or because it's easier)
For example, the main package of a recipe may be reproducible but not the
-ptest one.
Changing this to recipe level is a bit more fundamental work than I
anticipated but I can do it if necessary.


> Isn't the recipe broken if any package it generates is non-reproducible?
> This would also allow recipes to add packages without having to also
> list them to the NON_REPRO_PACKAGES list?
>

I don't dislike the idea of requiring more work for
non-reproducible recipes.
At some point, it might even be easier to make the recipe reproducible ;)

Joking aside, reproducibility was for a long time handled asynchronously
(non-repro got merged, fixed/excluded later)


> - what happens if a layer has a version X of a recipe that is not
> reproducible, but another layer has version Y that is (or vice-versa)?
>

Right now, this is not handled very well : version is ignored by the
reproducible test. If layer X ignores the package, it will be ignored for
layer Y.

Taking a step back, if we are redesigning the whole thing, why not add a
variable into the known-non reproducible recipes? (Like INSANE_SKIPs)

Cheers,
> Quentin
>


--=20
Yoann Congal
Smile ECS

--000000000000962cd80636bbe7d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 4 =
juin 2025 =C3=A0=C2=A011:22, Quentin Schulz &lt;<a href=3D"mailto:quentin.s=
chulz@cherry.de">quentin.schulz@cherry.de</a>&gt; a =C3=A9crit=C2=A0:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Yoann,<br>
<br>
On 6/3/25 11:59 PM, Yoann Congal via <a href=3D"http://lists.openembedded.o=
rg" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<=
br>
&gt; From: Guillaume Swaenepoel &lt;<a href=3D"mailto:guillaume.swaenepoel@=
smile.fr" target=3D"_blank">guillaume.swaenepoel@smile.fr</a>&gt;<br>
&gt; <br>
&gt; With this change, layers can use a conf/include/known_non_repro.inc fi=
le<br>
&gt; to extend the KNOWN_NON_REPRO_PACKAGES_LIST variable with its own know=
n<br>
&gt; non-reproducible packages to make them automatically excluded from the=
<br>
&gt; reproducible test.<br>
&gt; <br>
&gt; Example of usage, in conf/include/known_non_repro.inc:<br>
&gt;=C2=A0 =C2=A0 KNOWN_NON_REPRO_PACKAGES_LIST +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 this-package-is-not-reproducible \<b=
r>
&gt;=C2=A0 =C2=A0 &quot;<br>
&gt; <br>
&gt; This uses the new &quot;include_all&quot; in the reproducible test and=
 will move<br>
&gt; the maintenance burden from AB config[0] to the layers themselves.<br>
&gt; <br>
<br>
A few points unrelated to implementation:<br>
- maybe we can shorten the variable name? NON_REPRO_PACKAGES would be <br>
enough no? If a package is listed in there, it&#39;s necessarily that we <b=
r>
know it&#39;s non reproducible, would we have a variable for &quot;unknown&=
quot; <br>
non-reproducible packages? Additionally, we already have a PACKAGES <br>
variable which contains a space-separated list of packages to build, so <br=
>
maybe we can drop the _LIST as the plural of PACKAGES kind of imply it&#39;=
s <br>
a list?<br></blockquote><div><br></div><div>Yes, I can shorten it a lot (I =
was kind of afraid to clash with existing variables).</div><div><br></div><=
div>I agree on=C2=A0NON_REPRO_PACKAGES (if we don&#39;t switch to the more =
direct=C2=A0OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES)</div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
- once this gets merged, please provide documentation in yocto-docs for <br=
>
it :)<br></blockquote><div><br></div><div>That was planned :)</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
- why packages and not recipes? Do we need a per-package granularity?<br></=
blockquote><div><br></div><div>The reproducibility test works at package le=
vel. (I don&#39;t know if that&#39;s by choice or because it&#39;s easier)<=
/div><div>For example, the main package of a recipe may be reproducible but=
 not the -ptest one.</div><div>Changing this to recipe level is a bit more =
fundamental work than I anticipated but I can do it if necessary.</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Isn&#39;t the recipe broken if any package it generates is non-reproducible=
? <br>
This would also allow recipes to add packages without having to also <br>
list them to the NON_REPRO_PACKAGES list?<br></blockquote><div><br></div><d=
iv>I don&#39;t dislike the idea of requiring more work for non-reproducible=
=C2=A0recipes.</div><div>At some point, it might even be easier to make the=
 recipe reproducible ;)</div><div><br></div><div>Joking aside, reproducibil=
ity was for a long time handled asynchronously (non-repro got merged, fixed=
/excluded later)</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
- what happens if a layer has a version X of a recipe that is not <br>
reproducible, but another layer has version Y that is (or vice-versa)?<br><=
/blockquote><div><br></div><div>Right now, this is not handled very well : =
version is ignored by the reproducible test. If layer X ignores the package=
, it will be ignored for layer Y.</div><div>=C2=A0</div><div>Taking a step =
back, if we are redesigning the whole thing, why not add a variable into th=
e known-non reproducible recipes? (Like INSANE_SKIPs)</div><div><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">

Cheers,<br>
Quentin<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000962cd80636bbe7d2--

