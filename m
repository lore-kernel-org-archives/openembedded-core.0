Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 535E1C43458
	for <webhook@archiver.kernel.org>; Sat, 27 Jun 2026 02:33:53 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48730.1782527629357510909
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 19:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sfTieddP;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-662bf1dab83so2366478d50.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 19:33:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782527628; cv=none;
        d=google.com; s=arc-20260327;
        b=c+PAX7ql04Iy64L+e84+yGNzrPoPaNloXPVnyCTPtmOGoBxlejqXX4NEUxSw6Gfj2T
         Mw478GUtODZTu+w7BuZLhhH41oz0TX7FSgYw0+RB8onShFfwBCBFb3gco2t2oYYqZmFq
         GNQjPNulcpBOJQ+pMlDuAJUVk3DqkutQvzexFYB3G1S6vm0468pQQSEkuLftoD1J69Xz
         arm2O3mYSKxf6P9qXPAFccAcX+UlTrll6Db0BikwFvL5Hp6bdESuZXkvYfF62XiZrbat
         jRMmqrbAw3cPD1qAncspnkXLf2xWs930OfdP5BeO7XWw1NTnnDm9O1AuFr8AhGXKuhpg
         3GtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2BAW61myW0jE40jNXyZ8I2RhsdBAd+8vIfWtSz8+n+M=;
        fh=OYvjgV8KjTR6n7AUt2AXAVijcUU60yfsBynpyZymrwk=;
        b=B/LX1gbVVJhxu8z4PTfzQq9tP5BXRU7oxMoX7NMjOgdHaSmxIDrxhSv/yeARCEs1+O
         TAe6N2iavFUlug04uZvjpcNsM6+ARv0KgucUhYjnYX2sXL5sRm4/jjYQAbl7dBzSvo/v
         pOyEHB6Xjo57qd1y2tytcppY/n5CNq6kdwu8LTHKZQu1nl1axay+QSwW2wK544zVZhAR
         CXh9UvqNAe3fQFbDwyAlJenrszPaDFIs/c9i+xQ4sBSJtPqtYJrFAtCwBVjx1C+2qeP5
         /chQxWBYIwAtBds9vc0B7H2IUfcWdU4GjroSNZPTRIURzYkyooyxk9f1+Z7fioHZpmXo
         qqjg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782527628; x=1783132428; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2BAW61myW0jE40jNXyZ8I2RhsdBAd+8vIfWtSz8+n+M=;
        b=sfTieddPhwWGa8hXWHGxjaoyAI4RZr3vR+F1gUIQMxixFtNY/PvQXCiVnW0qSfZ2Fx
         vfRZly6ikpHLUSz6MhasTpCJ+OwRRIY5cAxhiD4+cnX+K6m+2BzOlSnI+Wn0sRxO4mnF
         eA1SBFeDM0WY8Af1fmyheUplFxeIitL49AAa5tQOZStJd65eFGSMlBXkIck1SsS4lAYD
         lYJkpRgt9h0PtqtV8GZSUNFb52WgAQ7o5KrjUhwaEaw+9vHlog+nke8xNMpn8RSe/dT7
         KTHF54bg1Ncu/lvdtHCohapqA5z13gLZJ8T6vumTbDAHVkwqlIiZWaUNqn4+d+8EdTBq
         C+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782527628; x=1783132428;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BAW61myW0jE40jNXyZ8I2RhsdBAd+8vIfWtSz8+n+M=;
        b=olzQOKcQGnC0Tr981warrSLpJXinOty74QV+hP9xVUjQuizb3IB2/50y7c1S+GDg+O
         PQYbzMcDprpFb0vTw3b6Nbk3Ur28Lpgv6k0LhtE7Sk8tniwmvPNF00t77o2ATwS5uXDt
         +o4Qsy1Mr2KbAhGELG25XN8QJdDwXnTvQ5UUfudqXSEwDulswyTbNulEihGO7Hskn5u+
         KdpAtuN7IF/YJKYPNg2kiwanbBzSXzE8YqcFjoA6JN2U3rzjXADNF63vBSuclySbwKli
         vLJXOfSFzW+FPRlfoTu12LPryBfFo6idTeOOqJKhp3g2eoyoni024Zv2qFY0Vn6fizcZ
         tpXw==
