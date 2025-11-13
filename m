Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A1ECD98CA
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 18:41:12 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68.1763059266220698174
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 10:41:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mw47PrS3;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-640d43060d2so1061372d50.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 10:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763059265; x=1763664065; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SfSBKqPXmcWWBpL+5frVb9BKKLNzrlpSEg1rDHLahxg=;
        b=Mw47PrS3N4cmT91iDy4196Qr7uUmKLJwWRQNcYvo4FgAG1UtlE2fv5i4OvcIQFE3sP
         dMzmFft74P6VxeN1X4L17vBHmKwcwoR/oECQxJFnCtp8AuUAoon/RD1ZC4lgEUdMVJYN
         mhV+dfLkHU/zvWC3NQLxFuToQl1c/PdnMT/28UCZXaXL61eVoWq29MNdleaBFVK+picN
         u5+WzXjaBoF06sij4Gx3eWA2DudUfQ5P6wl8t5h1OeA6v8Dt+u/3NJ/0DoYhgRU4TfYa
         DwTog8V3d91jiD+893K+w71GEkbBkFMBilM7oL7+hi13b5QQ3M80k5Mk0mq6WrPf4XTe
         o75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763059265; x=1763664065;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfSBKqPXmcWWBpL+5frVb9BKKLNzrlpSEg1rDHLahxg=;
        b=bZHVGJ8Vk3r4kTkMW/UdyqvL30QCXqdHqE0gw2VbccEuCA5t+l6lNp2AD1oryEYyne
         Y4gvNJ6YGY3zfcqd5kJNJq/uAmUk/4nKRMZ3wcaHliO07hQkMCajRYr+tymMf2NTelp7
         vpAuWUBx7Ee0bflMrBVjCi/GZCGZ6JYNNUgaTmoamGZOOJz7fIkaglmg3swtk6rsTsua
         /PTYlMKrDNVeedRohDPQgIxh6kYXmk+Ox6XZ2cHPZVP6QXjWN4+vIu2mkCgmeZeqXx12
         bs5c9H/IrDPS/Xs5qlRGwdF7rvs+rVvgH7GLPQxt8s4f/eQxSrCYO9fHCK3DTApqyXqM
         ObSw==
X-Forwarded-Encrypted: i=1; AJvYcCX3gkSm8TKTxGc085tc1r+zibo7Ciurq4fgYF4qW/AP9fr3O2qmEROH7ktTnhVrE2zjRKVFgvB9F3HWIQK9ICwQ6w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxKbwtYkSRwNHV0OAOkS3s13eTKF+u4GVymqnujejOrOzF6+NnU
	HSsmbPoC74U1/shmpY9h5PRUetzs4QmkBzuTNzlGj+S8YUpCnzrM02fIhJYsgMfh/ZR/qKpEGea
	rxU4XsD+MpNt7vYk/8fs2NFAB68WptEQ=
X-Gm-Gg: ASbGncv7a4x1alJkpKb6mZce2H1lGE7pEOLsg8dYfH0XvQl8bqqnHaSh1ldfjDLabUL
	fg603AShJ9mTVm4xDYmgXzTma7jhE8rakbCWMiu64vmVstJQ8Yb3Y5E1SIfXho4ZEm9jfu0Hn1Y
	d4HtnOH0oi1LUVH38mDfhHWKUn+PYRwt6HnT7EFAawy86FzBdQzGeWOevKYH4OcQDSMWinIaFGf
	J4Q5H2V8qj7sfTYGPVnAFI76sdByWJjD2Vm/5F4YrKkgdxYApbABx9bjQnMw8F9qWEW5Nvvnbda
	q3bf1KW8EBgEjOp49u08Yi+s7gHqaQeuNnhdbpvjgdKmHStuQdjX7pUBpWqN9HLNUKOrJdM2LzN
	8HnRMzNMfKuN4g+SBEuCKLBtuvXYItlQFGaifLUdJuA==
X-Google-Smtp-Source: AGHT+IHc42iIqgvWSWfqxezxAfON12HLPnBsiySAf302MU6IyVkjwkdGSxrRTClFL+Wqmi9cvPNiy1HhvHWeu0OGvIA=
X-Received: by 2002:a05:690e:2457:b0:63f:b634:4224 with SMTP id
 956f58d0204a3-641e74eac41mr298677d50.21.1763059264994; Thu, 13 Nov 2025
 10:41:04 -0800 (PST)
