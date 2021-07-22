Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.182.1626988635738994972
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 14:17:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=ZvnAfSg2;
 spf=pass (domain: burtonini.com, ip: 209.85.221.51, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f51.google.com with SMTP id w12so95564wro.13
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 14:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U4XmGaILJuqubt4VbS5+44kj+n0m13TXvzf9XqPXUeY=;
        b=ZvnAfSg2eZohKl8D0k3wMFZDQeAM0TUmhZpu4+lQLyZZ6BZfbIAU/Vbmpdi9TBPRJf
         aNi/mqoMlbxP0n6NUCBbK2NO+xcqi6exLdQKyivVJadh2Qiyql8ap2JAR0OZ3aN5g7hb
         yA5WhS/F04S1EFdSGab3Xk8NhCUlrHI4RPQW7OaJQMqm1MZ4B55JYcwAtlVdx8f7j7BU
         N34tqxKjfg/AZWO1ermcPX+UbizrXzPdK3Rtmcu0J5r35HymqsV0DlG9CaCQfe8f8PBk
         nbqIe0JIsuxqQhWSmPklBHuKfltM2WGblvP+PcpAZXG6hjMKqxDx/N1QQWXNNON2tlxf
         CPhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U4XmGaILJuqubt4VbS5+44kj+n0m13TXvzf9XqPXUeY=;
        b=WCHBuU8zeu/uLKGbnBiVuAA8Dj7d/jt1EqEy2aktmRmfioQJOMMAQ52x1lZ9nBhBqe
         tJrtizcqmjdwdC+nHdQmbqCA9ZUF9jziydu+CM80FgfXCB+2XaghwxsgZbu6TWT2ZQT4
         jUopB1zWoAtMbfWMIVUfiSl5lUUC0CHxpCzpXhYw6fdlILK8kD2lW9crfx7XAFmqe1wR
         7BLRUHvMHl6IVJGnqoTnqzsBqzr8BRSsQzvbWRcV2iD6zUXYK8ubaUe2bz4k9pYOG4QV
         L2t0P2/Tx2Y9VBhYef3hv/IXR54nli69iJkZrGonSuIRswHmrWpGGF8Sr/lQwvpezeVl
         MGdg==
X-Gm-Message-State: AOAM532lVkKKdBVFUmbpxBZim+OiLag7xakOr/ymey/vhUgtZK3A+vhj
	Xd7y0EruUOGQ+yONHHMgLYXeoaEwV+OXj0PSRk/y2Q==
X-Google-Smtp-Source: ABdhPJwIQbbiAJKrO3e+Pnl3JjRpw8B5XEsNWLbosMxLTV+U/aFi35q1nvmeaYRWJa5A2ikyDVK4tFwUK7VYDJRUrdU=
X-Received: by 2002:a05:6000:1141:: with SMTP id d1mr1963173wrx.396.1626988634261;
 Thu, 22 Jul 2021 14:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210722153916.2550020-1-ross.burton@arm.com> <CAMKF1sruKHkmOd8E2=hrESYO8gwb_fR3K8F5rxO-bQOnLy7a2Q@mail.gmail.com>
In-Reply-To: <CAMKF1sruKHkmOd8E2=hrESYO8gwb_fR3K8F5rxO-bQOnLy7a2Q@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 22 Jul 2021 22:17:03 +0100
Message-ID: <CAAnfSTtFVX-0n0d1dRp9BG3RYnfqrFh4SnZBLm0tzkAA==TRRA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glew: fix Makefile race
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Classic Makefile anti-pattern of just fundamentally not understanding
how parallel jobs work.  One day, people will stop using Make :)

Ross

