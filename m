Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E51C4EB64D8
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 08:58:35 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.6540.1687337908379680675
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 01:58:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=VplFVF6u;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-311275efaf8so4159874f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 01:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687337907; x=1689929907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GFRTNwwcxNd9m290t17jMKm1K9u+NRWcKWJ86ndAa28=;
        b=VplFVF6u+BezBkzFxX4ti78MNi+l5sNSDBkzhkRLrqE+7tKyLR+GE9C4zhnXqUef5s
         5LX751bZgVYYDIep1JIKocO5BopBC34p4p0W460i5fvgFCRN+yWQE+89DTTvT5zfjAZa
         dcUsvaRILYGnRzDk8gfyA9t8Wa43cJqkkaA4U5T941OajUf3mHPzT14cVPYzrZnIFDZS
         C10SAG3yFk373H2VtC893pJkfASAV4J+/MuYe2IMUX7EWaV0gmhV76/FPsuBm/KJ0t5s
         FnY9SzeMGb5ffFaaBWld+NZ5wAlMwJqY9C2rtYR3SQn/wCYgD1/5qNwo6NdUTFUYp4X6
         paAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687337907; x=1689929907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GFRTNwwcxNd9m290t17jMKm1K9u+NRWcKWJ86ndAa28=;
        b=QZrkLW81ZY2BLgmDpTyiD1j6oS6sacRod0jAGCbvCo8+leXOdz7SuviDrbApCHf6kY
         prHffzXoaXZXF6f3HpAS23cgydk1ZuSQ9Wdd6u8vrmzeHw+Re6tKyMtf+bNVNRDFb/8F
         Uxqu7A5od9rYuPEsT+jykvzMETLpTkUDftqSKx4aTRiOqBrhn8AOqG7xejnTtfuwAQMd
         o9Vf38DwCHsHsAhtf6WdkwaRXR2qIeMje+IOE2sF8DbtpFvoriwoYGuMvh8ukvQ+8Wjf
         kA8AxvqnmKMdN0mXyqTh4+WNny7ovSoyE73MHTuTVOBWO35dGg2BGjdYTHWCK95HD3gx
         b9NQ==
X-Gm-Message-State: AC+VfDx4f5KCuycw3IDK5vI3v4vbIUrKP7YqGNr9k7j+uF7OrOFw3gR1
	DCoD8KPxzlHX3SFONXTAuUyj8Y3IM/jwsqRmkvM=
X-Google-Smtp-Source: ACHHUZ4sDv+d6WvlED68X1BXxmGcx+F4gW8oahSlECxIjCw+A3vFh5cm46+uM82vI2reZbU4LgTDRqQsVHZSJdgckJ8=
X-Received: by 2002:a5d:54d2:0:b0:30a:e3a2:7e9 with SMTP id
 x18-20020a5d54d2000000b0030ae3a207e9mr10804949wrv.0.1687337906470; Wed, 21
 Jun 2023 01:58:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230619140602.2669368-1-richard.purdie@linuxfoundation.org>
 <20230619140602.2669368-2-richard.purdie@linuxfoundation.org>
 <20230620221604.751c44f4@booty> <364ea28638465e51a624b33e7944d659dce9f3a0.camel@linuxfoundation.org>
In-Reply-To: <364ea28638465e51a624b33e7944d659dce9f3a0.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 21 Jun 2023 10:58:07 +0200
Message-ID: <CA+chaQeWv30wOP01eMRYybHZo90eQf7uPO0pXWLYcwy80YKvvQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] insane: Improve patch-status layer filtering
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000088020205fe9ff87a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 08:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183177

--00000000000088020205fe9ff87a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There is maybe unexpected change in behavior caused by this.

Before it was triggering error only for .patch files in oe-core, while now
it seems to apply for all recipes from oe-core layer (independently from
where the .patch file was added), so e.g. meta-raspberrypi is now causing
bluez5 do_patch to fail:

bluez5-5.66: Missing Upstream-Status in patch
meta-raspberrypi/recipes-connectivity/bluez5/bluez5/0001-bcm43xx-Add-bcm43x=
x-3wire-variant.patch
Please add according to
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Hea=
der_Recommendations:_Upstream-Status
. [patch-status]
bluez5-5.66: Missing Upstream-Status in patch
meta-raspberrypi/recipes-connectivity/bluez5/bluez5/0002-bcm43xx-The-UART-s=
peed-must-be-reset-after-the-firmw.patch
Please add according to
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Hea=
der_Recommendations:_Upstream-Status
. [patch-status]
bluez5-5.66: Missing Upstream-Status in patch
meta-raspberrypi/recipes-connectivity/bluez5/bluez5/0003-Increase-firmware-=
load-timeout-to-30s.patch
Please add according to
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Hea=
der_Recommendations:_Upstream-Status
. [patch-status]
bluez5-5.66: Missing Upstream-Status in patch
meta-raspberrypi/recipes-connectivity/bluez5/bluez5/0004-Move-the-hciattach=
-firmware-into-lib-firmware.patch
Please add according to
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Hea=
der_Recommendations:_Upstream-Status
. [patch-status]

