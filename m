Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91483C55172
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 20:13:43 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12213.1785615216440721952
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2026 13:13:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=DPeYlCMp;
 spf=pass (domain: konsulko.com, ip: 209.85.128.174, mailfrom: tim.orling@konsulko.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-81ed073fed0so31182737b3.0
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 13:13:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785615215; cv=none;
        d=google.com; s=arc-20260327;
        b=LkJSaoVSf4/EGz2F2+KCnkBa6VQi0hmHuuSEQJyA2QgTD7w7hg6Rg+c3fWb1qvMWsS
         kLwJ98IvQIR+H3GfQlxYWgInlc5fg29HLxiDOAoKG+tX4noZXLqijN14Z4FG3DmAmJu+
         qO3jysW+kvm6odE/lBlhGVnDfYMVH+mflfzAUdX4XUThDgN174V+/qW/C9AFFusUpWKo
         wbygC/MBK+OUngduhsvyvcOSiNph47YUJUAt/jF0MZ5Ur5I1AxUEuduJqc7vNszYFZJO
         zvJqPEl8Y1fl4HRC+tNzbh3beDqyCLH9FoigAkAzEFYBfS/HVUS/TTeJR+6NMoqhKIiW
         Bx4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4+pBD0A2iNMwWbYkkuEdGXyILyjC2ACrmNv4qLfvED0=;
        fh=lqdVayd46aercE8eR3/5GDs2IOHrFxOgZlbbgPzz8Y8=;
        b=iwqHkCdIIIoFOnEJl9LWP5GqaTYODx3ZTHrMK2PJFBUv53oSiVpoYDNkZcZrOKAM/L
         8ZZ9prIRsc8UyOlvEYYjV5ciUJwnYj31tHKVMLfNvT0WASB4WrZKkHXw+9leCuK1QdIf
         g+8qRhX+LLo7pBTXDN4MWM4zz/baH8s/NC1r8vgc19DEQ2spTtCpVydAe4bxh1dzOnFy
         6FlE2SVxn9P5Y1RVx5fhq/2HZ0u31ozK5fbzblyrk7N4NeVxiBJhTcNfMBSn6R/X0sF2
         jS6KO5yvALmbr5SDOEhM2RGmaVreEiGmzYioPOpgwDvSbuU5NU550B1IqYLkM5N9We3b
         dkJg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785615215; x=1786220015; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4+pBD0A2iNMwWbYkkuEdGXyILyjC2ACrmNv4qLfvED0=;
        b=DPeYlCMpEXUVHDIJExfXPs2sF+LNgsp9dXIs8sniwEAima2f4Ym/PZuJBgjUx0Au5/
         kPST4aLT5DxBEhyBBrlAhvS9rEaQwAABUxHPN5KfGpVVOfoZS+dnoNaMVC6W3FGccBcL
         vigmsmWqi9DjmY/Z93w9Te//yTYBMAaIc7ig4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785615215; x=1786220015;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4+pBD0A2iNMwWbYkkuEdGXyILyjC2ACrmNv4qLfvED0=;
        b=BSENn4U9p+phPZqQXPQrDCqUghrODKTayYBVBYmXFu9PjKkMcOjrh3vEnrsQmNMNK/
         iwaySCq9iAqaFMGEhGL1dAOTpQljpehJo7YFMsfUTxGDI/3lybLhxgaPwzdT0b+RHDup
         2HIV/VMFcWAFVbrLVh+sUSMVxZ/rVdKXPVHvue5tYFcR4BKb//ae3vE2pSIrcDD1bDsY
         z0mf6kouBanr8mpsBKsegXXUbMIDhmUsoBaoa4Hvw6dor+uZwedIu82NiH4Z9Fykh0eM
         Os7pWfuMv9YwkpnoqopZ10JJqFTmbpLHnF4f2lnnj++bGnoIIsi9qGeHHH0nZ8SejIhL
         wq9A==
X-Gm-Message-State: AOJu0YyRBLPi2GFYtO6SCdm0I5LMadozdPGabcXVRYCCcPTTZtMfqWEV
	yA8sHqx0TnXmvkN1vbd73RtNhtwkMV8BkLrvqBv52VZFsdHtDkVGr7ndt2eiB60PzOzBOqQmCFs
	mHNInYyxp4+GqgUnz5CFoKM3f/NU8cdBQomx1E399EcC5k2zmXtBB
X-Gm-Gg: AR+sD10n2zlYV/BzJtu8fBbQ5EKdjHRIPFTpaY0iy3qrf6sRx1adt09TRK6FUWmEUMV
	HB/txZXyptpIOliH2pSFxpYMyIvcKjsFlTIGDbIvM3aa+WIoEUx0pdHN51CCnDaC8DfFC7D907t
	lc/xnB1A3sJW2LcIwh1sxOOftWarUoam3BM3NZeXBcbWVzXvgXxzygap20LRrYRevmzcDG0Wm1Z
	xBWi179L0p8hHh3US3yaAfL8cjh3qE2nWk3lxMT+pFZZQzWN+Fmlu06q3U/jkBQBsaXFZv/UW4f
	515OENkTlgs6c1WglsB3h1VhuTiyHVFQW64UssjfDEFV
X-Received: by 2002:a05:690c:c509:b0:81d:fd3d:ee6d with SMTP id
 00721157ae682-81fd4b727c7mr70870167b3.17.1785615215418; Sat, 01 Aug 2026
 13:13:35 -0700 (PDT)
MIME-Version: 1.0
References: <0101019fbbed49f3-260b7e53-4ccb-4256-a876-b6913d8b4710-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019fbbed49f3-260b7e53-4ccb-4256-a876-b6913d8b4710-000000@us-west-2.amazonses.com>
From: Tim Orling <tim.orling@konsulko.com>
Date: Sat, 1 Aug 2026 13:13:24 -0700
X-Gm-Features: AUfX_myZ7VYegJ-XO2qjianx3UGv_Q2ZfGzlQLbkpRVgyRCqEi1jLyuCZPuXlXw
Message-ID: <CAOyo-853QSN8iLQyFsKRCazbYFcjeZncSGRsuCp3rRboh9_igQ@mail.gmail.com>
Subject: Re: [AUH] python3-cryptography,python3-cryptography-vectors:
 upgrading to 50.0.0,50.0.0 FAILED
To: auh@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009eee3b065801f0e4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 20:13:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242499

--0000000000009eee3b065801f0e4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 11:05=E2=80=AFPM <auh@yoctoproject.org> wrote:

> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe(s)
> *python3-cryptography,python3-cryptography-vectors* to *50.0.0,50.0.0* ha=
s
> Failed (devtool error).
>

This is on my "TODO list" for next week.


>
> Detailed error information:
>
> Running 'devtool upgrade' for recipe python3-cryptography failed.
> NOTE: Reconnecting to bitbake server...
> Loading cache...done.
> Loaded 0 entries from dependency cache.
> Parsing recipes...done.
> Parsing of 956 .bb files complete (0 cached, 956 parsed). 1988 targets, 4=
0
> skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           =3D "2.19.0"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "universal"
> TARGET_SYS           =3D "x86_64-poky-linux"
> MACHINE              =3D "qemux86-64"
> SDKMACHINE           =3D "x86_64"
> DISTRO               =3D "poky"
> DISTRO_VERSION       =3D
> "6.0.99+snapshot-69cf2fedb5a550366ccaafff994d3c98b0f18034"
> TUNE_FEATURES        =3D "m64 x86-64-v3"
> meta                 =3D
> "tmp-auh-upgrades:69cf2fedb5a550366ccaafff994d3c98b0f18034"
> meta-yocto-bsp
> meta-poky            =3D "master:9c6cf36c3511b94957aba04002d98bec665e9f1e=
"
> workspace            =3D "<unknown>:<unknown>"
>
> Initialising tasks...NOTE: The /proc/pressure files can't be read.
> Continuing build without monitoring pressure
> Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100%
> match, 100% complete)
> done.
> NOTE: Executing Tasks
> NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be
> rerun and all succeeded.
> NOTE: Writing buildhistory
> NOTE: Writing buildhistory took: 1 seconds
> Loading cache...done.
> Loaded 0 entries from dependency cache.
> Parsing recipes...WARNING:
> /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/recipetool/
> tmp-recipetool-p8ezf6lk.bb: tmp-recipetool-p8ezf6lk: LICENSE is using
> "CLOSED", which is deprecated. Convert to using a license ref pointing to
> an actual license file, e.g.
> LICENSE =3D "LicenseRef-tmp-recipetool-p8ezf6lk-CLOSED"
> done.
> Parsing of 957 .bb files complete (0 cached, 957 parsed). 1989 targets, 4=
0
> skipped, 0 masked, 0 errors.
>
> Summary: There was 1 WARNING message.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           =3D "2.19.0"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "universal"
> TARGET_SYS           =3D "x86_64-poky-linux"
> MACHINE              =3D "qemux86-64"
> SDKMACHINE           =3D "x86_64"
> DISTRO               =3D "poky"
> DISTRO_VERSION       =3D
> "6.0.99+snapshot-69cf2fedb5a550366ccaafff994d3c98b0f18034"
> TUNE_FEATURES        =3D "m64 x86-64-v3"
> meta                 =3D
> "tmp-auh-upgrades:69cf2fedb5a550366ccaafff994d3c98b0f18034"
> meta-yocto-bsp
> meta-poky            =3D "master:9c6cf36c3511b94957aba04002d98bec665e9f1e=
"
> workspace            =3D "<unknown>:<unknown>"
>
> Initialising tasks...NOTE: The /proc/pressure files can't be read.
> Continuing build without monitoring pressure
> Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match,
> 0% complete)
> done.
> NOTE: Executing Tasks
> WARNING: tmp-recipetool-p8ezf6lk: LICENSE is using "CLOSED", which is
> deprecated. Convert to using a license ref pointing to an actual license
> file, e.g.
> LICENSE =3D "LicenseRef-tmp-recipetool-p8ezf6lk-CLOSED"
> WARNING: tmp-recipetool-p8ezf6lk: LICENSE is using "CLOSED", which is
> deprecated. Convert to using a license ref pointing to an actual license
> file, e.g.
> LICENSE =3D "LicenseRef-tmp-recipetool-p8ezf6lk-CLOSED"
> WARNING: tmp-recipetool-p8ezf6lk: LICENSE is using "CLOSED", which is
> deprecated. Convert to using a license ref pointing to an actual license
> file, e.g.
> LICENSE =3D "LicenseRef-tmp-recipetool-p8ezf6lk-CLOSED"
> NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun
> and all succeeded.
> NOTE: Writing buildhistory
> NOTE: Writing buildhistory took: 1 seconds
> WARNING: tmp-recipetool-p8ezf6lk: LICENSE is using "CLOSED", which is
> deprecated. Convert to using a license ref pointing to an actual license
> file, e.g.
> LICENSE =3D "LicenseRef-tmp-recipetool-p8ezf6lk-CLOSED"
> Adding changed files:   0% |                                   | ETA:
> --:--:--
> Adding changed files:   0% |                                   | ETA:
> --:--:--
> Adding changed files:  58% |#####################               | ETA:
> 0:00:00
> Adding changed files: 100% |####################################| Time:
> 0:00:00
> Removing 1 recipes from the x86-64-v3 sysroot...done.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           =3D "2.19.0"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "universal"
> TARGET_SYS           =3D "x86_64-poky-linux"
> MACHINE              =3D "qemux86-64"
> SDKMACHINE           =3D "x86_64"
> DISTRO               =3D "poky"
> DISTRO_VERSION       =3D
> "6.0.99+snapshot-69cf2fedb5a550366ccaafff994d3c98b0f18034"
> TUNE_FEATURES        =3D "m64 x86-64-v3"
> meta                 =3D
> "tmp-auh-upgrades:69cf2fedb5a550366ccaafff994d3c98b0f18034"
> meta-yocto-bsp
> meta-poky            =3D "master:9c6cf36c3511b94957aba04002d98bec665e9f1e=
"
> workspace            =3D "<unknown>:<unknown>"
>
> Initialising tasks...NOTE: The /proc/pressure files can't be read.
> Continuing build without monitoring pressure
> Sstate summary: Wanted 29 Local 29 Mirrors 0 Missed 0 Current 58 (100%
> match, 100% complete)
> done.
> NOTE: Executing Tasks
> NOTE: Tasks Summary: Attempted 292 tasks of which 291 didn't need to be
> rerun and all succeeded.
> NOTE: Writing buildhistory
> NOTE: Writing buildhistory took: 1 seconds
> INFO: Extracting current version source...
> INFO: Extracting upgraded version source...
> INFO: Fetching
> https://files.pythonhosted.org/packages/source/c/cryptography/cryptograph=
y-50.0.0.tar.gz;downloadfilename=3Dcryptography-50.0.0.tar.gz.
> ..
> INFO: Rebasing devtool onto 883a837fd2addb1a32394e499fdfb053e2da8691
> WARNING: Command 'git rebase 883a837fd2addb1a32394e499fdfb053e2da8691'
> failed:
> Auto-merging pyproject.toml
> CONFLICT (content): Merge conflict in pyproject.toml
>
> You will need to resolve conflicts in order to complete the upgrade.
> INFO: Running extra recipe upgrade task: do_update_crates
> ERROR: When reparsing
> /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/python3-cry=
ptography/python3-cryptography.bb:do_update_crates,
> the basehash value changed from
> fef8ca18792992c562db4247a5a95cc4fe145d2306d5ddb176f238d1809d4747 to
> b5ec6dcd10f171e3b81f748cd6dc8aa22e8a52fca539714ea303420f16a4dec0. The
> metadata is not deterministic and this needs to be fixed.
> ERROR: The following commands may help:
> ERROR: $ bitbake python3-cryptography -cdo_update_crates -Snone
> ERROR: Then:
> ERROR: $ bitbake python3-cryptography -cdo_update_crates -Sprintdiff
>
> ERROR: Taskhash mismatch
> dab261c4583f88d59aa8bffe348b3ba4274b92654b31dd63f936c626ef7ff2a1 versus
> c712e08ac8e7b361b840b901bd1a42d39624b0bdc35310c509af4687bef3cadf for
> /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/python3-cry=
ptography/python3-cryptography.bb:
> do_update_crates
> INFO: Upgraded source extracted to
> /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/python3-cry=
ptography
> INFO: New recipe is
> /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/python3-cry=
ptography/
> python3-cryptography.bb
> INFO: Changelog extracted to
> /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/python3-=
cryptography.txt
>
>
>
> Please review the attached files for further information and build/update
> failures.
> Any problem please file a bug at
> https://bugzilla.yoctoproject.org/enter_bug.cgi?product=3DAutomated%20Upd=
ate%20Handler
>
> Regards,
> The Upgrade Helper

