Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 893F460851
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 04:53:04 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id z80so2360080qkb.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 May 2016 21:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pFDnVAWYGxnGbSI7akyt/Lz6xsFqG00/S3RlgGKENq0=;
	b=D5qoHahCVBCk6WBOykYu4doE81E/i7ckqPLmW616w+bZo2HLCgS8tRll60TanppY2b
	faU9uRSR+nAw+Dpn1lrK0OtkosYhFI5473TIcxOL1qXLXmIYLBwlG16K8BERNCkyKOcy
	NWfjhd0vSmDVxa/gfn6pRMJyjbKIAoB7yWusd9Kuk7Q9xXA+BZ84Titn2WjQJfZz3Cr+
	upAe7M+Nc8txfTqU0O6rCQYTfZ1Lv38PJMleeu5jzYqACYDWFA8cKmWe6rdxai61RTvd
	1AZz8chfpBBoz//RfOpXyJQjNDV+AWjLGhIWpITdWajoRj8E70mk3vFt3AxIQEnu6V4Y
	XFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pFDnVAWYGxnGbSI7akyt/Lz6xsFqG00/S3RlgGKENq0=;
	b=ip2OW3PE8I0RqfAvrlihNxhq54a4Qae8vlOrNAAP9jHRE3Bsdzf+pwZeaCXtge22gb
	1yedzxqAom5tXZQq6lbXkuWbSd+NybCOtSTeAXpwvkOAf7kVuhJgVK5hNwHm2lpRURYx
	yzhY/j4wM5Xx7h/UzsbxGf6xQcHbU/uCdF1J1Q4ZWBmgvzFcQ82WAaXNBWrBPsuwBPAD
	MW9waw8XMPaATCod41rp+rhamJ8mMGz8I8jdNv1p4vD5a3JM2RuyE78scQNv46h+nfXP
	u3Sx9I4jtfEyyoZo7mKoXERo9QM/Jy6k65NS3vA3/YLFQxcSOfunZqzf3OOFOEfGWWgc
	D9TQ==
X-Gm-Message-State: ALyK8tIG3VwcwyrWtH4VWvoRrJxtfpuA6JI+HAmkM4kHxa4Fat/v9YKoXvyUhym1T5OhDOtuDKrew7xs1cvIhg==
X-Received: by 10.200.36.148 with SMTP id s20mr760996qts.76.1463979184510;
	Sun, 22 May 2016 21:53:04 -0700 (PDT)
MIME-Version: 1.0
References: <e889a21f09e4bcbddd05ee90a914600d33540dfa.1462489051.git.chris_larson@mentor.com>
	<1463763860-4124-1-git-send-email-kergoth@gmail.com>
In-Reply-To: <1463763860-4124-1-git-send-email-kergoth@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 May 2016 04:52:55 +0000
Message-ID: <CAMKF1sozc-Xjvd_CPAT5DEeE=oNmqRnWV+qk0QDuq+4S=rk0Wg@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCHv3] mkelfimage: obey LDFLAGS, sort out HOST_ flags
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
X-List-Received-Date: Mon, 23 May 2016 04:53:04 -0000
Content-Type: multipart/alternative; boundary=001a1142b00c40604805337b37e6

--001a1142b00c40604805337b37e6
Content-Type: text/plain; charset=UTF-8

I am getting these errors with clang now

http://errors.yoctoproject.org/Errors/Details/64935/

