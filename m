Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB34DD778AD
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 18:22:29 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2073.1769192543808410816
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jan 2026 10:22:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=d7angZ8m;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4359a316d89so2005005f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 10:22:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769192542; cv=none;
        d=google.com; s=arc-20240605;
        b=IJqbW2WmwY7lvQH4l3a58KyiGCuGdAws+gu1FYZfuPR94sVFFHnS0pTL/w9mmN3mtm
         KZq6t+MulqvnqpasRc0Zu3zJyI6CudDMoT/HfdKBL/70tvtnD/wmT8nCZVivs7f3lTe9
         3S/+ZBcolf3KNTHO+7GVwn2axn7T+v/BJ5VptcAHA0MA7gxJPzlcrCFMGSZM52fot/SQ
         PDZBzG1TurzVPOjfmE7jK5kXYrsL2b03C0yHUmsbLZosvxzKN8Q1GPUzJHwSHg/3+TRe
         w6JjDpOfr0NyzsWWDbMJfP6oVDs5iZTvh+hKbI/vPRKzgmA1dFHSEebVskIi0y4OrdD7
         MhOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uYZaE0Zo3MdgA+dwAZ8sDwG7eScNGyot9ODr6x2q6y4=;
        fh=mkJtNC7i9KyqGncDtPimScwQuINSCJBuP6aqpdxZuhY=;
        b=JtjtUHRMQSOCRpyucmzNDonFcsmtZTolW88udEtMV0wC8pFKlySeTJSriNCy+H2yeb
         53FsnTf7QX0640SxSQO03OUb2mKz7CfrG0wGJixK6oU12kUUasIeGuON6S9u6Y+/s79o
         e+/Nc5OnkxhQ571UmEGaxSx1w4gUJXv3pbpKURU4674JT0o6XZEugL7cDrvEhfWvxgW7
         W0ZapdFxwxGyZwbWwNph8qOfRIk+u09zY4Xo5U2h7MKQ8cr3p5P0uX7sE1GHvuyCitfW
         hNsAKz3r5zv+zRrT4GueOQgH4snTCsYjATegks7iHd7xQTmLk/wterMmMXu8drphXFLi
         tv4g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769192542; x=1769797342; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uYZaE0Zo3MdgA+dwAZ8sDwG7eScNGyot9ODr6x2q6y4=;
        b=d7angZ8mZC5Be/AIJEtg/Sd6AJwwShzap7NBasXRXtb94Z/WQ/G5QH57SuI5MPFOfU
         brHSLygayNgUlC5xuEDNalwuZIdl30lqVF/pCuaKJNzqU+vyzN4AKPdIRNPOyLTjxXvV
         VJsB8hgW26KRp0iYgn2d6667502+qitPFq/nE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769192542; x=1769797342;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYZaE0Zo3MdgA+dwAZ8sDwG7eScNGyot9ODr6x2q6y4=;
        b=jISvhlS0vyXbL+YxGH033PKMc5E4m2dYtXhHsZ0LyRKQAmWEmXsG11YBMEJZyTAuzi
         y2h++q8o7BewpEMFeiZm9p2IG9Q5lbMt7dq/InRxJqMbQmts18heAad9T10OsDKXV51P
         QekBwkFRkPsyCBLLvtPYKZGG5CskX/Te/WZDstQnB+/M7ozDM7EfI2XjgRTxaNT5ED1r
         zMeinL6imOYg1JEJHh9DhaRKjX2F4o16m4VdcDmwUomrqNVtojiMqrSb4FkJb5pheZh/
         3FsccgVMMS4NLek7epScSmQb5Zmt5dMkF5Ckg6BnZBfPPhLgoWNJZPxxsUWPqN/VPt1l
         yl5A==
