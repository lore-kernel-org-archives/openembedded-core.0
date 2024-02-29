Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0567CC54E41
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 15:39:24 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.28008.1709221154494714250
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Feb 2024 07:39:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W20/P5I3;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-608841dfcafso11018377b3.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 07:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709221153; x=1709825953; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t1iXSbfQEucSvPy6XhvEkihGhUo/ZaZ74IWJ4bjqm+c=;
        b=W20/P5I3IB9La6qUh2bvmpxYh0tak8CzHPMqxyrheS0ZIlV++WKN/xH445xxrDp2ib
         w+i/f8GNq66rukHtrGMKha1pXpytOtZIOa2wcXPkXLVDZLsM6rGl0TQjfaY5486W4ccA
         mHk+2wpWCVptCd+7hCIvPvATCs58NMx5GWv+JZICkfwChYXq0GHQRmfxLgMfpyUthB+R
         UBe25Hucyeulsfezt5/bd+WA4XC+7n1P+PmyAQF2MfDeQwSxGgnP5i4QTf1NcYMIpse/
         gs5G3/3BHGDIhoGQvapHUE0qG8ceg4oz60mSjPkEqEMt7BJpnaqWWyCDAapgxMToYoju
         nFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709221153; x=1709825953;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t1iXSbfQEucSvPy6XhvEkihGhUo/ZaZ74IWJ4bjqm+c=;
        b=hu0TSkbEBuscwmGdYPvMftC2nTtSmuel8wHGVHXpOFKA/AjwISyFypreMeN2bbo+vV
         lK9CBLqfz9LZ4xPdW3xcDmwEibcclaXJrRYGTKNhMVVCeuW8uMhfeMUZ4zsHgYGmwGs0
         ltfv4sz+lrYMIAl1ILs0ZBGesFDnWn6iwAaeIVf1hgnVFbTwHQB9WDSX5XT/eQnV0kFY
         2KEf3qA6xjidmgtaHan5Uu8eSZFUW7QTMsb4jwXmGdSQ4SxmDeAhuh3uZJJgmd3DHdfY
         GkQAL2RQ3s6EEdF5+NOEHLOaKJWMkG/z7ZiK1UeBlIWgaDtv65uwastt+dqJ+q2xBfPt
         A5TA==
X-Forwarded-Encrypted: i=1; AJvYcCWJFUpspLaizsmHI22Ji1wk+EsS7ol1onA811PFD+csUUm1yAqsLahjBjXOHT8+PsW8kVXfNRi9QOwkXxEHl1Lx8mKE/eNzWfjmlZn7GpryWRZySb4BFRAP
X-Gm-Message-State: AOJu0YyZOmmenUD20h9I0ORq5FQlK7MCPjSL4iZC8lNFH6TUxkcZvTRE
	4SgQc29OMZ4eoREBeTfjDOZ/jrjYXkWdzWGQKehm5KleiPeozNIYOkk7gGb4GM6krLyrV4KJck9
	vyvid9Z2ytijaCSX846Gge9FXgxE=
X-Google-Smtp-Source: AGHT+IFyosrHvmHNdZU+NO0evXKKpENk/75/ak8+CQ3Oa7gr310GBQ0V/fOufg/ZWh9uOwpP5phMGGOiMPBjwl4S76A=
X-Received: by 2002:a81:4c41:0:b0:608:dc99:b217 with SMTP id
 z62-20020a814c41000000b00608dc99b217mr2334322ywa.50.1709221153653; Thu, 29
 Feb 2024 07:39:13 -0800 (PST)
MIME-Version: 1.0
References: <685fc5b84a11e8b42335588118052ed0d3bf21f3.camel@linuxfoundation.org>
In-Reply-To: <685fc5b84a11e8b42335588118052ed0d3bf21f3.camel@linuxfoundation.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 29 Feb 2024 07:39:02 -0800
Message-ID: <CANx9H-CqbyATjgz0=K0VeTtxiqM4Vu31itpJ33XRw6PapGsQEg@mail.gmail.com>
Subject: Re: [OE-core] python3-attrs - turn deadline off?
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Tim Orling <tim.orling@konsulko.com>, Trevor Gamblin <tgamblin@baylibre.com>, 
	Randy MacLeod <randy.macleod@windriver.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b4c9de0612870fb8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 15:39:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196437

