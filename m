Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8249C88E5C
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 14:22:48 +0000 (UTC)
Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16191.1789568562431711021
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 07:22:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HbE7XIJJ;
 spf=pass (domain: gmail.com, ip: 74.125.227.141, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f05ffdso7938835ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 07:22:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789568562; cv=none;
        d=google.com; s=arc-20260327;
        b=oAhYB9HaJkMO7rQR8K6S8V/CouwuwLZxJPQfpuf7/CKZsHBgfORPLfw9QadY/+ieC6
         l4ZBInQ0rtSoCfVTU3rcqxpIfAuj0+3OUobtPoOGh2IhVu8aPOhGhhVQ3wOmQ16TkpOw
         Rmz7QSxdjdvDlB/4EHp3iPI++AsSfIE0R7A2KYRI6d9dHhte1C5mv9s8YRY5iDeuEUsi
         BXlSs1d4ObKftX02/LNdxtHyzMrkg0wHrqPnro39ODgBHf6E7XNFVI+hn434597ZWanV
         Wq4meU0s4nfnL7ahWMM+eQ8pbjDaVVOOxU327nrgH5ZGU4pGHY1C+n65VtZqQU5f42zy
         6dDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Vygfe7O9b4M0WcH59t7kPjD9b2nEMK5dOhZMcKwg1TA=;
        fh=3JaEEU8mWJi8RLKriM7JMi/cJ1mpFhIIgFkrZc9RQLg=;
        b=fzIGX0/p/hBxf+aLYGUB74IqTzKHQGb5KyAxt3rO29AVkF3yTR8XL6BrADFMDJOtkh
         VF/tjrrQ/7Cc7OaBAbuLOXKD3Se88YUZgo1gtQ4Ek09i6HOIg5wRej2tBUIhHot7kN03
         5uKU2SbEFfvmDrSlCVLn5h38mSKA4JLnAhOVMOGXmBSVA/P+SpnO8cZL/r3egbLcXNzd
         8r8wpHyn0UXB1mFbj3qe6MyTmeGqjVq9f0QIDHkg/teSvTEPLSoRMS65jUDGmkeaHrq5
         mX1jgOsf16ydeJlieRFzLiTiT02cm8PayVsKqZrRZzBj/z+DIDQeeh1ukZ+aUeV9La5s
         WYWg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789568562; x=1790173362; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vygfe7O9b4M0WcH59t7kPjD9b2nEMK5dOhZMcKwg1TA=;
        b=HbE7XIJJrwNJduxUQKxAQOfFVQ7h++IYKPpq5FRs4cIboEubDs/5sL0P336wmDbJQs
         JZYWvWfk5b9E56TiIO6C7J5KZ7E8a/J17MDy38bVfkNMrFk2kSjY1N2bLA20Dn2Aex7A
         2MjHqhI+5qV4fqqTFMaKfFDgmoSFSrnD5vPqjAL/koCyLYQuONK3MCQeYpoJjGXQ0vm6
         PeLQcfF8vtIusp3NdugJ1VmVAHZFHPcY7pdxjlAatm4NB7VfLdEm644EhbK1xa3BWzu+
         4pcLGH2D+j7CRDeW03KtCp1M+URYq+H+3R1FNJG/S7oMwUd54GNfTHgNm2YGtPy5s9Vx
         cS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789568562; x=1790173362;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Vygfe7O9b4M0WcH59t7kPjD9b2nEMK5dOhZMcKwg1TA=;
        b=Mfe1doHlmNht6YsewuTTmPOCIpAF79ovBer/KP0xeiSNaJsYfbaPB6rmtetxY9bL8V
         WnVNCUSz1CPjCiI0dl5Ex6kpJg8PLqcxq72xxISaBvfMIVRUI9ncG4W+HA2Ivlr/m3Ra
         FlvmV8Y+4OBRNcgBrvPKNR353z8oeGGFWvbDKPEYRADVKvEGliKeKoaiUPotrLSiyxSV
         U0uO32hQXywLuVKvWyxWB7/4f6nH+prSDStMuojHs8e34LQrOLVYTw0zCelkHVk89EH2
         uuYCravvxQUxWEcDbXuqFGE8U0XrUfYfUYvgAirZ+t8yvIAlDJsJXAPSRWYpNkaaxkd2
         O87w==
X-Forwarded-Encrypted: i=1; AKwUvBwLItgbY/KX2nQhDPZLDNBPEzZ/7jjVBFteYGvDxzOPa+9+L4NQikVceAgZIu16oQiXg/eVYkTM4BtHqKPZ2rAOUg==@lists.openembedded.org
X-Gm-Message-State: AFuF++mrzwk3DKVDvutgGu/OMkyCjWQdYeQ4SUjBb/6F1lmmwk1HojvO
	ea9CKwUStp478PGHf4/oZM5Kq+rIxOErQkT5Uwahjfw7HOK4JESwvKhxkmzkNxyrUKv1+Ymy2TQ
	9JC/0dQZFwR5+a3oRSOJMA626xgYpw+g=
X-Gm-Gg: AYBFou0VIjrvpsDQ1TntzfHqjtryj7TPGLqXuywobf4bvNLR2WAJu7RGC8ubPWrqs1k
	XHsB7SShXj5HD1PASUQtOycBx+RIFcn0Pp7JWdsRlrz+Bsj1KvB22MHoSqcL+TjOsPMAMg4cvwG
	goMuHXPAoYt0FGv6KEkUuE+tAaF3DNRIHnT2REvdZnFWyp97cTkRc8c7O408tkl43iGUvvg/C9B
	VG8FaI2ansFX859by53qpmgSl6mQgtTelV4CG+0QtKCy3JafJxw86bKNBR14Hfqem3dewU25pRp
	i+fkF9wDF1ixbdw7eApXlCK0KPsB2K5IrN9W4QekjaMXYgyfbIR+6unDyrlk/L7PSvlUBDWXfJn
	BYhRr3Hq0UlYMcDafHN0LS309KVA4B63EKwN7oj/RwyHM+1+eDERCs+GO86CRLXo+FL1qP+IcHQ
	==
X-Received: by 2002:a17:902:da85:b0:2d9:1dee:43e3 with SMTP id
 d9443c01a7336-2dd8e6373e1mr56303615ad.18.1789568561357; Wed, 16 Sep 2026
 07:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <18D59CE1160E5503.1924412@lists.openembedded.org>
 <CADkTA4PK+tZuCHuBR4ZPahYUYy4QmYEoz85Vv1q34AT70c8mMg@mail.gmail.com>
 <aqo4hfLnicviWL3O@nuoska> <DLGK1VZBV39U.7XRHLEI6RC90@bootlin.com> <aqpFXlqVacE4TWRh@nuoska>
In-Reply-To: <aqpFXlqVacE4TWRh@nuoska>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 16 Sep 2026 10:22:29 -0400
X-Gm-Features: AcwNN1Wk349NqFTcyoozM_ErnBFzaUId6FzcL7oLW0BvlTXPn1w-rhFSsT4Nygk
Message-ID: <CADkTA4MZ69k7XFTXqE50bJusuT+mB5reYVs7P5HYZs-UQQsLUQ@mail.gmail.com>
Subject: Re: [OE-core] [meta][PATCH 01/02] linux-yocto/6.18: update to v6.18.50
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Antonin Godard <antonin.godard@bootlin.com>, richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000066a80d065b9a661e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 14:22:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245979

--00000000000066a80d065b9a661e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 3:29=E2=80=AFAM Mikko Rapeli <mikko.rapeli@linaro.o=
rg>
wrote:

> Hi,
>
> On Wed, Sep 16, 2026 at 09:16:46AM +0200, Antonin Godard wrote:
> > On Wed Sep 16, 2026 at 8:34 AM CEST, Mikko Rapeli via
> lists.openembedded.org wrote:
> > > Hi Bruce,
> > >
> > > On Tue, Sep 15, 2026 at 05:50:36PM -0400, Bruce Ashfield via
> lists.openembedded.org wrote:
> > >> There's no second patch coming, it went to the yocto list for BSPs!
> > >
> > > I don't see the yocto-bsp side patch in
> https://lists.yoctoproject.org/g/poky/messages list
> > > archives. Same was with previous kernel update series.
> > >
> > > Maybe they just went to Richard directly?
> >
> > It was sent the yocto list:
> >
> https://lore.kernel.org/r/20260915214911.1095011-1-bruce.ashfield@gmail.c=
om
>
> Right. I can see where the confusion comes from. meta-yocto README.md say=
s
> that patches to meta-yocto/meta-poky/meta-yocto-bsp should go to
> poky@lists.yoctoproject.org. Maybe yocto@ is a better match and the
> docs need to be updated. Not much left of "poky"...
>

I send those based on a 15 year old text file that refreshes my memory and
probably a 5 year old shell history :)