X-Gm-Message-State: AOJu0YxYMtlUoBP0unXZ6VLCnEjXswRZdJA0gl6YIQPd7oigGElUH+ae
	ZTZbtcA4JxOMY0whVopW+iP6Y1BqHsXcLYVdQgEW3jwOZ5zOoXhZbrkMyzZoafANs3fnttR5+BH
	/pufaDk0eXD4Uou84WN4/0/fKq+a76ZhJsVxaUlNQ/gFzh8ZFzTXoEuc=
X-Gm-Gg: AZuq6aI/pNqQb810+55ZBao+HZqladxtLEDVMsgu4KlkHAzer9gWZj96uo672BECcgc
	bdFpeZJkctDxa7kQRhXEmp9IT/rmv3Zmx5jP85/x3cooR9M2RPwq0tzMbeHxYOa5WO5IxyAikw2
	oNRw/s6OYJASoJhDWPdHVbP2i3yJ1RXyXW5al2pfazxHYlXrw9Sh22FO9WVCwDrdprsXBj44QD5
	Twd4lPqRe/B8n3QMnBt0EfHuRA0AqkjOBqXcTSS3czTLSOvmDxuaUIKc/gGnCJZk0/oKaVzh1X3
	e01tjDsGLEVtAQM7YdGYy0TR7P66
X-Received: by 2002:a05:6000:2404:b0:432:da3b:5949 with SMTP id
 ffacd0b85a97d-435b15943a7mr5772118f8f.21.1769192541797; Fri, 23 Jan 2026
 10:22:21 -0800 (PST)
MIME-Version: 1.0
References: <cover.1769175900.git.yoann.congal@smile.fr> <CAMSfU+779ANtEvXg9Z4M8a4wZu_Z4-+a1RJvE__OvfR92Oq=ZQ@mail.gmail.com>
 <CAMSfU+5hE9UoOREZT+aeEOkFEb0jHdqo-Vcj3P3EKCACieMjCQ@mail.gmail.com>
In-Reply-To: <CAMSfU+5hE9UoOREZT+aeEOkFEb0jHdqo-Vcj3P3EKCACieMjCQ@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 23 Jan 2026 19:21:55 +0100
X-Gm-Features: AZwV_QgHG_TJ77ysBFcyDfqyU0oPv-6TOAys-PHBRKv2qZ2z8c_8B67PjL6ZjIc
Message-ID: <CAMSfU+65ZRUu9zhv3op5j1pKTRdU=2EPBvZh-ORrQV7ehF7vcQ@mail.gmail.com>
Subject: Re: [OE-core][whinlatter 00/15] Pull request (cover letter only)
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Content-Type: multipart/alternative; boundary="000000000000fe55fd0649123c59"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 18:22:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229914

--000000000000fe55fd0649123c59
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 23 janv. 2026 =C3=A0 17:31, Yoann Congal <yoann.congal@smile.fr> a
=C3=A9crit :

>
>
> Le ven. 23 janv. 2026 =C3=A0 15:25, Yoann Congal <yoann.congal@smile.fr> =
a
> =C3=A9crit :
>
>>
>>
>> Le ven. 23 janv. 2026 =C3=A0 14:50, Yoann Congal <yoann.congal@smile.fr>=
 a
