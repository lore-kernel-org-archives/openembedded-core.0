Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web12.18397.1613901541314784324
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Feb 2021 01:59:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gtn7NjZb;
 spf=pass (domain: gmail.com, ip: 209.85.222.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id p12so3372058uam.8
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Feb 2021 01:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c+Wks0P+QiCq7NNawV34vI9gXJ72cfdc9J5RPZBpz48=;
        b=Gtn7NjZb1ebkLBFpvZE2FfXyan7Lk3WPKcPAhvCwGRAI0K4EG1zHvvAJ44vRYmsVC1
         W1rtj/9UiVrkN1ka0zWQVpd13YcT3huNIRH9v0Vww8mOUmCECa+7ag3IDLRlhPXyuwj/
         BwnUjNg3hoGDAFHSmdlUwNfLsg7fl4/7vKnObF1kM4191AXs9BQ42R/axLb0k3qiMmQ/
         /YLx4l0zFCWUD48dKruwoA5k6Okqi2OYSvRwUAcmIfF21fP5ydwXkYBZuDNHZUTpq9QI
         movifj40seh8C5ZlttDzG/mMker5m4FVNuSSp3uZohvUqnUv3ZqXxpVjRMwjXmhqBYDl
         xpFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c+Wks0P+QiCq7NNawV34vI9gXJ72cfdc9J5RPZBpz48=;
        b=BVLosLKNxgsUVM0q/0nGzfu1d1YlJeQe40ok8AbaBP/nSE+pBWxJOB+EtbDcsJ5pf4
         dbEnj5Big1H5M+AVXQ8Z8FJPSpp0/ACxoXl9qY5SAzYsGbL0mKKdl4e20x9cplhca1Of
         U36VRtru76VyADcHjTDVaRrq0An+xx3RbM39BhR+COsfQqTzJtK3fzjGN3zT756oLHKh
         tvHuoKxOJZFvN8aEf/4dgjXiRCvA4ateaqpeNZbaRQoI6Xlqj5dXCkIY/k3teEM7dWgj
         NZqmq+QG1I5ImLkyYZ5w6DxV2H+1htdj80pPfBdPqg9P7LRLfFd1eDj4UIQxCm88bGnd
         nGzw==
X-Gm-Message-State: AOAM53249JR7twtyeAPMlJvBiqaoV2WIo+9oY+RcSMmRiuLAKbw+wkNo
	t2uJ88xXw8o5paZDLVJKyA/YiRsY8wQj9Dwm0NM=
X-Google-Smtp-Source: ABdhPJwjtGcmHzIC1REpQDX3zMAlrOvncLxZJZ1RQj2CInp3+YLbKAyBxOPSpw3mv0R5YGUp9ZyQv1HsVevT4LqNqo8=
X-Received: by 2002:ab0:5e9:: with SMTP id e96mr5079171uae.89.1613901540480;
 Sun, 21 Feb 2021 01:59:00 -0800 (PST)
MIME-Version: 1.0
References: <20210220225221.55097-1-raj.khem@gmail.com>
In-Reply-To: <20210220225221.55097-1-raj.khem@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sun, 21 Feb 2021 10:58:49 +0100
Message-ID: <CANNYZj9iC4EvCD-k3U-+zmrJ5g3kjy2qNfUQ61NP2N+sn4gqbA@mail.gmail.com>
Subject: Re: [PATCH v2] runqemu: Add new option to disable vga emulation
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000005db7005bbd5bcea"

--00000000000005db7005bbd5bcea
Content-Type: text/plain; charset="UTF-8"

Thanks! :)

Alex

On Sat, 20 Feb 2021 at 23:52, Khem Raj <raj.khem@gmail.com> wrote:

> When using nographic, explicitly disabling vga is needed some cases
> since some qemu firmware (OpenFirmware ) defaults to std vga, and
> when vga is enabled then it disables output to serial and redirects
> that to vga which is by design, hwoever we expect the console output
> to go to serial when using nographic, therefore its important to
> disable vga with nographic especially on qemu based ppc platforms
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
> v2: Add separate runqemu option instead of tagging along with nographic
>
>  scripts/runqemu | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index dd92a64553..532f2e338d 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -65,6 +65,7 @@ of the following environment variables (in any order):
>    MACHINE - the machine name (optional, autodetected from KERNEL filename
> if unspecified)
>    Simplified QEMU command-line options can be passed with:
>      nographic - disable video console
> +    novga - Disable VGA emulation completely
>      sdl - choose the SDL UI frontend
>      gtk - choose the Gtk UI frontend
>      gl - enable virgl-based GL acceleration (also needs gtk or sdl
> options)
> @@ -489,6 +490,8 @@ class BaseConfig(object):
>              elif arg == 'egl-headless':
>                  self.set_dri_path()
>                  self.qemu_opt_script += ' -vga virtio -display
> egl-headless,show-cursor=on'
> +            elif arg == 'novga':
> +                self.qemu_opt_script += ' -vga none'
>              elif arg == 'serial':
>                  self.kernel_cmdline_script += ' console=ttyS0'
>                  self.serialconsole = True
> --
> 2.30.1
>
>

--00000000000005db7005bbd5bcea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks! :)</div><div><br></div><div>Alex<br></div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Sat, 20 Feb 2021 at 23:52, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.co=
m">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">When using nographic, explicitly disabling vga is need=
ed some cases<br>
since some qemu firmware (OpenFirmware ) defaults to std vga, and<br>
when vga is enabled then it disables output to serial and redirects<br>
that to vga which is by design, hwoever we expect the console output<br>
to go to serial when using nographic, therefore its important to<br>
disable vga with nographic especially on qemu based ppc platforms<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
Cc: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=
=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
---<br>
v2: Add separate runqemu option instead of tagging along with nographic<br>
<br>
=C2=A0scripts/runqemu | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/scripts/runqemu b/scripts/runqemu<br>
index dd92a64553..532f2e338d 100755<br>
--- a/scripts/runqemu<br>
+++ b/scripts/runqemu<br>
@@ -65,6 +65,7 @@ of the following environment variables (in any order):<br=
>
=C2=A0 =C2=A0MACHINE - the machine name (optional, autodetected from KERNEL=
 filename if unspecified)<br>
=C2=A0 =C2=A0Simplified QEMU command-line options can be passed with:<br>
=C2=A0 =C2=A0 =C2=A0nographic - disable video console<br>
+=C2=A0 =C2=A0 novga - Disable VGA emulation completely<br>
=C2=A0 =C2=A0 =C2=A0sdl - choose the SDL UI frontend<br>
=C2=A0 =C2=A0 =C2=A0gtk - choose the Gtk UI frontend<br>
=C2=A0 =C2=A0 =C2=A0gl - enable virgl-based GL acceleration (also needs gtk=
 or sdl options)<br>
@@ -489,6 +490,8 @@ class BaseConfig(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif arg =3D=3D &#39;egl-he=
adless&#39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.set_dri_=
path()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.qemu_opt=
_script +=3D &#39; -vga virtio -display egl-headless,show-cursor=3Don&#39;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif arg =3D=3D &#39;novga&#39;:=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.qemu_opt_scri=
pt +=3D &#39; -vga none&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif arg =3D=3D &#39;serial=
&#39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.kernel_c=
mdline_script +=3D &#39; console=3DttyS0&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.serialco=
nsole =3D True<br>
-- <br>
2.30.1<br>
<br>
</blockquote></div>

--00000000000005db7005bbd5bcea--
