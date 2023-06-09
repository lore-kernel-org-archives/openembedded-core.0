Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F7B1C7EE25
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 03:25:56 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web11.5557.1686281145796720895
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 20:25:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=RKNF05Y+;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-777b4560ae8so59851939f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 20:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686281145; x=1688873145;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DMXiQuSIJOAMltqnT9NeXNRNPprLWoWnMCu8kmJkTuE=;
        b=RKNF05Y+J/V3FooXDYuMUr3Okx5TX2IaYKNS5HaZHIX0RnkdSfin/Jr6/702xUag3e
         PS88zad8nmyJ6eBcjH8eirhLW2LS94XL7NFaAeaT3tpurmS6hMK+X3u+8PsqFdg8iB+R
         zxTPn363FNmN9HTHITLorKDCQO9dZvVT/T3SSAmMRzO0Lfkmv4siVBKMtMgmpsQqEaRX
         dUae6JfVhZ21IFdF11Rj8VVHOA9SVVsPlGxK7ezSY+DLCLOdc6g2GQfrrOhN0ALhbyna
         x9owm/cQtMkcMZs4HNd78WXr38s5P/n1OR2dZu+FHQmIdBxtJZeUB6cjWBsXOImpk4FM
         ifSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686281145; x=1688873145;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DMXiQuSIJOAMltqnT9NeXNRNPprLWoWnMCu8kmJkTuE=;
        b=mBgOcpMHfMZBC7w+fsGyNY34heo8VPdSPDMkOHjXZrZHTzz7u4CfXqrna3eUKOFxQ8
         dUuQiWWDxeViG8R0R/3rH/a4ad8R479oAwrE7GvUlm7S8VPKVcC2D8F2mqvZx9GRYIsg
         NI3QhyeIqjoZR50TNuIOP72iV97uEbg2THT3L1V84+MSo73WdPNQRGoFNBNIgb7g9qid
         0JiKsIxuDDU7Ik5+VmIe+fiYJIVC7RYOWZ7Gnmk8ybnnTwjm3TmGbmBk7vcCyTbcIQ9F
         3w3mD2/euKlYvv1sOFNy8GjAMVgI56EWITJIhTw5hECWfuIjhyAXFKBZyX8Lo1HQw1Kk
         cDPA==
X-Gm-Message-State: AC+VfDzKCupzIdYfig0QmExGTfjBYjT52llvz8ZwkZ1ImgOqgWEIWIEd
	YXJaO19vgwafMvqPI9cUeKj1Lo8L7aVhMFCRs/8=
X-Google-Smtp-Source: ACHHUZ715jnFcGpr7Qo1tuEi1t9wks4liJc1Ibeue+anNcoUgXPcMNrgQpFssEfsP6Iv7LTCFwi7hAGmyL0+c4/sg6g=
X-Received: by 2002:a5d:8497:0:b0:774:7eca:d9c5 with SMTP id
 t23-20020a5d8497000000b007747ecad9c5mr544771iom.2.1686281144836; Thu, 08 Jun
 2023 20:25:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230607205347759a5df5@mail.local> <20230608054525.3293334-1-mingli.yu@eng.windriver.com>
 <CADkTA4Mj2WdncdduX+P6fT8HU0KjkS6+vjTePbhPc0FXL2d_CA@mail.gmail.com>
 <7326285b062d6b494d9933270bb5811b83e81e82.camel@linuxfoundation.org>
 <CADkTA4O5=PNOmmKtJPE8YYJfiynMQXA1hyjaX=wuW2ydw6evbA@mail.gmail.com>
 <ab9c352c2fe8518b6886fe1eaaf926512a314bdc.camel@linuxfoundation.org>
 <CADkTA4OAmMD8h8=nNMEdtjeYwCfoGOtu4S4uWDMj+6Etm4SGUg@mail.gmail.com> <CO1PR11MB5009A4A79D96166F4D94404AF151A@CO1PR11MB5009.namprd11.prod.outlook.com>
In-Reply-To: <CO1PR11MB5009A4A79D96166F4D94404AF151A@CO1PR11MB5009.namprd11.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 8 Jun 2023 23:25:42 -0400
Message-ID: <CADkTA4MzVYyq8izr=GnN9g2QeaSqwgaeH-FBwDDPDV5i+M7qqw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5] qemu: Split the qemu package
To: "Yu, Mingli" <Mingli.Yu@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a126ce05fda9ece7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 03:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182527