--0000000000009eee3b065801f0e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 31,=
 2026 at 11:05=E2=80=AFPM &lt;<a href=3D"mailto:auh@yoctoproject.org">auh@y=
octoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Hello,<br>
<br>
this email is a notification from the Auto Upgrade Helper<br>
that the automatic attempt to upgrade the recipe(s) *python3-cryptography,p=
ython3-cryptography-vectors* to *50.0.0,50.0.0* has Failed (devtool error).=
<br></blockquote><div><br></div><div>This is on my &quot;TODO list&quot; fo=
r next week.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
Detailed error information:<br>
<br>
Running &#39;devtool upgrade&#39; for recipe python3-cryptography failed.<b=
r>
NOTE: Reconnecting to bitbake server...<br>
Loading cache...done.<br>
Loaded 0 entries from dependency cache.<br>
Parsing recipes...done.<br>
Parsing of 956 .bb files complete (0 cached, 956 parsed). 1988 targets, 40 =
skipped, 0 masked, 0 errors.<br>
NOTE: Resolving any missing task queue dependencies<br>
<br>
Build Configuration:<br>
BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;2.19.0&quot;<b=
r>
BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-linux&q=
uot;<br>
NATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =3D &quot;universal&quot;<br>
TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-poky-li=
nux&quot;<br>
MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;qemux86-6=
4&quot;<br>
SDKMACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64&quot;<b=
r>
DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;poky=
&quot;<br>
DISTRO_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;6.0.99+snapshot-69cf2fed=
b5a550366ccaafff994d3c98b0f18034&quot;<br>
TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;m64 x86-64-v3&quot;<br>
meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot=
;tmp-auh-upgrades:69cf2fedb5a550366ccaafff994d3c98b0f18034&quot;<br>
meta-yocto-bsp=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
meta-poky=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;master:9c6cf36=
c3511b94957aba04002d98bec665e9f1e&quot;<br>
workspace=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;&lt;unknown&gt=
;:&lt;unknown&gt;&quot;<br>
<br>
Initialising tasks...NOTE: The /proc/pressure files can&#39;t be read. Cont=
inuing build without monitoring pressure<br>
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% matc=
h, 100% complete)<br>
done.<br>
NOTE: Executing Tasks<br>
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn&#39;t need to be=
 rerun and all succeeded.<br>
