Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.5139.1616920282058397119
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Mar 2021 01:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bMNfhl9X;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id j18so9760350wra.2
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Mar 2021 01:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=m2qEIuNw7xYR5fAULibTU864TZdOUYxyFZZFs+Vqf78=;
        b=bMNfhl9XHQorCtigb0R3aKfLmgvex2BttTVbkNZ3GEoRG6ZczRyBacGE+o0UN3Hx4x
         qzmwcJQd2MaSBJ8WOX294vDmSoLtlC8mGLAeSTcS9cjGGN8Uh/s70Y7IrkrdIJxY4Lhs
         cpmVNSO2wTK7pHh8fN2K0F8dRvkMHmwkDO/x8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=m2qEIuNw7xYR5fAULibTU864TZdOUYxyFZZFs+Vqf78=;
        b=Rc0Cp9bTM/sZeBNxivOot46F5ONhw2cLqeT/dRkC2HNPgmmfS3hBwxdlVTonKhbkEW
         EAywx4DA63Nw+zd5XNL8fte6BoYQroWUp85y1LynCr4HfLOYfzSsfdGlrFzc/AkBzAU3
         pqt1dWBdcrBDgegicjyrbDYw+7dMaSm6TvZG4sNXUQVgeFvkYaOYgDYKluqCHt0RJhl4
         DiJ9smlwewMlRsUt3kfTuFRroLV9MPxuQ4OfylQrANstiQ0kC5GgE8A5iG15v8td8O6G
         oWw5jdnICFHZ0WSXNY9i4X0s+Nr+iCLgn+Y5YE4y8gB8MJKVCPOCpq9INqoTtVOY8tyr
         ierQ==
X-Gm-Message-State: AOAM532vb6Tng4hPWO5bqP+sIKf9HofTc+fuKn6K/g/ALxpZUYvJsKMX
	6tMaXkd2V5/Tz4hXqMZFISW6Fw==
X-Google-Smtp-Source: ABdhPJx5RyC0vDdXybTaB3NDjlrhbqFM5tWKMx5dgwwkAEmI5bkTSq3trO7a5b5oHK1uujynGWIRbg==
X-Received: by 2002:adf:fec5:: with SMTP id q5mr22141869wrs.43.1616920280535;
        Sun, 28 Mar 2021 01:31:20 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1d2c:6290:11e9:3ac1? ([2001:8b0:aba:5f3c:1d2c:6290:11e9:3ac1])
        by smtp.gmail.com with ESMTPSA id r16sm17079301wrx.75.2021.03.28.01.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 01:31:20 -0700 (PDT)
Message-ID: <64353810c852fb6e27d8b088f694b9aa9dc987c4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] lib/oe/utils: ignore stderr while checking compiler version
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>, Lars Poeschel <poeschel@lemonage.de>
Cc: openembedded-core@lists.openembedded.org
Date: Sun, 28 Mar 2021 09:31:17 +0100
In-Reply-To: <20210328043504.GA14886@denix.org>
References: <20210327014118.2874876-1-poeschel@lemonage.de>
	 <5d8f977d40c22d068dd8aa23e8d1f145752aebd7.camel@linuxfoundation.org>
	 <20210328022502.q76akgphxyuf2o5l@lem-wkst-02.lemonage>
	 <20210328043504.GA14886@denix.org>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-03-28 at 00:35 -0400, Denys Dmytriyenko wrote:
> On Sun, Mar 28, 2021 at 04:25:02AM +0200, Lars Poeschel wrote:
> > On Sat, Mar 27, 2021 at 01:54:11PM +0000, Richard Purdie wrote:
> > > On Sat, 2021-03-27 at 02:41 +0100, Lars Poeschel wrote:
> > > > From: Lars Poeschel <poeschel@lemonage.de>
> > > > 
> > > > The functions for checking the C compiler version call the compiler with
> > > > the --version argument and capture stdout and stderr to extract the
> > > > version information from that. This does not work if something goes
> > > > wrong for the compiler and it then prints some warning to stderr. The
> > > > following regex will certainly fail in that case.
> > > > It is better to just concentrate on stdout where the real version is
> > > > printed to and ignore stderr. So we have a chance to get a version info
> > > > even if a waring or error happened.
> > > > 
> > > > Signed-off-by: Lars Poeschel <poeschel@lemonage.de>
> > > > ---
> > > >  meta/lib/oe/utils.py | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > What kind of warning/error would a compiler generate that we should 
> > > ignore here? This seems a little odd...
> > 
> > Well, to be more specific: It seems to come from the shell, that then
> > invokes the compiler. Nevertheless it is stored in the output variable.
> > In my case it contains:
> > /nix/store/9ywr69qi622lrmx5nn88gk8jpmihy0dz-bash-4.4-p23/bin/sh: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)
> > /nix/store/9ywr69qi622lrmx5nn88gk8jpmihy0dz-bash-4.4-p23/bin/bash: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)
> 
> It is common to prefix command invocations with LC_ALL=C to avoid such issues.
> For example:
> 
> https://git.openembedded.org/openembedded-core/tree/scripts/lib/recipetool/append.py#n151
> > helptext = subprocess.check_output('LC_ALL=C %s --help' % command, shell=True).decode('utf-8')

We have:

meta/conf/bitbake.conf:export LC_ALL = "en_US.UTF-8"

so if this is showing warnings, the rest of the build isn't going to be 
great either.

Why en_US.UTF-8? We need a utf-8 locale for python and a C utf-8 locale 
isn't standard. en_US is as close to standard across distros as we can get.

Adding LC_ALL=C everywhere isn't the right solution, we're certainly not 
prefxixing every shell command execution with that.

Cheers,

Richard



