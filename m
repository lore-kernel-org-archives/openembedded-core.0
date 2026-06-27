Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8AD3C43458
	for <webhook@archiver.kernel.org>; Sat, 27 Jun 2026 08:21:17 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51577.1782548464273081623
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jun 2026 01:21:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uOSkEUD+;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-471eee9b7d5so8729f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 01:21:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782548462; cv=none;
        d=google.com; s=arc-20260327;
        b=XP7jCDiSIcSo1V5ooYLGXv88mRqZkU4Erjmld0GHvPru6+6E+NyFXa20U+qeU3lYMt
         Y2iccZm9zoIHLFqe58rsmFxoGQejCrBMBlRwVMFFwby/rwNph388vPPtF+cCgx72QFLR
         Te//qX2CPsrTSA2R3lbfCJyk725ZO6uQs8jlzu3oC0Hf7O6iWx17ymq7vC3NrjKYfT1a
         OhefxMeW4YmPl2A6+nGILhexI9+ZrIemOhqLpq/QaMEoIEVVUsg7RZiXwige5k0fN/1U
         cVvEArcEV0Cf4KPvpzAtCR0PInzshemiTuuGEhwXL+kb0NljIfqLgkcBUreqp0fqpRss
         +Taw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZTJH8FDwcvp9K59vkDJfkX3r+EehibCG6zT0PrAjWMU=;
        fh=t2oGV6MhQv6kmytL+alNmeYidffmNm5/Xl+37vPuraE=;
        b=ffLZnTmnlbO6Byq/vogh4jdmlWqqKrm6iGo5lL+qsSXVB5qv2Rr4ZRrQSrQUWiqXLi
         9zR46IpTtQCHwly9rwwTr29fYPE4bMFiN3gVAx395h/MsS1jBy0qZKphw8JQ3gQTEIwq
         L6iMm/qGF/k9JY2pJO5DBy0EI4HsY15iuNf3GqozNMqCEyeqiLOnoO0JJKP69dG4lkRF
         c9YpWQb/VmJhrB82Gwu0/EmVc6RbE2hDpuDr/oLtvq8J0yx39Do2r5RPe6RrMGnoaR6C
         Pymq/81/fwjw5RL2ph/gWnsmqbOIaTsxDjf5OJi2rfrJ8FZEoeKKN+D554OW7fR9G99O
         Pi6w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782548462; x=1783153262; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTJH8FDwcvp9K59vkDJfkX3r+EehibCG6zT0PrAjWMU=;
        b=uOSkEUD+6ND616NvFKm0sb+5Or2ZwLhB712oZpsEgF4uvt1gmQrirnH9ZT+OMnXtct
         As8Lzr1Mx4ByS7qfEbQyxer8uaX9p4al4cWNCyiNFe5nMudYd9JpritIsHYWdrzl2Uv5
         sTSIe1t6PQ1wVS5cKgR16GIUmxVSpZat6RCss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782548462; x=1783153262;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTJH8FDwcvp9K59vkDJfkX3r+EehibCG6zT0PrAjWMU=;
        b=FLbqdjWvZBUhWEGRnX60BMu+LdpMGKtXIW0vHOIVWaAEk+5wjD/JpEvjyjFlu8jKzJ
         Vskhf5xtIuz8e48j/cnnFUqRj/qelvFPBCOgmG9QfEB6YJuZbqEhE4Ew8KNZxVwP2b3q
         L3a5w/yoW4KMQ96HdcQ53o/noXkMw5bScFZ7vQ3GQSN7Ug3AiHrbM4YMoTERh23KZQ0v
         ZoVRpHMF1imY9oIqFLUukQgsA+Vj+cri8bwY/Rh8yLHXOI8oHm3lxDY89/6PS9QRHEDa
         gI/fMro4PlCNMWYdkbyVjq+e+pZmiptW1dvlAYBaJ+wyCnqR3HH45FZDF1S6C0P1U9TH
         zPmQ==
