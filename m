Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.1263.1585961673577136832
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2020 17:54:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XdUYsL1I;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id o18so7317021qko.12
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2020 17:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e9gh9s8EK8+4tUWAwEIozL24WpYbor8S5/LcjdFvzGM=;
        b=XdUYsL1IttYTfb+V1m3GjQZ0P/Zn6UslNtQHzfoMf3AheXx4IdZIeAfGQB5p9M11WR
         4L8Cde+dksiKiqmu+NaI3cqgKkdQTM670cQetbYucpYRqwSsV8lEe3kHW3XaDXvnIf1T
         jQowFvjQAUTC9miEL6IYpB25FaNc+zJpa5nPfU8clpQZP0RJpT3yrzhPg+J1ViXk5OCu
         t8jQ9OA5g7InYB3NOg5PYNQGkIXwUCQyA450+u/ozIW0ftz0RQLNqAU40bkbDsmhgx0k
         vJS0FMYeS2/zoxLjDsOKXgnmE86/v7ujfrnS0XQ4iMtVB6pLVY56v6PWU/EUuaGsD17+
         SJUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e9gh9s8EK8+4tUWAwEIozL24WpYbor8S5/LcjdFvzGM=;
        b=QQNTHRFwt3gRuYAhaSMuRecOdFAoIMKXYVw5yswqg2cnJp2pnlvMLXE2z2TfSaJ3Ag
         kqjxhhGqKhk9cmRsPoVGnPrWotH78C29pK2a4eaHX1k+/5vI6yocZgI+d6gAuLGNVinC
         u8633tWU6IqT2RvY2fBAJ1TEUFnj3Z9WXyeVROhRu+Sefd4s/jRxk1kOmKilW9ZLjlMK
         QmKqJdZadINlkEY7gBphh8HtSAph9UlgJWJZD3LzJIoWwc13bbFIlMf85L6ujw66fFpH
         Oeh6T3xPLlGfHYkHkwiTHt6BDhDRvmRbXOOUa0l/XfS0Iei0EKWOcaGGHgRLcxFKS4f/
         fRdg==
X-Gm-Message-State: AGi0PuZBW/P6fIDWcN8xM3dV7he2lJ9sEKpN+JieynHs4y6F8Q3XFWtK
	71+twdgmK/748MamoRpNNb+Z/pHgCkYv/EOSXoE=
X-Google-Smtp-Source: APiQypLpUiWtaNtjEwkmXTd1LsbkmOlxJwOwsGky161zfYwiqsvGkPTjSE6ndRjFeP9yLpfrMcLI1SJCYTyAYVWRAVI=
X-Received: by 2002:a05:620a:10a8:: with SMTP id h8mr11834563qkk.215.1585961672376;
 Fri, 03 Apr 2020 17:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200402205632.1355452-1-mkelly@xevo.com>
In-Reply-To: <20200402205632.1355452-1-mkelly@xevo.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 3 Apr 2020 17:54:05 -0700
Message-ID: <CAMKF1sof=p33GFPcw2wL4JO59iAuSh6e0+9ZcaQd1K5HK-MOuw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cmake: fix Python executable with cmake
To: Martin Kelly <mkelly@xevo.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Martin

I am seeing upm package failures, which I think are related to this change

https://errors.yoctoproject.org/Errors/Details/400570/
https://errors.yoctoproject.org/Errors/Details/400566/
https://errors.yoctoproject.org/Errors/Details/400588/

On Thu, Apr 2, 2020 at 1:59 PM Martin Kelly <mkelly@xevo.com> wrote:
>
> Currently, CMake has two ways of finding Python executables:
> FindPythonInterp and FindPython/FindPython3. FindPythonInterp is
> deprecated and may be removed at some point. Currently, python3native
> sets PYTHON_EXECUTABLE, which FindPythonInterp uses. This is a problem
> for a few reasons:
>
> - Setting PYTHON_EXECUTABLE as an environment variable doesn't work, as
>   CMake needs it to be set as an explicit CMake option via -D.
> - Projects using the newer FindPython/FindPython3 don't pickup the right
>   Python, as the newer routines use Python_EXECUTABLE and
>   Python3_EXECUTABLE.
>
> Fix this by setting PYTHON_EXECUTABLE, Python_EXECUTABLE, and
> Python3_EXECUTABLE using -D options to EXTRA_OECMAKE.
>
> The CMake routines are documented below:
> https://cmake.org/cmake/help/latest/module/FindPythonInterp.html
> https://cmake.org/cmake/help/latest/module/FindPython.html
> https://cmake.org/cmake/help/latest/module/FindPython3.html
>
> Signed-off-by: Martin Kelly <mkelly@xevo.com>
> ---
>  meta/classes/cmake.bbclass         | 3 +++
>  meta/classes/python3native.bbclass | 2 --
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index d91cf20130..94ed8061bb 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -175,6 +175,9 @@ cmake_do_configure() {
>           -DCMAKE_INSTALL_LIBDIR:PATH=${@os.path.relpath(d.getVar('libdir'), d.getVar('prefix') + '/')} \
>           -DCMAKE_INSTALL_INCLUDEDIR:PATH=${@os.path.relpath(d.getVar('includedir'), d.getVar('prefix') + '/')} \
>           -DCMAKE_INSTALL_DATAROOTDIR:PATH=${@os.path.relpath(d.getVar('datadir'), d.getVar('prefix') + '/')} \
> +         -DPYTHON_EXECUTABLE:PATH=${PYTHON} \
> +         -DPython_EXECUTABLE:PATH=${PYTHON} \
> +         -DPython3_EXECUTABLE:PATH=${PYTHON} \
>           -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
>           -DCMAKE_INSTALL_SO_NO_EXE=0 \
>           -DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain.cmake \
> diff --git a/meta/classes/python3native.bbclass b/meta/classes/python3native.bbclass
> index 182c11aa2e..d98fb4c758 100644
> --- a/meta/classes/python3native.bbclass
> +++ b/meta/classes/python3native.bbclass
> @@ -1,8 +1,6 @@
>  inherit python3-dir
>
>  PYTHON="${STAGING_BINDIR_NATIVE}/python3-native/python3"
> -# PYTHON_EXECUTABLE is used by cmake
> -PYTHON_EXECUTABLE="${PYTHON}"
>  EXTRANATIVEPATH += "python3-native"
>  DEPENDS_append = " python3-native "
>
> --
> 2.25.1
>
> 
