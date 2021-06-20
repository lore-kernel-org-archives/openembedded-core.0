Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.38842.1624225497923373703
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jun 2021 14:44:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CRQ7Z7i0;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d9so11951425qtp.11
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Jun 2021 14:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NMywLkUyXaWI1hVkmzn4pylrvFhgsgDffX1J36Otxq0=;
        b=CRQ7Z7i03LwRIYS3lDRGT1g5yee73rmC40F7KK26gDwuCKMdA+SUCWebNNRwKJp36k
         8+rZJ84s7M5m4ddaXt1abNIwNsYqWX5C5D9BwOGxAsVFNog49I56Gz8aLiwj6pJta27A
         rqEFpZ7elhf3gxG4VVM6AhpkrYeHWEYspoazMVDGKMYFvcmABVuKpFWeB2dJo82Y9gkH
         4QoBHaC7fZoU2/1fIl+eymSlR2bKo+/sxVTBPlUfI/OUVQ/1ytN/aSy1g2djWmcPmj6I
         BA7pCRemX9IHjtg1OXCGbIfEUeGtrV7GX0NjdTqYG0/44TYKcWD6CcnbYvxbhXGEg3uN
         Hl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NMywLkUyXaWI1hVkmzn4pylrvFhgsgDffX1J36Otxq0=;
        b=BN/Zm7YK9nFujREQWwAMqp2okPNdIVBI5qmrERXS0PncJ7BHNrhkVklnwik+b6FYrD
         CDLkHANE1rMk5xdTmkN/dmvBDP+lZfKpQ4Ek+9j76ZVXqc9/THaDQFS+BbCYlgNUPw3a
         yzatsmYLtNQjj/dIasWphlbl8tFgGrU3VdWxyGfJeffKrzMKblBpRwzTPoUjDJr4Unrr
         g3lZHsZSJ7nOqPnQuupyNxQ7Uk/ccQ2CEMmM1GLo82n/9KqeXTls+4sKVrIWpdYCdY+m
         lGEEFKnMYnuf/YUCfaY0TyWtPzwKN3A4Uxh4IOaOjl4IGAaRpeEoOLRqMyO6FT8B+aDp
         w/vQ==
X-Gm-Message-State: AOAM5300dLW0o5z/DXjxsP28Uunt0tJYQ1xwSExPFFAJQ7k2rlILIPdE
	j3jVQb4plyR1nCciV7dcTP6kTrWjiZ2jT9//8bY=
X-Google-Smtp-Source: ABdhPJwW+ihuqFTGFUQVNJq6hm/NRLvsu0TQ2rOTlNt3EgzC5vCGDu6HdCsna6uddBGxC/+eHafskL/5a84XIyeqFaA=
X-Received: by 2002:ac8:4b4b:: with SMTP id e11mr10029370qts.289.1624225497060;
 Sun, 20 Jun 2021 14:44:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210620185156.10634-1-abrodkin@synopsys.com>
In-Reply-To: <20210620185156.10634-1-abrodkin@synopsys.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 20 Jun 2021 14:44:31 -0700
Message-ID: <CAMKF1sqxeM1JbM3Q=ExcCgQvdHTisujdYb1WfQhHg-89oM8FAw@mail.gmail.com>
Subject: Re: [PATCH] gcc: Apply multilib fix to ARC as well
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

this looks fine,

