Return-Path: <raj.khem@gmail.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7AAB1610FB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 04:56:24 +0000 (UTC)
Received: by mail-qc0-f171.google.com with SMTP id x19so1721266qcw.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Sep 2013 21:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=FB8Qk8fTF3VoxsAbVEpAVPhhQN4m7zaYnsOrVU9JuQA=;
	b=bDAyRg1AgBLBI21e9g2aXRtKu2LR1gsv5a6xmax8vYEQFSYYGXQS2Vmnatp4P/N2Tt
	aw90I4e+EypZlTWz1zRYpArCtoz+QAGzSSJm6T2eF53XkjU8Qn9n7fDEigrXRyH0Wr7E
	cU6nR9UW3P25LthHo240x5B3WRY1nRS52V6rw81PwZW648BTDoEebryx+uady3NPILz9
	LvX3liwHhzVDVUu9GpvzXUpMYwUwv/iMAU/S0OKw/1cflBv3AFi1S4DbKoygVc+th+2T
	lXRRcPvrGcZbEvQ5nYClRpHiy3N0WQWkg4Do52XQiMQ0UHulAC3OyFTxg4pNYNDBYssn
	KV2g==
MIME-Version: 1.0
X-Received: by 10.224.2.138 with SMTP id 10mr21430696qaj.35.1379912185807;
	Sun, 22 Sep 2013 21:56:25 -0700 (PDT)
Received: by 10.224.10.201 with HTTP; Sun, 22 Sep 2013 21:56:25 -0700 (PDT)
In-Reply-To: <1379847275.18603.207.camel@ted>
References: <1379847275.18603.207.camel@ted>
Date: Sun, 22 Sep 2013 21:56:25 -0700
Message-ID: <CAMKF1so9uOihaFbQnj+yEJ0PGuYWrpXivgyoyMsN0b+6WhVDnQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-target: Fix libatomic dependency tracking issues
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
X-List-Received-Date: Mon, 23 Sep 2013 04:56:25 -0000
Content-Type: multipart/alternative; boundary=001a11c3cbcaa8070704e705d704

--001a11c3cbcaa8070704e705d704
Content-Type: text/plain; charset=UTF-8

On Sunday, September 22, 2013, Richard Purdie wrote:

> The --enable-dependency-tracking option was added to workaround build
> issues in libatomic. This fixes that build problem properly and removes
> the flag since the dependency tracking code appears to be full of races
> which are much deeper and harder to fix.
>
> As per the automake manual, dependency tracking is only useful and worth
> the build performance cost if you are doing more than one compile of the
> same
> source code which in most cases we are not so this is a good thing anyway.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org<javascript:;>
> >


I agree we should apply this patch via recipes and also submit to gcc
upstream as well

