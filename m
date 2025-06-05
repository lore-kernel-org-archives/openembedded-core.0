Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4410CC5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 10:25:29 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.3938.1749119117376701097
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 03:25:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=n+u/Uk6R;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a5123c1533so415732f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 03:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1749119116; x=1749723916; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eLrVGRezHQP9K+kwzIq0GBDlaYNz50F4tZ5Q9fe48PI=;
        b=n+u/Uk6RlrpCSaDBLAaV8rJWMuXI2chksqpXgl5qbFhAhpVdycZroQQvcthHOhBFBj
         QdhU/i/mENmPkAhePGo/sE4IbEnjgLdCt2YlH/w6vYg5LjWpn8YPDa3WiDHL4gSGSvyj
         YHRwtasL+iFz2dzIRezH/ujCBxKAIDTb6wSZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749119116; x=1749723916;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eLrVGRezHQP9K+kwzIq0GBDlaYNz50F4tZ5Q9fe48PI=;
        b=bIpQjHR6pM3VyR+CJFjEq0/yyBk8d53KcPK9JxGFqZ6vcCrBpEvQ+qWpB1mncq9vdx
         THqFLu4de7Vu0qwraVMFNWhGl1RfnnY3eGNh+A8ABVDUBshhHdufl3zbZ7v1AF+58sAE
         T+onACpMIZz6RH+HdzFDjZ/Nnc7mjqSe05vERkECj0qXR4GAQxEMrxDKGw2yC2/dQW70
         6v+kdep66vJZ+Mcew1SyP261Vnz5j4Krxy+ZxkyidjVFDwnfpegNmIKL1l9vQkuhEnwZ
         YjqjXCXi2iDzOkvMVVyPGlgvHZw23w+TLrzLVhZprh9LxfZU7PaBuvSfR+O+qJ8GjSZO
         xO7A==
X-Gm-Message-State: AOJu0YzyTTRaPt1nIHBSr1jGAQ9EvvNw+P6hYlJQvxeJkmjQrmW1edCN
	z+846NWe4BybqfRzVD9uUYk7eXArq1hUeM8OkQFhtN7WWWl1aw/A0TKDwKrcZfXn9qVPa9HTvlt
	jP2RUsktZ8ndNw+z9/lqZLbZh547cbRdoOLILkoMx+A==
X-Gm-Gg: ASbGncvuiFKgXs0P/t7SuxXieDirN2JnzW7QJScJuDuBQaTXNM1ywoGaLmIdKlR3nbB
	PO6BB3vHwA8pmgEuwrdIb4Rjr5z0Dv7nTAmpj9OmjNAIJc//Fw/0zxUGpkVC6+5fLvnlH/VG3/R
	BGBIOkx8CoNsAM7yzk5kLscBCAOW504J9gxbU=
X-Google-Smtp-Source: AGHT+IFwjjSCjFtiWm2iC7I3tA28S98Vi68biaZuFkgS8JFQ+6ZpwThX402Bpuj4fq/8ZyDQ7vVB7yx6ygX8K9HWalU=
X-Received: by 2002:a5d:5850:0:b0:3a4:f6b7:8b07 with SMTP id
 ffacd0b85a97d-3a51d97c66cmr5227916f8f.48.1749119115674; Thu, 05 Jun 2025
 03:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250603215916.2429422-1-yoann.congal@smile.fr>
 <4c4f6b74-1397-43c1-991e-3176d2873880@cherry.de> <CAMSfU+5WE_fJ8ij_s1aowOgVbW6MeuKTP65GXQ03RRTyrn=Wzw@mail.gmail.com>
In-Reply-To: <CAMSfU+5WE_fJ8ij_s1aowOgVbW6MeuKTP65GXQ03RRTyrn=Wzw@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 5 Jun 2025 12:24:47 +0200
X-Gm-Features: AX0GCFuZu0fqhE0FW9a2zDBaNyzxF7IlADgHg64SfPMKAFgvEH2Sq1gpw8ryI1E
Message-ID: <CAMSfU+7FSeBPPCBEMEyP6HL44uB40n3wtAo9Gi_RCfZ2TOC7Wg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] reproducible: allow each layer to define its
 known non-repro packages
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org, 
	Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
Content-Type: multipart/alternative; boundary="0000000000008f5c360636d08737"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 10:25:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218001

--0000000000008f5c360636d08737
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 4 juin 2025 =C3=A0 11:48, Yoann Congal <yoann.congal@smile.fr> a =
=C3=A9crit :

