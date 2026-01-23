Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E3C7D6CFA7
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 16:32:09 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.352.1769185927626911988
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jan 2026 08:32:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BK0YWC9v;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-432d2c96215so2094428f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 08:32:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769185926; cv=none;
        d=google.com; s=arc-20240605;
        b=l0V2TYmPsC7sYfF7fdrIZlPT3WaEhBvvbzdkStv9OexG8NAmyfnG7XwUm2eTEM18+k
         RrZUbON/xCNQd0KB0otLZ5mcRaCNEOV2/wNFyW6dbRdHvAFDnRTDX9o4ayIMSTJqZoEP
         zhUslkhMvpnvnWu3xpfrzmqteOIINKaYLja+ZRXUchxWe/TGSxilIcMd00mtqdBGdOyQ
         hmcIpHYPn9+5tfc6GU3u5ACIKOybn6mIrzUKOPWVCuEdcizwBJgwMw9h4Rx2i2Ls02UY
         5SULqHBVZlV+YI9BHXwjvY6d3KhzN6ea/79+aj6OeslMRfSZgHW8CJW981xiRomXquOs
         ENjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZONU8/RNFpYPfml+m6KYHC37iRitymNIApCcsbhWFvQ=;
        fh=mkJtNC7i9KyqGncDtPimScwQuINSCJBuP6aqpdxZuhY=;
        b=kUahuFZ99t594Va1TOeqifynfs7TVv9ksQubc0kCYffLb80Nk2UtHKO5GMnV5secG9
         E3iWkdKGfTkDsaKPPABh0LwvSjiU/s2ZAveUeFTPOHt9nEVSt9hUg9oDZFEgIZKp63lj
         latbLnYH3EJlt+8gF/UX4NNErvsAsvSqEXoJ2nQnPLUJOgSukz6TNClSC2boIOf7JVDj
         2PZ1WxJzNXk+W+aRYEWwok4ooynkvqwkg5Fm4Uw7rvtbs/ZPPnY7Nb/lSCp8mMFk1j95
         DpvRwi91Iqpmv1nywccc1Zs0oW0GR6OJgAzQvhKv0rWfdBcmMBCQ88GqIyfqb0lqfiof
         EFfQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769185926; x=1769790726; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZONU8/RNFpYPfml+m6KYHC37iRitymNIApCcsbhWFvQ=;
        b=BK0YWC9vGjzWq6LPTwjd5ixdQyJjP8drs08SPrNgbf2XPBapNmPseiR3Q27uPnx/ki
         6zdrj0Punny7aakXK4Ti9HP/AB2Lm6vsF2ItfZNTH+ofyPPJQYbP3tyQp++TJJakWVkT
         hHNhzkoUnKJoIcldaYUBv9kbmipSjFNiVn0xw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769185926; x=1769790726;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZONU8/RNFpYPfml+m6KYHC37iRitymNIApCcsbhWFvQ=;
        b=g0XWB5XJkdVV+NdS9U23//2RzUs41CFSsbg3cGQyboyDXAhHA8szFaffJCQ066YJzO
         +rwdqNwhQC3xX7xZU+XUt8G+9uGHGVzyFhCVjfLNl81+VcOii19nsEbgcJTSlvwYdkgw
         o57Ztqphpn/YURQxg0dnT2cKNc3kxte9ZB7PakYEAg+uYyDYvuEy51S4jNH2siJBLXnq
         +8xke/J2ulPvZEt27YnblabgMNAFlvuEwMXfMf465Wm08lV06Jizsmrix7WyyVpX6gVV
         MA0Uv12ryPxsW+WOpd5Jwv3FTc0EDj1grq9rL30/1sNTve09w7eci7W189DYB8LGi0dP
         4XdA==
X-Gm-Message-State: AOJu0YwCRvq3JlHc5BmAW/mC4mqrhFlUNyxACDlm3eQLQk80jvfwizfD
	01giTX9mtnRhpBmYrXfjKMnZCwAzAiVYCesyfrn3EW4Hc9fWlGxrtjwdu3QAODnb/6wrJf4sXh8
	D3Lx3FqHuBGAA/ouUl0KtFrpXRraKISnO4c2PsnpvGFhs4A9zIjwbBcE=
