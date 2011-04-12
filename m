Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Q9Rc4-0007Z1-5o
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Apr 2011 02:37:48 +0200
Received: by iwn10 with SMTP id 10so6612644iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2011 17:35:33 -0700 (PDT)
Received: by 10.231.71.37 with SMTP id f37mr104099ibj.142.1302568531563;
	Mon, 11 Apr 2011 17:35:31 -0700 (PDT)
Received: from [10.21.3.168] ([70.36.246.130])
	by mx.google.com with ESMTPS id o3sm4544633ibd.61.2011.04.11.17.35.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Apr 2011 17:35:30 -0700 (PDT)
References: <cover.1302565606.git.lei.mei@intel.com>
	<0323ebf6b38d0ba0d1e955c4a3aca7f96ff3e803.1302565606.git.lei.mei@intel.com>
In-Reply-To: <0323ebf6b38d0ba0d1e955c4a3aca7f96ff3e803.1302565606.git.lei.mei@intel.com>
Mime-Version: 1.0 (iPhone Mail 8G4)
Message-Id: <1AA7147D-57F3-4685-A8E3-DABE00426167@dominion.thruhere.net>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (8G4)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 11 Apr 2011 17:35:25 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] qemu: Fix the qemu GL application start failure.
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
X-List-Received-Date: Tue, 12 Apr 2011 00:37:48 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Why are the mesa demo packages needed?

Op 11 apr. 2011 om 17:11 heeft Zhai Edwin <edwin.zhai@intel.com> het volgend=
e geschreven:

> From: Zhai Edwin <edwin.zhai@intel.com>
>=20
> Some turn-on macro/variable are re-arranged, buffer pointer is extended to=

> support 32/64b combination of target/host.
>=20
> [YOCTO #688] fixed.
>=20
> Signed-off-by:  Zhai Edwin <edwin.zhai@intel.com>
> ---
> .../qemu/qemu-0.14.0/qemugl-fix.patch              |   70 ++++++++++++++++=
++++
> meta/recipes-devtools/qemu/qemu_0.14.0.bb          |    1 +
> meta/recipes-sato/pimlico/dates_git.bb             |    2 +
> 3 files changed, 73 insertions(+), 0 deletions(-)
> create mode 100644 meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-fix.patch=

>=20
> diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-fix.patch b/met=
a/recipes-devtools/qemu/qemu-0.14.0/qemugl-fix.patch
> new file mode 100644
> index 0000000..c395b60
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-fix.patch
> @@ -0,0 +1,70 @@
> +This patch fix GL application start failure on qemu 0.14.0.
> +
> +Some turn-on macro/variable are re-arranged, buffer pointer is extended t=
o
> +support 32/64b combination of target/host.
> +
> +This is not perfect fix, and we need consider other GL alternatives in fu=
ture.
> +
> +Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
> +Index: qemu-0.14.0/target-i386/opengl_func.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- qemu-0.14.0.orig/target-i386/opengl_func.h    2011-04-08 16:43:46.000=
000000 +0800
> ++++ qemu-0.14.0/target-i386/opengl_func.h    2011-04-08 16:45:55.00000000=
0 +0800
> +@@ -26,8 +26,9 @@
> + #include "mesa_glext.h"
> +=20
> + /* Argument list are internally of a type that can hold a target pointer=

> +- * or a host pointer.  */
> +-typedef target_phys_addr_t arg_t;
> ++ * or a host pointer. If 32b target runs on 64b host, it should be big e=
nough
> ++ * to hold host pointer */
> ++typedef long unsigned int arg_t;
> +=20
> + enum {
> +     TYPE_NONE,
> +Index: qemu-0.14.0/target-i386/translate.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- qemu-0.14.0.orig/target-i386/translate.c    2011-04-08 16:19:15.00000=
0000 +0800
> ++++ qemu-0.14.0/target-i386/translate.c    2011-04-08 16:22:03.000000000 +=
0800
> +@@ -2652,17 +2652,19 @@
> +     s->is_jmp =3D DISAS_TB_JUMP;
> + }
> +=20
> +-int enable_gl =3D 0;
> ++extern int enable_gl;
> +=20
> + /* an interrupt is different from an exception because of the
> +    privilege checks */
> + static void gen_interrupt(DisasContext *s, int intno,
> +                           target_ulong cur_eip, target_ulong next_eip)
> + {
> ++#if !defined(CONFIG_USER_ONLY)
> +     if (enable_gl && intno =3D=3D 0x99) {
> +         gen_helper_opengl();
> +         return;
> +     }
> ++#endif
> +=20
> +     if (s->cc_op !=3D CC_OP_DYNAMIC)
> +         gen_op_set_cc_op(s->cc_op);
> +Index: qemu-0.14.0/vl.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- qemu-0.14.0.orig/vl.c    2011-04-08 16:11:43.000000000 +0800
> ++++ qemu-0.14.0/vl.c    2011-04-08 16:20:05.000000000 +0800
> +@@ -229,7 +229,7 @@
> + unsigned int nb_prom_envs =3D 0;
> + const char *prom_envs[MAX_PROM_ENVS];
> + int boot_menu;
> +-extern int enable_gl;
> ++int enable_gl =3D 0;
> +=20
> + typedef struct FWBootEntry FWBootEntry;
> +=20
> +@@ -1909,6 +1909,7 @@
> +     return popt;
> + }
> +=20
> ++#define TARGET_OPENGL_OK
> + int main(int argc, char **argv, char **envp)
> + {
> +     const char *gdbstub_dev =3D NULL;
> diff --git a/meta/recipes-devtools/qemu/qemu_0.14.0.bb b/meta/recipes-devt=
ools/qemu/qemu_0.14.0.bb
> index d8535b2..e440759 100644
> --- a/meta/recipes-devtools/qemu/qemu_0.14.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu_0.14.0.bb
> @@ -24,6 +24,7 @@ SRC_URI =3D "\
>     file://spice-qxl-locking-fix-for-qemu-kvm.patch \
>     file://Detect-and-use-GCC-atomic-builtins-for-locking.patch \
>     file://larger_default_ram_size.patch \
> +    file://qemugl-fix.patch \
>     "
> SRC_URI[md5sum] =3D "f9d145d5c09de9f0984ffe9bd1229970"
> SRC_URI[sha256sum] =3D "ba21e84d7853217830e167dae9999cdbff481189c6a0bb600a=
c7fb7201453108"
> diff --git a/meta/recipes-sato/pimlico/dates_git.bb b/meta/recipes-sato/pi=
mlico/dates_git.bb
> index f0a12f8..2823594 100644
> --- a/meta/recipes-sato/pimlico/dates_git.bb
> +++ b/meta/recipes-sato/pimlico/dates_git.bb
> @@ -13,3 +13,5 @@ S =3D "${WORKDIR}/git"
> SRC_URI =3D "git://git.gnome.org/${BPN};protocol=3Dgit \
>       file://make-382.patch \
>       file://dso_linking_change_build_fix.patch"
> +
> +RDEPENDS_${PN} =3D "mesa-demos"
> --=20
> 1.7.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