NOTE: Writing buildhistory<br>
NOTE: Writing buildhistory took: 1 seconds<br>
Loading cache...done.<br>
Loaded 0 entries from dependency cache.<br>
Parsing recipes...WARNING: /srv/pokybuild/yocto-worker/auh/build/build/work=
space/recipes/recipetool/<a href=3D"http://tmp-recipetool-p8ezf6lk.bb" rel=
=3D"noreferrer" target=3D"_blank">tmp-recipetool-p8ezf6lk.bb</a>: tmp-recip=
etool-p8ezf6lk: LICENSE is using &quot;CLOSED&quot;, which is deprecated. C=
onvert to using a license ref pointing to an actual license file, e.g.<br>
LICENSE =3D &quot;LicenseRef-tmp-recipetool-p8ezf6lk-CLOSED&quot;<br>
done.<br>
Parsing of 957 .bb files complete (0 cached, 957 parsed). 1989 targets, 40 =
skipped, 0 masked, 0 errors.<br>
<br>
Summary: There was 1 WARNING message.<br>
NOTE: Resolving any missing task queue dependencies<br>
<br>
Build Configuration:<br>
BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;2.19.0&quot;<b=
r>
BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-linux&q=
uot;<br>
NATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =3D &quot;universal&quot;<br>
TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-poky-li=
nux&quot;<br>
MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;qemux86-6=
4&quot;<br>
SDKMACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64&quot;<b=
r>
DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;poky=
&quot;<br>
DISTRO_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;6.0.99+snapshot-69cf2fed=
b5a550366ccaafff994d3c98b0f18034&quot;<br>
TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;m64 x86-64-v3&quot;<br>
meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot=
;tmp-auh-upgrades:69cf2fedb5a550366ccaafff994d3c98b0f18034&quot;<br>
meta-yocto-bsp=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
meta-poky=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;master:9c6cf36=
c3511b94957aba04002d98bec665e9f1e&quot;<br>
workspace=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;&lt;unknown&gt=
;:&lt;unknown&gt;&quot;<br>
<br>
Initialising tasks...NOTE: The /proc/pressure files can&#39;t be read. Cont=
inuing build without monitoring pressure<br>
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0%=
 complete)<br>
