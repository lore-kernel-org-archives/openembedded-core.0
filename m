Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 315AD605D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 17:03:58 +0000 (UTC)
Received: by igbyr2 with SMTP id yr2so20086286igb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 10:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Hs838Bz75iv/+8iHEbaX+/ZU5j4/IAkeSYzd9wo7w/g=;
	b=EQ2mS/3CFLXk4grwT8XM3b2IO3j7z5kWbLQEKFbFEHqQfRILpcZTcgRtBj+0hjT9UZ
	erd6cekCnZQPQi6wTzUI+FQ7Vn/7Ibqv2eNMdyieJ4gKepqAJOrZqbBKpUR6el9nifex
	OF/Yf6IIOaL+2W7hJeq8DFdgb6LOBG7XDA+y4yrixBWV1J8fuyNtyhecrOIZOHeo+LX9
	i+y7sNLyX+tmYI/mJ2hTvmWtPLqRlOomf2JDrywF+7gIUnmmNVAWFKmXzhpHBdRRkI4g
	w0xEGweW9WESBER5W+msUeUJw/z0MhZ0QLg8f0416ZjG0Fpnx3oGQoPDA/6Hq80P76M5
	0WrQ==
X-Received: by 10.43.63.76 with SMTP id xd12mr10971060icb.11.1429895039785;
	Fri, 24 Apr 2015 10:03:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.230.178 with HTTP; Fri, 24 Apr 2015 10:03:29 -0700 (PDT)
In-Reply-To: <cover.1429846255.git.raj.khem@gmail.com>
References: <cover.1429846255.git.raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Apr 2015 10:03:29 -0700
Message-ID: <CAMKF1spgSZPEtmrsRNuPJY8g8FFMqjqdEmveTRuyNpQ4eUH=Rg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/14] Fix world build with gcc-5
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
X-List-Received-Date: Fri, 24 Apr 2015 17:04:01 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 23, 2015 at 8:35 PM, Khem Raj <raj.khem@gmail.com> wrote:
> I saw that my prior pull request has not yet been picked so I took opportunity to update it
> with few more commits and remove the commits not needed for world builds out.
> With these world builds on OE-Core are succeeding for all supported qemu machines
> The gcc upgrade is not yet proposed since we are still in RC phase and as soon as
> 5.1.0 is released I will propose it for OE-Core

so it is release and I have updated the recipes here

http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/master&id=99c5806f9e4dc299136244c495eba7dffa8c84a2

world builds on glibc have 1 failure on libunwind/mips but thats a
different problem. all others are green. I have only tried qemu
machines
so no mulilib etc. Once these patches are good with 4.9 and installed.
I will propose it for core. For impatient ones please cherry pick that
1 commit
and try it out in your build configuration and let us know if there
are problems.

>
> Khem Raj (14):
>   glibc, packagegroup-self-hosted, packagegroup-core-lsb: Consider
>     non-glibc libcs
>   insserv: Fix build with gcc5 and clang
>   xserver-xorg: Fix build with gcc-5
>   u-boot-mkimage: Backport fix from upstream to fix build with gcc-5
>   mdadm: Fix inline semantics
>   lttng-tools: Add extern qualifier to declarations in .h file
>   subversion: Add -P to CPPFLAGS
>   gnome-icon-theme: Needs nls.m4
>   gtk+: Correct function prototype
>   grub: Backport const qualifier fix for gcc-5
>   gummiboot: upgrade 43 -> 48+git
>   pkgconfig: Upgrade to latest git tip
>   fontconfig: Upgrade to 2.11.93
>   fontconfig: Fix pkgconfig file generation to not have absolute paths
>
>  ..._dhcp_vendor-Add-missing-const-qualifiers.patch |  33 ++
>  meta/recipes-bsp/grub/grub2.inc                    |   1 +
>  .../gummiboot/gummiboot/fix-objcopy.patch          |  28 +-
>  meta/recipes-bsp/gummiboot/gummiboot_git.bb        |   4 +-
>  meta/recipes-bsp/u-boot/u-boot-mkimage/gcc5.patch  |  91 ++++
>  meta/recipes-bsp/u-boot/u-boot-mkimage_2015.01.bb  |   4 +-
>  meta/recipes-core/glibc/glibc_2.21.bb              |   8 +-
>  .../packagegroups/packagegroup-self-hosted.bb      |   7 +-
>  .../161_bts777914_fix_undeclared_identifier.patch  |  36 ++
>  meta/recipes-devtools/insserv/insserv_1.14.0.bb    |   1 +
>  ...Strip-system-library-directories-reliably.patch |  30 --
>  .../pkgconfig/pkgconfig-0.28/autofoo.patch         | 528 ---------------------
>  .../pkgconfig-0.28/obsolete_automake_macros.patch  |  16 -
>  meta/recipes-devtools/pkgconfig/pkgconfig.inc      |   6 +-
>  .../pkgconfig/pkgconfig/autofoo.patch              | 528 ---------------------
>  .../fix-glib-configure-libtool-usage.patch         |   0
>  meta/recipes-devtools/pkgconfig/pkgconfig_0.28.bb  |  11 -
>  meta/recipes-devtools/pkgconfig/pkgconfig_git.bb   |  42 +-
>  .../subversion/subversion_1.8.11.bb                |   3 +-
>  meta/recipes-extended/mdadm/files/inline.patch     |  39 ++
>  meta/recipes-extended/mdadm/mdadm_3.3.2.bb         |   1 +
>  .../packagegroups/packagegroup-core-lsb.bb         |   9 +
>  .../recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb |   2 +-
>  .../gtk+/gtk+/strict-prototypes.patch              |  24 +
>  meta/recipes-gnome/gtk+/gtk+_2.24.27.bb            |   1 +
>  .../fontconfig/revert-static-pkgconfig.patch       |  20 +
>  ...{fontconfig_2.11.1.bb => fontconfig_2.11.93.bb} |   7 +-
>  ...sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch |  50 ++
>  .../xorg-xserver/xserver-xorg_1.16.3.bb            |   1 +
>  .../lttng/lttng-tools/extern-decls.patch           | 442 +++++++++++++++++
>  meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb     |   1 +
>  31 files changed, 794 insertions(+), 1180 deletions(-)
>  create mode 100644 meta/recipes-bsp/grub/files/0001-parse_dhcp_vendor-Add-missing-const-qualifiers.patch
>  create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage/gcc5.patch
>  create mode 100644 meta/recipes-devtools/insserv/files/161_bts777914_fix_undeclared_identifier.patch
>  delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig-0.28/0001-Strip-system-library-directories-reliably.patch
>  delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig-0.28/autofoo.patch
>  delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig-0.28/obsolete_automake_macros.patch
>  delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/autofoo.patch
>  rename meta/recipes-devtools/pkgconfig/{pkgconfig-0.28 => pkgconfig}/fix-glib-configure-libtool-usage.patch (100%)
>  delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig_0.28.bb
>  create mode 100644 meta/recipes-extended/mdadm/files/inline.patch
>  create mode 100644 meta/recipes-gnome/gtk+/gtk+/strict-prototypes.patch
>  create mode 100644 meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch
>  rename meta/recipes-graphics/fontconfig/{fontconfig_2.11.1.bb => fontconfig_2.11.93.bb} (83%)
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch
>  create mode 100644 meta/recipes-kernel/lttng/lttng-tools/extern-decls.patch
>
> --
> 2.1.4
>