X-Forwarded-Encrypted: i=1; AHgh+RoYWp1ri14G+/H7iQaf9clDK/PJZ99oF3XgSrj8AIrWDro/Q/QY7sYZnr2JZ/7PoVTN65ML4Q9w4RtLPJ0yPy4O3A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwoS+Q6S3nfOmHVCqvVRkhNx6dbfNbqTp1a3yCg4qzp0cENU0Jd
	cyhRuZeFDY9fAbZH5tNNUYpUUFU+JatkvpTwk68IM6zCMElwu52R6qOK/ruD2ueNtAURXv1gaMd
	iujuob1hZ9Od8gOcksFUgzjXGGU5b1Wo=
X-Gm-Gg: AfdE7clLKjEk5mjfJj9XxcAyOU0JNatpKLc2m4R3tuhZ0ttnaAQszfxrlgY9IYs7rOD
	HZf9qYGH+bJRLbS7V9nElPlc1bIcSWCbwHvJ0WeKc/TDWkKv3c6Iz4OgKy5/cWHtiJUvK34K53D
	GLSzkMX548ege+QmzIkp6Ka50OK73cHy3uSWGPOF0qPpJO434i1W1hlAX6P8QaR8uYG9hqUbQZS
	+K1aLMbzG9IK/+NgXGMpAK+FjVIGxykmvyi8eqY0VecZen88vQxjwq/HAeGwoduv0H583OeH9Z9
	APTlZ0nVNVrdmJwAQhazDvhgogHqEgihp12e8rd26XbZlOH3/QDnRrS4Q+5s86EbIBdZyo2cXTL
	U1FsqJgDFTmUJul7s6sMDkSQvyvTZA1knK8Q/d6E5qtLxLErI1pTNdQwUNRp7UlMfwVdN78M=
X-Received: by 2002:a53:e030:0:b0:664:ae6d:ad31 with SMTP id
 956f58d0204a3-664ae6dae8emr2209339d50.75.1782527628383; Fri, 26 Jun 2026
 19:33:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260625133120.2111653-1-luca.fancellu@arm.com>
 <CANNYZj8L9c48wTyEp38RkCMzi=XQQS9_rr++KJwZvk2fSuTHeQ@mail.gmail.com>
 <60267670-C3C0-4448-B2D8-B7B60E7297D3@arm.com> <CANNYZj8jarNnjjVLhW-F7guAz359G6MV5bfod-5VqXqZmi_F-w@mail.gmail.com>
 <6D639B9F-A286-4011-88EF-0A485F66B56E@arm.com> <CANNYZj_BLf8RC6-xn9iU3EomsOE=9meeR-bku-+vcX5qAMDy-Q@mail.gmail.com>
In-Reply-To: <CANNYZj_BLf8RC6-xn9iU3EomsOE=9meeR-bku-+vcX5qAMDy-Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 26 Jun 2026 19:33:22 -0700
X-Gm-Features: AVVi8CdPnqpQPnKCWWR817ENVJcdgrQesSocogifEEIZxVpBJf5shk0vrlPJw4Y
Message-ID: <CAMKF1soVU9viw=0RpMjYh8y=PDvzz9eocGmdp57eQB9q5LVjHA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] llvm: Enable MLIR support
To: alex.kanavin@gmail.com
Cc: Luca Fancellu <Luca.Fancellu@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001799090655330edb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 02:33:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239672

--0000000000001799090655330edb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 8:51=E2=80=AFAM Alexander Kanavin via lists.openemb=
edded.org
<alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:

> On Fri, 26 Jun 2026 at 16:55, Luca Fancellu <Luca.Fancellu@arm.com> wrote=
:
> > On the production usage: I cannot point to a public OpenEmbedded/Yocto
> layer
> > today. The concrete use case that triggered this work is not public yet=
,
> and I
> > am not aware of another public layer consuming LLVM MLIR at the moment,
> so I do
> > not want to overstate that part.
> >
> > I still think oe-core is the right place for this because it is an
> optional,
> > standalone recipe for a component from the same llvm-project source tre=
e
> that
> > oe-core already provides. If the lack of a public production consumer
> makes it
> > premature, I can hold the patch back until such a consumer is available=
.
> > Otherwise I will send a v2 with the expanded commit message and selftes=
t
> > coverage.
>
> You should send a v2, so it gets a full review. Whether oe-core should
> carry something that technically belongs in oe-core, but has no open
> source consumers is a question for the openembedded technical steering
> committee. My personal take (and I'm not in the TSC) is that the
> situation is fundamentally unfair: this pushes the maintenance burden
> onto the openembedded community (for example, when this recipe fails
> to build or fails to pass its test on clang version bump or other
> changes), while the benefits are kept to this proprietary, secretive
> project that you're involved in. If/when there's a public consumer,
> this would tilt the balance clearly in favour.
>

This is a reasonable thing, consumers would come in open or proprietary
tools that we might not be aware of. FWIW It will enable OE to build mojo
ML compiler infrastructure, which would be a good demonstration of its need=
.
Anyone up for meta-mojo ?


>
> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#239652):
> https://lists.openembedded.org/g/openembedded-core/message/239652
> Mute This Topic: https://lists.openembedded.org/mt/119973309/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000001799090655330edb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 26,=
 2026 at 8:51=E2=80=AFAM Alexander Kanavin via <a href=3D"http://lists.open=
embedded.org">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mail=
to:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri=
, 26 Jun 2026 at 16:55, Luca Fancellu &lt;<a href=3D"mailto:Luca.Fancellu@a=
rm.com" target=3D"_blank">Luca.Fancellu@arm.com</a>&gt; wrote:<br>
&gt; On the production usage: I cannot point to a public OpenEmbedded/Yocto=
 layer<br>
&gt; today. The concrete use case that triggered this work is not public ye=
t, and I<br>
&gt; am not aware of another public layer consuming LLVM MLIR at the moment=
, so I do<br>
&gt; not want to overstate that part.<br>
&gt;<br>
&gt; I still think oe-core is the right place for this because it is an opt=
ional,<br>
&gt; standalone recipe for a component from the same llvm-project source tr=
ee that<br>
&gt; oe-core already provides. If the lack of a public production consumer =
makes it<br>
&gt; premature, I can hold the patch back until such a consumer is availabl=
e.<br>
&gt; Otherwise I will send a v2 with the expanded commit message and selfte=
st<br>
&gt; coverage.<br>
<br>
You should send a v2, so it gets a full review. Whether oe-core should<br>
carry something that technically belongs in oe-core, but has no open<br>
source consumers is a question for the openembedded technical steering<br>
committee. My personal take (and I&#39;m not in the TSC) is that the<br>
situation is fundamentally unfair: this pushes the maintenance burden<br>
onto the openembedded community (for example, when this recipe fails<br>
to build or fails to pass its test on clang version bump or other<br>
changes), while the benefits are kept to this proprietary, secretive<br>
project that you&#39;re involved in. If/when there&#39;s a public consumer,=
<br>
this would tilt the balance clearly in favour.<br></blockquote><div><br></d=
iv><div>This is a reasonable thing, consumers would come in open or proprie=
tary</div><div>tools that we might not be aware of. FWIW It will enable OE =
to build mojo</div><div>ML compiler infrastructure, which would be a good d=
emonstration of its need.</div><div>Anyone up for meta-mojo ?</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Alex<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#239652): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/239652" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/239652</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119973309/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119973309/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000001799090655330edb--