done.<br>
NOTE: Executing Tasks<br>
WARNING: tmp-recipetool-p8ezf6lk: LICENSE is using &quot;CLOSED&quot;, whic=
h is deprecated. Convert to using a license ref pointing to an actual licen=
se file, e.g.<br>
LICENSE =3D &quot;LicenseRef-tmp-recipetool-p8ezf6lk-CLOSED&quot;<br>
WARNING: tmp-recipetool-p8ezf6lk: LICENSE is using &quot;CLOSED&quot;, whic=
h is deprecated. Convert to using a license ref pointing to an actual licen=
se file, e.g.<br>
LICENSE =3D &quot;LicenseRef-tmp-recipetool-p8ezf6lk-CLOSED&quot;<br>
WARNING: tmp-recipetool-p8ezf6lk: LICENSE is using &quot;CLOSED&quot;, whic=
h is deprecated. Convert to using a license ref pointing to an actual licen=
se file, e.g.<br>
LICENSE =3D &quot;LicenseRef-tmp-recipetool-p8ezf6lk-CLOSED&quot;<br>
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn&#39;t need to be rer=
un and all succeeded.<br>
NOTE: Writing buildhistory<br>
NOTE: Writing buildhistory took: 1 seconds<br>
WARNING: tmp-recipetool-p8ezf6lk: LICENSE is using &quot;CLOSED&quot;, whic=
h is deprecated. Convert to using a license ref pointing to an actual licen=
se file, e.g.<br>
LICENSE =3D &quot;LicenseRef-tmp-recipetool-p8ezf6lk-CLOSED&quot;<br>
Adding changed files:=C2=A0 =C2=A00% |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| ETA:=C2=A0 --:--:--<br>
Adding changed files:=C2=A0 =C2=A00% |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| ETA:=C2=A0 --:--:--<br>
Adding changed files:=C2=A0 58% |#####################=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:00<br>
Adding changed files: 100% |####################################| Time: 0:0=
0:00<br>
Removing 1 recipes from the x86-64-v3 sysroot...done.<br>
NOTE: Resolving any missing task queue dependencies<br>
<br>
Build Configuration:<br>
BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;2.19.0&quot;<b=
r>
BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-linux&q=
uot;<br>
NATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =3D &quot;universal&quot;<br>
TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-poky-li=
nux&quot;<br>
MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;qemux86-6=
4&quot;<br>
SDKMACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64&quot;<b=
r>
DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;poky=
&quot;<br>
DISTRO_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;6.0.99+snapshot-69cf2fed=
b5a550366ccaafff994d3c98b0f18034&quot;<br>
TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;m64 x86-64-v3&quot;<br>
meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot=
;tmp-auh-upgrades:69cf2fedb5a550366ccaafff994d3c98b0f18034&quot;<br>
meta-yocto-bsp=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
meta-poky=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;master:9c6cf36=
c3511b94957aba04002d98bec665e9f1e&quot;<br>
workspace=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;&lt;unknown&gt=
;:&lt;unknown&gt;&quot;<br>
<br>
Initialising tasks...NOTE: The /proc/pressure files can&#39;t be read. Cont=
inuing build without monitoring pressure<br>
Sstate summary: Wanted 29 Local 29 Mirrors 0 Missed 0 Current 58 (100% matc=
h, 100% complete)<br>
done.<br>
NOTE: Executing Tasks<br>
NOTE: Tasks Summary: Attempted 292 tasks of which 291 didn&#39;t need to be=
 rerun and all succeeded.<br>
