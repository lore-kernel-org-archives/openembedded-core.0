Return-Path: <gchoc-openembedded-core@m.gmane.org>
X-Greylist: delayed 902 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 28 Feb 2017 08:48:57 UTC
Received: from blaine.gmane.org (unknown [195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id 63D7971AC3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 08:48:57 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.84_2)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1cidED-0000J6-BW for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2017 09:33:49 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 28 Feb 2017 09:33:42 +0100
Message-ID: <o93cl0$sqp$1@blaine.gmane.org>
References: <1488244198-1976-1-git-send-email-california.l.sullivan@intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@blaine.gmane.org
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.7.1
In-Reply-To: <1488244198-1976-1-git-send-email-california.l.sullivan@intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/1] recipes-extended: Move efivar from meta-openembedded to oe-core
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
X-List-Received-Date: Tue, 28 Feb 2017 08:48:59 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Op 28-02-17 om 02:09 schreef California Sullivan:
> BSPs for platforms using UEFI, such as meta-intel, would like to have 
> this more widely available

I guess you're saying "one less git repo to clone"? I don't think that's a
good enough reason to move it to OE-core.

> for future support enhancements.

I'm having trouble parsing this, it seems like you're saying that having it
in meta-oe precludes you from contributing to it?

> 
> This is a direct copy of the recipe from meta-openembedded/meta-oe.
> 
> Signed-off-by: California Sullivan
> <california.l.sullivan@intel.com> --- We
> are aware that this was recently blacklisted in meta-oe, but we were 
> unable to reproduce the issue under any circumstances.
> 
> .../efivar/0001-efivar-fix-for-cross-compile.patch | 35
> +++++++++++++++++ .../efivar/efivar/0002-disable-static-build.patch  | 33
> ++++++++++++++++ .../efivar/0003-efivar-fix-for-cross-compile.patch | 44
> +++++++++++++++++++++ .../0004-fix-unknow-option-for-gold-linker.patch
> | 38 ++++++++++++++++++ .../allow-multi-definitions-for-native.patch
> | 23 +++++++++++ .../fix-compile-failure-with-host-gcc-4.6.patch    | 45
> ++++++++++++++++++++++ meta/recipes-extended/efivar/efivar_0.24.bb
> | 43 +++++++++++++++++++++ 7 files changed, 261 insertions(+) create mode
> 100644
> meta/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
>
> 
create mode 100644
meta/recipes-extended/efivar/efivar/0002-disable-static-build.patch
> create mode 100644
> meta/recipes-extended/efivar/efivar/0003-efivar-fix-for-cross-compile.patch
>
> 
create mode 100644
meta/recipes-extended/efivar/efivar/0004-fix-unknow-option-for-gold-linker.patch
> create mode 100644
> meta/recipes-extended/efivar/efivar/allow-multi-definitions-for-native.patch
>
> 
create mode 100644
meta/recipes-extended/efivar/efivar/fix-compile-failure-with-host-gcc-4.6.patch
> create mode 100644 meta/recipes-extended/efivar/efivar_0.24.bb
> 
> diff --git
> a/meta/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
> b/meta/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
>
> 
new file mode 100644
> index 0000000..6f6ca64 --- /dev/null +++
> b/meta/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
>
> 
@@ -0,0 +1,35 @@
> +From 9a3c480af653b37e62d1be04d49fe7a60a80168f Mon Sep 17 00:00:00 2001 
> +From: Kai Kang <kai.kang@windriver.com> +Date:
> Fri, 25 Sep 2015 18:14:31 +0800 +Subject: [PATCH 1/2] efivar: fix for
> cross compile + +It builds and calls elf file makeguids to generate a
> header file which +doesn't work for cross compile. Fix it. + 
> +Signed-off-by: Kai Kang
> <kai.kang@windriver.com> + +Upstream-Status:
> Pending +Signed-off-by: Hongxu Jia
> <hongxu.jia@windriver.com> + +--- +
> src/Makefile | 4 ++-- + 1 file changed, 2 insertions(+), 2 deletions(-) 
> + +diff --git a/src/Makefile b/src/Makefile +index 5fc7887..1829d22
> 100644 +--- a/src/Makefile ++++ b/src/Makefile +@@ -29,8 +29,8 @@ all :
> deps $(TARGETS) + ./guid-symbols.c : include/efivar/efivar-guids.h +
> ./guids.bin : include/efivar/efivar-guids.h + ./names.bin :
> include/efivar/efivar-guids.h +-include/efivar/efivar-guids.h : makeguids
> guids.txt +-	./makeguids guids.txt guids.bin names.bin \ 
> ++include/efivar/efivar-guids.h : guids.txt ++	makeguids guids.txt
> guids.bin names.bin \ + 		guid-symbols.c include/efivar/efivar-guids.h +
>  + makeguids : CPPFLAGS+=-DEFIVAR_BUILD_ENVIRONMENT +-- +2.4.3 + diff
> --git
> a/meta/recipes-extended/efivar/efivar/0002-disable-static-build.patch
> b/meta/recipes-extended/efivar/efivar/0002-disable-static-build.patch new
> file mode 100644 index 0000000..951b159 --- /dev/null +++
> b/meta/recipes-extended/efivar/efivar/0002-disable-static-build.patch @@
> -0,0 +1,33 @@ +From 126e0d3c1ad74cf5b0abe9e98ec444bcc3c83159 Mon Sep 17
> 00:00:00 2001 +From: Koen Kooi
> <koen.kooi@linaro.org> +Date: Fri, 4 Mar
> 2016 14:53:55 +0100 +Subject: [PATCH 2/2] disable static build + 
> +Signed-off-by: Koen Kooi
> <koen.kooi@linaro.org> + +Upstream-Status:
> Inappropriate [meta-oe specific] +Signed-off-by: Hongxu Jia
> <hongxu.jia@windriver.com> + +--- +
> src/Makefile | 4 ++-- + 1 file changed, 2 insertions(+), 2 deletions(-) 
> + +diff --git a/src/Makefile b/src/Makefile +index 1829d22..c7a0ca3
> 100644 +--- a/src/Makefile ++++ b/src/Makefile +@@ -8,9 +8,9 @@ include
> $(TOPDIR)/Make.defaults + + LIBTARGETS=libefivar.so libefiboot.so +
> STATICLIBTARGETS=libefivar.a libefiboot.a +-BINTARGETS=efivar
> efivar-static ++BINTARGETS=efivar + PCTARGETS=efivar.pc efiboot.pc 
> +-TARGETS=$(LIBTARGETS) $(STATICLIBTARGETS) $(BINTARGETS) $(PCTARGETS) 
> ++TARGETS=$(LIBTARGETS) $(BINTARGETS) $(PCTARGETS) + + LIBEFIBOOT_SOURCES
> = crc32.c creator.c disk.c gpt.c linux.c loadopt.c + LIBEFIBOOT_OBJECTS =
> $(patsubst %.c,%.o,$(LIBEFIBOOT_SOURCES)) +-- +2.4.3 + diff --git
> a/meta/recipes-extended/efivar/efivar/0003-efivar-fix-for-cross-compile.patch
> b/meta/recipes-extended/efivar/efivar/0003-efivar-fix-for-cross-compile.patch
>
> 
new file mode 100644
> index 0000000..3f43f2a --- /dev/null +++
> b/meta/recipes-extended/efivar/efivar/0003-efivar-fix-for-cross-compile.patch
>
> 
@@ -0,0 +1,44 @@
> +From 7ead29ca6bb5e280ae07551cc3521281ecf73682 Mon Sep 17 00:00:00 2001 
> +From: Hongxu Jia <hongxu.jia@windriver.com> 
> +Date: Sat, 7 May 2016 02:06:47 -0400 +Subject: [PATCH] Makefile: fix
> efivar.pc not found + +It fixes efivar.pc not found: +... +| install -d
> -m 755 efivar/0.23-r0/image/usr/lib/pkgconfig/ +| install -m 644
> efivar.pc efivar/0.23-r0/image/usr/lib/pkgconfig/ +;  install -m 644
> efiboot.pc efivar/0.23-r0/image/usr/lib/pkgconfig/ +; +| install: cannot
> stat 'efivar.pc': No such file or directory +| install: cannot stat
> 'efiboot.pc': No such file or directory +| make[1]: *** [install] Error
> 1 +| make[1]: Leaving directory `efivar/0.23-r0/git/src' +| make: ***
> [install] Error 2 +| ERROR: oe_runmake failed +... + +Upstream-Status:
> Pending + +Signed-off-by: Hongxu Jia
> <hongxu.jia@windriver.com> +--- + src/Makefile
> | 4 +++- + 1 file changed, 3 insertions(+), 1 deletion(-) + +diff --git
> a/src/Makefile b/src/Makefile +index c7a0ca3..ad9c427 100644 +---
> a/src/Makefile ++++ b/src/Makefile +@@ -78,7 +78,9 @@ install : all +
> ln -fs $(x).$(VERSION) $(DESTDIR)$(libdir)/$(x).$(MAJOR_VERSION);\ + 		ln
> -fs $(x).$(VERSION) $(DESTDIR)$(libdir)/$(x); ) + 	$(INSTALL) -d -m 755
> $(DESTDIR)$(PCDIR) +-	$(foreach x, $(PCTARGETS), $(INSTALL) -m 644 $(x)
> $(DESTDIR)$(PCDIR) ;) ++	$(foreach x, $(PCTARGETS), $(INSTALL) -m 644
> $(TOPDIR)/src/$(x).in $(DESTDIR)$(PCDIR)/$(x) ;\ ++		sed -i -e
> "s:@@LIBDIR@@:$(libdir):g" -e "s:@@VERSION@@:$(VERSION):g" \ ++
> $(DESTDIR)$(PCDIR)/$(x); ) + 	$(INSTALL) -d -m 755
> $(DESTDIR)$(includedir)/efivar + 	$(foreach x, $(wildcard
> $(TOPDIR)/src/include/efivar/*.h), $(INSTALL) -m 644 $(x)
> $(DESTDIR)$(includedir)/efivar/$(notdir $(x));) + 	$(INSTALL) -d -m 755
> $(DESTDIR)$(bindir) +-- +2.8.1 + diff --git
> a/meta/recipes-extended/efivar/efivar/0004-fix-unknow-option-for-gold-linker.patch
> b/meta/recipes-extended/efivar/efivar/0004-fix-unknow-option-for-gold-linker.patch
>
> 
new file mode 100644
> index 0000000..5d50c19 --- /dev/null +++
> b/meta/recipes-extended/efivar/efivar/0004-fix-unknow-option-for-gold-linker.patch
>
> 
@@ -0,0 +1,38 @@
> +From b3d35e7dd27a755df5acbe050837885914dbb28b Mon Sep 17 00:00:00 2001 
> +From: Hongxu Jia <hongxu.jia@windriver.com> 
> +Date: Tue, 10 May 2016 11:34:50 -0400 +Subject: [PATCH]  fix unknow
> option for gold linker + +- Revert the following patch, since oe-core
> work with gcc 5 +... +commit 3055a3797f16693dfdd855fa68bc57fd900dc408 
> +Author: Peter Jones <pjones@redhat.com> 
> +Date:   Mon Feb 15 14:15:40 2016 -0500 + +    Make gcc.specs work with
> gcc 6 / binutils 2.26 + +    Apparently binutils 2.26 gets real picky
> about "ld -PIC" vs "ld -fPIC". + +    Signed-off-by: Peter Jones
> <pjones@redhat.com> +... + +- Remove unknown
> option '--add-needed' + +Signed-off-by: Hongxu Jia
> <hongxu.jia@windriver.com> +--- + gcc.specs | 2
> +- + 1 file changed, 1 insertion(+), 1 deletion(-) + +diff --git
> a/gcc.specs b/gcc.specs +index 24fabc2..5b0fdef 100644 +--- a/gcc.specs 
> ++++ b/gcc.specs +@@ -14,4 +14,4 @@ + + %{!shared:%{!static:%{!r:-pie}}}
> %{static:-Wl,-no-fatal-warnings -Wl,-static -static -Wl,-z,relro,-z,now} 
> + + *link: +-+ %{!static:--fatal-warnings} --no-undefined-version
> --no-allow-shlib-undefined --add-needed -z now --build-id
> %{!static:%{!shared:-PIE}} %{shared:-z relro -PIC} %{static:%<pie} +++
> %{!static:--fatal-warnings} --no-undefined-version
> --no-allow-shlib-undefined -z now --build-id %{!static:%{!shared:-pie}}
> %{shared:-z relro -fPIC} %{static:%<pie} +-- +2.8.1 + diff --git
> a/meta/recipes-extended/efivar/efivar/allow-multi-definitions-for-native.patch
> b/meta/recipes-extended/efivar/efivar/allow-multi-definitions-for-native.patch
>
> 
new file mode 100644
> index 0000000..87f5555 --- /dev/null +++
> b/meta/recipes-extended/efivar/efivar/allow-multi-definitions-for-native.patch
>
> 
@@ -0,0 +1,23 @@
> +Upstream-Status: Pending + +It fails to create .so file when build
> efivar-native: + +| lib.o:(*IND*+0x0): multiple definition of
> `efi_set_variable' +| lib.o:lib.c:(.text+0xa0): first defined here + +Add
> link option '-z muldefs' to fix it. + +Signed-off-by: Kai Kang
> <kai.kang@windriver.com> +--- +diff --git
> a/Make.rules b/Make.rules +index d9c0609..874bce0 100644 +---
> a/Make.rules ++++ b/Make.rules +@@ -20,6 +20,7 @@ include
> $(TOPDIR)/Make.version + 	$(CCLD) $(ccldflags) $(CPPFLAGS) $(SOFLAGS) \ +
> -Wl,-soname,$@.$(MAJOR_VERSION) \ + 	  -Wl,--version-script=$(MAP) \ ++
> -Wl,-z,muldefs \ + 	  -o $@ $^ $(LDLIBS) + + %.o : %.c diff --git
> a/meta/recipes-extended/efivar/efivar/fix-compile-failure-with-host-gcc-4.6.patch
> b/meta/recipes-extended/efivar/efivar/fix-compile-failure-with-host-gcc-4.6.patch
>
> 
new file mode 100644
> index 0000000..1c68a29 --- /dev/null +++
> b/meta/recipes-extended/efivar/efivar/fix-compile-failure-with-host-gcc-4.6.patch
>
> 
@@ -0,0 +1,45 @@
> +From 1361225abbaba878960f970df39a4570bbc39553 Mon Sep 17 00:00:00 2001 
> +From: Hongxu Jia <hongxu.jia@windriver.com> 
> +Date: Thu, 26 May 2016 21:50:01 -0400 +Subject: [PATCH] fix compile
> failure with older host gcc (<=4.6) + +While host gcc version is 4.6.3 in
> ubuntu 1204, it +did not recognize -std=gnu11 and -Wmaybe-uninitialized. 
> + +While host gcc version is 4.4.7 in centos6, it +did not recognize
> -std=gnu11, -Wmaybe-uninitialized, +and -flto. + +For native build, use
> -std=gnu99 to replace -std=gnu11, +and directly remove
> -Wmaybe-uninitialized and -flto. + +Upstream-Status: Pending + 
> +Signed-off-by: Hongxu Jia
> <hongxu.jia@windriver.com> +--- + gcc.specs | 4
> ++-- + 1 file changed, 2 insertions(+), 2 deletions(-) + +diff --git
> a/gcc.specs b/gcc.specs +index 0d4bbda..3802ca6 100644 +--- a/gcc.specs 
> ++++ b/gcc.specs +@@ -2,13 +2,13 @@ + + -D_GNU_SOURCE + +
> *efivar_cpp_options: +- -Werror -Wall -std=gnu11 -Wextra ++ -Werror -Wall
> -std=gnu99 -Wextra + + *cpp_options: + + %(efivar_cpp_options) + +
> *cc1_options: +-+ %(efivar_cpp_options) -Wmaybe-uninitialized
> -fno-merge-constants -flto -fvisibility=hidden
> %{!r:%{!fpie:%{!fPIE:%{!fpic:%{!fPIC:%{!fno-pic:-fPIE}}}}}} +++
> %(efivar_cpp_options) -fno-merge-constants -fvisibility=hidden
> %{!r:%{!fpie:%{!fPIE:%{!fpic:%{!fPIC:%{!fno-pic:-fPIE}}}}}} + +
> *self_spec: + + %{!shared:%{!static:%{!r:-pie}}}
> %{static:-Wl,-no-fatal-warnings -Wl,-static -static -Wl,-z,relro,-z,now} 
> +-- +2.8.1 + diff --git a/meta/recipes-extended/efivar/efivar_0.24.bb
> b/meta/recipes-extended/efivar/efivar_0.24.bb new file mode 100644 index
> 0000000..efffde5 --- /dev/null +++
> b/meta/recipes-extended/efivar/efivar_0.24.bb @@ -0,0 +1,43 @@ +SUMMARY =
> "Tools to manipulate UEFI variables" +DESCRIPTION = "efivar provides a
> simple command line interface to the UEFI variable facility" +HOMEPAGE =
> "https://github.com/rhinstaller/efivar" + +LICENSE = "LGPLv2.1" 
> +LIC_FILES_CHKSUM =
> "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393" + +DEPENDS =
> "popt" +DEPENDS_append_class-target = " efivar-native" + +COMPATIBLE_HOST
> = "(i.86|x86_64|arm|aarch64).*-linux" + +SRCREV =
> "963cb2e5adc145fe00717f94e382f2973f80e753" +SRC_URI =
> "git://github.com/rhinstaller/efivar.git \ +
> file://0002-disable-static-build.patch \ +" +SRC_URI_append_class-target
> = " file://0001-efivar-fix-for-cross-compile.patch \ +
> file://0003-efivar-fix-for-cross-compile.patch \ +
> ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold',
> 'file://0004-fix-unknow-option-for-gold-linker.patch', '', d)} \ +
> " +SRC_URI_append_class-native = "
> file://fix-compile-failure-with-host-gcc-4.6.patch \ +
> file://allow-multi-definitions-for-native.patch \ +
> " + +S = "${WORKDIR}/git" + +# Setting CROSS_COMPILE breaks pkgconfig, so
> just set AR +EXTRA_OEMAKE = "AR=${TARGET_PREFIX}gcc-ar" + 
> +do_compile_prepend() { +    sed -i -e s:-Werror::g ${S}/gcc.specs +} + 
> +do_install() { +    oe_runmake install DESTDIR=${D} +} + 
> +do_install_append_class-native() { +    install -D -m 0755
> ${B}/src/makeguids ${D}${bindir}/makeguids +} + +BBCLASSEXTEND =
> "native" +
> 