I've mainly always sent them there.

I can send them anywhere, and can also update the upstream docs. The
lowest friction option is probably for me to just send the to poky@, if
Richard
or Antonin have a preference, I'll do that.

Bruce



>
> Cheers,
>
> -Mikko
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000066a80d065b9a661e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 16, 2026 at 3:29=
=E2=80=AFAM Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org">mik=
ko.rapeli@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Hi,<br>
<br>
On Wed, Sep 16, 2026 at 09:16:46AM +0200, Antonin Godard wrote:<br>
&gt; On Wed Sep 16, 2026 at 8:34 AM CEST, Mikko Rapeli via <a href=3D"http:=
//lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openem=
bedded.org</a> wrote:<br>
&gt; &gt; Hi Bruce,<br>
&gt; &gt;<br>
&gt; &gt; On Tue, Sep 15, 2026 at 05:50:36PM -0400, Bruce Ashfield via <a h=
ref=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">=
lists.openembedded.org</a> wrote:<br>
&gt; &gt;&gt; There&#39;s no second patch coming, it went to the yocto list=
 for BSPs!<br>
&gt; &gt;<br>
&gt; &gt; I don&#39;t see the yocto-bsp side patch in <a href=3D"https://li=
sts.yoctoproject.org/g/poky/messages" rel=3D"noreferrer" target=3D"_blank">=
https://lists.yoctoproject.org/g/poky/messages</a> list<br>
&gt; &gt; archives. Same was with previous kernel update series.<br>
&gt; &gt;<br>
&gt; &gt; Maybe they just went to Richard directly?<br>
&gt; <br>
&gt; It was sent the yocto list:<br>
&gt; <a href=3D"https://lore.kernel.org/r/20260915214911.1095011-1-bruce.as=
hfield@gmail.com" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.=
org/r/20260915214911.1095011-1-bruce.ashfield@gmail.com</a><br>
<br>
Right. I can see where the confusion comes from. meta-yocto README.md says<=
br>
that patches to meta-yocto/meta-poky/meta-yocto-bsp should go to<br>
<a href=3D"mailto:poky@lists.yoctoproject.org" target=3D"_blank">poky@lists=
.yoctoproject.org</a>. Maybe yocto@ is a better match and the<br>
docs need to be updated. Not much left of &quot;poky&quot;...<br></blockquo=
te><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:smal=
l">I send those based on a 15 year old text file that refreshes my memory a=
nd</div><div class=3D"gmail_default" style=3D"font-size:small">probably a 5=
 year old shell history :)</div><div class=3D"gmail_default" style=3D"font-=
size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small=
">I&#39;ve mainly always sent them there.</div><div class=3D"gmail_default"=
 style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"=
font-size:small">I can send them anywhere, and can also update the upstream=
 docs. The</div><div class=3D"gmail_default" style=3D"font-size:small">lowe=
st friction option is probably for me to just send the to poky@, if Richard=
</div><div class=3D"gmail_default" style=3D"font-size:small">or Antonin hav=
e a preference, I&#39;ll do that.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
-Mikko<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--00000000000066a80d065b9a661e--

