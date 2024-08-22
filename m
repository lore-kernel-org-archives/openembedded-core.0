Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A24A8C3DA4A
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 11:05:32 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.10894.1724324731584736784
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 04:05:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YX6BEGOp;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53349d3071eso846575e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 04:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724324730; x=1724929530; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T4nW82N1UW35YUYz6KTxz49dWVAuvKphCJVH2rZRb4k=;
        b=YX6BEGOp3s5OGXLnw9zlVQgYW+wN3meXwTBi1K9GnwzNfUfN8YSrrdi57PHSy/dcMT
         aarmjcNCo9qPZHABPKHWdGa3EX7JnRPIInvwoThZh4bQot+49Oc/Hq3yqmmWVxEXcWTS
         Hz+2mFTXEXKUTzOnDbPcnKmhP7kRHRgj49aDPlgxzx87BCGcZy04ig2j9B5Af/deO4/j
         FhiGwqXBWg+Oe8sVibIy3tO92JDRvqDQmhlKrWYP/KyI1Iqu8/AdvpRIbSn+X1Ig18Q7
         sMAicN4O2Jp+DJOsLhEHrabeMxL90UeB2VjDvFu/gLfZlMDrJ88KZskniXGAk74l0Qm1
         Sq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724324730; x=1724929530;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T4nW82N1UW35YUYz6KTxz49dWVAuvKphCJVH2rZRb4k=;
        b=C5wzfDe1+2GbBFRK3Pcxaa72znx3SlgaMN3l3XS1BPnIGiP7CbjoT5bieNhlerQggM
         flCcZHvqTuz2oeu+cYglgaMEuxs/ofFTNGLQnB1QJMO8fuObsYveMp/3RsZ1kzzzRVT3
         90Hod4Ws69oQepcdqWrpgQuHGPSgb9ag3sBOeICuHb5RYMFMAvmCT7cb354y6aNVyEdS
         FHJgReD6rnr6l/tOEH+2IL7PNU1Lcv6yjt/HJx2tT8eKxiO91CPuE83h2bCKvkj29BPW
         S6bze95Ijh9XclVhbwisw0L3NMh9+qohZbnrIOnL+YGh+VHbxRYroohxKdWlWWS31J1V
         13BQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsmObZSGW5lo+gsxxBKsIHFOBUE5KJafufvPbjA+A1qvQjnd7DM82G0anFbZzKfiCb/ZAqs7JKRLt8V9cAZMcs2A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyd0fAeHVc0JlvWVGBBsNY1pZ7ZFN5iHodMHuDfBGtqkETYl8GP
	jPgdkUdz0wqYi5WY2QDXpcf6lcNEatZqNQ7SrgK80dSiIJ7i19ntvGQChpoBd3McTCibaXgNSWK
	HPfeG8H+B7W5piohJkuzmeziV+DQ=
X-Google-Smtp-Source: AGHT+IENzRn3HbIYU0yYwoUfC7BDYvQnQV6qblw+pz0EYhwKdXd4a6DLXAilmqLXP07Gf7A8K6QSXju7zWyXRzsiQ8o=
X-Received: by 2002:ac2:4c46:0:b0:52e:9b92:4990 with SMTP id
 2adb3069b0e04-53348562455mr3489773e87.32.1724324729027; Thu, 22 Aug 2024
 04:05:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240818093913.43520-1-mr.name@web.de> <202408221102453aaf2ba8@mail.local>
In-Reply-To: <202408221102453aaf2ba8@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 22 Aug 2024 13:05:17 +0200
Message-ID: <CANNYZj8=0qhV9s+RBU6FpDja2XNoBWRhkZprCfRSwFzG+JPWTQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sysvinit: upgrade 3.04 -> 3.10
To: mr.name@web.de
Cc: alexandre.belloni@bootlin.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 11:05:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203653

Also please rebase on top of my sysvinit source adjustment patch (was
just sent here today).

Alex

