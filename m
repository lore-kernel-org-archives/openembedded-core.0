Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 259A973D46
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 21:35:45 +0000 (UTC)
Received: by ioll68 with SMTP id l68so136857212iol.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Nov 2015 13:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=aC8vj8VxrGWNJbU0ceYoLUZXx5xVyveoEkYHAwwuFn0=;
	b=nTDzJO3WLxptAeujbgYB+57A6lPlfIaSRb9bRM3XJZEpQlzVvLGtuDCp1Xq27j9OHq
	uumj1rttyoHSuU2MegAtP7jWInfrveB2C878jwK5p0/JYJ+wRkR5Xj+EvbncQ+UO39JM
	hevm/dzKzCL7XNTTGjaXQgEjg1B/buK7vkuC9tdhBEigfz08j5wALGm0d0GHBtNjcWVt
	84KONLxiZ/f0SI3zYZX8AYvn+efcfLuhPtF14fsNLL+BvQqgtUD/PSGE9QFYFMSyH6jS
	aQeSJPOJxtj5vtoHREnCRRMd3Y7iAi3ZGpe7CzCdLPwS7w1kqr1ibqF1fhSn7PA/bmSo
	7C1w==
MIME-Version: 1.0
X-Received: by 10.107.137.66 with SMTP id l63mr16806825iod.112.1446845745843; 
	Fri, 06 Nov 2015 13:35:45 -0800 (PST)
Received: by 10.107.38.133 with HTTP; Fri, 6 Nov 2015 13:35:45 -0800 (PST)
Received: by 10.107.38.133 with HTTP; Fri, 6 Nov 2015 13:35:45 -0800 (PST)
In-Reply-To: <1446824182-8839-1-git-send-email-ross.burton@intel.com>
References: <1446824182-8839-1-git-send-email-ross.burton@intel.com>
Date: Fri, 6 Nov 2015 13:35:45 -0800
Message-ID: <CAMKF1soxAD=Yv9e8Y+xLcEso39_N7CkfY=4ud-V6dhMSO27Giw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libaio: don't disable linking to the system libraries
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
X-List-Received-Date: Fri, 06 Nov 2015 21:35:46 -0000
Content-Type: multipart/alternative; boundary=001a113ed43cb9d5050523e6069b

--001a113ed43cb9d5050523e6069b
Content-Type: text/plain; charset=UTF-8

On Nov 6, 2015 7:44 AM, "Ross Burton" <ross.burton@intel.com> wrote:
>
> For some reason that I don't understand (a decade-old attempt at
optimisation?)
> libaio disables linkage to the system libraries.  Enabling fortify means
linking
> to the system libraries, so remove the existing addition of -lc for x86
(the
> problem also happens on at least PPC) and just link to the system
libraries on
> all platforms.
>
> Also remove the sed of src/Makefile as the build not respecting LDFLAGS
has been
> fixed upstream.

It might be due to AS NEEDED becoming default in linker. That now the
positions of command line Argument will matter.

>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../libaio/libaio/system-linkage.patch             | 37
++++++++++++++++++++++
>  meta/recipes-extended/libaio/libaio_0.3.110.bb     |  9 ++----
>  2 files changed, 39 insertions(+), 7 deletions(-)
>  create mode 100644
meta/recipes-extended/libaio/libaio/system-linkage.patch
>
> diff --git a/meta/recipes-extended/libaio/libaio/system-linkage.patch
b/meta/recipes-extended/libaio/libaio/system-linkage.patch
> new file mode 100644
> index 0000000..0b1f475
> --- /dev/null
> +++ b/meta/recipes-extended/libaio/libaio/system-linkage.patch
> @@ -0,0 +1,37 @@
> +From 94bba6880b1f10c6b3bf33a17ac40935d65a81ae Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@intel.com>
> +Date: Fri, 6 Nov 2015 15:19:46 +0000
> +Subject: [PATCH] Don't remove the system libraries and startup files from
> + libaio, as in some build configurations these are required.  For
example,
> + including conf/include/security_flags.inc on PPC results in:
> +
> +io_queue_init.os: In function `io_queue_init':
>
+tmp/work/ppce300c3-poky-linux/libaio/0.3.110-r0/libaio-0.3.110/src/io_queue_init.c:33:
> +undefined reference to `__stack_chk_fail_local'
> +
> +Upstream-Status: Pending
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +---
> + src/Makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/Makefile b/src/Makefile
> +index eadb336..56ab701 100644
> +--- a/src/Makefile
> ++++ b/src/Makefile
> +@@ -3,10 +3,10 @@ includedir=$(prefix)/include
> + libdir=$(prefix)/lib
> +
> + CFLAGS ?= -g -fomit-frame-pointer -O2
> +-CFLAGS += -nostdlib -nostartfiles -Wall -I. -fPIC
> ++CFLAGS += -Wall -I. -fPIC
> + SO_CFLAGS=-shared $(CFLAGS)
> + L_CFLAGS=$(CFLAGS)
> +-LINK_FLAGS=
> ++LINK_FLAGS=$(LDFLAGS)