---
> diff --git
> a/meta/recipes-devtools/gcc/gcc-4.8/0046-libatomic-deptracking.patch
> b/meta/recipes-devtools/gcc/gcc-4.8/0046-libatomic-deptracking.patch
> new file mode 100644
> index 0000000..6ea4f42
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.8/0046-libatomic-deptracking.patch
> @@ -0,0 +1,41 @@
> +gcc 4.8 won't build with --disable-dependency-tracking since the *.Ppo
> files
> +don't get created unless --enable-dependency-tracking is true.
> +
> +This patch ensures we only use those compiler options when its enabled.
> +
> +Upstream-Status: Submitted
> +
> +(Problem was already reported upstream, attached this patch there
> +http://gcc.gnu.org/bugzilla/show_bug.cgi?id=55930)
> +
> +RP
> +2012/09/22
> +
> +Index: gcc-4.8.1/libatomic/Makefile.am
> +===================================================================
> +--- gcc-4.8.1.orig/libatomic/Makefile.am       2013-01-14
> 18:16:23.000000000 +0000
> ++++ gcc-4.8.1/libatomic/Makefile.am    2013-09-22 10:38:18.904064750 +0000
> +@@ -100,7 +100,8 @@
> + IFUNC_DEF     = -DIFUNC_ALT=$(PAT_S)
> + IFUNC_OPT     = $(word $(PAT_S),$(IFUNC_OPTIONS))
> +
> +-M_DEPS                = -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
> ++@AMDEP_TRUE@M_DEPS            = -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
> ++@AMDEP_FALSE@M_DEPS           =
> + M_SIZE                = -DN=$(PAT_N)
> + M_IFUNC               = $(if $(PAT_S),$(IFUNC_DEF) $(IFUNC_OPT))
> + M_FILE                = $(PAT_BASE)_n.c
> +Index: gcc-4.8.1/libatomic/Makefile.in
> +===================================================================
> +--- gcc-4.8.1.orig/libatomic/Makefile.in       2013-05-31
> 09:09:26.000000000 +0000
> ++++ gcc-4.8.1/libatomic/Makefile.in    2013-09-22 10:40:42.520059917 +0000
> +@@ -298,7 +298,8 @@
> + PAT_S = $(word 3,$(PAT_SPLIT))
> + IFUNC_DEF = -DIFUNC_ALT=$(PAT_S)
> + IFUNC_OPT = $(word $(PAT_S),$(IFUNC_OPTIONS))
> +-M_DEPS = -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
> ++@AMDEP_TRUE@M_DEPS = -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
> ++@AMDEP_FALSE@M_DEPS =
> + M_SIZE = -DN=$(PAT_N)
> + M_IFUNC = $(if $(PAT_S),$(IFUNC_DEF) $(IFUNC_OPT))
> + M_FILE = $(PAT_BASE)_n.c
> diff --git a/meta/recipes-devtools/gcc/gcc-target.inc
> b/meta/recipes-devtools/gcc/gcc-target.inc
> index c7e3e16..e1179ac 100644
> --- a/meta/recipes-devtools/gcc/gcc-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-target.inc
> @@ -5,7 +5,7 @@ EXTRA_OECONF_PATHS = " \
>      --with-sysroot=/ \
>      --with-build-sysroot=${STAGING_DIR_TARGET} \
>
>  --with-native-system-header-dir=${STAGING_DIR_TARGET}${target_includedir} \
> -    --with-gxx-include-dir=${includedir}/c++/
> --enable-dependency-tracking"
> +    --with-gxx-include-dir=${includedir}/c++/"
>
>  ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR} -I${B}/gcc/include/ "
>
>
>
>

--001a11c3cbcaa8070704e705d704
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Sunday, September 22, 2013, Richard Purdie  wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">The --enable-dependency-tracking option was added to w=
orkaround build<br>

issues in libatomic. This fixes that build problem properly and removes<br>
the flag since the dependency tracking code appears to be full of races<br>
which are much deeper and harder to fix.<br>
<br>
As per the automake manual, dependency tracking is only useful and worth<br=
>
the build performance cost if you are doing more than one compile of the sa=
me<br>
source code which in most cases we are not so this is a good thing anyway.<=
br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"javascript:;" onclick=3D"_e(ev=
ent, &#39;cvml&#39;, &#39;richard.purdie@linuxfoundation.org&#39;)">richard=
.purdie@linuxfoundation.org</a>&gt;</blockquote><div><br></div><div>I agree=
 we should apply this patch via recipes and also submit to gcc upstream as =
well</div>
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">
---<br>
diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0046-libatomic-deptracking.p=
atch b/meta/recipes-devtools/gcc/gcc-4.8/0046-libatomic-deptracking.patch<b=
r>
new file mode 100644<br>
index 0000000..6ea4f42<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/gcc/gcc-4.8/0046-libatomic-deptracking.patch<br=
>
@@ -0,0 +1,41 @@<br>
+gcc 4.8 won&#39;t build with --disable-dependency-tracking since the *.Ppo=
 files<br>