On Thu, 22 Aug 2024 at 13:02, Alexandre Belloni via
lists.openembedded.org
<alexandre.belloni=bootlin.com@lists.openembedded.org> wrote:
>
> Hello,
>
> I'm sorry but I've tried multiple times to apply this patch but it
> doesn't apply cleanly and I can't fix it. Maybe you can put it on a
> branch somewhere?
>
> On 18/08/2024 11:39:13+0200, Sven Reschke via lists.openembedded.org wrote:
> > Upgrade       of sysvinit to version 3.10. The upstream moved in between to github.
> > Removed       the following patches:
> > 1. 0001-hddown-include-libgen.h-for-basename-API.patch
> >   Is already included in upstream
> > 2. install.patch
> >   Referenced PR is already merged in upstream
> > 3. sysvinit_remove_linux_fs.patch
> >   Is already included in upstream
> >
> > The remaining patches were mostly just updated, with exception to the realpath.patch
> > Here the changes to the killall5.c source file couldn't be merged anymore.
> > My guess is, that the changes are already done someway in the upstream.
> > At least the file is now using realpath(). I didn't touch the remaining additional includes,
> > as I don't know if they are still needed.
> >
> > Signed-off-by: Sven Reschke <mr.name@web.de>
> > ---
> >  ...wn-include-libgen.h-for-basename-API.patch | 38 --------
> >  ...acros.h-for-major-minor-defines-in-g.patch |  6 +-
> >  .../sysvinit/sysvinit/crypt-lib.patch         |  6 +-
> >  .../sysvinit/sysvinit/install.patch           | 97 -------------------
> >  .../sysvinit/pidof-add-m-option.patch         | 24 ++---
> >  .../sysvinit/sysvinit/realpath.patch          | 23 +----
> >  .../sysvinit/sysvinit_remove_linux_fs.patch   | 17 ----
> >  .../{sysvinit_3.04.bb => sysvinit_3.10.bb}    |  7 +-
> >  8 files changed, 23 insertions(+), 195 deletions(-)
> >  delete mode 100644 meta/recipes-core/sysvinit/sysvinit/0001-hddown-include-libgen.h-for-basename-API.patch
> >  delete mode 100644 meta/recipes-core/sysvinit/sysvinit/install.patch
> >  delete mode 100644 meta/recipes-core/sysvinit/sysvinit/sysvinit_remove_linux_fs.patch
> >  rename meta/recipes-core/sysvinit/{sysvinit_3.04.bb => sysvinit_3.10.bb} (93%)
> >
> > diff --git a/meta/recipes-core/sysvinit/sysvinit/0001-hddown-include-libgen.h-for-basename-API.patch b/meta/recipes-core/sysvinit/sysvinit/0001-hddown-include-libgen.h-for-basename-API.patch
> > deleted file mode 100644
> > index 5e4053bad1..0000000000
> > --- a/meta/recipes-core/sysvinit/sysvinit/0001-hddown-include-libgen.h-for-basename-API.patch
> > +++ /dev/null
> > @@ -1,38 +0,0 @@
> > -From a07c1d94e79840c59563741b45e690e77d4f3dfa Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Sun, 3 Dec 2023 20:09:30 -0800
> > -Subject: [PATCH] hddown: include libgen.h for basename API
> > -
> > -musl has removed the non-prototype declaration of basename from string.h [1] which now results in build errors with clang-17+ compiler
> > -
> > -include libgen.h for using the posix declaration of the funciton.
> > -
> > -Fixes
> > -
> > -hddown.c:135:8: error: incompatible integer to pointer conversion assigning to 'char *' from 'int' [-Wint-conversion]
> > -  135 |                         ptr = basename(lnk);
> > -      |                             ^ ~~~~~~~~~~~~~
> > -
> > -[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
> > -
> > -Upstream-Status: Submitted [https://github.com/slicer69/sysvinit/pull/21]
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > - src/hddown.c | 1 +
> > - 1 file changed, 1 insertion(+)
> > -
> > -diff --git a/src/hddown.c b/src/hddown.c
> > -index 7a2cf28..3b31bc0 100644
> > ---- a/src/hddown.c
> > -+++ b/src/hddown.c
> > -@@ -24,6 +24,7 @@ char *v_hddown = "@(#)hddown.c  1.02  22-Apr-2003  miquels@cistron.nl";
> > - #ifndef _GNU_SOURCE
> > - #define _GNU_SOURCE
> > - #endif
> > -+#include <libgen.h>
> > - #include <stdio.h>
> > - #include <stdlib.h>
> > - #include <unistd.h>
> > ---
> > -2.43.0
> > -
> > diff --git a/meta/recipes-core/sysvinit/sysvinit/0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch b/meta/recipes-core/sysvinit/sysvinit/0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch
> > index 60fbd87534..2c29fd81d9 100644
> > --- a/meta/recipes-core/sysvinit/sysvinit/0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch
> > +++ b/meta/recipes-core/sysvinit/sysvinit/0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch
> > @@ -13,7 +13,7 @@ Upstream-Status: Pending
> >   3 files changed, 3 insertions(+)
> >
> >  diff --git a/src/bootlogd.c b/src/bootlogd.c
> > -index 787db87..8b07903 100644
> > +index a323a76..343cbbe 100644
> >  --- a/src/bootlogd.c
> >  +++ b/src/bootlogd.c
> >  @@ -29,6 +29,7 @@
> > @@ -25,7 +25,7 @@ index 787db87..8b07903 100644
> >   #include <sys/utsname.h>
> >   #include <time.h>
> >  diff --git a/src/mountpoint.c b/src/mountpoint.c
> > -index 5f20522..94df7a1 100644
> > +index c55b0df..5920e13 100644
> >  --- a/src/mountpoint.c
> >  +++ b/src/mountpoint.c
> >  @@ -25,6 +25,7 @@
> > @@ -37,7 +37,7 @@ index 5f20522..94df7a1 100644
> >   #include <stdlib.h>
> >   #include <string.h>
> >  diff --git a/src/shutdown.c b/src/shutdown.c
> > -index b744a2c..40b7faf 100644
> > +index 89b63a5..7730e53 100644
> >  --- a/src/shutdown.c
> >  +++ b/src/shutdown.c
> >  @@ -40,6 +40,7 @@
> > diff --git a/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch b/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch
> > index 5c39fb001b..cc3df8887b 100644
> > --- a/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch
> > +++ b/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch
> > @@ -15,11 +15,11 @@ Upstream-Status: Inappropriate [configuration]
> >   1 file changed, 2 insertions(+), 9 deletions(-)
> >
> >  diff --git a/src/Makefile b/src/Makefile
> > -index 5b1a5a2..b686394 100644
> > +index 21cbb2e..a2c103c 100644
> >  --- a/src/Makefile
> >  +++ b/src/Makefile
> > -@@ -97,15 +97,8 @@ else
> > - endif
> > +@@ -95,15 +95,8 @@ endif
> > + ROOT        ?= $(DESTDIR)
> >
> >   # Additional libs for GNU libc.
> >  -ifneq ($(wildcard $(ROOT)/usr/lib*/libcrypt.*),)
> > diff --git a/meta/recipes-core/sysvinit/sysvinit/install.patch b/meta/recipes-core/sysvinit/sysvinit/install.patch
> > deleted file mode 100644
> > index bc6d493c2b..0000000000
> > --- a/meta/recipes-core/sysvinit/sysvinit/install.patch
> > +++ /dev/null
> > @@ -1,97 +0,0 @@
> > -From 5e35aa105e7a2e85db2a89fee4114090b1ac55be Mon Sep 17 00:00:00 2001
> > -From: Qing He <qing.he@intel.com>
> > -Date: Fri, 18 Jun 2010 09:40:30 +0800
> > -Subject: [PATCH] sysvinit: upgrade to version 2.88dsf
> > -
> > -Upstream-Status: Submitted [https://github.com/slicer69/sysvinit/pull/13]
> > -
> > ----
> > - src/Makefile | 53 +++++++++++++++++++++++++++++-----------------------
> > - 1 file changed, 30 insertions(+), 23 deletions(-)
> > -
> > -diff --git a/src/Makefile b/src/Makefile
> > -index 1b368dc..5b1a5a2 100644
> > ---- a/src/Makefile
> > -+++ b/src/Makefile
> > -@@ -77,7 +77,14 @@ else
> > -   INSTALL_DATA      = install -m 644
> > - endif
> > - INSTALL_DIR = install -m 755 -d
> > --MANDIR              = /usr/share/man
> > -+
> > -+ROOT         ?=
> > -+base_bindir  ?= /bin
> > -+base_sbindir ?= /sbin
> > -+bindir       ?= /usr/bin
> > -+sysconfdir   ?= /etc
> > -+includedir   ?= /usr/include
> > -+mandir       ?= /usr/share/man
> > -
> > - ifeq ($(WITH_SELINUX),yes)
> > -   SELINUX_DEF       =  -DWITH_SELINUX
> > -@@ -191,43 +198,43 @@ clobber:       cleanobjs
> > - distclean:  clobber
> > -
> > - install:    all
> > --            $(INSTALL_DIR) $(ROOT)/bin/ $(ROOT)/sbin/
> > --            $(INSTALL_DIR) $(ROOT)/usr/bin/
> > -+            $(INSTALL_DIR) $(ROOT)$(base_bindir)/ $(ROOT)$(base_sbindir)/
> > -+            $(INSTALL_DIR) $(ROOT)$(bindir)/
> > -             for i in $(BIN); do \
> > --                    $(INSTALL_EXEC) $$i $(ROOT)/bin/ ; \
> > -+                    $(INSTALL_EXEC) $$i $(ROOT)$(base_bindir)/ ; \
> > -             done
> > -             for i in $(SBIN); do \
> > --                    $(INSTALL_EXEC) $$i $(ROOT)/sbin/ ; \
> > -+                    $(INSTALL_EXEC) $$i $(ROOT)$(base_sbindir)/ ; \
> > -             done
> > -             for i in $(USRBIN); do \
> > --                    $(INSTALL_EXEC) $$i $(ROOT)/usr/bin/ ; \
> > -+                    $(INSTALL_EXEC) $$i $(ROOT)$(bindir)/ ; \
> > -             done
> > -             # $(INSTALL_DIR) $(ROOT)/etc/
> > -             $(INSTALL_DIR) $(ROOT)/etc/inittab.d
> > -             # $(INSTALL_EXEC) ../doc/initscript.sample $(ROOT)/etc/
> > --            ln -sf halt $(ROOT)/sbin/reboot
> > --            ln -sf halt $(ROOT)/sbin/poweroff
> > --            ln -sf init $(ROOT)/sbin/telinit
> > --            ln -sf /sbin/killall5 $(ROOT)/bin/pidof
> > --            if [ ! -f $(ROOT)/usr/bin/lastb ]; then \
> > --                    ln -sf last $(ROOT)/usr/bin/lastb; \
> > -+            ln -sf halt $(ROOT)$(base_sbindir)/reboot
> > -+            ln -sf halt $(ROOT)$(base_sbindir)/poweroff
> > -+            ln -sf init $(ROOT)$(base_sbindir)/telinit
> > -+            ln -sf $(base_sbindir)/killall5 $(ROOT)$(base_bindir)/pidof
> > -+            if [ ! -f $(ROOT)$(bindir)/lastb ]; then \
> > -+                    ln -sf last $(ROOT)$(bindir)/lastb; \
> > -             fi
> > --            $(INSTALL_DIR) $(ROOT)/usr/include/
> > --            $(INSTALL_DATA) initreq.h $(ROOT)/usr/include/
> > --            $(INSTALL_DIR) $(ROOT)$(MANDIR)/man1/
> > --            $(INSTALL_DIR) $(ROOT)$(MANDIR)/man5/
> > --            $(INSTALL_DIR) $(ROOT)$(MANDIR)/man8/
> > -+            $(INSTALL_DIR) $(ROOT)$(includedir)/
> > -+            $(INSTALL_DATA) initreq.h $(ROOT)$(includedir)/
> > -+            $(INSTALL_DIR) $(ROOT)$(mandir)/man1/
> > -+            $(INSTALL_DIR) $(ROOT)$(mandir)/man5/
> > -+            $(INSTALL_DIR) $(ROOT)$(mandir)/man8/
> > -             for man in $(MAN1); do \
> > --                    $(INSTALL_DATA) ../man/$$man $(ROOT)$(MANDIR)/man1/; \
> > --                    sed -i "1{ $(MANDB); }" $(ROOT)$(MANDIR)/man1/$$man ; \
> > -+                    $(INSTALL_DATA) ../man/$$man $(ROOT)$(mandir)/man1/; \
> > -+                    sed -i "1{ $(MANDB); }" $(ROOT)$(mandir)/man1/$$man ; \
> > -             done
> > -             for man in $(MAN5); do \
> > --                    $(INSTALL_DATA) ../man/$$man $(ROOT)$(MANDIR)/man5/; \
> > --                    sed -i "1{ $(MANDB); }" $(ROOT)$(MANDIR)/man5/$$man ; \
> > -+                    $(INSTALL_DATA) ../man/$$man $(ROOT)$(mandir)/man5/; \
> > -+                    sed -i "1{ $(MANDB); }" $(ROOT)$(mandir)/man5/$$man ; \
> > -             done
> > -             for man in $(MAN8); do \
> > --                    $(INSTALL_DATA) ../man/$$man $(ROOT)$(MANDIR)/man8/; \
> > --                    sed -i "1{ $(MANDB); }" $(ROOT)$(MANDIR)/man8/$$man ; \
> > -+                    $(INSTALL_DATA) ../man/$$man $(ROOT)$(mandir)/man8/; \
> > -+                    sed -i "1{ $(MANDB); }" $(ROOT)$(mandir)/man8/$$man ; \
> > -             done
> > - ifeq ($(ROOT),)
> > -             #
> > diff --git a/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch b/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch
> > index 8ef292ed12..01df5e6ee4 100644
> > --- a/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch
> > +++ b/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch
> > @@ -45,17 +45,17 @@ index 6866cb3..a87d878 100644
> >   .TP
> >   .B 0
> >  diff --git a/src/killall5.c b/src/killall5.c
> > -index b0728fa..72289e3 100644
> > +index 6f7528a..34d656b 100644
> >  --- a/src/killall5.c
> >  +++ b/src/killall5.c
> >  @@ -121,6 +121,7 @@ typedef struct _s_nfs
> >
> >   /* List of processes. */
> > - PROC *plist;
> > -+PROC *olist;
> > + PROC *plist = NULL;
> > ++PROC *olist = NULL;
> >
> >   /* List of processes to omit. */
> > - OMIT *omit;
> > + OMIT *omit = NULL;
> >  @@ -356,6 +357,20 @@ static void clear_mnt(void)
> >       }
> >   }
> > @@ -85,7 +85,7 @@ index b0728fa..72289e3 100644
> >       struct dirent   *d;
> >       char            path[PATH_MAX+1];
> >       char            buf[PATH_MAX+1];
> > -@@ -670,6 +686,17 @@ int readproc()
> > +@@ -671,6 +687,17 @@ int readproc()
> >               p->next = plist;
> >               plist = p;
> >               p->pid = pid;
> > @@ -103,7 +103,7 @@ index b0728fa..72289e3 100644
> >       }
> >       closedir(dir);
> >
> > -@@ -870,6 +897,26 @@ PIDQ_HEAD *pidof(char *prog)
> > +@@ -877,6 +904,26 @@ PIDQ_HEAD *pidof(char *prog)
> >       return q;
> >   }
> >
> > @@ -130,7 +130,7 @@ index b0728fa..72289e3 100644
> >   /* Give usage message and exit. */
> >   void usage(void)
> >   {
> > -@@ -920,6 +967,7 @@ void nsyslog(int pri, char *fmt, ...)
> > +@@ -927,6 +974,7 @@ void nsyslog(int pri, char *fmt, ...)
> >   #define PIDOF_OMIT  0x02
> >   #define PIDOF_NETFS 0x04
> >   #define PIDOF_QUIET     0x08
> > @@ -138,7 +138,7 @@ index b0728fa..72289e3 100644
> >
> >   /*
> >    *  Pidof functionality.
> > -@@ -937,6 +985,7 @@ int main_pidof(int argc, char **argv)
> > +@@ -944,6 +992,7 @@ int main_pidof(int argc, char **argv)
> >       char            tmp[512];
> >           char            sep = ' ';
> >
> > @@ -146,7 +146,7 @@ index b0728fa..72289e3 100644
> >       omit = (OMIT*)0;
> >       nlist = (NFS*)0;
> >       opterr = 0;
> > -@@ -944,7 +993,7 @@ int main_pidof(int argc, char **argv)
> > +@@ -951,7 +1000,7 @@ int main_pidof(int argc, char **argv)
> >       if ((token = getenv("PIDOF_NETFS")) && (strcmp(token,"no") != 0))
> >               flags |= PIDOF_NETFS;
> >
> > @@ -155,7 +155,7 @@ index b0728fa..72289e3 100644
> >               case '?':
> >                       nsyslog(LOG_ERR,"invalid options on command line!\n");
> >                       closelog();
> > -@@ -995,6 +1044,9 @@ int main_pidof(int argc, char **argv)
> > +@@ -1002,6 +1051,9 @@ int main_pidof(int argc, char **argv)
> >                   case 'z':
> >                           list_dz_processes = TRUE;
> >                           break;
> > @@ -165,7 +165,7 @@ index b0728fa..72289e3 100644
> >               case 'n':
> >                       flags |= PIDOF_NETFS;
> >                       break;
> > -@@ -1026,10 +1078,13 @@ int main_pidof(int argc, char **argv)
> > +@@ -1033,10 +1085,13 @@ int main_pidof(int argc, char **argv)
> >                       pid_t spid = 0;
> >                       while ((p = get_next_from_pid_q(q))) {
> >                               if ((flags & PIDOF_OMIT) && omit) {
> > @@ -181,7 +181,7 @@ index b0728fa..72289e3 100644
> >                                       }
> >
> >                                       /*
> > -@@ -1071,6 +1126,7 @@ int main_pidof(int argc, char **argv)
> > +@@ -1078,6 +1133,7 @@ int main_pidof(int argc, char **argv)
> >               printf("\n");
> >           }
> >
> > diff --git a/meta/recipes-core/sysvinit/sysvinit/realpath.patch b/meta/recipes-core/sysvinit/sysvinit/realpath.patch
> > index b559aa3b49..78bf870612 100644
> > --- a/meta/recipes-core/sysvinit/sysvinit/realpath.patch
> > +++ b/meta/recipes-core/sysvinit/sysvinit/realpath.patch
> > @@ -12,29 +12,12 @@ Upstream-Status: Inappropriate [Linux specific]
> >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >
> >  ---
> > - src/killall5.c   | 4 ++--
> >   src/mountpoint.c | 1 +
> >   src/wall.c       | 1 +
> > - 3 files changed, 4 insertions(+), 2 deletions(-)
> > + 2 files changed, 2 insertions(+)
> >
> > -diff --git a/src/killall5.c b/src/killall5.c
> > -index a664954..9798423 100644
> > ---- a/src/killall5.c
> > -+++ b/src/killall5.c
> > -@@ -977,9 +977,9 @@ int matches(PROC *o, PROC *p)
> > -     char *oargv1, *pargv1;
> > -     if ((o->argv0 && p->argv0 && !strcmp(o->argv0,p->argv0))) {
> > -             if (o->argv1 && p->argv1) {
> > --                    if ((oargv1 = canonicalize_file_name(o->argv1)) == NULL)
> > -+                    if ((oargv1 = realpath(o->argv1, NULL)) == NULL)
> > -                             oargv1 = strdup(o->argv1);
> > --                    if ((pargv1 = canonicalize_file_name(p->argv1)) == NULL)
> > -+                    if ((pargv1 = realpath(p->argv1, NULL)) == NULL)
> > -                             pargv1 = strdup(p->argv1);
> > -                     if (! strcmp(oargv1, pargv1)) {
> > -                             ret = 1;
> >  diff --git a/src/mountpoint.c b/src/mountpoint.c
> > -index b24335e..5f20522 100644
> > +index 184b1f6..c55b0df 100644
> >  --- a/src/mountpoint.c
> >  +++ b/src/mountpoint.c
> >  @@ -23,6 +23,7 @@
> > @@ -46,7 +29,7 @@ index b24335e..5f20522 100644
> >   #include <unistd.h>
> >   #include <stdlib.h>
> >  diff --git a/src/wall.c b/src/wall.c
> > -index d3a2c70..00826e9 100644
> > +index e527613..1d363ca 100644
> >  --- a/src/wall.c
> >  +++ b/src/wall.c
> >  @@ -30,6 +30,7 @@
> > diff --git a/meta/recipes-core/sysvinit/sysvinit/sysvinit_remove_linux_fs.patch b/meta/recipes-core/sysvinit/sysvinit/sysvinit_remove_linux_fs.patch
> > deleted file mode 100644
> > index 89d65c23b7..0000000000
> > --- a/meta/recipes-core/sysvinit/sysvinit/sysvinit_remove_linux_fs.patch
> > +++ /dev/null
> > @@ -1,17 +0,0 @@
> > -# From glibc 2.36, <linux/mount.h> (included from <linux/fs.h>) and
> > -# <sys/mount.h> (included from glibc) are no longer compatible:
> > -# https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmount.h.3E_and_.3Csys.2Fmount.h.3E
> > -
> > -Upstream-Status: Pending
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > -
> > ---- sysvinit-3.04/src/sulogin.c.orig 2022-08-07 23:07:42.952576274 +0200
> > -+++ sysvinit-3.04/src/sulogin.c      2022-08-07 23:08:26.511470983 +0200
> > -@@ -51,7 +51,6 @@
> > - #ifdef __linux__
> > - #  include <sys/statfs.h>
> > - #  include <sys/mount.h>
> > --#  include <linux/fs.h>
> > - #  include <linux/magic.h>
> > - #  include <linux/major.h>
> > - #  ifndef TMPFS_MAGIC
> > diff --git a/meta/recipes-core/sysvinit/sysvinit_3.04.bb b/meta/recipes-core/sysvinit/sysvinit_3.10.bb
> > similarity index 93%
> > rename from meta/recipes-core/sysvinit/sysvinit_3.04.bb
> > rename to meta/recipes-core/sysvinit/sysvinit_3.10.bb
> > index fb9d00891c..89281f9fb3 100644
> > --- a/meta/recipes-core/sysvinit/sysvinit_3.04.bb
> > +++ b/meta/recipes-core/sysvinit/sysvinit_3.10.bb
> > @@ -9,21 +9,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
> >
> >  RDEPENDS:${PN} = "${PN}-inittab"
> >
> > -SRC_URI = "${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-${PV}.tar.xz \
> > -           file://install.patch \
> > +SRC_URI = "https://github.com/slicer69/sysvinit/releases/download/${PV}/sysvinit-${PV}.tar.xz \
> >             file://crypt-lib.patch \
> >             file://pidof-add-m-option.patch \
> >             file://realpath.patch \
> >             file://0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch \
> > -           file://sysvinit_remove_linux_fs.patch \
> >             file://rcS-default \
> >             file://rc \
> >             file://rcS \
> >             file://bootlogd.init \
> >             file://01_bootlogd \
> > -           file://0001-hddown-include-libgen.h-for-basename-API.patch \
> >             "
> > -SRC_URI[sha256sum] = "2a621fe6e4528bc91308b74867ddaaebbdf7753f02395c0c5bae817bd2b7e3a5"
> > +SRC_URI[sha256sum] = "c52d22f63e187a1247ad491b6a3a049561b887400a166d6b04fc9d67705c4da6"
> >
> >  S = "${WORKDIR}/sysvinit-${PV}"
> >
>
> >
> >
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203652): https://lists.openembedded.org/g/openembedded-core/message/203652
> Mute This Topic: https://lists.openembedded.org/mt/107960881/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

