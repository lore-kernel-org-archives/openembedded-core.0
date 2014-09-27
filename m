Return-Path: <raj.khem@gmail.com>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id A7F9265F77
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Sep 2014 22:23:33 +0000 (UTC)
Received: by mail-ob0-f178.google.com with SMTP id uy5so665874obc.37
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Sep 2014 15:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ouF5qdkv9NWyfk7NTXCekJweElpqHc++iw7akqlZV7w=;
	b=Cv6zDrrvJEguZCPvbvJO+f5pUQORTHaMADFJeiRa1fU3BGUV97PWwUb2oGIwuGpLwd
	b9Wu+tJqMtEjVR//aySnAB19cgZPxAJoZXEU/xXu1BU4SrcreKuGZzbsyaT1sAM3St2K
	ckQP5n++oD5gzJrtG5Wt9skoRdH/OM4zbA+OTjRUg19h65Go3vyPY/KOt4GVuhB6hJCl
	2D9Il+AG/AfhPjRFgq+aHMBpGlcBauVNyJVInWr7F7EE4ShojbhMs51D2357sFnfsLlt
	HHhJ1yCrGmpZBe8mhVmiU7QQbd/cAjJZeFyyMGe6XFlCEELSxFiWeZyXhMIviNg7y8aC
	uWaA==
MIME-Version: 1.0
X-Received: by 10.182.142.67 with SMTP id ru3mr30713469obb.15.1411856612004;
	Sat, 27 Sep 2014 15:23:32 -0700 (PDT)
Received: by 10.202.95.213 with HTTP; Sat, 27 Sep 2014 15:23:31 -0700 (PDT)
In-Reply-To: <1411464016-8068-1-git-send-email-ting.liu@freescale.com>
References: <1411464016-8068-1-git-send-email-ting.liu@freescale.com>
Date: Sat, 27 Sep 2014 15:23:31 -0700
Message-ID: <CAMKF1srPBSa+9JYs2kPEvAjEht-=vSwEoPq8VCErauYgk32Rog@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "ting.liu@freescale.com" <ting.liu@freescale.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] valgrind: pass -maltivec only if it supported
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
X-List-Received-Date: Sat, 27 Sep 2014 22:23:41 -0000
Content-Type: multipart/alternative; boundary=001a11c2ecead51cb80504137bcf

--001a11c2ecead51cb80504137bcf
Content-Type: text/plain; charset=UTF-8

On Tuesday, September 23, 2014, <ting.liu@freescale.com> wrote:

> From: Ting Liu <ting.liu@freescale.com <javascript:;>>
>
> none/tests/ppc64/Makefile.am (and ppc32, too) passes the flag -maltivec
> unconditionally. Build will fail if Altivec not supported. add the flag
> only if HAS_ALTIVEC defined.
>
>
Why would you use altivec abi without altivec being found. Cover that in
checks too please

