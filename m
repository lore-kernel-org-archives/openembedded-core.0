Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.5927.1596056704097396073
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 14:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@babayev.com header.s=google header.b=TGJdZ7wg;
 spf=pass (domain: babayev.com, ip: 209.85.128.67, mailfrom: ruslan@babayev.com)
Received: by mail-wm1-f67.google.com with SMTP id g8so3923474wmk.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2020 14:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=babayev.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sTBJrlS6JBkjl6/CuD+4XpcI0QK6S2764GrruvFa2l0=;
        b=TGJdZ7wgUwdwu4/ZIBXfWZvESJ1PqN9aboHdZnItOw3NMISlnVYd5TW4BSSjNRK5Mk
         3tb8KRoR4cSNpHE7hC6V6kuqEREHyngIpri7Mznw2yV7CNOiXGVFkNGNrmrEGkXBPp9i
         0MW4/PzfFt8vP5o28Gd9iCu8eRx5IIDtDLnHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sTBJrlS6JBkjl6/CuD+4XpcI0QK6S2764GrruvFa2l0=;
        b=QcsuYBqBhkaL+9oSpWMBVHK0TeZVgARQKKHJ7IPO0t4FAny1iyJTOmaXeJqt6hiXEJ
         VXFZG6dWdX7NEOSvl0ofWV2vr24YpobFF0N53yM6/Oeq2XKfXXWNj+ixN+JcfKuA+2Ih
         R9Vcpm91/HDyLBqAUznrYC5BMoLm8vUqIoyyQ904tOJ/w86WdU/TJRj9tq+J3p9CtxZd
         q8O5QULG4zu15CSOyRbWb9e2Vyliqbx4tjIQW8/UuMZKzV9ZW+XuyAERsaBgRwi7SgtU
         iBEP4RU7fgLBFvfbzjaPSKC6aplCGbbUfmzLbUtXYv/4cZgLjGzQGUu8Sj6QRA2Y4bJN
         wn+A==
X-Gm-Message-State: AOAM532VpzOYfLBQNx0MG2qHiw2cl4be+R7feWQ8N2ftO3+0Mn7ONjN5
	VEfO6RwQuH31jKTWbJi85UB1kt2faPRcEaXK+C4lLQ==
X-Google-Smtp-Source: ABdhPJwPiGC6CljZuNaGq7QFqNsyLqaMUJm84pBWOW+2RaNhWomRqcDTph/blIaDZO8ktMr3MCZJlnm5O1Zs3MbNBcw=
X-Received: by 2002:a1c:740e:: with SMTP id p14mr10029982wmc.179.1596056702497;
 Wed, 29 Jul 2020 14:05:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200726015614.2875-1-ruslan@babayev.com> <CAAnfSTvFPFsSzimALDEGWQCrMRszViYWT7kqBbs3UrgRrfAN3w@mail.gmail.com>
 <CAOpYhv9MHvuDgU-Rrkn3cdyhge0y_wTtOQRuogMR46E-zQ-w6A@mail.gmail.com>
In-Reply-To: <CAOpYhv9MHvuDgU-Rrkn3cdyhge0y_wTtOQRuogMR46E-zQ-w6A@mail.gmail.com>
From: "Ruslan Babayev" <ruslan@babayev.com>
Date: Wed, 29 Jul 2020 14:04:51 -0700
Message-ID: <CAOpYhv8UEfdbY0nLyoso--td1yMX6uUbOzP0aRnvWdG2AH1gDA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] meson: use the more specific cpu arch in cross file
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000cb4c7005ab9ae800"

--000000000000cb4c7005ab9ae800
Content-Type: text/plain; charset="UTF-8"

Hi Ross,

What do you think of the patch? Any objections to merging it? Do you have
any feedback?

Thanks,
Ruslan

On Mon, Jul 27, 2020 at 12:03 PM Ruslan Babayev <ruslan@babayev.com> wrote:

