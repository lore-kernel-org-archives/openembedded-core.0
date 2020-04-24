Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web10.8558.1587743778785110676
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2020 08:56:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nEuGczV5;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: kergoth@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id s10so7609459edy.9
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2020 08:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BzRikAvrFeePK8fd33l/SmXdpbEvoEiamwRYcE/nuTg=;
        b=nEuGczV5KVHhOKgoN9ElABKzLOPO8l3HtmUlYdyGd7GiCiMZ3hDsCNSLVI7lkJzfE7
         Gst1hkMPJs3PLj7YJu6XlKa1tlhBuMDU+A+czTiz1frMz1WzejzJQuRk49EeZzaWBQlB
         syxnkzAqUUY6B9L/7yRo0lxvPK/oq/Ax1bAcCZEf7DyWKd3umpvTy2+JStpvkpjKOKsq
         N6vaJN/ZweisKptY1x4ci0ttZsjmHRTJjR9D1X82djN1JHq1ok+82do2WuK5EkF/bGRu
         jKbt0m2sUS32UCYAhRaZMVoAknahM2JUfnJPOrieZ0EQcckE8xr86P6m3r1nGzVgPfJX
         F0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BzRikAvrFeePK8fd33l/SmXdpbEvoEiamwRYcE/nuTg=;
        b=qFzn3lZqItn1QcjUJEtJ6QV2ygHAHilnqprxUxuHBOKvSdiW/t2QqhyK8ccn80nXxW
         4wQTil32le7VMK+YJ55ZhQRlX2M7OfbA6psSfkxUdc537M3Gzf0gFurDrgIvYFO3PIC9
         t2enSN/qYhicpx2Jc6x2I41oJFyBhUxTnrG2DLSb2f+LPXC8N3BX9H8b0nNjlYp0DUwM
         HUA9e+t4jtXTAjZbll7JkZXDQbC3RrmMkdRiZaudVeUY0u3FVcBy5Lu20/rMtSwWSXds
         sBfvjqNP6l5XdDf9TOPUrlG/3oM3msthOUcUe7dcV9WB8XRiGEzS85VF/kH4nexl4k9t
         3wmg==
X-Gm-Message-State: AGi0PuZYjmJJ9JEyFtXwGF0J5IUbkIOlXa5UNvu2ZYbeqzNcchg1CrZg
	b8SMByxBGdzGrvmnRm5sFHuO3bZ/PVQGqKcYB+k=
X-Google-Smtp-Source: APiQypLj/4xPmQsuqH/ijU40dPw7olbkG6mRUzhsku90dw0naznSPgp2Sr3vRBaV29ruLNyPX8BRzqeXH/3xnFg8p2g=
X-Received: by 2002:aa7:cc88:: with SMTP id p8mr7899069edt.387.1587743777293;
 Fri, 24 Apr 2020 08:56:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200424133032.7181-1-ricardo@ribalda.com>
In-Reply-To: <20200424133032.7181-1-ricardo@ribalda.com>
From: "Christopher Larson" <kergoth@gmail.com>
Date: Fri, 24 Apr 2020 08:56:06 -0700
Message-ID: <CABcZANkfogiK1+DoZ4r4RFr_mNpBySa69o0ZeTrTUvwu6DJRYg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] RFC wic: Support .wks files for multiple machines
To: Ricardo Ribalda <ricardo.ribalda@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, henrik@newtec.dk, 
	Ricardo Ribalda Delgado <ricardo@ribalda.com>
Content-Type: multipart/alternative; boundary="000000000000d7096205a40b6749"

--000000000000d7096205a40b6749
Content-Type: text/plain; charset="UTF-8"

This will only work the way you expect if hte user's local.conf uses ?= or
??= for MACHINE, otherwise setting it in the environment will do nothing.

On Fri, Apr 24, 2020 at 6:30 AM Ricardo Ribalda <ricardo.ribalda@gmail.com>
wrote:

> If you want to make a disk image containing rootfs for different
> machines, the only way to do it today is by calling wic and passing the
> different rootfs-paths.
>
> Eg:
> combined.wks
> part /export --source rootfs --rootfs-dir=target-image
> part / --source rootfs
>
> bitbake multiconfig:arm:target-image
> wic create combined --rootfs-dir
> target-image=/workdir/build/tmp/work/arm-poky-linux/target-image/1.0-r0/rootfs/
> -e main
>
> This has many drawbacks:
> 1) You need to know the folder location for the target-image
> 2) It is easy to forget updating the target (only running wic and not
>    bitbake)
> 3) It is slow
> 4) It does not scale when you have multiple machines
>
> Instead, wic can be given a hint of what machine to search for:
>
> combined.wks
> part /export --source rootfs --rootfs-dir=arm:target-image
> part / --source rootfs
>
> bitbake main
>
> If we ensoure the dependency of target-image from main via
> do_image[mcdepends], all the dependencies are automatically
> handled.
>
> This patch makes wic aware of the machine to use.
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> ---
>  scripts/lib/wic/misc.py | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
> index 91975ba151..51b43b49aa 100644
> --- a/scripts/lib/wic/misc.py
> +++ b/scripts/lib/wic/misc.py
> @@ -206,7 +206,12 @@ class BitbakeVars(defaultdict):
>
>          if image not in self:
>              if image and self.vars_dir:
> -                fname = os.path.join(self.vars_dir, image + '.env')
> +                if image.find(":") != -1:
> +                    [machine, img] = image.split(":")
> +                    fname = os.path.join(self.vars_dir, "../../",
> +                                         machine, "imgdata", img + '.env')
> +                else:
> +                    fname = os.path.join(self.vars_dir, image + '.env')
>                  if os.path.isfile(fname):
>                      # parse .env file
>                      with open(fname) as varsfile:
> @@ -220,11 +225,16 @@ class BitbakeVars(defaultdict):
>                  # Get bitbake -e output
>                  cmd = "bitbake -e"
>                  if image:
> -                    cmd += " %s" % image
> +                    if image.find(":") != -1:
> +                        [machine, img] = image.split(":")
> +                        cmd = "MACHINE=%s %s" % (machine, cmd)
> +                    else:
> +                        img = image
> +                    cmd += " %s" % img
>
>                  log_level = logger.getEffectiveLevel()
>                  logger.setLevel(logging.INFO)
> -                ret, lines = _exec_cmd(cmd)
> +                ret, lines = _exec_cmd(cmd, as_shell=True)
>                  logger.setLevel(log_level)
>
>                  if ret:
> --
> 2.26.1
>
> 
>


