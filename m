Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B365CC5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 11:04:58 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web11.9339.1709723095987583537
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 03:04:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X9vg29jw;
 spf=pass (domain: gmail.com, ip: 209.85.217.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4726656a997so1089192137.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 03:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709723095; x=1710327895; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JRXvo0cdyFMISyqX7fXLpQNkMm5gVtKHJpIEiEGDwQs=;
        b=X9vg29jwGxgDy8CIjpTL6UfducaVIvNajrdL8YlDSQQPBOINtu2bo74gYF/wjYcuB3
         /Wl48pmRoSuTcwngvqpB9CWTK6H+95PtZHv5ttMaju5USYjTonKei/lNxv50/t9lO7pA
         bRAth6d6k5OhOoDzz9xTjMDJXHR/rrpfN+7R88Y58TF3wzUeBf3T3UDpkEzkzlnz9vt6
         GtQ34wI7XKSb2YxGwUBMfRCVjAvRLTRKF9Eo/FmUJvvQXdpb2lv98Dw1Uwr3lgZscyqZ
         beoJLMPrL7UH3NmlHBZbSCWtb1CTpISniqiB94/o84iTA9C5eAnXvgJ030yw+QYUiGeY
         6gBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709723095; x=1710327895;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JRXvo0cdyFMISyqX7fXLpQNkMm5gVtKHJpIEiEGDwQs=;
        b=tOLgifkUNozFlajwc58bJBWIURsb6FgxG08CN7DBO1GeJ53AHvcTaeWFxlHZdYsEuk
         DSjsuo/S15Rxp2Fu3lKZV0+wZglQLM1Ctwmwl3AO+783F/F2VyzErLq+q+C4Xrx2paoB
         BciYD43FytNgTep1gbaFgDggB96eKm1Rp58aTfKBRomT6ZRQXGlAsatRdZMV4hGQMY47
         GTU/KpWZk4Grc1SOTSNLG09JCiyEJraZ8TNVXkY22yETJSrGHvK6t6xQfEdaRMdnTRSO
         pSpLjI5Y1EnqJXk88y6krPhM7ljGohhj7RWEIUsYp3nJds4szp4WhXnGiJfIDkURV5H9
         pfAw==
X-Forwarded-Encrypted: i=1; AJvYcCXXyz6qIhnOnQ4E869mnXXwJ4NkYWbw/QHN595W1AjG/+F1CMQmKDNzeZO9ngtqjqHPQZm7BDXOqditrvwpu4DKubfouYORbp8o829MJS1xCnqP1C2w03De
X-Gm-Message-State: AOJu0YzQ+GK6JvTBM0GHti5p7kpgrO8vqBi4dGsbKlTxbUmODeWymE1Y
	1NRZK19Knn0MYqH8LNPOjqi9ZqMiO9bA8BdmvMKmLNHW7p0mt6/HBR+s6ab3/5WhK88TE7EOs1K
	Tw896p38aHblsOwgDsmrn8BC+P74=
X-Google-Smtp-Source: AGHT+IEAZxS0cmwnnZKElDsLWyrChR07G05BQapzG9r4sAGf8hEP2Bp+VxaJ5PQKf8ouEYRGQptXSp6i9RIlaUdcxCs=
X-Received: by 2002:a05:6102:45b:b0:472:b0b3:8ac2 with SMTP id
 e27-20020a056102045b00b00472b0b38ac2mr4722648vsq.16.1709723094868; Wed, 06
 Mar 2024 03:04:54 -0800 (PST)
MIME-Version: 1.0
References: <20240228183011.1495807-1-jose.quaresma@foundries.io>
 <CAMKF1sqZc2HR=iWKjDHQAVHHxTfXKv0DqcbHZr+-akTSvU24eA@mail.gmail.com>
 <e9a42854ce1e115e6f82088ae873f984a182596a.camel@linuxfoundation.org>
 <17B84BB9B5B6E4EC.16400@lists.openembedded.org> <CANPvuRnz--2ApD7u_uVUkRvQ7WH078V4xwDSRGvsEXhCs-NyHA@mail.gmail.com>
 <17B8756EC40C8FBB.30419@lists.openembedded.org> <10c3fd9adcd8c39a85f578ab690fc7a45b68cf9c.camel@linuxfoundation.org>
 <17B9E61D9B388488.13906@lists.openembedded.org> <CANPvuRkrNGD6pj51BDEEJ=A2n+xxbs-Wjk1Fvs+FoXcritSuGA@mail.gmail.com>
 <6a007928eaf9764ce3cae8840dc83c024ed4cece.camel@linuxfoundation.org>
In-Reply-To: <6a007928eaf9764ce3cae8840dc83c024ed4cece.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 6 Mar 2024 11:04:43 +0000
Message-ID: <CANPvuRndpF1HNLZD9FfKPSNYAc2SmhM-9srR8XkwXQPD5htJBg@mail.gmail.com>
Subject: Re: [OE-core] [RFC OE-core][PATCH v2 1/7] go: rework patch to avoid identation
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000bbe9bc0612fbede3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 11:04:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196664

--000000000000bbe9bc0612fbede3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu (quarta,
6/03/2024 =C3=A0(s) 10:58):

> On Wed, 2024-03-06 at 02:22 -0800, Jose Quaresma wrote:
> >
> >
> > Jose Quaresma via lists.openembedded.org
> > <quaresma.jose=3Dgmail.com@lists.openembedded.org> escreveu (ter=C3=A7a=
,
> > 5/03/2024 =C3=A0(s) 14:55):
> > >
> > >
> > > Richard Purdie <richard.purdie@linuxfoundation.org> escreveu
> > > (domingo, 3/03/2024 =C3=A0(s) 23:03):
> > > > On Thu, 2024-02-29 at 22:19 +0000, Richard Purdie via
> > > > lists.openembedded.org wrote:
> > > > > On Thu, 2024-02-29 at 21:42 +0000, Jose Quaresma wrote:
> > > > > >
> > > > > >
> > > > > > A quinta, 29/02/2024, 09:35, Jose Quaresma via
> > > > > > lists.openembedded.org
> > > > > > <quaresma.jose=3Dgmail.com@lists.openembedded.org> escreveu:
> > > > > > >
> > > > > > >
> > > > > > > Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > > > > escreveu
> > > > > > > (quinta, 29/02/2024 =C3=A0(s) 08:18):
> > > > > > > > On Wed, 2024-02-28 at 21:16 -0800, Khem Raj wrote:
> > > > > > > > > Fails to compile bunch of  recipes using go e.g.
> > > > > > > > > influxdb,
> > > > > > > > > crucible,
> > > > > > > > > syzkaller in meta-oe see
> > > > > > > > >
> > > > > > > > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3667/st=
eps/15/logs/stdio
> > > > > > > >
> > > > > > > > Also fails for oe-selftest:
> > > > > > > >
> > > > > > > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6415/st=
eps/14/logs/stdio
> > > > > > > >
> > > > > > > > and on arm hosts:
> > > > > > > >
> > > > > > > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/7999/st=
eps/13/logs/stdio
> > > > > > > >
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > Thanks for testing, I will take a look on all of this
> > > > > > > today.
> > > > > >
> > > > > > I have no progress today and unfortunately I won't have time
> > > > > > to
> > > > > > work
> > > > > > on this in the next few days :( if anyone wants to continue
> > > > > > with
> > > > > > this
> > > > > > effort, feel free to do so.
> > > > > >
> > > > > > my apologies.
> > > > >
> > > > > FWIW https://github.com/golang/go/issues/65887 looked relevant
> > > > > to the
> > > > > first issue.
> > > > >
> > > > > We are really late in the schedule to pull in things like this
> > > > > so I'm
> > > > > not sure we'll get this in at this point :/.
> > > > >
> > > >
> > >
> > >
> > > Having the 1.21 bump was already a significant benefit for the
> > > project in my opinion.
> > > so if you drop the 1.22 the impact is much reduced.
> > >
> > > >
> > > >
> > > > I've some tweaks in master-next I'm testing to see if it does
> > > > sort
> > > > 1.22...
> > > >
> > >
> > >
> > > I also will do some tests with your changes in main-next to see if
> > > I found any runtime issue.
> > >
> >
> >
> > The stack I have tested may be considered a bit limited but I didn't
> > find anything relevant that prevents integration.
> > If this bump to 1.22 can be tested with meta-virt the results would
> > be a wider range.
>
> I believe Khem tested meta-oe and Bruce agreed he was ok with merging
> this so I will probably merge the 1.22 patches in -next.
>

Great news!
and thank you for helping to solve this big problem that I had been trying
to fix for a good few months.

Jose


> Cheers,
>
> Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196663):
> https://lists.openembedded.org/g/openembedded-core/message/196663
> Mute This Topic: https://lists.openembedded.org/mt/104628621/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000bbe9bc0612fbede3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu (quarta, 6/03/2024 =C3=A0(s) 10:58):<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Wed, 2024-03-06 at 02:22 -0800, Jose Q=
uaresma wrote:<br>
&gt; <br>
&gt; <br>
&gt; Jose Quaresma via <a href=3D"http://lists.openembedded.org" rel=3D"nor=
eferrer" target=3D"_blank">lists.openembedded.org</a><br>
&gt; &lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.openembedded.org=
" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; escreveu (ter=
=C3=A7a,<br>
&gt; 5/03/2024 =C3=A0(s) 14:55):<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundati=
on.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; escrev=
eu<br>
&gt; &gt; (domingo, 3/03/2024 =C3=A0(s) 23:03):<br>
&gt; &gt; &gt; On Thu, 2024-02-29 at 22:19 +0000, Richard Purdie via<br>
&gt; &gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer"=
 target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; &gt; &gt; &gt; On Thu, 2024-02-29 at 21:42 +0000, Jose Quaresma wrote:=
