Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C00C6C636CC
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 12:00:59 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web10.8186.1676548849248909264
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Feb 2023 04:00:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eyrCRKYQ;
 spf=pass (domain: gmail.com, ip: 209.85.217.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id s23so1671338vsj.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 04:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YR4eY6R3NPdfKHnh2Mo0HbPXT8q/JjF7qLSNVbfNkMQ=;
        b=eyrCRKYQPjkmWQvtYddDViqCcm0rWw9gGodVcw97gxUOq7njgM0BRCmGMkrrvbVPre
         kqOjRGI4LDn3xXBQP7GfUGCwUf/N+pWM5snzvz43V0fPqjEMU7VjzrlVVlZpPbe32b2A
         qgQARzx0KiY9gyOClcdG7WMoqivcUF6xd13EG5pr1Nk5llJzgqJaA1i+99JgtEWpGyLc
         /FDC/6L1mAHzncR0MgIOB+QHv4o2eJrCvY7bHT61ARIXAFefhdpYslN7r84RWQjpV7tp
         5O2/FY+3mt00J7J7bswTHOGKF5v9C1Hdym1JMg5p1/OzZozV7nTDuNG5+lqbLW0DHUKI
         92hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YR4eY6R3NPdfKHnh2Mo0HbPXT8q/JjF7qLSNVbfNkMQ=;
        b=1liDmkHyC/CL4rK7DO/+XWhdakQHc1NR+Hia51ZOZJbU19efHcAMmvIBNHH/p9Legr
         1nWVxeZLa8vvfVIqxY+PQmA+bURkLMez51XDR/6K8G52PFzyboaSClmgAt3C9td/AyrG
         Wo0AtmoNP5L9TmBOG7lJywyTjaLsF1Q+8PD9Wxat03UOPjtg+ihWDuCtMdawC39UP1Il
         UAupaan8YbS4b2nMdPnTdd6pibCgHj6rMkkjkFmLBooUFD6Fhr4yvdnjCZ8J0CZAsmBw
         k8tOtp+SNu0IOyyjVgtz06O8VYPtipJLTwISc8qNXS5E6piM1zOXfOBMCaCEtHvIwmI1
         RW4w==
X-Gm-Message-State: AO0yUKXaRPzzczNnH9m69c5PaE+UeprRODBGmK6dJFU6nTCAPaWgn1xJ
	D9IYgg44kTbZbMDwoo07w3QEIZM9RbU+55XsSLc=
X-Google-Smtp-Source: AK7set/vpoft3eoHUV3O09UFgSzIH72qxT5Z8ICFA+7ZJoTD3TQwKHjchMevOSAtT/pfAX/kU/RtfDnf4pXhBPM4kuA=
X-Received: by 2002:a05:6102:11f7:b0:3f0:be66:8037 with SMTP id
 e23-20020a05610211f700b003f0be668037mr1040324vsg.80.1676548848224; Thu, 16
 Feb 2023 04:00:48 -0800 (PST)
MIME-Version: 1.0
References: <16D467EAE661BF11.21797@lists.openembedded.org>
 <CANPvuRn8mgL6FMWj0143ZTPXY5VyzHfA81kJruqFEq0xdpBgnQ@mail.gmail.com>
 <CA+chaQesUNm2tKAVLH2jx_NY_QXJXwqb597=HTv9HANfQFKnnQ@mail.gmail.com> <CAJdd5Ga+tpo=CogC-kwRTuDK=vmK1Pu1adcqK+yiPdsiwqVbYw@mail.gmail.com>
In-Reply-To: <CAJdd5Ga+tpo=CogC-kwRTuDK=vmK1Pu1adcqK+yiPdsiwqVbYw@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 16 Feb 2023 12:00:37 +0000
Message-ID: <CANPvuR=PA8qJJ5nOkCyTrLe4mYw_8_V-fuBKAjv-N28j4vd+TA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] icecc.bbclass: enable networking in all tasks
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008c0c3d05f4cff214"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 12:00:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177285

--0000000000008c0c3d05f4cff214
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Joshua Watt <jpewhacker@gmail.com> escreveu no dia quarta, 6/07/2022 =C3=A0=
(s)
17:11:

> On Wed, Jul 6, 2022 at 10:54 AM Martin Jansa <Martin.Jansa@gmail.com>
> wrote:
> >
> > FWIW: I have noticed yesterday that some of our builds were able to
> fetch external dependencies in do_configure again and found that it was
> caused by this commit.
> >
> > I understand why this was needed to make icecc.bbclass working again.
> >
> > Our (LGE) use-case is a bit special, because we inherit icecc by defaul=
t
> (through INHERIT_DISTRO) even when most builders might have it disabled
> with ICECC_DISABLED - it's set this way, so that jenkins builders with
> icecc enabled produce sstate-cache which can be re-used in local build
> machines where icecc might be disabled.
> >
> > So to support this I've changed icecc.bbclass to respect ICECC_DISABLED
> when setting network varFlag:
> >
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/=
kirkstone&id=3D5bbb735c3285a16bf2ec9548a58b887f93f4900e
> >
> > but that requires expand to be True in bitbake-worker as in:
> >
> https://git.openembedded.org/bitbake-contrib/commit/?h=3Djansa/2.0&id=3D4=
a6c8e61a545152776c0c76304c4225f79de94d2
> >
> > But that has parsing performance penalty as discussed with RP on #yocto=
,
> here is relevant part:
> >
> > 16:03 < JaMa> RP: do you remember if there was specific reason for usin=
g
> expand=3DFalse for network varFlag in
> https://git.openembedded.org/bitbake/commit/?id=3D0746b6a2a32fec4c18bf1a5=
2b1454ca4c04bf543
> ? I wanted to change
> >
> https://git.openembedded.org/openembedded-core/commit/?h=3Dkirkstone&id=
=3D25ea276a13a6ac2342c2b0945c8fafe878d56095
> to enable network only when ICECC_DISABLED isn't set
> > 16:24 < RP> JaMa: it was efficiency
> > 16:24 < RP> JaMa: saved any expansion call
> > 16:24 < RP> and any processing to determine if the value was true or
> false
> > 16:26 < JaMa> RP: and would it be acceptable to enable to support
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/=
kirkstone&id=3D5bbb735c3285a16bf2ec9548a58b887f93f4900e
> ?
> > 16:28 < JaMa> I guess I can delVarFlag when ICECC_DISABLED is set, but
> then it would delete it even where it was explicitly enabled in the recip=
e
> > 16:32 < RP> JaMa: well, I'd prefer not to as all these things mount up
> to increase parsing time but I'm starting to feel like I should just not
> care. I'm tired of saying no
> > 16:33 < RP> JaMa: you could just equally set or delete those in anon
> python I guess. I really just don't know what to do for the best any more
> > 16:34 < JaMa> RP: yes delVarFlag in anon python was my backup plan if
> the price for expand is too high, thanks
> > 16:35 < RP> JaMa: it is sad in that "0" won't work in there are a value
> today either but I really don't know what price people want to pay on
> parsing speed vs usability and consistency
> > 16:37 < JaMa> understood, thanks
> > 16:39 < RP> JaMa: memories are paging back in, I think I did this to se=
e
> whether anyone complained which they now have. It isn't unreasonable to
> properly check it :/
> > 16:40 < RP> it is a bit like the cleandirs change for externalsrc. It
> will slow things down a lot :/
> >
> > Does anyone have some strong opinion either way or some other idea how
> to support this without parsing time penalty?
>
> The only thing I can think of is maybe anonymous python? If that
> works, it would at least limit the performance penalty to the case
> where icecc.bbclass is inherited.
>

I didn't see this at the time and I just noticed it now on this thead
https://lists.openembedded.org/g/bitbake-devel/message/14433

For some go modules I have a workaround to enable the network using python
anonymous
and it works well since some time.

We can have something like that imo:

python () {
    if d.getVar('ICECC_DISABLED') !=3D "1":
        for task in ['do_configure', 'do_compile',
'do_compile_kernelmodules', 'do_install']:
                d.setVarFlag(task, 'network', '1')
}

Can I submit that or it has an impact on parsing time too?

Jose


