Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3454CC433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Sep 2021 08:39:09 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.9741.1632991147620110663
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Sep 2021 01:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MJgpgUbv;
 spf=pass (domain: gmail.com, ip: 209.85.167.43,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id z24so21997259lfu.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Sep 2021 01:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XjS+8ZIMSRhsNqP7PjgC+2XDujcWH2nvjRYN2KthpAk=;
        b=MJgpgUbvfqUhN+JM3iKDAkF1y3JVmna4NKdO7rjg9UeBxJui37Q3H2NQIq2ILLzI90
         bs6kq37CP7Q/Y88pKhDaL2u3OZfJ4XMn4KYrhX2pKuIKfc3hDP4QPs/At/cNXxJTBOkt
         jqgMlQpEjaiKpS6EGMfJsXOPV2Ajp1XyEXI9qzzKDWW3mA0L8eSMxgEpTjBscLxar4EQ
         fZ2oDWg0AMYPowELhnCBtX7nmmzuT77cSxWcOb1qbsydtRXGuA9gqx6bQ00NaXzVS79g
         UCfIoTbUfVMfGs4tm19R6Gz6KE3eA7u3QvYYkLCblW1DzHSiyteGxegap1cizyaRv67g
         DzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XjS+8ZIMSRhsNqP7PjgC+2XDujcWH2nvjRYN2KthpAk=;
        b=lSNrNQr6G2N9b+8xgKjc/6f8FMa3H+7Fksag346mkdvXtL7OZZlyOS36ElnK8DhhZV
         QbdaFyh1s0McnV7MD967jDIexINkoebB6tXF2rECuzTd9MSSdY20d45cCVPsKmnZmI9o
         XxOLmP3/UKN72ulW3Gek81CCZXFVmY+ajU1i9As9XMiDdNLavcfYrTrHKq7WSfxxXT4K
         iCIT0dc+o9m+fD/Pzd1TE+YgeNjDsaBYRak1lh4MPFXfJ2xGSQzS1WL1AVkNR6x4pgjM
         a9gmSgd1WFQDZ1nSQ4MzRSwLZw8oC3cgKh2EaBra0ygSTtTBXxrvkrIeeYMIdES4jf44
         j9Rw==
X-Gm-Message-State: AOAM533DbUGYPJQ6mKWDD6Zpx9sKw/xbqjy8imiJak/XQJ/chgd8YDwi
	4ViSy/+mte/eLmcmiWKZWGrMjB0+twc8thnZqrA=
X-Google-Smtp-Source: 
 ABdhPJz1gHEWOeHg3OMADqwNZuqftsnIjh5a9ypWryo5aajj87iAUESIpRKkgUuOd/bgClajmUIGjiN9MwedTA3MRNQ=
X-Received: by 2002:a2e:22c3:: with SMTP id
 i186mr4582928lji.255.1632991145528;
 Thu, 30 Sep 2021 01:39:05 -0700 (PDT)
MIME-Version: 1.0
References: 
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.d232f846-51ae-43c0-85e8-be1b07245956@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.5a416b0f-56e3-45c8-b87b-0760607e2824@emailsignatures365.codetwo.com>
 <20210911100454.1285040-1-richard.purdie@linuxfoundation.org>
 <9b55887d-d2ce-5443-5e4d-be7f4133d5f7@topic.nl>
In-Reply-To: <9b55887d-d2ce-5443-5e4d-be7f4133d5f7@topic.nl>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 30 Sep 2021 09:38:55 +0100
Message-ID: 
 <CANPvuR=VtnW_c9f06vA-WuSB0D=OU9OWbetriXiSk3E_91bBCw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] bitbake.conf: Ensure XZ_THREADS doesn't
 change sstate checksums
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002693ca05cd326158"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Sep 2021 08:39:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156487

--0000000000002693ca05cd326158
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mike,

But who is this calculated ?
For example, if we are inside of a container the XZ will use the host CPU
available or the scheduler affinity.

Mike Looijmans <mike.looijmans@topic.nl> escreveu no dia quinta, 30/09/2021
=C3=A0(s) 07:50:

> Wouldn't "0" be a better default? Setting threads to "0" will make xz use
> the
> CPU count anyway, so it'd be honest too.
>
>
>
> Met vriendelijke groet / kind regards,
>
> Mike Looijmans
> System Expert
>
>
> TOPIC Embedded Products B.V.
> Materiaalweg 4, 5681 RJ Best
> The Netherlands
>
> T: +31 (0) 499 33 69 69
> E: mike.looijmans@topicproducts.com
> W: www.topic.nl
>
> Please consider the environment before printing this e-mail
> On 11-09-2021 12:04, Richard Purdie via lists.openembedded.org wrote:
> > rpm output packages currently depend on the value of XZ_THREADS which
> > is ok if left to the default value but problematic if system limits
> > are set such as on the autobuilder.
> >
> > Force the value to a specific one in the hashes for better sstate reuse
> > and consistent rpm task checksums.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >   meta/conf/bitbake.conf | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 2140d498f7c..e25d632dc1c 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -811,6 +811,7 @@ PARALLEL_MAKE ?=3D "-j ${@oe.utils.cpu_count()}"
> >   # Default parallelism and resource usage for xz
> >   XZ_MEMLIMIT ?=3D "50%"
> >   XZ_THREADS ?=3D "${@oe.utils.cpu_count(at_least=3D2)}"
> > +XZ_THREADS[vardepvalue] =3D "1"
> >   XZ_DEFAULTS ?=3D "--memlimit=3D${XZ_MEMLIMIT} --threads=3D${XZ_THREAD=
S}"
> >   XZ_DEFAULTS[vardepsexclude] +=3D "XZ_MEMLIMIT XZ_THREADS"
> >
> >
> >
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156483):
> https://lists.openembedded.org/g/openembedded-core/message/156483
> Mute This Topic: https://lists.openembedded.org/mt/85529700/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000002693ca05cd326158
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Mike,</div><div><br></div><div>But who is this cal=
culated ?</div><div>For example, if we are inside of a container the XZ wil=
l use the host CPU available or the scheduler affinity.</div><div><br></div=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Mike Looi=
jmans &lt;<a href=3D"mailto:mike.looijmans@topic.nl">mike.looijmans@topic.n=
l</a>&gt; escreveu no dia quinta, 30/09/2021 =C3=A0(s) 07:50:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">Wouldn&#39;t &quot;0&quot; be=
 a better default? Setting threads to &quot;0&quot; will make xz use the <b=
r>
CPU count anyway, so it&#39;d be honest too.<br>
<br>
<br>
<br>
Met vriendelijke groet / kind regards,<br>
<br>
Mike Looijmans<br>
System Expert<br>
<br>
<br>
TOPIC Embedded Products B.V.<br>
Materiaalweg 4, 5681 RJ Best<br>
The Netherlands<br>
<br>
T: +31 (0) 499 33 69 69<br>
E: <a href=3D"mailto:mike.looijmans@topicproducts.com" target=3D"_blank">mi=
ke.looijmans@topicproducts.com</a><br>
W: <a href=3D"http://www.topic.nl" rel=3D"noreferrer" target=3D"_blank">www=
.topic.nl</a><br>
<br>
Please consider the environment before printing this e-mail<br>
On 11-09-2021 12:04, Richard Purdie via <a href=3D"http://lists.openembedde=
d.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrot=
e:<br>
&gt; rpm output packages currently depend on the value of XZ_THREADS which<=
br>
&gt; is ok if left to the default value but problematic if system limits<br=
>
&gt; are set such as on the autobuilder.<br>
&gt; <br>
&gt; Force the value to a specific one in the hashes for better sstate reus=
e<br>
&gt; and consistent rpm task checksums.<br>
&gt; <br>
&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/conf/bitbake.conf | 1 +<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+)<br>
&gt; <br>
&gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt; index 2140d498f7c..e25d632dc1c 100644<br>
&gt; --- a/meta/conf/bitbake.conf<br>
&gt; +++ b/meta/conf/bitbake.conf<br>
&gt; @@ -811,6 +811,7 @@ PARALLEL_MAKE ?=3D &quot;-j ${@oe.utils.cpu_count(=
)}&quot;<br>
&gt;=C2=A0 =C2=A0# Default parallelism and resource usage for xz<br>
&gt;=C2=A0 =C2=A0XZ_MEMLIMIT ?=3D &quot;50%&quot;<br>
&gt;=C2=A0 =C2=A0XZ_THREADS ?=3D &quot;${@oe.utils.cpu_count(at_least=3D2)}=
&quot;<br>
&gt; +XZ_THREADS[vardepvalue] =3D &quot;1&quot;<br>
&gt;=C2=A0 =C2=A0XZ_DEFAULTS ?=3D &quot;--memlimit=3D${XZ_MEMLIMIT} --threa=
ds=3D${XZ_THREADS}&quot;<br>
&gt;=C2=A0 =C2=A0XZ_DEFAULTS[vardepsexclude] +=3D &quot;XZ_MEMLIMIT XZ_THRE=
ADS&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#156483): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/156483" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/156483</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/85529700/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/85529700/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--0000000000002693ca05cd326158--

