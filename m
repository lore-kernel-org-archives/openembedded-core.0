Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C1EC5B549
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 11:14:02 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.14091.1749035634386888398
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 04:13:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YCcqJdmu;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3114560d74aso6861978a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 04:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749035634; x=1749640434; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fCIRP8VKz47DPrFKfiCQ50rIRe7QnETIU2gmpwWd0u4=;
        b=YCcqJdmuu8CCQWOExQM++b4u6l99cYJ9c73tFzTEfl4ESxwbD6WYzE8xmvy97mDpBT
         vtMAvWsngVskhyt2h3pr1tHOMwxzVmiXw5gPJUoE7vg5UANbBLvqP8/38BpX6Rak4524
         2Hz+88e5BuA6KkXRMrYVmaHmfSdMv+/yvrCER47Xcv/gBEGv1ndOrkOEafWopZM0HalT
         A0pAmSII7PWbucbFqmFFhFvysFL4Yiag05DfCyvpTi4l++Qc+EV90vH+187niVZNvMkT
         plk18x02uUwhuFqXKyKkDBKsOTOwPKChjy+8p/Dsbzv6KjiA9BWIXr+F7YCx+NB/36KU
         Z4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749035634; x=1749640434;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fCIRP8VKz47DPrFKfiCQ50rIRe7QnETIU2gmpwWd0u4=;
        b=oUXR/eZj+wHVZr2znA31+Ne1WOXWteoY/KnM64LUqZh87cJU3rRp6U+mOEcBdCiC9b
         9ohNJSajxglFf/ZAPQMc8yrFV05DBD5LY1qwz8uuGfe+96ZtZl1osO4SmOcsZCSYZwe0
         jXiH8j8s34lh+zQOe3wVXCA4S9WEh3IlCCEvBwHFnrUr4pe5YPnD8JqQPFlOMi+kbATm
         M0SLl5LwerivZliJyL2v1tYSq65BnYF5arE/yIYJcitVCYXRjeBW9pfCTHKSABBzd7rl
         Apw2a4jd/u8vaQyWTseFhP+OE40ixA7JHzHmdNJ2F07bzzlDqvdqJh0cXUI8je2iYO5o
         2H3w==
X-Gm-Message-State: AOJu0Yz+FCf60uh2lDVsmlpZyVzwmuXOU5Cw01SaWE+nAj2lCUubew8U
	g1/b801sFSkzWLkZbcBhbf4ygrlICcN56TBSivjm1QFNCnf7yTwF60appbXkkbCRhL8Yxnv0Xgf
	MyChMUCQYiWPEDJ+VaDBdsICRp3VGrf0=
X-Gm-Gg: ASbGnct7l+BuMu3jJD3qGj7Gz2DCs2kM+fGq/gN6iWy74Y3VfT+zyOzZvFZ/M/suMwK
	IZMfUDSrFpRet23WMsm+oVxWQCq0ArQlwC4/rytYZESCoZfyy0wzm7XnZzkuBDnF3Xgc+l8+Sgg
	jUqr46cwbd3Y1oaZniEA8p9LVP6gJqmAOmBQ==
X-Google-Smtp-Source: AGHT+IG7VtFuBoNwyxPSlAysxNnR4s/yAou7/pn8vr114oTMnEWz0iwQObCll4EvjW3ra08jsWGdzGNTnpmNooiKL6o=
X-Received: by 2002:a17:90b:268b:b0:311:9c9a:58dd with SMTP id
 98e67ed59e1d1-3130cd150cemr3774906a91.13.1749035633529; Wed, 04 Jun 2025
 04:13:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250603082419.409564-1-adrian.freihofer@siemens.com>
In-Reply-To: <20250603082419.409564-1-adrian.freihofer@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 4 Jun 2025 07:13:40 -0400
X-Gm-Features: AX0GCFthR7omphNm2UNK_KMrvw_JrsGpRWtI-0iTkUoiRcD5QIz-aVGUzrQyVgM
Message-ID: <CADkTA4O7-kjZ9Eo-9yGJJZRC0D30bAWVCzSS_Y61jjLUVLnMnw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v7 00/20] FIT image improvements
To: adrian.freihofer@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a2d7020636bd1730"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 11:14:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217902

--000000000000a2d7020636bd1730
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 4:24=E2=80=AFAM Adrian Freihofer via lists.openembed=
ded.org
<adrian.freihofer=3Dsiemens.com@lists.openembedded.org> wrote:

> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> This patch series re-writes the FIT image related code. The goal is to
> fix [YOCTO #12912] which is a long standing issue.
>
> Changes in comparison to v6
> ---------------------------
>
> * Move the code for exporting the FIT image specific kernel artifacts in =
a
> new,
>   separate kernel-fit-extra-artifacts.bbclass rather than adding it to th=
e
>   existing kernel-uimage.bbclass.
> * Improve the devicetree.bbclass to skip error messages of shell globs
> * Improve the error message in the kernel.bbclass to: "fitImage is no
> longer
>   supported as a KERNEL_IMAGETYPE(S). FIT images are built by the
>   linux-yocto-fitimage recipe."
>
>
Thanks Adrian,

Now that you've sorted out that one build issue, this series looks good to
me.

Bruce



> Revert a non essential refactoring in the kernel.bbclass
>
> Changes in comparison to v5
> ---------------------------
>
> * Improve the linux-yocto-fitimage recipe:
>   Replace LINUX_VERSION ?=3D "6.12.23" by
>   PKGV =3D "${@get_kernelversion_file("${STAGING_KERNEL_BUILDDIR}")}"
> * Extend recipe for testing the external devicetree: bbb-dtbs-as-ext.bb
>   * am335x-bonegreen-ext.dts
>     Add a dtb file with a compatible string (before there was only a dtbo=
)
>   * am335x-bonegreen-ext-alias.dtb
>     Add a sym-link which should end up as an additional configuration nod=
e
> in
>     the FIT image
> * Fix handling of external device trees
>   * Create an extra configuration node for sym-links
>   * If an external devicetree has a compatible property add the same
> property
>     to the corresponding FIT image configuration node.
>   * Sort the output of os.listdir
> * Fix handling of FIT_CONF_DEFAULT_DTB
> * Improve tests:
>   * FIT_CONF_PREFIX
>   * FIT_CONF_DEFAULT_DTB
>   * Add a test for an external devicetree (not only a dtbo)
>   * Add a test for an external devicetree sym-link
>   * Test the new get_compatible_from_dtb function
>   * Improve robustness of testiing FIT_GENERATE_KEYS =3D "1"
> * Improve some minor finding in devicetree.bbclass
>
> Changes in comparison to v4
> ---------------------------
>
> * maintainers: add myself for kernel-signing-keys-native
>   oe-selftest -r distrodata.Distrodata.test_maintainers
>
> The intention is to provide exactly the state of today's master-next.
>
> Changes in comparison to v3
> ---------------------------
>
> * Fix ERROR: linux-yocto-6.12.27+git-r0 do_uboot_mkimage: Execution...
> * Pass the kernel artifacts via the deploy directory. This makes the task
>   dependencies slightly more complicated. But passing the artifacts via
>   sysroot requires having some artifacts twice in the sstate-cache (once
>   in sysroot and once in deploy-dir).
> * Support the bundled kernel+initramfs in FIT image again. After some
>   discussions, it turned out that some BSPs make use of this unusual
>   combination and dropping support for it would probably lead to issues.
>   Re-introducing this was also part of the motivation for passing the
>   artifacts via deploy rather than via sysroot.
> * Drop the patch which merged kernel-uboot.bbclass into
>   kernel-uimage.bbclass. This can be done later if it seems useful.
> * Drop doc patches again
>
> Changes in comparison to v2
> ---------------------------
>
> * Fix the multilib exclusion check linux-fit-image -> kernel-fit-image
>   This should solve the issue with bitbake world and multilib builds
>
> Changes in comparison to v1
> ---------------------------
>
> * Exclude recipes which inherit the kernel-fit-image.bbclass from
>   multilib builds. This fixes an issue discovered by the AB when
>   running bitbake world with a multilib configuraton enabled.
> * Remove some new tests which expected openssl from the host.
> * Rebase the patches on the new bug-fix commit
>   "u-boot: ensure keys are generated before assembling U-Boot FIT image"
>   from Rogerio Guerra Borin <rogerio.borin@toradex.com>
>   This fix required splitting the key generation into a separate recipe.
>   Note: These patches depend on this commit, which is included in this
>   series. As of today, the patch is already present on master-next.
> * Add a cover letter with correct subject for the patch series
>
> What gets fixed
> ---------------
>
> * sstate does not work well if a FIT image contains an initramfs.
>   The kernel gets re-built from scratch if the build runs from an
>   empty TMPDIR:
>   https://lists.openembedded.org/g/openembedded-core/message/203510.
>   This is also problematic for SDK use cases since working with the
>   SDK is annoying if the kernel gets re-built from scratch for no
>   good reason.
> * A FIT image kernel is not available as a package, but all other
>   kernel image types are.
> * The its-file is generated by complicated shell code with lots of
>   code duplications. Switching to Python simplifies the maintenance
>   (also because of the indentation with spaces and tabs in the shell
>   code).
> * Separating the FIT image related complexity from the kernel build
>   complexity simplifies the maintenance of the kernel but also of
>   the FIT image related code.
> * There is already a new (but unfortunately completely unaligned)
>   implementation for creating FIT images in meta-openembedded:
>   https://github.com/openembedded/meta-openembedded/blob/master/meta-oe/
>   classes/fitimage.bbclass. Let's hope this patch series will lay a
>   solid foundation for a future merge of the two implementations.
> * The new implementation in Python is also a preparation for additional
>   features, such as adding different types of artifacts or generating
>   the configuration nodes with greater flexibility. Currently, exactly
>   one configuration per device node is supported.
>
> Architectural change
> --------------------
>
> The existing kernel-fitimage.bbclass is designed to be added to
> KERNEL_CLASSES. It appends code to the kernel's tasks and injects
> additional tasks between the existing ones. Some functions rely on
> running within the kernel's build folder structure.
>
> The new implementation introduces the kernel-fit-image.bbclass,
> which is intended to be inherited by an independent recipe. This
> recipe takes the kernel artifacts from the sstate-cache and assembles
> the FIT image entirely independently of the kernel's build tasks and
> directory structure.
>
> An example of using the new kernel-fit-image.bbclass is the
> linux-yocto-fitimage.bb recipe, which builds the FIT image for the
> linux-yocto kernel. The recipe looks like this:
>
>   SUMMARY =3D "The Linux kernel as a FIT image (optionally with initramfs=
)"
>   SECTION =3D "kernel"
>   LICENSE =3D "GPL-2.0-with-Linux-syscall-note"
>   LIC_FILES_CHKSUM =3D "\
>
> file://${COREBASE}/meta/files/common-licenses/GPL-2.0-with-Linux-syscall-=
note;
>     md5=3D0bad96c422c41c3a94009dcfe1bff992"
>
>   inherit kernel-fit-image
>
> The configuration variables defined in the conf/image-fitimage.conf
> file are handled by the kernel-fit-image.bbclass in the same way as
> they are by the kernel-fitimage.bbclass. The new implementation is
> 99% backward compatible with the existing kernel-fitimage.bbclass.
> The existing test-suite runs with minimal changes.
>
> With the kernel-fitimage.bbclass, the FIT image was built as part of
> the kernel itself. To ensure the new recipe is built automatically,
> the following variables can be set, for example, in the machine
> configuration file:
>
>   # Do not install the kernel image package
>   RRECOMMENDS:${KERNEL_PACKAGE_NAME}-base =3D ""
>
>   # Install the FIT image package into the rootfs (there is now a package
> :-)
>   MACHINE_EXTRA_RDEPENDS +=3D "${PREFERRED_PROVIDER_virtual/kernel}-fitim=
age"
>
>   # Configure the image.bbclass to depend on the fitImage instead of only
>   # the kernel to ensure the FIT image is built with the image
>   KERNEL_DEPLOY_DEPEND =3D
> "${PREFERRED_PROVIDER_virtual/kernel}-fitimage:do_deploy"
>
> Breaking changes
> ----------------
>
> * Building a kernel FIT image changes.
>   Before this patch series:
>
>     A configuration like:
>       KERNEL_IMAGETYPE =3D "fitImage"
>       KERNEL_CLASSES =3D "kernel-fitimage"
>     and building a kernel like:
>       bitbake linux-yocto
>     generated a FIT image including the kernel and maybe additional
>     artifacts.
>
>   With this patch series merged, the same can be achieved like this:
>     bitbake linux-yocto-fitimage
>
>   While this simple example is even simpler than before, there are
>   also other examples which might look more complicated with the
>   new implementation than with the old implementation.
>
> Proposal for merging these patch series
> ---------------------------------------
>
> The patches are split into small steps which allow a step-by-step
> merging:
>
> 1. New tests without impact on code:
> 2. Add the new implementation without changing the existing implementatio=
n
> 3. Refactor the old kernel-fitimage.bbclass to Python to share code
> 4. Remove the old kernel-fitimage.bbclass and clean up the code from
>
> Adrian Freihofer (20):
>   devicetree: minor improvements
>   oe-selftest: add new ext dtb recipe
>   oe-selftest: fitimage: test external dtb
>   oe-selftest: fitimage: test FIT_CONF_PREFIX
>   oe-selftest: fitimage: test FIT_CONF_DEFAULT_DTB
>   kernel-signing-keys-native: refactor key generation into a new recipe
>   maintainers: add myself for kernel-signing-keys-native
>   oe-selftest: fitimage: cleanup FIT_GENERATE_KEYS
>   kernel-fitimage: refactor order in its
>   kernel-uboot.bbclass: do not require the kernel build folder
>   kernel-fit-image.bbclass: add a new FIT image implementation
>   maintainers: add myself for linux-yocto-fitimage
>   oe-selftest: fitimage: add tests for fitimage.py
>   oe-selftest: fitimage: support new FIT recipe as well
>   oe-selftest: fitimage: run all tests for both FIT implementations
>   oe-selftest: fitimage refactor classes
>   kernel-fitimage: re-write its code in Python
>   oe-selftest: fitimage: remove kernel-fitimage tests
>   kernel.bbclass: remove support for type fitImage
>   kernel-fitimage.bbclass: remove it
>
>  .../recipes-test/ext-dtb/bbb-dtbs-as-ext.bb   |  29 +
>  .../ext-dtb/files/BBORG_RELAY-00A2.dts        |  49 +
>  .../ext-dtb/files/am335x-bonegreen-ext.dts    |  14 +
>  meta/classes-recipe/devicetree.bbclass        |  22 +-
>  .../kernel-fit-extra-artifacts.bbclass        |  19 +
>  meta/classes-recipe/kernel-fit-image.bbclass  | 187 ++++
>  meta/classes-recipe/kernel-fitimage.bbclass   | 839 ------------------
>  meta/classes-recipe/kernel-uboot.bbclass      |  38 +-
>  meta/classes-recipe/kernel-uimage.bbclass     |   3 +-
>  meta/classes-recipe/kernel.bbclass            |  18 +-
>  meta/classes-recipe/uboot-sign.bbclass        |   5 +-
>  meta/classes/multilib.bbclass                 |   1 +
>  meta/conf/distro/include/maintainers.inc      |   2 +
>  meta/lib/oe/fitimage.py                       | 547 ++++++++++++
>  meta/lib/oeqa/selftest/cases/fitimage.py      | 365 ++++++--
>  .../kernel-signing-keys-native.bb             |  75 ++
>  .../linux/linux-yocto-fitimage.bb             |  13 +
>  17 files changed, 1286 insertions(+), 940 deletions(-)
>  create mode 100644 meta-selftest/recipes-test/ext-dtb/bbb-dtbs-as-ext.bb
>  create mode 100644
> meta-selftest/recipes-test/ext-dtb/files/BBORG_RELAY-00A2.dts
>  create mode 100644
> meta-selftest/recipes-test/ext-dtb/files/am335x-bonegreen-ext.dts
>  create mode 100644 meta/classes-recipe/kernel-fit-extra-artifacts.bbclas=
s
>  create mode 100644 meta/classes-recipe/kernel-fit-image.bbclass
>  delete mode 100644 meta/classes-recipe/kernel-fitimage.bbclass
>  create mode 100644 meta/lib/oe/fitimage.py
>  create mode 100644 meta/recipes-kernel/kernel-signing-keys/
> kernel-signing-keys-native.bb
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto-fitimage.bb
>
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217767):
> https://lists.openembedded.org/g/openembedded-core/message/217767
> Mute This Topic: https://lists.openembedded.org/mt/113443923/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000a2d7020636bd1730
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 3, 2025 at 4:24=
=E2=80=AFAM Adrian Freihofer via <a href=3D"http://lists.openembedded.org">=
lists.openembedded.org</a> &lt;adrian.freihofer=3D<a href=3D"mailto:siemens=
.com@lists.openembedded.org">siemens.com@lists.openembedded.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Adrian=
 Freihofer &lt;<a href=3D"mailto:adrian.freihofer@siemens.com" target=3D"_b=