--000000000000a126ce05fda9ece7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 8, 2023 at 10:01=E2=80=AFPM Yu, Mingli <Mingli.Yu@windriver.com=
> wrote:

> Hi Bruce,
>
> I didn't reply the v1 patch directly and just include the comments and
> concerns when generate v2,v3,v4,v5 patch.
>
> I'm sorry the overrides for qemu split in meta-vir as
> https://git.yoctoproject.org/meta-virtualization/tree/recipes-devtools/qe=
mu/qemu-package-split.inc
> doesn't work if we make the qemu split change.
> <https://git.yoctoproject.org/meta-virtualization/tree/recipes-devtools/q=
emu/qemu-package-split.inc>
>
>
> <https://git.yoctoproject.org/meta-virtualization/tree/recipes-devtools/q=
emu/qemu-package-split.inc>
> Is it okay for you to install the qemu arch rpms you need or qemu-all(if
> you want all qemu binary) after the qemu split change?
> <https://git.yoctoproject.org/meta-virtualization/tree/recipes-devtools/q=
emu/qemu-package-split.inc>
>

It actually isn't that. I want a different split of the packages.

But I see your v6 is using the function variable, so I'll be able to remove
it from processing and restore my existing package splits.

Bruce



>
>
> <https://git.yoctoproject.org/meta-virtualization/tree/recipes-devtools/q=
emu/qemu-package-split.inc>
>
> Thanks,
> ------------------------------
> *From:* Bruce Ashfield <bruce.ashfield@gmail.com>
> *Sent:* Friday, June 9, 2023 00:16
> *To:* Richard Purdie <richard.purdie@linuxfoundation.org>
> *Cc:* Yu, Mingli <Mingli.Yu@windriver.com>;
> openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org>
> *Subject:* Re: [OE-core] [PATCH v5] qemu: Split the qemu package
>
> * CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
>
>
> On Thu, Jun 8, 2023 at 11:44=E2=80=AFAM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2023-06-08 at 11:03 -0400, Bruce Ashfield wrote:
> >
> >
> > On Thu, Jun 8, 2023 at 9:55=E2=80=AFAM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Thu, 2023-06-08 at 09:33 -0400, Bruce Ashfield wrote:
> > > > At this point, you can probably see why I ended up using the
> > > > explicit
> > > > variables and overrides versus python when doing the
> > > > meta-virtualization splits. :)
> > > >
> > > > I have a few more comments that I made in v1, that I haven't seen
> > > > directly handled or replied to.
> > > >
> > > > My only remaining concern (and it may just be my own concern), is
> > > > that
> > > > there's no way to change this packaging split. Either you take
> > > > the
> > > > programatic split, or you take the -all packages.
> > > >
> > > > Other packages (glibc, kernel-modules) have a variable that
> > > > controls
> > > > whether the split happens or not, I'd like to see something
> > > > similar
> > > > here .. but I do realize that it makes test complexity more, and
> > > > that
> > > > Richard normally doesn't like conditionals like that.
> > >
> > > I only "like" conditionals if it is a code path that will be well
> > > travelled, otherwise we tend to find one of the paths is broken. I
> > > don't think we need to make this conditional.
> > >
> > > > Alternatively, did we rule out using PACKAGESPLITFUNCS to add the
> > > > splitting routine ? With that, we could remove the processing in
> > > > places we don't want it, in particular for the native/sdk builds,
> > > > as I
> > > > found that we really don't want the splitting of qemu in those
> > > > scenarios.
> > >
> >
> >
> > Can you think of a problem with the PACKAGESPLITFUNCS method for this
> > packaging split ?
> >
> > At least that way I could inhibit it from my other layers, versus
> > with this prepend, I don't see any options to have my own package
> > splitting.
>
> We can do this in a PACKAGESPLITFUNCS function. I guess I'm just
> nervous of having too many different ways of packaging qemu as I was
> hoping we could get something which would work for all users.
>
>
> There are some very specific use cases for virtualization, where some
> separation models use different architectures for devices, even
> architectures that don't match the target (host in the running system).
>
> There are also some combinations of usermode and system, as well as
> support and firmware, etc.
>
> I can't see a clean/easy way to make the split being proposed here serve
> all those existing (and admittedly odd) case. Having a way to override it
> (even temporarily) is a better transition path for meta-virt.
>
> Bruce
>
>
>
> Cheers,
>
> Richard
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000a126ce05fda9ece7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Jun 8, 2023 at 10:01=E2=80=AFPM Yu, Mingli =
&lt;<a href=3D"mailto:Mingli.Yu@windriver.com">Mingli.Yu@windriver.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
class=3D"msg-6224914727961162810">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Hi Bruce,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
I didn&#39;t reply the v1 patch directly and just include the comments and =
concerns when generate v2,v3,v4,v5 patch.<br>
</div>
<div><br>
</div>
<div>I&#39;m sorry <a href=3D"https://git.yoctoproject.org/meta-virtualizat=
ion/tree/recipes-devtools/qemu/qemu-package-split.inc" id=3D"m_-62249147279=
61162810LPlnk468567" target=3D"_blank">
the overrides for qemu split in meta-vir as https://git.yoctoproject.org/me=
ta-virtualization/tree/recipes-devtools/qemu/qemu-package-split.inc doesn&#=
39;t work if we make the qemu split change.</a></div>
<div><br>
<a href=3D"https://git.yoctoproject.org/meta-virtualization/tree/recipes-de=
vtools/qemu/qemu-package-split.inc" id=3D"m_-6224914727961162810LPlnk468567=
" target=3D"_blank"></a></div>
<div><a href=3D"https://git.yoctoproject.org/meta-virtualization/tree/recip=
es-devtools/qemu/qemu-package-split.inc" id=3D"m_-6224914727961162810LPlnk4=
68567" target=3D"_blank">Is it okay for you to install the qemu arch rpms y=
ou need or qemu-all(if you want all qemu binary) after
 the qemu split change?</a></div></div></div></blockquote><div><br></div><d=