> Reference:
> see https://bugs.kde.org/show_bug.cgi?id=338731
>
> Signed-off-by: Ting Liu <ting.liu@freescale.com <javascript:;>>
> ---
>  .../pass-maltivec-only-if-it-supported.patch       | 68
> ++++++++++++++++++++++
>  meta/recipes-devtools/valgrind/valgrind_3.9.0.bb   |  1 +
>  2 files changed, 69 insertions(+)
>  create mode 100644
> meta/recipes-devtools/valgrind/valgrind/pass-maltivec-only-if-it-supported.patch
>
> diff --git
> a/meta/recipes-devtools/valgrind/valgrind/pass-maltivec-only-if-it-supported.patch
> b/meta/recipes-devtools/valgrind/valgrind/pass-maltivec-only-if-it-supported.patch
> new file mode 100644
> index 0000000..3781466
> --- /dev/null
> +++
> b/meta/recipes-devtools/valgrind/valgrind/pass-maltivec-only-if-it-supported.patch
> @@ -0,0 +1,68 @@
> +Upstream-status: pending
> +
> +pass -maltivec only if it supported
> +
> +none/tests/ppc64/Makefile.am (and ppc32, too) passes the flag -maltivec
> +unconditionally. Build will fail if Altivec not supported. add the flag
> +only if HAS_ALTIVEC defined.
> +
> +Reference:
> +see https://bugs.kde.org/show_bug.cgi?id=338731
> +
> +Index: none/tests/ppc32/Makefile.am
> +===================================================================
> +--- a/none/tests/ppc32/Makefile.am     (revision 14477)
> ++++ b/none/tests/ppc32/Makefile.am     (working copy)
> +@@ -72,8 +72,10 @@
> + allexec_CFLAGS                = $(AM_CFLAGS) @FLAG_W_NO_NONNULL@
> +
> + if HAS_ALTIVEC
> ++BUILD_FLAG_ALTIVEC = -maltivec
> + ALTIVEC_FLAG = -DHAS_ALTIVEC
> + else
> ++BUILD_FLAG_ALTIVEC =
> + ALTIVEC_FLAG =
> + endif
> +
> +@@ -101,11 +103,11 @@
> + ISA_2_07_FLAG =
> + endif
> +
> +-jm_insns_CFLAGS = $(AM_CFLAGS) -Winline -Wall -O -g -mregnames -maltivec
> \
> +-                      @FLAG_M32@ $(ALTIVEC_FLAG)
> ++jm_insns_CFLAGS = $(AM_CFLAGS) -Winline -Wall -O -g -mregnames \
> ++                      @FLAG_M32@ $(ALTIVEC_FLAG) $(BUILD_FLAG_ALTIVEC)
> +
> +-testVMX_CFLAGS  = $(AM_CFLAGS) -O -g -Wall -maltivec -mabi=altivec
> -DALTIVEC \
> +-                      -DGCC_COMPILER @FLAG_M32@
> ++testVMX_CFLAGS  = $(AM_CFLAGS) -O -g -Wall -mabi=altivec -DALTIVEC \
> ++                      -DGCC_COMPILER @FLAG_M32@  $(BUILD_FLAG_ALTIVEC)
> +
> + test_isa_2_06_part1_CFLAGS = $(AM_CFLAGS) -Winline -Wall -O -g
> -mregnames $(VSX_FLAG) \
> +                       @FLAG_M32@ $(ALTIVEC_FLAG) $(BUILD_FLAG_VSX)
> +Index: none/tests/ppc64/Makefile.am
> +===================================================================
> +--- a/none/tests/ppc64/Makefile.am     (revision 14477)
> ++++ b/none/tests/ppc64/Makefile.am     (working copy)
> +@@ -50,8 +50,10 @@
> + allexec_CFLAGS                = $(AM_CFLAGS) @FLAG_W_NO_NONNULL@
> +
> + if HAS_ALTIVEC
> ++BUILD_FLAG_ALTIVEC = -maltivec
> + ALTIVEC_FLAG = -DHAS_ALTIVEC
> + else
> ++BUILD_FLAG_ALTIVEC =
> + ALTIVEC_FLAG =
> + endif
> +
> +@@ -88,8 +90,8 @@
> + test_isa_2_06_part3_CFLAGS = $(AM_CFLAGS) -Winline -Wall -O -g
> -mregnames $(VSX_FLAG) \
> +                       @FLAG_M64@ $(ALTIVEC_FLAG) $(BUILD_FLAG_VSX)
> +
> +-jm_insns_CFLAGS = $(AM_CFLAGS) -Winline -Wall -O -g -mregnames -maltivec
> \
> +-                      @FLAG_M64@ $(ALTIVEC_FLAG)
> ++jm_insns_CFLAGS = $(AM_CFLAGS) -Winline -Wall -O -g -mregnames \
> ++                      @FLAG_M64@ $(ALTIVEC_FLAG) $(BUILD_FLAG_ALTIVEC)
> +
> + test_dfp1_CFLAGS = $(AM_CFLAGS) -Winline -Wall -O -g -mregnames
> $(DFP_FLAG) \
> +                       @FLAG_M64@ $(BUILD_FLAGS_DFP)
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
> b/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
> index c415e77..58bb9eb 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
> @@ -19,6 +19,7 @@ SRC_URI = "
> http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
>             file://force-nostabs.patch \
>             file://remove-arm-variant-specific.patch \
>             file://remove-ppc-tests-failing-build.patch \
> +           file://pass-maltivec-only-if-it-supported.patch \
>             file://add-ptest.patch \
>             file://run-ptest \
>            "
> --
> 1.8.3.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org <javascript:;>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11c2ecead51cb80504137bcf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, September 23, 2014,  &lt;<a href=3D"mailto:ting.liu@fre=
escale.com">ting.liu@freescale.com</a>&gt; wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">From: Ting Liu &lt;<a href=3D"javascript:;" onclick=3D"_e(event, &=
#39;cvml&#39;, &#39;ting.liu@freescale.com&#39;)">ting.liu@freescale.com</a=
>&gt;<br>
<br>
none/tests/ppc64/Makefile.am (and ppc32, too) passes the flag -maltivec<br>
unconditionally. Build will fail if Altivec not supported. add the flag<br>
only if HAS_ALTIVEC defined.<br>
<br></blockquote><div><br></div><div>Why would you use altivec abi without =
altivec being found. Cover that in checks too please=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">
Reference:<br>
see <a href=3D"https://bugs.kde.org/show_bug.cgi?id=3D338731" target=3D"_bl=
ank">https://bugs.kde.org/show_bug.cgi?id=3D338731</a><br>
<br>
Signed-off-by: Ting Liu &lt;<a href=3D"javascript:;" onclick=3D"_e(event, &=
#39;cvml&#39;, &#39;ting.liu@freescale.com&#39;)">ting.liu@freescale.com</a=
>&gt;<br>
---<br>
=C2=A0.../pass-maltivec-only-if-it-supported.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 68 ++++++++++++++++++++++<br>
=C2=A0meta/recipes-devtools/valgrind/<a href=3D"http://valgrind_3.9.0.bb" t=
arget=3D"_blank">valgrind_3.9.0.bb</a>=C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 69 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/valgrind/valgrind/pass-malti=
vec-only-if-it-supported.patch<br>
<br>
diff --git a/meta/recipes-devtools/valgrind/valgrind/pass-maltivec-only-if-=
it-supported.patch b/meta/recipes-devtools/valgrind/valgrind/pass-maltivec-=
only-if-it-supported.patch<br>
new file mode 100644<br>
index 0000000..3781466<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/valgrind/valgrind/pass-maltivec-only-if-it-supp=
orted.patch<br>
@@ -0,0 +1,68 @@<br>
+Upstream-status: pending<br>
+<br>
+pass -maltivec only if it supported<br>
+<br>
+none/tests/ppc64/Makefile.am (and ppc32, too) passes the flag -maltivec<br=
>
+unconditionally. Build will fail if Altivec not supported. add the flag<br=
>
+only if HAS_ALTIVEC defined.<br>
+<br>
+Reference:<br>
+see <a href=3D"https://bugs.kde.org/show_bug.cgi?id=3D338731" target=3D"_b=
lank">https://bugs.kde.org/show_bug.cgi?id=3D338731</a><br>
+<br>
+Index: none/tests/ppc32/Makefile.am<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- a/none/tests/ppc32/Makefile.am=C2=A0 =C2=A0 =C2=A0(revision 14477)<br>
++++ b/none/tests/ppc32/Makefile.am=C2=A0 =C2=A0 =C2=A0(working copy)<br>
+@@ -72,8 +72,10 @@<br>
+ allexec_CFLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 $(AM_CFLAGS) @FLAG_W_NO_NONNULL@<br>
+<br>
+ if HAS_ALTIVEC<br>
++BUILD_FLAG_ALTIVEC =3D -maltivec<br>
+ ALTIVEC_FLAG =3D -DHAS_ALTIVEC<br>
+ else<br>
++BUILD_FLAG_ALTIVEC =3D<br>
+ ALTIVEC_FLAG =3D<br>
+ endif<br>
+<br>
+@@ -101,11 +103,11 @@<br>
+ ISA_2_07_FLAG =3D<br>
+ endif<br>
+<br>
+-jm_insns_CFLAGS =3D $(AM_CFLAGS) -Winline -Wall -O -g -mregnames -maltive=
c \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @FLAG_M32@ $(ALTIVEC_FLAG)<br>
++jm_insns_CFLAGS =3D $(AM_CFLAGS) -Winline -Wall -O -g -mregnames \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @FLAG_M32@ $(ALTIVEC_FLAG) $(BUILD_FLAG_ALTIVEC)<br>
+<br>
+-testVMX_CFLAGS=C2=A0 =3D $(AM_CFLAGS) -O -g -Wall -maltivec -mabi=3Daltiv=
ec -DALTIVEC \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -DGCC_COMPILER @FLAG_M32@<br>
++testVMX_CFLAGS=C2=A0 =3D $(AM_CFLAGS) -O -g -Wall -mabi=3Daltivec -DALTIV=
EC \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -DGCC_COMPILER @FLAG_M32@=C2=A0 $(BUILD_FLAG_ALTIVEC)<br>
+<br>
+ test_isa_2_06_part1_CFLAGS =3D $(AM_CFLAGS) -Winline -Wall -O -g -mregnam=
es $(VSX_FLAG) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0@FLAG_M32@ $(ALTIVEC_FLAG) $(BUILD_FLAG_VSX)<br>
+Index: none/tests/ppc64/Makefile.am<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- a/none/tests/ppc64/Makefile.am=C2=A0 =C2=A0 =C2=A0(revision 14477)<br>
++++ b/none/tests/ppc64/Makefile.am=C2=A0 =C2=A0 =C2=A0(working copy)<br>
+@@ -50,8 +50,10 @@<br>
+ allexec_CFLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 $(AM_CFLAGS) @FLAG_W_NO_NONNULL@<br>
+<br>
+ if HAS_ALTIVEC<br>
++BUILD_FLAG_ALTIVEC =3D -maltivec<br>
+ ALTIVEC_FLAG =3D -DHAS_ALTIVEC<br>
+ else<br>
++BUILD_FLAG_ALTIVEC =3D<br>
+ ALTIVEC_FLAG =3D<br>
+ endif<br>
+<br>
+@@ -88,8 +90,8 @@<br>
+ test_isa_2_06_part3_CFLAGS =3D $(AM_CFLAGS) -Winline -Wall -O -g -mregnam=
es $(VSX_FLAG) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0@FLAG_M64@ $(ALTIVEC_FLAG) $(BUILD_FLAG_VSX)<br>
+<br>
+-jm_insns_CFLAGS =3D $(AM_CFLAGS) -Winline -Wall -O -g -mregnames -maltive=
c \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @FLAG_M64@ $(ALTIVEC_FLAG)<br>
++jm_insns_CFLAGS =3D $(AM_CFLAGS) -Winline -Wall -O -g -mregnames \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @FLAG_M64@ $(ALTIVEC_FLAG) $(BUILD_FLAG_ALTIVEC)<br>
+<br>
+ test_dfp1_CFLAGS =3D $(AM_CFLAGS) -Winline -Wall -O -g -mregnames $(DFP_F=
LAG) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0@FLAG_M64@ $(BUILD_FLAGS_DFP)<br>
diff --git a/meta/recipes-devtools/valgrind/<a href=3D"http://valgrind_3.9.=
0.bb" target=3D"_blank">valgrind_3.9.0.bb</a> b/meta/recipes-devtools/valgr=
ind/<a href=3D"http://valgrind_3.9.0.bb" target=3D"_blank">valgrind_3.9.0.b=
b</a><br>
index c415e77..58bb9eb 100644<br>
--- a/meta/recipes-devtools/valgrind/<a href=3D"http://valgrind_3.9.0.bb" t=
arget=3D"_blank">valgrind_3.9.0.bb</a><br>
+++ b/meta/recipes-devtools/valgrind/<a href=3D"http://valgrind_3.9.0.bb" t=
arget=3D"_blank">valgrind_3.9.0.bb</a><br>
@@ -19,6 +19,7 @@ SRC_URI =3D &quot;<a href=3D"http://www.valgrind.org/down=
loads/valgrind-${PV}.tar.bz2" target=3D"_blank">http://www.valgrind.org/dow=
nloads/valgrind-${PV}.tar.bz2</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://force-nostabs.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://remove-arm-variant-specifi=
c.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://remove-ppc-tests-failing-b=
uild.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://pass-maltivec-only-if-it-s=
upported.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://add-ptest.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
--<br>
1.8.3.2<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"javascript:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;Openembe=
dded-core@lists.openembedded.org&#39;)">Openembedded-core@lists.openembedde=
d.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</blockquote>

--001a11c2ecead51cb80504137bcf--
