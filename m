Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web08.874.1607019623851134397
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 10:20:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=B0Aj2WUe;
 spf=pass (domain: gmail.com, ip: 209.85.217.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id q10so1761501vsr.13
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 10:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Viq0IRBgXiF7VoHr5fwkpDeVwMV1wIHq5crGWNzxvEU=;
        b=B0Aj2WUe7Gfp+kt0t2BegtP7KEtdc5V+gdVhfe1EqaU7TIWWq6AzQP5cI0zPFt1tCo
         oAnRfJPy7s7P7HGjUog0V2op4C/tvXqWnHqAIvx5tDisMPZ+fiKwaofdYwu2rG6vz4Vh
         /233hRPG/j4cjVI2NS+pfU20b58F84MiKdaFd1U0ib6Q8HGFSYlf75vI5sHZI2jEimr6
         lTyXqbaHb1ENfxry/DJv0HOC64fd+e9bc/wFHbTIQ2wDt4AVCSiMaUiXr7wFI59tEhR2
         GK0wKrryv9KqGrj/GKkLPAe/xfKbxDkGfz3Ki3KCzMQTrIPvXFEowdyUhFrPLwICIPC7
         BzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Viq0IRBgXiF7VoHr5fwkpDeVwMV1wIHq5crGWNzxvEU=;
        b=BOcyIawWDhNFPu7r9HNBa2b65VxK72CMJWOrV2pIPo9p8oVIqOLZ7k4IBPXOz7/vPd
         tEXzdEE4nXpLD0cm+AKlS9bqQmKnbZp2mn9ISD3Og9CDE9U+tPrNBCNSnCmlrHCC46nu
         7FrS59bCwafjL2QnAc5I1kmFSje613RQbn3USwkIyvCEyRh94D5EMf5txm2YWhUW810O
         S8BECISWa+Eep50SEufR8RjrHq+zk2ouGE6KK4vK5rX1GrsFXF2Z5RUBqcLbIEg7Z3gl
         wdxN2H7JW9iQe18bW10yDZ6UWNuKpFsLIIhx/Pkhhje7CWzUqXRFzXvO+mclJLA4NFCg
         viRw==
X-Gm-Message-State: AOAM5321IjNy/lsCT8hXvAxi0dfa4Hl7nN40T0BsyH50q3gPcGwmLJjU
	h1bRqNIBM8AD9GU2litVZnp25UPqOjcrqGdzLaY=
X-Google-Smtp-Source: ABdhPJwPNOnCHlMqEtAeec3BE5AgJ6uG7QtH0zwPd0fQxkZY/I9jbimdNuAdZE2FubVsHBV81cgTJqTiaAHkt94EvQM=
X-Received: by 2002:a67:874c:: with SMTP id j73mr519472vsd.51.1607019622960;
 Thu, 03 Dec 2020 10:20:22 -0800 (PST)
MIME-Version: 1.0
References: <CAAnfSTuCTy4U60iJwtMm=N1PEaWjz6XyL_idgRXJVbzuLHggUw@mail.gmail.com>
In-Reply-To: <CAAnfSTuCTy4U60iJwtMm=N1PEaWjz6XyL_idgRXJVbzuLHggUw@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 3 Dec 2020 19:20:11 +0100
Message-ID: <CANNYZj_cQy2di0z7ianh59q-gXsDPR4uxZ0xZLQRLxx9PUu7sA@mail.gmail.com>
Subject: Re: [OE-core] Automatic cap on BB_NUMBER_THREADS and PARALLEL_MAKE
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c6178105b59369b9"

--000000000000c6178105b59369b9
Content-Type: text/plain; charset="UTF-8"

I'd rather teach bitbake to abstain from starting new tasks when I/O or CPU
gets tight.

Alex

On Thu, 3 Dec 2020 at 18:48, Ross Burton <ross@burtonini.com> wrote:

> Hi,
>
> Currently, BB_NUMBER_THREADS and PARALLEL_MAKE use the number of cores
> available unless told otherwise.  This was a good idea six years
> ago[1] but some modern machines are moving to very large core counts.
>
> For example, 88 core dual Xeons are fairly common. A ThunderX2 has 256
> cores (2 sockets, 4 hyperthreads per physical core). The Ampere Altra
> is dual socket 2*80=160 cores.
>
> At this level of parallelisation the sheer amount of I/O from the
> unpack storm is quite excessive.  As a strawman argument, I propose a
> hard cap to the default BB_NUMBER_THREADS of -- and I'm literally
> making up numbers here -- 32.  Maybe 64.  Comments?
>
> Cheers,
> Ross
>
> [1]
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=1529ef0504542145f2b81b2dba4bcc81d5dac96e
>
> 
>
>

--000000000000c6178105b59369b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;d rather teach bitbake to abstain from starting=
 new tasks when I/O or CPU gets tight.</div><div><br></div><div>Alex<br></d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Thu, 3 Dec 2020 at 18:48, Ross Burton &lt;<a href=3D"mailto:ross@burt=
onini.com">ross@burtonini.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Hi,<br>
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

--000000000000c6178105b59369b9--
