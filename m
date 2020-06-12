Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web12.18990.1591965714855793040
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 05:41:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=b2FZFWar;
 spf=pass (domain: burtonini.com, ip: 209.85.208.194, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f194.google.com with SMTP id a9so10912144ljn.6
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2020 05:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=5rZqc3WCJQf7WxGZUSSNL3A4BCZg148VOo6P+T8BloY=;
        b=b2FZFWar2d+1p8jDKlkgyBK2Q3ZuC93mnsr/FmfLjFBbt/0+v+gVUFsrgWfBK0gIHy
         7yHVVfaiygHXURVq+n+tpWpAEXGtMB7Al539wLPaD8qCS3rGhma38RfJkdCpKPEen1jw
         SWSSMUmxplL8Ab6ibJf+qSLR/emPstmQ9bfBrSC8lY8hQ0+lzfuiLir7SA241boAN2kv
         5tUUYxBZ/PScImmAGTS4qx6Y8Y0pus4X+GNQ5uPPWJFRbrNmpvafSyUgU6JAIAzLy7pm
         NPH08+tzggGZGOHo1GWibXM5Uz8jkT46BrBoaRKv/5fbGuB//0f2iwHAXzUmtK9VV6A+
         XzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=5rZqc3WCJQf7WxGZUSSNL3A4BCZg148VOo6P+T8BloY=;
        b=Ia5c27KFhKUN0u779JtXrDY1kAlxzbtIJE1IPJz1EbpB2ZGgd0Ngjw4H/jKpwBG+tS
         wR3SMyRX851ws31x9N/cP74Bu8lJmfUzVOCMVeVOFNKmqgcxn1wjlUPJsmJ7WBveM3DS
         YptQQfgIRhSdT5Pyny1iSqp8LnsrBQzV2dIqFyL/+qWNcg9YRkqH6n2mTx4Ji0Bs6NME
         +n0XHiJYyINovY+ZDEyA6wvwokjYH7MEuuA62eHJez/z9oym1xhAvjmIKGk8ybieMmlf
         RJNPk1aiyj7GJja66aODCvy1vIUGToEZuJlZTyZtE1rjL4lE0t+FqajgPqLXCedc1JpS
         /djQ==
X-Gm-Message-State: AOAM530RFXLb+IoPxQGx/eiE9uyeV8jcAX/LBxxCHZB2Df3cuR9ujIRo
	W6UW244+YyBHaU0HmQshYpUhtqZ/WUwn1zw62j3y1/9CR6jZ1g==
X-Google-Smtp-Source: ABdhPJxizzNgio14xhCYupm/pITDFyd+HTEAq9dZtiqYAgQqB2LICGks+smyF+Z5VcndhFsDPM1hFHfuj6Us6vzhA+s=
X-Received: by 2002:a2e:9a55:: with SMTP id k21mr7148176ljj.340.1591965712371;
 Fri, 12 Jun 2020 05:41:52 -0700 (PDT)
MIME-Version: 1.0
From: "Ross Burton" <ross@burtonini.com>
Date: Fri, 12 Jun 2020 13:41:41 +0100
Message-ID: <CAAnfSTtEgmjLHG68f+USz3gsxyda=VDdrt6a738jqGQJFbpE9w@mail.gmail.com>
Subject: Bootstrapping Go
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

Background: Go is written in Go.  This obviously presents an
interesting bootstrapping problem.

The current build process is as follows:

1) Build Go 1.4 (from 2014) for native builds (go-native.bb).  Go 1.4
was the latest release to be written in C, so this just needs a C
compiler.
2) Using go-native, build a modern Go cross compiler (go-cross.bb).
3) Using go-cross you can now build target Go code.  Success!

However this solution isn't ideal as Go 1.4 only supports a limited
number of hosts: i386, x86-64, and 32-bit Arm.   We've 64-bit Arm
machines in the autobuilder cluster, and we've seen people use PowerPC
build hosts too.

There are other ways to bootstrap Go:
- Prebuilt toolchain.  Go make binary releases for Linux on 32- and
64-bit x86 and Arm.  Pros: works on more platforms. Cons: As Go has
the nice feature that any Go compiler can target any
platform/architecture, we're now downloading a full working Go to
rebuild a full working Go.  Why not just use this Go?

- GCCGO.  GCC has an optional Go frontend, which can be used to build
Go. Pros: we already have a gcc recipe.  Cons: as we don't really want
to require gccgo on the host we'll need to build gcc-native, so why
not just build gcc-cross with Go enabled?

With the goal of minimal changes I wrote an alternative to go-native
that uses the prebuilt binaries to build our own Go:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=ross/go&id=4b2a5a12ab2d898ab4b1d8524b90f4e3938d01cf

With preferred provider set this can be used to build our own Go
toolchain.  Yes, we're relying on a prebuilt binary but we're still
building the tools we actually use, so I don't see this as massively
different to using a host compiler.  Does anyone have a strong
objection to bootstrapping our own Go by downloading the prebuilt
tools? I could either replace the existing go-native with this, or
have both available so that users who don't want to rely on binaries
and are happy with the limitation of Go 1.4 can stick with the source
bootstrap.

But looking forward, at this point we're downloading a perfectly good
Go toolchain to build a Go toolchain.  This observation has already
led to meta-go-binary (https://github.com/YoeDistro/meta-go-binary), a
drop-in alternative for the Go recipes that simply use the pre-built
releases.  Also modern GCC can also build a Go frontend, so we could
just enable that in gcc-cross as we're always building a cross
compiler anyway.  Does anyone have a strong opinion either way on
this?

Cheers,
Ross