Isnt this line redundant see the below line adds same

> + LINK_FLAGS+=$(LDFLAGS)
> +
> + soname=libaio.so.1
> +--
> +2.1.4
> +
> diff --git a/meta/recipes-extended/libaio/libaio_0.3.110.bb
b/meta/recipes-extended/libaio/libaio_0.3.110.bb
> index cbe29ce..2adfa0a 100644
> --- a/meta/recipes-extended/libaio/libaio_0.3.110.bb
> +++ b/meta/recipes-extended/libaio/libaio_0.3.110.bb
> @@ -11,18 +11,13 @@ SRC_URI =
"${DEBIAN_MIRROR}/main/liba/libaio/libaio_${PV}.orig.tar.gz \
>             file://destdir.patch \
>             file://libaio_fix_for_x32.patch \
>             file://libaio_fix_for_mips_syscalls.patch \
> -"
> +           file://system-linkage.patch \
> +           "
>
>  SRC_URI[md5sum] = "2a35602e43778383e2f4907a4ca39ab8"
>  SRC_URI[sha256sum] =
"e019028e631725729376250e32b473012f7cb68e1f7275bfc1bbcdd0f8745f7e"
>
>  EXTRA_OEMAKE =+ "prefix=${prefix} includedir=${includedir}
libdir=${libdir}"
> -# Need libc for stack-protector's __stack_chk_fail_local() bounce
function
> -LDFLAGS_append_x86 = " -lc"
> -
> -do_configure () {
> -    sed -i 's#LINK_FLAGS=.*#LINK_FLAGS=$(LDFLAGS)#' src/Makefile
> -}
>
>  do_install () {
>      oe_runmake install DESTDIR=${D}
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a113ed43cb9d5050523e6069b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Nov 6, 2015 7:44 AM, &quot;Ross Burton&quot; &lt;<a href=3D"mailto:ross.=
burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; For some reason that I don&#39;t understand (a decade-old attempt at o=
ptimisation?)<br>
&gt; libaio disables linkage to the system libraries.=C2=A0 Enabling fortif=
y means linking<br>
&gt; to the system libraries, so remove the existing addition of -lc for x8=
6 (the<br>
&gt; problem also happens on at least PPC) and just link to the system libr=
aries on<br>
&gt; all platforms.<br>
&gt;<br>
&gt; Also remove the sed of src/Makefile as the build not respecting LDFLAG=
S has been<br>
&gt; fixed upstream.</p>
<p dir=3D"ltr">It might be due to AS NEEDED becoming default in linker. Tha=
t now the positions of command line Argument will matter.</p>
<p dir=3D"ltr">&gt;<br>
&gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com=
">ross.burton@intel.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0.../libaio/libaio/system-linkage.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 37 ++++++++++++++++++++++<br>
&gt; =C2=A0meta/recipes-extended/libaio/<a href=3D"http://libaio_0.3.110.bb=
">libaio_0.3.110.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 9 ++----<br>
&gt; =C2=A02 files changed, 39 insertions(+), 7 deletions(-)<br>
&gt; =C2=A0create mode 100644 meta/recipes-extended/libaio/libaio/system-li=
nkage.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/libaio/libaio/system-linkage.patch =
b/meta/recipes-extended/libaio/libaio/system-linkage.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..0b1f475<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-extended/libaio/libaio/system-linkage.patch<br>
&gt; @@ -0,0 +1,37 @@<br>
&gt; +From 94bba6880b1f10c6b3bf33a17ac40935d65a81ae Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ross.b=
urton@intel.com</a>&gt;<br>
&gt; +Date: Fri, 6 Nov 2015 15:19:46 +0000<br>
&gt; +Subject: [PATCH] Don&#39;t remove the system libraries and startup fi=
les from<br>
&gt; + libaio, as in some build configurations these are required.=C2=A0 Fo=
r example,<br>
&gt; + including conf/include/security_flags.inc on PPC results in:<br>
&gt; +<br>
&gt; +io_queue_init.os: In function `io_queue_init&#39;:<br>
&gt; +tmp/work/ppce300c3-poky-linux/libaio/0.3.110-r0/libaio-0.3.110/src/io=
_queue_init.c:33:<br>
&gt; +undefined reference to `__stack_chk_fail_local&#39;<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.co=
m">ross.burton@intel.com</a>&gt;<br>
&gt; +---<br>
&gt; + src/Makefile | 4 ++--<br>
&gt; + 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/Makefile b/src/Makefile<br>
&gt; +index eadb336..56ab701 100644<br>
&gt; +--- a/src/Makefile<br>
&gt; ++++ b/src/Makefile<br>
&gt; +@@ -3,10 +3,10 @@ includedir=3D$(prefix)/include<br>
&gt; + libdir=3D$(prefix)/lib<br>
&gt; +<br>
&gt; + CFLAGS ?=3D -g -fomit-frame-pointer -O2<br>
&gt; +-CFLAGS +=3D -nostdlib -nostartfiles -Wall -I. -fPIC<br>
&gt; ++CFLAGS +=3D -Wall -I. -fPIC<br>
&gt; + SO_CFLAGS=3D-shared $(CFLAGS)<br>
&gt; + L_CFLAGS=3D$(CFLAGS)<br>
&gt; +-LINK_FLAGS=3D<br>
&gt; ++LINK_FLAGS=3D$(LDFLAGS)</p>
<p dir=3D"ltr">Isnt this line redundant see the below line adds same</p>
<p dir=3D"ltr">&gt; + LINK_FLAGS+=3D$(LDFLAGS)<br>
&gt; +<br>
&gt; + soname=3Dlibaio.so.1<br>
&gt; +--<br>
&gt; +2.1.4<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-extended/libaio/<a href=3D"http://libaio_0.3=
.110.bb">libaio_0.3.110.bb</a> b/meta/recipes-extended/libaio/<a href=3D"ht=
tp://libaio_0.3.110.bb">libaio_0.3.110.bb</a><br>
&gt; index cbe29ce..2adfa0a 100644<br>
&gt; --- a/meta/recipes-extended/libaio/<a href=3D"http://libaio_0.3.110.bb=
">libaio_0.3.110.bb</a><br>
&gt; +++ b/meta/recipes-extended/libaio/<a href=3D"http://libaio_0.3.110.bb=
">libaio_0.3.110.bb</a><br>
&gt; @@ -11,18 +11,13 @@ SRC_URI =3D &quot;${DEBIAN_MIRROR}/main/liba/libai=
o/libaio_${PV}.orig.tar.gz \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://destdir.patch \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://libaio_fix_for_x32.pa=
tch \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://libaio_fix_for_mips_s=
yscalls.patch \<br>
&gt; -&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://system-linkage.patch =
\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt; =C2=A0SRC_URI[md5sum] =3D &quot;2a35602e43778383e2f4907a4ca39ab8&quot;=
<br>
&gt; =C2=A0SRC_URI[sha256sum] =3D &quot;e019028e631725729376250e32b473012f7=
cb68e1f7275bfc1bbcdd0f8745f7e&quot;<br>
&gt;<br>
&gt; =C2=A0EXTRA_OEMAKE =3D+ &quot;prefix=3D${prefix} includedir=3D${includ=
edir} libdir=3D${libdir}&quot;<br>
&gt; -# Need libc for stack-protector&#39;s __stack_chk_fail_local() bounce=
 function<br>
&gt; -LDFLAGS_append_x86 =3D &quot; -lc&quot;<br>
&gt; -<br>
&gt; -do_configure () {<br>
&gt; -=C2=A0 =C2=A0 sed -i &#39;s#LINK_FLAGS=3D.*#LINK_FLAGS=3D$(LDFLAGS)#&=
#39; src/Makefile<br>
&gt; -}<br>
&gt;<br>
&gt; =C2=A0do_install () {<br>
&gt; =C2=A0 =C2=A0 =C2=A0oe_runmake install DESTDIR=3D${D}<br>
&gt; --<br>
&gt; 2.1.4<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br>
</p>

--001a113ed43cb9d5050523e6069b--
