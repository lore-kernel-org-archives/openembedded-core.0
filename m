Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web08.11912.1607073823486514253
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 01:23:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aJji/7WU;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id r5so5064352eda.12
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Dec 2020 01:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VGFBm96ll9TqaQYiTqo5lOEPgt207WinQ14qfPG+sJ4=;
        b=aJji/7WU1rg6JYv5B7mJQfO4bAW2+MSluyD/EY/2QCKY6u7tlgGOhHp6qj3woU2TNV
         k/x5513oq6yIszOtFtYcV2oS/tGnaJxzlufJv/I35Fh3YcWZRmkKOx+l8sH32Qqk7eZD
         BmGwdEP1h7wal5cRsCoNWx8p8C1MZN16eiyS6KsTjTlmNvcBPCC7MPyBJkzHlhXB2Ewa
         CEZXCF6ckYzPrQlZ4AklDs+66dW7CQk9mFn8wqhwn3P9/+cjviwMUuez7F7fvxJ0Z/p9
         GVNOHqUpUQasUESV6rBln+tyF10adHZSGqIqLjEvriobOFqNPBKJOrhXt6uUvDqHleHT
         VBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VGFBm96ll9TqaQYiTqo5lOEPgt207WinQ14qfPG+sJ4=;
        b=XdZ2htqZOzmZ1KMvocr4g5qAJQfOLr0U8z0oM8xYmPKAcvB+opCGex72Ctd4D/466n
         S9SEF6Mg7jRI+xdYMv0G9CgoDN4Z6TcdZffIM1pIzFhrhKi/dntFjsjZXKZA4/nN5lA3
         3rr06eNNllXPEvpSdrrI8SHh8EIPcO4LhR5fd4V+kKWosBaqYUFMGAZAQx80vucf9pEi
         ECvi3TtLn7pVVAlynoBtfPZ76ndzfHtkHQbR36FZvfQiJpVR9rYmoQdy0QtFPNRr9Fp7
         Y/Fdip8DahDY1zkGNylWf4IphWWmSdST+slzIxlRW3UenFaMBGri0TxsNKAim8wNHoR4
         EXcQ==
X-Gm-Message-State: AOAM530DexD0LuDQqtFpYoCC6MPG7qm7Lu61NpDKERNd/twQ+wnL+rL1
	vDiM3hLhWpFdfIM5feue/BZkFz8SiR2Je965Ni8=
X-Google-Smtp-Source: ABdhPJx5F6FSl51dQL3RlxhFjTzYEu35PvUaAXvMElzdmw+7NassqxgU1qeuLVR8dUForhNAlwC+3021LzWvnqJsPSI=
X-Received: by 2002:aa7:c0d6:: with SMTP id j22mr3469142edp.31.1607073821877;
 Fri, 04 Dec 2020 01:23:41 -0800 (PST)
MIME-Version: 1.0
References: <CAAnfSTuCTy4U60iJwtMm=N1PEaWjz6XyL_idgRXJVbzuLHggUw@mail.gmail.com>
 <CANNYZj_cQy2di0z7ianh59q-gXsDPR4uxZ0xZLQRLxx9PUu7sA@mail.gmail.com>
In-Reply-To: <CANNYZj_cQy2di0z7ianh59q-gXsDPR4uxZ0xZLQRLxx9PUu7sA@mail.gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Fri, 4 Dec 2020 09:23:30 +0000
Message-ID: <CANPvuRn4buLgdN0YTZjjZmrJQ6noWuicZebYe4DjbbEV=daXag@mail.gmail.com>
Subject: Re: [OE-core] Automatic cap on BB_NUMBER_THREADS and PARALLEL_MAKE
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Ross Burton <ross@burtonini.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000047eaf705b5a0082c"

--00000000000047eaf705b5a0082c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia quinta,
3/12/2020 =C3=A0(s) 18:20:

> I'd rather teach bitbake to abstain from starting new tasks when I/O or
> CPU gets tight.
>

This is definitely the best approach in my view. however more complex to
implement.

Quaresma


> Alex
>
> On Thu, 3 Dec 2020 at 18:48, Ross Burton <ross@burtonini.com> wrote:
>
>> Hi,
>>
>> Currently, BB_NUMBER_THREADS and PARALLEL_MAKE use the number of cores
>> available unless told otherwise.  This was a good idea six years
>> ago[1] but some modern machines are moving to very large core counts.
>>
>> For example, 88 core dual Xeons are fairly common. A ThunderX2 has 256
>> cores (2 sockets, 4 hyperthreads per physical core). The Ampere Altra
>> is dual socket 2*80=3D160 cores.
>>
>> At this level of parallelisation the sheer amount of I/O from the
>> unpack storm is quite excessive.  As a strawman argument, I propose a
>> hard cap to the default BB_NUMBER_THREADS of -- and I'm literally
>> making up numbers here -- 32.  Maybe 64.  Comments?
>>
>> Cheers,
>> Ross
>>
>> [1]
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D1529ef05045=
42145f2b81b2dba4bcc81d5dac96e
>>
>>
>>
>>
>=20
>
>

--=20
best regards,
Jos=C3=A9 Quaresma

--00000000000047eaf705b5a0082c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Alexander Kanavin &lt;<a href=3D"mail=
to:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; escreveu no dia q=
uinta, 3/12/2020 =C3=A0(s) 18:20:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div dir=3D"ltr"><div>I&#39;d rather teach bitbake to abs=
tain from starting new tasks when I/O or CPU gets tight.</div></div></block=
quote><div><br></div><div>This is definitely the best approach in my view. =
however more complex to implement.<br></div><div><br></div><div>Quaresma</d=
iv><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr"><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 3 Dec 2020 at 18:48, Ro=
ss Burton &lt;<a href=3D"mailto:ross@burtonini.com" target=3D"_blank">ross@=
burtonini.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Hi,<br>
<br>
Currently, BB_NUMBER_THREADS and PARALLEL_MAKE use the number of cores<br>
available unless told otherwise.=C2=A0 This was a good idea six years<br>
ago[1] but some modern machines are moving to very large core counts.<br>
<br>
For example, 88 core dual Xeons are fairly common. A ThunderX2 has 256<br>
cores (2 sockets, 4 hyperthreads per physical core). The Ampere Altra<br>
is dual socket 2*80=3D160 cores.<br>
<br>
At this level of parallelisation the sheer amount of I/O from the<br>
unpack storm is quite excessive.=C2=A0 As a strawman argument, I propose a=
<br>
hard cap to the default BB_NUMBER_THREADS of -- and I&#39;m literally<br>
making up numbers here -- 32.=C2=A0 Maybe 64.=C2=A0 Comments?<br>
<br>
Cheers,<br>
Ross<br>
<br>
[1] <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=
=3D1529ef0504542145f2b81b2dba4bcc81d5dac96e" rel=3D"noreferrer" target=3D"=
_blank">http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D1529ef0=
504542145f2b81b2dba4bcc81d5dac96e</a><br>
<br>
<br>
<br>
</blockquote></div>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr">best regards,<br>Jos=C3=A9 Qua=
resma</div></div></div>

--00000000000047eaf705b5a0082c--
