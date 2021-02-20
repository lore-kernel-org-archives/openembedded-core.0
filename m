Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web09.11751.1613851888257354582
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Feb 2021 12:11:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ln75T6CS;
 spf=pass (domain: gmail.com, ip: 209.85.217.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id f26so4559188vsr.0
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Feb 2021 12:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YFUQp7U6cFedbRpJEhLKZ1ELbb0KnupmIOHPY7ANZBw=;
        b=ln75T6CSYJR7NTM8Agy5l/DCzr7uAV+dW78DxeYhSl8H/sn2PrWgdBVS9lOJTWon0o
         uQh5sWkD+5SBzRhePLnkxGiND12zR9jAOCFXq7Wj2l6/Qcd4WAC9LNDoSkNUANca2AML
         jTtcIMK1vJX2l/559DS+3PT17BuLU2pnlPAp1oXVW1crXrKpdrtQqCkIyD810P0B+Cvi
         vcyqaqlSkSdTidXaRIRdEn2O+6EN40Vub3LDLOVrDLYWA5EzikR/Ag22OlKjS8PQpWco
         idp8FELPQdvFQi0np6hki+nUaF6xzNqzfEIqdxk5PfzEnWjsRaVzDKdPme+Xad9b93An
         WMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YFUQp7U6cFedbRpJEhLKZ1ELbb0KnupmIOHPY7ANZBw=;
        b=HXyLkDVX3x1ua0gyktK1uDex6L1wk1svfbTndiqeALyhLVgR7mT0Y/4amxMuTClAxI
         IPRVwGwNIOa64jqHp+vxfgyKVuXh2PrAVmnb5c1TbnzGC7F+h1ZE0B/ETl2Woan6waKW
         m/8ATnOSYFSq6j2mKP9gv0AvYHOhKeAJbzXXS6nhtmM9scbBwTOJCxftDps0xavCEfA1
         DfbRKNmlKUU39QMNDyQNRPbVIFYeQhd+2U3FfHIlfOvp0ucaAvgsaZURphAav/nIXOXT
         1rHJLLQm62NeB+SnSBRXRIFxs8oH85+EFZfp/kmt01Ku62fWJNdqOAL6/9fIdbbYSKBj
         bTwQ==
X-Gm-Message-State: AOAM530kAN6kqH2fgad9UQO9IqNltHNARBd623/XwMTTDmK7rBkq4lgM
	eEVQ5cCuLE5+zL7Vv/PX392YXNNO+7Oxt58NDhI=
X-Google-Smtp-Source: ABdhPJxUiDm5d83ktdZ0hoT89pHfzmr55jx9JpebL/QxOPzfOLKm0hagCXwQaZUV/yowP90IHvyGg0ysSXaasLDgoI4=
X-Received: by 2002:a67:7942:: with SMTP id u63mr1674972vsc.41.1613851887367;
 Sat, 20 Feb 2021 12:11:27 -0800 (PST)
MIME-Version: 1.0
References: <20210220190924.3153040-1-raj.khem@gmail.com> <CANNYZj-MB3mzzzu91dzaHvP+MdQhN0RK09QaQtJDh7JWMTx4kQ@mail.gmail.com>
 <5c76ef42-79f9-b929-b1a4-e8e5360e301c@gmail.com>
In-Reply-To: <5c76ef42-79f9-b929-b1a4-e8e5360e301c@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 20 Feb 2021 21:11:16 +0100
Message-ID: <CANNYZj9wLUDQapAB6JbVHLb=eYwCbhkyPYHtWzPAxaz98i_iwA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] runqemu: Disable vga with nographic
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000077771c05bbca2c6b"

--00000000000077771c05bbca2c6b
Content-Type: text/plain; charset="UTF-8"

What I am saying is that -nographic (where the output goes on the host) and
-vga none (what hardware gets emulated in the guest) are independent,
orthogonal options, and you should not bundle them together. It is a valid
use case to have -nographic with emulated graphical hardware still enabled.

Alex

