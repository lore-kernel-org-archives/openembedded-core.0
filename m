Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 513B4757AC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 05:06:01 +0000 (UTC)
Received: by pacgz1 with SMTP id gz1so12003009pac.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 22:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=/DmdpHEkLSc5zr3OLemoXu3KUPoy2MRAqq1p6kgrd9s=;
	b=dEZS5hXZzdQJCFa42UToLGLjG1zVmOG2tK75VTpCrjcvL654yaxLNDQglwz5AKsWac
	HdJAuC1XL8kLQiHq3wjiXICeO8FZWGWsss+uCZr6zsnvi4+2bXA7T3qtljnHiKwriZSr
	IVuOi8aoLytv9XBx3BkgqzQ6DlXJnGRmwmY51Fur/XpGT/bJVAnwuCIx80YuLwc0R/HO
	9h/C1/SD9rrPmbWEBNg3PmklsK9EZWI2a3vXEWmhYXYXexeBv4gis3HYjVzbzFWxzHj1
	4+Smx/QmREjAoE01XmdoINBVjVSBoYBAXBHhvgJuheJVwINgL/603ij29ZDByRxpOaxw
	eelw==
X-Received: by 10.68.243.99 with SMTP id wx3mr4528384pbc.33.1443157561858;
	Thu, 24 Sep 2015 22:06:01 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:38ca:da57:9cc9:505d?
	([2601:646:8601:4580:38ca:da57:9cc9:505d])
	by smtp.gmail.com with ESMTPSA id ce3sm981034pbb.35.2015.09.24.22.06.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 24 Sep 2015 22:06:01 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1443157157-33969-1-git-send-email-raj.khem@gmail.com>
Date: Thu, 24 Sep 2015 22:06:02 -0700
Message-Id: <45BDD3CC-AD3E-4684-9FFD-717933EBC9CF@gmail.com>
References: <1443157157-33969-1-git-send-email-raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.3094)
Subject: Re: [PATCH V2] busybox: Use CC instead of bare LD to be the Linker
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
X-List-Received-Date: Fri, 25 Sep 2015 05:06:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

this is a resend of the very same patch which was send 2-3 weeks ago

