Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E42CDB482
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 11:55:00 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web10.25713.1697716496675035575
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 04:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YGWwg11i;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4584e93ca8bso1118356137.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 04:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697716496; x=1698321296; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tWFbcwpQH0DaZGXQasagjYrHB1BztsyYLjlQhc/rHgY=;
        b=YGWwg11iLbtB1iMVOmZyC4UhJ05cMJIHmGhDmBPBZKDBQ0ChwcjzQEK+8Aum8IMvp9
         NO7LdTWXfGWfzCDwWTk5msJXToQ8+uB5BvQLWMtpJ997BBQc99RA8lvwVl6BVb5XawwR
         TyMGaqUnUBgABR78vLX2G4rA2VeHMV7TI3Om0xvnZgtnVRX49vQ1hzzMewtJq7/JQMvk
         dAuTx/HIYuc3dmtn8Qdurk0vDNQLJGisOWFZK5udJ+nnI9opxZeSQd+K5auB4O/O/3+Z
         lEJy8YjvN1ro9TgU1IuYKRomJFnAepuy/RYez+1gtQQaxxY3pnIloBCr2FLqnMt0q1z8
         UReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697716496; x=1698321296;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tWFbcwpQH0DaZGXQasagjYrHB1BztsyYLjlQhc/rHgY=;
        b=IBx0cMD/hFT6z+jKg6IevoTOcaEEzudbu40wWYhbFsjMbTAC9K5gOZ53O8eLbKLu+P
         76HXYErhwbDkUQxapeLFZcoG0maJK7VsrS2I4cLSKVnZNXi6asvKlA+fuP2QiK+xvPRO
         RCOo2rA+BHp6ZvDJyLiTaaadJRYfnzKg1DGl+Ptgia8bvrBccQ1Zq+FrX9mGD4LOD+cP
         WwsvMjo004BYTUE+JDkIEQcSUCfNNw0/FHcO8Op7vwpX0wcj9dXx4dsDvXewUs6+71ta
         FteyctwZUgH9tnGFhmq8Gu/3xxmn2NSoXaGhgmyVVhv/z+AhtC1dD/+mkbzd+duZod+d
         eLbw==
X-Gm-Message-State: AOJu0YwAV1tc8K0xkRt5qcxN4pdxhSxMxTxHkRb2KfmExRau+qnbmvEY
	QcR4LHxCLd9EFuShKHC7ItNLs0G6MLoXy6Jnk04=
X-Google-Smtp-Source: AGHT+IG6aL3Q9LKwUyaaG/5EAvxwA+O2AZ3+f5sBPZNSja8P050CSQHrQSEl2RGRpf3VnIXRNdBk0tNRc4hbUtvbiuw=
X-Received: by 2002:a67:c105:0:b0:455:e14e:79f6 with SMTP id
 d5-20020a67c105000000b00455e14e79f6mr1814883vsj.7.1697716495671; Thu, 19 Oct
 2023 04:54:55 -0700 (PDT)
MIME-Version: 1.0
References: <20231016070106.2772303-1-mikko.rapeli@linaro.org>
 <CAApg2=SGxxCJ1yuXoMD6=ySRsL-Z2=rENw6xxn-dpQZ-Ta+4rA@mail.gmail.com> <ZTDzOs9PFGJUmIRG@nuoska>
In-Reply-To: <ZTDzOs9PFGJUmIRG@nuoska>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 19 Oct 2023 12:54:44 +0100
Message-ID: <CANPvuRn1q0a63ZWyYer8LP0htmo7cBwyX6LTv_=ipZFcJq3j9Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-check.bbclass: support embedded SW
 components with different version number
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Marta Rybczynska <rybczynska@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a769080608106cd5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 11:55:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189448

--000000000000a769080608106cd5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

This change will need some adaptations in the create-spdx.bbclass to handle
this new variable with _PN

Jose

Mikko Rapeli <mikko.rapeli@linaro.org> escreveu no dia quinta, 19/10/2023
=C3=A0(s) 10:13:

> Hi,
>
> On Thu, Oct 19, 2023 at 10:19:53AM +0200, Marta Rybczynska wrote:
> > On Mon, Oct 16, 2023 at 9:01=E2=80=AFAM Mikko Rapeli <mikko.rapeli@lina=
ro.org>
> wrote:
> > >
> > > Many recipes embed other SW components. The name and version of the
> > > embedded SW component differs from the main recipe. To detect CVEs in
> the
> > > embedded SW component, it needs to be added to CVE_PRODUCT list using
> > > name of the SW product in CVE database or with "vendor:product" synta=
x.
> > > Then the version of the embedded SW component can be set using
> > > CVE_VERSION_product variable.
> > >
> > > For example in meta-arm, trusted-firmware-a embeds mbed_tls SW
> component.
> > > Thus trusted-firmware-a can add CVE_PRODUCT for it since CVE database
> > > uses product name "mbed_tls":
> > >
> > > CVE_PRODUCT +=3D "mbed_tls"
> > >
> > > and set the version of mbed_tls:
> > >
> > > CVE_VERSION_mbed_tls =3D "2.28.4"
> > >
> > > (Real patches for both are a bit more complex due to conditional buil=
d
> > > enabling mbed_tls support and due to mbed_tls version being set in an
> > > .inc file.)
> > >
> >
> > I like the support for embedded software. In this approach, I'm wonderi=
ng
> > how it would work for packages like curl that have multiple CPEs. Would
> we
> > need  to duplicate the list of CPEs?
>
> The current approach of listing multiple CPEs in CVE_PRODUCT still works.
> It's just possible to include a different version for an entry in
> CVE_PRODUCT
> via CVE_VERSION_swcomponent variable. It will fall back to PV.
>
> > There are layers/recipes where we have a very long list of embedded
> components,
> > meta-zephyr is probably the best example.
>
> Yes, I think this embedding of SW components is very common. I think some
> of the
> LICENSE data does reflect this but not in all cases.
>
> Cheers,
>
> -Mikko
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189437):
> https://lists.openembedded.org/g/openembedded-core/message/189437
> Mute This Topic: https://lists.openembedded.org/mt/101991269/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000a769080608106cd5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0<br><br>This change will need some adaptations=C2=
=A0in the create-spdx.bbclass to handle this new variable with _PN<br><br>J=
ose</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org">mikko.rapeli=
@linaro.org</a>&gt; escreveu no dia quinta, 19/10/2023 =C3=A0(s) 10:13:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
On Thu, Oct 19, 2023 at 10:19:53AM +0200, Marta Rybczynska wrote:<br>
&gt; On Mon, Oct 16, 2023 at 9:01=E2=80=AFAM Mikko Rapeli &lt;<a href=3D"ma=
ilto:mikko.rapeli@linaro.org" target=3D"_blank">mikko.rapeli@linaro.org</a>=
&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Many recipes embed other SW components. The name and version of t=
he<br>
&gt; &gt; embedded SW component differs from the main recipe. To detect CVE=
s in the<br>
&gt; &gt; embedded SW component, it needs to be added to CVE_PRODUCT list u=
sing<br>
&gt; &gt; name of the SW product in CVE database or with &quot;vendor:produ=
ct&quot; syntax.<br>
&gt; &gt; Then the version of the embedded SW component can be set using<br=
>
&gt; &gt; CVE_VERSION_product variable.<br>
&gt; &gt;<br>
&gt; &gt; For example in meta-arm, trusted-firmware-a embeds mbed_tls SW co=
mponent.<br>
&gt; &gt; Thus trusted-firmware-a can add CVE_PRODUCT for it since CVE data=
base<br>
&gt; &gt; uses product name &quot;mbed_tls&quot;:<br>
&gt; &gt;<br>
&gt; &gt; CVE_PRODUCT +=3D &quot;mbed_tls&quot;<br>
&gt; &gt;<br>
&gt; &gt; and set the version of mbed_tls:<br>
&gt; &gt;<br>
&gt; &gt; CVE_VERSION_mbed_tls =3D &quot;2.28.4&quot;<br>
&gt; &gt;<br>
&gt; &gt; (Real patches for both are a bit more complex due to conditional =
build<br>
&gt; &gt; enabling mbed_tls support and due to mbed_tls version being set i=
n an<br>
&gt; &gt; .inc file.)<br>
&gt; &gt;<br>
&gt; <br>
&gt; I like the support for embedded software. In this approach, I&#39;m wo=
ndering<br>
&gt; how it would work for packages like curl that have multiple CPEs. Woul=
d we<br>
&gt; need=C2=A0 to duplicate the list of CPEs?<br>
<br>
The current approach of listing multiple CPEs in CVE_PRODUCT still works.<b=
r>
It&#39;s just possible to include a different version for an entry in CVE_P=
RODUCT<br>
via CVE_VERSION_swcomponent variable. It will fall back to PV.<br>
<br>
&gt; There are layers/recipes where we have a very long list of embedded co=
mponents,<br>
&gt; meta-zephyr is probably the best example.<br>
<br>
Yes, I think this embedding of SW components is very common. I think some o=
f the<br>
LICENSE data does reflect this but not in all cases.<br>
<br>
Cheers,<br>
<br>
-Mikko<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#189437): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/189437" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/189437</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101991269/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101991269/5052612</a><br>
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
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div>

--000000000000a769080608106cd5--

