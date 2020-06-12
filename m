Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.20016.1591968395004679999
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 06:26:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gBvDaERU;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id y6so1146116edi.3
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2020 06:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DiItkf+0lVNsq8tMVu9KK8x1yVKSKGlc3xotJtC0DLA=;
        b=gBvDaERUA3cGaCsbm99dpCj9XpfVRagO0imqDlZ91JIO70v6JzSIlJrVDsYZVPJ0zG
         vaSCfcARGs6aMEIl6a38cX5CaZzyVNWsCKsWucjXg/GWt7FXK8x4/9cCPHdSxlmK9kRZ
         FFUzrjHD+yMTO1EB7y5g+DgW6dQEVT0GJ7kitJfnpD09jzMi3f1S06i9kjqhxbRoucrB
         t36L0K1qhNnSPMpCOlNiHsQEoBB4Z8gsOOT1qV35io4C+ELlyw//p6HXLTHdPNipJ7BQ
         4g3vGsSjcfl9kKjD2/OtfN9DCH56RZ4nzAduI6Ip6w61H2rBOwxO65eHrh7bylkAeh5Q
         KADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DiItkf+0lVNsq8tMVu9KK8x1yVKSKGlc3xotJtC0DLA=;
        b=pj7I6keAxJEDHf+JEfDi0EIoMUODG31Zko/F9hgVxH5biXfQBHIqpN/u+S7mIFGbKF
         iEOuOGFEYKoESbAIZDO7cpj85BWTdKW6L9+kGMIZrYqnedXTqqXZBQUZu9glrvd7ZC5A
         4s+lU/mYvkO3faEShxZ7FbSYLrIRU39+SC5CJ1yln+cCpKeca+3YsVNlVrx9D3lS6Yko
         smwBMj5Mp0NaizCrzdJ/OCWEpCQF2n4xJmTtcn6czP5QeNA3f/M5rtJMJlVXjiE5TFCp
         WrC8/qNZ8puW4kUrBBnokcASg2QJwM3154hEKkstASz5p1dVqTF6cocgPx+kqSf+bzHb
         8PcQ==
X-Gm-Message-State: AOAM53022MbnS2N0v3hSGYJ8rRksWQeNr23ZNZPJJYpCvGFbwv5014AM
	QrqRgZ6AAzNyMvy0k6ukZ/HV5yOn/rAJ8Ybx4zg=
X-Google-Smtp-Source: ABdhPJwH1NjKWXb1aWxLvAayVslUjm4LiIPTHVRqJwrZ5YkczHv8AMO3bPyjct9Dv9gLBYZVhyZEjGnNWMlW/Lch0Y4=
X-Received: by 2002:aa7:c908:: with SMTP id b8mr11758539edt.76.1591968393270;
 Fri, 12 Jun 2020 06:26:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAAnfSTtEgmjLHG68f+USz3gsxyda=VDdrt6a738jqGQJFbpE9w@mail.gmail.com>
In-Reply-To: <CAAnfSTtEgmjLHG68f+USz3gsxyda=VDdrt6a738jqGQJFbpE9w@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 12 Jun 2020 15:26:22 +0200
Message-ID: <CA+chaQe3FfKLNMUXeGxMBS_+3aYmPV_v_4gseQP7S0t1zMzQVQ@mail.gmail.com>
Subject: Re: [OE-core] Bootstrapping Go
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000931a6b05a7e306da"

--000000000000931a6b05a7e306da
Content-Type: text/plain; charset="UTF-8"

I don't actively use go anywhere, so don't have strong opinion either way,
but from this description it looks like ASSUME_PROVIDED should be supported
as well, if someone manages his "perfectly good Go toolchain" in his
containers/OSs used in OE builds, then replacing it with another prebuilt
"perfectly good Go toolchain" from someone else might be unnecessary step.

On Fri, Jun 12, 2020 at 2:41 PM Ross Burton <ross@burtonini.com> wrote:

> Hi,
>
> Background: Go is written in Go.  This obviously presents an
> interesting bootstrapping problem.
>
> The current build process is as follows:
>
> 1) Build Go 1.4 (from 2014) for native builds (go-native.bb).  Go 1.4
> was the latest release to be written in C, so this just needs a C
> compiler.
> 2) Using go-native, build a modern Go cross compiler (go-cross.bb).
> 3) Using go-cross you can now build target Go code.  Success!
>
> However this solution isn't ideal as Go 1.4 only supports a limited
> number of hosts: i386, x86-64, and 32-bit Arm.   We've 64-bit Arm
> machines in the autobuilder cluster, and we've seen people use PowerPC
> build hosts too.
>
> There are other ways to bootstrap Go:
> - Prebuilt toolchain.  Go make binary releases for Linux on 32- and
> 64-bit x86 and Arm.  Pros: works on more platforms. Cons: As Go has
> the nice feature that any Go compiler can target any
> platform/architecture, we're now downloading a full working Go to
> rebuild a full working Go.  Why not just use this Go?
>
> - GCCGO.  GCC has an optional Go frontend, which can be used to build
> Go. Pros: we already have a gcc recipe.  Cons: as we don't really want
> to require gccgo on the host we'll need to build gcc-native, so why
> not just build gcc-cross with Go enabled?
>
> With the goal of minimal changes I wrote an alternative to go-native
> that uses the prebuilt binaries to build our own Go:
>
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=ross/go&id=4b2a5a12ab2d898ab4b1d8524b90f4e3938d01cf
>
> With preferred provider set this can be used to build our own Go
> toolchain.  Yes, we're relying on a prebuilt binary but we're still
> building the tools we actually use, so I don't see this as massively
> different to using a host compiler.  Does anyone have a strong
> objection to bootstrapping our own Go by downloading the prebuilt
> tools? I could either replace the existing go-native with this, or
> have both available so that users who don't want to rely on binaries
> and are happy with the limitation of Go 1.4 can stick with the source
> bootstrap.
>
> But looking forward, at this point we're downloading a perfectly good
> Go toolchain to build a Go toolchain.  This observation has already
> led to meta-go-binary (https://github.com/YoeDistro/meta-go-binary), a
> drop-in alternative for the Go recipes that simply use the pre-built
> releases.  Also modern GCC can also build a Go frontend, so we could
> just enable that in gcc-cross as we're always building a cross
> compiler anyway.  Does anyone have a strong opinion either way on
> this?
>
> Cheers,
> Ross
> 
>

--000000000000931a6b05a7e306da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I don&#39;t actively use go anywhere, so don&#39;t have st=
rong opinion either way, but from this description it looks like ASSUME_PRO=
VIDED should be supported as well, if someone manages his &quot;perfectly g=
ood Go toolchain&quot; in his containers/OSs used in OE builds, then replac=
ing it with another prebuilt &quot;perfectly good Go toolchain&quot; from s=
omeone else might be unnecessary step.</div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 12, 2020 at 2:41 PM Ross =
Burton &lt;<a href=3D"mailto:ross@burtonini.com">ross@burtonini.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
Background: Go is written in Go.=C2=A0 This obviously presents an<br>
interesting bootstrapping problem.<br>
<br>
The current build process is as follows:<br>
<br>
1) Build Go 1.4 (from 2014) for native builds (<a href=3D"http://go-native=
.bb" rel=3D"noreferrer" target=3D"_blank">go-native.bb</a>).=C2=A0 Go 1.4<b=
r>
was the latest release to be written in C, so this just needs a C<br>
compiler.<br>
2) Using go-native, build a modern Go cross compiler (<a href=3D"http://go=
-cross.bb" rel=3D"noreferrer" target=3D"_blank">go-cross.bb</a>).<br>
3) Using go-cross you can now build target Go code.=C2=A0 Success!<br>
<br>
However this solution isn&#39;t ideal as Go 1.4 only supports a limited<br=
>
number of hosts: i386, x86-64, and 32-bit Arm.=C2=A0 =C2=A0We&#39;ve 64-bi=
t Arm<br>
machines in the autobuilder cluster, and we&#39;ve seen people use PowerPC=
<br>
build hosts too.<br>
<br>
There are other ways to bootstrap Go:<br>
- Prebuilt toolchain.=C2=A0 Go make binary releases for Linux on 32- and<b=
r>
64-bit x86 and Arm.=C2=A0 Pros: works on more platforms. Cons: As Go has<b=
r>
the nice feature that any Go compiler can target any<br>
platform/architecture, we&#39;re now downloading a full working Go to<br>
rebuild a full working Go.=C2=A0 Why not just use this Go?<br>
<br>
- GCCGO.=C2=A0 GCC has an optional Go frontend, which can be used to build=
<br>
Go. Pros: we already have a gcc recipe.=C2=A0 Cons: as we don&#39;t really=
 want<br>
to require gccgo on the host we&#39;ll need to build gcc-native, so why<br=
>
not just build gcc-cross with Go enabled?<br>
<br>
With the goal of minimal changes I wrote an alternative to go-native<br>
that uses the prebuilt binaries to build our own Go:<br>
<br>
<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?=
h=3Dross/go&amp;id=3D4b2a5a12ab2d898ab4b1d8524b90f4e3938d01cf" rel=3D"noref=
errer" target=3D"_blank">http://git.yoctoproject.org/cgit/cgit.cgi/poky-con=
trib/commit/?h=3Dross/go&amp;id=3D4b2a5a12ab2d898ab4b1d8524b90f4e3938d01cf<=
/a><br>
<br>
With preferred provider set this can be used to build our own Go<br>
toolchain.=C2=A0 Yes, we&#39;re relying on a prebuilt binary but we&#39;re=
 still<br>
building the tools we actually use, so I don&#39;t see this as massively<b=
r>
different to using a host compiler.=C2=A0 Does anyone have a strong<br>
objection to bootstrapping our own Go by downloading the prebuilt<br>
tools? I could either replace the existing go-native with this, or<br>
have both available so that users who don&#39;t want to rely on binaries<b=
r>
and are happy with the limitation of Go 1.4 can stick with the source<br>
bootstrap.<br>
<br>
But looking forward, at this point we&#39;re downloading a perfectly good<=
br>
Go toolchain to build a Go toolchain.=C2=A0 This observation has already<b=
r>
led to meta-go-binary (<a href=3D"https://github.com/YoeDistro/meta-go-bin=
ary" rel=3D"noreferrer" target=3D"_blank">https://github.com/YoeDistro/meta=
-go-binary</a>), a<br>
drop-in alternative for the Go recipes that simply use the pre-built<br>
releases.=C2=A0 Also modern GCC can also build a Go frontend, so we could<=
br>
just enable that in gcc-cross as we&#39;re always building a cross<br>
compiler anyway.=C2=A0 Does anyone have a strong opinion either way on<br>
this?<br>
<br>
Cheers,<br>
Ross<br>
<br>
</blockquote></div>

--000000000000931a6b05a7e306da--