> On Sep 24, 2015, at 9:59 PM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> This patch was on mailing list, another patch to make sure -r is not
> passed directly but via -Wl switch is added.
>=20
> This was exposed when using clang and gold linker, clang does not have
> -r switch to do relocatable objects and problem happens specific to OE
> becuase we use LD =3D CC
>=20
> now what happens is that busybox assumes that linker will be called
> directly, and hence sprinkles linkers options in its kbuild system =
which
> aggregate into LDFLAGS, some of these options are happily ignored by =
gcc
> as well but it passes -r options rightly to linker so it all works,
> however when using clang, this falls apart since -r is not known =
option
> for clang so it drops this option and all obects which should be
> partially linked becomes ET_EXEC and when they are added to final link
> then gold starts to get confused
>=20
> =
/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/sysroots/x86_64-linu=
x/usr/bin/arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-ld:
> error: applets/built-in.o: unsupported ELF file type 2
> clang-3.7: error: linker command failed with exit code 1 (use -v to =
see invocation)
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> ...-linking-instead-of-LD-and-use-CFLAGS-and.patch | 114 =
+++++++++++++++++++++
> .../busybox/0002-Passthrough-r-to-linker.patch     |  32 ++++++
> meta/recipes-core/busybox/busybox_1.23.2.bb        |   2 +
> 3 files changed, 148 insertions(+)
> create mode 100644 =
meta/recipes-core/busybox/busybox/0001-Use-CC-when-linking-instead-of-LD-a=
nd-use-CFLAGS-and.patch
> create mode 100644 =
meta/recipes-core/busybox/busybox/0002-Passthrough-r-to-linker.patch
>=20
> diff --git =
a/meta/recipes-core/busybox/busybox/0001-Use-CC-when-linking-instead-of-LD=
-and-use-CFLAGS-and.patch =
b/meta/recipes-core/busybox/busybox/0001-Use-CC-when-linking-instead-of-LD=
-and-use-CFLAGS-and.patch
> new file mode 100644
> index 0000000..2bf2b91
> --- /dev/null
> +++ =
b/meta/recipes-core/busybox/busybox/0001-Use-CC-when-linking-instead-of-LD=
-and-use-CFLAGS-and.patch
> @@ -0,0 +1,114 @@
> +=46rom a9333eb6a7b8dbda735947cd5bc981ff9352a2c9 Mon Sep 17 00:00:00 =
2001
> +From: Nathan Phillip Brink <ohnobinki@ohnopublishing.net>
> +Date: Thu, 10 Mar 2011 00:27:08 -0500
> +Subject: [PATCH 1/2] Use $(CC) when linking instead of $(LD) and use =
$(CFLAGS)
> + and $(EXTRA_CFLAGS) when linking.
> +
> +This fixes the issue where LDFLAGS escaped with -Wl are ignored =
during
> +compilation. It also simplifies using CFLAGS or EXTRA_CFLAGS (such as
> +-m32 on x86_64 or -flto) which apply to both compilation and linking
> +situations.
> +
> +Signed-off-by: Nathan Phillip Brink <ohnobinki@ohnopublishing.net>
> +---
> +Upstream-Status: Pending
> +
> + Makefile               |  7 ++++---
> + scripts/Makefile.build |  8 ++++----
> + scripts/Makefile.lib   | 13 +++----------
> + 3 files changed, 11 insertions(+), 17 deletions(-)
> +
> +Index: busybox-1.23.2/Makefile
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- busybox-1.23.2.orig/Makefile
> ++++ busybox-1.23.2/Makefile
> +@@ -309,7 +309,8 @@ CHECKFLAGS     :=3D -D__linux__ -Dlinux -D
> + MODFLAGS	=3D -DMODULE
> + CFLAGS_MODULE   =3D $(MODFLAGS)
> + AFLAGS_MODULE   =3D $(MODFLAGS)
> +-LDFLAGS_MODULE  =3D -r
> ++LDFLAGS_RELOCATABLE =3D -r -nostdlib
> ++LDFLAGS_MODULE  =3D $(LDFLAGS_RELOCATABLE)
> + CFLAGS_KERNEL	=3D
> + AFLAGS_KERNEL	=3D
> +=20
> +@@ -331,7 +332,7 @@ KERNELVERSION =3D $(VERSION).$(PATCHLEVEL)
> + export	VERSION PATCHLEVEL SUBLEVEL KERNELRELEASE KERNELVERSION =
\
> + 	ARCH CONFIG_SHELL HOSTCC HOSTCFLAGS CROSS_COMPILE AS LD CC \
> + 	CPP AR NM STRIP OBJCOPY OBJDUMP MAKE AWK GENKSYMS PERL =
UTS_MACHINE \
> +-	HOSTCXX HOSTCXXFLAGS LDFLAGS_MODULE CHECK CHECKFLAGS
> ++	HOSTCXX HOSTCXXFLAGS LDFLAGS_RELOCATABLE LDFLAGS_MODULE CHECK =
CHECKFLAGS
> +=20
> + export CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS LDFLAGS
> + export CFLAGS CFLAGS_KERNEL CFLAGS_MODULE
> +@@ -610,7 +611,7 @@ quiet_cmd_busybox__ ?=3D LINK    $@
> +       cmd_busybox__ ?=3D $(srctree)/scripts/trylink \
> +       "$@" \
> +       "$(CC)" \
> +-      "$(CFLAGS) $(CFLAGS_busybox)" \
> ++      "$(CFLAGS) $(CFLAGS_busybox) $(EXTRA_CFLAGS)" \
> +       "$(LDFLAGS) $(EXTRA_LDFLAGS)" \
> +       "$(core-y)" \
> +       "$(libs-y)" \
> +Index: busybox-1.23.2/scripts/Makefile.build
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- busybox-1.23.2.orig/scripts/Makefile.build
> ++++ busybox-1.23.2/scripts/Makefile.build
> +@@ -174,7 +174,7 @@ cmd_modversions =3D					=
		\
