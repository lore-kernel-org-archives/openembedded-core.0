Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70811C98304
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 18:03:59 +0000 (UTC)
Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1707.1790186634592063010
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 11:03:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LQ+J5S/L;
 spf=pass (domain: gmail.com, ip: 74.125.224.140, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66fded6b087so1064223d50.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 11:03:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790186633; cv=none;
        d=google.com; s=arc-20260327;
        b=cyGeBJY0E48acVMWCzdQcVeexF6gdBckWBHeh7WSQ46q69IutnH/esfYwaJsPcOmkc
         MMX3zVXpHiO266mPK4HZQD8ZbhjKDc16/ElHwLd6rPTr/hnkZrrkU6POqD+ZeF46kazI
         3WaNDS0PJ+8rJx5/LtEVfkZrea9KwKy6Ue3949CU6mAcaeIrbrukohbPXC6BuJhb1+CH
         FpQATWGWW/mPCVVsU1+Sg7oOZFZd46bwgNB8pGVF9mP2oxqTETwXJCD7vqfosIATcrv0
         1dOqY4/rSvxn6/2Tn2oB6q8xlY4gTKuz6jBY1gjvvlZ7WD0MQ4q5gCaReibH76jArpTt
         nuSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Q+l0sk2upNE5Ir+buEajiWzCelCVuMPsRGGdhvaB2O4=;
        fh=jNZGa4lu8rmWQevIpRERVYOWYc09gn+ec7h52DcWyDs=;
        b=XlrH8ALyBL5gwYoDb1XAyCNdjxHPEUh2kR6mauaXYcXNAWuiYkyu6yAJUvR6nu55JH
         UhyILIBWGvCtYeszpxq1rwLd+RM/fmxliYRC0L1TMSp9CXkYLM1p7/y1ElTaKf/57Ub/
         zEHDkl+3EAz2ZB4iT1h9QAau5RW/ClS2+476NwgiAxbghDsQ0ioE6KtnK5Elc7J3fjsF
         jkf0CSOOPffl4RM/lTuSBvS9I+tPDHCYoHFVqdsUkRKr/1oQH5Symo16Dm5d3zq53PyA
         MoNzz/w59FZ0EEwneTcKPio7LbhB0wyIZBxI2NQF2YOSHu7a2YfFQtGVkh+AQbXKW0/t
         oy0w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790186633; x=1790791433; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q+l0sk2upNE5Ir+buEajiWzCelCVuMPsRGGdhvaB2O4=;
        b=LQ+J5S/LEe2ZnPC+XCiRIwFZn2V34NTHhC3I1bE/EHmPSyNAc+ha2dgWOFTnsQP/Nu
         OZJXbSpfL9WrRaApNfbtdmdaey3gvP8SVxgd1UWYakkH2+Pmrzegq2h0SbDr+9OZOQpE
         R55idyqd99i4Z9sWZwJYGLuaZer+mqOa4alfWaHsGLxPI2NleU1h+bPFFT26vP+GjCpM
         biEVd5IeihW/OKF93cXEYeSlT9yrkUAoCUbUHMjfklt9lIT49ypgm0dtrkp52VIXZXLo
         DLZavKdU7oam814fNnoWXVsAMuey9rSeaBBJ/NX/suPZYa1u57yRtmtcsgxQNoYy6yd8
         cxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790186633; x=1790791433;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q+l0sk2upNE5Ir+buEajiWzCelCVuMPsRGGdhvaB2O4=;
        b=2tOP9SOjtEJhsb2gk5I5rc8ETsNT68W41nbCTVdlQN7ymNrAnosADCuqqoSYliFc9s
         IL37NyRI79uY0OzBSNe+uHJWGalSqTc8xMjwofjqSzipzRjzikBA30rk2AzG2yZc9wdK
         QohPbvrNZ6YvZFKpi5kzJqulu0/hvLy7KuGBExCEiOOXSQOTd0q2tIeI1eebqnxcNjFp
         XRWWxJA1W5tDz2wMENRgdhwwYwT3+KZ9uZFnn8CcUAZ6jC/K2vF/2b6LM6EFdQHy8KvA
         A8qbe5pSxx1/QJWN1cVhgkUraMh2jFtT7+I6EKC75IH0z2vnvhamj/Er7egf8R8XPJzC
         U7BQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsuktCQ4X1S9WwLVw8dBnn1nUcZYownA/HSKQZCSq18lYtjbxPvvXnH172oaiT0nE2tY8NfF+VwlwxWrlEpO8DAw==@lists.openembedded.org
X-Gm-Message-State: AFuF++ku4S2DOPcp6D2vBwzPWuC0laC8jAzdHW+FKdwrFe1yXeV7a9Za
	XOwzqFj4F4WDNLpJQZfiGinUGW6tzbPuh6r2CGfa11zrg4xB2kEn2/6yf+0OBwC8unKJt1uQIxh
	JVdV5SnIqGfGleJbWJ4f9cZmzo0sFPdY=
X-Gm-Gg: AYBFou1xtAK2x3pL3jEGdX2q3xGqSYvl/YVGeWpaPSUYVmAjS248h3PYyR3HJmUkaa6
	ne8jv4cs2OHlA0LRLVX3Z0+2tRtn9we8lIxtN2+9+X3DHtc+Sn7TlTpYKCqwkCtce+wdcxWqIx8
	RzOBv/PLxjrepVofYPqyu+ltsjFvXKwxkUoxMXr3lujcR3zlJwRCwQf7Rzo0FgA8kGRQqa6M/nt
	oXOJPGC6Cpi5Q+Jqmqqw/lLHFyv5OAFR9xfKwUdlq/0ep1eo06XMjctCBBUHnfFIxE+bXnljXoj
	nk+e+ad5s9v2oT2V1Vz+RAxWtoh+bQ4pA9mdI0+O19HJWGQ+BmUDkZizq78avELELCPkuLP48Yy
	llBTX/etLeyM+YW4gVj1UCiMka2rVE7gx8h13QdWo7rWbmn8rN5tMKPJwH4AAl82tdubydZn27U
	C8bU+iTsIOqWYKGz+qY6S+6bIgDkktcyl1IICT/3fvDEPzrzA6+ru4YdUZlyxZRHUj7Y5ZDwt/r
	Fa6+EiS2K40EpVkyce2GLw40pF7Yg8HDCHgDoeBw3fXOgDpYQgHqcS63JCKbvaZB2Ss7b02TFNW
	/059jGY=
X-Received: by 2002:a05:690e:1a95:b0:672:a969:2c66 with SMTP id
 956f58d0204a3-672d58d9cfbmr1440098d50.69.1790186633288; Wed, 23 Sep 2026
 11:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260922092411.262885-1-f_l_k@t-online.de> <20260922092411.262885-5-f_l_k@t-online.de>
 <DLLWONAJMUWW.JNH415ZXTGVI@bootlin.com>
In-Reply-To: <DLLWONAJMUWW.JNH415ZXTGVI@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Sep 2026 11:03:25 -0700
X-Gm-Features: AclHuK8N2wGMJ8MhG6GQWmruJbSU8-nUncRq5rrvGd5jAzDNd9-HR9VLB3ddzx4
Message-ID: <CAMKF1spb=gpz16Rr8=FSUmrEkeZBsVUAYV3pMvztwj8s9hv21Q@mail.gmail.com>
Subject: Re: [oe-core][PATCH 5/5] go-mod-update-modules: include the generated
 files from the class
To: antonin.godard@bootlin.com
Cc: f_l_k@t-online.de, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005bdf44065c2a4e6c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 18:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246534

--0000000000005bdf44065c2a4e6c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

also in meta-openembedded

meta-networking/recipes-connectivity/tailscale/tailscale_1.102.3.bb
meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
meta-oe/recipes-extended/simpleiot/simpleiot_0.18.5.bb
meta-oe/recipes-support/crucible/crucible_2025.05.28.bb
meta-oe/recipes-support/rclone/rclone_1.75.1.bb
meta-oe/recipes-test/syzkaller/syzkaller_git.bb

On Tue, Sep 22, 2026 at 7:14=E2=80=AFAM Antonin Godard via lists.openembedd=
ed.org
<antonin.godard=3Dbootlin.com@lists.openembedded.org> wrote:

> Hi,
>
> On Tue Sep 22, 2026 at 11:23 AM CEST, Markus Volk via
> lists.openembedded.org wrote:
> > A new recipe could not be parsed before its first update_modules run
> > because it had to require the two generated files itself. Include them
> > from the class instead, relative to the recipe, so a missing file is
> > tolerated until the task has written it.
>
> This has the following side-effect for recipes already including the
> file(s):
>
> stdio: WARNING:
> /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-networ=
king/recipes-connectivity/tailscale/
> tailscale_1.102.3.bb: Duplicate inclusion for
> /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-networ=
king/recipes-connectivity/tailscale/tailscale-go-mods.inc
> in
> /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-networ=
king/recipes-connectivity/tailscale/
> tailscale_1.102.3.bb
> stdio: WARNING:
> /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-networ=
king/recipes-connectivity/tailscale/
> tailscale_1.102.3.bb: Duplicate inclusion for
> /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-networ=
king/recipes-connectivity/tailscale/tailscale-licenses.inc
> in
> /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-networ=
king/recipes-connectivity/tailscale/
> tailscale_1.102.3.bb
> stdio: WARNING:
> /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-oe/rec=
ipes-extended/simpleiot/
> simpleiot_0.18.5.bb: Duplicate inclusion for
> /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-oe/rec=
ipes-extended/simpleiot/simpleiot-go-mods.inc
> in
> /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-oe/rec=
ipes-extended/simpleiot/
> simpleiot_0.18.5.bb
> stdio: WARNING:
> /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-oe/rec=
ipes-support/crucible/
> crucible_2025.05.28.bb: Duplicate inclusion for
> /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-oe/rec=
ipes-support/crucible/crucible-go-mods.inc
> in
> /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-oe/rec=
ipes-support/crucible/
> crucible_2025.05.28.bb
> stdio: WARNING:
> /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-oe/rec=
ipes-support/crucible/
> crucible_2025.05.28.bb: Duplicate inclusion for
> /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-oe/rec=
ipes-support/crucible/crucible-licenses.inc
> in
> /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-oe/rec=
ipes-support/crucible/
> crucible_2025.05.28.bb
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/builds/4515
>
> If this is merged we'll need to adjust these recipes. Also if this is
> merged
> please send an update to
>
> https://git.yoctoproject.org/yocto-docs/tree/documentation/migration-guid=
es/migration-6.1.rst
> on the documentation mailing list to let people know why this is happenin=
g
> in
> their build.
>
> Thanks,
> Antonin
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#246416):
> https://lists.openembedded.org/g/openembedded-core/message/246416
> Mute This Topic: https://lists.openembedded.org/mt/121371714/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000005bdf44065c2a4e6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">also in meta-openembedded<div><br></div><div>meta-networki=
ng/recipes-connectivity/tailscale/<a href=3D"http://tailscale_1.102.3.bb">t=
ailscale_1.102.3.bb</a><br>meta-oe/recipes-dbs/influxdb/<a href=3D"http://i=
nfluxdb_1.8.10.bb">influxdb_1.8.10.bb</a><br>meta-oe/recipes-extended/simpl=
eiot/<a href=3D"http://simpleiot_0.18.5.bb">simpleiot_0.18.5.bb</a><br>meta=
-oe/recipes-support/crucible/<a href=3D"http://crucible_2025.05.28.bb">cruc=
ible_2025.05.28.bb</a><br>meta-oe/recipes-support/rclone/<a href=3D"http://=
rclone_1.75.1.bb">rclone_1.75.1.bb</a><br>meta-oe/recipes-test/syzkaller/<a=
 href=3D"http://syzkaller_git.bb">syzkaller_git.bb</a></div></div><br><div =
class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, Sep 22, 2026 at 7:14=E2=80=AFAM Antonin Godard via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;antonin.g=
odard=3D<a href=3D"mailto:bootlin.com@lists.openembedded.org">bootlin.com@l=
ists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Hi,<br>
<br>
On Tue Sep 22, 2026 at 11:23 AM CEST, Markus Volk via <a href=3D"http://lis=
ts.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedde=
d.org</a> wrote:<br>
&gt; A new recipe could not be parsed before its first update_modules run<b=
r>
&gt; because it had to require the two generated files itself. Include them=
<br>
&gt; from the class instead, relative to the recipe, so a missing file is<b=
r>
&gt; tolerated until the task has written it.<br>
<br>
This has the following side-effect for recipes already including the file(s=
):<br>
<br>
stdio: WARNING: /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedd=
ed/meta-networking/recipes-connectivity/tailscale/<a href=3D"http://tailsca=
le_1.102.3.bb" rel=3D"noreferrer" target=3D"_blank">tailscale_1.102.3.bb</a=
>: Duplicate inclusion for /srv/pokybuild/yocto-worker/meta-virt/build/meta=
-openembedded/meta-networking/recipes-connectivity/tailscale/tailscale-go-m=
ods.inc in /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/me=
ta-networking/recipes-connectivity/tailscale/<a href=3D"http://tailscale_1.=
102.3.bb" rel=3D"noreferrer" target=3D"_blank">tailscale_1.102.3.bb</a><br>
stdio: WARNING: /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedd=
ed/meta-networking/recipes-connectivity/tailscale/<a href=3D"http://tailsca=
le_1.102.3.bb" rel=3D"noreferrer" target=3D"_blank">tailscale_1.102.3.bb</a=
>: Duplicate inclusion for /srv/pokybuild/yocto-worker/meta-virt/build/meta=
-openembedded/meta-networking/recipes-connectivity/tailscale/tailscale-lice=
nses.inc in /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/m=
eta-networking/recipes-connectivity/tailscale/<a href=3D"http://tailscale_1=
.102.3.bb" rel=3D"noreferrer" target=3D"_blank">tailscale_1.102.3.bb</a><br=
>
stdio: WARNING: /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedd=
ed/meta-oe/recipes-extended/simpleiot/<a href=3D"http://simpleiot_0.18.5.bb=
" rel=3D"noreferrer" target=3D"_blank">simpleiot_0.18.5.bb</a>: Duplicate i=
nclusion for /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/=
meta-oe/recipes-extended/simpleiot/simpleiot-go-mods.inc in /srv/pokybuild/=
yocto-worker/meta-virt/build/meta-openembedded/meta-oe/recipes-extended/sim=
pleiot/<a href=3D"http://simpleiot_0.18.5.bb" rel=3D"noreferrer" target=3D"=
_blank">simpleiot_0.18.5.bb</a><br>
stdio: WARNING: /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedd=
ed/meta-oe/recipes-support/crucible/<a href=3D"http://crucible_2025.05.28.b=
b" rel=3D"noreferrer" target=3D"_blank">crucible_2025.05.28.bb</a>: Duplica=
te inclusion for /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembed=
ded/meta-oe/recipes-support/crucible/crucible-go-mods.inc in /srv/pokybuild=
/yocto-worker/meta-virt/build/meta-openembedded/meta-oe/recipes-support/cru=
cible/<a href=3D"http://crucible_2025.05.28.bb" rel=3D"noreferrer" target=
=3D"_blank">crucible_2025.05.28.bb</a><br>
stdio: WARNING: /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedd=
ed/meta-oe/recipes-support/crucible/<a href=3D"http://crucible_2025.05.28.b=
b" rel=3D"noreferrer" target=3D"_blank">crucible_2025.05.28.bb</a>: Duplica=
te inclusion for /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembed=
ded/meta-oe/recipes-support/crucible/crucible-licenses.inc in /srv/pokybuil=
d/yocto-worker/meta-virt/build/meta-openembedded/meta-oe/recipes-support/cr=
ucible/<a href=3D"http://crucible_2025.05.28.bb" rel=3D"noreferrer" target=
=3D"_blank">crucible_2025.05.28.bb</a><br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/buil=
ds/4515" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/89/builds/4515</a><br>
<br>
If this is merged we&#39;ll need to adjust these recipes. Also if this is m=
erged<br>
please send an update to<br>
<a href=3D"https://git.yoctoproject.org/yocto-docs/tree/documentation/migra=
tion-guides/migration-6.1.rst" rel=3D"noreferrer" target=3D"_blank">https:/=
/git.yoctoproject.org/yocto-docs/tree/documentation/migration-guides/migrat=
ion-6.1.rst</a><br>
on the documentation mailing list to let people know why this is happening =
in<br>
their build.<br>
<br>
Thanks,<br>
Antonin<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#246416): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/246416" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/246416</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121371714/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121371714/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000005bdf44065c2a4e6c--