<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; A quinta, 29/02/2024, 09:35, Jose Quaresma via<br>
&gt; &gt; &gt; &gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"n=
oreferrer" target=3D"_blank">lists.openembedded.org</a><br>
&gt; &gt; &gt; &gt; &gt; &lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@li=
sts.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a=
>&gt; escreveu:<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; Richard Purdie &lt;<a href=3D"mailto:richard.=
purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundatio=
n.org</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; escreveu<br>
&gt; &gt; &gt; &gt; &gt; &gt; (quinta, 29/02/2024 =C3=A0(s) 08:18):<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; On Wed, 2024-02-28 at 21:16 -0800, Khem =
Raj wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Fails to compile bunch of=C2=A0 rec=
ipes using go e.g.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; influxdb,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; crucible,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; syzkaller in meta-oe see<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"https://autobuilder.yoct=
oproject.org/typhoon/#/builders/88/builds/3667/steps/15/logs/stdio" rel=3D"=
noreferrer" target=3D"_blank">https://autobuilder.yoctoproject.org/typhoon/=
#/builders/88/builds/3667/steps/15/logs/stdio</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Also fails for oe-selftest:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"https://autobuilder.yoctoproj=
ect.org/typhoon/#/builders/80/builds/6415/steps/14/logs/stdio" rel=3D"noref=
errer" target=3D"_blank">https://autobuilder.yoctoproject.org/typhoon/#/bui=
lders/80/builds/6415/steps/14/logs/stdio</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; and on arm hosts:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"https://autobuilder.yoctoproj=
ect.org/typhoon/#/builders/97/builds/7999/steps/13/logs/stdio" rel=3D"noref=
errer" target=3D"_blank">https://autobuilder.yoctoproject.org/typhoon/#/bui=
lders/97/builds/7999/steps/13/logs/stdio</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; Thanks for testing, I will take a look on all=
 of this<br>