> Hi Ross,
>
> According to https://mesonbuild.com/Cross-compilation.html
>
> There are two different values for the CPU. The first one is cpu_family.
> It is a general type of the CPU. This should have a value from the CPU
> Family table <https://mesonbuild.com/Reference-tables.html#cpu-families>.
> *Note* that meson does not add el to end cpu_family value for little
> endian systems. Big endian and little endian mips are both just mips,
> with the endian field set approriately.
>
> The second value is cpu which is a more specific subtype for the CPU.
> Typical values for a x86 CPU family might include i386 or i586 and for arm
>  family armv5 or armv7hl. Note that CPU type strings are very system
> dependent. You might get a different value if you check its value on the
> same machine but with different operating systems.
> At the moment both 'cpu_family' and 'cpu' are being set to TARGET_ARCH
> (like x86_64) in meson cross file.
>
> TUNE_CCARSG usually contains the exact subfamily either as -march= or
> -mcpu=
>
> The meson_cpu function will use regex to search for -march and if that's
> missing for -mcpu value. If both flags are missing it defaults to
> TARGET_ARCH.
>
> Ruslan
>
>
> On Mon, Jul 27, 2020 at 3:52 AM Ross Burton <ross@burtonini.com> wrote:
>
>> On Sun, 26 Jul 2020 at 02:56, Ruslan Babayev <ruslan@babayev.com> wrote:
>> > 'cpu' unlike 'cpu_family' must be a more specific subtype for the CPU.
>>
>> Can you elaborate here some more?
>>
>> Ross
>>
>

--000000000000cb4c7005ab9ae800
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e;font-size:large">Hi Ross,</div><div class=3D"gmail_default" style=3D"font=
-family:monospace;font-size:large"><br></div><div class=3D"gmail_default" s=
tyle=3D"font-family:monospace;font-size:large">What do you think of the=C2=
=A0patch? Any objections to merging it? Do you have any feedback?</div><div=
 class=3D"gmail_default" style=3D"font-family:monospace;font-size:large"><b=
r></div><div class=3D"gmail_default" style=3D"font-family:monospace;font-si=
ze:large">Thanks,</div><div class=3D"gmail_default" style=3D"font-family:mo=
nospace;font-size:large">Ruslan</div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 27, 2020 at 12:03 PM Rusla=
n Babayev &lt;<a href=3D"mailto:ruslan@babayev.com">ruslan@babayev.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-fam=
ily:monospace;font-size:large">Hi Ross,</div><div class=3D"gmail_default" s=
tyle=3D"font-family:monospace;font-size:large"><br></div><div class=3D"gmai=
l_default" style=3D"font-family:monospace;font-size:large">According to=C2=
=A0<a href=3D"https://mesonbuild.com/Cross-compilation.html" style=3D"font-=
family:Arial,Helvetica,sans-serif;font-size:small" target=3D"_blank">https:=
//mesonbuild.com/Cross-compilation.html</a></div><div class=3D"gmail_defaul=
t" style=3D"font-family:monospace;font-size:large"><br></div><div class=3D"=
gmail_default" style=3D"font-family:monospace;font-size:large"><p style=3D"=
box-sizing:border-box;margin:0px 0px 10px;color:rgb(200,200,200);font-famil=
y:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;font-size:14px;back=
ground-color:rgb(39,43,48)">There are two different values for the CPU. The=
 first one is=C2=A0<code style=3D"box-sizing:border-box;font-family:Menlo,M=