+don&#39;t get created unless --enable-dependency-tracking is true.<br>
+<br>
+This patch ensures we only use those compiler options when its enabled.<br=
>
+<br>
+Upstream-Status: Submitted<br>
+<br>
+(Problem was already reported upstream, attached this patch there<br>
+<a href=3D"http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D55930" target=3D"=
_blank">http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D55930</a>)<br>
+<br>
+RP<br>
+2012/09/22<br>
+<br>
+Index: gcc-4.8.1/libatomic/Makefile.am<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gcc-4.8.1.orig/libatomic/Makefile.am =C2=A0 =C2=A0 =C2=A0 2013-01-14 1=
8:16:23.000000000 +0000<br>
++++ gcc-4.8.1/libatomic/Makefile.am =C2=A0 =C2=A02013-09-22 10:38:18.90406=
4750 +0000<br>
+@@ -100,7 +100,8 @@<br>
+ IFUNC_DEF =C2=A0 =C2=A0 =3D -DIFUNC_ALT=3D$(PAT_S)<br>
+ IFUNC_OPT =C2=A0 =C2=A0 =3D $(word $(PAT_S),$(IFUNC_OPTIONS))<br>
+<br>
+-M_DEPS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D -MT $@ =
-MD -MP -MF $(DEPDIR)/$(@F).Ppo<br>
++@AMDEP_TRUE@M_DEPS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D -MT $@ -M=
D -MP -MF $(DEPDIR)/$(@F).Ppo<br>
++@AMDEP_FALSE@M_DEPS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
+ M_SIZE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D -DN=3D$=
(PAT_N)<br>
+ M_IFUNC =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D $(if $(PAT_S=
),$(IFUNC_DEF) $(IFUNC_OPT))<br>
+ M_FILE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D $(PAT_B=
ASE)_n.c<br>
+Index: gcc-4.8.1/libatomic/Makefile.in<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gcc-4.8.1.orig/libatomic/Makefile.in =C2=A0 =C2=A0 =C2=A0 2013-05-31 0=
9:09:26.000000000 +0000<br>
++++ gcc-4.8.1/libatomic/Makefile.in =C2=A0 =C2=A02013-09-22 10:40:42.52005=
9917 +0000<br>
+@@ -298,7 +298,8 @@<br>
+ PAT_S =3D $(word 3,$(PAT_SPLIT))<br>
+ IFUNC_DEF =3D -DIFUNC_ALT=3D$(PAT_S)<br>
+ IFUNC_OPT =3D $(word $(PAT_S),$(IFUNC_OPTIONS))<br>
+-M_DEPS =3D -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo<br>
++@AMDEP_TRUE@M_DEPS =3D -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo<br>
++@AMDEP_FALSE@M_DEPS =3D<br>
+ M_SIZE =3D -DN=3D$(PAT_N)<br>
+ M_IFUNC =3D $(if $(PAT_S),$(IFUNC_DEF) $(IFUNC_OPT))<br>
+ M_FILE =3D $(PAT_BASE)_n.c<br>
diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtoo=
ls/gcc/gcc-target.inc<br>
index c7e3e16..e1179ac 100644<br>
--- a/meta/recipes-devtools/gcc/gcc-target.inc<br>
+++ b/meta/recipes-devtools/gcc/gcc-target.inc<br>
@@ -5,7 +5,7 @@ EXTRA_OECONF_PATHS =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0--with-sysroot=3D/ \<br>
=C2=A0 =C2=A0 =C2=A0--with-build-sysroot=3D${STAGING_DIR_TARGET} \<br>
=C2=A0 =C2=A0 =C2=A0--with-native-system-header-dir=3D${STAGING_DIR_TARGET}=
${target_includedir} \<br>
- =C2=A0 =C2=A0--with-gxx-include-dir=3D${includedir}/c++/ --enable-depende=
ncy-tracking&quot;<br>
+ =C2=A0 =C2=A0--with-gxx-include-dir=3D${includedir}/c++/&quot;<br>
<br>
=C2=A0ARCH_FLAGS_FOR_TARGET +=3D &quot;-isystem${STAGING_INCDIR} -I${B}/gcc=
/include/ &quot;<br>
<br>
<br>
<br>
</blockquote>

--001a11c3cbcaa8070704e705d704--