MIME-Version: 1.0
References: <20251107040923.4127069-1-namanj1@kpit.com> <CAJdd5GZnHbXCuNn64rx4YnPmxJ27oERiuft1wRvDNbrgzR7kNQ@mail.gmail.com>
 <CALCkg5aME+dHccc+cwsftmzVRRPE05scn+8t0zU8H+K1punmCQ@mail.gmail.com>
In-Reply-To: <CALCkg5aME+dHccc+cwsftmzVRRPE05scn+8t0zU8H+K1punmCQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Nov 2025 10:40:38 -0800
X-Gm-Features: AWmQ_bmgTYvlvH6y5uThFtXJoUyZug4IVqizGhPLV1eWnQXjRVrsIBEvr7NEEU4
Message-ID: <CAMKF1sp65MLmeZVHogTZB6QYSq-kthnKjiT=uXmP9W8k1LRAgw@mail.gmail.com>
Subject: Re: [OE-core] [meta][master][PATCH] socat: Update LICENSE field
To: Naman Jain <nmjain23@gmail.com>
Cc: Joshua Watt <jpewhacker@gmail.com>, naman.jain@kpit.com, 
	openembedded-core@lists.openembedded.org, 
	Virendra Thakur <virendra.thakur@kpit.com>
Content-Type: multipart/alternative; boundary="0000000000003541b906437e39a7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 18:41:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226257

--0000000000003541b906437e39a7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 5:17=E2=80=AFAM Naman Jain <nmjain23@gmail.com> wro=
te:

> Hello,
> I understand your point that `GPL-2.0-with-OpenSSL-exception` is generall=
y
> treated as a complete combined license, and that Yocto doesn=E2=80=99t ye=
t support
> the SPDX `WITH` operator. However, I=E2=80=99d like to highlight a simila=
r
> precedent in `cryptsetup`, where the license field is defined as:
>
> LICENSE =3D "LGPL-2.1-or-later & GPL-2.0-or-later &
> GPL-2.0-with-OpenSSL-exception"
> That was discussed @KhemRaj before being merged I have attached the
> conversation for the reference, and was accepted to reflect that the
> codebase includes both plain GPL components and parts linking against
> OpenSSL (covered by the exception variant).
> In our case, we are in a similar situation where both plain GPL-2.0 code
> and OpenSSL-linked code coexist. Therefore, expressing it as:
>
> LICENSE =3D "GPL-2.0-only & GPL-2.0-with-OpenSSL-exception"
>
> more accurately represents the license structure present in the source,
> even if `GPL-2.0-with-OpenSSL-exception` is itself a combined identifier.
>
> Looping in Khem Raj here (added in CC) for his thoughts as well.
>

I gave a similar response to Joshua's, I think we want to be fill in the
SPDX gap until then I don't think we need to change the current semantics.


