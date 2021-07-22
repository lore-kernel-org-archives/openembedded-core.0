Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.2038.1626982062185618758
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 12:27:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h62r6yc+;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id k13so81381qth.10
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 12:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6fkDB/bPDNbd0TCgocw45dfy/pze2i1bgeHFE/wsAqk=;
        b=h62r6yc+qCkr9+4aO9iwMK55c58ZX+E72REsLImenJIC4PvZ5MXw/Fk1Xlhb9pJcI3
         DmPZOumCNJqFkWgB60SjBOj5eNyKuiUhU4xVZBgn+yJBK3p61H7IMQyWYBjSdxVaWM9W
         G2OjIc51Gj5QFaV6WM6TD8nZ5mLY9d83fkHtFHkZKny3fUXkEB9uXn7s+JMMWlSSDMjb
         zeweRSm8tEdItsvo34LsD4qHVhMQOsDFxnbBcxhElwNCqwjmQV+SBuQLz4Pl2X9bndOr
         xutZTCTz61MDrXXLwA3LTY4e0ZFLbu0iFQEJ5LdJb2pQGss7Y0QUJV5SAZ4Bu38cf1vv
         Rntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6fkDB/bPDNbd0TCgocw45dfy/pze2i1bgeHFE/wsAqk=;
        b=LP4P447UzP/21TtkSyXBL0VLDAMmISXI9yIpI0jrMHi1i8kwFffC2obBjLj5kkvM4c
         jyO/BSK3zmaq30KmOR0gP1rT9+B/0SKyGoOI68MnedbeX2SA+jZ9AQBVo74ImwFEFCBk
         nS0X2vOn11dEg51zxbbo/pF4wngfUmgOQ+rqZOREESkGlzFJ71P46Df3Fpo/e7Dln4Xd
         jH1VqfqB1VoHGKpiEFR0kDcwphPRf+vCmh5TRzrpnoMimsc6kuHu9wutrzvnCeSCIOfa
         5ZMWINP9POjozoYn69NCmYKdnCb00+czzNULbHpBniSdpcfPVGoxlOPnvZyt+oPKC2/O
         4F0Q==
X-Gm-Message-State: AOAM5300D+Aj4M3jpOTL+PbIa3TLvQInMY+W0YzGYVqZrsL++KxAXEkM
	NwVY0Qop4cgFrWCbqVswOqtn7LsdigHXg46lduU=
X-Google-Smtp-Source: ABdhPJyRBMNnVEYE0WREH11yD+DzUJg4Koe4loHGVPifIr0JL+MWm2WoWOLTL7Y8X8Kde4fGH/46EuZWfdqCPJpGU/A=
X-Received: by 2002:ac8:1499:: with SMTP id l25mr1101421qtj.82.1626982061279;
 Thu, 22 Jul 2021 12:27:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210722153916.2550020-1-ross.burton@arm.com>
In-Reply-To: <20210722153916.2550020-1-ross.burton@arm.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 22 Jul 2021 12:27:15 -0700
Message-ID: <CAMKF1sruKHkmOd8E2=hrESYO8gwb_fR3K8F5rxO-bQOnLy7a2Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glew: fix Makefile race
To: Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

ah thanks I think binutils upgrade patch was also seeing this problem.

On Thu, Jul 22, 2021 at 8:39 AM Ross Burton <ross@burtonini.com> wrote:
>
> Fix a Makefile race resulting in the target creating a directory being
> executed after the target to write into that directory.
>
> [ YOCTO #14485 ]
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../0001-Fix-build-race-in-Makefile.patch     | 56 +++++++++++++++++++
>  meta/recipes-graphics/glew/glew_2.2.0.bb      |  1 +
>  2 files changed, 57 insertions(+)
>  create mode 100644 meta/recipes-graphics/glew/glew/0001-Fix-build-race-in-Makefile.patch
>
> diff --git a/meta/recipes-graphics/glew/glew/0001-Fix-build-race-in-Makefile.patch b/meta/recipes-graphics/glew/glew/0001-Fix-build-race-in-Makefile.patch
> new file mode 100644
> index 0000000000..7edcfe8de8
> --- /dev/null
> +++ b/meta/recipes-graphics/glew/glew/0001-Fix-build-race-in-Makefile.patch
> @@ -0,0 +1,56 @@
> +Upstream-Status: Submitted [https://github.com/nigels-com/glew/pull/311]
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +From 0ce0a85597db48a2fca619bd95e34af091e54ae8 Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@arm.com>
> +Date: Thu, 22 Jul 2021 16:31:11 +0100
> +Subject: [PATCH] Fix build race in Makefile
> +
> +The current rule for the binaries is:
> +
> +glew.bin: glew.lib bin bin/$(GLEWINFO.BIN) bin/$(VISUALINFO.BIN)
> +
> +In parallel builds, all of those targets happen at the same time. This
> +means that 'bin' can happen *after* 'bin/$(GLEWINFO.BIN)', which is a
> +problem as the 'bin' target's responsibility is to create the directory
> +that the other target writes into.
> +
> +Solve this by not having a separate 'create directory' target which is
> +fundamentally racy, and simply mkdir in each target which writes into it.
> +---
> + Makefile | 9 ++++-----
> + 1 file changed, 4 insertions(+), 5 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index d0e4614..04af44c 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -171,21 +171,20 @@ VISUALINFO.BIN.OBJ := $(VISUALINFO.BIN.OBJ:.c=.o)
> + # Don't build glewinfo or visualinfo for NaCL, yet.
> +
> + ifneq ($(filter nacl%,$(SYSTEM)),)
> +-glew.bin: glew.lib bin
> ++glew.bin: glew.lib
> + else
> +-glew.bin: glew.lib bin bin/$(GLEWINFO.BIN) bin/$(VISUALINFO.BIN)
> ++glew.bin: glew.lib bin/$(GLEWINFO.BIN) bin/$(VISUALINFO.BIN)
> + endif
> +
> +-bin:
> +-      mkdir bin
> +-
> + bin/$(GLEWINFO.BIN): $(GLEWINFO.BIN.OBJ) $(LIB.SHARED.DIR)/$(LIB.SHARED)
> ++      @mkdir -p $(dir $@)
> +       $(CC) $(CFLAGS) -o $@ $(GLEWINFO.BIN.OBJ) $(BIN.LIBS)
> + ifneq ($(STRIP),)
> +       $(STRIP) -x $@
> + endif
> +
> + bin/$(VISUALINFO.BIN): $(VISUALINFO.BIN.OBJ) $(LIB.SHARED.DIR)/$(LIB.SHARED)
> ++      @mkdir -p $(dir $@)
> +       $(CC) $(CFLAGS) -o $@ $(VISUALINFO.BIN.OBJ) $(BIN.LIBS)
> + ifneq ($(STRIP),)
> +       $(STRIP) -x $@
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-graphics/glew/glew_2.2.0.bb b/meta/recipes-graphics/glew/glew_2.2.0.bb
> index 8948444e08..92b6083648 100644
> --- a/meta/recipes-graphics/glew/glew_2.2.0.bb
> +++ b/meta/recipes-graphics/glew/glew_2.2.0.bb
> @@ -6,6 +6,7 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ac251558de685c6b9478d89be3149c2"
>
>  SRC_URI = "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tgz \
> +           file://0001-Fix-build-race-in-Makefile.patch \
>             file://no-strip.patch"
>
>  SRC_URI[md5sum] = "3579164bccaef09e36c0af7f4fd5c7c7"
> --
> 2.25.1
>
>
> 
>