On Sat, 20 Feb 2021 at 21:03, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 2/20/21 11:20 AM, Alexander Kanavin wrote:
> > I don't think this is right. You might want to use -nographic, but still
> > keep an emulated graphical device inside the guest for testing the
> > userspace applications without seeing their output. It's better to set
> > -vga none via a dedicated runqemu option.
>
> using -display none is better way to control this kind of behaviour
> where you still want graphic card to be emulated but not display the
> output. perhaps such an option would be better suited and nographic
> runqemu option can be used for qemu being a simple cmdline app.
>
> >
> > Alex
> >
> > On Sat, 20 Feb 2021 at 20:09, Khem Raj <raj.khem@gmail.com
> > <mailto:raj.khem@gmail.com>> wrote:
> >
> >     When using nographic, explicitly disable vga since some qemu
> firmware (
> >     OpenFirmware ) defaults to std vga, and when vga is enabled then it
> >     disables output to serial and redirects that to vga which is by
> design,
> >     hwoever we expect the console output to go to serial when using
> >     nographic, therefore its important to disable vga with nographic
> >     especially on qemu based ppc platforms
> >
> >     Signed-off-by: Khem Raj <raj.khem@gmail.com <mailto:
> raj.khem@gmail.com>>
> >     ---
> >       scripts/runqemu | 2 +-
> >       1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >     diff --git a/scripts/runqemu b/scripts/runqemu
> >     index dd92a64553..2e31338d8e 100755
> >     --- a/scripts/runqemu
> >     +++ b/scripts/runqemu
> >     @@ -462,7 +462,7 @@ class BaseConfig(object):
> >                           raise RunQemuError('Option nographic makes no
> >     sense alongside the sdl option.' % (arg))
> >                       if ('gtk' in sys.argv):
> >                           raise RunQemuError('Option nographic makes no
> >     sense alongside the gtk option.' % (arg))
> >     -                self.qemu_opt_script += ' -nographic'
> >     +                self.qemu_opt_script += ' -nographic -vga none'
> >                       self.kernel_cmdline_script += ' console=ttyS0'
> >                   elif arg == 'sdl':
> >                       if 'gl' in sys.argv[1:]:
> >     --
> >     2.30.1
> >
> >
> >     
> >
>

--00000000000077771c05bbca2c6b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>What I am saying is that -nographic (where the output=
 goes on the host) and -vga none (what hardware gets emulated in the guest)=
 are independent, orthogonal options, and you should not bundle them togeth=
er. It is a valid use case to have -nographic with emulated graphical hardw=
are still enabled.<br></div><div><br></div><div>Alex<br></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, 20 Fe=
b 2021 at 21:03, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khe=
m@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><br>
<br>
On 2/20/21 11:20 AM, Alexander Kanavin wrote:<br>
&gt; I don&#39;t think this is right. You might want to use -nographic, bu=
t still <br>
&gt; keep an emulated graphical device inside the guest for testing the <b=
r>
&gt; userspace applications without seeing their output. It&#39;s better t=
o set <br>
&gt; -vga none via a dedicated runqemu option.<br>
<br>
using -display none is better way to control this kind of behaviour <br>
where you still want graphic card to be emulated but not display the <br>
output. perhaps such an option would be better suited and nographic <br>
runqemu option can be used for qemu being a simple cmdline app.<br>
<br>
&gt; <br>
&gt; Alex<br>
&gt; <br>
&gt; On Sat, 20 Feb 2021 at 20:09, Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com" target=3D"_blank">raj.khem@gmail.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">ra=
j.khem@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0When using nographic, explicitly disable vga since=
 some qemu firmware (<br>
&gt;=C2=A0 =C2=A0 =C2=A0OpenFirmware ) defaults to std vga, and when vga i=
s enabled then it<br>
&gt;=C2=A0 =C2=A0 =C2=A0disables output to serial and redirects that to vg=
a which is by design,<br>
&gt;=C2=A0 =C2=A0 =C2=A0hwoever we expect the console output to go to seri=
al when using<br>
&gt;=C2=A0 =C2=A0 =C2=A0nographic, therefore its important to disable vga =
with nographic<br>
&gt;=C2=A0 =C2=A0 =C2=A0especially on qemu based ppc platforms<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.=
khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a> &lt;mailto:<a href=
=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt=
;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0scripts/runqemu | 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(=
-)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/scripts/runqemu b/scripts/runqemu<br>
&gt;=C2=A0 =C2=A0 =C2=A0index dd92a64553..2e31338d8e 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/scripts/runqemu<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/scripts/runqemu<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -462,7 +462,7 @@ class BaseConfig(object):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0raise RunQemuError(&#39;Option nographic makes =
no<br>
&gt;=C2=A0 =C2=A0 =C2=A0sense alongside the sdl option.&#39; % (arg))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0if (&#39;gtk&#39; in sys.argv):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0raise RunQemuError(&#39;Option nographic makes =
no<br>
&gt;=C2=A0 =C2=A0 =C2=A0sense alongside the gtk option.&#39; % (arg))<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 self.qemu_opt_script +=3D &#39; -nographic&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 self.qemu_opt_script +=3D &#39; -nographic -vga none&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0self.kernel_cmdline_script +=3D &#39; console=3DttyS0&#39;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0e=
lif arg =3D=3D &#39;sdl&#39;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0if &#39;gl&#39; in sys.argv[1:]:<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A02.30.1<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt; <br>
</blockquote></div>

--00000000000077771c05bbca2c6b--