X-Forwarded-Encrypted: i=1; AHgh+Roo/cbhLwqgkNgy/MBqNPobFLkOdC3Nt6Ne3yiGeBAJXgiDI5sw97o3pEIWAv9IxEfhSePGswJenQPr7ReedOxYPg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwHyNmcB3+upRKbO8A+gVPsMYUXbVut4T956rg6lFUQ4ux4VPW1
	AoA1pU1P8auPdxZ0f4stOgT9lY2hOnsJrPKNhz0qAhabADjSV/7v4BSxzWJ+1dt7KPuxTIVxjZt
	Ru8r0+M5Sl64Sbi7+p1oy7DJT2kB+DZ1/DrnnM663Rg==
X-Gm-Gg: AfdE7cmjS/EQWKXf0VBJpnjLEnyN3ltMY3qQtoL655RQ79ji7RqsAuQY6EOiTQwePj7
	7+B6L98qNHBJDmHwqWq1mNpDvuteJQCEKq3gBHmph6NaL5mH4abxganrtHEGE2xqXtGrFD4M3tE
	YScncKU4biyuqpsEPSqQyh36CqQkHgMLux6oSNI3o/AssT7kq7ZO7ilZ+biuIGwbHXQc90xywvr
	byhTRdieTiXeAvxTe37x6FbQQyTsyc7I72mnx4Qf+kP2ucg0V0k53UolfP8iSmFvcU18v7xpFhT
	Nt/Qhcni8aIQSeRbTBHe6SJQNfEIKw==
X-Received: by 2002:a05:6000:1867:b0:46d:8695:f49d with SMTP id
 ffacd0b85a97d-46dc2a1614cmr16623898f8f.34.1782548462304; Sat, 27 Jun 2026
 01:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260621202519.177293-1-aleksandar.nikolic22@pm.me>
 <DJJCKP83KPUW.2ECUA0V3VKK9P@smile.fr> <aj8Ws4BY4p5RTISk@localhost.localdomain>
In-Reply-To: <aj8Ws4BY4p5RTISk@localhost.localdomain>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Sat, 27 Jun 2026 10:20:50 +0200
X-Gm-Features: AVVi8Cc7z38_7YR61FAbdm9MGMGzIn1Ui4ailBCl92OG4D8qYO_lop6vEJAjQOE
Message-ID: <CAMSfU+7MH7MrahkitU8Z-c0+dyZS=37bqo+V1iAczOOnUANRdQ@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH v2] wic: Fix updating fstab for nvme devices
To: Trevor Woerner <twoerner@gmail.com>
Cc: aleksandar.nikolic010@gmail.com, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Content-Type: multipart/alternative; boundary="000000000000e41617065537e7d3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 08:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239694

--000000000000e41617065537e7d3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 27 juin 2026, 02:18, Trevor Woerner <twoerner@gmail.com> a =C3=A9cr=
it :

> On Sat 2026-06-27 @ 12:51:14 AM, Yoann Congal via lists.openembedded.org
> wrote:
> > On Sun Jun 21, 2026 at 10:25 PM CEST, Aleksandar Nikolic via
> lists.openembedded.org wrote:
> > > From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
> > >
> > > In case wks file references nvme, update_fstab() function will not ad=
d
> > > prefix 'p' before the partition number, as the if condition only take=
s
> > > mmcblk into consideration.
> > >
> > > In case of nvme0n1 this leads that following entries are added to
> fstab:
> > >
> > >     /dev/nvme0n11
> > >     /dev/nvme0n13
> > >
> > > instead of:
> > >
> > >     /dev/nvme0n1p1
> > >     /dev/nvme0n1p3
> > >
> > > The patch fixes this as it extends the if condition and adds prefix
> 'p' for
> > > both mmcblk and nvme.
> > >
> > > Upstream-Status: Backport [
> https://git.yoctoproject.org/wic/commit/?id=3Df20cda73b495b75ef399c331f59=
b0e2401a3e76a
> ]
> > > Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
> >
> > Hello,
> >
> > Sorry I missed it in earlier reviews but it look like this patch is als=
o
> > needed on wrynose: wrynose has wic 0.3.0 but this patch is 2 commits
> > above that.
> >
> > To accept this patch on scarthgap, I would need a equivalent patch for
> > wrynose. Can you send that and ping back here?
>
> In scarthgap wic is part of oe-core, in wrynose it is not.
>
> For wrynose it would require a completely different patch; but it would
> probably be best to just update the SRCREV instead.
>

Trevor, thanks for the added details.

