Return-Path: <ncaidin@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 510DBCD1288
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 13:01:27 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.10291.1712149285363317520
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Apr 2024 06:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BB9i+EWx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.160.44, mailfrom: ncaidin@linuxfoundation.org)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-22ea805f3edso48165fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 06:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1712149284; x=1712754084; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v0zCoFlU3S6UZKWyrvhudhneVKK6NpsYto+ajbGOPO8=;
        b=BB9i+EWxOYOLr7h305tsqK0u5oTGYQ8+lQ8gsYuC6f4pBumYkuhKNWqygfZXHNTmta
         FJJI5Xi8/Jiy39nvjxyxQFfwEv8y0AxdGSFIstWn1R/HzHidBgQNIvpSCBZ7VLpEjgqR
         LaA3WmJtWVSaQezyl5Z5eiV3bNFwT12B/WQ7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712149284; x=1712754084;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v0zCoFlU3S6UZKWyrvhudhneVKK6NpsYto+ajbGOPO8=;
        b=SpV31HEqsW4BmlfFo1pqkyCBHKCXC0SJPvKSiSW9ctz7tzyYgsCe7CvgYuWwq3grK5
         mQIMqt6Xzr4fG6lyeweyfVNqTRI3E1c5L4kXMVJTIM92SGn7RyvV9rY/PXBy/q95SUrH
         Y8E/shTPfL4bXOzh/ZcG1Uk2tgAjDMATOPDlX77jV0fnaJzefptp27t9nunIQWBIV15A
         5Iu8Fb6w34puE52xkS9UyWeyyhuMehW3trgrM30VPyn16UckWK8KiIhKJmPIT6e5akYV
         srY0QZDRGoHHRWGuIvIeatyCabCnVpgcfJj+okMSvN2i1epY1js0by07TKQ/0xrnP2dL
         ko2w==
X-Forwarded-Encrypted: i=1; AJvYcCXry5F8AFZ4K3LR4+OZo73WmkyLsCbDkIxFNiwB1Lfg3/7FoAfvJ4XevUjVW+JXN9Hu6ZL3w0J0Cx1ywzmNA/4xt5QcZxZDE3+iVzXQQLzpsYSBesLUIxq7
X-Gm-Message-State: AOJu0Yxei96LDlTYcaI1kthaSyxf5kUfY1mjIr0MOcuJDEtd8wpxepux
	iiAXpLVCQQ6AQD3nHVXT1Z8V5ixbQ+i1fuzg077DrbmURLJ6V7hI/66b7j9qK3a5ZsBKxd48Tci
	UQ1ja3EHgsqAYcil8V+WIAIFhI3APo9s0MZNWIg==
X-Google-Smtp-Source: AGHT+IHXsbR0nPCRAGouEVEw4giPE9+cwiqthdiqbRCUXahMmLH0a2E0IRsQftgMi18VNi/4Jh4xKAquUaaXxh8wD9E=
X-Received: by 2002:a05:6870:512:b0:221:3ba2:fff0 with SMTP id
 j18-20020a056870051200b002213ba2fff0mr17191164oao.45.1712149281779; Wed, 03
 Apr 2024 06:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <8363E7C5-B3C0-4B3E-941E-762A400DF87B@arm.com> <DB5PR02MB1021390D34E1DC909E4E277C6EF3E2@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB1021390D34E1DC909E4E277C6EF3E2@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Neal Caidin <ncaidin@linuxfoundation.org>
Date: Wed, 3 Apr 2024 09:01:06 -0400
Message-ID: <CAODMxsLkW5XQcXQ_BpvYgwoojG_UvT3gt2e5W2eh2d+cfzM6Kw@mail.gmail.com>
Subject: Re: [yocto] New mailing list for layer patches
To: yocto@lists.yoctoproject.org, peter.kjellerstedt@axis.com
Cc: "ross.burton@arm.com" <ross.burton@arm.com>, 
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000be46fe061530d1a1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 13:01:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197917

--000000000000be46fe061530d1a1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

Fixed by the YPE team (Yocto Project Elves).

Thanks for noticing and reporting!

Best,
Neal

*Neal Caidin*
Program Manager
The Linux Foundation
Durham, NC, U.S.A. - Eastern time zone
+1 (919) 238-9104 (w/h)
+1 (919) 949-1861 (m)
ncaidin@linuxfoundation.org
https://meetings.hubspot.com/ncaidin




