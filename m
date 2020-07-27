Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.63329.1595876622773360477
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 12:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@babayev.com header.s=google header.b=EN3xT8F3;
 spf=pass (domain: babayev.com, ip: 209.85.221.66, mailfrom: ruslan@babayev.com)
Received: by mail-wr1-f66.google.com with SMTP id f7so15969262wrw.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 12:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=babayev.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x9B7ybQEW00SYru6npi8rEEj8r7LcaJgR4KGKl9AxhM=;
        b=EN3xT8F3+vEcTvixJs7pKuMFXW/AFGJLWd2N+ak16OqGesn+5jhxO6V5yRkDKHxfdo
         Run3OyKUO+7M+YHTxlilr/FFsOKtEfSPIyOLEadj99yzUXsP2IIomLa+tkx2bqBsfwM8
         azQxOe8hltJlCjw9Sm+Zy+hzQcs2xKXymVprI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x9B7ybQEW00SYru6npi8rEEj8r7LcaJgR4KGKl9AxhM=;
        b=oH0AJZC1+r2zEcB92bmAbKjdJ4ljMj0eUjfnBN/XtRcI6vNUhqgFiUAX01/q7oUf5j
         QpUeCvpi+kCrXOphehU6XDzQKU1e9VxXIUU/SzHw7ElVh4cmcbHGUv0Y/E7qHzy6t5EW
         c7YNojgWeg6GDQJbx5MTiI18UdPlBzGFQOxBrngSnjAnAM/W1wocBkO+B2YzK/3jEPvc
         4/3l96elX5CO0H2Ncv1Fk5nvlynxSPH4k0yn+YyQGrgd3grStLhEj8BeEx+9bxFmk4bg
         M/186fSr+LhUvSL3/ohlfE467QforXTbHJFMIBfwLYYKUi18/gC4qPGIqWYEfLIQMOuR
         nN5g==
X-Gm-Message-State: AOAM531Ikt1LXAi76P/7Q8p+l6FnM8/2JCTiRxRJufS/RgXGDr6kMz3x
	Hhvs7v7i2fIUqCY+VU5L/L4tKmgJ1/Ap4aafVcbaJw==
X-Google-Smtp-Source: ABdhPJwvvlmMZHxX+BRrYV88PF+u6viEq/rHRzdbzgJmWPho+S9HuPaTETsLuk7z8PX5XQBdGSCJaTBXFYuzmh+R1Ek=
X-Received: by 2002:adf:eccc:: with SMTP id s12mr23998266wro.157.1595876621130;
 Mon, 27 Jul 2020 12:03:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200726015614.2875-1-ruslan@babayev.com> <CAAnfSTvFPFsSzimALDEGWQCrMRszViYWT7kqBbs3UrgRrfAN3w@mail.gmail.com>
In-Reply-To: <CAAnfSTvFPFsSzimALDEGWQCrMRszViYWT7kqBbs3UrgRrfAN3w@mail.gmail.com>
From: "Ruslan Babayev" <ruslan@babayev.com>
Date: Mon, 27 Jul 2020 12:03:29 -0700
Message-ID: <CAOpYhv9MHvuDgU-Rrkn3cdyhge0y_wTtOQRuogMR46E-zQ-w6A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] meson: use the more specific cpu arch in cross file
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001bb00c05ab70fb43"

--0000000000001bb00c05ab70fb43
Content-Type: text/plain; charset="UTF-8"

Hi Ross,

According to https://mesonbuild.com/Cross-compilation.html

There are two different values for the CPU. The first one is cpu_family. It
is a general type of the CPU. This should have a value from the CPU Family
table <https://mesonbuild.com/Reference-tables.html#cpu-families>. *Note* that
meson does not add el to end cpu_family value for little endian systems.
Big endian and little endian mips are both just mips, with the endian field
set approriately.

The second value is cpu which is a more specific subtype for the CPU.
Typical values for a x86 CPU family might include i386 or i586 and for arm
 family armv5 or armv7hl. Note that CPU type strings are very system