NOTE: Writing buildhistory<br>
NOTE: Writing buildhistory took: 1 seconds<br>
INFO: Extracting current version source...<br>
INFO: Extracting upgraded version source...<br>
INFO: Fetching <a href=3D"https://files.pythonhosted.org/packages/source/c/=
cryptography/cryptography-50.0.0.tar.gz;downloadfilename=3Dcryptography-50.=
0.0.tar.gz." rel=3D"noreferrer" target=3D"_blank">https://files.pythonhoste=
d.org/packages/source/c/cryptography/cryptography-50.0.0.tar.gz;downloadfil=
ename=3Dcryptography-50.0.0.tar.gz.</a>..<br>
INFO: Rebasing devtool onto 883a837fd2addb1a32394e499fdfb053e2da8691<br>
WARNING: Command &#39;git rebase 883a837fd2addb1a32394e499fdfb053e2da8691&#=
39; failed:<br>
Auto-merging pyproject.toml<br>
CONFLICT (content): Merge conflict in pyproject.toml<br>
<br>
You will need to resolve conflicts in order to complete the upgrade.<br>
INFO: Running extra recipe upgrade task: do_update_crates<br>
ERROR: When reparsing /srv/pokybuild/yocto-worker/auh/build/build/workspace=
/recipes/python3-cryptography/python3-cryptography.bb:do_update_crates, the=
 basehash value changed from fef8ca18792992c562db4247a5a95cc4fe145d2306d5dd=
