Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web12.19958.1586102145409979358
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2020 08:55:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KS3MHFLD;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id c14so10854230qtp.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2020 08:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VN1jcJsEu1B8/j/l9vZNCzyqJ8lMRT6Jl9SBMzvWEmI=;
        b=KS3MHFLDHl3hBzMDNObxH2y4HuGpgbsoKr9PCfnYqE1gJkbAvfQYb8hIewnhWd0YZA
         /d75aubuBCvY/mXT+XhVOleiy81aXgZeZoy1RvN44zKR2i890BTUEYznwbASCpeG2Yxi
         KDpG55qLTKS43kE/m24i5i0i3ZnZ653JKuFf0PjcU75CjlFCeM1dgzkVKxyoC0Z9MHHP
         8NVOk/K8HNrDnS8COJNGkl1Zhu6zKcvdwti/ugfg6jNxKTmZ93qSNxCfD0DzyS6EwN1d
         tBvmae2bGiF3UFNp0U9nPWwkrnKSy5+Kigw6Vpuaxt6yhyBI5OjuCAvI6ZMXas76x7jX
         wCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VN1jcJsEu1B8/j/l9vZNCzyqJ8lMRT6Jl9SBMzvWEmI=;
        b=RCcv06nDzHW+Dm0tS4SWLvIhiIIf1mM4p9pSOqJZ5dXq+qUAvb0YD9wgkOIR5vWPcV
         CsbPIQr4a2PAI1sMfmVUqzmFhELNs4cAvRjpVpRGdGFOnqU3WMcMqUYwBRjnKFDiwnmR
         xE03pNKjZopqZVW7Z4OG66/akaizhG5XPf20AMe+632TdySKZtycBe9zqVvHzgGyzbrx
         WPpv1lknt+G3gdRu3sJVDcPviZa8SJsUOJ+xQER0lyU5V6dXtRRqsgrpC0/xav8tLXVx
         8FAGGp/BVHiR0ULDjQaup68P6avypvtWQOF3m8qA5u2pU35wDo0/AL7VeJe584ZGyXMi
         9aCw==
X-Gm-Message-State: AGi0PubrGZ0pSCeqgzG1um+NyXpsDGezGicvlMQXC/f8zLdKIF0v6lip
	drwKAKq8k5wPt29dgJwt/B+YDI2dIGXvM8SEyFw=
X-Google-Smtp-Source: APiQypK5UzhxvkNnp7edRVaivZkgMExU3r+MSw7BPNXl+rAudcSvrvISl8OwsmlqYfYX33Pi32DdT3gzvcXKuwRsRrA=
X-Received: by 2002:ac8:17f9:: with SMTP id r54mr16887817qtk.285.1586102144203;
 Sun, 05 Apr 2020 08:55:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200402205632.1355452-1-mkelly@xevo.com> <CAMKF1sof=p33GFPcw2wL4JO59iAuSh6e0+9ZcaQd1K5HK-MOuw@mail.gmail.com>
In-Reply-To: <CAMKF1sof=p33GFPcw2wL4JO59iAuSh6e0+9ZcaQd1K5HK-MOuw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 5 Apr 2020 08:55:17 -0700
Message-ID: <CAMKF1sqjZGoopbz0Pp7MPySSx6D0MCHtbv1Uf4tPEJhDtnVeLA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cmake: fix Python executable with cmake
To: Martin Kelly <mkelly@xevo.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 3, 2020 at 5:54 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Hi Martin
>
> I am seeing upm package failures, which I think are related to this change
>
> https://errors.yoctoproject.org/Errors/Details/400570/
> https://errors.yoctoproject.org/Errors/Details/400566/
> https://errors.yoctoproject.org/Errors/Details/400588/
>

I looked at it a bit and have sent a fix for upm, hopefully rest of
meta-openembedded packages are ok

> On Thu, Apr 2, 2020 at 1:59 PM Martin Kelly <mkelly@xevo.com> wrote:
> >
> > Currently, CMake has two ways of finding Python executables:
> > FindPythonInterp and FindPython/FindPython3. FindPythonInterp is
> > deprecated and may be removed at some point. Currently, python3native
> > sets PYTHON_EXECUTABLE, which FindPythonInterp uses. This is a problem
> > for a few reasons:
> >
> > - Setting PYTHON_EXECUTABLE as an environment variable doesn't work, as
> >   CMake needs it to be set as an explicit CMake option via -D.
> > - Projects using the newer FindPython/FindPython3 don't pickup the right
> >   Python, as the newer routines use Python_EXECUTABLE and
> >   Python3_EXECUTABLE.
> >
> > Fix this by setting PYTHON_EXECUTABLE, Python_EXECUTABLE, and
> > Python3_EXECUTABLE using -D options to EXTRA_OECMAKE.
> >
> > The CMake routines are documented below:
> > https://cmake.org/cmake/help/latest/module/FindPythonInterp.html
> > https://cmake.org/cmake/help/latest/module/FindPython.html
> > https://cmake.org/cmake/help/latest/module/FindPython3.html
> >
> > Signed-off-by: Martin Kelly <mkelly@xevo.com>
> > ---
> >  meta/classes/cmake.bbclass         | 3 +++
> >  meta/classes/python3native.bbclass | 2 --
> >  2 files changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> > index d91cf20130..94ed8061bb 100644
> > --- a/meta/classes/cmake.bbclass
> > +++ b/meta/classes/cmake.bbclass
> > @@ -175,6 +175,9 @@ cmake_do_configure() {
> >           -DCMAKE_INSTALL_LIBDIR:PATH=${@os.path.relpath(d.getVar('libdir'), d.getVar('prefix') + '/')} \
> >           -DCMAKE_INSTALL_INCLUDEDIR:PATH=${@os.path.relpath(d.getVar('includedir'), d.getVar('prefix') + '/')} \
> >           -DCMAKE_INSTALL_DATAROOTDIR:PATH=${@os.path.relpath(d.getVar('datadir'), d.getVar('prefix') + '/')} \
> > +         -DPYTHON_EXECUTABLE:PATH=${PYTHON} \
> > +         -DPython_EXECUTABLE:PATH=${PYTHON} \
> > +         -DPython3_EXECUTABLE:PATH=${PYTHON} \
> >           -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
> >           -DCMAKE_INSTALL_SO_NO_EXE=0 \
> >           -DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain.cmake \
> > diff --git a/meta/classes/python3native.bbclass b/meta/classes/python3native.bbclass
> > index 182c11aa2e..d98fb4c758 100644
> > --- a/meta/classes/python3native.bbclass
> > +++ b/meta/classes/python3native.bbclass
> > @@ -1,8 +1,6 @@
> >  inherit python3-dir
> >
> >  PYTHON="${STAGING_BINDIR_NATIVE}/python3-native/python3"
> > -# PYTHON_EXECUTABLE is used by cmake
> > -PYTHON_EXECUTABLE="${PYTHON}"
> >  EXTRANATIVEPATH += "python3-native"
> >  DEPENDS_append = " python3-native "
> >
> > --
> > 2.25.1
> >
> > 