dependent. You might get a different value if you check its value on the
same machine but with different operating systems.
At the moment both 'cpu_family' and 'cpu' are being set to TARGET_ARCH
(like x86_64) in meson cross file.

TUNE_CCARSG usually contains the exact subfamily either as -march= or
-mcpu=

The meson_cpu function will use regex to search for -march and if that's
missing for -mcpu value. If both flags are missing it defaults to
TARGET_ARCH.

Ruslan


On Mon, Jul 27, 2020 at 3:52 AM Ross Burton <ross@burtonini.com> wrote:

> On Sun, 26 Jul 2020 at 02:56, Ruslan Babayev <ruslan@babayev.com> wrote:
> > 'cpu' unlike 'cpu_family' must be a more specific subtype for the CPU.
>
> Can you elaborate here some more?
>
> Ross
>

--0000000000001bb00c05ab70fb43
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace;font-size:large">Hi Ross,</div><div class=3D"gmail_defau=
lt" style=3D"font-family:monospace;font-size:large"><br></div><div class=3D=
"gmail_default" style=3D"font-family:monospace;font-size:large">According t=
o=C2=A0<a href=3D"https://mesonbuild.com/Cross-compilation.html" style=3D"f=
ont-family:Arial,Helvetica,sans-serif;font-size:small">https://mesonbuild.c=
om/Cross-compilation.html</a></div><div class=3D"gmail_default" style=3D"fo=
nt-family:monospace;font-size:large"><br></div><div class=3D"gmail_default"=
 style=3D"font-family:monospace;font-size:large"><p style=3D"box-sizing:bor=
der-box;margin:0px 0px 10px;color:rgb(200,200,200);font-family:&quot;Helvet=
ica Neue&quot;,Helvetica,Arial,sans-serif;font-size:14px;background-color:r=
gb(39,43,48)">There are two different values for the CPU. The first one is=
=C2=A0<code style=3D"box-sizing:border-box;font-family:Menlo,Monaco,Consola=
s,&quot;Courier New&quot;,monospace;font-size:12.6px;padding:2px 4px;color:=
rgb(98,196,98);background-color:rgb(39,40,34);border-radius:4px">cpu_family=
</code>. It is a general type of the CPU. This should have a value from=C2=
=A0<a href=3D"https://mesonbuild.com/Reference-tables.html#cpu-families" st=
yle=3D"box-sizing:border-box;background-color:transparent;color:rgb(135,206=
,250);text-decoration-line:none;outline:none">the CPU Family table</a>.=C2=
=A0<em style=3D"box-sizing:border-box">Note</em>=C2=A0that meson does not a=
dd=C2=A0<code style=3D"box-sizing:border-box;font-family:Menlo,Monaco,Conso=
las,&quot;Courier New&quot;,monospace;font-size:12.6px;padding:2px 4px;colo=
r:rgb(98,196,98);background-color:rgb(39,40,34);border-radius:4px">el</code=
>=C2=A0to end cpu_family value for little endian systems. Big endian and li=
ttle endian mips are both just=C2=A0<code style=3D"box-sizing:border-box;fo=
nt-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;font-size=
:12.6px;padding:2px 4px;color:rgb(98,196,98);background-color:rgb(39,40,34)=
;border-radius:4px">mips</code>, with the=C2=A0<code style=3D"box-sizing:bo=
rder-box;font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospac=
e;font-size:12.6px;padding:2px 4px;color:rgb(98,196,98);background-color:rg=
b(39,40,34);border-radius:4px">endian</code>=C2=A0field set approriately.</=
p><p style=3D"box-sizing:border-box;margin:0px 0px 10px;color:rgb(200,200,2=
00);font-family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;font-=
size:14px;background-color:rgb(39,43,48)">The second value is=C2=A0<code st=
yle=3D"box-sizing:border-box;font-family:Menlo,Monaco,Consolas,&quot;Courie=
r New&quot;,monospace;font-size:12.6px;padding:2px 4px;color:rgb(98,196,98)=
;background-color:rgb(39,40,34);border-radius:4px">cpu</code>=C2=A0which is=
 a more specific subtype for the CPU. Typical values for a=C2=A0<code style=