On Wed, Jun 21, 2023 at 12:27=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2023-06-20 at 22:16 +0200, Luca Ceresoli wrote:
> > Hi Richard,
> >
> > On Mon, 19 Jun 2023 15:06:02 +0100
> > "Richard Purdie" <richard.purdie@linuxfoundation.org> wrote:
> >
> > > Now that we have layer overrides, we can easily enable patch-status i=
n
> > > ERROR_QA without the hardcoded code making it easier for other layers
> > > to opt into the checks.
> > >
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >
> > I love the cleanup this patch introduces, however I'm afraid it seems
> > to be causing some failures on selftest:
> >
> > AssertionError: Command 'bitbake  dos2unix -c patch' returned non-zero
> exit status 1:
> > ...
> > ERROR: dos2unix-7.5.0-r0 do_patch: QA Issue: Missing Upstream-Status in
> patch
> >
> >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5367/st=
eps/14/logs/stdio
> >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5402/st=
eps/15/logs/stdio
> >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5325/st=
eps/14/logs/stdio
> >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5375/st=
eps/15/logs/stdio
> >
> > Luca
> >
> > PS: I noticed you seems to already have a fix under test on
> > origin/master-next!
>
> Thanks! As you noticed, I did have a fix I was testing and I did run a
> test build of that just of oe-selftest. I've squashed a couple of
> selftest fixes into the commit and merged it.
>
> Cheers,
>
> Richard
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183161):
> https://lists.openembedded.org/g/openembedded-core/message/183161
> Mute This Topic: https://lists.openembedded.org/mt/99623855/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000088020205fe9ff87a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There is maybe unexpected change in behavior caused by thi=
s.<div><br></div><div>Before it was triggering error only for .patch files =
in oe-core, while now it seems to apply for all recipes from oe-core layer =
(independently from where the .patch file was added), so e.g. meta-raspberr=
ypi is now causing bluez5 do_patch to fail:</div><div><br></div><div>bluez5=
-5.66: Missing Upstream-Status in patch<br>meta-raspberrypi/recipes-connect=
ivity/bluez5/bluez5/0001-bcm43xx-Add-bcm43xx-3wire-variant.patch<br>Please =
add according to <a href=3D"https://www.openembedded.org/wiki/Commit_Patch_=
Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status">https://w=
ww.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recom=
mendations:_Upstream-Status</a> . [patch-status]<br>bluez5-5.66: Missing Up=
stream-Status in patch<br>meta-raspberrypi/recipes-connectivity/bluez5/blue=
z5/0002-bcm43xx-The-UART-speed-must-be-reset-after-the-firmw.patch<br>Pleas=
e add according to <a href=3D"https://www.openembedded.org/wiki/Commit_Patc=
h_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status">https:/=
/www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Rec=
ommendations:_Upstream-Status</a> . [patch-status]<br>bluez5-5.66: Missing =
Upstream-Status in patch<br>meta-raspberrypi/recipes-connectivity/bluez5/bl=
uez5/0003-Increase-firmware-load-timeout-to-30s.patch<br>Please add accordi=
ng to <a href=3D"https://www.openembedded.org/wiki/Commit_Patch_Message_Gui=
delines#Patch_Header_Recommendations:_Upstream-Status">https://www.openembe=
dded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:=
_Upstream-Status</a> . [patch-status]<br>bluez5-5.66: Missing Upstream-Stat=
us in patch<br>meta-raspberrypi/recipes-connectivity/bluez5/bluez5/0004-Mov=
e-the-hciattach-firmware-into-lib-firmware.patch<br>Please add according to=
 <a href=3D"https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelin=
es#Patch_Header_Recommendations:_Upstream-Status">https://www.openembedded.=
org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upst=
ream-Status</a> . [patch-status]</div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 21, 2023 at 12:27=E2=80=
=AFAM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.o=
rg">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Tue, 2023-06-20 at 22:16 +0200, Lu=
ca Ceresoli wrote:<br>
&gt; Hi Richard,<br>
&gt; <br>
&gt; On Mon, 19 Jun 2023 15:06:02 +0100<br>
&gt; &quot;Richard Purdie&quot; &lt;<a href=3D"mailto:richard.purdie@linuxf=
oundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;=
 wrote:<br>
&gt; <br>
&gt; &gt; Now that we have layer overrides, we can easily enable patch-stat=
us in<br>
&gt; &gt; ERROR_QA without the hardcoded code making it easier for other la=
yers<br>
&gt; &gt; to opt into the checks.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdi=
e@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org=
</a>&gt;<br>
&gt; <br>
&gt; I love the cleanup this patch introduces, however I&#39;m afraid it se=
ems<br>
&gt; to be causing some failures on selftest:<br>
&gt; <br>
&gt; AssertionError: Command &#39;bitbake=C2=A0 dos2unix -c patch&#39; retu=
rned non-zero exit status 1:<br>
&gt; ...<br>
&gt; ERROR: dos2unix-7.5.0-r0 do_patch: QA Issue: Missing Upstream-Status i=
n patch<br>
&gt; <br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/86/=
builds/5367/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https=
://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5367/steps/14/=
logs/stdio</a><br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/87/=
builds/5402/steps/15/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https=
://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5402/steps/15/=
logs/stdio</a><br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/80/=
builds/5325/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https=
://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5325/steps/14/=
logs/stdio</a><br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/79/=
builds/5375/steps/15/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https=
://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5375/steps/15/=
logs/stdio</a><br>
&gt; <br>
&gt; Luca<br>
&gt; <br>
&gt; PS: I noticed you seems to already have a fix under test on<br>
&gt; origin/master-next!<br>
<br>
Thanks! As you noticed, I did have a fix I was testing and I did run a<br>
test build of that just of oe-selftest. I&#39;ve squashed a couple of<br>
selftest fixes into the commit and merged it.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#183161): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/183161" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/183161</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99623855/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/99623855/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000088020205fe9ff87a--