> >
> > Regards,
> >
> > On Mon, Feb 28, 2022 at 5:10 PM Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> >>
> >> This patch can't be the right fix but currently the icecc.bbclass
> doesn't work on master.
> >>
> >> Jose
> >>
> >> Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
> gmail.com@lists.openembedded.org> escreveu no dia quarta, 16/02/2022 =C3=
=A0(s)
> 23:27:
> >>>
> >>> The icecc.bbclass needs network access to work properly.
> >>>
> >>> Currently I build with icecc inside a container with network isolatio=
n
> and
> >>> my icecc daemon runs outside of the build container in my host.
> >>> The only thing I need to do for using the icecc inside my build
> container is
> >>> mounting the unix socket /var/run/icecc/iceccd.socket inside the
> container.
> >>>
> >>> I think we need something like this mount functionality to have acces=
s
> to
> >>> some sockets connections inside the tasks that runs on the new
> namespace
> >>> created with unshare system call.
> >>>
> >>> This patch is not a the real solution for the problem and is more lik=
e
> >>> an hack so we can use the icecc.bbclass again.
> >>>
> >>> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> >>> ---
> >>>  meta/classes/icecc.bbclass | 4 ++++
> >>>  1 file changed, 4 insertions(+)
> >>>
> >>> diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
> >>> index 3bbd2645af..68415b04c7 100644
> >>> --- a/meta/classes/icecc.bbclass
> >>> +++ b/meta/classes/icecc.bbclass
> >>> @@ -428,18 +428,22 @@ set_icecc_env() {
> >>>      bbnote "Using icecc tarball: $ICECC_VERSION"
> >>>  }
> >>>
> >>> +do_configure[network] =3D "1"
> >>>  do_configure:prepend() {
> >>>      set_icecc_env
> >>>  }
> >>>
> >>> +do_compile[network] =3D "1"
> >>>  do_compile:prepend() {
> >>>      set_icecc_env
> >>>  }
> >>>
> >>> +do_compile_kernelmodules[network] =3D "1"
> >>>  do_compile_kernelmodules:prepend() {
> >>>      set_icecc_env
> >>>  }
> >>>
> >>> +do_install[network] =3D "1"
> >>>  do_install:prepend() {
> >>>      set_icecc_env
> >>>  }
> >>> --
> >>> 2.35.1
> >>>
> >>>
> >>>
> >>>
> >>
> >>
> >> --
> >> Best regards,
> >>
> >> Jos=C3=A9 Quaresma
> >>
> >>
> >>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#167731):
> https://lists.openembedded.org/g/openembedded-core/message/167731
> > Mute This Topic: https://lists.openembedded.org/mt/89198407/3616693
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> JPEWhacker@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000008c0c3d05f4cff214
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">Joshua Watt &lt;<a href=3D"mailto:jpewhac=
ker@gmail.com" target=3D"_blank">jpewhacker@gmail.com</a>&gt; escreveu no d=
ia quarta, 6/07/2022 =C3=A0(s) 17:11:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On Wed, Jul 6, 2022 at 10:54 AM Martin Jansa &lt;<a h=
ref=3D"mailto:Martin.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.=
com</a>&gt; wrote:<br>
&gt;<br>
&gt; FWIW: I have noticed yesterday that some of our builds were able to fe=
tch external dependencies in do_configure again and found that it was cause=
d by this commit.<br>
&gt;<br>
&gt; I understand why this was needed to make icecc.bbclass working again.<=
br>
&gt;<br>
&gt; Our (LGE) use-case is a bit special, because we inherit icecc by defau=
lt (through INHERIT_DISTRO) even when most builders might have it disabled =
with ICECC_DISABLED - it&#39;s set this way, so that jenkins builders with =
icecc enabled produce sstate-cache which can be re-used in local build mach=
ines where icecc might be disabled.<br>
&gt;<br>
&gt; So to support this I&#39;ve changed icecc.bbclass to respect ICECC_DIS=
ABLED when setting network varFlag:<br>
&gt; <a href=3D"https://git.openembedded.org/openembedded-core-contrib/comm=
it/?h=3Djansa/kirkstone&amp;id=3D5bbb735c3285a16bf2ec9548a58b887f93f4900e" =
rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/openembed=
ded-core-contrib/commit/?h=3Djansa/kirkstone&amp;id=3D5bbb735c3285a16bf2ec9=
548a58b887f93f4900e</a><br>
&gt;<br>
&gt; but that requires expand to be True in bitbake-worker as in:<br>
&gt; <a href=3D"https://git.openembedded.org/bitbake-contrib/commit/?h=3Dja=
nsa/2.0&amp;id=3D4a6c8e61a545152776c0c76304c4225f79de94d2" rel=3D"noreferre=
r" target=3D"_blank">https://git.openembedded.org/bitbake-contrib/commit/?h=
=3Djansa/2.0&amp;id=3D4a6c8e61a545152776c0c76304c4225f79de94d2</a><br>
&gt;<br>
&gt; But that has parsing performance penalty as discussed with RP on #yoct=
o, here is relevant part:<br>
&gt;<br>
&gt; 16:03 &lt; JaMa&gt; RP: do you remember if there was specific reason f=
or using expand=3DFalse for network varFlag in <a href=3D"https://git.opene=
mbedded.org/bitbake/commit/?id=3D0746b6a2a32fec4c18bf1a52b1454ca4c04bf543" =
rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/bitbake/c=
ommit/?id=3D0746b6a2a32fec4c18bf1a52b1454ca4c04bf543</a> ? I wanted to chan=
ge<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https=
://git.openembedded.org/openembedded-core/commit/?h=3Dkirkstone&amp;id=3D25=
ea276a13a6ac2342c2b0945c8fafe878d56095" rel=3D"noreferrer" target=3D"_blank=
">https://git.openembedded.org/openembedded-core/commit/?h=3Dkirkstone&amp;=
id=3D25ea276a13a6ac2342c2b0945c8fafe878d56095</a> to enable network only wh=
en ICECC_DISABLED isn&#39;t set<br>
&gt; 16:24 &lt; RP&gt; JaMa: it was efficiency<br>
&gt; 16:24 &lt; RP&gt; JaMa: saved any expansion call<br>
&gt; 16:24 &lt; RP&gt; and any processing to determine if the value was tru=
e or false<br>
&gt; 16:26 &lt; JaMa&gt; RP: and would it be acceptable to enable to suppor=
t <a href=3D"https://git.openembedded.org/openembedded-core-contrib/commit/=
?h=3Djansa/kirkstone&amp;id=3D5bbb735c3285a16bf2ec9548a58b887f93f4900e" rel=
=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/openembedded=
-core-contrib/commit/?h=3Djansa/kirkstone&amp;id=3D5bbb735c3285a16bf2ec9548=
a58b887f93f4900e</a> ?<br>
&gt; 16:28 &lt; JaMa&gt; I guess I can delVarFlag when ICECC_DISABLED is se=
t, but then it would delete it even where it was explicitly enabled in the =
recipe<br>
&gt; 16:32 &lt; RP&gt; JaMa: well, I&#39;d prefer not to as all these thing=
s mount up to increase parsing time but I&#39;m starting to feel like I sho=
uld just not care. I&#39;m tired of saying no<br>
&gt; 16:33 &lt; RP&gt; JaMa: you could just equally set or delete those in =
anon python I guess. I really just don&#39;t know what to do for the best a=
ny more<br>
&gt; 16:34 &lt; JaMa&gt; RP: yes delVarFlag in anon python was my backup pl=
an if the price for expand is too high, thanks<br>
&gt; 16:35 &lt; RP&gt; JaMa: it is sad in that &quot;0&quot; won&#39;t work=
 in there are a value today either but I really don&#39;t know what price p=
