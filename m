Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A0EC07480
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 07:58:46 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web11.49769.1697788716476775986
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 00:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JvIjpbUV;
 spf=pass (domain: gmail.com, ip: 209.85.217.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4587f9051e3so222260137.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 00:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697788715; x=1698393515; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4caj9C3C3zTXElAQuWedxBkpie6l77zuGfAX5MSxaxo=;
        b=JvIjpbUVsPWA5scaSUDyh/8vjA6jzPTl/7bQR94wvN+kE70gR1Ku/hfp3F5xrRWCmG
         0J64qOU2rQmofwvftItFuSPYw20TsQ1VwHfpeq5qNKdD9Ta7znAHoC8UnYQosvcENldU
         3zDmgeIiDeosIybDbmINOns3NAa0lb9RtlryzH7bgLcOg4aQixljZilHFnvOY05CvhL/
         yeDEj7rb3SMBUwveyeOu56D5HGDEtQZ6ikhg3IvZoeLguSmK1JrxB5JkEarDKhIJMDKA
         lPlCWSvoKuM+/p/hfqtmTb/d0wlefsFu57hNgAjyrZqrz0ot8JknUH6vmioCTilyjlSU
         zVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697788715; x=1698393515;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4caj9C3C3zTXElAQuWedxBkpie6l77zuGfAX5MSxaxo=;
        b=jcew/pDq3rrs/JN+22ray6553Chd4lzJ0qzp+aInvkdzlnbBAm87Oe1woJM2YAZ7sw
         qS6qAYQ4NhtVGDxRg5QUt9kdGMLB8CzSwATZQWzbUDObXOnUCicFi4slz/wDDJhImILa
         CQHnA7hx1w8l/9/hvwydfcLbtxx3KRMzquOdXcximjOmNZbj4KiHd0zPx/1NHonoob0b
         dL5H6B0HqJ8Dj3vNXZIhVKuBvmVWt/J26G4NtsTHr+dnQvqIQ8/vDmh+xz2H3Kf7X5h0
         unBlNsqHQ+OFMWl1GJoyztRii4wmCwEj04K20Iqtq1xWpFTeYF6N+BikR50XCmHfIti1
         lmxg==
X-Gm-Message-State: AOJu0Yzu90y5guxuSI7yO7Xzg0KdI0ctxLS+2CAGzbFdrP94fARULIaY
	fg65KmQnzBi9J1bKvT0VMTdax1DcV5Oz/CbcuxEVcCskUa4YQQ==
X-Google-Smtp-Source: AGHT+IE8SvmRrhSi0SBxw6Angq8ogf6s8clakuiepXL3XQh6miiQggv3hJqeF2hpQlH+GTh/nfT2Ti8LTwsqIqZjzl8=
X-Received: by 2002:a67:b742:0:b0:452:6178:642c with SMTP id
 l2-20020a67b742000000b004526178642cmr1250945vsh.1.1697788715488; Fri, 20 Oct
 2023 00:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <20231016-b4-systemd-tpm2-crypt-plugin-v1-1-21fef10601ff@linaro.org>
 <CANPvuRk9GopD1yCbmSPk_pS1M=bC8drdAefYSpJ95cEQBq6Wdw@mail.gmail.com>
 <CWAHA5EQL45Z.3HPZNQBIRGUUL@ablu-work> <CANPvuRnyvniBMEhWU2Jzrd4scx=1K4PkMy8w2VG3y8MSB4Bv8w@mail.gmail.com>
 <CWBCTF54QUSS.3DJVMJ9KMORGK@ablu-work> <CANPvuR=KEWP1Mqw1q+co7hRTP61QNphj48N7mVNPjXFBHqZZqw@mail.gmail.com>
 <CWBI25L28WY3.2OKCTDSP9F4ZK@ablu-work>
In-Reply-To: <CWBI25L28WY3.2OKCTDSP9F4ZK@ablu-work>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 20 Oct 2023 08:58:24 +0100
Message-ID: <CANPvuR=qoG_cFq1JtFe4dHVq8w=oih1iGpB3xy8Z=8oRW=iMGw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: fix packaging tpm2 plugin for cryptsetup
To: Erik Schilling <erik.schilling@linaro.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Kristian Klausen <kristian@klausen.dk>, Mikko Rapeli <mikko.rapeli@linaro.org>, 
	Javier Tia <javier.tia@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000004a61160608213d05"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 07:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189503

--0000000000004a61160608213d05
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

This patch is still on master-next but It is no longer necessary because
[2] was merged on master and contains the same fixes.

[2]
https://git.yoctoproject.org/poky/commit/?id=3D64f76114da1f2d79e24a6a79572f=
2682b6379452

Jose

Erik Schilling <erik.schilling@linaro.org> escreveu no dia quarta,
18/10/2023 =C3=A0(s) 11:40:

> On Wed Oct 18, 2023 at 11:26 AM CEST, Jose Quaresma wrote:
> > Erik Schilling <erik.schilling@linaro.org> escreveu no dia quarta,
> > 18/10/2023 =C3=A0(s) 07:33:
> >
> > > On Tue Oct 17, 2023 at 10:51 AM CEST, Jose Quaresma wrote:
> > > > Hi Erik,
> > > >
> > > > Erik Schilling <erik.schilling@linaro.org> escreveu no dia ter=C3=
=A7a,
> > > > 17/10/2023 =C3=A0(s) 06:51:
> > > >
> > > > > On Mon Oct 16, 2023 at 6:31 PM CEST, Jose Quaresma wrote:
> > > > > > Erik Schilling <erik.schilling@linaro.org> escreveu no dia
> segunda,
> > > > > > 16/10/2023 =C3=A0(s) 13:02:
> > > > > >
> > > > > > > When building with `cryptsetup` and `tpm2` in the
> > > > > > > PACKAGECONFIG, this plugin will be emitted.
> > > > > > >
> > > > > > > Cc: Kristian Klausen <kristian@klausen.dk>
> > > > > > > Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > > > > > Cc: Javier Tia <javier.tia@linaro.org>
> > > > > > > Fixes: 7b7dfbfaed ("systemd: Add tpm2 PACKAGECONFIG")
> > > > > > > Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> > > > > > > ---
> > > > > > >  meta/recipes-core/systemd/systemd_254.4.bb | 1 +
> > > > > > >  1 file changed, 1 insertion(+)
> > > > > > >
> > > > > > > diff --git a/meta/recipes-core/systemd/systemd_254.4.bb
> > > > > > > b/meta/recipes-core/systemd/systemd_254.4.bb
> > > > > > > index 77724eb822..6ecfbaf293 100644
> > > > > > > --- a/meta/recipes-core/systemd/systemd_254.4.bb
> > > > > > > +++ b/meta/recipes-core/systemd/systemd_254.4.bb
> > > > > > > @@ -645,6 +645,7 @@ FILES:${PN} =3D " ${base_bindir}/* \
> > > > > > >                  ${sysconfdir}/X11/xinit/xinitrc.d/* \
> > > > > > >                  ${rootlibexecdir}/systemd/* \
> > > > > > >                  ${rootlibdir}/systemd/libsystemd-core* \
> > > > > > > +
> > > > > > > ${rootlibdir}/cryptsetup/libcryptsetup-token-systemd-tpm2* \
> > > > > > >
> > > > > >
> > > > > > The systemd-cryptenroll was packed in the systemd-extra-utils s=
o
> > > packing
> > > > > > the plugin
> > > > > > on the main systemd package is a bit weird.
> > > > > > I wonder if a new package like systemd-crypt is better
> appropriate
> > > for
> > > > > this
> > > > > > where we
> > > > > > going to put the systemd-cryptenroll and all the plugins
> available in
> > > > > > ${rootlibdir}/cryptsetup
> > > > >
> > > > > Ah, did not realize that... I agree that breaking up systemd into
> > > > > smaller packages would probably be a good thing. Currently
> building an
> > > > > image with systemd in the initramfs and main image gives little
> choice
> > > > > over which components go where... I will try a systemd-crypt
> variant.
> > > > > Will also take a look at how other distros solve this.
> > > > >
> > > >
> > > > I've been using this systemd-crypt package on my distro for some
> time now
> > > > but I've forgotten to send it.
> > > > In this package additionally to the TPM plugin I also have another
> for
> > > the
> > > > PKVS#11.
> > > > I have all of these in a bbappend and I can easily extract.
> > >
> > >
> > > Ah that sounds great!
> > >
> > >
> > > > So you don't have to worry, I still do it today.
> > >
> > > Sorry, I do not understand what you mean here. Did you mean that you
> > > plan to send a patch?
> > >
> >
> > I apologize for not being clear. I sent the patch serie yesterday
> > [1]
> https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D17834
>
> Thanks a lot! Will try it out in the next days!
>
> - Erik
>
> >
> >
> > >
> > > - Erik
> > >
> > > > > >
> > > > > >                  ${libdir}/pam.d \
> > > > > > >                  ${nonarch_libdir}/pam.d \
> > > > > > >                  ${systemd_unitdir}/* \
> > > > > > >
> > > > > > > ---
> > > > > > > base-commit: 97f0a73c0a9db5506310328cd29f165eab3c509d
> > > > > > > change-id: 20231016-b4-systemd-tpm2-crypt-plugin-5064c458e726
> > > > > > >
> > > > > > > Best regards,
> > > > > > > --
> > > > > > > Erik Schilling <erik.schilling@linaro.org>
> > > > > > >
> > > > > > >
> > > > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > > > Links: You receive all messages sent to this group.
> > > > > > > View/Reply Online (#189288):
> > > > > > >
> https://lists.openembedded.org/g/openembedded-core/message/189288
> > > > > > > Mute This Topic:
> > > https://lists.openembedded.org/mt/101993740/5052612
> > > > > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > > > > Unsubscribe:
> > > https://lists.openembedded.org/g/openembedded-core/unsub
> > > > > [
> > > > > > > quaresma.jose@gmail.com]
> > > > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > > >
> > > > > > >
> > > > >
> > > > >
> > >
> > >
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000004a61160608213d05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Alexandre,<br><br>This patch is still on master-ne=
xt but=C2=A0It is no longer necessary because [2] was merged on master and =
contains the same fixes.<br></div><div><br></div><div>[2]=C2=A0<a href=3D"h=
ttps://git.yoctoproject.org/poky/commit/?id=3D64f76114da1f2d79e24a6a79572f2=
682b6379452" target=3D"_blank">https://git.yoctoproject.org/poky/commit/?id=
=3D64f76114da1f2d79e24a6a79572f2682b6379452</a><br></div><div><br></div><di=
v>Jose</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">Erik Schilling &lt;<a href=3D"mailto:erik.schilling@linaro.org" =
target=3D"_blank">erik.schilling@linaro.org</a>&gt; escreveu no dia quarta,=
 18/10/2023 =C3=A0(s) 11:40:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Wed Oct 18, 2023 at 11:26 AM CEST, Jose Quaresma wrote:<br>
&gt; Erik Schilling &lt;<a href=3D"mailto:erik.schilling@linaro.org" target=
=3D"_blank">erik.schilling@linaro.org</a>&gt; escreveu no dia quarta,<br>
&gt; 18/10/2023 =C3=A0(s) 07:33:<br>
&gt;<br>
&gt; &gt; On Tue Oct 17, 2023 at 10:51 AM CEST, Jose Quaresma wrote:<br>
&gt; &gt; &gt; Hi Erik,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Erik Schilling &lt;<a href=3D"mailto:erik.schilling@linaro.o=
rg" target=3D"_blank">erik.schilling@linaro.org</a>&gt; escreveu no dia ter=
=C3=A7a,<br>
&gt; &gt; &gt; 17/10/2023 =C3=A0(s) 06:51:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Mon Oct 16, 2023 at 6:31 PM CEST, Jose Quaresma wrot=
e:<br>
&gt; &gt; &gt; &gt; &gt; Erik Schilling &lt;<a href=3D"mailto:erik.schillin=
g@linaro.org" target=3D"_blank">erik.schilling@linaro.org</a>&gt; escreveu =
no dia segunda,<br>
&gt; &gt; &gt; &gt; &gt; 16/10/2023 =C3=A0(s) 13:02:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; When building with `cryptsetup` and `tpm2` in=
 the<br>
&gt; &gt; &gt; &gt; &gt; &gt; PACKAGECONFIG, this plugin will be emitted.<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Cc: Kristian Klausen &lt;<a href=3D"mailto:kr=
istian@klausen.dk" target=3D"_blank">kristian@klausen.dk</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Cc: Mikko Rapeli &lt;<a href=3D"mailto:mikko.=
rapeli@linaro.org" target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Cc: Javier Tia &lt;<a href=3D"mailto:javier.t=
ia@linaro.org" target=3D"_blank">javier.tia@linaro.org</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Fixes: 7b7dfbfaed (&quot;systemd: Add tpm2 PA=
CKAGECONFIG&quot;)<br>
&gt; &gt; &gt; &gt; &gt; &gt; Signed-off-by: Erik Schilling &lt;<a href=3D"=
mailto:erik.schilling@linaro.org" target=3D"_blank">erik.schilling@linaro.o=
rg</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 meta/recipes-core/systemd/<a href=3D"ht=
tp://systemd_254.4.bb" rel=3D"noreferrer" target=3D"_blank">systemd_254.4.b=
b</a> | 1 +<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; diff --git a/meta/recipes-core/systemd/<a hre=
f=3D"http://systemd_254.4.bb" rel=3D"noreferrer" target=3D"_blank">systemd_=
254.4.bb</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; b/meta/recipes-core/systemd/<a href=3D"http:/=
/systemd_254.4.bb" rel=3D"noreferrer" target=3D"_blank">systemd_254.4.bb</a=
><br>
&gt; &gt; &gt; &gt; &gt; &gt; index 77724eb822..6ecfbaf293 100644<br>
&gt; &gt; &gt; &gt; &gt; &gt; --- a/meta/recipes-core/systemd/<a href=3D"ht=
tp://systemd_254.4.bb" rel=3D"noreferrer" target=3D"_blank">systemd_254.4.b=
b</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; +++ b/meta/recipes-core/systemd/<a href=3D"ht=
tp://systemd_254.4.bb" rel=3D"noreferrer" target=3D"_blank">systemd_254.4.b=
b</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; @@ -645,6 +645,7 @@ FILES:${PN} =3D &quot; ${=
base_bindir}/* \<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ${sysconfdir}/X11/xinit/xinitrc.d/* \<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ${rootlibexecdir}/systemd/* \<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ${rootlibdir}/systemd/libsystemd-core* \<br>
&gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; ${rootlibdir}/cryptsetup/libcryptsetup-token-=
systemd-tpm2* \<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; The systemd-cryptenroll was packed in the systemd-=
extra-utils so<br>
&gt; &gt; packing<br>
&gt; &gt; &gt; &gt; &gt; the plugin<br>
&gt; &gt; &gt; &gt; &gt; on the main systemd package is a bit weird.<br>
&gt; &gt; &gt; &gt; &gt; I wonder if a new package like systemd-crypt is be=
tter appropriate<br>
&gt; &gt; for<br>
&gt; &gt; &gt; &gt; this<br>
&gt; &gt; &gt; &gt; &gt; where we<br>
&gt; &gt; &gt; &gt; &gt; going to put the systemd-cryptenroll and all the p=
lugins available in<br>
&gt; &gt; &gt; &gt; &gt; ${rootlibdir}/cryptsetup<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Ah, did not realize that... I agree that breaking up sy=
stemd into<br>
&gt; &gt; &gt; &gt; smaller packages would probably be a good thing. Curren=
tly building an<br>
&gt; &gt; &gt; &gt; image with systemd in the initramfs and main image give=
s little choice<br>
&gt; &gt; &gt; &gt; over which components go where... I will try a systemd-=
crypt variant.<br>
&gt; &gt; &gt; &gt; Will also take a look at how other distros solve this.<=
br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I&#39;ve been using this systemd-crypt package on my distro =
for some time now<br>
&gt; &gt; &gt; but I&#39;ve forgotten to send it.<br>
&gt; &gt; &gt; In this package additionally to the TPM plugin I also have a=
nother for<br>
&gt; &gt; the<br>
&gt; &gt; &gt; PKVS#11.<br>
&gt; &gt; &gt; I have all of these in a bbappend and I can easily extract.<=
br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Ah that sounds great!<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; So you don&#39;t have to worry, I still do it today.<br>
&gt; &gt;<br>
&gt; &gt; Sorry, I do not understand what you mean here. Did you mean that =
you<br>
&gt; &gt; plan to send a patch?<br>
&gt; &gt;<br>
&gt;<br>
&gt; I apologize for not being clear. I sent the patch serie yesterday<br>
&gt; [1] <a href=3D"https://patchwork.yoctoproject.org/project/oe-core/list=
/?series=3D17834" rel=3D"noreferrer" target=3D"_blank">https://patchwork.yo=
ctoproject.org/project/oe-core/list/?series=3D17834</a><br>
<br>
Thanks a lot! Will try it out in the next days!<br>
<br>
- Erik<br>
<br>
&gt;<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; - Erik<br>
&gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ${libdir}/pam.d \<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ${nonarch_libdir}/pam.d \<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ${systemd_unitdir}/* \<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt; &gt; base-commit: 97f0a73c0a9db5506310328cd29f165e=
ab3c509d<br>
&gt; &gt; &gt; &gt; &gt; &gt; change-id: 20231016-b4-systemd-tpm2-crypt-plu=
gin-5064c458e726<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Best regards,<br>
&gt; &gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; &gt; Erik Schilling &lt;<a href=3D"mailto:erik.sch=
illing@linaro.org" target=3D"_blank">erik.schilling@linaro.org</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
<br>
&gt; &gt; &gt; &gt; &gt; &gt; Links: You receive all messages sent to this =
group.<br>
&gt; &gt; &gt; &gt; &gt; &gt; View/Reply Online (#189288):<br>
&gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"https://lists.openembedded.org/g/o=
penembedded-core/message/189288" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-core/message/189288</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; Mute This Topic:<br>
&gt; &gt; <a href=3D"https://lists.openembedded.org/mt/101993740/5052612" r=
el=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/10199=
3740/5052612</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; Group Owner: <a href=3D"mailto:openembedded-c=
ore%2Bowner@lists.openembedded.org" target=3D"_blank">openembedded-core+own=
er@lists.openembedded.org</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; Unsubscribe:<br>
&gt; &gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/uns=
ub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/o=
penembedded-core/unsub</a><br>
&gt; &gt; &gt; &gt; [<br>
&gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"mailto:quaresma.jose@gmail.com" ta=
rget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
&gt; &gt; &gt; &gt; &gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div></div>

--0000000000004a61160608213d05--