On Tue, Apr 2, 2024 at 6:33=E2=80=AFPM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> > -----Original Message-----
> > From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On
> > Behalf Of Ross Burton
> > Sent: den 28 mars 2024 15:37
> > To: openembedded-architecture <openembedded-
> > architecture@lists.openembedded.org>; Yocto-mailing-list
> > <yocto@lists.yoctoproject.org>; OE-core <openembedded-
> > core@lists.openembedded.org>
> > Subject: [yocto] New mailing list for layer patches
> >
> > Hi,
> >
> > At the moment if a layer doesn=E2=80=99t have enough volume to justify =
a
> dedicated
> > mailing list for patches (see, for example, meta-
> > arm@lists.yoctoproject.org <mailto:meta-arm@lists.yoctoproject.org>)
> then
> > the convention is that the patches can be sent to
> > yocto@lists.yoctoproject.org <mailto:yocto@lists.yoctoproject.org>.
> >
> > However, that=E2=80=99s also the list that we encourage users of Yocto =
to use for
> > help, so the list has a mix of patches for various layers and people
> > asking for help, which isn=E2=80=99t ideal: users who want help don=E2=
=80=99t want to be
> > flooded with patches for layers they=E2=80=99re not using, layer mainta=
iners may
> > not want to see the requests for help, and people who want the status
> > reports have to receive patches and support.
> >
> > The Yocto TSC has been discussing this, and as a solution to this we=E2=
=80=99ve
> > just created a new mailing list: yocto-patches@lists.yoctoproject.org
> > <mailto:yocto-patches@lists.yoctoproject.org>.  This list is
> specifically
> > for Yocto-related projects which don=E2=80=99t have their own mailing l=
ist or
> > other patch submission process.   We ask that all layers currently usin=
g
> > yocto@ for patches move to yocto-patches@, so that yocto@ can be used
> > purely for discussion and other non-patch related subjects.
> >
> > Many thanks,
> > Ross
> > Yocto TSC member
>
> To whoever is responsible for updating
> https://www.yoctoproject.org/community/mailing-lists/: the links for the
> two new lists both refer to yocto-announce rather than yocto-status and
> yocto-patches.
>
> //Peter
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#62880):
> https://lists.yoctoproject.org/g/yocto/message/62880
> Mute This Topic: https://lists.yoctoproject.org/mt/105197684/4445066
> Group Owner: yocto+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/yocto/unsub [
> ncaidin@linuxfoundation.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000be46fe061530d1a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Peter,<div><br></div><div>Fixed by the YPE team (Yocto =
Project Elves).</div><div><br></div><div>Thanks for noticing and reporting!=
</div><div><br></div><div>Best,</div><div>Neal</div><div><br clear=3D"all">=
<div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_sig=
nature"><div dir=3D"ltr"><div><div dir=3D"ltr"><span><font color=3D"#888888=
"><div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"=
ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><b style=3D"color:r=
gb(136,136,136)"><font color=3D"#666666"><font color=3D"#888888">Neal Caidi=
n</font></font></b><br><div><span style=3D"border-collapse:collapse"><div s=
tyle=3D"color:rgb(136,136,136)"><font color=3D"#666666"><font>Program Manag=
er=C2=A0</font></font></div><div style=3D"color:rgb(136,136,136)"><font col=
or=3D"#666666"><font>The Linux Foundation</font></font></div><div style=3D"=
color:rgb(136,136,136)"><font color=3D"#666666"><font>Durham, NC, U.S.A. - =
Eastern time zone</font></font></div><div style=3D"color:rgb(136,136,136)">=
<font color=3D"#666666">+1 (919) 238-9104 (w/h)<br>+1 (919) 949-1861 (m)</f=
ont></div><div style=3D"color:rgb(136,136,136)"><font color=3D"#666666"><a =
href=3D"mailto:ncaidin@linuxfoundation.org" target=3D"_blank">ncaidin@linux=
foundation.org</a></font></div><div><a href=3D"https://meetings.hubspot.com=
/ncaidin" target=3D"_blank">https://meetings.hubspot.com/ncaidin</a><br></d=
iv><div><br></div><div style=3D"color:rgb(136,136,136)"><br></div></span></=
div></div></div></div></div></div></div></div></div></div></font></span></d=
iv></div></div></div></div><br></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 2, 2024 at 6:33=E2=80=AFPM=
 Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com">pete=
r.kjellerstedt@axis.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:yocto@lists.yoctoproject.org" target=3D"_blank=
">yocto@lists.yoctoproject.org</a> &lt;<a href=3D"mailto:yocto@lists.yoctop=
roject.org" target=3D"_blank">yocto@lists.yoctoproject.org</a>&gt; On<br>
&gt; Behalf Of Ross Burton<br>
&gt; Sent: den 28 mars 2024 15:37<br>
&gt; To: openembedded-architecture &lt;openembedded-<br>
&gt; <a href=3D"mailto:architecture@lists.openembedded.org" target=3D"_blan=
k">architecture@lists.openembedded.org</a>&gt;; Yocto-mailing-list<br>
&gt; &lt;<a href=3D"mailto:yocto@lists.yoctoproject.org" target=3D"_blank">=
yocto@lists.yoctoproject.org</a>&gt;; OE-core &lt;openembedded-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt;<br>
&gt; Subject: [yocto] New mailing list for layer patches<br>
&gt; <br>
&gt; Hi,<br>
&gt; <br>
&gt; At the moment if a layer doesn=E2=80=99t have enough volume to justify=
 a dedicated<br>
&gt; mailing list for patches (see, for example, meta-<br>
&gt; <a href=3D"mailto:arm@lists.yoctoproject.org" target=3D"_blank">arm@li=
sts.yoctoproject.org</a> &lt;mailto:<a href=3D"mailto:meta-arm@lists.yoctop=
roject.org" target=3D"_blank">meta-arm@lists.yoctoproject.org</a>&gt;) then=
<br>
&gt; the convention is that the patches can be sent to<br>
&gt; <a href=3D"mailto:yocto@lists.yoctoproject.org" target=3D"_blank">yoct=
o@lists.yoctoproject.org</a> &lt;mailto:<a href=3D"mailto:yocto@lists.yocto=
project.org" target=3D"_blank">yocto@lists.yoctoproject.org</a>&gt;.<br>
&gt; <br>
&gt; However, that=E2=80=99s also the list that we encourage users of Yocto=
 to use for<br>
&gt; help, so the list has a mix of patches for various layers and people<b=
r>
&gt; asking for help, which isn=E2=80=99t ideal: users who want help don=E2=
=80=99t want to be<br>
&gt; flooded with patches for layers they=E2=80=99re not using, layer maint=
ainers may<br>
&gt; not want to see the requests for help, and people who want the status<=
br>
&gt; reports have to receive patches and support.<br>
&gt; <br>
&gt; The Yocto TSC has been discussing this, and as a solution to this we=
=E2=80=99ve<br>
&gt; just created a new mailing list: <a href=3D"mailto:yocto-patches@lists=
.yoctoproject.org" target=3D"_blank">yocto-patches@lists.yoctoproject.org</=
a><br>
&gt; &lt;mailto:<a href=3D"mailto:yocto-patches@lists.yoctoproject.org" tar=
get=3D"_blank">yocto-patches@lists.yoctoproject.org</a>&gt;.=C2=A0 This lis=
t is specifically<br>
&gt; for Yocto-related projects which don=E2=80=99t have their own mailing =
list or<br>
&gt; other patch submission process.=C2=A0 =C2=A0We ask that all layers cur=
rently using<br>
&gt; yocto@ for patches move to yocto-patches@, so that yocto@ can be used<=
br>
&gt; purely for discussion and other non-patch related subjects.<br>
&gt; <br>
&gt; Many thanks,<br>
&gt; Ross<br>
&gt; Yocto TSC member<br>
<br>
To whoever is responsible for updating <br>
<a href=3D"https://www.yoctoproject.org/community/mailing-lists/" rel=3D"no=
referrer" target=3D"_blank">https://www.yoctoproject.org/community/mailing-=
lists/</a>: the links for the <br>
two new lists both refer to yocto-announce rather than yocto-status and <br=
>
yocto-patches.<br>
<br>
//Peter<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#62880): <a href=3D"https://lists.yoctoproject.org/g/yoc=
to/message/62880" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctop=
roject.org/g/yocto/message/62880</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/105197684/444=
5066" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/105197684/4445066</a><br>
Group Owner: <a href=3D"mailto:yocto%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">yocto+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/yocto/unsub" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/yocto/un=
sub</a> [<a href=3D"mailto:ncaidin@linuxfoundation.org" target=3D"_blank">n=
caidin@linuxfoundation.org</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000be46fe061530d1a1--

