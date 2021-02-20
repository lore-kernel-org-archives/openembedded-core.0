Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web08.10939.1613848869320409761
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Feb 2021 11:21:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dBJfy+Vq;
 spf=pass (domain: gmail.com, ip: 209.85.222.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id d3so3024834uap.4
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Feb 2021 11:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8LdoKk8t7kIS+nVjIf2WuCPrUOXp1+K/5iePbY17sUY=;
        b=dBJfy+VqUfZtMprfq1Pc3ENlHkKjmCDK/NEikRP/iGdFafGBp2FKJToQM02uGZQ13s
         IvxgE/z1HmB1ThXK+ww7lou45ZHnYJuSi6CySI7qg0KJmsyNFogBzpEVkHefw9chJ7Uz
         DmzlsCEiXVMPSjg+dKo9cV4qfB74LoitYaCqB6ZIzhcy58aIm0+O9jgBVNYFINEDvpML
         Va37578mGtQZ3iB3OEXzMaNidFMo72nryesCJ/yg8GVO+Yl3RGJSM7lNZNCcrF+gmjrI
         7bXKL38+s1XJkTqi81ABOBjfQ8lAyHvOP5Tsl7fRUAAMtapAvqRR4tNnUWIaMHJMSy3x
         YrSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8LdoKk8t7kIS+nVjIf2WuCPrUOXp1+K/5iePbY17sUY=;
        b=FcHVunlkge/j9AD81MBTNsZVFbjJzMN6Cpik2hI75icG0dxNWSV5nuBBjsq4V3bdO8
         LnJZbOoy38Vbavq2SLGICVruLfxV9dhmb4PNiLnc8jcbWfN2s/bFmRRshLYYEhMFeV4h
         ji3Aq0frQSWfQ/ArxzpDLHmCLLXD7ifevjDfAZhtkVbyvPUASOPlYiWMseEneDMGNGFb
         5bxvgzAUtbHvBoX7LVHPaVoMWd0VutA3PnJtkpxnrsVmlPKcc8CVVvfZurXk1xDq4HYf
         2+IDt1etOycSDQUewQ8pgnWK3SnygOG7roz2HzHBGg9podWLDdfd58Gam/DaFSvA76Gg
         h8Bg==
X-Gm-Message-State: AOAM530tf1D6pU/uF0bjWAEgyvBxC/nrprrh/GODwwar8vYrxmkmaXG/
	Ma91wH7tAlUu5ERf3BjfjMs+s8O4ueo1IpDDB6s=
X-Google-Smtp-Source: ABdhPJyjoa9lchTxc2EpxO2nmkGax71Lp41LRqenXowbgWTeCY179VXj/m6G147gLdQ358rnLvfFCUQ3S+3MbJ7DoAM=
X-Received: by 2002:ab0:2b95:: with SMTP id q21mr10544376uar.22.1613848868512;
 Sat, 20 Feb 2021 11:21:08 -0800 (PST)
MIME-Version: 1.0
References: <20210220190924.3153040-1-raj.khem@gmail.com>
In-Reply-To: <20210220190924.3153040-1-raj.khem@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 20 Feb 2021 20:20:57 +0100
Message-ID: <CANNYZj-MB3mzzzu91dzaHvP+MdQhN0RK09QaQtJDh7JWMTx4kQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] runqemu: Disable vga with nographic
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000087660c05bbc9786a"

--00000000000087660c05bbc9786a
Content-Type: text/plain; charset="UTF-8"

I don't think this is right. You might want to use -nographic, but still
keep an emulated graphical device inside the guest for testing the
userspace applications without seeing their output. It's better to set -vga
none via a dedicated runqemu option.

Alex

On Sat, 20 Feb 2021 at 20:09, Khem Raj <raj.khem@gmail.com> wrote:

> When using nographic, explicitly disable vga since some qemu firmware (
> OpenFirmware ) defaults to std vga, and when vga is enabled then it
> disables output to serial and redirects that to vga which is by design,
> hwoever we expect the console output to go to serial when using
> nographic, therefore its important to disable vga with nographic
> especially on qemu based ppc platforms
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  scripts/runqemu | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index dd92a64553..2e31338d8e 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -462,7 +462,7 @@ class BaseConfig(object):
>                      raise RunQemuError('Option nographic makes no sense
> alongside the sdl option.' % (arg))
>                  if ('gtk' in sys.argv):
>                      raise RunQemuError('Option nographic makes no sense
> alongside the gtk option.' % (arg))
> -                self.qemu_opt_script += ' -nographic'
> +                self.qemu_opt_script += ' -nographic -vga none'
>                  self.kernel_cmdline_script += ' console=ttyS0'
>              elif arg == 'sdl':
>                  if 'gl' in sys.argv[1:]:
> --
> 2.30.1
>
>
> 
>
>

--00000000000087660c05bbc9786a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I don&#39;t think this is right. You might want to us=
e -nographic, but still keep an emulated graphical device inside the guest =
for testing the userspace applications without seeing their output. It&#39;=
s better to set -vga none via a dedicated runqemu option.</div><div><br></d=
iv><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Sat, 20 Feb 2021 at 20:09, Khem Raj &lt;<a href=3D=
"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">When using nographic, explici=
tly disable vga since some qemu firmware (<br>
OpenFirmware ) defaults to std vga, and when vga is enabled then it<br>
disables output to serial and redirects that to vga which is by design,<br=
>
hwoever we expect the console output to go to serial when using<br>
nographic, therefore its important to disable vga with nographic<br>
especially on qemu based ppc platforms<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0scripts/runqemu | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/scripts/runqemu b/scripts/runqemu<br>
index dd92a64553..2e31338d8e 100755<br>
--- a/scripts/runqemu<br>
+++ b/scripts/runqemu<br>
@@ -462,7 +462,7 @@ class BaseConfig(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0raise RunQemuError(&#39;Option nographic makes no sense alongside the s=
dl option.&#39; % (arg))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (&#39;gtk=
&#39; in sys.argv):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0raise RunQemuError(&#39;Option nographic makes no sense alongside the g=
tk option.&#39; % (arg))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.qemu_opt_scr=
ipt +=3D &#39; -nographic&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.qemu_opt_scr=
ipt +=3D &#39; -nographic -vga none&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.kernel_=
cmdline_script +=3D &#39; console=3DttyS0&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif arg =3D=3D &#39;sdl&#=
39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &#39;gl&#=
39; in sys.argv[1:]:<br>
-- <br>
2.30.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000087660c05bbc9786a--
