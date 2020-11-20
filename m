Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web12.849.1605894264710361702
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 09:44:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LkyTmGbb;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id y197so9663393qkb.7
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 09:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hY2mDb3ocsaNso5lv5xNMuSm+nu3VkscF624w0i7vko=;
        b=LkyTmGbb1/3S54YJYyXvkuFeWaz6M0XuqiN8LRE2nrxUwXJxr1tjZhofQDeLu5RBUH
         Gw4J1pLNanryftnISwcrYLB6M+BJnPWdAtZTkAk1/qFQ5iHI0lildB8I6VV6/JjODlVm
         3RL+LqspUXPj58DdAvILb4BpllPA2HEgWvxcytGtbG4lKPIzA9uVlsJFVS5Gq7Timf4E
         XgH8TWKU1a69G7wuz3t/pv/eQGV3Z597PQ6jpgfZ6leGu4/My+9+RqjzB/L0dSoURf7J
         jYubaSOIEpdNx/xsjvpZLUxADxmbXCWJpMm5m7Fj/zhT9VszAieZjoiWliQ09HmGtn56
         mDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hY2mDb3ocsaNso5lv5xNMuSm+nu3VkscF624w0i7vko=;
        b=RbqS+h5GN6Z1IhZen7bYKPGJ9vJJ8Pe2EJhomawCMgipfhzSUQ8YsgHSqBkw6O1p0n
         PBi2+oA3xaKNO1FCEIpU57L6kxjVf5mQFP49AA2kdq1VVFD5A1lZ1ft/E+/chDfHPazo
         WzWKpPh+hFOlRLOXEsH6IALUyQdbodYqqIWh/OQNEx9OkpXTVLvM70WB+pebCrNgCAc0
         u/fa5TmLw+Ic5t9Li0eVJfEM1m8hifIwihGLUus4VHV6BnBfSBD77OETN/Z82ifig8qh
         1lbX2IERfpwNVGmyn8NKjwcVLVGY6j5nHOnJaUk9M/E/vIYAVbh3FPIgn+efUEmINKzX
         I7+g==
X-Gm-Message-State: AOAM532xGGRgS6XPID6iycb9liq40MOGdzMeXptoNphnfNS0p7pnbi8E
	jLWbpQgFAmQUeuR0EhZQlqUsUV8xYd+q7FyJlOg=
X-Google-Smtp-Source: ABdhPJwKOrhjwAnqQJyFDlbkJWIaur1gQJ/86cpeXgpb/XV7nsaGjmqApVcgfOsDRLwB+1da7pn3dLEJSGQkcCNH1CQ=
X-Received: by 2002:a05:620a:204c:: with SMTP id d12mr17997612qka.212.1605894263735;
 Fri, 20 Nov 2020 09:44:23 -0800 (PST)
MIME-Version: 1.0
References: <20201120081520.1356830-1-raj.khem@gmail.com> <16494477F3BE7FC7.12254@lists.openembedded.org>
 <2661dbaed4995b2e276b2cf9d5f89877645b6a4d.camel@linuxfoundation.org>
In-Reply-To: <2661dbaed4995b2e276b2cf9d5f89877645b6a4d.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 20 Nov 2020 09:43:57 -0800
Message-ID: <CAMKF1sriatsRA79BK3WzqDggXfpR5VvaRdOx7DrRpu_Z4RFCzg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] go: Update to 1.15.5
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 20, 2020 at 9:33 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2020-11-20 at 16:33 +0000, Richard Purdie via
> lists.openembedded.org wrote:
> > On Fri, 2020-11-20 at 00:15 -0800, Khem Raj wrote:
> > > Define CXX_FOR_TARGET and CC_FOR_TARGET for target go
> > > since we are cross building it, it helps in defining the compiler
> > > for cgo on target
> > >
> > > Disable CGO_LDFLAGS for go-runtime since it confuses the linker
> > >
> > > Fixes
> > > > Building std for target, linux/arm.
> > > > go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > > v2: Fix go-runtime build
> >
> > Various failures in world builds:
> >
> > musl x86:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/2728
> > musl x86-64:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/2731
> > no-x11:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/2729
>
> and selftests:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1582
>
> Cheers,

thanks I can see some of it locally too. will deep dive there is
something quirky with CGO flags
>
> Richard
>