Do you plan to release a wic 0.3.1 soon? Or do you recommend we switch from
version based SRC_URI to commit based SRCREV (I'd prefer to stay version
based)?

Looking at the master logs, I could take a 0.3.1 upgrade with the current
master state.

Alternatively, we could backport Aleksandar's fix on top of the 0.3.0
recipe (as usual)

Regards,


> > Thanks!
> >
> > > ---
> > >  scripts/lib/wic/plugins/imager/direct.py | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/scripts/lib/wic/plugins/imager/direct.py
> b/scripts/lib/wic/plugins/imager/direct.py
> > > index a1d152659b..b06e6a8f23 100644
> > > --- a/scripts/lib/wic/plugins/imager/direct.py
> > > +++ b/scripts/lib/wic/plugins/imager/direct.py
> > > @@ -133,8 +133,8 @@ class DirectPlugin(ImagerPlugin):
> > >              elif part.use_label:
> > >                  device_name =3D "LABEL=3D%s" % part.label
> > >              else:
> > > -                # mmc device partitions are named mmcblk0p1,
> mmcblk0p2..
> > > -                prefix =3D 'p' if  part.disk.startswith('mmcblk') el=
se
> ''
> > > +                # mmc and nvme device partitions start with prefix '=
p'
> > > +                prefix =3D 'p' if part.disk.startswith(('mmcblk',
> 'nvme')) else ''
> > >                  device_name =3D "/dev/%s%s%d" % (part.disk, prefix,
> part.realnum)
> > >
> > >              opts =3D part.fsopts if part.fsopts else "defaults"
> > > @@ -266,7 +266,7 @@ class DirectPlugin(ImagerPlugin):
> > >                  elif part.label and self.ptable_format !=3D 'msdos':
> > >                      return "PARTLABEL=3D%s" % part.label
> > >                  else:
> > > -                    suffix =3D 'p' if part.disk.startswith('mmcblk')
> else ''
> > > +                    suffix =3D 'p' if part.disk.startswith(('mmcblk'=
,
> 'nvme')) else ''
> > >                      return "/dev/%s%s%-d" % (part.disk, suffix,
> part.realnum)
> > >
> > >      def cleanup(self):
> >
> >
> > --
> > Yoann Congal
> > Smile ECS
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#239668):
> https://lists.openembedded.org/g/openembedded-core/message/239668
> > Mute This Topic: https://lists.openembedded.org/mt/119915320/900817
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> twoerner@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--000000000000e41617065537e7d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><br><div class=3D"gmail_quote gmail_quote_co=
ntainer"><div dir=3D"ltr" class=3D"gmail_attr">Le sam. 27 juin 2026, 02:18,=
 Trevor Woerner &lt;<a href=3D"mailto:twoerner@gmail.com">twoerner@gmail.co=
m</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On Sat 2026-06-27 @ 12:51:14 AM, Yoann Congal via <a href=3D"=
http://lists.openembedded.org" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; On Sun Jun 21, 2026 at 10:25 PM CEST, Aleksandar Nikolic via <a href=
=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer" target=3D"=
_blank">lists.openembedded.org</a> wrote:<br>
&gt; &gt; From: Aleksandar Nikolic &lt;<a href=3D"mailto:aleksandar.nikolic=
@zeiss.com" target=3D"_blank" rel=3D"noreferrer">aleksandar.nikolic@zeiss.c=
om</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; In case wks file references nvme, update_fstab() function will no=
t add<br>
&gt; &gt; prefix &#39;p&#39; before the partition number, as the if conditi=
on only takes<br>
&gt; &gt; mmcblk into consideration.<br>
&gt; &gt;<br>
&gt; &gt; In case of nvme0n1 this leads that following entries are added to=
 fstab:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0/dev/nvme0n11<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0/dev/nvme0n13<br>
