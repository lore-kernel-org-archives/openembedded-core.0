Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com [209.85.221.195])
 by mx.groups.io with SMTP id smtpd.web12.12830.1599892571531099306
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2020 23:36:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hKnjt88a;
 spf=pass (domain: gmail.com, ip: 209.85.221.195, mailfrom: armccurdy@gmail.com)
Received: by mail-vk1-f195.google.com with SMTP id x142so2919749vke.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2020 23:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T4zqLUOtx9EeYPUJ7oknzcqqeXy6Cy92E/HrVvFTFUI=;
        b=hKnjt88apQjzRZKbjpWzneB95xMz51osD1wK+EO/1jIrN1OxPvEPkS+cCVqo9PWqwV
         z+rPH8rDVz+ULD7q0TehsNJGffj7sVLaN/iTmpVxhxqG5JgJIXTZv5c4YXuC65UcPLV0
         8+97eOuVVrJH+6tj9DPcipvBCwxxTwkaUhyAO9A4eNxWQGDASlqdPuUVDGsdvY7Z1YEF
         RyqKhT65UiEXwOwkVNCAhfVPTlMMjYUlpN0XQrh+AzulNO4v6r42ohoFAPI8JLUHsIpU
         IIeS4ee7EN0JNrVEt1g+blAy0jacIivAb5KiYq/QtmXNsHnyfaQhiiqr6UNlMKh6c/TK
         DNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T4zqLUOtx9EeYPUJ7oknzcqqeXy6Cy92E/HrVvFTFUI=;
        b=SeYwFj8joOs9ddmaSQHVSmBeHWmAn8bYjgxGakhWKfkh3WdJM4Dx1KoS0INTjKXZqX
         whjuUNpI6c/+WEY+CVTzDVu+qZOapG0XdUnVPe0OfRPHnwh4C/7X2BNPyaQWv+jQXFDT
         PAX36kkXBTIYx4ur3H/ge8EvibpnBayrm3eLo7+oejN2SzGBdyRCFfuWElbpcbgRWO2v
         NuuZm4Q2Jfq1OXLQzvKgJ7eBPGTDPt3JvaWPHgTF5oTa6d+2X7GTjDXy46rzuCHBLx5b
         tTnBw2kINShsCNv59Hz1jebxdj/wdQs1QUBsWIDS5vSfOzCaKxjOEAztx4IVi+TbAVjg
         IXyQ==
X-Gm-Message-State: AOAM532TOD/erXDD7VfR/WJwTEEuToJO340miVtzzbJTCR17h2x+m+jO
	bpyCuF91FpelNobfZxYFnfnWwwlbKa8tQZH5Rl4=
X-Google-Smtp-Source: ABdhPJwcrD3AtX83fZIF4TbfxsJhkPYcK5t4oXsvYjxn7IIHzo+kzzYgFkoTjoOPg/03ut30q23ihXh4rpgS48zq/R8=
X-Received: by 2002:a1f:a4ce:: with SMTP id n197mr2863835vke.25.1599892570536;
 Fri, 11 Sep 2020 23:36:10 -0700 (PDT)
MIME-Version: 1.0
References: <1599844862-15857-1-git-send-email-pemorrow@linux.microsoft.com>
 <CAJ86T=UPhup8G+e6yt2X9=smV9Y3oMQ=kvZB0K_ivp5ZwKDDCg@mail.gmail.com> <4f31caab-3148-c719-32ae-55d84d4bbf8c@gmail.com>