>
> On Tue, 11 Nov, 2025, 12:48=E2=80=AFam Joshua Watt, <jpewhacker@gmail.com=
> wrote:
>
>> On Thu, Nov 6, 2025 at 9:09=E2=80=AFPM Naman Jain via lists.openembedded=
.org
>> <nmjain23=3Dgmail.com@lists.openembedded.org> wrote:
>> >
>> > The below reference clearly states that GPL-2.0-with-OpenSSL-exception
>> > is to be used with GPL 2.0 or GPL3.0 and not as a standalone license.
>> > Therefore, update the correct license.
>> >
>> > Reference:
>> >
>> https://github.com/aboutcode-org/scancode-licensedb/blob/569d72e13e7c8d1=
4a44380f91e80c5a2d4091f8f/docs/openssl-exception-gpl-2.0.yml#L7
>> >
>> > Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
>> > Signed-off-by: Naman Jain <namanj1@kpit.com>
>> > ---
>> >  meta/recipes-connectivity/socat/socat_1.8.0.3.bb | 5 +++--
>> >  1 file changed, 3 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/meta/recipes-connectivity/socat/socat_1.8.0.3.bb
>> b/meta/recipes-connectivity/socat/socat_1.8.0.3.bb
>> > index ee6ca1fe44..964af9d124 100644
>> > --- a/meta/recipes-connectivity/socat/socat_1.8.0.3.bb
>> > +++ b/meta/recipes-connectivity/socat/socat_1.8.0.3.bb
>> > @@ -5,9 +5,10 @@ HOMEPAGE =3D "http://www.dest-unreach.org/socat/"
>> >
>> >  SECTION =3D "console/network"
>> >
>> > -LICENSE =3D "GPL-2.0-with-OpenSSL-exception"
>> > +LICENSE =3D "GPL-2.0-only & GPL-2.0-with-OpenSSL-exception"
>>
>> I don't think & here is really correct. If we were doing this in
>> accordance with SPDX guidelines, it would be something like
>> "GPL-2.0-only WITH OpenSSL-exception" or similar, but we don't
>> (currently) support the WITH operator, or dsitinct license exceptions
>> in general. However, our "GPL-2.0-with-OpenSSL-exception" is not just
>> the exception (as scancode claims), but it is the complete license
>> text; it also isn't a SPDX license identifier. I'm not sure why
>> scancode is identifying as just the exception instead of the full
>> license with the exception, I'm pretty sure that's the problem here,
>> and adding in the GPL-2.0-only is not correct.
>>
>> >  LIC_FILES_CHKSUM =3D
>> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>> > -
>> file://README;beginline=3D248;endline=3D278;md5=3D338c05eadd013872abb1d6=
e198e10a3f"
>> > +
>> file://README;beginline=3D248;endline=3D278;md5=3D338c05eadd013872abb1d6=
e198e10a3f
>> \
>> > +
>> file://COPYING.OpenSSL;md5=3D5c9bccc77f67a8328ef4ebaf468116f4"
>> >
>> >  SRC_URI =3D "
>> http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
>> >             file://0001-fix-compile-procan.c-failed.patch \
>> > --
>> > 2.34.1
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#226007):
>> https://lists.openembedded.org/g/openembedded-core/message/226007
>> > Mute This Topic: https://lists.openembedded.org/mt/116166040/3616693
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[
>> JPEWhacker@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >
>>
>

--0000000000003541b906437e39a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 13,=
 2025 at 5:17=E2=80=AFAM Naman Jain &lt;<a href=3D"mailto:nmjain23@gmail.co=
m">nmjain23@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr">Hello,<br><div style=3D"border:0px;fo=
nt-variant-numeric:inherit;font-variant-east-asian:inherit;font-variant-alt=
ernates:inherit;font-stretch:inherit;font-size:12pt;line-height:inherit;fon=
t-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,san=
s-serif;font-size-adjust:inherit;font-kerning:inherit;font-feature-settings=
:inherit;margin:0px;padding:0px;vertical-align:baseline;color:black">I unde=
rstand your point that `GPL-2.0-with-OpenSSL-exception` is generally treate=
d as a complete combined license, and that Yocto doesn=E2=80=99t yet suppor=
t the SPDX `WITH` operator. However, I=E2=80=99d like to highlight a simila=
r precedent in `cryptsetup`, where the license field is defined as:<br><br>=
LICENSE =3D &quot;LGPL-2.1-or-later &amp; GPL-2.0-or-later &amp; GPL-2.0-wi=
th-OpenSSL-exception&quot;<br>That was discussed @KhemRaj before being merg=
ed I have attached the conversation for the reference, and was accepted to =
reflect that the codebase includes both plain GPL components and parts link=
ing against OpenSSL (covered by the exception variant).<br>In our case, we =
are in a similar situation where both plain GPL-2.0 code and OpenSSL-linked=
 code coexist. Therefore, expressing it as:<br><br>LICENSE =3D &quot;GPL-2.=
0-only &amp; GPL-2.0-with-OpenSSL-exception&quot;<br><br>more accurately re=
presents the license structure present in the source, even if `GPL-2.0-with=
-OpenSSL-exception` is itself a combined identifier.<br><br>Looping in Khem=
 Raj here (added in CC) for his thoughts as well.</div></div></blockquote><=
div><br></div><div>I gave a similar response to Joshua&#39;s, I think we wa=
nt to be fill in the SPDX gap until then I don&#39;t think we need to chang=
e the current semantics.</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div dir=3D"auto"><div dir=3D"auto"></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 11 Nov, 2=
025, 12:48=E2=80=AFam Joshua Watt, &lt;<a href=3D"mailto:jpewhacker@gmail.c=
om" rel=3D"noreferrer" target=3D"_blank">jpewhacker@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Nov 6,=
 2025 at 9:09=E2=80=AFPM Naman Jain via <a href=3D"http://lists.openembedde=
d.org" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">lists.ope=
nembedded.org</a><br>
&lt;nmjain23=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">gmail.com@lists.openembedded.org</a=
>&gt; wrote:<br>
&gt;<br>
&gt; The below reference clearly states that GPL-2.0-with-OpenSSL-exception=
<br>
&gt; is to be used with GPL 2.0 or GPL3.0 and not as a standalone license.<=
br>
&gt; Therefore, update the correct license.<br>
&gt;<br>
&gt; Reference:<br>
&gt; <a href=3D"https://github.com/aboutcode-org/scancode-licensedb/blob/56=
9d72e13e7c8d14a44380f91e80c5a2d4091f8f/docs/openssl-exception-gpl-2.0.yml#L=
7" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://githu=
b.com/aboutcode-org/scancode-licensedb/blob/569d72e13e7c8d14a44380f91e80c5a=
2d4091f8f/docs/openssl-exception-gpl-2.0.yml#L7</a><br>
&gt;<br>
&gt; Signed-off-by: Virendra Thakur &lt;<a href=3D"mailto:virendra.thakur@k=
pit.com" rel=3D"noreferrer noreferrer" target=3D"_blank">virendra.thakur@kp=
it.com</a>&gt;<br>
&gt; Signed-off-by: Naman Jain &lt;<a href=3D"mailto:namanj1@kpit.com" rel=
=3D"noreferrer noreferrer" target=3D"_blank">namanj1@kpit.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-connectivity/socat/<a href=3D"http://socat_1.8.0.3.=
bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">socat_1.8.0.=
3.bb</a> | 5 +++--<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-connectivity/socat/<a href=3D"http://socat_1=
.8.0.3.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">socat=
_1.8.0.3.bb</a> b/meta/recipes-connectivity/socat/<a href=3D"http://socat_1=
.8.0.3.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">socat=
_1.8.0.3.bb</a><br>
&gt; index ee6ca1fe44..964af9d124 100644<br>
&gt; --- a/meta/recipes-connectivity/socat/<a href=3D"http://socat_1.8.0.3.=
bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">socat_1.8.0.=
3.bb</a><br>
&gt; +++ b/meta/recipes-connectivity/socat/<a href=3D"http://socat_1.8.0.3.=
bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">socat_1.8.0.=
3.bb</a><br>
&gt; @@ -5,9 +5,10 @@ HOMEPAGE =3D &quot;<a href=3D"http://www.dest-unreach=
.org/socat/" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">htt=
p://www.dest-unreach.org/socat/</a>&quot;<br>
&gt;<br>
&gt;=C2=A0 SECTION =3D &quot;console/network&quot;<br>
&gt;<br>
&gt; -LICENSE =3D &quot;GPL-2.0-with-OpenSSL-exception&quot;<br>
&gt; +LICENSE =3D &quot;GPL-2.0-only &amp; GPL-2.0-with-OpenSSL-exception&q=
uot;<br>
<br>
I don&#39;t think &amp; here is really correct. If we were doing this in<br=
>
accordance with SPDX guidelines, it would be something like<br>
&quot;GPL-2.0-only WITH OpenSSL-exception&quot; or similar, but we don&#39;=
t<br>
(currently) support the WITH operator, or dsitinct license exceptions<br>
in general. However, our &quot;GPL-2.0-with-OpenSSL-exception&quot; is not =
just<br>
the exception (as scancode claims), but it is the complete license<br>
text; it also isn&#39;t a SPDX license identifier. I&#39;m not sure why<br>
scancode is identifying as just the exception instead of the full<br>
license with the exception, I&#39;m pretty sure that&#39;s the problem here=
,<br>
and adding in the GPL-2.0-only is not correct.<br>
<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce4=
486a80fdaf4a4263 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://README;beginline=3D248;endline=3D278;md5=3D338c05eadd013872abb1d6e1=
98e10a3f&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://README;beginline=3D248;endline=3D278;md5=3D338c05eadd013872abb1d6e1=
98e10a3f \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://COPYING.OpenSSL;md5=3D5c9bccc77f67a8328ef4ebaf468116f4&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"http://www.dest-unreach.org/socat/d=
ownload/socat-$%7BPV%7D.tar.bz2" rel=3D"noreferrer noreferrer noreferrer" t=
arget=3D"_blank">http://www.dest-unreach.org/socat/download/socat-${PV}.tar=
.bz2</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-fix-compile=
-procan.c-failed.patch \<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#226007): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/226007" rel=3D"noreferrer noreferrer noreferre=
r" target=3D"_blank">https://lists.openembedded.org/g/openembedded-core/mes=
sage/226007</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11616604=
0/3616693" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https=
://lists.openembedded.org/mt/116166040/3616693</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">openembedded-cor=
e+owner@lists.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">http=
s://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto=
:JPEWhacker@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">JPEW=
hacker@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>
</blockquote></div></div>

--0000000000003541b906437e39a7--

