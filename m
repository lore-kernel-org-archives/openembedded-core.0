Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.224.1616082683521506029
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Mar 2021 08:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IpxWzEsA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id j7so6073539wrd.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Mar 2021 08:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=+u7WiQ1TWCtHjsQMUeRD5A7JzYD3ZFpIwGjOwiOxhX0=;
        b=IpxWzEsAViFGRQVoXK4APnmceIllKqlzKT+IpgF3fa45hC3D3vPaL+tPAfdkaPWBqs
         XxOfnQv1nIL2V1G1RAhmgFCxv6gkdw6CLc92vRg1R7QidHny+qZz4w47KwAT5gbczlox
         cRbYrNPFBZDDnSaM2H2Wy8l9N9cl1hPFxYgkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=+u7WiQ1TWCtHjsQMUeRD5A7JzYD3ZFpIwGjOwiOxhX0=;
        b=pTZbznkI1dWO0ahtmmZXM9cuw3cKQlt07c66sFrBRAtKRAKndYcpzditWbrvLojdVu
         tWZPdBsHDfI40wJySdGrAJ80gziA+nk6bayc1qlhfzfzPM8pImYUw+CYm2WftMi0H3LO
         wiiROwXUXMiPpdL9y/SgS3aCuw+6gU//F12Zvd0MBLcLtU6IAPVs7VqEKvK549h/EpG0
         /oAzf2AJLmULUI4V/aVe5+FSEDT6gbmcmicm/ax3cCNSIm2PQnq2Ko/F2VxIVTld+eZg
         2/C8III7y65fM9rz4S7Wjj/+Y87H/4zvfjmpvJZyPFV4wHeigQv1MIjvj1gEc4dUG8wC
         82KA==
X-Gm-Message-State: AOAM530lWDJmzQlXAecr06NC/h743pHiVEkVYFKRWFCCBsRDPViFrkwf
	RBNv+OMEWtsoebz5pIHEehZaB/mg9yXMEQ==
X-Google-Smtp-Source: ABdhPJxvDsFammDr/8GIzhocqfAcVFWtO9WawHiXb4geBDhfgvJyBieSofmLComif3udI+ax0rwYwA==
X-Received: by 2002:adf:9d82:: with SMTP id p2mr10520781wre.234.1616082681247;
        Thu, 18 Mar 2021 08:51:21 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:842d:8c78:da4:406b? ([2001:8b0:aba:5f3c:842d:8c78:da4:406b])
        by smtp.gmail.com with ESMTPSA id i3sm3553319wra.66.2021.03.18.08.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 08:51:21 -0700 (PDT)
Message-ID: <9d2c979e14353cb4ddd7bfbb5c48631d52a9e703.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] base.bbclass: Honor PATH when selecting hosttools
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Damian Wrobel <dwrobel@ertelnet.rybnik.pl>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Mar 2021 15:51:18 +0000
In-Reply-To: <17845dc3ffd.cbed61f719363.6674298828652258396@ertelnet.rybnik.pl>
References: 
	<17845b8040c.d366bfc510803.2986508994038431829@ertelnet.rybnik.pl>
	 <89c60143b0bc316c6eea953f9abef102c5b1f887.camel@linuxfoundation.org>
	 <17845dc3ffd.cbed61f719363.6674298828652258396@ertelnet.rybnik.pl>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-03-18 at 16:02 +0100, Damian Wrobel wrote:
>  ---- On Thu, 18 Mar 2021 15:31:02 +0100 Richard Purdie <richard.purdie@linuxfoundation.org> wrote ----
>  > On Thu, 2021-03-18 at 15:23 +0100, Damian Wrobel wrote:
>  > > Honors the PATH[1] and other user settings like
>  > > system wide ccache when selecting hosttools.
>  > > 
>  > > Fixes the following compilation error when compiling clang-11:
>  > > 
>  > >  | CMake Error at cmake/modules/CheckCompilerVersion.cmake:38 (message):
>  > >  |   Host GCC version must be at least 5.1, your version is 4.8.5.
>  > >  | Call Stack (most recent call first):
>  > >  |   cmake/modules/CheckCompilerVersion.cmake:48 (check_compiler_version)
>  > > 
>  > > on CentOS which by default has the gcc 4.8.5. However, this machine
>  > > has configured the gcc-7 from Developer Toolset[2] as a default one:
>  > > 
>  > >  $ gcc --version | head -n1
>  > >  gcc (GCC) 7.3.1 20180303 (Red Hat 7.3.1-5)
>  > > 
>  > >  $ which gcc
>  > >  /opt/rh/devtoolset-7/root/usr/bin/gcc
>  > > 
>  > > So far, I did not find any other software which would not respect
>  > > this setup.
>  > > 
>  > > This will also start honoring system-wide ccache configuration
>  > > (e.g. widely used on Fedora Linux) where the gcc is used from
>  > > the non-standard following location:
>  > > 
>  > >  $ which gcc
>  > >  /usr/lib64/ccache/gcc
>  > > 
>  > > once the user decided to install ccache package:
>  > > 
>  > >  $ rpm -qf /usr/lib64/ccache/gcc
>  > >  ccache-4.2-1.fc33.x86_64
>  > > 
>  > > [1] https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_09_01_01
>  > > [2] https://www.softwarecollections.org/en/scls/rhscl/devtoolset-7/
>  > > 
>  > > Signed-off-by: Damian Wrobel <dwrobel@ertelnet.rybnik.pl>
>  > > ---
>  > >  meta/classes/base.bbclass | 6 ------
>  > >  1 file changed, 6 deletions(-)
>  > > 
>  > > diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
>  > > index b4160402f0..67b0fa1497 100644
>  > > --- a/meta/classes/base.bbclass
>  > > +++ b/meta/classes/base.bbclass
>  > > @@ -131,12 +131,6 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
>  > >              if os.path.islink(desttool):
>  > >                  os.unlink(desttool)
>  > >              srctool = bb.utils.which(path, tool, executable=True)
>  > > -            # gcc/g++ may link to ccache on some hosts, e.g.,
>  > > -            # /usr/local/bin/ccache/gcc -> /usr/bin/ccache, then which(gcc)
>  > > -            # would return /usr/local/bin/ccache/gcc, but what we need is
>  > > -            # /usr/bin/gcc, this code can check and fix that.
>  > > -            if "ccache" in srctool:
>  > > -                srctool = bb.utils.which(path, tool, executable=True, direction=1)
>  > >              if srctool:
>  > >                  os.symlink(srctool, desttool)
>  > >              else:
>  > 
>  > This change simply removes a different change added to work around a different 
>  > problem. Do we know the original issue is fixed and this can be removed? My
>  > worry is that we end up with a cycle of sets of patches adding and removing 
>  > this :(.
>  > 
>  > Cheers,
>  > 
>  > Richard
>  > 
> 
> The original patch fa764a403da34bb0ca9fa3767a9e9dba8d685965 which 
> introduced this functionality says: "base/bitbake.conf: Filter 
> contents of PATH to only allow whitelisted tools"
> 
> So, I assuming that my patch should be fully aligned with it and in 
> addition it will correctly honor the order of the directories in the PATH.
> 
> In the case where PATH is: 
> 
> PATH=/opt/rh/devtoolset-7/root/usr/bin:/usr/lib64/ccache:/usr/local/bin:
> /usr/bin:/usr/local/sbin:/usr/sbin:/home/dwrobel1/.local/bin:/home/dwrobel1/bin
> 
> it will pick-up the gcc from the first entry "/opt/rh/devtoolset-7/root/usr/bin" 
> which is what the user would have expected and configured the system for.

I see I was the author of the original commit. I thought this was added as a fix
for ccache issues later, I guess I'd added it as part of the original commit
but it isn't mentioned in the commit message which is bad, sorry, that bit is my
fault.

There was more information added with:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=2e8f8d7eb330570a01c77e90540eb5e886243dbc

This piece was added for a reason as we saw failures from the change
originally and had to work around issues.

Going from memory and the comment that was added, I think the issue is that
ccache works on some systems by removing a PATH element like "/usr/lib64/ccache"
in your example and expecting things to work. If the gcc in HOSTTOOLS links
directly to that ccache version, the PATH trick played by these scripts does
not work as the redirects end up left in PATH and we end up in loops.

I don't recall which systems were playing this game with PATH but I suspect
they are still around and we need to avoid these loops. Your change would 
revert that and break those systems.

Cheers,

Richard








