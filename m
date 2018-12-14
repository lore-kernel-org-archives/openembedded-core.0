Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9BB796B43D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 23:41:08 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id t13so8153147qtn.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 15:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ns5UeNvn+Ax0osSJ+F9k0NaSzLfw0OnR8O54fUSjG2Q=;
	b=WgeYxGcOL9DTyKZv3HiAKPr2KSpucWFZ24RF7Pb3CXdsM1o7c6yuGvTjEui0FebxW/
	5P/dw4i3Q/fegOKWldkZTS3TiF6qkLUx5UApvPz4ULMXM618Wtxl+oIGe/phZ6QGJVsg
	dIZCDGj83cfrS54Kvh41iH/zNkjecpJiXamJsezaDNz9SjbdTMU5dNsbaCGR2sTc36wK
	nLNkUWrDRZ/cUeBouQLD2ErDruNlaUmYZtukQuN0qQ+2H/HQfGEkZa1kIJ15z4bEivRF
	zUyThbMt59UNFZ1EvvkqZKDX542UWazwnAr/DoYeK8Z8+gbubgMyYrmRHBem20oPlwWb
	bE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ns5UeNvn+Ax0osSJ+F9k0NaSzLfw0OnR8O54fUSjG2Q=;
	b=i9hXh50Ff8lHhkU9WJAVNEhrFSSgzQkEou+dcm8zvmHQUPYHgySAa9VrvDIDZlA4XU
	DsVTLbqu51vkS6uTa8LRSXAEBt9X3n8LHVURotx+2i9JT+0SFUdCouhb4YHCpi5VkJDo
	Hq9R68berfzDg1bLI9654x0HBab7SMXBSp9hgz+U4KdUqAAlDiHTrpIOexXKi6BX08FY
	ATImP3x1t5xocfag/q4LHMAMSnNCCQgyZcauolDAj+QiR+vtyz/ElwtrurQ1HE570/Ah
	cXx/ZhEUwIJgSYteoxIYbt9fkfhivC4FqWsw2BSeohdH0AEILjPRgLZEaldBIU9d+Lq3
	RaHQ==
X-Gm-Message-State: AA+aEWZvAcnvYuh0Y6nnz7SkhrWF/UewNL1tKUWNjC87suKae1wov6Dm
	lpP8FVsllR1Oo+TL89h1RjJbYVjyHTsRtMSFfCk=
X-Google-Smtp-Source: AFSGD/VnI5R6Q4YSLobaO0f17yWQGE1nTtvMWDiLUmq4WUzmx/62m26CgSPC1nmLKtcY0oVrBAJVQhW87IFmjVf5RhU=
X-Received: by 2002:a0c:a144:: with SMTP id d62mr4943778qva.50.1544830869281; 
	Fri, 14 Dec 2018 15:41:09 -0800 (PST)
MIME-Version: 1.0
References: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
	<1544810082-22164-7-git-send-email-serhe.popovych@gmail.com>
In-Reply-To: <1544810082-22164-7-git-send-email-serhe.popovych@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Dec 2018 15:40:43 -0800
Message-ID: <CAMKF1sq67e22RCV4jasQsvaUcyzA9DR+oz9UgRPqMwFi48-thg@mail.gmail.com>
To: Serhey Popovych <serhe.popovych@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 06/13] musl: Create default library search path based on configuration
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Dec 2018 23:41:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 14, 2018 at 9:57 AM Serhey Popovych
<serhe.popovych@gmail.com> wrote:
>
> In absence of /etc/ld-musl-$(ARCH).path file musl uses hardcoded default
> search path "/lib:/usr/local/lib:/usr/lib". This works for cases when
> system libraries installed in one of these pathes.
>
> However if lib64 or libx32 used as system library directories and no
> usr merge functionality enabled for distro musl dynamic loader cannot
> find libraries and finally execute binaries.
>
> Found while working on support for musl on powerpc64 builds where
> lib64 variant is used regardless of multilib being on or off.
>
> Fix by creating default search path based on configuration time values
> for syslibdir and libdir.

Lets take this fix to musl upstream at the same time. I think it does
have some value
but if upstream does not agree then we are in for supporting this
forever, and I would like
us to have upstream review on it first.