>> =C3=A9crit :
>>
>>> Those are the patches from the last patch review:
>>>
>>> https://lore.kernel.org/openembedded-core/cover.1768906687.git.yoann.co=
ngal@smile.fr/
>>>
>>> Passed a-full on autobuilder:
>>> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/311=
2
>>> The "Send QA Email" step failed, that is a known AB-INT bug:
>>> #15696 =E2=80=93 AB_INT: resulttool: File exists
>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15696
>>>
>>> The following changes since commit
>>> dd10706cfafb5574b7cf316fca2300d166ef71b0:
>>>
>>>   build-appliance-image: Update to whinlatter head revisions (2026-01-1=
2
>>> 10:58:53 +0000)
>>>
>>> are available in the Git repository at:
>>>
>>>   https://git.openembedded.org/openembedded-core-contrib
>>> stable/whinlatter-next
>>>
>>> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/=
whinlatter-next
>>>
>>> for you to fetch changes up to e7891f39ae90d1c23bfcb59af0064591513a671d=
:
>>>
>>>   libarchive: upgrade 3.8.4 -> 3.8.5 (2026-01-19 23:29:16 +0100)
>>>
>>> ----------------------------------------------------------------
>>>
>>> Alexander Kanavin (3):
>>>   libpng: upgrade 1.6.52 -> 1.6.53
>>>
>>
>> I forgot to add the cherry-pick reference to this commit. I'll add it
>> now.
>>
>
> I've added it to the stable/whinlatter-nut & stable/whinlatter-next branc=
h
> which is at
>
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstable=
/whinlatter-next&id=3Db4e7819b99d9c1a8995eba87e6f466fd8c77e14a
> I verified that there is no diff in the code between the 2 branches and
> started a rebuild:
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3117
>
> I'll send a proper PR with this new branch once the build has finished.
>

The new PR is at:
https://lists.openembedded.org/g/openembedded-core/message/229913


>
> Sorry for the noise :(
>
>
>>
>>
>>>   ffmpeg: add a (possible) build race fix
>>>   ffmpeg: fix a build race, hopefully for real this time
>>>
>>> Paul Barker (1):
>>>   selftest: devtool: Set PATH when running pseudo
>>>
>>> Peter Marko (9):
>>>   util-linux: patch CVE-2025-14104
>>>   gnupg: patch CVE-2025-68973
>>>   curl: patch CVE-2025-13034
>>>   curl: patch CVE-2025-14017
>>>   curl: patch CVE-2025-14524
>>>   curl: patch CVE-2025-14819
>>>   curl: patch CVE-2025-15079
>>>   curl: patch CVE-2025-15224
>>>   libarchive: upgrade 3.8.4 -> 3.8.5
>>>
>>> Richard Purdie (2):
>>>   pseudo: Update to pull in openat2 and efault return code changes
>>>   pseudo: Update to pull in 'makewrappers: Fix EFAULT implementation'
>>>
>>>  meta/lib/oeqa/selftest/cases/devtool.py       |   5 +-
>>>  meta/recipes-core/util-linux/util-linux.inc   |   2 +
>>>  .../util-linux/CVE-2025-14104-01.patch        |  33 +++++
>>>  .../util-linux/CVE-2025-14104-02.patch        |  28 +++++
>>>  meta/recipes-devtools/pseudo/pseudo_git.bb    |   2 +-
>>>  ...ibarchive_3.8.4.bb =3D> libarchive_3.8.5.bb} |   2 +-
>>>  ...k-Consolidate-pattern-rules-for-comp.patch | 106 ++++++++++++++++
>>>  ...s-Fix-double-build-by-disabling-.d-f.patch |  78 ++++++++++++
>>>  ...ak-ensure-target-directories-are-cre.patch |  43 +++++++
>>>  meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb  |   6 +-
>>>  .../{libpng_1.6.52.bb =3D> libpng_1.6.53.bb}    |   2 +-
>>>  .../curl/curl/CVE-2025-13034.patch            |  37 ++++++
>>>  .../curl/curl/CVE-2025-14017.patch            | 116 ++++++++++++++++++
>>>  .../curl/curl/CVE-2025-14524.patch            |  40 ++++++
>>>  .../curl/curl/CVE-2025-14819.patch            |  73 +++++++++++
>>>  .../curl/curl/CVE-2025-15079.patch            |  32 +++++
>>>  .../curl/curl/CVE-2025-15224.patch            |  31 +++++
>>>  meta/recipes-support/curl/curl_8.17.0.bb      |   6 +
>>>  .../gnupg/gnupg/CVE-2025-68973.patch          | 108 ++++++++++++++++
>>>  meta/recipes-support/gnupg/gnupg_2.5.11.bb    |   1 +
>>>  20 files changed, 745 insertions(+), 6 deletions(-)
>>>  create mode 100644
>>> meta/recipes-core/util-linux/util-linux/CVE-2025-14104-01.patch
>>>  create mode 100644
>>> meta/recipes-core/util-linux/util-linux/CVE-2025-14104-02.patch
>>>  rename meta/recipes-extended/libarchive/{libarchive_3.8.4.bb =3D>
>>> libarchive_3.8.5.bb} (96%)
>>>  create mode 100644
>>> meta/recipes-multimedia/ffmpeg/ffmpeg/0001-ffbuild-commonmak-Consolidat=
e-pattern-rules-for-comp.patch
>>>  create mode 100644
>>> meta/recipes-multimedia/ffmpeg/ffmpeg/0001-fftools-resources-Fix-double=
-build-by-disabling-.d-f.patch
>>>  create mode 100644
>>> meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-ta=
rget-directories-are-cre.patch
>>>  rename meta/recipes-multimedia/libpng/{libpng_1.6.52.bb =3D>
>>> libpng_1.6.53.bb} (97%)
>>>  create mode 100644 meta/recipes-support/curl/curl/CVE-2025-13034.patch
>>>  create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14017.patch
>>>  create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14524.patch
>>>  create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14819.patch
>>>  create mode 100644 meta/recipes-support/curl/curl/CVE-2025-15079.patch
>>>  create mode 100644 meta/recipes-support/curl/curl/CVE-2025-15224.patch
>>>  create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2025-68973.pat=
ch
>>>
>>>
>>
>> --
>> Yoann Congal
>> Smile ECS
>>
>
>
> --
> Yoann Congal
> Smile ECS
>