=3D"box-sizing:border-box;font-family:Menlo,Monaco,Consolas,&quot;Courier N=
ew&quot;,monospace;font-size:12.6px;padding:2px 4px;color:rgb(98,196,98);ba=
ckground-color:rgb(39,40,34);border-radius:4px">x86</code>=C2=A0CPU family =
might include=C2=A0<code style=3D"box-sizing:border-box;font-family:Menlo,M=
onaco,Consolas,&quot;Courier New&quot;,monospace;font-size:12.6px;padding:2=
px 4px;color:rgb(98,196,98);background-color:rgb(39,40,34);border-radius:4p=
x">i386</code>=C2=A0or=C2=A0<code style=3D"box-sizing:border-box;font-famil=
y:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;font-size:12.6px;=
padding:2px 4px;color:rgb(98,196,98);background-color:rgb(39,40,34);border-=
radius:4px">i586</code>=C2=A0and for=C2=A0<code style=3D"box-sizing:border-=
box;font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;fon=
t-size:12.6px;padding:2px 4px;color:rgb(98,196,98);background-color:rgb(39,=
40,34);border-radius:4px">arm</code>=C2=A0family=C2=A0<code style=3D"box-si=
zing:border-box;font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,m=
onospace;font-size:12.6px;padding:2px 4px;color:rgb(98,196,98);background-c=
olor:rgb(39,40,34);border-radius:4px">armv5</code>=C2=A0or=C2=A0<code style=
=3D"box-sizing:border-box;font-family:Menlo,Monaco,Consolas,&quot;Courier N=
ew&quot;,monospace;font-size:12.6px;padding:2px 4px;color:rgb(98,196,98);ba=
ckground-color:rgb(39,40,34);border-radius:4px">armv7hl</code>. Note that C=
PU type strings are very system dependent. You might get a different value =
if you check its value on the same machine but with different operating sys=
tems.</p></div></div><div class=3D"gmail_default" style=3D"font-family:mono=
space;font-size:large">At the moment both &#39;cpu_family&#39; and &#39;cpu=
&#39; are being set to TARGET_ARCH (like x86_64) in meson cross file.</div>=
<div class=3D"gmail_default" style=3D"font-family:monospace;font-size:large=
"><br></div><div class=3D"gmail_default" style=3D"font-family:monospace;fon=
t-size:large">TUNE_CCARSG usually contains the exact subfamily either as -m=
arch=3D or -mcpu=3D=C2=A0</div><div><br></div><div><div class=3D"gmail_defa=
ult" style=3D"font-family:monospace;font-size:large">The meson_cpu function=
 will use regex to search for -march and if that&#39;s missing for -mcpu va=
lue. If both flags are missing it defaults to TARGET_ARCH.</div><div class=
=3D"gmail_default" style=3D"font-family:monospace;font-size:large"><br></di=
v><div class=3D"gmail_default" style=3D"font-family:monospace;font-size:lar=
ge">Ruslan</div><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Mon, Jul 27, 2020 at 3:52 AM Ross Burton &lt;<a href=
=3D"mailto:ross@burtonini.com">ross@burtonini.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Sun, 26 Jul 2020 at 02:=
56, Ruslan Babayev &lt;<a href=3D"mailto:ruslan@babayev.com" target=3D"_bla=
nk">ruslan@babayev.com</a>&gt; wrote:<br>
&gt; &#39;cpu&#39; unlike &#39;cpu_family&#39; must be a more specific subt=
ype for the CPU.<br>
<br>
Can you elaborate here some more?<br>
<br>
Ross<br>
</blockquote></div></div>

--0000000000001bb00c05ab70fb43--