onaco,Consolas,&quot;Courier New&quot;,monospace;font-size:12.6px;padding:2=
px 4px;color:rgb(98,196,98);background-color:rgb(39,40,34);border-radius:4p=
x">cpu_family</code>. It is a general type of the CPU. This should have a v=
alue from=C2=A0<a href=3D"https://mesonbuild.com/Reference-tables.html#cpu-=
families" style=3D"box-sizing:border-box;background-color:transparent;color=
:rgb(135,206,250);text-decoration-line:none;outline:none" target=3D"_blank"=
>the CPU Family table</a>.=C2=A0<em style=3D"box-sizing:border-box">Note</e=
m>=C2=A0that meson does not add=C2=A0<code style=3D"box-sizing:border-box;f=
ont-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;font-siz=
e:12.6px;padding:2px 4px;color:rgb(98,196,98);background-color:rgb(39,40,34=
);border-radius:4px">el</code>=C2=A0to end cpu_family value for little endi=
an systems. Big endian and little endian mips are both just=C2=A0<code styl=
e=3D"box-sizing:border-box;font-family:Menlo,Monaco,Consolas,&quot;Courier =
New&quot;,monospace;font-size:12.6px;padding:2px 4px;color:rgb(98,196,98);b=
ackground-color:rgb(39,40,34);border-radius:4px">mips</code>, with the=C2=
=A0<code style=3D"box-sizing:border-box;font-family:Menlo,Monaco,Consolas,&=
quot;Courier New&quot;,monospace;font-size:12.6px;padding:2px 4px;color:rgb=
(98,196,98);background-color:rgb(39,40,34);border-radius:4px">endian</code>=
=C2=A0field set approriately.</p><p style=3D"box-sizing:border-box;margin:0=
px 0px 10px;color:rgb(200,200,200);font-family:&quot;Helvetica Neue&quot;,H=
elvetica,Arial,sans-serif;font-size:14px;background-color:rgb(39,43,48)">Th=
e second value is=C2=A0<code style=3D"box-sizing:border-box;font-family:Men=
lo,Monaco,Consolas,&quot;Courier New&quot;,monospace;font-size:12.6px;paddi=
ng:2px 4px;color:rgb(98,196,98);background-color:rgb(39,40,34);border-radiu=
s:4px">cpu</code>=C2=A0which is a more specific subtype for the CPU. Typica=
l values for a=C2=A0<code style=3D"box-sizing:border-box;font-family:Menlo,=
Monaco,Consolas,&quot;Courier New&quot;,monospace;font-size:12.6px;padding:=
2px 4px;color:rgb(98,196,98);background-color:rgb(39,40,34);border-radius:4=
px">x86</code>=C2=A0CPU family might include=C2=A0<code style=3D"box-sizing=
:border-box;font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monos=
pace;font-size:12.6px;padding:2px 4px;color:rgb(98,196,98);background-color=
:rgb(39,40,34);border-radius:4px">i386</code>=C2=A0or=C2=A0<code style=3D"b=
ox-sizing:border-box;font-family:Menlo,Monaco,Consolas,&quot;Courier New&qu=
ot;,monospace;font-size:12.6px;padding:2px 4px;color:rgb(98,196,98);backgro=
und-color:rgb(39,40,34);border-radius:4px">i586</code>=C2=A0and for=C2=A0<c=
ode style=3D"box-sizing:border-box;font-family:Menlo,Monaco,Consolas,&quot;=
Courier New&quot;,monospace;font-size:12.6px;padding:2px 4px;color:rgb(98,1=
96,98);background-color:rgb(39,40,34);border-radius:4px">arm</code>=C2=A0fa=
mily=C2=A0<code style=3D"box-sizing:border-box;font-family:Menlo,Monaco,Con=
solas,&quot;Courier New&quot;,monospace;font-size:12.6px;padding:2px 4px;co=
lor:rgb(98,196,98);background-color:rgb(39,40,34);border-radius:4px">armv5<=
/code>=C2=A0or=C2=A0<code style=3D"box-sizing:border-box;font-family:Menlo,=
Monaco,Consolas,&quot;Courier New&quot;,monospace;font-size:12.6px;padding:=
2px 4px;color:rgb(98,196,98);background-color:rgb(39,40,34);border-radius:4=
px">armv7hl</code>. Note that CPU type strings are very system dependent. Y=
ou might get a different value if you check its value on the same machine b=
ut with different operating systems.</p></div></div><div class=3D"gmail_def=
ault" style=3D"font-family:monospace;font-size:large">At the moment both &#=
39;cpu_family&#39; and &#39;cpu&#39; are being set to TARGET_ARCH (like x86=
_64) in meson cross file.</div><div class=3D"gmail_default" style=3D"font-f=
amily:monospace;font-size:large"><br></div><div class=3D"gmail_default" sty=
le=3D"font-family:monospace;font-size:large">TUNE_CCARSG usually contains t=
he exact subfamily either as -march=3D or -mcpu=3D=C2=A0</div><div><br></di=
v><div><div class=3D"gmail_default" style=3D"font-family:monospace;font-siz=
e:large">The meson_cpu function will use regex to search for -march and if =
that&#39;s missing for -mcpu value. If both flags are missing it defaults t=
o TARGET_ARCH.</div><div class=3D"gmail_default" style=3D"font-family:monos=
pace;font-size:large"><br></div><div class=3D"gmail_default" style=3D"font-=
family:monospace;font-size:large">Ruslan</div><br></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 27, 2020 at 3=
:52 AM Ross Burton &lt;<a href=3D"mailto:ross@burtonini.com" target=3D"_bla=
nk">ross@burtonini.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On Sun, 26 Jul 2020 at 02:56, Ruslan Babayev &lt;<a h=
ref=3D"mailto:ruslan@babayev.com" target=3D"_blank">ruslan@babayev.com</a>&=
gt; wrote:<br>
&gt; &#39;cpu&#39; unlike &#39;cpu_family&#39; must be a more specific subt=
ype for the CPU.<br>
<br>
Can you elaborate here some more?<br>
<br>
Ross<br>
</blockquote></div></div>
</blockquote></div>

--000000000000cb4c7005ab9ae800--
