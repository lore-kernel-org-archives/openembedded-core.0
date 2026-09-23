Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14212C982FA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 08:23:13 +0000 (UTC)
Received: from mail-qv2-f17.google.com (mail-qv2-f17.google.com [74.125.230.145])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2356.1790151788210946678
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 01:23:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gJ4Ceztz;
 spf=pass (domain: gmail.com, ip: 74.125.230.145, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv2-f17.google.com with SMTP id 6a1803df08f44-90cdfe57a3aso6083786d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 01:23:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790151787; cv=none;
        d=google.com; s=arc-20260327;
        b=fN0ZAbsTOD8V7uPffaWJA4/HEzp1NF+NQMAPqhhjb1kssB57AyGUoNMCv7DAg/K5LJ
         BZmqtszRD+DoIAPN91TBkL/FNrbMtBWCrPzkg4gxlPAXqJEN+CopneV+bUxBISVzNwoY
         zbd7BCXw0x1kANJG3eUexaCgFlQIvYZYmEqU8uV1FFkqlMui92IjGlawV8lvboQgw2Q+
         V6uhvksoJDPgdHv1g/V/2Z6RACIKd928WNPjc6aLtgLmGy+/LfmEt4bFKrHLzgq3aa1g
         lzt1T+3OuyvJJ7+sUP+MGbvC2+Zi/zCBEvVJmSOM5Yqk3Adz5wvaJD98H4WUfE1K9EIp
         quog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=rTXtkhBbA0SDZMZVM17RbVa4CuxjO/3ZlfaGAY7gOkk=;
        fh=ZnYqyxfmOIJJPfJ/xm1LxqgehCArprM54APFolr4KDI=;
        b=cNijRm1DBytkUFWNXQSLbwlbS7TmUXxqzUuxa0v0xDrPCwuC2IP3M+ShanREfT9hZG
         tXY+fFfDJV9skkBT+BkUKt50V4T34Jt4BuVF8dtOs5jTiJYC0zaJSxKVlK7paKFnlUfT
         wbozBeDPrIejgFBgB51MiPEFi+uW5UZqKj1LuAtPEeUtOsU3uzU7oRrlvAfOz875W9wH
         CfrG5qojVtJkbft+iiiPfQZr5heenBnUA/N23oKNrDovWUIxFJ01y9rznuxPPO19FVxd
         qR2y0nLu1OygZdJsO/vgKgH2CcOB+FPedc+ElTE7a89qqzg3G/eTadnKQdA0v2633Zom
         YdrA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790151787; x=1790756587; darn=lists.openembedded.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rTXtkhBbA0SDZMZVM17RbVa4CuxjO/3ZlfaGAY7gOkk=;
        b=gJ4Ceztz3lKO0EaekF3U/uPD/Kxgc8LRJtlFSHXr8BCJoeU0QFqvK4Ak30egstbW+u
         wN1YZ8fvpjTfYJQWphzEmy6X5Rh7I/5hetTgoCRvi7420hhCIs+rCrNenwNwxgQ1diB5
         lqXsGJIc5vteO2WBUSSsnjKRa2LSjGiZ18zR23jkBhYVwLwzyGp6uGqxBJWrfl7fLhuE
         46QXEJTmZf439bBCe93y39kOhiLRNgUAVTjr+aJ513aB6jNboqZ5KUcEiZGDt9vHRdJM
         qelCSelWa9ICZiSRs0LGc/c5612SMXKr+TTGX2gijsOVL+ro26lshOunJ1Gz58sz8Muj
         /RvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790151787; x=1790756587;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rTXtkhBbA0SDZMZVM17RbVa4CuxjO/3ZlfaGAY7gOkk=;
        b=E+jXpIBZZeVYztHTjkxMU5mbctw6kRBBV7iZZTu0U/vXD66SDu0mgzTFehXzk+psnC
         cbnf7C6sKJ/T4Yzpc29/A5Otx/jATDHJGlsrDANI9qZiMQREwetIX/+ZpaXt+8Mh0y9l
         2p0/kSROgBWxl6hRFaoOtkw1ROOQg5c3IDqtdHG/WzmiJ8NP96EMhKgb9QHRPPwLQaot
         LaI9Ve3QF3mZr4sqrzeeYiabM023an1JmbcviAUe6O2rYC4kBUtQZmL3BSf/hAjS1hVG
         2RVGpvQkbWYn0lEilw1YXPui+jMznAgMXSTIhuXzBPicToi1zd2xaxMuw3wm6++GM3+S
         vrLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzoAC6qxpsvwdWSrIO+Jm8rNiqSlEZf/CGO5Pv9tw8034P7Ro69gg19SClE4yvbh35VwVxZYHOsug+ktA/Qg3QmPA==@lists.openembedded.org
X-Gm-Message-State: AFuF++mApNFaPRDkDhpzxX8NvzAcC4EnqLZ1cGL+ZUyqRkwHYx/t46xZ
	EB/dkyaM4FpjxYT8rToNqlaywZIM/iqMCTr1QVMtbdPWYqcKKsCAdz2UmaoqA5K5i30RbfCpwCW
	AbiAtcAWjn6zfBLj/uDx+/ehs5R4wHrk=
X-Gm-Gg: AYBFou0AUT+Ol8cnoj7o7TyTyNI3dPbmWpANXt3y4acj5qBXMVtzBy7SgVEiQ/Evp1E
	rdMGYp2sWftB912jhmukX1ESex/GpCHBj/OKNCdE0JwzU26+5JBCHapnpAAwxec/+jEn658Ml6h
	wbnWwYSOttENJW1q+DMr3u5t8hio3kPizsgD2Xot7Uio5hwxtysdaMO0DEqwCSBnx+qPl8nPodn
	etpm3wOx+5gJMR4kYBvUs/QVsmrcxoqdhTedU5hh3TC+j1KQdkXvwaodowu4NkScG7LTvTzlQiL
	tMKir3R8/FHFcX6cNugfhatrCMkPr5VlfUCKYnoeSS12z8GOyLmFrScPgE1Hqz6Hh5EjMsrZ2lu
	XgC+V7FxlaHgAdg==
X-Received: by 2002:ad4:574d:0:b0:914:ba6:a3a9 with SMTP id
 6a1803df08f44-9140c47289amr29215156d6.37.1790151786950; Wed, 23 Sep 2026
 01:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <010101a0ccf2d91f-5984bd6e-1d09-4692-9286-aa060ccfb214-000000@us-west-2.amazonses.com>
In-Reply-To: <010101a0ccf2d91f-5984bd6e-1d09-4692-9286-aa060ccfb214-000000@us-west-2.amazonses.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 23 Sep 2026 10:22:54 +0200
X-Gm-Features: AclHuK9pTKhO_AgxQDR4NElYXVVhPp6vEKAarPqykBcsveTQrbNrtaOeVcfBWuY
Message-ID: <CANNYZj8h-cWQcb3DX_hD3qL_=TbkXtwuea1nnb9agAwQQ3zRRQ@mail.gmail.com>
Subject: Re: [OE-core] [AUH] systemd-boot,systemd-tools-native,systemd-boot-native,systemd:
 upgrading to 262,262,262,262 FAILED
To: Daniel Turull <daniel.turull@ericsson.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005af3f6065c2231dd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 08:23:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246460

--0000000000005af3f6065c2231dd
Content-Type: text/plain; charset="UTF-8"

I guess the identical versions should be folded in AUH email headers as
well?

Alex

On Wed, 23 Sept 2026 at 08:27, Auto Upgrade Helper via
lists.openembedded.org <auh=yoctoproject.org@lists.openembedded.org> wrote:

> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe(s)
> *systemd-boot,systemd-tools-native,systemd-boot-native,systemd* to
> *262,262,262,262* has Failed (devtool error).
>
> Detailed error information:
>
> Running 'devtool upgrade' for recipe systemd-boot failed.
> NOTE: Reconnecting to bitbake server...
> NOTE: Reconnecting to bitbake server...
> Loading cache...done.
> Loaded 0 entries from dependency cache.
> Parsing recipes...done.
> Parsing of 959 .bb files complete (0 cached, 959 parsed). 1993 targets, 43
> skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           = "2.19.1"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "x86_64-poky-linux"
> MACHINE              = "qemux86-64"
> SDKMACHINE           = "x86_64"
> DISTRO               = "poky"
> DISTRO_VERSION       =
> "6.0.99+snapshot-d931446dac36811ff08d610f5e5ab87b785840ef"
> TUNE_FEATURES        = "m64 x86-64-v3"
> meta                 =
> "tmp-auh-upgrades:d931446dac36811ff08d610f5e5ab87b785840ef"
> meta-yocto-bsp
> meta-poky            = "master:d36c827e02ab138b446386792fd7588b5a041507"
> workspace            = "<unknown>:<unknown>"
>
> Initialising tasks...NOTE: The /proc/pressure files can't be read.
> Continuing build without monitoring pressure
> Sstate summary: Wanted 22 Local 22 Mirrors 0 Missed 0 Current 8 (100%
> match, 100% complete)
> done.
> NOTE: Executing Tasks
> NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be
> rerun and all succeeded.
> NOTE: Writing buildhistory
> NOTE: Writing buildhistory took: 2 seconds
> INFO: Creating workspace layer in
> /srv/pokybuild/yocto-worker/auh/build/build/workspace
> INFO: Extracting current version source...
> INFO: Extracting upgraded version source...
> INFO: Rebasing devtool onto 8cc40e0c5e9234bf45084751ac53b1fbfe70b492
> WARNING: Command 'git rebase 8cc40e0c5e9234bf45084751ac53b1fbfe70b492'
> failed:
> Auto-merging mkosi/mkosi.pkgenv/mkosi.conf.d/debian-ubuntu.conf
> CONFLICT (content): Merge conflict in
> mkosi/mkosi.pkgenv/mkosi.conf.d/debian-ubuntu.conf
>
> You will need to resolve conflicts in order to complete the upgrade.
> INFO: Upgraded source extracted to
> /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/systemd-boot
> INFO: New recipe is
> /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/systemd-boot/
> systemd-boot_262.bb
> INFO: Changelog extracted to
> /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/systemd-boot.txt
> INFO: Changelog metadata written to
> /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/systemd-boot.json
>
>
>
> Please review the attached files for further information and build/update
> failures.
> Any problem please file a bug at
> https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler
>
> Regards,
> The Upgrade Helper
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#246436):
> https://lists.openembedded.org/g/openembedded-core/message/246436
> Mute This Topic: https://lists.openembedded.org/mt/121388730/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000005af3f6065c2231dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I guess the identical versions should be folded in AU=
H email headers as well?</div><div><br></div><div>Alex</div></div><br><div =
class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 23 Sept 2026 at 08:27, Auto Upgrade Helper via <a href=3D"ht=
tp://lists.openembedded.org">lists.openembedded.org</a> &lt;auh=3D<a href=
=3D"mailto:yoctoproject.org@lists.openembedded.org">yoctoproject.org@lists.=
openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Hello,<br>
<br>
this email is a notification from the Auto Upgrade Helper<br>
that the automatic attempt to upgrade the recipe(s) *systemd-boot,systemd-t=
ools-native,systemd-boot-native,systemd* to *262,262,262,262* has Failed (d=
evtool error).<br>
<br>
Detailed error information:<br>
<br>
Running &#39;devtool upgrade&#39; for recipe systemd-boot failed.<br>
NOTE: Reconnecting to bitbake server...<br>
NOTE: Reconnecting to bitbake server...<br>
Loading cache...done.<br>
Loaded 0 entries from dependency cache.<br>
Parsing recipes...done.<br>
Parsing of 959 .bb files complete (0 cached, 959 parsed). 1993 targets, 43 =
skipped, 0 masked, 0 errors.<br>
NOTE: Resolving any missing task queue dependencies<br>
<br>
Build Configuration:<br>
BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;2.19.1&quot;<b=
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
DISTRO_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;6.0.99+snapshot-d931446d=
ac36811ff08d610f5e5ab87b785840ef&quot;<br>
TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;m64 x86-64-v3&quot;<br>
meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot=
;tmp-auh-upgrades:d931446dac36811ff08d610f5e5ab87b785840ef&quot;<br>
meta-yocto-bsp=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
meta-poky=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;master:d36c827=
e02ab138b446386792fd7588b5a041507&quot;<br>
workspace=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;&lt;unknown&gt=
;:&lt;unknown&gt;&quot;<br>
<br>
Initialising tasks...NOTE: The /proc/pressure files can&#39;t be read. Cont=
inuing build without monitoring pressure<br>
Sstate summary: Wanted 22 Local 22 Mirrors 0 Missed 0 Current 8 (100% match=
, 100% complete)<br>
done.<br>
NOTE: Executing Tasks<br>
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn&#39;t need to be=
 rerun and all succeeded.<br>
NOTE: Writing buildhistory<br>
NOTE: Writing buildhistory took: 2 seconds<br>
INFO: Creating workspace layer in /srv/pokybuild/yocto-worker/auh/build/bui=
ld/workspace<br>
INFO: Extracting current version source...<br>
INFO: Extracting upgraded version source...<br>
INFO: Rebasing devtool onto 8cc40e0c5e9234bf45084751ac53b1fbfe70b492<br>
WARNING: Command &#39;git rebase 8cc40e0c5e9234bf45084751ac53b1fbfe70b492&#=
39; failed:<br>
Auto-merging mkosi/mkosi.pkgenv/mkosi.conf.d/debian-ubuntu.conf<br>
CONFLICT (content): Merge conflict in mkosi/mkosi.pkgenv/mkosi.conf.d/debia=
n-ubuntu.conf<br>
<br>
You will need to resolve conflicts in order to complete the upgrade.<br>
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/bu=
ild/workspace/sources/systemd-boot<br>
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/r=
ecipes/systemd-boot/<a href=3D"http://systemd-boot_262.bb" rel=3D"noreferre=
r" target=3D"_blank">systemd-boot_262.bb</a><br>
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/wo=
rkspace/changelogs/systemd-boot.txt<br>
INFO: Changelog metadata written to /srv/pokybuild/yocto-worker/auh/build/b=
uild/workspace/changelogs/systemd-boot.json<br>
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
The Upgrade Helper<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#246436): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/246436" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/246436</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121388730/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121388730/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000005af3f6065c2231dd--

