Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB4CEB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 10:05:46 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web10.7873.1687428335896478184
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 03:05:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=lbs/B623;
 spf=pass (domain: gmail.com, ip: 209.85.222.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-7919957602aso1554953241.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 03:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687428335; x=1690020335;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XbQzuY+F+gkDdAlWGPZkcTkDuf8h7gnFmHuIb5IpXHk=;
        b=lbs/B623QCqGLdpkyvPLGohp/YsYEqtxu9EtYRq+ZyF/gmrG8jT9jux6GDT0AFCM1l
         mB5pN3+EVJJi8Oq1MrFWL0u+7tmXCATuWPhmFe2R3DVpRvulVCptf59h2veyA+jgBqSG
         xGQfqtOFT2Dsw6w0SZATy0vhwbaXg/zCvMl7acjICLWIiCM0uk2LgSw7EB4QFKe2RDTw
         rFpR0P3cq2jB4hP5ifvzC7X/dQslrgRXR/HtNGGHZizbaXdotPleE2AJqZpS1hHJnZiK
         JeIonZhxNWNEF53MvSSrpZQWqsJcOK8j0SwVhOtyCB886pImQzspJAxEYaXSg7IBaTaP
         Iczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687428335; x=1690020335;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XbQzuY+F+gkDdAlWGPZkcTkDuf8h7gnFmHuIb5IpXHk=;
        b=XHKqzOYSJ1+N4Nt5BvXqNxcCf4jW7h4iUQIB70y42n0yV5H6UuepvWdpagM3wwtu8s
         zDlIOu/oWt02mThCwicRcB9x00UjXO9sznVOdiyZ5nDsiRq3s5YgMFUFzjnZegzbjEfA
         ULVhp+3PycFydiwRyiuBw1x5MmGaIJMrygFWKWDNK20ulUUyVHcS8pHpcFglMvpfstpR
         O/osQw2DNkg27I+R8u9VxxME2awzn2BxMIQ3vYVNNImGqIIQcAKo2DeJc65Ngh8GZq4f
         7nrYPJc0rcT4xy+xJmTRjBi76qdv7zlY1/OzoGRZ9M7u4Uinvhj5z98pUtvdJpgzAaci
         lzxQ==
X-Gm-Message-State: AC+VfDzdRofnb4TFzUj4REMfk8+RsgNQpbjP9gKautejGfwfkvkdgCQU
	XRyJrZ1g7wykldzqJQKPK5KKMuCyXFyPjTXZ/bE=
X-Google-Smtp-Source: ACHHUZ6aZpSumIQsE4y1hpvnKPDs6rcXro2Nn2CdiARNPpIWDFv/ZClF08Y5zN5DhynrBKbK94hfPHdDzBpUYl/M8vY=
X-Received: by 2002:a67:d087:0:b0:438:d4bd:f1f2 with SMTP id
 s7-20020a67d087000000b00438d4bdf1f2mr8123852vsi.22.1687428334770; Thu, 22 Jun
 2023 03:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230620221942.2801107-1-jose.quaresma@foundries.io>
 <20230621222232.6575ab6b@booty> <CANPvuRnZX+pVFy0gR_3Xf2P81As+2-yEKyu=112VJr5g47e4_g@mail.gmail.com>
 <20230622113424.2c9a5e4d@booty>
In-Reply-To: <20230622113424.2c9a5e4d@booty>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 22 Jun 2023 11:05:23 +0100
Message-ID: <CANPvuRnAX-5gAQwAwqxwps5zhaM638KHwqX4zjC9tnTOXKD=ig@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V3 1/3] kernel-module-split: make autoload and
 probeconf distribution specific
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>, Ola x Nilsson <Ola.x.Nilsson@axis.com>, 
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Content-Type: multipart/alternative; boundary="0000000000007a61de05feb506df"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 10:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183235

--0000000000007a61de05feb506df
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luca,

Luca Ceresoli <luca.ceresoli@bootlin.com> escreveu no dia quinta,
22/06/2023 =C3=A0(s) 10:34:

> Hi Jose,
>
> On Thu, 22 Jun 2023 00:18:03 +0100
> "Jose Quaresma" <quaresma.jose@gmail.com> wrote:
>
> > Hi Luca,
> >
> > Luca Ceresoli <luca.ceresoli@bootlin.com> escreveu no dia quarta,
> > 21/06/2023 =C3=A0(s) 21:22:
> >
> > > Hi Jose,
> > >
> > > On Tue, 20 Jun 2023 22:19:42 +0000
> > > "Jose Quaresma" <quaresma.jose@gmail.com> wrote:
> > >
> > > > Also take the oportunity to only add configuration files to FILES
> > > > and CONFFILES when they exist and are used.
> > > >
> > > > The modules-load.d [1] - Configure kernel modules to load at boot
> > > > should install their configuration files in /usr/lib/modules-load.d=
.
> > > >
> > > > The modprobe.d [2] - Configuration directory for modprobe
> > > > should install their configuration files in /lib/modprobe.d
> > > >
> > > > [1]
> https://www.freedesktop.org/software/systemd/man/modules-load.d.html
> > > > [2] https://www.man7.org/linux/man-pages//man5/modprobe.d.5.html
> > > >
> > > > [YOCTO #12212]
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12212
> > > >
> > > > CC: Ola x Nilsson <Ola.x.Nilsson@axis.com>
> > > > CC: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > >
> > > We're having this error on the autobuilders:
> > >
> > > ERROR: linux-yocto-6.1.33+gitAUTOINC+db25e51e20_947f660bde-r0
> do_package:
> > > QA Issue: linux-yocto: Files/directories were installed but not
> shipped in
> > > any package:
> > >   /etc
> > >
> > > May it be caused by this series?
> > >
> >
> > I have another mistake on the patch that doesn't work without systemd.
> > My fault, on my tests it's been working well because I use the systemd.
> > I will send a V4 and helpfully is the last one.
> >
> > Sorry and thanks for testing.
>
> No problem!
>
> In case it helps your debugging, here is a different kind of error that
> happened in the same AB run:
>
> ERROR: lttng-modules-2.13.9-r0 do_package: Error executing a python
> function in exec_func_python() autogenerated:
> ...
> Exception: FileNotFoundError: [Errno 2] No such file or directory:
> '/home/pokybuild/yocto-worker/beaglebone-alt/build/build/tmp/work/beagleb=
one_yocto-poky-linux-gnueabi/lttng-modules/2.13.9-r0/package/usr/lib/modpro=
be.d'
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/106/builds/6304/s=
teps/12/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/104/builds/6236/s=
teps/11/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/103/builds/6233/s=
teps/12/logs/stdio
>
>
It helps for sure, I have found this also when fixing the last issue on v3,
fixed in v4.

-    for dir in ["%s/etc/modprobe.d" % (dvar), "%s/etc/modules-load.d" %
(dvar), "%s/etc" % (dvar)]:
-        if len(os.listdir(dir)) =3D=3D 0:
+    for dir in ["%s%s" % (dvar, modprobedir), "%s%s" % (dvar,
modulesloaddir), "%s%s" % (dvar, d.getVar('sysconfdir'))]:
+        if os.path.isdir(dir) and len(os.listdir(dir)) =3D=3D 0:

Let's see if v4 will bring anything new.

Jose

Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000007a61de05feb506df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Luca,</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Luca Ceresoli &lt;<a href=3D"mailto:luca.cere=
soli@bootlin.com">luca.ceresoli@bootlin.com</a>&gt; escreveu no dia quinta,=
 22/06/2023 =C3=A0(s) 10:34:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Hi Jose,<br>
<br>
On Thu, 22 Jun 2023 00:18:03 +0100<br>
&quot;Jose Quaresma&quot; &lt;<a href=3D"mailto:quaresma.jose@gmail.com" ta=
rget=3D"_blank">quaresma.jose@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Hi Luca,<br>
&gt; <br>
&gt; Luca Ceresoli &lt;<a href=3D"mailto:luca.ceresoli@bootlin.com" target=
=3D"_blank">luca.ceresoli@bootlin.com</a>&gt; escreveu no dia quarta,<br>
&gt; 21/06/2023 =C3=A0(s) 21:22:<br>
&gt; <br>
&gt; &gt; Hi Jose,<br>
&gt; &gt;<br>
&gt; &gt; On Tue, 20 Jun 2023 22:19:42 +0000<br>
&gt; &gt; &quot;Jose Quaresma&quot; &lt;<a href=3D"mailto:quaresma.jose@gma=
il.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; wrote:<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; Also take the oportunity to only add configuration files to =
FILES<br>
&gt; &gt; &gt; and CONFFILES when they exist and are used.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The modules-load.d [1] - Configure kernel modules to load at=
 boot<br>
&gt; &gt; &gt; should install their configuration files in /usr/lib/modules=
-load.d.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The modprobe.d [2] - Configuration directory for modprobe<br=
>
&gt; &gt; &gt; should install their configuration files in /lib/modprobe.d<=
br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; [1] <a href=3D"https://www.freedesktop.org/software/systemd/=
man/modules-load.d.html" rel=3D"noreferrer" target=3D"_blank">https://www.f=
reedesktop.org/software/systemd/man/modules-load.d.html</a><br>
&gt; &gt; &gt; [2] <a href=3D"https://www.man7.org/linux/man-pages//man5/mo=
dprobe.d.5.html" rel=3D"noreferrer" target=3D"_blank">https://www.man7.org/=
linux/man-pages//man5/modprobe.d.5.html</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; [YOCTO #12212] <a href=3D"https://bugzilla.yoctoproject.org/=
show_bug.cgi?id=3D12212" rel=3D"noreferrer" target=3D"_blank">https://bugzi=
lla.yoctoproject.org/show_bug.cgi?id=3D12212</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; CC: Ola x Nilsson &lt;<a href=3D"mailto:Ola.x.Nilsson@axis.c=
om" target=3D"_blank">Ola.x.Nilsson@axis.com</a>&gt;<br>
&gt; &gt; &gt; CC: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerst=
edt@axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
&gt; &gt; &gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quar=
esma@foundries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;=C2=
=A0 <br>
&gt; &gt;<br>
&gt; &gt; We&#39;re having this error on the autobuilders:<br>
&gt; &gt;<br>
&gt; &gt; ERROR: linux-yocto-6.1.33+gitAUTOINC+db25e51e20_947f660bde-r0 do_=
package:<br>
&gt; &gt; QA Issue: linux-yocto: Files/directories were installed but not s=
hipped in<br>
&gt; &gt; any package:<br>
&gt; &gt;=C2=A0 =C2=A0/etc<br>
&gt; &gt;<br>
&gt; &gt; May it be caused by this series?<br>
&gt; &gt;=C2=A0 <br>
&gt; <br>
&gt; I have another mistake on the patch that doesn&#39;t work without syst=
emd.<br>
&gt; My fault, on my tests it&#39;s been working well because I use the sys=
temd.<br>
&gt; I will send a V4 and helpfully is the last one.<br>
&gt; <br>
&gt; Sorry and thanks for testing.<br>
<br>
No problem!<br>
<br>
In case it helps your debugging, here is a different kind of error that<br>
happened in the same AB run:<br>
<br>
ERROR: lttng-modules-2.13.9-r0 do_package: Error executing a python functio=
n in exec_func_python() autogenerated:<br>
...<br>
Exception: FileNotFoundError: [Errno 2] No such file or directory: &#39;/ho=
me/pokybuild/yocto-worker/beaglebone-alt/build/build/tmp/work/beaglebone_yo=
cto-poky-linux-gnueabi/lttng-modules/2.13.9-r0/package/usr/lib/modprobe.d&#=
39;<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/106/buil=
ds/6304/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/typhoon/#/builders/106/builds/6304/steps/12/log=
s/stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/104/buil=
ds/6236/steps/11/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/typhoon/#/builders/104/builds/6236/steps/11/log=
s/stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/103/buil=
ds/6233/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/typhoon/#/builders/103/builds/6233/steps/12/log=
s/stdio</a><br>
<br></blockquote><div><br></div><div>It helps for=C2=A0sure, I have found t=
his=C2=A0also when fixing the last issue on v3, fixed in v4.<br><br></div><=
div><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">-=C2=A0 =C2=A0 fo=
r dir in [&quot;%s/etc/modprobe.d&quot; % (dvar), &quot;%s/etc/modules-load=
.d&quot; % (dvar), &quot;%s/etc&quot; % (dvar)]:<br></span><span style=3D"c=
olor:rgb(0,0,0)">-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(os.listdir(dir)) =3D=
=3D 0:</span><br style=3D"color:rgb(0,0,0)"><span style=3D"color:rgb(0,0,0)=
">+=C2=A0 =C2=A0 for dir in [&quot;%s%s&quot; % (dvar, modprobedir), &quot;=
%s%s&quot; % (dvar, modulesloaddir), &quot;%s%s&quot; % (dvar, d.getVar(&#3=
9;sysconfdir&#39;))]:</span><br style=3D"color:rgb(0,0,0)"><span style=3D"c=
olor:rgb(0,0,0)">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.isdir(dir) and len=
(os.listdir(dir)) =3D=3D 0:</span><br></div><div><br>Let&#39;s see if v4 wi=
ll bring anything=C2=A0new.<br><br>Jose</div><div><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
Luca<br>
<br>
-- <br>
Luca Ceresoli, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--0000000000007a61de05feb506df--

