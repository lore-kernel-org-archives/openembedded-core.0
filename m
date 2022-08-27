Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 968ADC0502C
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 08:30:01 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web08.47317.1661588994256262337
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 01:29:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m39u+h4Q;
 spf=pass (domain: gmail.com, ip: 209.85.218.48,
 mailfrom: jan.vermaete@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id y3so6952927ejc.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 01:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=e5wNtQWBFsOBwMXEl/OFePUfInRbO2tpEFpeFrXkc1A=;
        b=m39u+h4QBRkHbbYXhmYP82Smc/auxac7ZLxj0eHBUMpF8cJk7qNiXjnS7uhPbg4tAg
         L0778yVP9cZUOoVkzMJ/KxjFlP0vtUO/tHzcP85SOhxlgUyvhbIsxNsKLAJCMI4hsMUL
         p0n0h5ID75Dg3uXNy0qNBkJMx0ZPBF6QrsubTCwAtYumbEL/kM84kXc9b0+rRJpbLLI2
         c76CYAASnZBZtcM6wOh2Ka2VJRqQdcjFaG/wLJ+9ns8LIp0QreHLFm4QIqSUOoNHWni3
         B2GI6y+yL5WIF7t7ncGbddx9H3rQlGkMC7Qx3OB4fr5PxEPg7Wi6cO3Mh7jjb6CM8bB7
         Yj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=e5wNtQWBFsOBwMXEl/OFePUfInRbO2tpEFpeFrXkc1A=;
        b=on81Er9Hu9dqdDEUJR5EP6C7mqc275PbKUEBppi0Gyljd+cFPaRo+c8rTJUj7BFHR3
         regc5lSlis3JXa8AmZtyivhfEssiw5QpeLsImM4wL/HWtpl0kXDek3vudYTPgiFrxWIr
         cRt3cbjRlkjTsQOyZHutx7ivLCPmfL7Dxo5b35KkkZhc9Sh1VcbxQ+FadnKHf24GFlI7
         9JWufMT0C4hOlRbjzp3/Eu/OCrBXBsipwb1aBdMyAMuFHlnRfIHsnDiXrjK2dcvmXCjV
         oMCy+IvL+wR//ug7OPJNseHG8OPwK+Qjmuy2HLawp1hpCo2m2RP98rqZlpDUgOg/IOxC
         ykIw==
X-Gm-Message-State: ACgBeo0Fjl9C+bIXTuMYGI/ldAkk6vJUmAz2tTovWY74rMjmqMpvi+fu
	Q5c/Jr0dmQ8GdJFdseBMyVhnznkOKfNyn8RteIQ=
X-Google-Smtp-Source: 
 AA6agR5R8n17B8449zZKYClZEJ5YDlwVH6bes7lx6wnWoYBuTkmnpEwDLI6gUalXuBF0I9Vf/rLirp6Q5dFKAxEYhU8=
X-Received: by 2002:a17:907:c24:b0:73d:7c20:cc45 with SMTP id
 ga36-20020a1709070c2400b0073d7c20cc45mr7887714ejc.294.1661588992574; Sat, 27
 Aug 2022 01:29:52 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CABF_=yi9-vQ4b-4qnOz+W5bbJmjRmk72YOog+GvDVBVyQ160+Q@mail.gmail.com>
 <CANNYZj-c97JgQnN-W3Ae3YzpWRGOO9hwO_xF0WDuoMsCaOwyKg@mail.gmail.com>
 <CABF_=yhQmn4Odw1wabzdS+_+D3tqpE0S6r6aCsuP9PbsudF9ow@mail.gmail.com>
 <CANNYZj8M+RfFmhPdM7caohuOtThORatkDZKuxL68xodDd_=v8w@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8M+RfFmhPdM7caohuOtThORatkDZKuxL68xodDd_=v8w@mail.gmail.com>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Sat, 27 Aug 2022 10:29:41 +0200
Message-ID: 
 <CABF_=yhbfxZG7tPnRX3iw3nmY8DE9MQHr3vV15okerxompoH1w@mail.gmail.com>
Subject: Re: [OE-core] makeself
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000aa4b0605e734d53c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 08:30:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169928

--000000000000aa4b0605e734d53c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

The recipe is currently in  master-next.
https://patchwork.yoctoproject.org/project/oe/patch/20220826195403.893639-1=
-jan.vermaete@gmail.com/

Could you review?
What I don't know is how to prove the executables used in the script of
makeself are those of yocto and not those of the host system.
E.g. zstd is used by the script as 'zstd' (
https://github.com/megastep/makeself/blob/master/makeself.sh#L535).
But zstd itself is set in the HOSTTOOLS of Yocto.

br

On Sat, Aug 13, 2022 at 4:28 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> meta-openembedded/meta-oe/recipes-devtools is fine I think.
>
> Alex
>
> On Sat, 13 Aug 2022 at 16:09, jan vermaete <jan.vermaete@gmail.com> wrote=
:
> >
> > fine for me, I'll do.
> >
> > But where to place it?
> >  * meta-openembedded/meta-oe/recipes-support
> >  * meta-openembedded/meta-oe/recipes-devtools
> >  * meta-openembedded/recipes-devtools
> >  * poky/meta/recipes-devtools/
> >
> > Jan,
> >
> >
> > On Sat, Aug 13, 2022 at 1:36 PM Alexander Kanavin <
> alex.kanavin@gmail.com> wrote:
> >>
> >> No need to ask. Make a patch, write a good commit message and send it =
:)
> >>
> >> Alex
> >>
> >> On Sat, 13 Aug 2022 at 12:11, Jan Vermaete <jan.vermaete@gmail.com>
> wrote:
> >> >
> >> > Could it be useful to transfer the makeself recipe from the no longe=
r
> maintained intel-iot-refkit into meta-openembedded?
> >> >
> >> >
> https://github.com/intel/intel-iot-refkit/blob/master/meta-refkit-core/re=
cipes-core/makeself/makeself_2.2.0.bb
> >> >
> >> > https://github.com/megastep/makeself
> >> >
> >> > It's useful as a native recipe to create self extracting installers
> for firmware updates, as an example.
> >> >
> >> > br,
> >> >
> >> > --
> >> > Jan Vermaete
> >> > =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary H=
amel
> >> >
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> > Links: You receive all messages sent to this group.
> >> > View/Reply Online (#169301):
> https://lists.openembedded.org/g/openembedded-core/message/169301
> >> > Mute This Topic: https://lists.openembedded.org/mt/92997365/1686489
> >> > Group Owner: openembedded-core+owner@lists.openembedded.org
> >> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsu=
b
> [alex.kanavin@gmail.com]
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> >
> >
> >
> >
> > --
> > Jan Vermaete
> > =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hame=
l
>


--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

--000000000000aa4b0605e734d53c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>The recipe is currently in=C2=A0 ma=
ster-next.</div><div><a href=3D"https://patchwork.yoctoproject.org/project/=
oe/patch/20220826195403.893639-1-jan.vermaete@gmail.com/">https://patchwork=
.yoctoproject.org/project/oe/patch/20220826195403.893639-1-jan.vermaete@gma=
il.com/</a><br></div><div><br></div><div>Could you review?</div><div>What I=
 don&#39;t know is how to prove the executables used in the script of makes=
elf are those of yocto and not those of the host system.</div><div>E.g. zst=
d is used by the script as &#39;zstd&#39; (<a href=3D"https://github.com/me=
gastep/makeself/blob/master/makeself.sh#L535">https://github.com/megastep/m=
akeself/blob/master/makeself.sh#L535</a>).</div><div>But zstd itself is set=
 in the HOSTTOOLS of Yocto.</div><div><br></div><div>br</div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Aug 13=
, 2022 at 4:28 PM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmai=
l.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">meta-openembedded/meta-oe/recipes-devtools is =
fine I think.<br>
<br>
Alex<br>
<br>
On Sat, 13 Aug 2022 at 16:09, jan vermaete &lt;<a href=3D"mailto:jan.vermae=
te@gmail.com" target=3D"_blank">jan.vermaete@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; fine for me, I&#39;ll do.<br>
&gt;<br>
&gt; But where to place it?<br>
&gt;=C2=A0 * meta-openembedded/meta-oe/recipes-support<br>
&gt;=C2=A0 * meta-openembedded/meta-oe/recipes-devtools<br>
&gt;=C2=A0 * meta-openembedded/recipes-devtools<br>
&gt;=C2=A0 * poky/meta/recipes-devtools/<br>
&gt;<br>
&gt; Jan,<br>
&gt;<br>
&gt;<br>
&gt; On Sat, Aug 13, 2022 at 1:36 PM Alexander Kanavin &lt;<a href=3D"mailt=
o:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; =
wrote:<br>
&gt;&gt;<br>
&gt;&gt; No need to ask. Make a patch, write a good commit message and send=
 it :)<br>
&gt;&gt;<br>
&gt;&gt; Alex<br>
&gt;&gt;<br>
&gt;&gt; On Sat, 13 Aug 2022 at 12:11, Jan Vermaete &lt;<a href=3D"mailto:j=
an.vermaete@gmail.com" target=3D"_blank">jan.vermaete@gmail.com</a>&gt; wro=
te:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Could it be useful to transfer the makeself recipe from the n=
o longer maintained intel-iot-refkit into meta-openembedded?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; <a href=3D"https://github.com/intel/intel-iot-refkit/blob/mas=
ter/meta-refkit-core/recipes-core/makeself/makeself_2.2.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/intel/intel-iot-refkit/blob/mast=
er/meta-refkit-core/recipes-core/makeself/makeself_2.2.0.bb</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; <a href=3D"https://github.com/megastep/makeself" rel=3D"noref=
errer" target=3D"_blank">https://github.com/megastep/makeself</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; It&#39;s useful as a native recipe to create self extracting =
installers for firmware updates, as an example.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; br,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; Jan Vermaete<br>
&gt;&gt; &gt; =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D --=
 Gary Hamel<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; &gt; View/Reply Online (#169301): <a href=3D"https://lists.openemb=
edded.org/g/openembedded-core/message/169301" rel=3D"noreferrer" target=3D"=
_blank">https://lists.openembedded.org/g/openembedded-core/message/169301</=
a><br>
&gt;&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt=
/92997365/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/mt/92997365/1686489</a><br>
&gt;&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@list=
s.openembedded.org" target=3D"_blank">openembedded-core+owner@lists.openemb=
edded.org</a><br>
&gt;&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/open=
embedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin=
@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Jan Vermaete<br>
&gt; =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Ham=
el<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Jan Vermaete<br>=E2=80=9CSuccess is a self-corre=
cting phenomenom.=E2=80=9D -- Gary Hamel</div>

--000000000000aa4b0605e734d53c--