lank">adrian.freihofer@siemens.com</a>&gt;<br>
<br>
This patch series re-writes the FIT image related code. The goal is to<br>
fix [YOCTO #12912] which is a long standing issue.<br>
<br>
Changes in comparison to v6<br>
---------------------------<br>
<br>
* Move the code for exporting the FIT image specific kernel artifacts in a =
new,<br>
=C2=A0 separate kernel-fit-extra-artifacts.bbclass rather than adding it to=
 the<br>
=C2=A0 existing kernel-uimage.bbclass.<br>
* Improve the devicetree.bbclass to skip error messages of shell globs<br>
* Improve the error message in the kernel.bbclass to: &quot;fitImage is no =
longer<br>
=C2=A0 supported as a KERNEL_IMAGETYPE(S). FIT images are built by the<br>
=C2=A0 linux-yocto-fitimage recipe.&quot;<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">Thanks Adrian,</div><div class=3D"gmail_default" style=3D"=
font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:=
small">Now that you&#39;ve sorted out that one build issue, this series loo=
ks good to me.</div><div class=3D"gmail_default" style=3D"font-size:small">=
<br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div=
><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
Revert a non essential refactoring in the kernel.bbclass<br>
<br>
Changes in comparison to v5<br>
---------------------------<br>
<br>
* Improve the linux-yocto-fitimage recipe:<br>
=C2=A0 Replace LINUX_VERSION ?=3D &quot;6.12.23&quot; by<br>
=C2=A0 PKGV =3D &quot;${@get_kernelversion_file(&quot;${STAGING_KERNEL_BUIL=
DDIR}&quot;)}&quot;<br>
* Extend recipe for testing the external devicetree: <a href=3D"http://bbb-=
dtbs-as-ext.bb" rel=3D"noreferrer" target=3D"_blank">bbb-dtbs-as-ext.bb</a>=
<br>
=C2=A0 * am335x-bonegreen-ext.dts<br>
=C2=A0 =C2=A0 Add a dtb file with a compatible string (before there was onl=
y a dtbo)<br>
=C2=A0 * am335x-bonegreen-ext-alias.dtb<br>
=C2=A0 =C2=A0 Add a sym-link which should end up as an additional configura=
tion node in<br>
=C2=A0 =C2=A0 the FIT image<br>
* Fix handling of external device trees<br>
=C2=A0 * Create an extra configuration node for sym-links<br>
=C2=A0 * If an external devicetree has a compatible property add the same p=
roperty<br>
=C2=A0 =C2=A0 to the corresponding FIT image configuration node.<br>
=C2=A0 * Sort the output of os.listdir<br>
* Fix handling of FIT_CONF_DEFAULT_DTB<br>
* Improve tests:<br>
=C2=A0 * FIT_CONF_PREFIX<br>
=C2=A0 * FIT_CONF_DEFAULT_DTB<br>
=C2=A0 * Add a test for an external devicetree (not only a dtbo)<br>
=C2=A0 * Add a test for an external devicetree sym-link<br>
=C2=A0 * Test the new get_compatible_from_dtb function<br>
=C2=A0 * Improve robustness of testiing FIT_GENERATE_KEYS =3D &quot;1&quot;=
<br>
* Improve some minor finding in devicetree.bbclass<br>
<br>
Changes in comparison to v4<br>
---------------------------<br>
<br>
* maintainers: add myself for kernel-signing-keys-native<br>
=C2=A0 oe-selftest -r distrodata.Distrodata.test_maintainers<br>
<br>
The intention is to provide exactly the state of today&#39;s master-next.<b=
r>
<br>
Changes in comparison to v3<br>
---------------------------<br>
<br>
* Fix ERROR: linux-yocto-6.12.27+git-r0 do_uboot_mkimage: Execution...<br>
* Pass the kernel artifacts via the deploy directory. This makes the task<b=
r>
=C2=A0 dependencies slightly more complicated. But passing the artifacts vi=
a<br>
=C2=A0 sysroot requires having some artifacts twice in the sstate-cache (on=
ce<br>
=C2=A0 in sysroot and once in deploy-dir).<br>
* Support the bundled kernel+initramfs in FIT image again. After some<br>
=C2=A0 discussions, it turned out that some BSPs make use of this unusual<b=
r>
=C2=A0 combination and dropping support for it would probably lead to issue=
s.<br>
=C2=A0 Re-introducing this was also part of the motivation for passing the<=
br>
=C2=A0 artifacts via deploy rather than via sysroot.<br>
* Drop the patch which merged kernel-uboot.bbclass into<br>
=C2=A0 kernel-uimage.bbclass. This can be done later if it seems useful.<br=
>
* Drop doc patches again<br>
<br>
Changes in comparison to v2<br>
---------------------------<br>
<br>
* Fix the multilib exclusion check linux-fit-image -&gt; kernel-fit-image<b=
r>
=C2=A0 This should solve the issue with bitbake world and multilib builds<b=
r>
<br>
Changes in comparison to v1<br>
---------------------------<br>
<br>
* Exclude recipes which inherit the kernel-fit-image.bbclass from<br>
=C2=A0 multilib builds. This fixes an issue discovered by the AB when<br>
=C2=A0 running bitbake world with a multilib configuraton enabled.<br>
* Remove some new tests which expected openssl from the host.<br>
* Rebase the patches on the new bug-fix commit<br>
=C2=A0 &quot;u-boot: ensure keys are generated before assembling U-Boot FIT=
 image&quot;<br>
=C2=A0 from Rogerio Guerra Borin &lt;<a href=3D"mailto:rogerio.borin@torade=
x.com" target=3D"_blank">rogerio.borin@toradex.com</a>&gt;<br>
=C2=A0 This fix required splitting the key generation into a separate recip=
e.<br>
=C2=A0 Note: These patches depend on this commit, which is included in this=
<br>
=C2=A0 series. As of today, the patch is already present on master-next.<br=
>
* Add a cover letter with correct subject for the patch series<br>
<br>
What gets fixed<br>
---------------<br>
<br>
* sstate does not work well if a FIT image contains an initramfs.<br>
=C2=A0 The kernel gets re-built from scratch if the build runs from an<br>
=C2=A0 empty TMPDIR:<br>
=C2=A0 <a href=3D"https://lists.openembedded.org/g/openembedded-core/messag=
e/203510" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/g/openembedded-core/message/203510</a>.<br>
=C2=A0 This is also problematic for SDK use cases since working with the<br=
>
=C2=A0 SDK is annoying if the kernel gets re-built from scratch for no<br>
=C2=A0 good reason.<br>
* A FIT image kernel is not available as a package, but all other<br>
=C2=A0 kernel image types are.<br>
* The its-file is generated by complicated shell code with lots of<br>
=C2=A0 code duplications. Switching to Python simplifies the maintenance<br=
>
=C2=A0 (also because of the indentation with spaces and tabs in the shell<b=
r>
=C2=A0 code).<br>
* Separating the FIT image related complexity from the kernel build<br>
=C2=A0 complexity simplifies the maintenance of the kernel but also of<br>
=C2=A0 the FIT image related code.<br>
* There is already a new (but unfortunately completely unaligned)<br>
=C2=A0 implementation for creating FIT images in meta-openembedded:<br>
=C2=A0 <a href=3D"https://github.com/openembedded/meta-openembedded/blob/ma=
ster/meta-oe/" rel=3D"noreferrer" target=3D"_blank">https://github.com/open=
embedded/meta-openembedded/blob/master/meta-oe/</a><br>
=C2=A0 classes/fitimage.bbclass. Let&#39;s hope this patch series will lay =
a<br>
=C2=A0 solid foundation for a future merge of the two implementations.<br>
* The new implementation in Python is also a preparation for additional<br>
=C2=A0 features, such as adding different types of artifacts or generating<=
br>
=C2=A0 the configuration nodes with greater flexibility. Currently, exactly=
<br>
=C2=A0 one configuration per device node is supported.<br>
<br>
Architectural change<br>
--------------------<br>
<br>
The existing kernel-fitimage.bbclass is designed to be added to<br>
KERNEL_CLASSES. It appends code to the kernel&#39;s tasks and injects<br>
additional tasks between the existing ones. Some functions rely on<br>
running within the kernel&#39;s build folder structure.<br>
<br>
The new implementation introduces the kernel-fit-image.bbclass,<br>
which is intended to be inherited by an independent recipe. This<br>
recipe takes the kernel artifacts from the sstate-cache and assembles<br>
the FIT image entirely independently of the kernel&#39;s build tasks and<br=
>
directory structure.<br>
<br>
An example of using the new kernel-fit-image.bbclass is the<br>
<a href=3D"http://linux-yocto-fitimage.bb" rel=3D"noreferrer" target=3D"_bl=
ank">linux-yocto-fitimage.bb</a> recipe, which builds the FIT image for the=
<br>
linux-yocto kernel. The recipe looks like this:<br>
<br>
=C2=A0 SUMMARY =3D &quot;The Linux kernel as a FIT image (optionally with i=
nitramfs)&quot;<br>
=C2=A0 SECTION =3D &quot;kernel&quot;<br>
=C2=A0 LICENSE =3D &quot;GPL-2.0-with-Linux-syscall-note&quot;<br>
=C2=A0 LIC_FILES_CHKSUM =3D &quot;\<br>
=C2=A0 =C2=A0 file://${COREBASE}/meta/files/common-licenses/GPL-2.0-with-Li=
nux-syscall-note;<br>
=C2=A0 =C2=A0 md5=3D0bad96c422c41c3a94009dcfe1bff992&quot;<br>
<br>
=C2=A0 inherit kernel-fit-image<br>
<br>
The configuration variables defined in the conf/image-fitimage.conf<br>
file are handled by the kernel-fit-image.bbclass in the same way as<br>
they are by the kernel-fitimage.bbclass. The new implementation is<br>
99% backward compatible with the existing kernel-fitimage.bbclass.<br>
The existing test-suite runs with minimal changes.<br>
<br>
With the kernel-fitimage.bbclass, the FIT image was built as part of<br>
the kernel itself. To ensure the new recipe is built automatically,<br>
the following variables can be set, for example, in the machine<br>
configuration file:<br>
<br>
=C2=A0 # Do not install the kernel image package<br>
=C2=A0 RRECOMMENDS:${KERNEL_PACKAGE_NAME}-base =3D &quot;&quot;<br>
<br>
=C2=A0 # Install the FIT image package into the rootfs (there is now a pack=
age :-)<br>
=C2=A0 MACHINE_EXTRA_RDEPENDS +=3D &quot;${PREFERRED_PROVIDER_virtual/kerne=
l}-fitimage&quot;<br>
<br>
=C2=A0 # Configure the image.bbclass to depend on the fitImage instead of o=
nly<br>
=C2=A0 # the kernel to ensure the FIT image is built with the image<br>
=C2=A0 KERNEL_DEPLOY_DEPEND =3D &quot;${PREFERRED_PROVIDER_virtual/kernel}-=
fitimage:do_deploy&quot;<br>
<br>
Breaking changes<br>
----------------<br>
<br>
* Building a kernel FIT image changes.<br>
=C2=A0 Before this patch series:<br>
<br>
=C2=A0 =C2=A0 A configuration like:<br>
=C2=A0 =C2=A0 =C2=A0 KERNEL_IMAGETYPE =3D &quot;fitImage&quot;<br>
=C2=A0 =C2=A0 =C2=A0 KERNEL_CLASSES =3D &quot;kernel-fitimage&quot;<br>
=C2=A0 =C2=A0 and building a kernel like:<br>
=C2=A0 =C2=A0 =C2=A0 bitbake linux-yocto<br>
=C2=A0 =C2=A0 generated a FIT image including the kernel and maybe addition=
al<br>
=C2=A0 =C2=A0 artifacts.<br>
<br>
=C2=A0 With this patch series merged, the same can be achieved like this:<b=
r>
=C2=A0 =C2=A0 bitbake linux-yocto-fitimage<br>
<br>
=C2=A0 While this simple example is even simpler than before, there are<br>
=C2=A0 also other examples which might look more complicated with the<br>
=C2=A0 new implementation than with the old implementation.<br>
<br>
Proposal for merging these patch series<br>
---------------------------------------<br>
<br>
The patches are split into small steps which allow a step-by-step<br>
merging:<br>
<br>
1. New tests without impact on code:<br>
2. Add the new implementation without changing the existing implementation<=
br>
3. Refactor the old kernel-fitimage.bbclass to Python to share code<br>
4. Remove the old kernel-fitimage.bbclass and clean up the code from<br>
<br>
Adrian Freihofer (20):<br>
=C2=A0 devicetree: minor improvements<br>
=C2=A0 oe-selftest: add new ext dtb recipe<br>
=C2=A0 oe-selftest: fitimage: test external dtb<br>
=C2=A0 oe-selftest: fitimage: test FIT_CONF_PREFIX<br>
=C2=A0 oe-selftest: fitimage: test FIT_CONF_DEFAULT_DTB<br>
=C2=A0 kernel-signing-keys-native: refactor key generation into a new recip=
e<br>
=C2=A0 maintainers: add myself for kernel-signing-keys-native<br>
=C2=A0 oe-selftest: fitimage: cleanup FIT_GENERATE_KEYS<br>
=C2=A0 kernel-fitimage: refactor order in its<br>
=C2=A0 kernel-uboot.bbclass: do not require the kernel build folder<br>
=C2=A0 kernel-fit-image.bbclass: add a new FIT image implementation<br>
=C2=A0 maintainers: add myself for linux-yocto-fitimage<br>
=C2=A0 oe-selftest: fitimage: add tests for fitimage.py<br>
=C2=A0 oe-selftest: fitimage: support new FIT recipe as well<br>
=C2=A0 oe-selftest: fitimage: run all tests for both FIT implementations<br=
>
=C2=A0 oe-selftest: fitimage refactor classes<br>
=C2=A0 kernel-fitimage: re-write its code in Python<br>
=C2=A0 oe-selftest: fitimage: remove kernel-fitimage tests<br>
=C2=A0 kernel.bbclass: remove support for type fitImage<br>
=C2=A0 kernel-fitimage.bbclass: remove it<br>
<br>
=C2=A0.../recipes-test/ext-dtb/<a href=3D"http://bbb-dtbs-as-ext.bb" rel=3D=
"noreferrer" target=3D"_blank">bbb-dtbs-as-ext.bb</a>=C2=A0 =C2=A0|=C2=A0 2=
9 +<br>
=C2=A0.../ext-dtb/files/BBORG_RELAY-00A2.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 49 +<br>
=C2=A0.../ext-dtb/files/am335x-bonegreen-ext.dts=C2=A0 =C2=A0 |=C2=A0 14 +<=
br>
=C2=A0meta/classes-recipe/devicetree.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 22 +-<br>
=C2=A0.../kernel-fit-extra-artifacts.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 19 +<br>
=C2=A0meta/classes-recipe/kernel-fit-image.bbclass=C2=A0 | 187 ++++<br>
=C2=A0meta/classes-recipe/kernel-fitimage.bbclass=C2=A0 =C2=A0| 839 -------=
-----------<br>
=C2=A0meta/classes-recipe/kernel-uboot.bbclass=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
38 +-<br>
=C2=A0meta/classes-recipe/kernel-uimage.bbclass=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A03 +-<br>
=C2=A0meta/classes-recipe/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 18 +-<br>
=C2=A0meta/classes-recipe/uboot-sign.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A05 +-<br>
=C2=A0meta/classes/multilib.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 +<br>
=C2=A0meta/lib/oe/fitimage.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 547 ++++++++++++<br>
=C2=A0meta/lib/oeqa/selftest/cases/fitimage.py=C2=A0 =C2=A0 =C2=A0 | 365 ++=
++++--<br>
=C2=A0.../<a href=3D"http://kernel-signing-keys-native.bb" rel=3D"noreferre=
r" target=3D"_blank">kernel-signing-keys-native.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 75 ++<br>
=C2=A0.../linux/<a href=3D"http://linux-yocto-fitimage.bb" rel=3D"noreferre=
r" target=3D"_blank">linux-yocto-fitimage.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 13 +<br>
=C2=A017 files changed, 1286 insertions(+), 940 deletions(-)<br>
=C2=A0create mode 100644 meta-selftest/recipes-test/ext-dtb/<a href=3D"http=
://bbb-dtbs-as-ext.bb" rel=3D"noreferrer" target=3D"_blank">bbb-dtbs-as-ext=
.bb</a><br>
=C2=A0create mode 100644 meta-selftest/recipes-test/ext-dtb/files/BBORG_REL=
AY-00A2.dts<br>
=C2=A0create mode 100644 meta-selftest/recipes-test/ext-dtb/files/am335x-bo=
negreen-ext.dts<br>
=C2=A0create mode 100644 meta/classes-recipe/kernel-fit-extra-artifacts.bbc=
lass<br>
=C2=A0create mode 100644 meta/classes-recipe/kernel-fit-image.bbclass<br>
=C2=A0delete mode 100644 meta/classes-recipe/kernel-fitimage.bbclass<br>
=C2=A0create mode 100644 meta/lib/oe/fitimage.py<br>
=C2=A0create mode 100644 meta/recipes-kernel/kernel-signing-keys/<a href=3D=
"http://kernel-signing-keys-native.bb" rel=3D"noreferrer" target=3D"_blank"=
>kernel-signing-keys-native.bb</a><br>
=C2=A0create mode 100644 meta/recipes-kernel/linux/<a href=3D"http://linux-=
yocto-fitimage.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-fitimag=
e.bb</a><br>
<br>
-- <br>
2.49.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#217767): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/217767" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/217767</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/113443923/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/113443923/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000a2d7020636bd1730--