X-Gm-Gg: AZuq6aIGAgdlm9n3TlMQnZYoC6Nd6i2KBopjvUP1MXra8vfUpI7RYHROL/fY8p9Lg+U
	+HQVGzqgYdX0VvhsXvVv+Kdp/FteB6fKhhdjzWX5plMJ2p2QhGktgRwJ8OhCizkd9KKmsPMop6Z
	IC9HzQTZ128e6lXoaUOyUURg4uxQcJ72KFy+YxOqxuOQvpPiWA1swfkpBRBxuqy1nuyw9161bdw
	GYzAOpMU6dW1xHEK0YmYseRiZR1TD9IRtiVfte9e7fz3Gh65FutBGIilanCF1VjseQTLjdPonGl
	k0nZhOSJwkJxx8Ub3i7TNzzD+WbmDtyp3EC8b/M=
X-Received: by 2002:a5d:50d2:0:b0:435:bbda:3f4e with SMTP id
 ffacd0b85a97d-435bbda3fd3mr1458745f8f.31.1769185924815; Fri, 23 Jan 2026
 08:32:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1769175900.git.yoann.congal@smile.fr> <CAMSfU+779ANtEvXg9Z4M8a4wZu_Z4-+a1RJvE__OvfR92Oq=ZQ@mail.gmail.com>
In-Reply-To: <CAMSfU+779ANtEvXg9Z4M8a4wZu_Z4-+a1RJvE__OvfR92Oq=ZQ@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 23 Jan 2026 17:31:38 +0100
X-Gm-Features: AZwV_QjbNlTHO9rRC9UUXrWOcq4WaqOic_AyI06WcPMwtrDU3acBiBua6LVInD0
Message-ID: <CAMSfU+5hE9UoOREZT+aeEOkFEb0jHdqo-Vcj3P3EKCACieMjCQ@mail.gmail.com>
Subject: Re: [OE-core][whinlatter 00/15] Pull request (cover letter only)
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Content-Type: multipart/alternative; boundary="0000000000009732f8064910b28f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 16:32:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229898

--0000000000009732f8064910b28f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 23 janv. 2026 =C3=A0 15:25, Yoann Congal <yoann.congal@smile.fr> a
=C3=A9crit :

