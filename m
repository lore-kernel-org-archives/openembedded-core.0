Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 327F86067C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 May 2016 21:55:18 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id f92so47497103qgf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 May 2016 14:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hxK7AQs7mqd5dwgjTl7tLFs603GdXjIDbhoLtWGG8f8=;
	b=NW9NTQP1hMqXj6Xm7wTasapwp06Ks8m3UtYULLSYrxoM22MuoAaCZ9qKi5X4rjZPJ6
	2V7Ej5RGHSZnvZro+M8lvWi4RThGgwTxvgOAu8xLxPpYfNuHGs+qJdR148FKUVcmaQin
	vtFohKe2h1o2FFNlK4zFkOtV1xCCI5FGo8JpWBoeuxyGSxQwgy4JJ8OJ6r8LhzHHtu6N
	Zhg4e8zNwMCedtMVMeYlXp9gyWOW2eUfN7pc3kBgtxah5m+wFf56Zgbg65qRbXSgJGGe
	VxlS/JrMWAmXiREycO/QeIg4h6Fj4EDFqjqG3xZzn8LSyb0MoijscCHykOVeVXBudYKu
	4k2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hxK7AQs7mqd5dwgjTl7tLFs603GdXjIDbhoLtWGG8f8=;
	b=Ra2+i+thjtf++8Gvbmy7o/SQ10nx9ahjBjhSkT3JuWdk0Xyx+6N35Axg5Kh2XBW2at
	GnL14iQG4OUJwak13u5o4C3vMLAQqG7zTYZarSpFatNMM2+UDocY4p06YKVCYeBKOFW6
	G0PgAszrR7dnOzAL1ybA/k+zKhKBxdXiVP3NQ8cMyv3XQrR3ZnZSuepffRkb8Yf2F+hs
	tFmqeZVedoHg+hec0Oq703NfALgxEObpO9+JPG3z98rBVkWg+BbJldaaR8FX1g+MajLs
	gCHCMPKNT0TEoh5Mky3TmJ87wDFJiTsM3ZtU41qPr+4ta3/IMALjAesB16dDC+ucIDOJ
	wFQA==
X-Gm-Message-State: AOPr4FUl6camj9gZYmhEbC5r/xicXZ7dq+SM8PKEE8WvKJNa6MHmMtnxa8JtKvTUsZe1tIliDquu9Wz2OGUqEg==
X-Received: by 10.140.92.175 with SMTP id b44mr16134061qge.104.1462485319241; 
	Thu, 05 May 2016 14:55:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Thu, 5 May 2016 14:54:49 -0700 (PDT)
In-Reply-To: <289ee855c6244dfd7a5b1e0f2a4a27ad236ac60c.1462476586.git.chris_larson@mentor.com>
References: <cover.1462476586.git.chris_larson@mentor.com>
	<e944ff3a1104badb75b034a6ec399805d1796c38.1462476586.git.chris_larson@mentor.com>
	<289ee855c6244dfd7a5b1e0f2a4a27ad236ac60c.1462476586.git.chris_larson@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 May 2016 14:54:49 -0700
Message-ID: <CAMKF1srtLpbqyE00f6RJ3irfS2n-zz-GjQ=saPFKOMoy5-OYZQ@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [master][PATCH 2/3] mkelfimage: obey LDFLAGS, sort out HOST_ flags
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
X-List-Received-Date: Thu, 05 May 2016 21:55:25 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 5, 2016 at 12:30 PM, Christopher Larson <kergoth@gmail.com> wrote:
> From: Christopher Larson <chris_larson@mentor.com>
>
> We weren't consistent in the HOST_ (aka BUILD_) and non-HOST_ flags, so we
> were using BUILD_CPPFLAGS to compile target stuff, for example. Sort that out,
> and make sure we obey LDFLAGS.
>

may be you should fold it into cross_compile patch ?

> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  ...HOST_-vs-non-HOST_-flags-and-obey-LDFLAGS.patch | 73 ++++++++++++++++++++++
>  meta/recipes-devtools/mkelfimage/mkelfimage_git.bb |  5 +-
>  2 files changed, 76 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-devtools/mkelfimage/mkelfimage/0002-Sort-out-HOST_-vs-non-HOST_-flags-and-obey-LDFLAGS.patch
>
> diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage/0002-Sort-out-HOST_-vs-non-HOST_-flags-and-obey-LDFLAGS.patch b/meta/recipes-devtools/mkelfimage/mkelfimage/0002-Sort-out-HOST_-vs-non-HOST_-flags-and-obey-LDFLAGS.patch
> new file mode 100644
> index 0000000..8139edc
> --- /dev/null
> +++ b/meta/recipes-devtools/mkelfimage/mkelfimage/0002-Sort-out-HOST_-vs-non-HOST_-flags-and-obey-LDFLAGS.patch
> @@ -0,0 +1,73 @@
> +Upstream-Status: Pending
> +
> +From ef21bb404cb5dbfbaa95b693c9705da2fd7e7472 Mon Sep 17 00:00:00 2001
> +From: Christopher Larson <chris_larson@mentor.com>
> +Date: Thu, 5 May 2016 11:49:24 -0700
> +Subject: Sort out HOST_ vs non-HOST_ flags, and obey LDFLAGS
> +
> +Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> +---
> + Makefile.conf.in | 3 +++
> + configure.ac     | 6 +++++-
> + main/Makefile    | 4 ++--
> + 3 files changed, 10 insertions(+), 3 deletions(-)
> +
> +diff --git a/Makefile.conf.in b/Makefile.conf.in
> +index 4645e44..dcb6cf2 100644
> +--- a/Makefile.conf.in
> ++++ b/Makefile.conf.in
> +@@ -17,6 +17,9 @@ DEFS=@DEFS@
> + LIBS=@LIBS@
> + HOST_CC=@HOST_CC@
> + HOST_CFLAGS=@HOST_CFLAGS@  $(DEFS)
> ++CC=@CC@
> ++CFLAGS=@CFLAGS@ $(DEFS)
> ++LDFLAGS=@LDFLAGS@
> +
> + I386_CC     =@I386_CC@
> + I386_LD     =@I386_LD@
> +diff --git a/configure.ac b/configure.ac
> +index d8bd7aa..2962a4a 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -175,7 +175,8 @@ fi
> +
> + dnl ---Output variables...
> +
> +-HOST_CFLAGS="$HOST_CFLAGS -O2 -Wall \$(HOST_CPPFLAGS)"
> ++CFLAGS="${CFLAGS:--O2} -Wall \$(CPPFLAGS)"
> ++HOST_CFLAGS="${HOST_CFLAGS:--O2} -Wall \$(HOST_CPPFLAGS)"
> +
> + dnl TODO: figure out how to set these appropriately for compilers other than gcc
> + I386_CFLAGS="$I386_CFLAGS -Os -ffreestanding -Wall -W -Wno-format \$(I386_CPPFLAGS)"
> +@@ -189,6 +190,9 @@ IA64_LDFLAGS='-static --warn-multiple-gp --warn-common'
> +
> + AC_SUBST([HOST_CC])
> + AC_SUBST([HOST_CFLAGS])
> ++AC_SUBST([CC])
> ++AC_SUBST([CFLAGS])
> ++AC_SUBST([LDFLAGS])
> +
> + AC_SUBST([I386_CC])
> + AC_SUBST([I386_LD])
> +diff --git a/main/Makefile b/main/Makefile
> +index d9fb1d8..cd53613 100644
> +--- a/main/Makefile
> ++++ b/main/Makefile
> +@@ -4,11 +4,11 @@ MKELF_OBJS=$(OBJDIR)/main/mkelfImage.o \
> +
> + $(OBJDIR)/sbin/mkelfImage: $(MKELF_OBJS) $(DEPS)
> +       $(MKDIR) -p $(@D)
> +-      $(CC) $(HOST_CFLAGS) $(MKELF_OBJS) -o $@ $(LIBS)
> ++      $(CC) $(CFLAGS) $(LDFLAGS) $(MKELF_OBJS) -o $@ $(LIBS)
> +
> + $(OBJDIR)/main/mkelfImage.o: main/mkelfImage.c include/mkelfImage.h $(DEPS)
> +       $(MKDIR) -p $(@D)
> +-      $(CC) $(HOST_CFLAGS) -c $< -o $@
> ++      $(CC) $(CFLAGS) -c $< -o $@
> +
> + $(OBJDIR)/man/man8/mkelfImage.8: main/mkelfImage.man
> +       $(MKDIR) -p $(@D)
> +--
> +2.8.0
> +
> diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
> index 92435cd..9fcccb4 100644
> --- a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
> +++ b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
> @@ -13,8 +13,9 @@ http://review.coreboot.org/gitweb?p=coreboot.git;a=commit;h=34fc4ab80b507739e258
>  DEPENDS += "zlib"
>
>  SRC_URI = "git://review.coreboot.org/p/coreboot;protocol=http \
> -           file://cross-compile.patch   \
> -          "
> +           file://cross-compile.patch \
> +           file://0002-Sort-out-HOST_-vs-non-HOST_-flags-and-obey-LDFLAGS.patch \
> +           "
>  SRC_URI_append_class-native = " \
>             file://fix-makefile-to-find-libz.patch   \
>  "
> --
> 2.8.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

