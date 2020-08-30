Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com [209.85.221.196])
 by mx.groups.io with SMTP id smtpd.web11.39384.1598820248644452850
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2020 13:44:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZBDpwz+V;
 spf=pass (domain: gmail.com, ip: 209.85.221.196, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f196.google.com with SMTP id s127so900543vkg.3
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2020 13:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vZNcf8+jiGZd7MU4xVsT6D+7gau79ELBW2SD8EJ6xYg=;
        b=ZBDpwz+Vxhd42GKZfYY4qp3mpkVG0fCedR/kTd0uSPlU6tfsQOBjqT98S8Nt8DzsrO
         yFMU+ywtFkHcC1FtQgM2GrduR0KOqe79LyM0MDJjPBXtRSA6qg7SfoBcr4pQa3q+C44U
         IwR0PYFcs/u3ZWpOaOslstHUAJ1EVdCRHSuGHicBcC8vWYosIFqUpovs2YoHEFisToiN
         mwEJj1ezUDDTiLfK350Gj+Brya8vppSLDUXA5SPJ954+z0bwBSZAtENSpA9OOYmEDGVZ
         OegMdu7wRwh6E45Hw1OwiHvA8YKHMrU5xCsQiW6x+iMuQHb4nCl+aLZufq6upX9BhBKw
         l6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vZNcf8+jiGZd7MU4xVsT6D+7gau79ELBW2SD8EJ6xYg=;
        b=LTk1zh3Ri6P6ynjoM1cDktQG2j079mESWQNhJylHbPNiydCNU7PcmssegA+o2Fd+J8
         5da4oBv6NyqFW6ioDlc0N2ys3EeihEKl5LX8xX01Ka1WJOQczjyzw0geg04b1IC7tjr4
         WQTzeRtrbBn6p4WNvVwkxI4eQ7YevIhypNjVIG216sMfOhEhBuhDfkhhTWE9INvOMVMe
         KWkgZB+NgZl+CsaT3eJDQJ7D6bQ1mnKqUHGRHnTqkLu39YOf7LCgIjm3ce77nDAqOn5a
         x2sfwTfyfd3vZazsnpMsZLt76fDFpqBH1AWlaL3xaJNgXRD+7h+VPKJIlWlaDKokQspe
         OgwA==
X-Gm-Message-State: AOAM532/iWu3hSIUHbcLOOZ3cOvEciTDQltptvDa5mGWXHARPxd0JMM3
	WHW4QwCoA1qZ6gQMmh9nhoYDbCqU+zwDTLKW7OM=
X-Google-Smtp-Source: ABdhPJzyAf3h4LPhUSMIzA6hqiO4P0IMOmqbgt81jQmJq5OZbjankqpeUL0PBHxNaG/PzM0xSbv4d8isIa7rXRte4q8=
X-Received: by 2002:a1f:286:: with SMTP id 128mr4093491vkc.96.1598820247789;
 Sun, 30 Aug 2020 13:44:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200830201522.23701-1-vvavrychuk@gmail.com>
In-Reply-To: <20200830201522.23701-1-vvavrychuk@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sun, 30 Aug 2020 22:43:56 +0200
Message-ID: <CANNYZj-fw2YVGczSP+c7gjor6eKhYsjDgM1w-1AYD6MpDHQscA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] runqemu: Change virtio-vga to virtio-gpu.
To: Vasyl Vavrychuk <vvavrychuk@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ede59b05ae1e58d2"

--000000000000ede59b05ae1e58d2
Content-Type: text/plain; charset="UTF-8"

Do the virgl selftests still pass with this change? Please run

oe-selftest -r runtime_test.TestImage.test_testimage_virgl_gtk_sdl

and

oe-selftest -r runtime_test.TestImage.test_testimage_virgl_headless

Alex


On Sun, 30 Aug 2020 at 22:15, Vasyl Vavrychuk <vvavrychuk@gmail.com> wrote:

> virtio-vga is available in QEMU only for hppa, i386, and ppc
> architectures. On the other hand, virtio-gpu is available for all
> architectures.
>
> Signed-off-by: Vasyl Vavrychuk <vvavrychuk@gmail.com>
> ---
>  scripts/runqemu | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 7fb5f7db57..5d6b35ffe4 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -461,19 +461,19 @@ class BaseConfig(object):
>              elif arg == 'sdl':
>                  if 'gl' in sys.argv[1:]:
>                      self.set_dri_path()
> -                    self.qemu_opt_script += ' -vga virtio -display
> sdl,gl=on,show-cursor=on'
> +                    self.qemu_opt_script += ' -device virtio-gpu -display
> sdl,gl=on,show-cursor=on'
>                  elif 'gl-es' in sys.argv[1:]:
>                      self.set_dri_path()
> -                    self.qemu_opt_script += ' -vga virtio -display
> sdl,gl=es,show-cursor=on'
> +                    self.qemu_opt_script += ' -device virtio-gpu -display
> sdl,gl=es,show-cursor=on'
>                  else:
>                      self.qemu_opt_script += ' -display sdl,show-cursor=on'
>              elif arg == 'gtk':
>                  if 'gl' in sys.argv[1:]:
>                      self.set_dri_path()
> -                    self.qemu_opt_script += ' -vga virtio -display
> gtk,gl=on,show-cursor=on'
> +                    self.qemu_opt_script += ' -device virtio-gpu -display
> gtk,gl=on,show-cursor=on'
>                  elif 'gl-es' in sys.argv[1:]:
>                      self.set_dri_path()
> -                    self.qemu_opt_script += ' -vga virtio -display
> gtk,gl=es,show-cursor=on'
> +                    self.qemu_opt_script += ' -device virtio-gpu -display
> gtk,gl=es,show-cursor=on'
>                  else:
>                      self.qemu_opt_script += ' -display gtk,show-cursor=on'
>              elif arg == 'gl' or arg == 'gl-es':
> @@ -482,7 +482,7 @@ class BaseConfig(object):
>                      raise RunQemuError('Option %s also needs gtk or sdl
> option.' % (arg))
>              elif arg == 'egl-headless':
>                  self.set_dri_path()
> -                self.qemu_opt_script += ' -vga virtio -display
> egl-headless,show-cursor=on'
> +                self.qemu_opt_script += ' -device virtio-gpu -display
> egl-headless,show-cursor=on'
>              elif arg == 'serial':
>                  self.kernel_cmdline_script += ' console=ttyS0'
>                  self.serialconsole = True
> --
> 2.23.0
>
> 
>

--000000000000ede59b05ae1e58d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Do the virgl selftests still pass with this change? P=
lease run</div><div><br></div><div>oe-selftest -r runtime_test.TestImage.te=
st_testimage_virgl_gtk_sdl</div><div><br></div><div>and</div><div><br></div=
><div>oe-selftest -r runtime_test.TestImage.test_testimage_virgl_headless</=
div><div><br></div><div>Alex<br></div><div><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 30 Aug 2020=
 at 22:15, Vasyl Vavrychuk &lt;<a href=3D"mailto:vvavrychuk@gmail.com" targ=
et=3D"_blank">vvavrychuk@gmail.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">virtio-vga is available in QEMU only for =
hppa, i386, and ppc<br>
architectures. On the other hand, virtio-gpu is available for all<br>
architectures.<br>
<br>
Signed-off-by: Vasyl Vavrychuk &lt;<a href=3D"mailto:vvavrychuk@gmail.com"=
 target=3D"_blank">vvavrychuk@gmail.com</a>&gt;<br>
---<br>
=C2=A0scripts/runqemu | 10 +++++-----<br>
=C2=A01 file changed, 5 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/scripts/runqemu b/scripts/runqemu<br>
index 7fb5f7db57..5d6b35ffe4 100755<br>
--- a/scripts/runqemu<br>
+++ b/scripts/runqemu<br>
@@ -461,19 +461,19 @@ class BaseConfig(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif arg =3D=3D &#39;sdl&#=
39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &#39;gl&#=
39; in sys.argv[1:]:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0self.set_dri_path()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sel=
f.qemu_opt_script +=3D &#39; -vga virtio -display sdl,gl=3Don,show-cursor=
=3Don&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sel=
f.qemu_opt_script +=3D &#39; -device virtio-gpu -display sdl,gl=3Don,show-c=
ursor=3Don&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif &#39;gl=
-es&#39; in sys.argv[1:]:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0self.set_dri_path()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sel=
f.qemu_opt_script +=3D &#39; -vga virtio -display sdl,gl=3Des,show-cursor=
=3Don&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sel=
f.qemu_opt_script +=3D &#39; -device virtio-gpu -display sdl,gl=3Des,show-c=
ursor=3Don&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0self.qemu_opt_script +=3D &#39; -display sdl,show-cursor=3Don&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif arg =3D=3D &#39;gtk&#=
39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &#39;gl&#=
39; in sys.argv[1:]:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0self.set_dri_path()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sel=
f.qemu_opt_script +=3D &#39; -vga virtio -display gtk,gl=3Don,show-cursor=
=3Don&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sel=
f.qemu_opt_script +=3D &#39; -device virtio-gpu -display gtk,gl=3Don,show-c=
ursor=3Don&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif &#39;gl=
-es&#39; in sys.argv[1:]:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0self.set_dri_path()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sel=
f.qemu_opt_script +=3D &#39; -vga virtio -display gtk,gl=3Des,show-cursor=
=3Don&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sel=
f.qemu_opt_script +=3D &#39; -device virtio-gpu -display gtk,gl=3Des,show-c=
ursor=3Don&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0self.qemu_opt_script +=3D &#39; -display gtk,show-cursor=3Don&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif arg =3D=3D &#39;gl&#3=
9; or arg =3D=3D &#39;gl-es&#39;:<br>
@@ -482,7 +482,7 @@ class BaseConfig(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0raise RunQemuError(&#39;Option %s also needs gtk or sdl option.&#39; % =
(arg))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif arg =3D=3D &#39;egl-h=
eadless&#39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.set_dri=
_path()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.qemu_opt_scr=
ipt +=3D &#39; -vga virtio -display egl-headless,show-cursor=3Don&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.qemu_opt_scr=
ipt +=3D &#39; -device virtio-gpu -display egl-headless,show-cursor=3Don&#3=
9;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif arg =3D=3D &#39;seria=
l&#39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.kernel_=
cmdline_script +=3D &#39; console=3DttyS0&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.serialc=
onsole =3D True<br>
-- <br>
2.23.0<br>
<br>
<br>
</blockquote></div>

--000000000000ede59b05ae1e58d2--