>
>
> Le mer. 4 juin 2025 =C3=A0 11:22, Quentin Schulz <quentin.schulz@cherry.d=
e> a
> =C3=A9crit :
>
>> Hi Yoann,
>>
>> On 6/3/25 11:59 PM, Yoann Congal via lists.openembedded.org wrote:
>> > From: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
>> >
>> > With this change, layers can use a conf/include/known_non_repro.inc fi=
le
>> > to extend the KNOWN_NON_REPRO_PACKAGES_LIST variable with its own know=
n
>> > non-reproducible packages to make them automatically excluded from the
>> > reproducible test.
>> >
>> > Example of usage, in conf/include/known_non_repro.inc:
>> >    KNOWN_NON_REPRO_PACKAGES_LIST +=3D " \
>> >          this-package-is-not-reproducible \
>> >    "
>> >
>> > This uses the new "include_all" in the reproducible test and will move
>> > the maintenance burden from AB config[0] to the layers themselves.
>> >
>>
>> A few points unrelated to implementation:
>> - maybe we can shorten the variable name? NON_REPRO_PACKAGES would be
>> enough no? If a package is listed in there, it's necessarily that we
>> know it's non reproducible, would we have a variable for "unknown"
>> non-reproducible packages? Additionally, we already have a PACKAGES
>> variable which contains a space-separated list of packages to build, so
>> maybe we can drop the _LIST as the plural of PACKAGES kind of imply it's
>> a list?
>>
>
> Yes, I can shorten it a lot (I was kind of afraid to clash with existing
> variables).
>
> I agree on NON_REPRO_PACKAGES (if we don't switch to the more
> direct OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES)
>
>
>> - once this gets merged, please provide documentation in yocto-docs for
>> it :)
>>
>
> That was planned :)
>
>
>> - why packages and not recipes? Do we need a per-package granularity?
>>
>
> The reproducibility test works at package level. (I don't know if that's
> by choice or because it's easier)
> For example, the main package of a recipe may be reproducible but not the
> -ptest one.
> Changing this to recipe level is a bit more fundamental work than I
> anticipated but I can do it if necessary.
>
>
>> Isn't the recipe broken if any package it generates is non-reproducible?
>> This would also allow recipes to add packages without having to also
>> list them to the NON_REPRO_PACKAGES list?
>>
>
> I don't dislike the idea of requiring more work for
> non-reproducible recipes.
> At some point, it might even be easier to make the recipe reproducible ;)
>
> Joking aside, reproducibility was for a long time handled asynchronously
> (non-repro got merged, fixed/excluded later)
>
>
>> - what happens if a layer has a version X of a recipe that is not
>> reproducible, but another layer has version Y that is (or vice-versa)?
>>
>
> Right now, this is not handled very well : version is ignored by the
> reproducible test. If layer X ignores the package, it will be ignored for
> layer Y.
>
> Taking a step back, if we are redesigning the whole thing, why not add a
> variable into the known-non reproducible recipes? (Like INSANE_SKIPs)
>

 Summarizing the discussion that happened at today's patch review call:
* RP agrees with the approach in general
* OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES should be used instead (I'll send a
v2)
* We should stay at package level:
  * switching to recipe level may over complicate things for something that
is (hopefully) transient (all recipes/packages should be reproducible one
day)
  * Also, in case of a non-reproducible subpackage, we don't want to skip
the test on the main package (e.g ruby-doc was for a long time non-repro
but the test on the main ruby package was still valuable)

Regards,
--=20
Yoann Congal
Smile ECS

--0000000000008f5c360636d08737
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 4 =
juin 2025 =C3=A0=C2=A011:48, Yoann Congal &lt;<a href=3D"mailto:yoann.conga=
l@smile.fr">yoann.congal@smile.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"=
ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">Le=C2=A0mer. 4 juin 2025 =C3=A0=C2=A011:22, Quentin Schulz &lt;<a =
href=3D"mailto:quentin.schulz@cherry.de" target=3D"_blank">quentin.schulz@c=
herry.de</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Hi Yoann,<br>
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
e known-non reproducible recipes? (Like INSANE_SKIPs)</div></div></div></bl=
ockquote><div><br></div><div>=C2=A0Summarizing the discussion that happened=
=C2=A0at today&#39;s patch review call:</div><div>* RP agrees with the appr=
oach in general</div><div>*=C2=A0OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES should=
 be used instead (I&#39;ll send a v2)</div><div>* We should stay at package=
 level:</div><div>=C2=A0 * switching to recipe level may over complicate th=
ings for something that is (hopefully) transient (all recipes/packages shou=
ld be reproducible one day)</div><div>=C2=A0 * Also, in case of a non-repro=
ducible subpackage, we don&#39;t want to skip the test on the main package =
(e.g ruby-doc was for a long time non-repro but the test on the main ruby p=
ackage=C2=A0was still valuable)</div><div><br></div><div>Regards,</div></di=
v><span class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" cla=
ss=3D"gmail_signature"><div dir=3D"ltr"><font face=3D"Raleway, regular">Yoa=
nn Congal</font><div><font face=3D"Raleway, regular">Smile ECS</font></div>=
</div></div></div>

--0000000000008f5c360636d08737--

