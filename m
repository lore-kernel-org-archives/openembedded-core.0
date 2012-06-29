Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SkhYc-0004Mu-9p
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 22:12:46 +0200
Received: by eaal1 with SMTP id l1so1529458eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 13:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=YN7u+HCytIxGaHB0Bz10OgKhBF8p61R686LgG94qRBM=;
	b=FZX+3htl/UvT6i9x0iyvxndlafw5JfwjM/KsCEEXcqlm50ZzLk+X0ieQRz13tyFryA
	LzmZ5TLYAgwL84LIpr9pTkxH/KXtVNf5pCknbTwUyMKVxjV3eq879/SPbz5QegqznAdu
	xfQfoS7RKPJL6iIVVsm9nvs2K+o/awIcmHqJar+UCCE0mMcIqKUz5hgnCBraAnZdclvk
	IulHgRKPdyzgCMcxgo7bCOxuO15J/7iJJAKjrbGsCFkpKy6ozr6pcGW+CYQpZrnDGIaR
	jcKzVWZKw4cv14I5hHSS0A8R84g9uHSCwJhjcs2NweNoJI8ODZlU9tl53ZPUKXoZr/ny
	09uw==
MIME-Version: 1.0
Received: by 10.14.119.202 with SMTP id n50mr960245eeh.33.1341000110030; Fri,
	29 Jun 2012 13:01:50 -0700 (PDT)
Received: by 10.14.210.199 with HTTP; Fri, 29 Jun 2012 13:01:49 -0700 (PDT)
In-Reply-To: <5d4f56f916e6ffdfcad97895dd3ba2ecd2ba4354.1340998763.git.dvhart@linux.intel.com>
References: <cover.1340998763.git.dvhart@linux.intel.com>
	<4263ffefaa6f3b0069bc41c0f7578d36717edcfc.1340998763.git.dvhart@linux.intel.com>
	<5d4f56f916e6ffdfcad97895dd3ba2ecd2ba4354.1340998763.git.dvhart@linux.intel.com>
Date: Fri, 29 Jun 2012 13:01:49 -0700
Message-ID: <CAMKF1sqbrVsp_Os9QKooSDcsQmB28fBu+K0W_cXK+BPXFKj28Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Poky <poky@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] kernel: Add kernel headers to kernel-dev package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Jun 2012 20:12:46 -0000
Content-Type: multipart/alternative; boundary=90e6ba61552433be5604c3a1eb94

--90e6ba61552433be5604c3a1eb94
Content-Type: text/plain; charset=UTF-8