> + 		| $(GENKSYMS) -a $(ARCH)				=
\
> + 		> $(@D)/.tmp_$(@F:.o=3D.ver);				=
\
> + 									=
\
> +-		$(LD) $(LDFLAGS) -r -o $@ $(@D)/.tmp_$(@F) 		=
\
> ++               $(CC) $(ld_flags_partial) $(LDFLAGS_RELOCATABLE) -o =
$@ $(@D)/.tmp_$(@F)        \
> + 			-T $(@D)/.tmp_$(@F:.o=3D.ver);			=
\
> + 		rm -f $(@D)/.tmp_$(@F) $(@D)/.tmp_$(@F:.o=3D.ver);	=
\
> + 	else								=
\
> +@@ -257,7 +257,7 @@ quiet_cmd_link_o_target =3D LD      $@
> + # If the list of objects to link is empty, just create an empty =
built-in.o
> + # -nostdlib is added to make "make LD=3Dgcc ..." work (some people =
use that)
> + cmd_link_o_target =3D $(if $(strip $(obj-y)),\
> +-		$(LD) -nostdlib $(ld_flags) -r -o $@ $(filter $(obj-y), =
$^),\
> ++		$(CC) $(ld_flags_partial) $(LDFLAGS_RELOCATABLE) -o $@ =
$(filter $(obj-y), $^),\
> + 		rm -f $@; $(AR) rcs $@)
> +=20
> + $(builtin-target): $(obj-y) FORCE
> +@@ -292,10 +292,10 @@ $($(subst $(obj)/,,$(@:.o=3D-objs)))    \
> + $($(subst $(obj)/,,$(@:.o=3D-y)))), $^)
> +=20
> + quiet_cmd_link_multi-y =3D LD      $@
> +-cmd_link_multi-y =3D $(LD) $(ld_flags) -r -o $@ $(link_multi_deps)
> ++cmd_link_multi-y =3D $(CC) $(ld_flags_partial) =
$(LDFLAGS_RELOCATABLE) -o $@ $(link_multi_deps)
> +=20
> + quiet_cmd_link_multi-m =3D LD [M]  $@
> +-cmd_link_multi-m =3D $(LD) $(ld_flags) $(LDFLAGS_MODULE) -o $@ =
$(link_multi_deps)
> ++cmd_link_multi-m =3D $(CC) $(ld_flags) $(LDFLAGS_MODULE) -o $@ =
$(link_multi_deps)
> +=20
> + # We would rather have a list of rules like
> + # 	foo.o: $(foo-objs)
> +Index: busybox-1.23.2/scripts/Makefile.lib
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- busybox-1.23.2.orig/scripts/Makefile.lib
> ++++ busybox-1.23.2/scripts/Makefile.lib
> +@@ -121,7 +121,8 @@ cpp_flags      =3D -Wp,-MD,$(depfile) $(NO
> + # yet ld_flags is fed to ld.
> + #ld_flags       =3D $(LDFLAGS) $(EXTRA_LDFLAGS)
> + # Remove the -Wl, prefix from linker options normally passed through =
gcc
> +-ld_flags       =3D $(filter-out -Wl$(comma)%,$(LDFLAGS) =
$(EXTRA_LDFLAGS))
> ++ld_flags       =3D $(filter-out -Wl$(comma)%,$(LDFLAGS) =
$(EXTRA_LDFLAGS) $(CFLAGS) $(EXTRA_CFLAGS))
> ++ld_flags_partial =3D $($(filter-out -shared%, $(filter-out =
-pie%,$(ld_flags))))
> +=20
> +=20
> + # Finds the multi-part object the current object will be linked into
> +@@ -151,10 +152,8 @@ $(obj)/%:: $(src)/%_shipped
> + # Linking
> + # =
--------------------------------------------------------------------------=
-
> +=20
> +-# TODO: LDFLAGS usually is supposed to contain gcc's flags, not =
ld's.
> +-# but here we feed them to ld!
> +-quiet_cmd_ld =3D LD      $@
> +-cmd_ld =3D $(LD) $(LDFLAGS) $(EXTRA_LDFLAGS) $(LDFLAGS_$(@F)) \
> ++quiet_cmd_ld =3D CC    $@
> ++cmd_ld =3D $(CC) $(ld_flags) $(LDFLAGS_$(@F)) \
> + 	       $(filter-out FORCE,$^) -o $@
> +=20
> + # Objcopy
> diff --git =
a/meta/recipes-core/busybox/busybox/0002-Passthrough-r-to-linker.patch =
b/meta/recipes-core/busybox/busybox/0002-Passthrough-r-to-linker.patch
> new file mode 100644
> index 0000000..de286fb
> --- /dev/null
> +++ =
b/meta/recipes-core/busybox/busybox/0002-Passthrough-r-to-linker.patch
> @@ -0,0 +1,32 @@
> +=46rom df2cc76cdebc4773361477f3db203790f6986e3b Mon Sep 17 00:00:00 =
2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 22 Aug 2015 23:42:40 -0700
> +Subject: [PATCH 2/2] Passthrough -r to linker
> +
> +clang does not have -r switch and it does not pass it down to linker
> +either, LDFLAGS_RELOCATABLE is used when CC is used for LD, so this
> +should not cause side effects
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> +Upstream-Status: Pending
> +
> + Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 9da02cb..10dd4a9 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -309,7 +309,7 @@ CHECKFLAGS     :=3D -D__linux__ -Dlinux =
-D__STDC__ -Dunix -D__unix__ -Wbitwise $(C
> + MODFLAGS	=3D -DMODULE
> + CFLAGS_MODULE   =3D $(MODFLAGS)
> + AFLAGS_MODULE   =3D $(MODFLAGS)
> +-LDFLAGS_RELOCATABLE =3D -r -nostdlib
> ++LDFLAGS_RELOCATABLE =3D -Xlinker -r -nostdlib
> + LDFLAGS_MODULE  =3D $(LDFLAGS_RELOCATABLE)
> + CFLAGS_KERNEL	=3D
> + AFLAGS_KERNEL	=3D
> +--=20
> +2.1.4
> +
> diff --git a/meta/recipes-core/busybox/busybox_1.23.2.bb =
b/meta/recipes-core/busybox/busybox_1.23.2.bb
> index 5e02732..2559823 100644
> --- a/meta/recipes-core/busybox/busybox_1.23.2.bb
> +++ b/meta/recipes-core/busybox/busybox_1.23.2.bb
> @@ -33,6 +33,8 @@ SRC_URI =3D =
"http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=3Dtarball \
>            file://0001-Switch-to-POSIX-utmpx-API.patch \
>            =
file://0001-ifconfig-fix-double-free-fatal-error-in-INET_sprint.patch \
>            file://0001-chown-fix-help-text.patch \
> +           =
file://0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch \
> +           file://0002-Passthrough-r-to-linker.patch \
>            file://mount-via-label.cfg \
>            file://sha1sum.cfg \
>            file://sha256sum.cfg \
> --=20
> 2.5.1
>=20