&gt; &gt;<br>
&gt; &gt; instead of:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0/dev/nvme0n1p1<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0/dev/nvme0n1p3<br>
&gt; &gt;<br>
&gt; &gt; The patch fixes this as it extends the if condition and adds pref=
ix &#39;p&#39; for<br>
&gt; &gt; both mmcblk and nvme.<br>
&gt; &gt;<br>
&gt; &gt; Upstream-Status: Backport [<a href=3D"https://git.yoctoproject.or=
g/wic/commit/?id=3Df20cda73b495b75ef399c331f59b0e2401a3e76a" rel=3D"norefer=
rer noreferrer" target=3D"_blank">https://git.yoctoproject.org/wic/commit/?=
id=3Df20cda73b495b75ef399c331f59b0e2401a3e76a</a>]<br>
&gt; &gt; Signed-off-by: Aleksandar Nikolic &lt;<a href=3D"mailto:aleksanda=
r.nikolic@zeiss.com" target=3D"_blank" rel=3D"noreferrer">aleksandar.nikoli=
c@zeiss.com</a>&gt;<br>
&gt; <br>
&gt; Hello,<br>
&gt; <br>
&gt; Sorry I missed it in earlier reviews but it look like this patch is al=
so<br>
&gt; needed on wrynose: wrynose has wic 0.3.0 but this patch is 2 commits<b=
r>
&gt; above that.<br>
&gt; <br>
&gt; To accept this patch on scarthgap, I would need a equivalent patch for=
<br>
&gt; wrynose. Can you send that and ping back here?<br>
<br>
In scarthgap wic is part of oe-core, in wrynose it is not.<br>
<br>
For wrynose it would require a completely different patch; but it would<br>
probably be best to just update the SRCREV instead.<br></blockquote></div><=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Trevor, thanks for the a=
dded details.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Do you pla=
n to release a wic 0.3.1 soon? Or do you recommend we switch from version b=
ased SRC_URI to commit based SRCREV (I&#39;d prefer to stay version based)?=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Looking at the master l=
ogs, I could take a 0.3.1 upgrade with the current master state.</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Alternatively, we could backport A=
leksandar&#39;s fix on top of the 0.3.0 recipe (as usual)</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Regards,</div><div dir=3D"auto"><br></div=
><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_container"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Thanks!<br>
&gt; <br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 scripts/lib/wic/plugins/imager/direct.py | 6 +++---<br>
&gt; &gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/l=
ib/wic/plugins/imager/direct.py<br>
&gt; &gt; index a1d152659b..b06e6a8f23 100644<br>
&gt; &gt; --- a/scripts/lib/wic/plugins/imager/direct.py<br>
&gt; &gt; +++ b/scripts/lib/wic/plugins/imager/direct.py<br>
&gt; &gt; @@ -133,8 +133,8 @@ class DirectPlugin(ImagerPlugin):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif part.use_lab=
el:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev=
ice_name =3D &quot;LABEL=3D%s&quot; % part.label<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # mmc de=
vice partitions are named mmcblk0p1, mmcblk0p2..<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prefix =
=3D &#39;p&#39; if=C2=A0 part.disk.startswith(&#39;mmcblk&#39;) else &#39;&=
#39;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # mmc an=
d nvme device partitions start with prefix &#39;p&#39;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prefix =
=3D &#39;p&#39; if part.disk.startswith((&#39;mmcblk&#39;, &#39;nvme&#39;))=
 else &#39;&#39;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev=
ice_name =3D &quot;/dev/%s%s%d&quot; % (part.disk, prefix, part.realnum)<br=
>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opts =3D part.fso=
pts if part.fsopts else &quot;defaults&quot;<br>
&gt; &gt; @@ -266,7 +266,7 @@ class DirectPlugin(ImagerPlugin):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eli=
f part.label and self.ptable_format !=3D &#39;msdos&#39;:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return &quot;PARTLABEL=3D%s&quot; % part.label<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 els=
e:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 suffix =3D &#39;p&#39; if part.disk.startswith(&#39;mmcblk&#39;) els=
e &#39;&#39;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 suffix =3D &#39;p&#39; if part.disk.startswith((&#39;mmcblk&#39;, &#=
39;nvme&#39;)) else &#39;&#39;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return &quot;/dev/%s%s%-d&quot; % (part.disk, suffix, part.realn=
um)<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 def cleanup(self):<br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Yoann Congal<br>
&gt; Smile ECS<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#239668): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/239668" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/2396=
68</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11991532=
0/900817" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/mt/119915320/900817</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:twoerner@g=
mail.com" target=3D"_blank" rel=3D"noreferrer">twoerner@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</blockquote></div></div></div>

--000000000000e41617065537e7d3--

