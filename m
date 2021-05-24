Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.web10.104.1621886397549777297
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 May 2021 12:59:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LPFP8gG3;
 spf=pass (domain: gmail.com, ip: 209.85.217.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f50.google.com with SMTP id i29so9137259vsr.11
        for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 12:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wHib8QVwslsW2zmv1/1Xl4GP4eaBqGUa8XLZ+bs6fGw=;
        b=LPFP8gG3YhidpYFNas9C0HGswebyQYfI2ouJst7wHWZfPJf6pSS4ZB0hUwdBy07MkR
         p1VdjJQDy22/nPkscownV6/JjVdVlOczJ+Rp1M+2CK1CwSpiCdi3+WxFhEBq/LW36iZ2
         FSSjAiCFpLJ4ItzwjQjLEWZ5O/wDS21txPsBRA1Bh4x2aXiuAXG9grrpoPGzaSEzk1su
         w9c3gwF7bohGd0At3zA4U/JxBuVa9Wfvp69WT35jI+CqQShE6tvZlVd5JM59NVyP2zxi
         wJ2xv4hTgbrKYhO87is5DoDiGRJPFozFilD9qLjL8tHZyHI0igHWgzKqAWLNjN1OGS2i
         uBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wHib8QVwslsW2zmv1/1Xl4GP4eaBqGUa8XLZ+bs6fGw=;
        b=VRjTMoASXQpHyqBpK6dM/f945LFgz7fFEgm+m3xOWA65R+6BOkl6j7tBqbIyc1+Ouh
         azM+9/IyO3ogoa5twE0Nb2tY1DCS0Q+GB+R3T3qcj/HMyo4AvVcfwRgywfhcev0OeX1p
         xZz/kaXVWFd5NJaCDOhxwXyi1jni77+VmJEdnYTToQ+V5wZbANI2fQpsJOc+0RuVnt3k
         QfQ0t2CCgcLq2D/PkYUScLxWY/I9U2x+BRUex4OA+tPVcYc4jRu9xQLiWDfnC7q1d9Kc
         kAyKTakY4ByOhrYd//nIXs5uzDOlzImYOhMBy5bHzGie5xTBy1ryITS2BGGCE0NHrzOT
         Bm0Q==
X-Gm-Message-State: AOAM533tvUk5dKINXJkvEaG4RZF65VRkjdG4jnyc20rxUR67hvyQG+Xh
	mCNY1UEpDEvaLZwI9qqYI4RPT9+70udPWT3lRfU=
X-Google-Smtp-Source: ABdhPJxpkIHOzy4bo8IHjHcHtQz6slORjkAyXuOvLU0/xu0rvbBz4XJwAeGQnVVkbO485Ano8SJIlBNH6SxdZHpP20M=
X-Received: by 2002:a67:c401:: with SMTP id c1mr22639609vsk.51.1621886396680;
 Mon, 24 May 2021 12:59:56 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj-v-hcO19SSkYgYKSeOBj7f1u4zvSRkfcx5UAm=ndye_A@mail.gmail.com>
 <20210524171559.190239-1-vinay.m.engg@gmail.com> <20210524171559.190239-4-vinay.m.engg@gmail.com>
In-Reply-To: <20210524171559.190239-4-vinay.m.engg@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 24 May 2021 21:59:45 +0200
Message-ID: <CANNYZj-ibLe4twMKMfwKTmOH5R0jtK1531fHv9=WWSTv9VSaRw@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] oeqa/selftest/cases/rust.py: Rust oe-selftest script.
To: Vinay Kumar <vinay.m.engg@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Konrad Weihmann <kweihmann@outlook.com>, Randy MacLeod <rwmacleod@gmail.com>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: multipart/alternative; boundary="0000000000008a4fff05c318da6f"

--0000000000008a4fff05c318da6f
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 May 2021 at 19:16, Vinay Kumar <vinay.m.engg@gmail.com> wrote:

> Build remote-test-server copy to image and execute
> remotely through background ssh.
>

Thanks, I do not have any further comments about the overall structure, the
below are more specific concerns.


> +               with runqemu("core-image-minimal", runqemuparams =
> "nographic", qemuparams= " -monitor \
> +                        telnet:127.0.0.1:1234,server,nowait -serial
> mon:stdio -serial null") as qemu:
>

Hardcoding the ip port this way is problematic and prone to conflicts. What
is -monitor used for?


> +                       cmd = cmd + " cd %s;  python3
> src/bootstrap/bootstrap.py -j 40 --verbose test %s --target %s >
> summary.txt 2> /dev/null " % (builddir, testargs, targetsys)
>

What does -j 40 do? Keep in mind that qemu has only 4 virtual cpu cores.


> +                       runCmd(cmd)
>

What happens if the test executed via runCmd fails? Specifically, will the
failure be properly reported?

I'm wondering because the output of the test is redirected to summary.txt
(which is then left unused), and stderr is discarded altogether.


> +                       # Stop ssh background execution
> +                       t_thread.stop()
>

Will t_thread be stopped if runCmd fails?

Alex

--0000000000008a4fff05c318da6f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 24 May 2021 at 19:16, Vinay Kumar &lt;<a href=3D"mailto:vina=
y.m.engg@gmail.com">vinay.m.engg@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Build remote-test-server copy to =
image and execute<br>
remotely through background ssh.<br></blockquote><div><br></div><div>Thanks=
, I do not have any further comments about the overall structure, the below=
 are more specific concerns.<br></div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0with runqemu(&quot;core-image-minimal&quot;, runqemuparams =3D=
 &quot;nographic&quot;, qemuparams=3D &quot; -monitor \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 telnet:<a href=3D"http://127.0.0.1:1234" rel=3D"noreferrer" targ=
et=3D"_blank">127.0.0.1:1234</a>,server,nowait -serial mon:stdio -serial nu=
ll&quot;) as qemu:<br></blockquote><div><br></div><div>Hardcoding the ip po=
rt this way is problematic and prone to conflicts. What is -monitor used fo=
r?<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0cmd =3D cmd + &quot; cd %s;=C2=A0 python3 src/bootstrap/bootst=
rap.py -j 40 --verbose test %s --target %s &gt; summary.txt 2&gt; /dev/null=
 &quot; % (builddir, testargs, targetsys)<br></blockquote><div><br></div><d=
iv>What does -j 40 do? Keep in mind that qemu has only 4 virtual cpu cores.=
<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0runCmd(cmd)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br></blockquote><div><br></div><div><div>W=
hat happens if the test executed via runCmd fails? Specifically, will the f=
ailure be properly reported?</div><div><br></div><div>I&#39;m wondering bec=
ause the output of the test is redirected to summary.txt (which is then lef=
t unused), and stderr is discarded altogether.<br></div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0# Stop ssh background execution<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0t_thread.stop()<br></blockquote><div><br></div><div>Will t_thread=
 be stopped if runCmd fails?<br></div><div>=C2=A0</div>Alex<br></div></div>

--0000000000008a4fff05c318da6f--