>
>
> Le ven. 23 janv. 2026 =C3=A0 14:50, Yoann Congal <yoann.congal@smile.fr> =
a
> =C3=A9crit :
>
>> Those are the patches from the last patch review:
>>
>> https://lore.kernel.org/openembedded-core/cover.1768906687.git.yoann.con=
gal@smile.fr/
>>
>> Passed a-full on autobuilder:
>> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3112
>> The "Send QA Email" step failed, that is a known AB-INT bug:
>> #15696 =E2=80=93 AB_INT: resulttool: File exists
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15696
>>
>> The following changes since commit
>> dd10706cfafb5574b7cf316fca2300d166ef71b0:
>>
>>   build-appliance-image: Update to whinlatter head revisions (2026-01-12
>> 10:58:53 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://git.openembedded.org/openembedded-core-contrib
>> stable/whinlatter-next
>>
>> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/w=
hinlatter-next
>>
>> for you to fetch changes up to e7891f39ae90d1c23bfcb59af0064591513a671d:
>>
>>   libarchive: upgrade 3.8.4 -> 3.8.5 (2026-01-19 23:29:16 +0100)
>>
>> ----------------------------------------------------------------
>>
>> Alexander Kanavin (3):
>>   libpng: upgrade 1.6.52 -> 1.6.53
>>
>
> I forgot to add the cherry-pick reference to this commit. I'll add it now=
.
>

I've added it to the stable/whinlatter-nut & stable/whinlatter-next branch
which is at
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstable/w=
hinlatter-next&id=3Db4e7819b99d9c1a8995eba87e6f466fd8c77e14a
I verified that there is no diff in the code between the 2 branches and
started a rebuild:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3117

I'll send a proper PR with this new branch once the build has finished.

Sorry for the noise :(


>
>
>>   ffmpeg: add a (possible) build race fix
>>   ffmpeg: fix a build race, hopefully for real this time
>>
>> Paul Barker (1):
>>   selftest: devtool: Set PATH when running pseudo
>>
>> Peter Marko (9):
>>   util-linux: patch CVE-2025-14104
>>   gnupg: patch CVE-2025-68973
>>   curl: patch CVE-2025-13034
>>   curl: patch CVE-2025-14017
>>   curl: patch CVE-2025-14524
>>   curl: patch CVE-2025-14819
>>   curl: patch CVE-2025-15079
>>   curl: patch CVE-2025-15224
>>   libarchive: upgrade 3.8.4 -> 3.8.5
>>
>> Richard Purdie (2):
>>   pseudo: Update to pull in openat2 and efault return code changes
>>   pseudo: Update to pull in 'makewrappers: Fix EFAULT implementation'
>>
>>  meta/lib/oeqa/selftest/cases/devtool.py       |   5 +-
>>  meta/recipes-core/util-linux/util-linux.inc   |   2 +
>>  .../util-linux/CVE-2025-14104-01.patch        |  33 +++++
>>  .../util-linux/CVE-2025-14104-02.patch        |  28 +++++
>>  meta/recipes-devtools/pseudo/pseudo_git.bb    |   2 +-
>>  ...ibarchive_3.8.4.bb =3D> libarchive_3.8.5.bb} |   2 +-
>>  ...k-Consolidate-pattern-rules-for-comp.patch | 106 ++++++++++++++++
>>  ...s-Fix-double-build-by-disabling-.d-f.patch |  78 ++++++++++++
>>  ...ak-ensure-target-directories-are-cre.patch |  43 +++++++
>>  meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb  |   6 +-
>>  .../{libpng_1.6.52.bb =3D> libpng_1.6.53.bb}    |   2 +-
>>  .../curl/curl/CVE-2025-13034.patch            |  37 ++++++
>>  .../curl/curl/CVE-2025-14017.patch            | 116 ++++++++++++++++++
>>  .../curl/curl/CVE-2025-14524.patch            |  40 ++++++
>>  .../curl/curl/CVE-2025-14819.patch            |  73 +++++++++++
>>  .../curl/curl/CVE-2025-15079.patch            |  32 +++++
>>  .../curl/curl/CVE-2025-15224.patch            |  31 +++++
>>  meta/recipes-support/curl/curl_8.17.0.bb      |   6 +
>>  .../gnupg/gnupg/CVE-2025-68973.patch          | 108 ++++++++++++++++
>>  meta/recipes-support/gnupg/gnupg_2.5.11.bb    |   1 +
>>  20 files changed, 745 insertions(+), 6 deletions(-)
>>  create mode 100644
>> meta/recipes-core/util-linux/util-linux/CVE-2025-14104-01.patch
>>  create mode 100644
>> meta/recipes-core/util-linux/util-linux/CVE-2025-14104-02.patch
>>  rename meta/recipes-extended/libarchive/{libarchive_3.8.4.bb =3D>
>> libarchive_3.8.5.bb} (96%)
>>  create mode 100644
>> meta/recipes-multimedia/ffmpeg/ffmpeg/0001-ffbuild-commonmak-Consolidate=
-pattern-rules-for-comp.patch
>>  create mode 100644
>> meta/recipes-multimedia/ffmpeg/ffmpeg/0001-fftools-resources-Fix-double-=
build-by-disabling-.d-f.patch
>>  create mode 100644
>> meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-tar=
get-directories-are-cre.patch
>>  rename meta/recipes-multimedia/libpng/{libpng_1.6.52.bb =3D>
>> libpng_1.6.53.bb} (97%)
>>  create mode 100644 meta/recipes-support/curl/curl/CVE-2025-13034.patch
>>  create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14017.patch
>>  create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14524.patch
>>  create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14819.patch
>>  create mode 100644 meta/recipes-support/curl/curl/CVE-2025-15079.patch
>>  create mode 100644 meta/recipes-support/curl/curl/CVE-2025-15224.patch
>>  create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2025-68973.patc=
h
>>
>>
>
> --
> Yoann Congal
> Smile ECS
>


--=20
Yoann Congal
Smile ECS

--0000000000009732f8064910b28f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 23=
 janv. 2026 =C3=A0=C2=A015:25, Yoann Congal &lt;<a href=3D"mailto:yoann.con=
gal@smile.fr">yoann.congal@smile.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=
=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">Le=C2=A0ven. 23 janv. 2026 =C3=A0=C2=A014:50, Yoann Congal &lt=
;<a href=3D"mailto:yoann.congal@smile.fr" target=3D"_blank">yoann.congal@sm=
ile.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Those are the patches from the last patch review:<br>
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
87e6f466fd8c77e14a">https://git.openembedded.org/openembedded-core-contrib/=
commit/?h=3Dstable/whinlatter-next&amp;id=3Db4e7819b99d9c1a8995eba87e6f466f=
d8c77e14a</a></div><div>I verified that there is no diff in the code betwee=
n the 2 branches and started a rebuild: <a href=3D"https://autobuilder.yoct=
oproject.org/valkyrie/?#/builders/29/builds/3117">https://autobuilder.yocto=
project.org/valkyrie/?#/builders/29/builds/3117</a></div><div><br></div><di=
v>I&#39;ll send a proper PR with this new branch once the build has finishe=
d.</div><div><br></div><div>Sorry for the noise :(</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
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

--0000000000009732f8064910b28f--