On Fri, May 20, 2016 at 8:04 PM Christopher Larson <kergoth@gmail.com>
wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> We weren't consistent in the HOST_ (aka BUILD_) and non-HOST_ flags, so we
> were using BUILD_CPPFLAGS to compile target stuff, for example. Sort that
> out,
> and make sure we obey LDFLAGS.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>
> v2 change: fixed patch file paths
>
>  .../mkelfimage/mkelfimage/cross-compile.patch      | 85
> +++++++++++++++-------
>  meta/recipes-devtools/mkelfimage/mkelfimage_git.bb |  4 +-
>  2 files changed, 62 insertions(+), 27 deletions(-)
>
> diff --git
> a/meta/recipes-devtools/mkelfimage/mkelfimage/cross-compile.patch
> b/meta/recipes-devtools/mkelfimage/mkelfimage/cross-compile.patch
> index 7692709..2ae9fb5 100644
> --- a/meta/recipes-devtools/mkelfimage/mkelfimage/cross-compile.patch
> +++ b/meta/recipes-devtools/mkelfimage/mkelfimage/cross-compile.patch
> @@ -1,13 +1,43 @@
> -make the tool to be cross compilable.
> +From dc2712119d6832e24a9b7bed9ed4ce5ae03ce0a3 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 14 Jul 2012 14:14:07 -0700
> +Subject: [PATCH] mkelfimage: Fix cross build
> +
> +Make the tool to be cross compilable, by separating the variables for
> build
> +tools from those for the target. Also modified to obey LDFLAGS.
>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> +
>  Upstream-Status: Pending
>
> -Index: mkelfImage/configure.ac
> -===================================================================
> ---- mkelfImage.orig/configure.ac       2012-07-14 14:04:48.964898667
> -0700
> -+++ mkelfImage/configure.ac    2012-07-14 14:10:47.800916083 -0700
> -@@ -70,6 +70,9 @@
> +---
> + Makefile.conf.in    | 3 +++
> + configure.ac        | 7 +++++--
> + linux-i386/Makefile | 2 +-
> + linux-ia64/Makefile | 2 +-
> + main/Makefile       | 4 ++--
> + 5 files changed, 12 insertions(+), 6 deletions(-)
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
> +index 652b952..0f2ac72 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -70,6 +70,9 @@ if test "with_default" != no ; then
>                 AC_MSG_ERROR([cc not found])
>         fi
>         eval "${with_default}_CC='$CC'"
> @@ -17,19 +47,22 @@ Index: mkelfImage/configure.ac
>         AC_PROG_CPP
>         if test "$CPP" = no; then
>                 AC_MSG_ERROR([cpp not found])
> -@@ -172,7 +175,6 @@
> +@@ -172,8 +175,8 @@ fi
>
>   dnl ---Output variables...
>
>  -HOST_CC=$CC
> - HOST_CFLAGS="$HOST_CFLAGS -O2 -Wall \$(HOST_CPPFLAGS)"
> +-HOST_CFLAGS="$HOST_CFLAGS -O2 -Wall \$(HOST_CPPFLAGS)"
> ++CFLAGS="${CFLAGS:--O2} -Wall \$(CPPFLAGS)"
> ++HOST_CFLAGS="${HOST_CFLAGS:--O2} -Wall \$(HOST_CPPFLAGS)"
>
>   dnl TODO: figure out how to set these appropriately for compilers other
> than gcc
> -Index: mkelfImage/linux-i386/Makefile
> -===================================================================
> ---- mkelfImage.orig/linux-i386/Makefile        2012-07-14
> 14:04:48.964898667 -0700
> -+++ mkelfImage/linux-i386/Makefile     2012-07-14 14:04:49.032898671 -0700
> -@@ -4,7 +4,7 @@
> + I386_CFLAGS="$I386_CFLAGS -Os -ffreestanding -Wall -W -Wno-format
> \$(I386_CPPFLAGS)"
> +diff --git a/linux-i386/Makefile b/linux-i386/Makefile
> +index 51531d6..7e8aa3c 100644
> +--- a/linux-i386/Makefile
> ++++ b/linux-i386/Makefile
> +@@ -4,7 +4,7 @@ LI386_DEP=Makefile Makefile.conf $(LI386_DIR)/Makefile
>
>   $(LI386_OBJ)/mkelf-linux-i386.o: $(LI386_DIR)/mkelf-linux-i386.c
> $(LI386_DIR)/convert.bin.c $(LI386_DEP)
>         $(MKDIR) -p $(@D)
> @@ -38,11 +71,11 @@ Index: mkelfImage/linux-i386/Makefile
>
>
>   ifdef I386_CC
> -Index: mkelfImage/linux-ia64/Makefile
> -===================================================================
> ---- mkelfImage.orig/linux-ia64/Makefile        2012-07-14
> 14:04:48.964898667 -0700
> -+++ mkelfImage/linux-ia64/Makefile     2012-07-14 14:04:49.032898671 -0700
> -@@ -4,7 +4,7 @@
> +diff --git a/linux-ia64/Makefile b/linux-ia64/Makefile
> +index 38f5d8c..5df8870 100644
> +--- a/linux-ia64/Makefile
> ++++ b/linux-ia64/Makefile
> +@@ -4,7 +4,7 @@ LIA64_DEP=Makefile Makefile.conf $(LIA64_DIR)/Makefile
>
>   $(LIA64_OBJ)/mkelf-linux-ia64.o: $(LIA64_DIR)/mkelf-linux-ia64.c
> $(LIA64_DIR)/convert.bin.c $(LIA64_DEP)
>         $(MKDIR) -p $(@D)
> @@ -51,21 +84,23 @@ Index: mkelfImage/linux-ia64/Makefile
>
>   ifdef IA64_CC
>
> -Index: mkelfImage/main/Makefile
> -===================================================================
> ---- mkelfImage.orig/main/Makefile      2012-07-14 14:04:48.964898667 -0700
> -+++ mkelfImage/main/Makefile   2012-07-14 14:04:49.032898671 -0700
> -@@ -4,11 +4,11 @@
> +diff --git a/main/Makefile b/main/Makefile
> +index 403b0a4..cd53613 100644
> +--- a/main/Makefile
> ++++ b/main/Makefile
> +@@ -4,11 +4,11 @@ MKELF_OBJS=$(OBJDIR)/main/mkelfImage.o \
>
>   $(OBJDIR)/sbin/mkelfImage: $(MKELF_OBJS) $(DEPS)
>         $(MKDIR) -p $(@D)
>  -      $(HOST_CC) $(HOST_CFLAGS) $(MKELF_OBJS) -o $@ $(LIBS)
> -+      $(CC) $(HOST_CFLAGS) $(MKELF_OBJS) -o $@ $(LIBS)
> ++      $(CC) $(CFLAGS) $(LDFLAGS) $(MKELF_OBJS) -o $@ $(LIBS)
>
>   $(OBJDIR)/main/mkelfImage.o: main/mkelfImage.c include/mkelfImage.h
> $(DEPS)
>         $(MKDIR) -p $(@D)
>  -      $(HOST_CC) $(HOST_CFLAGS) -c $< -o $@
> -+      $(CC) $(HOST_CFLAGS) -c $< -o $@
> ++      $(CC) $(CFLAGS) -c $< -o $@
>
>   $(OBJDIR)/man/man8/mkelfImage.8: main/mkelfImage.man
>         $(MKDIR) -p $(@D)
> +--
> +2.8.0
> diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
> b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
> index 92435cd..d7a4429 100644
> --- a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
> +++ b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
> @@ -13,8 +13,8 @@
> http://review.coreboot.org/gitweb?p=coreboot.git;a=commit;h=34fc4ab80b507739e258
>  DEPENDS += "zlib"
>
>  SRC_URI = "git://review.coreboot.org/p/coreboot;protocol=http \
> -           file://cross-compile.patch   \
> -          "
> +           file://cross-compile.patch \
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
>