&gt; &gt; &gt; &gt; &gt; &gt; today.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; I have no progress today and unfortunately I won&#=
39;t have time<br>
&gt; &gt; &gt; &gt; &gt; to<br>
&gt; &gt; &gt; &gt; &gt; work<br>
&gt; &gt; &gt; &gt; &gt; on this in the next few days :( if anyone wants to=
 continue<br>
&gt; &gt; &gt; &gt; &gt; with<br>
&gt; &gt; &gt; &gt; &gt; this<br>
&gt; &gt; &gt; &gt; &gt; effort, feel free to do so.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; my apologies.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; FWIW <a href=3D"https://github.com/golang/go/issues/658=
87" rel=3D"noreferrer" target=3D"_blank">https://github.com/golang/go/issue=
s/65887</a>=C2=A0looked relevant<br>
&gt; &gt; &gt; &gt; to the<br>
&gt; &gt; &gt; &gt; first issue.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; We are really late in the schedule to pull in things li=
ke this<br>
&gt; &gt; &gt; &gt; so I&#39;m<br>
&gt; &gt; &gt; &gt; not sure we&#39;ll get this in at this point :/.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; Having the 1.21 bump was already a significant benefit for the<br=
>
&gt; &gt; project in my opinion.<br>
&gt; &gt; so if you drop the 1.22 the impact is much reduced.<br>
&gt; &gt; <br>
&gt; &gt; &gt; =C2=A0<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; I&#39;ve some tweaks in master-next I&#39;m testing to see i=
f it does<br>
&gt; &gt; &gt; sort<br>
&gt; &gt; &gt; 1.22...<br>
&gt; &gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; I also will do some tests with your changes in main-next to see i=
f<br>
&gt; &gt; I found any runtime issue.<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; The stack I have tested=C2=A0may be considered a bit limited but=C2=A0=
I didn&#39;t<br>
&gt; find anything relevant=C2=A0that prevents integration.<br>
&gt; If this bump to 1.22 can be tested with meta-virt=C2=A0the results wou=
ld<br>
&gt; be a wider range.<br>
<br>
I believe Khem tested meta-oe and Bruce agreed he was ok with merging<br>
this so I will probably merge the 1.22 patches in -next.<br></blockquote><d=
iv><br></div><div>Great news!<br>and thank you for helping to solve this bi=
g problem that I had been trying to fix for a good few months.<br><br>Jose<=
/div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#196663): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/196663" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/196663</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104628621/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/104628621/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000bbe9bc0612fbede3--