In-Reply-To: <4f31caab-3148-c719-32ae-55d84d4bbf8c@gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Fri, 11 Sep 2020 23:36:03 -0700
Message-ID: <CAJ86T=WiU9NzRa3Lvmkc1tbTbM+XWXeRFZ94x9U0eXVD+2vd9g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] squashfs-tools: Allow COMP_DEFAULT to be changed easily at build time
To: Khem Raj <raj.khem@gmail.com>
Cc: Peter Morrow <pemorrow@linux.microsoft.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 11, 2020 at 10:04 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 9/11/20 10:33 AM, Andre McCurdy wrote:
> > On Fri, Sep 11, 2020 at 10:21 AM Peter Morrow
> > <pemorrow@linux.microsoft.com> wrote:
> >>
> >> The default compression algorithm is gzip, this patch allows the default
> >> to be changed via a bbappend file by setting SQUASHFS_TOOLS_COMP_DEFAULT
> >> to a valid compression algorithm.
> >>
> >> Signed-off-by: Peter Morrow <pemorrow@linux.microsoft.com>
> >> ---
> >>  ...ols-Allow-COMP_DEFAULT-to-be-overridden-v.patch | 34 ++++++++++++++++++++++
> >>  .../squashfs-tools/squashfs-tools_git.bb           |  4 +++
> >>  2 files changed, 38 insertions(+)
> >>  create mode 100644 meta/recipes-devtools/squashfs-tools/files/0001-squashfs-tools-Allow-COMP_DEFAULT-to-be-overridden-v.patch
> >>
> >> diff --git a/meta/recipes-devtools/squashfs-tools/files/0001-squashfs-tools-Allow-COMP_DEFAULT-to-be-overridden-v.patch b/meta/recipes-devtools/squashfs-tools/files/0001-squashfs-tools-Allow-COMP_DEFAULT-to-be-overridden-v.patch
> >> new file mode 100644
> >> index 0000000..5f12c42
> >> --- /dev/null
> >> +++ b/meta/recipes-devtools/squashfs-tools/files/0001-squashfs-tools-Allow-COMP_DEFAULT-to-be-overridden-v.patch
> >> @@ -0,0 +1,34 @@
> >> +From d2d9b517696f5950597f5b60ae8fdade5b7c14a9 Mon Sep 17 00:00:00 2001
> >> +From: Peter Morrow <pemorrow@linux.microsoft.com>
> >> +Date: Fri, 4 Sep 2020 15:43:15 +0100
> >> +Subject: [PATCH] squashfs-tools: Allow COMP_DEFAULT to be overridden via make
> >> + cmdline
> >> +
> >> +Currently the only way to modify the default compression algorithm is to
> >> +modify the Makefile. It is useful to be able to set the default compression
> >> +algorithm via the make command line since otherwise a build time search
> >> +replace operation needs to be performed on the Makefile.
> >
> > That's not how Makefiles normally work. Options set via the command
> > line over-ride variables set with = in the Makefile.
> >
> > Does setting your chosen value for COMP_DEFAULT on the make command
> > line really not work?
>
> that works if make is invoked with -e option, We do not use make -e with
> bare makefile based recipes.

The -e option is related to environment variables. It's not relevant
for this discussion - which is about setting options via the make
command line.

> >> +Upstream-Status: Submitted [https://github.com/plougher/squashfs-tools/pull/93 ]
> >> +
> >> +Signed-off-by: Peter Morrow <pemorrow@linux.microsoft.com>
> >> +---
> >> + squashfs-tools/Makefile | 2 +-
> >> + 1 file changed, 1 insertion(+), 1 deletion(-)
> >> +
> >> +diff --git a/squashfs-tools/Makefile b/squashfs-tools/Makefile
> >> +index aee4b96..7425605 100644
> >> +--- a/squashfs-tools/Makefile
> >> ++++ b/squashfs-tools/Makefile
> >> +@@ -85,7 +85,7 @@ GZIP_SUPPORT = 1
> >> + # in Mksquashfs.  Obviously the compression algorithm must have been
> >> + # selected to be built
> >> + #
> >> +-COMP_DEFAULT = gzip
> >> ++COMP_DEFAULT ?= gzip
> >> +
> >> +
> >> + ###############################################
> >> +--
> >> +2.20.1
> >> +
> >> diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
> >> index b06951d..df025d4 100644
> >> --- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
> >> +++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
> >> @@ -9,6 +9,7 @@ PV = "4.4"
> >>  SRCREV = "52eb4c279cd283ed9802dd1ceb686560b22ffb67"
> >>  SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https \
> >>             file://0001-squashfs-tools-fix-build-failure-against-gcc-10.patch;striplevel=2 \
> >> +           file://0001-squashfs-tools-Allow-COMP_DEFAULT-to-be-overridden-v.patch;striplevel=2 \
> >>  "
> >>
> >>  S = "${WORKDIR}/git/squashfs-tools"
> >> @@ -25,6 +26,9 @@ PACKAGECONFIG[xattr] = "XATTR_SUPPORT=1,XATTR_SUPPORT=0,attr"
> >>  PACKAGECONFIG[zstd] = "ZSTD_SUPPORT=1,ZSTD_SUPPORT=0,zstd"
> >>  PACKAGECONFIG[reproducible] = "REPRODUCIBLE_DEFAULT=1,REPRODUCIBLE_DEFAULT=0,"
> >>
> >> +SQUASHFS_TOOLS_COMP_DEFAULT ?= "gzip"
> >> +EXTRA_OEMAKE += "COMP_DEFAULT=${SQUASHFS_TOOLS_COMP_DEFAULT}"
> >
> > Note that this will force the recipe's default value even if upstream
> > squashfs-tools changes. Not a problem now as the two are the same, but
> > something which will need to be checked each time squashfs-tools is
> > updated.
> >
> >>  do_compile() {
> >>         oe_runmake all
> >>  }
> >> --
> >> 1.8.3.1
> >>
> >>
> >>
> >> 
