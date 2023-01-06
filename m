Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89436C3DA7A
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 12:43:50 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.12592.1673009019796757255
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 04:43:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lisFuARZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id y25so1782766lfa.9
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 04:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PyMPG4SJmzMNlpfRZ5qmEdzWd4uqY8qmZ+55wIp6cIU=;
        b=lisFuARZ9GQsgfoDObPEtRwDM15kcCmZ7HFETuV2Qlo/DvBvV8dpVIaFtkpEiJs33C
         yyoTg7AxvI8pzS4KGepxY1mGqPY/Y5i5fhYec8v7ELBVudukDum66FBNV1EdablkvOBD
         frCSt+CPJdbxbRh1eOC6WnD/XJpezsizm41f7xTr3RV3520Wd3Lb3iIkLiSs8aXF3yzO
         NdZz9XZpb2putMYuQYQU5YENEe6ZoOItR83+M4cUUim0PXbDytWDCy/I/vi7KtSVMx/c
         r8pfqwyqJBEdw35YnMrpC3hBPqNN+gLg09IgoMW0dSMp9sV7wFSl8nS6msFR9E0xtBO8
         gyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PyMPG4SJmzMNlpfRZ5qmEdzWd4uqY8qmZ+55wIp6cIU=;
        b=T09bX2ImwdcL1JmwQJ6UtV23xM+sXMLuJR/+xWxywr89TMHctEB2Gqjj2I9nRlr5iN
         Iip2er8F0LlVrSfn7fHlzeutsKmCGCzSzFUOM6AYONuTZudCIzo5J84ZFDGPuLW/HtHP
         IHclozOZcOBoNksBeizYj8zOYAOg0ib9qqvCVJyQnMojEuuEAPXJPHyP7qm9VuXFKksR
         j9fNtKEZlzQ97Y1auNkWjD1l3dVy+bu8fxM5559wzidsQS6KgrT4SWn5bgowB63P2Je4
         aT0YdflcDGol55ut6c/uBA0JznXF7lTy+Zib9m5X9Lf+TfYYH85bYEWCiKoq1QVORLi1
         tUbA==
X-Gm-Message-State: AFqh2krg8qHjqKXQbK8mKZQIFRcNqkGIzsXTThEKwgqNdT2rnDZYoyDi
	Xadlu0U87naUIgnT6jVJwevfmPYEtRA0MQws9W0=
X-Google-Smtp-Source: AMrXdXvPhAFElt3yzs3f5qgVQxG6yDdvn+yJID2xzgueJKNrfyhSJurWvR+j8P22+ywb5b2k61CBHviuMMTRKWmVBx4=
X-Received: by 2002:a05:6512:239d:b0:4b5:62e4:bff2 with SMTP id
 c29-20020a056512239d00b004b562e4bff2mr3024169lfv.492.1673009017820; Fri, 06
 Jan 2023 04:43:37 -0800 (PST)
MIME-Version: 1.0
References: <20221222103829.55230-1-pzalewski@thegoodpenguin.co.uk>
 <08ea029850c0dd7d0a2577c1721e0ef516aadbb3.camel@linuxfoundation.org> <CAA6zWZKmRG8rvmjd-Pec0jKN+jkPH9DyOHFxFVycRuysnizLag@mail.gmail.com>
In-Reply-To: <CAA6zWZKmRG8rvmjd-Pec0jKN+jkPH9DyOHFxFVycRuysnizLag@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 6 Jan 2023 13:43:26 +0100
Message-ID: <CANNYZj9H__DUKty+N3R=didcPYk9FT7RKSYTQum0H1HPzpbfJA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] classes: decode output data to text
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003698d305f197c4c6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 12:43:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175584

--0000000000003698d305f197c4c6
Content-Type: text/plain; charset="UTF-8"

Can you please describe steps to reproduce?

Alex

On Fri 6. Jan 2023 at 13.40, Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
wrote:

> It is not actually being used by default in Yocto ?
> This was found in kirkstone.
> But regardless, it is wrong and will drop an error.
>
> Kind regards,
> Pawel
>
> On Fri, 6 Jan 2023 at 12:06, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Thu, 2022-12-22 at 10:38 +0000, Pawel Zalewski wrote:
> > > The default return value from subprocess.check_output is an encoded
> byte.
> > > The applied fix will decode the value to a string.
> > >
> > > Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> > > ---
> > >  meta/classes/fs-uuid.bbclass | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/classes/fs-uuid.bbclass
> b/meta/classes/fs-uuid.bbclass
> > > index 9b53dfba7a..731ea575bd 100644
> > > --- a/meta/classes/fs-uuid.bbclass
> > > +++ b/meta/classes/fs-uuid.bbclass
> > > @@ -4,7 +4,7 @@
> > >  def get_rootfs_uuid(d):
> > >      import subprocess
> > >      rootfs = d.getVar('ROOTFS')
> > > -    output = subprocess.check_output(['tune2fs', '-l', rootfs])
> > > +    output = subprocess.check_output(['tune2fs', '-l', rootfs],
> text=True)
> > >      for line in output.split('\n'):
> > >          if line.startswith('Filesystem UUID:'):
> > >              uuid = line.split()[-1]
> >
> >
> > That looks reasonable, I just wonder how this has worked until now? Why
> > aren't we seeing errors due to this?
> >
> > Does it mean we don't have some test coverage? or was there silent
> > breakage of some kind this fixes?
> >
> > Cheers,
> >
> > Richard
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175583):
> https://lists.openembedded.org/g/openembedded-core/message/175583
> Mute This Topic: https://lists.openembedded.org/mt/95823853/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000003698d305f197c4c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Can you please describe steps to reproduce?</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri 6. Jan 2023 at 13.40,=
 Pawel Zalewski &lt;<a href=3D"mailto:pzalewski@thegoodpenguin.co.uk">pzale=
wski@thegoodpenguin.co.uk</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">It is no=
t actually being used by default in Yocto ?<br>
This was found in kirkstone.<br>
But regardless, it is wrong and will drop an error.<br>
<br>
Kind regards,<br>
Pawel<br>
<br>
On Fri, 6 Jan 2023 at 12:06, Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, 2022-12-22 at 10:38 +0000, Pawel Zalewski wrote:<br>
&gt; &gt; The default return value from subprocess.check_output is an encod=
ed byte.<br>
&gt; &gt; The applied fix will decode the value to a string.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Pawel Zalewski &lt;<a href=3D"mailto:pzalewski@the=
goodpenguin.co.uk" target=3D"_blank">pzalewski@thegoodpenguin.co.uk</a>&gt;=
<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/classes/fs-uuid.bbclass | 2 +-<br>
&gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/classes/fs-uuid.bbclass b/meta/classes/fs-uuid.=
bbclass<br>
&gt; &gt; index 9b53dfba7a..731ea575bd 100644<br>
&gt; &gt; --- a/meta/classes/fs-uuid.bbclass<br>
&gt; &gt; +++ b/meta/classes/fs-uuid.bbclass<br>
&gt; &gt; @@ -4,7 +4,7 @@<br>
&gt; &gt;=C2=A0 def get_rootfs_uuid(d):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 import subprocess<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 rootfs =3D d.getVar(&#39;ROOTFS&#39;)<br>
&gt; &gt; -=C2=A0 =C2=A0 output =3D subprocess.check_output([&#39;tune2fs&#=
39;, &#39;-l&#39;, rootfs])<br>
&gt; &gt; +=C2=A0 =C2=A0 output =3D subprocess.check_output([&#39;tune2fs&#=
39;, &#39;-l&#39;, rootfs], text=3DTrue)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 for line in output.split(&#39;\n&#39;):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if line.startswith(&#39;Filesys=
tem UUID:&#39;):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uuid =3D line.spl=
it()[-1]<br>
&gt;<br>
&gt;<br>
&gt; That looks reasonable, I just wonder how this has worked until now? Wh=
y<br>
&gt; aren&#39;t we seeing errors due to this?<br>
&gt;<br>
&gt; Does it mean we don&#39;t have some test coverage? or was there silent=
<br>
&gt; breakage of some kind this fixes?<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#175583): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/175583" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/175583</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95823853/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/95823853/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000003698d305f197c4c6--