iv><div class=3D"gmail_default" style=3D"font-size:small">It actually isn&#=
39;t that. I want a different split of the packages.</div><div class=3D"gma=
il_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default=
" style=3D"font-size:small">But I see your v6 is using the function variabl=
e, so I&#39;ll be able to remove it from processing and restore my existing=
 package splits.</div><div class=3D"gmail_default" style=3D"font-size:small=
"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</d=
iv><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div class=3D"msg-6224914727961162810"><div dir=3D"ltr"><div><a href=
=3D"https://git.yoctoproject.org/meta-virtualization/tree/recipes-devtools/=
qemu/qemu-package-split.inc" id=3D"m_-6224914727961162810LPlnk468567" targe=
t=3D"_blank"> <br>
</a></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Thanks,<br>
</div>
<div id=3D"m_-6224914727961162810appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_-6224914727961162810divRplyFwdMsg" dir=3D"ltr"><font face=3D"C=
alibri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>From:</b>=
 Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_=
blank">bruce.ashfield@gmail.com</a>&gt;<br>
<b>Sent:</b> Friday, June 9, 2023 00:16<br>
<b>To:</b> Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundat=
ion.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
<b>Cc:</b> Yu, Mingli &lt;<a href=3D"mailto:Mingli.Yu@windriver.com" target=
=3D"_blank">Mingli.Yu@windriver.com</a>&gt;; <a href=3D"mailto:openembedded=
-core@lists.openembedded.org" target=3D"_blank">openembedded-core@lists.ope=
nembedded.org</a> &lt;<a href=3D"mailto:openembedded-core@lists.openembedde=
d.org" target=3D"_blank">openembedded-core@lists.openembedded.org</a>&gt;<b=
r>
<b>Subject:</b> Re: [OE-core] [PATCH v5] qemu: Split the qemu package</font=
>
<div>=C2=A0</div>
</div>
<div><strong>
<div style=3D"border:1pt solid rgb(156,101,0);padding:2pt;background:rgb(25=
2,252,3)"><span style=3D"font-size:11pt;color:rgb(0,0,0)">CAUTION: This ema=
il comes from a non Wind River email account!</span></div></strong><br>
<span style=3D"font-size:10pt;color:rgb(0,0,0)">Do not click links or open =
attachments unless you recognize the sender and know the content is safe.</=
span><br>
</div>
<div>
<div dir=3D"ltr">
<div dir=3D"ltr">
<div style=3D"font-size:small"><br>
</div>
</div>
<br>
<div>
<div dir=3D"ltr">On Thu, Jun 8, 2023 at 11:44=E2=80=AFAM Richard Purdie &lt=
;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">ri=
chard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
On Thu, 2023-06-08 at 11:03 -0400, Bruce Ashfield wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Thu, Jun 8, 2023 at 9:55=E2=80=AFAM Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; On Thu, 2023-06-08 at 09:33 -0400, Bruce Ashfield wrote:<br>
&gt; &gt; &gt; At this point, you can probably see why I ended up using the=
<br>
&gt; &gt; &gt; explicit<br>
&gt; &gt; &gt; variables and overrides versus python when doing the<br>
&gt; &gt; &gt; meta-virtualization splits. :)<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; I have a few more comments that I made in v1, that I haven&#=
39;t seen<br>
&gt; &gt; &gt; directly handled or replied to.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; My only remaining concern (and it may just be my own concern=
), is<br>
&gt; &gt; &gt; that<br>
&gt; &gt; &gt; there&#39;s no way to change this packaging split. Either yo=
u take<br>
&gt; &gt; &gt; the<br>
&gt; &gt; &gt; programatic split, or you take the -all packages.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Other packages (glibc, kernel-modules) have a variable that<=
br>
&gt; &gt; &gt; controls<br>
&gt; &gt; &gt; whether the split happens or not, I&#39;d like to see someth=
ing<br>
&gt; &gt; &gt; similar<br>
&gt; &gt; &gt; here .. but I do realize that it makes test complexity more,=
 and<br>