eople want to pay on parsing speed vs usability and consistency<br>
&gt; 16:37 &lt; JaMa&gt; understood, thanks<br>
&gt; 16:39 &lt; RP&gt; JaMa: memories are paging back in, I think I did thi=
s to see whether anyone complained which they now have. It isn&#39;t unreas=
onable to properly check it :/<br>
&gt; 16:40 &lt; RP&gt; it is a bit like the cleandirs change for externalsr=
c. It will slow things down a lot :/<br>
&gt;<br>
&gt; Does anyone have some strong opinion either way or some other idea how=
 to support this without parsing time penalty?<br>
<br>
The only thing I can think of is maybe anonymous python? If that<br>
works, it would at least limit the performance penalty to the case<br>
where icecc.bbclass is inherited.<br></blockquote><div><br></div><div>I did=
n&#39;t see this at the time and I just noticed it now on this thead</div><=
div><a href=3D"https://lists.openembedded.org/g/bitbake-devel/message/14433=
">https://lists.openembedded.org/g/bitbake-devel/message/14433</a></div><di=
v><br></div><div>For some go modules I have a workaround=C2=A0to enable the=
 network using python anonymous</div><div>and it works well since some time=
.</div><div><br></div><div>We can have something like that imo:</div><div><=
br></div><div>python () {<br>=C2=A0 =C2=A0 if d.getVar(&#39;ICECC_DISABLED&=
#39;) !=3D &quot;1&quot;:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 for task in [&#39;=
do_configure&#39;, &#39;do_compile&#39;, &#39;do_compile_kernelmodules&#39;=
, &#39;do_install&#39;]:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 d.setVarFlag(task, &#39;network&#39;, &#39;1&#39;)<br>}<br><br>C=
an I submit that or it has an impact on parsing time too?<br></div><div><br=
></div><div>Jose</div><div><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
&gt;<br>
&gt; Regards,<br>
&gt;<br>
&gt; On Mon, Feb 28, 2022 at 5:10 PM Jose Quaresma &lt;<a href=3D"mailto:qu=
aresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; wr=
ote:<br>
&gt;&gt;<br>
&gt;&gt; This patch can&#39;t be the right fix but currently the icecc.bbcl=
ass doesn&#39;t work on master.<br>
&gt;&gt;<br>
&gt;&gt; Jose<br>
&gt;&gt;<br>
&gt;&gt; Jose Quaresma via <a href=3D"http://lists.openembedded.org" rel=3D=
"noreferrer" target=3D"_blank">lists.openembedded.org</a> &lt;quaresma.jose=
=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank">gm=
ail.com@lists.openembedded.org</a>&gt; escreveu no dia quarta, 16/02/2022 =
=C3=A0(s) 23:27:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The icecc.bbclass needs network access to work properly.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Currently I build with icecc inside a container with network i=
solation and<br>
&gt;&gt;&gt; my icecc daemon runs outside of the build container in my host=
.<br>
&gt;&gt;&gt; The only thing I need to do for using the icecc inside my buil=
d container is<br>
&gt;&gt;&gt; mounting the unix socket /var/run/icecc/iceccd.socket inside t=
he container.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I think we need something like this mount functionality to hav=
e access to<br>
&gt;&gt;&gt; some sockets connections inside the tasks that runs on the new=
 namespace<br>
&gt;&gt;&gt; created with unshare system call.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; This patch is not a the real solution for the problem and is m=
ore like<br>
&gt;&gt;&gt; an hack so we can use the icecc.bbclass again.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jo=
se@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 meta/classes/icecc.bbclass | 4 ++++<br>
&gt;&gt;&gt;=C2=A0 1 file changed, 4 insertions(+)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.b=
bclass<br>
&gt;&gt;&gt; index 3bbd2645af..68415b04c7 100644<br>
&gt;&gt;&gt; --- a/meta/classes/icecc.bbclass<br>
&gt;&gt;&gt; +++ b/meta/classes/icecc.bbclass<br>
&gt;&gt;&gt; @@ -428,18 +428,22 @@ set_icecc_env() {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 bbnote &quot;Using icecc tarball: $ICECC_V=
ERSION&quot;<br>
&gt;&gt;&gt;=C2=A0 }<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; +do_configure[network] =3D &quot;1&quot;<br>
&gt;&gt;&gt;=C2=A0 do_configure:prepend() {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 set_icecc_env<br>
&gt;&gt;&gt;=C2=A0 }<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; +do_compile[network] =3D &quot;1&quot;<br>
&gt;&gt;&gt;=C2=A0 do_compile:prepend() {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 set_icecc_env<br>
&gt;&gt;&gt;=C2=A0 }<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; +do_compile_kernelmodules[network] =3D &quot;1&quot;<br>
&gt;&gt;&gt;=C2=A0 do_compile_kernelmodules:prepend() {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 set_icecc_env<br>
&gt;&gt;&gt;=C2=A0 }<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; +do_install[network] =3D &quot;1&quot;<br>
&gt;&gt;&gt;=C2=A0 do_install:prepend() {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 set_icecc_env<br>
&gt;&gt;&gt;=C2=A0 }<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; 2.35.1<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; Best regards,<br>
&gt;&gt;<br>
&gt;&gt; Jos=C3=A9 Quaresma<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#167731): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/167731" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/167731</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89198407=
/3616693" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/89198407/3616693</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:JPEWhacker@gmail.com"=
 target=3D"_blank">JPEWhacker@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div=
></div>

--0000000000008c0c3d05f4cff214--

