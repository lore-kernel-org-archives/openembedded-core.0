Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17CDFEB64DA
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 10:13:36 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web10.7988.1687428813294856031
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 03:13:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=p9QQeGpA;
 spf=pass (domain: gmail.com, ip: 209.85.222.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-7918b56b1e1so1763308241.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 03:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687428812; x=1690020812;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CgNNjomAiWYp9P0oHKgycPkBpeZPnJVEfH0ts6Jw6GQ=;
        b=p9QQeGpA5a+/sNzr5kj4L6cyMGAwMhQKVpzyuzIzv38HFfqcVR9RWiwQzIxOvGTaXj
         LjSm3r097fkAq15+/DNs5v1s3psLMyiDu1uljHlfpI+nknS0IU3iy4w2bRcAUfU1D+5W
         N8BP4Oo1c8wX2X1vaRZ4J+f0xqoVAO43NLEAHvf0qKPiNY84uSD3CAT/ZQMsJ3IPHk0K
         GDSfXmWpxxT3yUPxdyiXV6gi+nxYDKXdvMtSKC9pBfn9q4qlcSe0IFiACb7WgQ0ma8Qk
         M7OcncVEPiX2hDHfEQgKKnAUHdFdPl3k/K/K0O+BF0g4tZ8zLXpISrZ4qVolxsi0iuA1
         IG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687428812; x=1690020812;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CgNNjomAiWYp9P0oHKgycPkBpeZPnJVEfH0ts6Jw6GQ=;
        b=UO6qVe4pVOd573GT1ZSx6kENLZNGSlj/vlRfkhkFXW+5XsglD04YKSpnI1fAeMhPLl
         pgO6JsJS50VsTGC3oqoGagiew8CyaD0PrmjS4QVy5XfGNu9TBAxk8cKGNFAjyMFVaIlR
         GeS/TNGeeemcDV7KcR9Iw8erITcIp3grZmTJSQmIr3IOpiekaBztMJ1NCbdRmK9OxnxD
         zaN8XkliVuUQF5h6tG63Rb8FUA5pMds/RlW5uD2+1LpJTwBlN7ne70hg+BEqJrkUSpzi
         d/neot4IiKH5w4hJ2xpKK7m+XBwYHIsnE244XKa2cb2D3D1XlKnfdGwJ97BpU06/0wN7
         4tnQ==
X-Gm-Message-State: AC+VfDxw4n6JsH7MKAOsNyRs3tCtctfIJBCghMh7dBQO40y3OGjQWOkP
	wulVs9+j36rn8Kpw+RvNZxjAavRO0O8V0ygILQlsfQqP35UxkzxK
X-Google-Smtp-Source: ACHHUZ5UBpRQyJRZbQkhroR+vLR06UxxYMAEek7oVDNZ9LOu3SfRLTg4GXIVmbk7/K4Ld8f7YvW+dyHvpwLTWTtC0uE=
X-Received: by 2002:a05:6102:499:b0:440:ab90:7c95 with SMTP id
 n25-20020a056102049900b00440ab907c95mr7938247vsa.9.1687428812308; Thu, 22 Jun
 2023 03:13:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230622084452.2026849-1-jose.quaresma@foundries.io> <DB5PR02MB102131AE5F3ADE6C7AEB5B197EF22A@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB102131AE5F3ADE6C7AEB5B197EF22A@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 22 Jun 2023 11:13:21 +0100
Message-ID: <CANPvuRm4-uPVN9T_56AzFN9ajRa7M0OczX3WfOj7w0GmH3+=rg@mail.gmail.com>
Subject: Re: [PATCH V4 1/3] kernel-module-split: make autoload and probeconf
 distribution specific
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Jose Quaresma <jose.quaresma@foundries.io>, Ola x Nilsson <Ola.x.Nilsson@axis.com>
Content-Type: multipart/alternative; boundary="000000000000f103cf05feb52239"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 10:13:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183236

--000000000000f103cf05feb52239
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Peter Kjellerstedt <peter.kjellerstedt@axis.com> escreveu no dia quinta,
22/06/2023 =C3=A0(s) 10:49:

> > -----Original Message-----
> > From: Jose Quaresma <quaresma.jose@gmail.com>
> > Sent: den 22 juni 2023 10:45
> > To: openembedded-core@lists.openembedded.org
> > Cc: Jose Quaresma <jose.quaresma@foundries.io>; Ola x Nilsson <
> Ola.x.Nilsson@axis.com>; Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Subject: [PATCH V4 1/3] kernel-module-split: make autoload and probecon=
f
> distribution specific
> >
> > Also take the oportunity to only add configuration files to FILES
> > and CONFFILES when they exist and are used.
> >
> > The modules-load.d [1] - Configure kernel modules to load at boot
> > should install their configuration files in /usr/lib/modules-load.d.
> >
> > The modprobe.d [2] - Configuration directory for modprobe
> > should install their configuration files in /lib/modprobe.d
> >
> > [1] https://www.freedesktop.org/software/systemd/man/modules-load.d.htm=
l
> > [2] https://www.man7.org/linux/man-pages//man5/modprobe.d.5.html
> >
> > [YOCTO #12212] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1221=
2
> >
> > CC: Ola x Nilsson <Ola.x.Nilsson@axis.com>
> > CC: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >
> > v4: also remove the sysconfdir when systemd is not used as it causes
> > QA Issue: linux-yocto: Files/directories were installed but not shipped
> in
> > any package
> >
> > v3: fix v2 build issue and only add configuration files to FILES
> > and CONFFILES when they exist and are used.
> >
> > v2: use the same location as before on the class and define the new
> > location just for systemd.
> >
> >  .../kernel-module-split.bbclass               | 38 ++++++++++---------
> >  .../distro/include/init-manager-systemd.inc   |  4 ++
> >  2 files changed, 24 insertions(+), 18 deletions(-)
> >
> > diff --git a/meta/classes-recipe/kernel-module-split.bbclass
> b/meta/classes-recipe/kernel-module-split.bbclass
> > index 50882c31a7..1d5e39b44d 100644
> > --- a/meta/classes-recipe/kernel-module-split.bbclass
> > +++ b/meta/classes-recipe/kernel-module-split.bbclass
>
> [cut]
>
> > @@ -189,8 +191,8 @@ python split_kernel_module_packages () {
> >      # avoid warnings. removedirs only raises an OSError if an empty
> >      # directory cannot be removed.
> >      dvar =3D d.getVar('PKGD')
> > -    for dir in ["%s/etc/modprobe.d" % (dvar), "%s/etc/modules-load.d" =
%
> (dvar), "%s/etc" % (dvar)]:
> > -        if len(os.listdir(dir)) =3D=3D 0:
> > +    for dir in ["%s%s" % (dvar, modprobedir), "%s%s" % (dvar,
> modulesloaddir), "%s%s" % (dvar, d.getVar('sysconfdir'))]:
> > +        if os.path.isdir(dir) and len(os.listdir(dir)) =3D=3D 0:
> >              os.rmdir(dir)
> >  }
> >
>
> But if modprobedir and modulesloaddir are /usr/lib-based, why should this
> code
> try to remove /etc? Don't you really want something corresponding to:
>
> rmdir -p --ignore-fail-on-non-empty ${PKGD}${modprobedir}
> ${PKGD}${modulesloaddir}
>
> e.g.:
>
>     for dir in ["%s%s" % (dvar, modprobedir), "%s%s" % (dvar,
> modulesloaddir)]:
>         while dir !=3D "/" and os.path.isdir(dir) and len(os.listdir(dir)=
)
> =3D=3D 0:
>             os.rmdir(dir)
>             dir =3D os.path.dirname(dir)
>
> //Peter
>
>
I have another patch to remove this block internally where we only create
the directories
when needed (if we have mod config files) and with that we do not need to
remove the end.
I will submit after this series passing the tests on the autobuilder.

Jose

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000f103cf05feb52239
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjelle=
rstedt@axis.com">peter.kjellerstedt@axis.com</a>&gt; escreveu no dia quinta=
, 22/06/2023 =C3=A0(s) 10:49:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">&gt; -----Original Message-----<br>
&gt; From: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" tar=
get=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; Sent: den 22 juni 2023 10:45<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Cc: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foundries.io" ta=
rget=3D"_blank">jose.quaresma@foundries.io</a>&gt;; Ola x Nilsson &lt;<a hr=
ef=3D"mailto:Ola.x.Nilsson@axis.com" target=3D"_blank">Ola.x.Nilsson@axis.c=
om</a>&gt;; Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axi=
s.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
&gt; Subject: [PATCH V4 1/3] kernel-module-split: make autoload and probeco=
nf distribution specific<br>
&gt; <br>
&gt; Also take the oportunity to only add configuration files to FILES<br>
&gt; and CONFFILES when they exist and are used.<br>
&gt; <br>
&gt; The modules-load.d [1] - Configure kernel modules to load at boot<br>
&gt; should install their configuration files in /usr/lib/modules-load.d.<b=
r>
&gt; <br>
&gt; The modprobe.d [2] - Configuration directory for modprobe<br>
&gt; should install their configuration files in /lib/modprobe.d<br>
&gt; <br>
&gt; [1] <a href=3D"https://www.freedesktop.org/software/systemd/man/module=
s-load.d.html" rel=3D"noreferrer" target=3D"_blank">https://www.freedesktop=
.org/software/systemd/man/modules-load.d.html</a><br>
&gt; [2] <a href=3D"https://www.man7.org/linux/man-pages//man5/modprobe.d.5=
.html" rel=3D"noreferrer" target=3D"_blank">https://www.man7.org/linux/man-=
pages//man5/modprobe.d.5.html</a><br>
&gt; <br>
&gt; [YOCTO #12212] <a href=3D"https://bugzilla.yoctoproject.org/show_bug.c=
gi?id=3D12212" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctop=
roject.org/show_bug.cgi?id=3D12212</a><br>
&gt; <br>
&gt; CC: Ola x Nilsson &lt;<a href=3D"mailto:Ola.x.Nilsson@axis.com" target=
=3D"_blank">Ola.x.Nilsson@axis.com</a>&gt;<br>
&gt; CC: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.c=
om" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt; <br>
&gt; v4: also remove the sysconfdir when systemd is not used as it causes<b=
r>
&gt; QA Issue: linux-yocto: Files/directories were installed but not shippe=
d in<br>
&gt; any package<br>
&gt; <br>
&gt; v3: fix v2 build issue and only add configuration files to FILES<br>
&gt; and CONFFILES when they exist and are used.<br>
&gt; <br>
&gt; v2: use the same location as before on the class and define the new<br=
>
&gt; location just for systemd.<br>
&gt; <br>
&gt;=C2=A0 .../kernel-module-split.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 38 ++++++++++---------<br>
&gt;=C2=A0 .../distro/include/init-manager-systemd.inc=C2=A0 =C2=A0|=C2=A0 =
4 ++<br>
&gt;=C2=A0 2 files changed, 24 insertions(+), 18 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/cl=
asses-recipe/kernel-module-split.bbclass<br>
&gt; index 50882c31a7..1d5e39b44d 100644<br>
&gt; --- a/meta/classes-recipe/kernel-module-split.bbclass<br>
&gt; +++ b/meta/classes-recipe/kernel-module-split.bbclass<br>
<br>
[cut]<br>
<br>
&gt; @@ -189,8 +191,8 @@ python split_kernel_module_packages () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # avoid warnings. removedirs only raises an OSErro=
r if an empty<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # directory cannot be removed.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 dvar =3D d.getVar(&#39;PKGD&#39;)<br>
&gt; -=C2=A0 =C2=A0 for dir in [&quot;%s/etc/modprobe.d&quot; % (dvar), &qu=
ot;%s/etc/modules-load.d&quot; % (dvar), &quot;%s/etc&quot; % (dvar)]:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(os.listdir(dir)) =3D=3D 0:<br>
&gt; +=C2=A0 =C2=A0 for dir in [&quot;%s%s&quot; % (dvar, modprobedir), &qu=
ot;%s%s&quot; % (dvar, modulesloaddir), &quot;%s%s&quot; % (dvar, d.getVar(=
&#39;sysconfdir&#39;))]:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.isdir(dir) and len(os.listdir(=
dir)) =3D=3D 0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.rmdir(dir)<br>
&gt;=C2=A0 }<br>
&gt;<br>
<br>
But if modprobedir and modulesloaddir are /usr/lib-based, why should this c=
ode <br>
try to remove /etc? Don&#39;t you really want something corresponding to:<b=
r>
<br>
rmdir -p --ignore-fail-on-non-empty ${PKGD}${modprobedir} ${PKGD}${modulesl=
oaddir}<br>
<br>
e.g.:<br>
<br>
=C2=A0 =C2=A0 for dir in [&quot;%s%s&quot; % (dvar, modprobedir), &quot;%s%=
s&quot; % (dvar, modulesloaddir)]:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 while dir !=3D &quot;/&quot; and os.path.isdir(=
dir) and len(os.listdir(dir)) =3D=3D 0:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.rmdir(dir)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dir =3D os.path.dirname(dir)<br>
<br>
//Peter<br>
<br>
</blockquote></div><br>I have another patch to remove this block internally=
 where we only create the directories<div>when needed (if we have mod confi=
g files) and with that=C2=A0we do not need to remove the end.<br>I will sub=
mit after this series passing the tests on the autobuilder.<br clear=3D"all=
"><div><br></div><div>Jose<br><br></div><span class=3D"gmail_signature_pref=
ix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"lt=
r">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></div></div>

--000000000000f103cf05feb52239--

