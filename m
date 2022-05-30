Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0970C433F5
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 16:30:01 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.38803.1653928200211650377
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 09:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oamRHe5I;
 spf=pass (domain: gmail.com, ip: 209.85.167.47,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id j10so17474924lfe.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 09:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Sf214bwNomUSwxozirljEPOyWHYFhEXeYv+F+i0ImHw=;
        b=oamRHe5IN6N7e4tCrqpbLXj4zqRdwi9qqMBTDj/nknq5H+eMcuCJlQS+HbrSw0zLUV
         4c9P8NV/FtZkNxTfyn7Sy9YQIGYK+vfpKxGHQaorO1bYtHPOtCk8Y4y17qy3wZoGXvO0
         K7SX4vG+AzM6V8nuXykg14lpwzTtfK5VZFR+Q9FTOp41K28qfK/I3t17rhbQw+8/rXjf
         ASu4KOyCPglFJjMr8QFZ91v3i3oDB2/I/MgPJ0LaxTfu1q1vQCcVbw2F7JJOrAGIN4AD
         2XNCPg12nHeIcDJrqtMEHM1DTsl0Mp5y2iYZpRMZytUUDYt4iEKNSIcJx757g0vA2JtE
         z6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sf214bwNomUSwxozirljEPOyWHYFhEXeYv+F+i0ImHw=;
        b=tdl0sipl8PuMnDWnAZZaclpV+8z+hGOF7HHx+4nXTv5ReRtWYbBCk9sc930tbRMniF
         aq+zCWHcH38ivODXk7r2nUWFBafrm19LRSVQV+aFtJJbzTig55P9+2BAh5BbuMVF2SjH
         EzWs4/dgV/dQvuSE5zMcA5nZez5QLb8xmyUNoXcsK9VFh02gRmnp77vsm4uq+qBRHHXR
         Ehi8EjEeF/ofoArzMxf4IrJcaoRwTPbom6k1eTEYExv1+7wcwysxr5t2IqdTg6TD28Dj
         Uv86sl3aig8FEcG+wm90Ww2/FRLIfE5JkgxBYIr2KbImuLi+G/AaHUzSLqko7DZGhuZm
         DY1w==
X-Gm-Message-State: AOAM533JEoNRPgXylx+gkMe43fodFU0c1hUXkcrLVzV0gPyFIHtU/ksS
	qpH/OPJ51lQ+sbeauM/n7wQFZlc57rMCxuJKmNU=
X-Google-Smtp-Source: 
 ABdhPJwQaE5nuNT3Nxm3zUYjLsBNCylZDCBwUWOs5wxxBJg6fq4/uOvft2gZThfzM7xV/wA7zRstzsyqMvTiWC5zV5Y=
X-Received: by 2002:a05:6512:a95:b0:478:82fb:7783 with SMTP id
 m21-20020a0565120a9500b0047882fb7783mr24836478lfu.471.1653928197988; Mon, 30
 May 2022 09:29:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220527082923.3652488-1-jose.quaresma@foundries.io>
 <1da31a89d51503ae233f426b185aefefd0f48446.camel@linuxfoundation.org>
 <CANPvuRnw5D9Geyg0XVUQeBuHpxDQdq+m+HxhReM+m32OWr-JkQ@mail.gmail.com>
In-Reply-To: 
 <CANPvuRnw5D9Geyg0XVUQeBuHpxDQdq+m+HxhReM+m32OWr-JkQ@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 30 May 2022 17:29:46 +0100
Message-ID: 
 <CANPvuR=TkcHNd-zCKUXO3jt7vvZsyrrChLMrrtTTuFiZucyGkQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] archiver: exit to avoid race conditions
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000b9a49105e03d2a80"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 16:30:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166293

--000000000000b9a49105e03d2a80
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jose Quaresma <quaresma.jose@gmail.com> escreveu no dia sexta, 27/05/2022
=C3=A0(s) 11:07:

>
>
> <richard.purdie@linuxfoundation.org> escreveu no dia sexta, 27/05/2022
> =C3=A0(s) 10:13:
>
>> On Fri, 2022-05-27 at 09:29 +0100, Jose Quaresma wrote:
>> > The archiver doesn't support using multiconfig sharing the same TMPDIR
>> > so rise an error when we have something that shouldn't exist.
>> >
>> > When in the multiconfig and using the same TMPDIR: the two machines ca=
n
>> make
>> > the same copy at the same time to the same destination, which will not
>> work.
>> >
>> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>> > ---
>> >  meta/classes/archiver.bbclass | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/meta/classes/archiver.bbclass
>> b/meta/classes/archiver.bbclass
>> > index c19c770d11..5514e44a78 100644
>> > --- a/meta/classes/archiver.bbclass
>> > +++ b/meta/classes/archiver.bbclass
>> > @@ -486,6 +486,8 @@ python do_unpack_and_patch() {
>> >      if d.getVarFlag('ARCHIVER_MODE', 'diff') =3D=3D '1':
>> >          src =3D d.getVar('S').rstrip('/')
>> >          src_orig =3D '%s.orig' % src
>> > +        if os.path.isdir(src_orig):
>> > +            bb.error("A previous copy of the original source already
>> exist '%s'" % src_orig)
>> >          oe.path.copytree(src, src_orig)
>> >
>> >      if bb.data.inherits_class('dos2unix', d):
>>
>> I suspect we need to make archiver hard error if multiconfig is being
>> used in that case. This can work around some subset of the races
>> but could also still result in broken trees of files :(
>>
>> I'd also note that the patch will still break since bb.error doesn't
>> actually exit, it just prints an error and causes the task to fail. You
>> probably meant bb.fatal().
>
>
> Sorry for that, it was bb.fatal() that I wanted to use, I will send a V2
>
> But as you said it can solve some of the races but not all.
> The right solution can be a check to see if multicast is enabled
> and using the same TMPDIR but I don't know how to do that.
> I need to think a little more about this.
>

When we are using the bitbake multi-config we have the BBMULTICONFIG define=
d
but afaik only bitbake knows if each machine has their TMPDIR so it is not
possible
to check this on the archiver.bbclass.

bitbake docs [1] says: "Minimally, each configuration file must define the
machine and the temporary directory BitBake uses for the build.
Suggested practice dictates that you do not overlap the temporary
directories used during the builds."

Maybe this suggestion to not overlap the temporary directories could be
made mandatory.

[1]
https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manu=
al-intro.html#executing-a-multiple-configuration-build

Jose


> Jose
>
>
>
>
>> Cheers,
>>
>> Richard
>>
>>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000b9a49105e03d2a80
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Jose Quaresma &lt;<a href=3D"mailto:q=
uaresma.jose@gmail.com">quaresma.jose@gmail.com</a>&gt; escreveu no dia sex=
ta, 27/05/2022 =C3=A0(s) 11:07:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">&lt;<a href=3D"mailt=
o:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linu=
xfoundation.org</a>&gt; escreveu no dia sexta, 27/05/2022 =C3=A0(s) 10:13:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, 2022-05-=
27 at 09:29 +0100, Jose Quaresma wrote:<br>
&gt; The archiver doesn&#39;t support using multiconfig sharing the same TM=
PDIR<br>
&gt; so rise an error when we have something that shouldn&#39;t exist.<br>
&gt; <br>
&gt; When in the multiconfig and using the same TMPDIR: the two machines ca=
n make<br>
&gt; the same copy at the same time to the same destination, which will not=
 work.<br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/archiver.bbclass | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbc=
lass<br>
&gt; index c19c770d11..5514e44a78 100644<br>
&gt; --- a/meta/classes/archiver.bbclass<br>
&gt; +++ b/meta/classes/archiver.bbclass<br>
&gt; @@ -486,6 +486,8 @@ python do_unpack_and_patch() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if d.getVarFlag(&#39;ARCHIVER_MODE&#39;, &#39;diff=
&#39;) =3D=3D &#39;1&#39;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 src =3D d.getVar(&#39;S&#39;).rstrip=
(&#39;/&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 src_orig =3D &#39;%s.orig&#39; % src=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.isdir(src_orig):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error(&quot;A previous c=
opy of the original source already exist &#39;%s&#39;&quot; % src_orig)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.path.copytree(src, src_orig)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if bb.data.inherits_class(&#39;dos2unix&#39;, d):<=
br>
<br>
I suspect we need to make archiver hard error if multiconfig is being<br>
used in that case. This can work around some subset of the races<br>
but=C2=A0could also still result in broken trees of files :(<br>
<br>
I&#39;d also note that the patch will still break since bb.error doesn&#39;=
t<br>
actually exit, it just prints an error and causes the task to fail. You<br>
probably meant bb.fatal().</blockquote><div>=C2=A0</div><div>Sorry for that=
, it was=C2=A0bb.fatal()=C2=A0that I wanted to use, I will send a V2</div><=
div><br></div><div>But as you said it can solve some of the races but not a=
ll.</div><div>The right=C2=A0solution can be a check to see if multicast=C2=
=A0is enabled</div><div>and using the same TMPDIR but I don&#39;t know how =
to do that.</div><div>I need to think a little more about this.</div></div>=
</div></blockquote><div><br></div><div>When we are using the bitbake multi-=
config=C2=A0we=C2=A0have the BBMULTICONFIG=C2=A0defined<br></div><div>but a=
faik only bitbake knows if each machine has their TMPDIR so it is not possi=
ble</div><div>to check this on the archiver.bbclass.</div><div><br></div><d=
iv>bitbake docs [1] says: &quot;Minimally, each configuration file must def=
ine the machine and the temporary directory BitBake uses for the build.</di=
v><div>Suggested practice dictates that you do not overlap the temporary di=
rectories used during the builds.&quot;</div><div><br></div><div>Maybe this=
 suggestion to not overlap the temporary directories could be made mandator=
y.</div><div><br></div><div>[1] <a href=3D"https://docs.yoctoproject.org/bi=
tbake/bitbake-user-manual/bitbake-user-manual-intro.html#executing-a-multip=
le-configuration-build">https://docs.yoctoproject.org/bitbake/bitbake-user-=
manual/bitbake-user-manual-intro.html#executing-a-multiple-configuration-bu=
ild</a><br></div><div><br></div><div>Jose</div><div><br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_q=
uote"><div><br></div><div>Jose</div><div><br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">=C2=A0</blockquote><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div=
></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000b9a49105e03d2a80--