On Sun, Jun 20, 2021 at 11:52 AM Alexey Brodkin
<Alexey.Brodkin@synopsys.com> wrote:
>
> W/o that hack target GCC assume existence of per-mcpu folders,
> which are missing.
>
> In particular G++ failed to find "bits/c++config.h":
> ------------------>8------------------
>  root@hsdk:~# cat test.cc
>  #include <cstdlib>
>
>  int myfunc(void)
>  {
>  }
>
>  root@hsdk:~# g++ -c test.cc -v
>  Using built-in specs.
>  COLLECT_GCC=g++
>  Target: arc-oe-linux
>  Configured with: ../../../../../../work-shared/gcc-11.1.0-r0/gcc-11.1.0/configure --build=x86_64-linux --host=arc-oe-linux --target=arc-oe-linux --prefix=/usr --exec_prefix=/usr -x
>  Thread model: posix
>  Supported LTO compression algorithms: zlib
>  gcc version 11.1.1 20210523 (GCC)
>  COLLECT_GCC_OPTIONS='-c' '-v' '-shared-libgcc' '-mcpu=hs38_linux'
>   /usr/libexec/gcc/arc-oe-linux/11.1.1/cc1plus -quiet -v -imultilib hs38_linux -D_GNU_SOURCE test.cc -quiet -dumpbase test.cc -dumpbase-ext .cc -mcpu=hs38_linux -version -o /tmp/ccs
>  GNU C++17 (GCC) version 11.1.1 20210523 (arc-oe-linux)
>          compiled by GNU C version 11.1.1 20210523, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version none
>  GGC heuristics: --param ggc-min-expand=99 --param ggc-min-heapsize=129242
>  ignoring nonexistent directory "/usr/lib/gcc/arc-oe-linux/11.1.1/../../../../include/c++/11.1.1/arc-oe-linux/hs38_linux"
>  ignoring nonexistent directory "/usr/lib/arc-oe-linux/11.1.1/include"
>  ignoring nonexistent directory "/usr/local/include"
>  ignoring nonexistent directory "/usr/lib/gcc/arc-oe-linux/11.1.1/../../../../arc-oe-linux/include"
>  #include "..." search starts here:
>  #include <...> search starts here:
>   /usr/lib/gcc/arc-oe-linux/11.1.1/../../../../include/c++/11.1.1
>   /usr/lib/gcc/arc-oe-linux/11.1.1/../../../../include/c++/11.1.1/backward
>   /usr/lib/gcc/arc-oe-linux/11.1.1/include
>   /usr/lib/gcc/arc-oe-linux/11.1.1/include-fixed
>   /usr/include
>  End of search list.
>  GNU C++17 (GCC) version 11.1.1 20210523 (arc-oe-linux)
>          compiled by GNU C version 11.1.1 20210523, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version none
>  GGC heuristics: --param ggc-min-expand=99 --param ggc-min-heapsize=129242
>  Compiler executable checksum: 6df2f07a822bfbbb80a61414b712b75d
>  In file included from test.cc:1:
>  /usr/include/c++/11.1.1/cstdlib:41:10: fatal error: bits/c++config.h: No such file or directory
>     41 | #include <bits/c++config.h>
>        |          ^~~~~~~~~~~~~~~~~~
>  compilation terminated.
> ------------------>8------------------
>
> Note "ignoring nonexistent directory "/usr/lib/gcc/arc-oe-linux/11.1.1/../../../../include/c++/11.1.1/arc-oe-linux/hs38_linux"
> message which is being used by GCC due to the fact of implicit "-mcpu=hs38_linux".
>
> In fact this header "bits/c++config.h" is located in "/usr/lib/gcc/arc-oe-linux/11.1.1/../../../../include/c++/11.1.1/arc-oe-linux"
> on target.
>
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> ---
>  .../gcc/gcc/0004-64-bit-multilib-hack.patch        | 23 +++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch b/meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch
> index 789f57343b..8184e68743 100644
> --- a/meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch
> +++ b/meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch
> @@ -1,4 +1,4 @@
> -From 28e7c312b1292ca216d4b54ec9f6b7ac055907a8 Mon Sep 17 00:00:00 2001
> +From 2fa5c93641b75a662839c1b6eee172b6c481c70e Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 29 Mar 2013 09:10:06 +0400
>  Subject: [PATCH] 64-bit multilib hack.
> @@ -19,7 +19,7 @@ and be able to patch these entries with a complete set of correct paths but this
>  don't have such code at this point. This is something the target gcc recipe should do
>  and override these platform defaults in its build config.
>
> -Do same for riscv64 and aarch64
> +Do same for riscv64, aarch64 & arc
>
>  RP 15/8/11
>
> @@ -30,11 +30,12 @@ Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
>  Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>  ---
>   gcc/config/aarch64/t-aarch64-linux |  8 ++++----
> + gcc/config/arc/t-multilib-linux    |  4 ++--
>   gcc/config/i386/t-linux64          |  6 ++----
>   gcc/config/mips/t-linux64          | 10 +++-------
>   gcc/config/riscv/t-linux           |  6 ++++--
>   gcc/config/rs6000/t-linux64        |  5 ++---
> - 5 files changed, 15 insertions(+), 20 deletions(-)
> + 6 files changed, 17 insertions(+), 22 deletions(-)
>
>  diff --git a/gcc/config/aarch64/t-aarch64-linux b/gcc/config/aarch64/t-aarch64-linux
>  index 241b0ef20b6..a7dadb2d64f 100644
> @@ -53,6 +54,22 @@ index 241b0ef20b6..a7dadb2d64f 100644
>
>  -MULTILIB_OSDIRNAMES += mabi.ilp32=../libilp32$(call if_multiarch,:aarch64$(AARCH_BE)-linux-gnu_ilp32)
>  +#MULTILIB_OSDIRNAMES += mabi.ilp32=../libilp32$(call if_multiarch,:aarch64$(AARCH_BE)-linux-gnu_ilp32)
> +diff --git a/gcc/config/arc/t-multilib-linux b/gcc/config/arc/t-multilib-linux
> +index fc3fff640a2..d58e28f6df8 100644
> +--- a/gcc/config/arc/t-multilib-linux
> ++++ b/gcc/config/arc/t-multilib-linux
> +@@ -16,9 +16,9 @@
> + # along with GCC; see the file COPYING3.  If not see
> + # <http://www.gnu.org/licenses/>.
> +
> +-MULTILIB_OPTIONS = mcpu=hs/mcpu=archs/mcpu=hs38/mcpu=hs38_linux/mcpu=arc700/mcpu=nps400
> ++#MULTILIB_OPTIONS = mcpu=hs/mcpu=archs/mcpu=hs38/mcpu=hs38_linux/mcpu=arc700/mcpu=nps400
> +
> +-MULTILIB_DIRNAMES = hs archs hs38 hs38_linux arc700 nps400
> ++#MULTILIB_DIRNAMES = hs archs hs38 hs38_linux arc700 nps400
> +
> + # Aliases:
> + MULTILIB_MATCHES += mcpu?arc700=mA7
>  diff --git a/gcc/config/i386/t-linux64 b/gcc/config/i386/t-linux64
>  index d288b093522..7b5980a9d21 100644
>  --- a/gcc/config/i386/t-linux64
> --
> 2.16.2
>