--=20
Yoann Congal
Smile ECS

--000000000000fe55fd0649123c59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 23=
 janv. 2026 =C3=A0=C2=A017:31, Yoann Congal &lt;<a href=3D"mailto:yoann.con=
gal@smile.fr">yoann.congal@smile.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=
=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">Le=C2=A0ven. 23 janv. 2026 =C3=A0=C2=A015:25, Yoann Congal &lt=
;<a href=3D"mailto:yoann.congal@smile.fr" target=3D"_blank">yoann.congal@sm=
ile.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 23 ja=
nv. 2026 =C3=A0=C2=A014:50, Yoann Congal &lt;<a href=3D"mailto:yoann.congal=
@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt; a =C3=A9crit=C2=
=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Those are t=
he patches from the last patch review:<br>
<a href=3D"https://lore.kernel.org/openembedded-core/cover.1768906687.git.y=
oann.congal@smile.fr/" rel=3D"noreferrer" target=3D"_blank">https://lore.ke=
rnel.org/openembedded-core/cover.1768906687.git.yoann.congal@smile.fr/</a><=
br>
<br>
Passed a-full on autobuilder:<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/bui=
lds/3112" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctopro=
ject.org/valkyrie/?#/builders/29/builds/3112</a><br>
The &quot;Send QA Email&quot; step failed, that is a known AB-INT bug:<br>
#15696 =E2=80=93 AB_INT: resulttool: File exists<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15696" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D15696</a><br>
<br>
The following changes since commit dd10706cfafb5574b7cf316fca2300d166ef71b0=
:<br>
<br>
=C2=A0 build-appliance-image: Update to whinlatter head revisions (2026-01-=
12 10:58:53 +0000)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/openembedded-core-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/openembedd=
ed-core-contrib</a> stable/whinlatter-next<br>
=C2=A0 <a href=3D"https://git.openembedded.org/openembedded-core-contrib/lo=
g/?h=3Dstable/whinlatter-next" rel=3D"noreferrer" target=3D"_blank">https:/=
/git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/whinlatter-=
next</a><br>
<br>
for you to fetch changes up to e7891f39ae90d1c23bfcb59af0064591513a671d:<br=
>
<br>
=C2=A0 libarchive: upgrade 3.8.4 -&gt; 3.8.5 (2026-01-19 23:29:16 +0100)<br=
>
<br>
----------------------------------------------------------------<br>
<br>
Alexander Kanavin (3):<br>
=C2=A0 libpng: upgrade 1.6.52 -&gt; 1.6.53<br></blockquote><div><br></div><=
div>I forgot to add the cherry-pick reference to this commit. I&#39;ll add =
it now.=C2=A0</div></div></div></blockquote><div><br></div><div>I&#39;ve ad=
ded it to the stable/whinlatter-nut &amp; stable/whinlatter-next branch whi=
ch is at=C2=A0<br><a href=3D"https://git.openembedded.org/openembedded-core=
-contrib/commit/?h=3Dstable/whinlatter-next&amp;id=3Db4e7819b99d9c1a8995eba=
87e6f466fd8c77e14a" target=3D"_blank">https://git.openembedded.org/openembe=
dded-core-contrib/commit/?h=3Dstable/whinlatter-next&amp;id=3Db4e7819b99d9c=
1a8995eba87e6f466fd8c77e14a</a></div><div>I verified that there is no diff =
in the code between the 2 branches and started a rebuild: <a href=3D"https:=
//autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3117" target=
=3D"_blank">https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/bu=
ilds/3117</a></div><div><br></div><div>I&#39;ll send a proper PR with this =
new branch once the build has finished.</div></div></div></blockquote><div>=
<br></div><div>The new PR is at:=C2=A0<a href=3D"https://lists.openembedded=
.org/g/openembedded-core/message/229913">https://lists.openembedded.org/g/o=
penembedded-core/message/229913</a></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote=
"><div><br></div><div>Sorry for the noise :(</div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gm=
ail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
=C2=A0 ffmpeg: add a (possible) build race fix<br>
=C2=A0 ffmpeg: fix a build race, hopefully for real this time<br>
<br>
Paul Barker (1):<br>
=C2=A0 selftest: devtool: Set PATH when running pseudo<br>
<br>
Peter Marko (9):<br>
=C2=A0 util-linux: patch CVE-2025-14104<br>
=C2=A0 gnupg: patch CVE-2025-68973<br>
=C2=A0 curl: patch CVE-2025-13034<br>
=C2=A0 curl: patch CVE-2025-14017<br>
=C2=A0 curl: patch CVE-2025-14524<br>
=C2=A0 curl: patch CVE-2025-14819<br>
=C2=A0 curl: patch CVE-2025-15079<br>
=C2=A0 curl: patch CVE-2025-15224<br>
=C2=A0 libarchive: upgrade 3.8.4 -&gt; 3.8.5<br>
<br>
Richard Purdie (2):<br>
=C2=A0 pseudo: Update to pull in openat2 and efault return code changes<br>
=C2=A0 pseudo: Update to pull in &#39;makewrappers: Fix EFAULT implementati=
on&#39;<br>
<br>
=C2=A0meta/lib/oeqa/selftest/cases/devtool.py=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A05 +-<br>
=C2=A0meta/recipes-core/util-linux/util-linux.inc=C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +<br>
=C2=A0.../util-linux/CVE-2025-14104-01.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 33 +++++<br>
=C2=A0.../util-linux/CVE-2025-14104-02.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 28 +++++<br>
=C2=A0meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_git.bb" rel=3D"=
noreferrer" target=3D"_blank">pseudo_git.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=A0=
2 +-<br>
=C2=A0...<a href=3D"http://ibarchive_3.8.4.bb" rel=3D"noreferrer" target=3D=
"_blank">ibarchive_3.8.4.bb</a> =3D&gt; <a href=3D"http://libarchive_3.8.5.=
bb" rel=3D"noreferrer" target=3D"_blank">libarchive_3.8.5.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...k-Consolidate-pattern-rules-for-comp.patch | 106 ++++++++++++++++<=
br>
=C2=A0...s-Fix-double-build-by-disabling-.d-f.patch |=C2=A0 78 ++++++++++++=
<br>
=C2=A0...ak-ensure-target-directories-are-cre.patch |=C2=A0 43 +++++++<br>
=C2=A0meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_8.0.bb" rel=
=3D"noreferrer" target=3D"_blank">ffmpeg_8.0.bb</a>=C2=A0 |=C2=A0 =C2=A06 +=
-<br>
=C2=A0.../{<a href=3D"http://libpng_1.6.52.bb" rel=3D"noreferrer" target=3D=
"_blank">libpng_1.6.52.bb</a> =3D&gt; <a href=3D"http://libpng_1.6.53.bb" r=
el=3D"noreferrer" target=3D"_blank">libpng_1.6.53.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0.../curl/curl/CVE-2025-13034.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 37 ++++++<br>
=C2=A0.../curl/curl/CVE-2025-14017.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 116 ++++++++++++++++++<br>
=C2=A0.../curl/curl/CVE-2025-14524.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 40 ++++++<br>
=C2=A0.../curl/curl/CVE-2025-14819.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 73 +++++++++++<br>
=C2=A0.../curl/curl/CVE-2025-15079.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 32 +++++<br>
=C2=A0.../curl/curl/CVE-2025-15224.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 31 +++++<br>
=C2=A0meta/recipes-support/curl/<a href=3D"http://curl_8.17.0.bb" rel=3D"no=
referrer" target=3D"_blank">curl_8.17.0.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A06 +<br>
=C2=A0.../gnupg/gnupg/CVE-2025-68973.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 108 ++++++++++++++++<br>
=C2=A0meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.5.11.bb" rel=3D"=
noreferrer" target=3D"_blank">gnupg_2.5.11.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=
=A01 +<br>
=C2=A020 files changed, 745 insertions(+), 6 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2025-1=
4104-01.patch<br>
=C2=A0create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2025-1=
4104-02.patch<br>
=C2=A0rename meta/recipes-extended/libarchive/{<a href=3D"http://libarchive=
_3.8.4.bb" rel=3D"noreferrer" target=3D"_blank">libarchive_3.8.4.bb</a> =3D=
&gt; <a href=3D"http://libarchive_3.8.5.bb" rel=3D"noreferrer" target=3D"_b=
lank">libarchive_3.8.5.bb</a>} (96%)<br>
=C2=A0create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-ffbuild=
-commonmak-Consolidate-pattern-rules-for-comp.patch<br>
=C2=A0create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-fftools=
-resources-Fix-double-build-by-disabling-.d-f.patch<br>
=C2=A0create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild=
-common.mak-ensure-target-directories-are-cre.patch<br>
=C2=A0rename meta/recipes-multimedia/libpng/{<a href=3D"http://libpng_1.6.5=
2.bb" rel=3D"noreferrer" target=3D"_blank">libpng_1.6.52.bb</a> =3D&gt; <a =
href=3D"http://libpng_1.6.53.bb" rel=3D"noreferrer" target=3D"_blank">libpn=
g_1.6.53.bb</a>} (97%)<br>
=C2=A0create mode 100644 meta/recipes-support/curl/curl/CVE-2025-13034.patc=
h<br>
=C2=A0create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14017.patc=
h<br>
=C2=A0create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14524.patc=
h<br>
=C2=A0create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14819.patc=
h<br>
=C2=A0create mode 100644 meta/recipes-support/curl/curl/CVE-2025-15079.patc=
h<br>
=C2=A0create mode 100644 meta/recipes-support/curl/curl/CVE-2025-15224.patc=
h<br>
=C2=A0create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2025-68973.pa=
tch<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000fe55fd0649123c59--