&gt; &gt; &gt; that<br>
&gt; &gt; &gt; Richard normally doesn&#39;t like conditionals like that.<br=
>
&gt; &gt; <br>
&gt; &gt; I only &quot;like&quot; conditionals if it is a code path that wi=
ll be well<br>
&gt; &gt; travelled, otherwise we tend to find one of the paths is broken. =
I<br>
&gt; &gt; don&#39;t think we need to make this conditional.<br>
&gt; &gt; <br>
&gt; &gt; &gt; Alternatively, did we rule out using PACKAGESPLITFUNCS to ad=
d the<br>
&gt; &gt; &gt; splitting routine ? With that, we could remove the processin=
g in<br>
&gt; &gt; &gt; places we don&#39;t want it, in particular for the native/sd=
k builds,<br>
&gt; &gt; &gt; as I<br>
&gt; &gt; &gt; found that we really don&#39;t want the splitting of qemu in=
 those<br>
&gt; &gt; &gt; scenarios.<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; Can you think of a problem with the PACKAGESPLITFUNCS=C2=A0method for =
this<br>
&gt; packaging split ?<br>
&gt; <br>
&gt; At least that way I could inhibit it from my other layers, versus<br>
&gt; with this prepend, I don&#39;t see any options to have my own package<=
br>
&gt; splitting.<br>
<br>
We can do this in a PACKAGESPLITFUNCS function. I guess I&#39;m just<br>
nervous of having too many different ways of packaging qemu as I was<br>
hoping we could get something which would work for all users.<br>
<br>
</blockquote>
<div><br>
</div>
<div>
<div style=3D"font-size:small">There are some very specific use cases for v=
irtualization, where some separation models use different architectures for=
 devices, even architectures that don&#39;t match the target (host in the r=
unning system).</div>
<div style=3D"font-size:small"><br>
</div>
<div style=3D"font-size:small">There are also some combinations of usermode=
 and system, as well as support and firmware, etc.</div>
<div style=3D"font-size:small"><br>
</div>
<div style=3D"font-size:small">I can&#39;t see a clean/easy way to make the=
 split being proposed here serve all those existing (and admittedly odd) ca=
se. Having a way to override it (even temporarily) is a better transition p=
ath for meta-virt.</div>
<div style=3D"font-size:small"><br>
</div>
<div style=3D"font-size:small">Bruce</div>
<br>
</div>
<div>=C2=A0</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
Cheers,<br>
<br>
Richard<br>
</blockquote>
</div>
<br clear=3D"all">
<div><br>
</div>
<span>-- </span><br>
<div dir=3D"ltr">- Thou shalt not follow the NULL pointer, for chaos and ma=
dness await thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
</div>
</div>
</div>
</div>


</div></blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gm=
ail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signatu=
re">- Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II=
<br><br></div></div>

--000000000000a126ce05fda9ece7--