-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--000000000000d7096205a40b6749
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This will only work the way you expect if hte user&#39;s l=
ocal.conf uses ?=3D or ??=3D for MACHINE, otherwise setting it in the envir=
onment will do nothing.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Fri, Apr 24, 2020 at 6:30 AM Ricardo Ribalda &lt;=
<a href=3D"mailto:ricardo.ribalda@gmail.com">ricardo.ribalda@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">If yo=
u want to make a disk image containing rootfs for different<br>
machines, the only way to do it today is by calling wic and passing the<br=
>
different rootfs-paths.<br>
<br>
Eg:<br>
combined.wks<br>
part /export --source rootfs --rootfs-dir=3Dtarget-image<br>
part / --source rootfs<br>
<br>
bitbake multiconfig:arm:target-image<br>
wic create combined --rootfs-dir target-image=3D/workdir/build/tmp/work/ar=
m-poky-linux/target-image/1.0-r0/rootfs/ -e main<br>
<br>
This has many drawbacks:<br>
1) You need to know the folder location for the target-image<br>
2) It is easy to forget updating the target (only running wic and not<br>
=C2=A0 =C2=A0bitbake)<br>
3) It is slow<br>
4) It does not scale when you have multiple machines<br>
<br>
Instead, wic can be given a hint of what machine to search for:<br>
<br>
combined.wks<br>
part /export --source rootfs --rootfs-dir=3Darm:target-image<br>
part / --source rootfs<br>
<br>
bitbake main<br>
<br>
If we ensoure the dependency of target-image from main via<br>
do_image[mcdepends], all the dependencies are automatically<br>
handled.<br>
<br>
This patch makes wic aware of the machine to use.<br>
<br>
Signed-off-by: Ricardo Ribalda Delgado &lt;<a href=3D"mailto:ricardo@ribal=
da.com" target=3D"_blank">ricardo@ribalda.com</a>&gt;<br>
---<br>
=C2=A0scripts/lib/wic/misc.py | 16 +++++++++++++---<br>
=C2=A01 file changed, 13 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py<br>
index 91975ba151..51b43b49aa 100644<br>
--- a/scripts/lib/wic/misc.py<br>
+++ b/scripts/lib/wic/misc.py<br>
@@ -206,7 +206,12 @@ class BitbakeVars(defaultdict):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if image not in self:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if image and self.vars_dir=
:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fname =3D os.path=
.join(self.vars_dir, image + &#39;.env&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if image.find(&qu=
ot;:&quot;) !=3D -1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ma=
chine, img] =3D image.split(&quot;:&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fna=
me =3D os.path.join(self.vars_dir, &quot;../../&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m=
achine, &quot;imgdata&quot;, img + &#39;.env&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fna=
me =3D os.path.join(self.vars_dir, image + &#39;.env&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.i=
sfile(fname):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0# parse .env file<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0with open(fname) as varsfile:<br>
@@ -220,11 +225,16 @@ class BitbakeVars(defaultdict):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Get bitbak=
e -e output<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D &quo=
t;bitbake -e&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if image:<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd=
 +=3D &quot; %s&quot; % image<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if =
image.find(&quot;:&quot;) !=3D -1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 [machine, img] =3D image.split(&quot;:&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 cmd =3D &quot;MACHINE=3D%s %s&quot; % (machine, cmd)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 els=
e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 img =3D image<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd=
 +=3D &quot; %s&quot; % img<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0log_level =
=3D logger.getEffectiveLevel()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger.setLe=
vel(logging.INFO)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret, lines =3D _e=
xec_cmd(cmd)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret, lines =3D _e=
xec_cmd(cmd, as_shell=3DTrue)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger.setLe=
vel(log_level)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ret:<br>
-- <br>
2.26.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christop=
her Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, =
OpenZaurus<br>Senior Software Engineer, Mentor Graphics</div></div></div></=
div>

--000000000000d7096205a40b6749--