On Thu, 22 Jul 2021 at 20:27, Khem Raj <raj.khem@gmail.com> wrote:
>
> ah thanks I think binutils upgrade patch was also seeing this problem.
>
> On Thu, Jul 22, 2021 at 8:39 AM Ross Burton <ross@burtonini.com> wrote:
> >
> > Fix a Makefile race resulting in the target creating a directory being
> > executed after the target to write into that directory.
> >
> > [ YOCTO #14485 ]
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  .../0001-Fix-build-race-in-Makefile.patch     | 56 +++++++++++++++++++
> >  meta/recipes-graphics/glew/glew_2.2.0.bb      |  1 +
> >  2 files changed, 57 insertions(+)
> >  create mode 100644 meta/recipes-graphics/glew/glew/0001-Fix-build-race-in-Makefile.patch
> >
> > diff --git a/meta/recipes-graphics/glew/glew/0001-Fix-build-race-in-Makefile.patch b/meta/recipes-graphics/glew/glew/0001-Fix-build-race-in-Makefile.patch
> > new file mode 100644
> > index 0000000000..7edcfe8de8
> > --- /dev/null
> > +++ b/meta/recipes-graphics/glew/glew/0001-Fix-build-race-in-Makefile.patch
> > @@ -0,0 +1,56 @@
> > +Upstream-Status: Submitted [https://github.com/nigels-com/glew/pull/311]
> > +Signed-off-by: Ross Burton <ross.burton@arm.com>
> > +
> > +From 0ce0a85597db48a2fca619bd95e34af091e54ae8 Mon Sep 17 00:00:00 2001
> > +From: Ross Burton <ross.burton@arm.com>
> > +Date: Thu, 22 Jul 2021 16:31:11 +0100
> > +Subject: [PATCH] Fix build race in Makefile
> > +
> > +The current rule for the binaries is:
> > +
> > +glew.bin: glew.lib bin bin/$(GLEWINFO.BIN) bin/$(VISUALINFO.BIN)
> > +
> > +In parallel builds, all of those targets happen at the same time. This
> > +means that 'bin' can happen *after* 'bin/$(GLEWINFO.BIN)', which is a
> > +problem as the 'bin' target's responsibility is to create the directory
> > +that the other target writes into.
> > +
> > +Solve this by not having a separate 'create directory' target which is
> > +fundamentally racy, and simply mkdir in each target which writes into it.
> > +---
> > + Makefile | 9 ++++-----
> > + 1 file changed, 4 insertions(+), 5 deletions(-)
> > +
> > +diff --git a/Makefile b/Makefile
> > +index d0e4614..04af44c 100644
> > +--- a/Makefile
> > ++++ b/Makefile
> > +@@ -171,21 +171,20 @@ VISUALINFO.BIN.OBJ := $(VISUALINFO.BIN.OBJ:.c=.o)
> > + # Don't build glewinfo or visualinfo for NaCL, yet.
> > +
> > + ifneq ($(filter nacl%,$(SYSTEM)),)
> > +-glew.bin: glew.lib bin
> > ++glew.bin: glew.lib
> > + else
> > +-glew.bin: glew.lib bin bin/$(GLEWINFO.BIN) bin/$(VISUALINFO.BIN)
> > ++glew.bin: glew.lib bin/$(GLEWINFO.BIN) bin/$(VISUALINFO.BIN)
> > + endif
> > +
> > +-bin:
> > +-      mkdir bin
> > +-
> > + bin/$(GLEWINFO.BIN): $(GLEWINFO.BIN.OBJ) $(LIB.SHARED.DIR)/$(LIB.SHARED)
> > ++      @mkdir -p $(dir $@)
> > +       $(CC) $(CFLAGS) -o $@ $(GLEWINFO.BIN.OBJ) $(BIN.LIBS)
> > + ifneq ($(STRIP),)
> > +       $(STRIP) -x $@
> > + endif
> > +
> > + bin/$(VISUALINFO.BIN): $(VISUALINFO.BIN.OBJ) $(LIB.SHARED.DIR)/$(LIB.SHARED)
> > ++      @mkdir -p $(dir $@)
> > +       $(CC) $(CFLAGS) -o $@ $(VISUALINFO.BIN.OBJ) $(BIN.LIBS)
> > + ifneq ($(STRIP),)
> > +       $(STRIP) -x $@
> > +--
> > +2.25.1
> > +
> > diff --git a/meta/recipes-graphics/glew/glew_2.2.0.bb b/meta/recipes-graphics/glew/glew_2.2.0.bb
> > index 8948444e08..92b6083648 100644
> > --- a/meta/recipes-graphics/glew/glew_2.2.0.bb
> > +++ b/meta/recipes-graphics/glew/glew_2.2.0.bb
> > @@ -6,6 +6,7 @@ LICENSE = "MIT"
> >  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ac251558de685c6b9478d89be3149c2"
> >
> >  SRC_URI = "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tgz \
> > +           file://0001-Fix-build-race-in-Makefile.patch \
> >             file://no-strip.patch"
> >
> >  SRC_URI[md5sum] = "3579164bccaef09e36c0af7f4fd5c7c7"
> > --
> > 2.25.1
> >
> >
> > 
> >