On Friday, June 29, 2012, Darren Hart <dvhart@linux.intel.com> wrote:
> [YOCTO #1614]
>
> Add the kernel headers to the kernel-dev package. This packages what was
> already built and kept in sysroots for building modules with bitbake.
> Making this available on the target requires removing some additional
> host binaries.
>
> Move the location to /usr/src/kernel
>
> Before use on the target, the user will need to:
>
>    # cd /usr/src/kernel
>    # make scripts
>
> This renders the kernel-misc recipe empty, so remove it.
>
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> CC: Bruce Ashfield <bruce.ashfield@windriver.com>
> CC: Tom Zanussi <tom.zanussi@intel.com>
> CC: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/kernel.bbclass |   15 +++++++--------
>  meta/conf/bitbake.conf      |    2 +-
>  2 files changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 31e633b..27e0033 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -130,7 +130,7 @@ kernel_do_install() {
>        # Support for external module building - create a minimal copy of
the
>        # kernel source tree.
>        #
> -       kerneldir=${D}/kernel
> +       kerneldir=${D}/usr/src/kernel
>        install -d $kerneldir
>
>        #
> @@ -183,10 +183,11 @@ kernel_do_install() {
>                cp arch/powerpc/lib/crtsavres.o
$kerneldir/arch/powerpc/lib/crtsavres.o
>        fi
>
> -       # Remove the following binaries which cause strip errors
> +       # Remove the following binaries which cause strip or arch QA
errors
>        # during do_package for cross-compiled platforms
>        bin_files="arch/powerpc/boot/addnote arch/powerpc/boot/hack-coff \
> -                  arch/powerpc/boot/mktree"
> +                  arch/powerpc/boot/mktree scripts/kconfig/zconf.tab.o \
> +                  scripts/kconfig/conf.o"
>        for entry in $bin_files; do
>                rm -f $kerneldir/$entry
>        done
> @@ -247,13 +248,11 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
>
>  # kernel-base becomes kernel-${KERNEL_VERSION}
>  # kernel-image becomes kernel-image-${KERNEL_VERISON}
> -PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev
kernel-misc"
> +PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev"
>  FILES = ""
>  FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
> -FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers*
/boot/config*"
> +FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers*
/boot/config* /usr/src/kernel"
>  FILES_kernel-vmlinux = "/boot/vmlinux*"
> -# misc is a package to contain files we need in staging
> -FILES_kernel-misc = "/kernel/include/config /kernel/scripts
/kernel/drivers/crypto /kernel/drivers/media"
>  RDEPENDS_kernel = "kernel-base"
>  # Allow machines to override this dependency if kernel image files are
>  # not wanted in images as standard
> @@ -469,7 +468,7 @@ python populate_packages_prepend () {
>        metapkg = "kernel-modules"
>        d.setVar('ALLOW_EMPTY_' + metapkg, "1")
>        d.setVar('FILES_' + metapkg, "")
> -       blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base',
'kernel-vmlinux', 'kernel-misc' ]
> +       blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base',
'kernel-vmlinux' ]
>        for l in module_deps.values():
>                for i in l:
>                        pkg = module_pattern %
legitimize_package_name(re.match(module_regex,
os.path.basename(i)).group(1))
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 9b26580..9f3abee 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -380,7 +380,7 @@ SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
>  ##################################################################
>
>  OLDEST_KERNEL = "2.6.16"
> -STAGING_KERNEL_DIR = "${STAGING_DIR_HOST}/kernel"
> +STAGING_KERNEL_DIR = "${STAGING_DIR_HOST}/usr/src/kernel-headers"


This should be kernel instead of kernel-headers
>
>  ##################################################################
>  # Specific image creation and rootfs population info.
> --
> 1.7.10.2
>
>

--90e6ba61552433be5604c3a1eb94
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, June 29, 2012, Darren Hart &lt;<a href=3D"mailto:dvhart@=
linux.intel.com">dvhart@linux.intel.com</a>&gt; wrote:<br>&gt; [YOCTO #1614=
]<br>&gt;<br>&gt; Add the kernel headers to the kernel-dev package. This pa=
ckages what was<br>
&gt; already built and kept in sysroots for building modules with bitbake.<=
br>&gt; Making this available on the target requires removing some addition=
al<br>&gt; host binaries.<br>&gt;<br>&gt; Move the location to /usr/src/ker=
nel<br>
&gt;<br>&gt; Before use on the target, the user will need to:<br>&gt;<br>&g=
t; =C2=A0 =C2=A0# cd /usr/src/kernel<br>&gt; =C2=A0 =C2=A0# make scripts<br=
>&gt;<br>&gt; This renders the kernel-misc recipe empty, so remove it.<br>&=
gt;<br>&gt; Signed-off-by: Darren Hart &lt;<a href=3D"mailto:dvhart@linux.i=
ntel.com">dvhart@linux.intel.com</a>&gt;<br>
&gt; CC: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@windriver.com"=
>bruce.ashfield@windriver.com</a>&gt;<br>&gt; CC: Tom Zanussi &lt;<a href=
=3D"mailto:tom.zanussi@intel.com">tom.zanussi@intel.com</a>&gt;<br>&gt; CC:=
 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&=
gt;<br>
&gt; ---<br>&gt; =C2=A0meta/classes/kernel.bbclass | =C2=A0 15 +++++++-----=
---<br>&gt; =C2=A0meta/conf/bitbake.conf =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=
=A02 +-<br>&gt; =C2=A02 files changed, 8 insertions(+), 9 deletions(-)<br>&=
gt;<br>&gt; diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.=
bbclass<br>
&gt; index 31e633b..27e0033 100644<br>&gt; --- a/meta/classes/kernel.bbclas=
s<br>&gt; +++ b/meta/classes/kernel.bbclass<br>&gt; @@ -130,7 +130,7 @@ ker=
nel_do_install() {<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0# Support for externa=
l module building - create a minimal copy of the<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0# kernel source tree.<br>&gt; =C2=A0 =C2=A0=
 =C2=A0 =C2=A0#<br>&gt; - =C2=A0 =C2=A0 =C2=A0 kerneldir=3D${D}/kernel<br>&=
gt; + =C2=A0 =C2=A0 =C2=A0 kerneldir=3D${D}/usr/src/kernel<br>&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0install -d $kerneldir<br>&gt;<br>&gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0#<br>&gt; @@ -183,10 +183,11 @@ kernel_do_install() {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp arch/powerpc=
/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o<br>&gt; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0fi<br>&gt;<br>&gt; - =C2=A0 =C2=A0 =C2=A0 # Remove the fol=
lowing binaries which cause strip errors<br>&gt; + =C2=A0 =C2=A0 =C2=A0 # R=
emove the following binaries which cause strip or arch QA errors<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0# during do_package for cross-compiled plat=
forms<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0bin_files=3D&quot;arch/powerpc/boo=
t/addnote arch/powerpc/boot/hack-coff \<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arch/powerpc/boot/mktree&quot;<br>&gt=
; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arch/powe=
rpc/boot/mktree scripts/kconfig/zconf.tab.o \<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0script=
s/kconfig/conf.o&quot;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0for entry in $bin=
_files; do<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r=
m -f $kerneldir/$entry<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>&gt; @@ -=
247,13 +248,11 @@ EXPORT_FUNCTIONS do_compile do_install do_configure<br>
&gt;<br>&gt; =C2=A0# kernel-base becomes kernel-${KERNEL_VERSION}<br>&gt; =
=C2=A0# kernel-image becomes kernel-image-${KERNEL_VERISON}<br>&gt; -PACKAG=
ES =3D &quot;kernel kernel-base kernel-vmlinux kernel-image kernel-dev kern=
el-misc&quot;<br>
&gt; +PACKAGES =3D &quot;kernel kernel-base kernel-vmlinux kernel-image ker=
nel-dev&quot;<br>&gt; =C2=A0FILES =3D &quot;&quot;<br>&gt; =C2=A0FILES_kern=
el-image =3D &quot;/boot/${KERNEL_IMAGETYPE}*&quot;<br>&gt; -FILES_kernel-d=
ev =3D &quot;/boot/System.map* /boot/Module.symvers* /boot/config*&quot;<br=
>
&gt; +FILES_kernel-dev =3D &quot;/boot/System.map* /boot/Module.symvers* /b=
oot/config* /usr/src/kernel&quot;<br>&gt; =C2=A0FILES_kernel-vmlinux =3D &q=
uot;/boot/vmlinux*&quot;<br>&gt; -# misc is a package to contain files we n=
eed in staging<br>
&gt; -FILES_kernel-misc =3D &quot;/kernel/include/config /kernel/scripts /k=
ernel/drivers/crypto /kernel/drivers/media&quot;<br>&gt; =C2=A0RDEPENDS_ker=
nel =3D &quot;kernel-base&quot;<br>&gt; =C2=A0# Allow machines to override =
this dependency if kernel image files are<br>
&gt; =C2=A0# not wanted in images as standard<br>&gt; @@ -469,7 +468,7 @@ p=
ython populate_packages_prepend () {<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0met=
apkg =3D &quot;kernel-modules&quot;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0d.se=
tVar(&#39;ALLOW_EMPTY_&#39; + metapkg, &quot;1&quot;)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&#39;FILES_&#39; + metapkg, &quot;=
&quot;)<br>&gt; - =C2=A0 =C2=A0 =C2=A0 blacklist =3D [ &#39;kernel-dev&#39;=
, &#39;kernel-image&#39;, &#39;kernel-base&#39;, &#39;kernel-vmlinux&#39;, =
&#39;kernel-misc&#39; ]<br>&gt; + =C2=A0 =C2=A0 =C2=A0 blacklist =3D [ &#39=
;kernel-dev&#39;, &#39;kernel-image&#39;, &#39;kernel-base&#39;, &#39;kerne=
l-vmlinux&#39; ]<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0for l in module_deps.values():<br>&gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for i in l:<br>&gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0pkg =3D module_pattern % legitimize_package_name(re.match(module_rege=
x, os.path.basename(i)).group(1))<br>&gt; diff --git a/meta/conf/bitbake.co=
nf b/meta/conf/bitbake.conf<br>
&gt; index 9b26580..9f3abee 100644<br>&gt; --- a/meta/conf/bitbake.conf<br>=
&gt; +++ b/meta/conf/bitbake.conf<br>&gt; @@ -380,7 +380,7 @@ SDKPATHNATIVE=
 =3D &quot;${SDKPATH}/sysroots/${SDK_SYS}&quot;<br>&gt; =C2=A0#############=
#####################################################<br>
&gt;<br>&gt; =C2=A0OLDEST_KERNEL =3D &quot;2.6.16&quot;<br>&gt; -STAGING_KE=
RNEL_DIR =3D &quot;${STAGING_DIR_HOST}/kernel&quot;<br>&gt; +STAGING_KERNEL=
_DIR =3D &quot;${STAGING_DIR_HOST}/usr/src/kernel-headers&quot;<br><br><br>=
This should be kernel instead of kernel-headers<br>
&gt;<br>&gt; =C2=A0########################################################=
##########<br>&gt; =C2=A0# Specific image creation and rootfs population in=
fo.<br>&gt; --<br>&gt; 1.7.10.2<br>&gt;<br>&gt;

--90e6ba61552433be5604c3a1eb94--