>
> Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
> ---
>  ...slibdir-and-libdir-as-default-pathes-to-l.patch | 61 ++++++++++++++++++++++
>  meta/recipes-core/musl/musl_git.bb                 |  1 +
>  2 files changed, 62 insertions(+)
>  create mode 100644 meta/recipes-core/musl/musl/0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch
>
> diff --git a/meta/recipes-core/musl/musl/0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch b/meta/recipes-core/musl/musl/0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch
> new file mode 100644
> index 0000000..6a875a7
> --- /dev/null
> +++ b/meta/recipes-core/musl/musl/0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch
> @@ -0,0 +1,61 @@
> +From 5a2886f81dbca3f2ed28eebe7d27d471da278db8 Mon Sep 17 00:00:00 2001
> +From: Serhey Popovych <serhe.popovych@gmail.com>
> +Date: Tue, 11 Dec 2018 05:44:20 -0500
> +Subject: [PATCH] ldso: Use syslibdir and libdir as default pathes to libdirs
> +
> +In absence of /etc/ld-musl-$(ARCH).path ldso uses default path to search
> +libraries /lib:/usr/local/lib:/usr/lib.
> +
> +However this path isn't relevant in case when library is put in dirs
> +like lib64 or libx32.
> +
> +Adjust CFLAGS_ALL to pass syslibdir as SYSLIBDIR and libdir as LIBDIR
> +preprocessor macroses to construct default ldso library search path
> +in ldso/dynlink.c::SYS_PATH_DFLT.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
> +---
> + Makefile       | 3 ++-
> + ldso/dynlink.c | 4 +++-
> + 2 files changed, 5 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index b46f8ca4..c07e4ae8 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -46,7 +46,8 @@ CFLAGS_AUTO = -Os -pipe
> + CFLAGS_C99FSE = -std=c99 -ffreestanding -nostdinc
> +
> + CFLAGS_ALL = $(CFLAGS_C99FSE)
> +-CFLAGS_ALL += -D_XOPEN_SOURCE=700 -I$(srcdir)/arch/$(ARCH) -I$(srcdir)/arch/generic -Iobj/src/internal -I$(srcdir)/src/include -I$(srcdir)/src/internal -Iobj/include -I$(srcdir)/include
> ++CFLAGS_ALL += -D_XOPEN_SOURCE=700 -DSYSLIBDIR='"$(syslibdir)"' -DLIBDIR='"$(libdir)"'
> ++CFLAGS_ALL += -I$(srcdir)/arch/$(ARCH) -I$(srcdir)/arch/generic -Iobj/src/internal -I$(srcdir)/src/include -I$(srcdir)/src/internal -Iobj/include -I$(srcdir)/include
> + CFLAGS_ALL += $(CPPFLAGS) $(CFLAGS_AUTO) $(CFLAGS)
> +
> + LDFLAGS_ALL = $(LDFLAGS_AUTO) $(LDFLAGS)
> +diff --git a/ldso/dynlink.c b/ldso/dynlink.c
> +index ec921dfd..7c119c55 100644
> +--- a/ldso/dynlink.c
> ++++ b/ldso/dynlink.c
> +@@ -22,6 +22,8 @@
> + #include "dynlink.h"
> + #include "malloc_impl.h"
> +
> ++#define SYS_PATH_DFLT SYSLIBDIR ":" LIBDIR
> ++
> + static void error(const char *, ...);
> +
> + #define MAXP2(a,b) (-(-(a)&-(b)))
> +@@ -1038,7 +1040,7 @@ static struct dso *load_library(const char *name, struct dso *needed_by)
> +                                       sys_path = "";
> +                               }
> +                       }
> +-                      if (!sys_path) sys_path = "/lib:/usr/local/lib:/usr/lib";
> ++                      if (!sys_path) sys_path = SYS_PATH_DFLT;
> +                       fd = path_open(name, sys_path, buf, sizeof buf);
> +               }
> +               pathname = buf;
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
> index b416ec4..9cc875c 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -12,6 +12,7 @@ PV = "1.1.20+git${SRCPV}"
>
>  SRC_URI = "git://git.musl-libc.org/musl \
>             file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
> +           file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
>            "
>
>  S = "${WORKDIR}/git"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