--000000000000b4c9de0612870fb8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 12:25=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> I noticed this failures:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6139
>
> which leads to:
>
>
> http://autobuilder.yocto.io/pub/non-release/20240228-36/testresults/qemua=
rm64-ptest/python3-attrs.log
>
> which says:
>
> """
> Unreliable test timings! On an initial run, this test took 268.29ms,
> which exceeded the deadline of 200.00ms, but on a subsequent run it
> took 2.63 ms, which did not. If you expect this sort of variability in
> your test timings, consider turning deadlines off for this test by
> setting deadline=3DNone.
> """
>
> This warning is coming from python3-hypothesis, and is totally no obvious
from the test case itself
https://github.com/python-attrs/attrs/blob/23.2.0/tests/test_make.py#L1318C=
1-L1337C24

    @given(integers(), booleans())
    def test_converter_factory_property(self, val, init):
        """
        Property tests for attributes with converter, and a factory default=
.
        """
        C =3D make_class(
            "C",
            {
                "y": attr.ib(),
                "x": attr.ib(
                    init=3Dinit,
                    default=3DFactory(lambda: val),
                    converter=3Dlambda v: v + 1,
                ),
            },
        )
        c =3D C(2)

        assert c.x =3D=3D val + 1
        assert c.y =3D=3D 2

Related:
https://github.com/HypothesisWorks/hypothesis/issues/3713

Is there a setting we should be considering?
>
> Cheers,
>
> Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196420):
> https://lists.openembedded.org/g/openembedded-core/message/196420
> Mute This Topic: https://lists.openembedded.org/mt/104640034/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b4c9de0612870fb8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 29, 2024 at 12:25=E2=80=
=AFAM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.o=
rg">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">I noticed this failures:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/82/build=
s/6139" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/82/builds/6139</a><br>
<br>
which leads to:<br>
<br>
<a href=3D"http://autobuilder.yocto.io/pub/non-release/20240228-36/testresu=
lts/qemuarm64-ptest/python3-attrs.log" rel=3D"noreferrer" target=3D"_blank"=
>http://autobuilder.yocto.io/pub/non-release/20240228-36/testresults/qemuar=
m64-ptest/python3-attrs.log</a><br>
<br>
which says:<br>
<br>
&quot;&quot;&quot;<br>
Unreliable test timings! On an initial run, this test took 268.29ms,<br>
which exceeded the deadline of 200.00ms, but on a subsequent run it<br>
took 2.63 ms, which did not. If you expect this sort of variability in<br>
your test timings, consider turning deadlines off for this test by<br>
setting deadline=3DNone.<br>
&quot;&quot;&quot;<br>
<br></blockquote><div>This warning is coming from python3-hypothesis, and i=
s totally no obvious from the test case itself=C2=A0</div><div><a href=3D"h=
ttps://github.com/python-attrs/attrs/blob/23.2.0/tests/test_make.py#L1318C1=
-L1337C24">https://github.com/python-attrs/attrs/blob/23.2.0/tests/test_mak=
e.py#L1318C1-L1337C24</a><br></div><div><br></div><div>=C2=A0 =C2=A0 @given=
(integers(), booleans())<br>=C2=A0 =C2=A0 def test_converter_factory_proper=
ty(self, val, init):<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Property tests for attributes with converter, a=
nd a factory default.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 C =3D make_class(<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;C&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;y&qu=
ot;: attr.ib(),<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
&quot;x&quot;: attr.ib(<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 init=3Dinit,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default=3DFactory(lambda: val),<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 converte=
r=3Dlambda v: v + 1,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ),<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 )<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 c =3D C(2)<br><br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 assert c.x =3D=3D val + 1<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
assert c.y =3D=3D 2<br></div><div><br></div><div>Related:</div><div><a href=
=3D"https://github.com/HypothesisWorks/hypothesis/issues/3713">https://gith=
ub.com/HypothesisWorks/hypothesis/issues/3713</a><br></div><div><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
Is there a setting we should be considering?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#196420): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/196420" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/196420</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104640034/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/104640034/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000b4c9de0612870fb8--