b176f238d1809d4747 to b5ec6dcd10f171e3b81f748cd6dc8aa22e8a52fca539714ea3034=
20f16a4dec0. The metadata is not deterministic and this needs to be fixed.<=
br>
ERROR: The following commands may help:<br>
ERROR: $ bitbake python3-cryptography -cdo_update_crates -Snone<br>
ERROR: Then:<br>
ERROR: $ bitbake python3-cryptography -cdo_update_crates -Sprintdiff<br>
<br>
ERROR: Taskhash mismatch dab261c4583f88d59aa8bffe348b3ba4274b92654b31dd63f9=
36c626ef7ff2a1 versus c712e08ac8e7b361b840b901bd1a42d39624b0bdc35310c509af4=
687bef3cadf for /srv/pokybuild/yocto-worker/auh/build/build/workspace/recip=
es/python3-cryptography/python3-cryptography.bb:do_update_crates<br>
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/bu=
ild/workspace/sources/python3-cryptography<br>
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/r=
ecipes/python3-cryptography/<a href=3D"http://python3-cryptography.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-cryptography.bb</a><br>
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/wo=
rkspace/changelogs/python3-cryptography.txt<br>
<br>
<br>
<br>
Please review the attached files for further information and build/update f=
ailures.<br>
Any problem please file a bug at <a href=3D"https://bugzilla.yoctoproject.o=
rg/enter_bug.cgi?product=3DAutomated%20Update%20Handler" rel=3D"noreferrer"=
 target=3D"_blank">https://bugzilla.yoctoproject.org/enter_bug.cgi?product=
=3DAutomated%20Update%20Handler</a><br>
<br>
Regards,<br>
The Upgrade Helper</blockquote></div></div>

--0000000000009eee3b065801f0e4--

