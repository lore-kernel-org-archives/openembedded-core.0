Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF257C433F5
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 21:00:55 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.169.1654030847351515602
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 14:00:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oiVCJ2K7;
 spf=pass (domain: gmail.com, ip: 209.85.222.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id 190so14071038qkj.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 14:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BqVcQOxKT0txUGJb/9tNtmpPnABMTJs0ZDiMIKxZAaA=;
        b=oiVCJ2K7bjXF8XbZ5xKVHy7eJpZfYtk/2OJCv5htnFfEo+vQXRR7+8iH7eCIaKsAE+
         l8tIsP+9DCIyQgyKtpvpzqGu7h2YU3HmY66hdAly3Bz6PyEnjvRGkvBcYEdXKvT9A+nn
         V7SkhAXSx+qYfNavKaJUSjP++cNHCV78yslbpZvtWiKkBH7j4DIZqBiCXjZpft0E+iph
         kMYBUfGToLifFlPJ8EDp5v552HThZHqU02K/Cr04egJNk0dmsjlNmi4l4Y6VYvMF1suA
         i0ZoxfdVcvXK23Rrhd5MdxWTZhfSC9QLFQgaOW3lOJY1rC0gCOAAqbgxhtF19ucJl11E
         nQBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BqVcQOxKT0txUGJb/9tNtmpPnABMTJs0ZDiMIKxZAaA=;
        b=ShGc9CgGxVrL8RKZIu3Ke3YRUE9pX4ts0tdT5r6T8wU0EXqCJ5SWWKoF0idpunbqne
         WP9VTob1PJpnpBsfhaK6gEfcUL5huWAfQdAaQnoquXyfp8lRFgRfdksKaJurWoZKnG7y
         065UClCJwkP2tH6xhoIpOOp/ettWjgZEjLzXB/+IFdnVKpHwZ7jpU6rLXj92E0A1uNZI
         pBHugLutdzfJf5LLzRRw/8NX6RCJYYNkc1PuQ4E96LXCEZM0cJ3wtastlFIY2CmlwLIT
         F/4S2cqhwg09fnmHvMB69l/jvFEOgKgopZmB1+bOyoafT5Qe2J1NMBAZVxSohVi1lxcb
         uZFQ==
X-Gm-Message-State: AOAM5320cTsA47nongtacrsXmhtdGwXiaP1zcDheFfLKLbi5+MQtT1pt
	IsgKpy9xBkUh5eLLH65RlQXMHNaVphDr/SLLvdnqXuam
X-Google-Smtp-Source: 
 ABdhPJxIHonllFLD/HT7rISbTsaHZnjT0akVX9ER5S/YylpBiDez/+tTRVmnbE9PlRsFmXZDZhvPIMbJLL7tUlCMa/8=
X-Received: by 2002:a37:660a:0:b0:6a3:4868:c730 with SMTP id
 a10-20020a37660a000000b006a34868c730mr39076268qkc.180.1654030846347; Tue, 31
 May 2022 14:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220531155704.682685-1-marcel@ziswiler.com>
 <CAMKF1so133M+wX7a8QPBLoyYsyz7R7SS4fOJJY9ZRRp=q=Gm7g@mail.gmail.com>
 <7d8e033f-0066-a403-f084-988bec763a75@berginkonsult.se>
 <CAMKF1srYNVRO51=-Q0HQFpTmrQT_031nJiUjNd2z3C==dw=TkA@mail.gmail.com>
 <b9bc356c93da33d186fdff9bc52594f5f3f0c164.camel@toradex.com>
In-Reply-To: <b9bc356c93da33d186fdff9bc52594f5f3f0c164.camel@toradex.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 31 May 2022 14:00:35 -0700
Message-ID: 
 <CAMKF1sovAcX5=tqV0vn7eBpq1cgV0z8gXNURX3sCWr20TcuGbw@mail.gmail.com>
Subject: Re: [oe-core][PATCH v2] libavtp: add recipe to be able to use aaf
 config for alsa-plugins
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	"peter@berginkonsult.se" <peter@berginkonsult.se>
Content-Type: multipart/alternative; boundary="0000000000000b500705e05511b3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 May 2022 21:00:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166334

--0000000000000b500705e05511b3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 31, 2022 at 1:14 PM Marcel Ziswiler <marcel.ziswiler@toradex.co=
m>
wrote:

> On Tue, 2022-05-31 at 12:01 -0700, Khem Raj wrote:
> > Maybe call the recipe avtp
>
> No, here I disagree. As mentioned before the project and everything is
> really called libavtp everywhere. So I
> think the better solution is to consistently use libavtp in
> openembedded-core everywhere as well.


That=E2=80=99s fine with me I don=E2=80=99t have hard stand on the name cha=
nging existing
packageconfog can be a change for someone who might be using it already but
that=E2=80=99s fine we have warnings in place to address these

>
>
>
> > On Tue, May 31, 2022 at 11:36 AM Peter Bergin <peter@berginkonsult.se>
> wrote:
> > > Hi,
> > >
> > > thanks Marcel for bumping this patch again!
> > >
> > > On 2022-05-31 18:38, Khem Raj wrote:
> > > > On Tue, May 31, 2022 at 8:57 AM Marcel Ziswiler <marcel@ziswiler.co=
m>
> wrote:
> > > > > From: Peter Bergin <peter@berginkonsult.se>
> > > > >
> > > > > In order to enable configuration option aaf (AVTP Audio Format)
> > > > > used for AVB the library libavtp is a dependency but no recipe fo=
r
> > > > > this library was present. aaf support for alsa-plugins was
> > > > > introduced in ddf5421331180bc45697511b44cdd4a4e6dda6ff.
> > > > >
> > > > > Signed-off-by: Peter Bergin <peter@berginkonsult.se>
> > > > > Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> > > > >
> > > > > ---
> > > > > Resurrect from mailing list [1] as this is still not upstream.
> > > > > End-to-end tested on Verdin iMX8M Plus.
> > > > > Will talk about it at the Embedded World in the TSN & Linux track
> next
> > > > > month [2].
> > > > >
> > > > > [1]
> https://lore.kernel.org/all/20210604090216.553285-1-peter@berginkonsult.s=
e/
> > > > > [2]
> https://events.weka-fachmedien.de/embedded-world-conference/program/
> > > > >
> > > > > Changes in v2:
> > > > > - Updated SRC_URI specifying mandatory protocol as https.
> > > > > - Updated SRCREV to latest.
> > > > >
> > > > >    meta/recipes-multimedia/libavtp/libavtp_git.bb | 16
> ++++++++++++++++
> > > > There was a 0.2.0 release
> https://github.com/Avnu/libavtp/releases/tag/v0.2.0
> > > > so I wonder if we should use the release tagged SRC_URI and call th=
e
> PV =3D 0.2.0
> > > This tag was set after I sent my initial patch. I think this is a goo=
d
> > > thing to do.
> > > >
> > > > >    1 file changed, 16 insertions(+)
> > > > >    create mode 100644 meta/recipes-multimedia/libavtp/
> libavtp_git.bb
> > > > >
> > > > > diff --git a/meta/recipes-multimedia/libavtp/libavtp_git.bb
> b/meta/recipes-
> > > > > multimedia/libavtp/libavtp_git.bb
> > > > > new file mode 100644
> > > > > index 0000000000..aefbee56ea
> > > > > --- /dev/null
> > > > > +++ b/meta/recipes-multimedia/libavtp/libavtp_git.bb
> > > > > @@ -0,0 +1,16 @@
> > > > > +DESCRIPTION =3D "Open source implementation of Audio Video
> Transport Protocol (AVTP) \
> > > > > +               specified in IEEE 1722-2016 spec."
> > > > > +HOMEPAGE =3D "https://github.com/Avnu/libavtp"
> > > > > +LICENSE =3D "BSD-3-Clause"
> > > > > +LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D7fcb4331e23e45e171cd5693c1ff7d3e"
> > > > > +
> > > > > +PROVIDES =3D "avtp"
> > > > why is this provides needed ?
> > >
> > > It is because recipe meta/recipes-multimedia/alsa/
> alsa-plugins_1.2.6.bb
> > > has this PACKAGECONFIG:
> > >
> > >    PACKAGECONFIG[aaf] =3D "--enable-aaf,--disable-aaf,avtp"
> > >
> > > So either this PROVIDES or also change PACKAGECONFIG for alsa-plugins=
?
> > >
> > > /Peter
> > >
> > > > > +
> > > > > +SRC_URI =3D "git://
> github.com/Avnu/libavtp.git;branch=3Dmaster;protocol=3Dhttps"
> > > > > +SRCREV =3D "3599a5bf2d18fc3ae89b64f208d8380e6ee3a866"
> > > > > +
> > > > > +S =3D "${WORKDIR}/git"
> > > > > +
> > > > > +inherit meson pkgconfig
> > > > > +
> > > > > +EXTRA_OEMESON =3D "-Dtests=3Ddisabled"
> > > > > --
> > > > > 2.36.1
> > > > >
> > > > >
> > > > >
> > > > >
> > > > >
> > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > Links: You receive all messages sent to this group.
> > > > > View/Reply Online (#166324):
> https://lists.openembedded.org/g/openembedded-core/message/166324
> > > > > Mute This Topic:
> https://lists.openembedded.org/mt/91454504/3617552
> > > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > > Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub [
> peter@berginkonsult.se]
> > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--0000000000000b500705e05511b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, May 31, 2022 at 1:14 PM Marcel Ziswiler &lt;<a href=
=3D"mailto:marcel.ziswiler@toradex.com">marcel.ziswiler@toradex.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, 2022-05-31 at 12:01=
 -0700, Khem Raj wrote:<br>
&gt; Maybe call the recipe avtp<br>
<br>
No, here I disagree. As mentioned before the project and everything is real=
ly called libavtp everywhere. So I<br>
think the better solution is to consistently use libavtp in openembedded-co=
re everywhere as well.</blockquote><div dir=3D"auto"><br></div><div dir=3D"=
auto">That=E2=80=99s fine with me I don=E2=80=99t have hard stand on the na=
me changing existing packageconfog can be a change for someone who might be=
 using it already but that=E2=80=99s fine we have warnings in place to addr=
ess these=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
<br>
&gt; On Tue, May 31, 2022 at 11:36 AM Peter Bergin &lt;<a href=3D"mailto:pe=
ter@berginkonsult.se" target=3D"_blank">peter@berginkonsult.se</a>&gt; wrot=
e:<br>
&gt; &gt; Hi,<br>
&gt; &gt; <br>
&gt; &gt; thanks Marcel for bumping this patch again!<br>
&gt; &gt; <br>
&gt; &gt; On 2022-05-31 18:38, Khem Raj wrote:<br>
&gt; &gt; &gt; On Tue, May 31, 2022 at 8:57 AM Marcel Ziswiler &lt;<a href=
=3D"mailto:marcel@ziswiler.com" target=3D"_blank">marcel@ziswiler.com</a>&g=
t; wrote:<br>
&gt; &gt; &gt; &gt; From: Peter Bergin &lt;<a href=3D"mailto:peter@berginko=
nsult.se" target=3D"_blank">peter@berginkonsult.se</a>&gt;<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; In order to enable configuration option aaf (AVTP Audio=
 Format)<br>
&gt; &gt; &gt; &gt; used for AVB the library libavtp is a dependency but no=
 recipe for<br>
&gt; &gt; &gt; &gt; this library was present. aaf support for alsa-plugins =
was<br>
&gt; &gt; &gt; &gt; introduced in ddf5421331180bc45697511b44cdd4a4e6dda6ff.=
<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Signed-off-by: Peter Bergin &lt;<a href=3D"mailto:peter=
@berginkonsult.se" target=3D"_blank">peter@berginkonsult.se</a>&gt;<br>
&gt; &gt; &gt; &gt; Signed-off-by: Marcel Ziswiler &lt;<a href=3D"mailto:ma=
rcel.ziswiler@toradex.com" target=3D"_blank">marcel.ziswiler@toradex.com</a=
>&gt;<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; Resurrect from mailing list [1] as this is still not up=
stream.<br>
&gt; &gt; &gt; &gt; End-to-end tested on Verdin iMX8M Plus.<br>
&gt; &gt; &gt; &gt; Will talk about it at the Embedded World in the TSN &am=
p; Linux track next<br>
&gt; &gt; &gt; &gt; month [2].<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; [1] <a href=3D"https://lore.kernel.org/all/202106040902=
16.553285-1-peter@berginkonsult.se/" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lore.kernel.org/all/20210604090216.553285-1-peter@berginkonsult.se/<=
/a><br>
&gt; &gt; &gt; &gt; [2] <a href=3D"https://events.weka-fachmedien.de/embedd=
ed-world-conference/program/" rel=3D"noreferrer" target=3D"_blank">https://=
events.weka-fachmedien.de/embedded-world-conference/program/</a><br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Changes in v2:<br>
&gt; &gt; &gt; &gt; - Updated SRC_URI specifying mandatory protocol as http=
s.<br>
&gt; &gt; &gt; &gt; - Updated SRCREV to latest.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0meta/recipes-multimedia/libavtp/<a href=3D=
"http://libavtp_git.bb" rel=3D"noreferrer" target=3D"_blank">libavtp_git.bb=
</a> | 16 ++++++++++++++++<br>
&gt; &gt; &gt; There was a 0.2.0 release <a href=3D"https://github.com/Avnu=
/libavtp/releases/tag/v0.2.0" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/Avnu/libavtp/releases/tag/v0.2.0</a><br>
&gt; &gt; &gt; so I wonder if we should use the release tagged SRC_URI and =
call the PV =3D 0.2.0<br>
&gt; &gt; This tag was set after I sent my initial patch. I think this is a=
 good <br>
&gt; &gt; thing to do.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A01 file changed, 16 insertions(+)<br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0create mode 100644 meta/recipes-multimedia=
/libavtp/<a href=3D"http://libavtp_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">libavtp_git.bb</a><br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; diff --git a/meta/recipes-multimedia/libavtp/<a href=3D=
"http://libavtp_git.bb" rel=3D"noreferrer" target=3D"_blank">libavtp_git.bb=
</a> b/meta/recipes-<br>
&gt; &gt; &gt; &gt; multimedia/libavtp/<a href=3D"http://libavtp_git.bb" re=
l=3D"noreferrer" target=3D"_blank">libavtp_git.bb</a><br>
&gt; &gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; &gt; index 0000000000..aefbee56ea<br>
&gt; &gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; &gt; +++ b/meta/recipes-multimedia/libavtp/<a href=3D"http:/=
/libavtp_git.bb" rel=3D"noreferrer" target=3D"_blank">libavtp_git.bb</a><br=
>
&gt; &gt; &gt; &gt; @@ -0,0 +1,16 @@<br>
&gt; &gt; &gt; &gt; +DESCRIPTION =3D &quot;Open source implementation of Au=
dio Video Transport Protocol (AVTP) \<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0specified in IEEE 1722-2016 spec.&quot;<br>
&gt; &gt; &gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/Avnu/=
libavtp" rel=3D"noreferrer" target=3D"_blank">https://github.com/Avnu/libav=
tp</a>&quot;<br>
&gt; &gt; &gt; &gt; +LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt; &gt; &gt; &gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D7fcb43=
31e23e45e171cd5693c1ff7d3e&quot;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +PROVIDES =3D &quot;avtp&quot;<br>
&gt; &gt; &gt; why is this provides needed ?<br>
&gt; &gt; <br>
&gt; &gt; It is because recipe meta/recipes-multimedia/alsa/<a href=3D"http=
://alsa-plugins_1.2.6.bb" rel=3D"noreferrer" target=3D"_blank">alsa-plugins=
_1.2.6.bb</a> <br>
&gt; &gt; has this PACKAGECONFIG:<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0=C2=A0 PACKAGECONFIG[aaf] =3D &quot;--enable-aaf,--disable-=
aaf,avtp&quot;<br>
&gt; &gt; <br>
&gt; &gt; So either this PROVIDES or also change PACKAGECONFIG for alsa-plu=
gins?<br>
&gt; &gt; <br>
&gt; &gt; /Peter<br>
&gt; &gt; <br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/A=
vnu/libavtp.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=
=3D"_blank">github.com/Avnu/libavtp.git;branch=3Dmaster;protocol=3Dhttps</a=
>&quot;<br>
&gt; &gt; &gt; &gt; +SRCREV =3D &quot;3599a5bf2d18fc3ae89b64f208d8380e6ee3a=
866&quot;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +inherit meson pkgconfig<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +EXTRA_OEMESON =3D &quot;-Dtests=3Ddisabled&quot;<br>
&gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; 2.36.1<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; &gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; &gt; &gt; View/Reply Online (#166324): <a href=3D"https://lists.o=
penembedded.org/g/openembedded-core/message/166324" rel=3D"noreferrer" targ=
et=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/16=
6324</a><br>
&gt; &gt; &gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.=
org/mt/91454504/3617552" rel=3D"noreferrer" target=3D"_blank">https://lists=
.openembedded.org/mt/91454504/3617552</a><br>
&gt; &gt; &gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowne=
r@lists.openembedded.org" target=3D"_blank">openembedded-core+owner@lists.o=
penembedded.org</a><br>
&gt; &gt; &gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/=
g/openembedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lis=
ts.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:peter@=
berginkonsult.se" target=3D"_blank">peter@berginkonsult.se</a>]<br>
&gt; &gt; &gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
</blockquote></div></div>

--0000000000000b500705e05511b3--

