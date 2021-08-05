Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.6888.1628158902210231490
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 03:21:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NIuWUXNe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id z4so5804430wrv.11
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 03:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=M/RLn+/cNk2X6VLq8k6arZ/XtyKipFBya9kWxoA5JjE=;
        b=NIuWUXNeDBhOSg0wmzsBIzPNQ6pMqUAJVklWq5vNNzY8ip6C7zUFenHtIhp808rySZ
         FW75EZo8wrxYAlxQbYc+c/kBF1O4XrZH2S7hojJ8HDqOB9y7jGGfkcJ/z4l/o2YxwAgS
         6QfP0Ax5qwdGlsuEu4PeGqc682JM8FdTcGDE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=M/RLn+/cNk2X6VLq8k6arZ/XtyKipFBya9kWxoA5JjE=;
        b=gumjmJFTP+pLA+Z7w37B6bOdxRobUNMgOtHzOKcDzwm3t2CeM0NdQSK+JtAh9eIYIb
         iExVaUsXjJc2yoVGEXrOgznztHopc1BlwTF9SCCt0RLOFWvzh8jF2qctDjZ6VotBLSP2
         RriRpw+l36HIzqKFywRocmZQJVm7tjiSRuWuwTY0x7BWyEx3Aq2FgIhOhvleSxVpzF3I
         qWba1cW+M071hLx84hUIhMsoZslG2kPlU7KC7hZBwzu5ZhDGVTp3vMb9xHPW7U5oDXqm
         GVffyoCPjRqXAj7yOHCTINZp2iCMp3QjSRBsdPu6Uyj0FybqOoyL1hgn7j2zo5/fxF53
         4qAw==
X-Gm-Message-State: AOAM530ZwCb0eUWwKVm43u8xSWi1ptFohZgZ2QIZQj493y/96KzOIrEc
	W3uAOxL1gMqQ4Xn/OndFvvidnQ==
X-Google-Smtp-Source: ABdhPJyl70ywTkw7GFrKG2He6pvxTQq1GeYub1fFbCZJQmpNkP6Iia+Bprzv57BngEulkN+/sRejVQ==
X-Received: by 2002:a5d:6312:: with SMTP id i18mr4301758wru.414.1628158900679;
        Thu, 05 Aug 2021 03:21:40 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:ea47:91d3:ba71:9eb4? ([2001:8b0:aba:5f3c:ea47:91d3:ba71:9eb4])
        by smtp.gmail.com with ESMTPSA id o2sm5161960wmq.30.2021.08.05.03.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 03:21:40 -0700 (PDT)
Message-ID: <22d7a9866471f53ea283caa1578fbf0b48d5e113.camel@linuxfoundation.org>
Subject: Re: [OE-core] [master][PATCH 0/4] Reproducible LTO builds
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>, Tony Battersby
	 <tonyb@cybernetics.com>, openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Date: Thu, 05 Aug 2021 11:21:39 +0100
In-Reply-To: <447d4fa9-b915-4e59-0ecc-64d41c6ceee6@windriver.com>
References: <2efeecad-7ee5-126c-9271-d69fc3428c38@cybernetics.com>
	 <447d4fa9-b915-4e59-0ecc-64d41c6ceee6@windriver.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-08-04 at 20:13 -0400, Randy MacLeod wrote:
> On 2021-07-27 9:34 a.m., Tony Battersby wrote:
> > Currently, enabling Link Time Optimization via:
> > 
> > require conf/distro/include/lto.inc
> > DISTRO_FEATURES_append = " lto"
> > 
> > makes the build non-reproducible (as in
> > https://reproducible-builds.org/).  This patch set fixes some of the
> > problems, but is not yet a complete solution.
> > 
> > This patch set addresses the following bugs:
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=14481
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=14490
> > 
> > openembedded-core patches
> > 1/4: lto.inc: disable LTO for grub
> > 2/4: gcc: Backport patch to make LTO builds more reproducible
> > 3/4: bitbake.conf: add DEBUG_PREFIX_MAP to TARGET_LDFLAGS
> > 
> > openembedded-devel patches
> > 4/4: net-snmp: fix QA Issue after LDFLAGS change
> > 
> > Patch 3 adds DEBUG_PREFIX_MAP to TARGET_LDFLAGS (it was already in
> > TARGET_CFLAGS).  This could possibly be done differently, such as by
> > removing it from TARGET_CFLAGS and adding it to TOOLCHAIN_OPTIONS,
> > TARGET_CC_ARCH, or TUNE_CCARGS, but I haven't tested those.  Let me know
> > if there is a better/preferred way to do it.
> > 
> > The TARGET_LDFLAGS change broke net-snmp from meta-networking, so I have
> > included a patch to fix that.  Other packages might have been broken as
> > well, although I haven't found any others.
> > 
> > With all these patches, there are still many shared libraries in /lib
> > and /usr/lib that are still not reproducible with LTO enabled because
> > x86_64-poky-linux-libtool filters out the -f*-prefix-map flags added by
> > patch 3 when linking shared libraries.  /usr/lib/libbz2.so.1.0.6 from
> > the libbz2 package from the bzip2 recipe is a good example.  I do not
> > have a patch for that problem.  I will leave that to someone else.
> > 
> > So this is what we need to achieve reproducible LTO builds:
> > *) This patch set
> > *) A fix for libtool
> > *) Add LTO to reproducible builds testing if appropriate (e.g.
> > meta/lib/oeqa/selftest/cases/reproducible.py, CI on Autobuilder)
> > *) Fixes for individual packages, if needed
> > *) Once everything works, update the documentation again (I previously
> > requested a documentation change for this bug, which will eventually
> > show up at
> > http://docs.yoctoproject.org/test-manual/reproducible-builds.html).
> 
> This is certainly a few steps in the right direction with a good outline
> of what's next.
> 
> I suspect that Richard has been busy with other things like overrides
> and the update to glibc-2.34.
> 
> Do you have any suggestions or questions about what we should do
> with this patch series Richard?

Thanks for the reminder, I've been meaning to queue/test this which I will
do. The gcc version has been bumped but I ported the patch forward to it
and the patches are in master-next for testing. It is great to see this
support moving forward.

Much as it pains me to admit having any libtool knowledge, I may be able to
help with that bit. There is an untested patch below which may address that
issue, or at least give a good hint on how to do it if it doesn't work. I
don't have an environment to test easily right now.

Cheers,

Richard


From 7681b0a1461f22034e1f70328a060db34474c60f Mon Sep 17 00:00:00 2001
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Thu, 5 Aug 2021 11:18:20 +0100
Subject: libtool: Fix lto option passing?

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/libtool/libtool-2.4.6.inc        |  1 +
 meta/recipes-devtools/libtool/libtool/lto-prefix.patch | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 meta/recipes-devtools/libtool/libtool/lto-prefix.patch

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.6.inc b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
index c1cbceb51f..6748d7468e 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.6.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
@@ -23,6 +23,7 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://0001-libtool-Check-for-static-libs-for-internal-compiler-.patch \
            file://0001-Makefile.am-make-sure-autoheader-run-before-autoconf.patch \
            file://0001-Makefile.am-make-sure-autoheader-run-before-automake.patch \
+           file://lto-prefix.patch \
           "
 
 SRC_URI[md5sum] = "addf44b646ddb4e3919805aa88fa7c5e"
diff --git a/meta/recipes-devtools/libtool/libtool/lto-prefix.patch b/meta/recipes-
devtools/libtool/libtool/lto-prefix.patch
new file mode 100644
index 0000000000..f788b3fc27
--- /dev/null
+++ b/meta/recipes-devtools/libtool/libtool/lto-prefix.patch
@@ -0,0 +1,16 @@
+Index: libtool-2.4.6/build-aux/ltmain.in
+===================================================================
+--- libtool-2.4.6.orig/build-aux/ltmain.in
++++ libtool-2.4.6/build-aux/ltmain.in
+@@ -5424,9 +5424,10 @@ func_mode_link ()
+       # --sysroot=*          for sysroot support
+       # -O*, -g*, -flto*, -fwhopr*, -fuse-linker-plugin GCC link-time optimization
+       # -stdlib=*            select c++ std lib with clang
++      # -f*-prefix-map*      needed for lto linking
+       -64|-mips[0-9]|-r[0-9][0-9]*|-xarch=*|-xtarget=*|+DA*|+DD*|-q*|-m*| \
+       -t[45]*|-txscale*|-p|-pg|--coverage|-fprofile-*|-F*|@*|-tp=*|--sysroot=*| \
+-      -O*|-g*|-flto*|-fwhopr*|-fuse-linker-plugin|-fstack-protector*|-stdlib=*)
++      -O*|-g*|-flto*|-fwhopr*|-fuse-linker-plugin|-fstack-protector*|-stdlib=*|-f*-prefix-map*)
+         func_quote_for_eval "$arg"
+ 	arg=$func_quote_for_eval_result
+         func_append compile_command " $arg"