--001a1142b00c40604805337b37e6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am getting these errors with clang now<div><br></div><di=
v><a href=3D"http://errors.yoctoproject.org/Errors/Details/64935/">http://e=
rrors.yoctoproject.org/Errors/Details/64935/</a><br></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr">On Fri, May 20, 2016 at 8:04 PM Christ=
opher Larson &lt;<a href=3D"mailto:kergoth@gmail.com">kergoth@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Christopher Larso=
n &lt;<a href=3D"mailto:chris_larson@mentor.com" target=3D"_blank">chris_la=
rson@mentor.com</a>&gt;<br>
<br>
We weren&#39;t consistent in the HOST_ (aka BUILD_) and non-HOST_ flags, so=
 we<br>
were using BUILD_CPPFLAGS to compile target stuff, for example. Sort that o=
ut,<br>
and make sure we obey LDFLAGS.<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com" target=3D"_blank">chris_larson@mentor.com</a>&gt;<br>
---<br>
<br>
v2 change: fixed patch file paths<br>
<br>
=C2=A0.../mkelfimage/mkelfimage/cross-compile.patch=C2=A0 =C2=A0 =C2=A0 | 8=
5 +++++++++++++++-------<br>
=C2=A0meta/recipes-devtools/mkelfimage/<a href=3D"http://mkelfimage_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">mkelfimage_git.bb</a> |=C2=A0 4 +-<br=
>
=C2=A02 files changed, 62 insertions(+), 27 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage/cross-compile.patc=
h b/meta/recipes-devtools/mkelfimage/mkelfimage/cross-compile.patch<br>
index 7692709..2ae9fb5 100644<br>
--- a/meta/recipes-devtools/mkelfimage/mkelfimage/cross-compile.patch<br>
+++ b/meta/recipes-devtools/mkelfimage/mkelfimage/cross-compile.patch<br>
@@ -1,13 +1,43 @@<br>
-make the tool to be cross compilable.<br>
+From dc2712119d6832e24a9b7bed9ed4ce5ae03ce0a3 Mon Sep 17 00:00:00 2001<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
+Date: Sat, 14 Jul 2012 14:14:07 -0700<br>
+Subject: [PATCH] mkelfimage: Fix cross build<br>
+<br>
+Make the tool to be cross compilable, by separating the variables for buil=
d<br>
+tools from those for the target. Also modified to obey LDFLAGS.<br>
<br>
=C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mento=
r.com" target=3D"_blank">chris_larson@mentor.com</a>&gt;<br>
+<br>
=C2=A0Upstream-Status: Pending<br>
<br>
-Index: mkelfImage/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a><br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- mkelfImage.orig/<a href=3D"http://configure.ac" rel=3D"noreferrer" tar=
get=3D"_blank">configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A02012-07-14 14:04:=
48.964898667 -0700<br>
-+++ mkelfImage/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a>=C2=A0 =C2=A0 2012-07-14 14:10:47.800916083 -07=
00<br>
-@@ -70,6 +70,9 @@<br>
+---<br>
+ <a href=3D"http://Makefile.conf.in" rel=3D"noreferrer" target=3D"_blank">=
Makefile.conf.in</a>=C2=A0 =C2=A0 | 3 +++<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++--<br>
+ linux-i386/Makefile | 2 +-<br>
+ linux-ia64/Makefile | 2 +-<br>
+ main/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
+ 5 files changed, 12 insertions(+), 6 deletions(-)<br>
+<br>
+diff --git a/<a href=3D"http://Makefile.conf.in" rel=3D"noreferrer" target=
=3D"_blank">Makefile.conf.in</a> b/<a href=3D"http://Makefile.conf.in" rel=
=3D"noreferrer" target=3D"_blank">Makefile.conf.in</a><br>
+index 4645e44..dcb6cf2 100644<br>
+--- a/<a href=3D"http://Makefile.conf.in" rel=3D"noreferrer" target=3D"_bl=
ank">Makefile.conf.in</a><br>
++++ b/<a href=3D"http://Makefile.conf.in" rel=3D"noreferrer" target=3D"_bl=
ank">Makefile.conf.in</a><br>
+@@ -17,6 +17,9 @@ DEFS=3D@DEFS@<br>
+ LIBS=3D@LIBS@<br>
+ HOST_CC=3D@HOST_CC@<br>
+ HOST_CFLAGS=3D@HOST_CFLAGS@=C2=A0 $(DEFS)<br>
++CC=3D@CC@<br>
++CFLAGS=3D@CFLAGS@ $(DEFS)<br>
++LDFLAGS=3D@LDFLAGS@<br>
+<br>
+ I386_CC=C2=A0 =C2=A0 =C2=A0=3D@I386_CC@<br>
+ I386_LD=C2=A0 =C2=A0 =C2=A0=3D@I386_LD@<br>
+diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
+index 652b952..0f2ac72 100644<br>
+--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
+@@ -70,6 +70,9 @@ if test &quot;with_default&quot; !=3D no ; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_ERROR([cc no=
t found])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 eval &quot;${with_default}_CC=3D&#39;$CC&#39;&q=
uot;<br>
@@ -17,19 +47,22 @@ Index: mkelfImage/<a href=3D"http://configure.ac" rel=
=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_PROG_CPP<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$CPP&quot; =3D no; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_ERROR([cpp n=
ot found])<br>
-@@ -172,7 +175,6 @@<br>
+@@ -172,8 +175,8 @@ fi<br>
<br>
=C2=A0 dnl ---Output variables...<br>
<br>
=C2=A0-HOST_CC=3D$CC<br>
- HOST_CFLAGS=3D&quot;$HOST_CFLAGS -O2 -Wall \$(HOST_CPPFLAGS)&quot;<br>
+-HOST_CFLAGS=3D&quot;$HOST_CFLAGS -O2 -Wall \$(HOST_CPPFLAGS)&quot;<br>
++CFLAGS=3D&quot;${CFLAGS:--O2} -Wall \$(CPPFLAGS)&quot;<br>
++HOST_CFLAGS=3D&quot;${HOST_CFLAGS:--O2} -Wall \$(HOST_CPPFLAGS)&quot;<br>
<br>
=C2=A0 dnl TODO: figure out how to set these appropriately for compilers ot=
her than gcc<br>
-Index: mkelfImage/linux-i386/Makefile<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- mkelfImage.orig/linux-i386/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 2012-07=
-14 14:04:48.964898667 -0700<br>
-+++ mkelfImage/linux-i386/Makefile=C2=A0 =C2=A0 =C2=A02012-07-14 14:04:49.=
032898671 -0700<br>
-@@ -4,7 +4,7 @@<br>
+ I386_CFLAGS=3D&quot;$I386_CFLAGS -Os -ffreestanding -Wall -W -Wno-format =
\$(I386_CPPFLAGS)&quot;<br>
+diff --git a/linux-i386/Makefile b/linux-i386/Makefile<br>
+index 51531d6..7e8aa3c 100644<br>
+--- a/linux-i386/Makefile<br>
++++ b/linux-i386/Makefile<br>
+@@ -4,7 +4,7 @@ LI386_DEP=3DMakefile Makefile.conf $(LI386_DIR)/Makefile<b=
r>
<br>
=C2=A0 $(LI386_OBJ)/mkelf-linux-i386.o: $(LI386_DIR)/mkelf-linux-i386.c $(L=
I386_DIR)/convert.bin.c $(LI386_DEP)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(MKDIR) -p $(@D)<br>
@@ -38,11 +71,11 @@ Index: mkelfImage/linux-i386/Makefile<br>
<br>
<br>
=C2=A0 ifdef I386_CC<br>
-Index: mkelfImage/linux-ia64/Makefile<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- mkelfImage.orig/linux-ia64/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 2012-07=
-14 14:04:48.964898667 -0700<br>
-+++ mkelfImage/linux-ia64/Makefile=C2=A0 =C2=A0 =C2=A02012-07-14 14:04:49.=
032898671 -0700<br>
-@@ -4,7 +4,7 @@<br>
+diff --git a/linux-ia64/Makefile b/linux-ia64/Makefile<br>
+index 38f5d8c..5df8870 100644<br>
+--- a/linux-ia64/Makefile<br>
++++ b/linux-ia64/Makefile<br>
+@@ -4,7 +4,7 @@ LIA64_DEP=3DMakefile Makefile.conf $(LIA64_DIR)/Makefile<b=
r>
<br>
=C2=A0 $(LIA64_OBJ)/mkelf-linux-ia64.o: $(LIA64_DIR)/mkelf-linux-ia64.c $(L=
IA64_DIR)/convert.bin.c $(LIA64_DEP)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(MKDIR) -p $(@D)<br>
@@ -51,21 +84,23 @@ Index: mkelfImage/linux-ia64/Makefile<br>
<br>
=C2=A0 ifdef IA64_CC<br>
<br>
-Index: mkelfImage/main/Makefile<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- mkelfImage.orig/main/Makefile=C2=A0 =C2=A0 =C2=A0 2012-07-14 14:04:48.=
964898667 -0700<br>
-+++ mkelfImage/main/Makefile=C2=A0 =C2=A02012-07-14 14:04:49.032898671 -07=
00<br>
-@@ -4,11 +4,11 @@<br>
+diff --git a/main/Makefile b/main/Makefile<br>
+index 403b0a4..cd53613 100644<br>
+--- a/main/Makefile<br>
++++ b/main/Makefile<br>
+@@ -4,11 +4,11 @@ MKELF_OBJS=3D$(OBJDIR)/main/mkelfImage.o \<br>
<br>
=C2=A0 $(OBJDIR)/sbin/mkelfImage: $(MKELF_OBJS) $(DEPS)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(MKDIR) -p $(@D)<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 $(HOST_CC) $(HOST_CFLAGS) $(MKELF_OBJS) -o $@ $=
(LIBS)<br>
-+=C2=A0 =C2=A0 =C2=A0 $(CC) $(HOST_CFLAGS) $(MKELF_OBJS) -o $@ $(LIBS)<br>
++=C2=A0 =C2=A0 =C2=A0 $(CC) $(CFLAGS) $(LDFLAGS) $(MKELF_OBJS) -o $@ $(LIB=
S)<br>
<br>
=C2=A0 $(OBJDIR)/main/mkelfImage.o: main/mkelfImage.c include/mkelfImage.h =
$(DEPS)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(MKDIR) -p $(@D)<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 $(HOST_CC) $(HOST_CFLAGS) -c $&lt; -o $@<br>
-+=C2=A0 =C2=A0 =C2=A0 $(CC) $(HOST_CFLAGS) -c $&lt; -o $@<br>
++=C2=A0 =C2=A0 =C2=A0 $(CC) $(CFLAGS) -c $&lt; -o $@<br>
<br>
=C2=A0 $(OBJDIR)/man/man8/mkelfImage.8: main/mkelfImage.man<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(MKDIR) -p $(@D)<br>
+--<br>
+2.8.0<br>
diff --git a/meta/recipes-devtools/mkelfimage/<a href=3D"http://mkelfimage_=
git.bb" rel=3D"noreferrer" target=3D"_blank">mkelfimage_git.bb</a> b/meta/r=
ecipes-devtools/mkelfimage/<a href=3D"http://mkelfimage_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">mkelfimage_git.bb</a><br>
index 92435cd..d7a4429 100644<br>
--- a/meta/recipes-devtools/mkelfimage/<a href=3D"http://mkelfimage_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">mkelfimage_git.bb</a><br>
+++ b/meta/recipes-devtools/mkelfimage/<a href=3D"http://mkelfimage_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">mkelfimage_git.bb</a><br>
@@ -13,8 +13,8 @@ <a href=3D"http://review.coreboot.org/gitweb?p=3Dcoreboot=
.git;a=3Dcommit;h=3D34fc4ab80b507739e258" rel=3D"noreferrer" target=3D"_bla=
nk">http://review.coreboot.org/gitweb?p=3Dcoreboot.git;a=3Dcommit;h=3D34fc4=
ab80b507739e258</a><br>
=C2=A0DEPENDS +=3D &quot;zlib&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://review.coreboot.org/p/coreb=
oot;protocol=3Dhttp" rel=3D"noreferrer" target=3D"_blank">review.coreboot.o=
rg/p/coreboot;protocol=3Dhttp</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://cross-compile.patch=C2=A0 =
=C2=A0\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://cross-compile.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0SRC_URI_append_class-native =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-makefile-to-find-libz.=
patch=C2=A0 =C2=A0\<br>
=C2=A0&quot;<br>
--<br>
2.8.0<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--001a1142b00c40604805337b37e6--
