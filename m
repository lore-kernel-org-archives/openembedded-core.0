Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TYG9R-0007wp-Pu
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 14:03:38 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Nov 2012 04:49:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,765,1344236400"; d="scan'208";a="246297656"
Received: from lpalcu-linux (HELO [10.237.105.42]) ([10.237.105.42])
	by fmsmga001.fm.intel.com with ESMTP; 13 Nov 2012 04:49:40 -0800
Message-ID: <50A241E4.9050801@intel.com>
Date: Tue, 13 Nov 2012 14:49:40 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120912 Thunderbird/15.0.1
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1352808309.git.laurentiu.palcu@intel.com>
	<2964a05f2b16c3c55862251ab0d509d258c57d19.1352808309.git.laurentiu.palcu@intel.com>
	<20121113123743.GC3928@jama.jama.net>
In-Reply-To: <20121113123743.GC3928@jama.jama.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 08/12] xserver-xorg: upgrade to 1.13.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Nov 2012 13:03:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 11/13/2012 02:37 PM, Martin Jansa wrote:
> On Tue, Nov 13, 2012 at 02:18:25PM +0200, Laurentiu Palcu wrote:
>> The patch contains several aditional changes:
>>  * removed one backported patch (included in the new release);
>>  * changed mips64-compiler.patch to apply properly;
>>  * licence checksum for COPYING file changed: some copyright years have
>>    been changed
>>
>> The following external modules are now built-in:
>>  * DBE
>>  * DRI2
>>  * DRI
>>  * RECORD
> 
> Can you also say why?
This was done upstream. I just updated the recipe accordingly.
> 
> And is this patch for oe-core or poky? because meta-yocto-bsp does not
> belong here.
You are right, I included the meta-yocto-bsp changes by mistake... I'll
resend a new patchset.

> 
> Cheers,
> 
>>
>> The extmod module was completely removed.
>>
>> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
>> ---
>>  meta-yocto-bsp/conf/machine/atom-pc.conf           |    3 -
>>  meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf      |    1 -
>>  meta-yocto-bsp/conf/machine/routerstationpro.conf  |    1 -
>>  meta/conf/machine/include/ia32-base.inc            |    5 +-
>>  .../xserver-xorg-1.11.4/pkgconfig-deps.patch       |   70 --------------------
>>  .../crosscompile.patch                             |    0
>>  .../fix_open_max_preprocessor_error.patch          |    0
>>  .../macro_tweak.patch                              |    0
>>  .../mips64-compiler.patch                          |   28 ++++----
>>  .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   14 +---
>>  ...erver-xorg_1.11.4.bb => xserver-xorg_1.13.0.bb} |    5 +-
>>  .../arch/powerpc/conf/machine/{{=machine}}.conf    |    1 -
>>  12 files changed, 19 insertions(+), 109 deletions(-)
>>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/pkgconfig-deps.patch
>>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.11.4 => xserver-xorg-1.13.0}/crosscompile.patch (100%)
>>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.11.4 => xserver-xorg-1.13.0}/fix_open_max_preprocessor_error.patch (100%)
>>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.11.4 => xserver-xorg-1.13.0}/macro_tweak.patch (100%)
>>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.11.4 => xserver-xorg-1.13.0}/mips64-compiler.patch (42%)
>>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.11.4.bb => xserver-xorg_1.13.0.bb} (56%)
>>
>> diff --git a/meta-yocto-bsp/conf/machine/atom-pc.conf b/meta-yocto-bsp/conf/machine/atom-pc.conf
>> index 46bc71b..77dd7fb 100644
>> --- a/meta-yocto-bsp/conf/machine/atom-pc.conf
>> +++ b/meta-yocto-bsp/conf/machine/atom-pc.conf
>> @@ -13,10 +13,7 @@ PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
>>  PREFERRED_VERSION_linux-yocto ?= "3.0%"
>>  PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
>>  XSERVER ?= "xserver-xorg \
>> -           xserver-xorg-extension-dri2 \
>>             xserver-xorg-extension-glx \
>> -           xserver-xorg-extension-extmod \
>> -           xserver-xorg-extension-dbe \
>>             xf86-input-mouse \
>>             xf86-input-keyboard \
>>             xf86-input-evdev \
>> diff --git a/meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf b/meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf
>> index 7aa498d..252f4cc 100644
>> --- a/meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf
>> +++ b/meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf
>> @@ -19,7 +19,6 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-yocto"
>>  
>>  PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
>>  XSERVER ?= "xserver-xorg \
>> -            xserver-xorg-extension-extmod \
>>              xf86-input-evdev \
>>              xf86-video-fbdev"
>>  
>> diff --git a/meta-yocto-bsp/conf/machine/routerstationpro.conf b/meta-yocto-bsp/conf/machine/routerstationpro.conf
>> index feaa26e..e5e4d1a 100644
>> --- a/meta-yocto-bsp/conf/machine/routerstationpro.conf
>> +++ b/meta-yocto-bsp/conf/machine/routerstationpro.conf
>> @@ -14,7 +14,6 @@ PREFERRED_VERSION_linux-yocto ?= "3.4%"
>>  
>>  PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
>>  XSERVER ?= "xserver-xorg \
>> -            xserver-xorg-extension-extmod \
>>              xf86-input-evdev \
>>              xf86-video-fbdev"
>>  
>> diff --git a/meta/conf/machine/include/ia32-base.inc b/meta/conf/machine/include/ia32-base.inc
>> index 4b10183..c2d267a 100644
>> --- a/meta/conf/machine/include/ia32-base.inc
>> +++ b/meta/conf/machine/include/ia32-base.inc
>> @@ -33,11 +33,8 @@ XSERVER_IA32_BASE = "xserver-xorg \
>>             xf86-input-synaptics \
>>             "
>>  
>> -XSERVER_IA32_EXT = "xserver-xorg-extension-dri \
>> -           xserver-xorg-extension-dri2 \
>> +XSERVER_IA32_EXT = "
>>             xserver-xorg-extension-glx \
>> -           xserver-xorg-extension-extmod \
>> -           xserver-xorg-extension-dbe \
>>             xserver-xorg-module-libint10 \
>>             "
>>  
>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/pkgconfig-deps.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/pkgconfig-deps.patch
>> deleted file mode 100644
>> index fee8d76..0000000
>> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/pkgconfig-deps.patch
>> +++ /dev/null
>> @@ -1,70 +0,0 @@
>> -Upstream-Status: Backport
>> -Signed-off-by: Ross Burton <ross.burton@intel.com>
>> -
>> -commit 41d903918a5721e53ed694880eab44170f9717cc
>> -Author: Jeremy Huddleston <jeremyhu@apple.com>
>> -Date:   Wed Sep 14 13:45:18 2011 -0500
>> -
>> -    xorg-server.pc.in: Remove libpciaccess and pixman-1 from Requires
>> -    
>> -    Every module building against xorg-server does not *Require* pixman nor
>> -    libpciaccess.  If such modules need pixman or pciaccess, they should be
>> -    depending on them directly rather than inheriting a dependency from
>> -    xorg-server.  To do this, they should use PKG_CHECK_MODULES in configure.ac
>> -    to check for pixman-1 or pciaccess and include the apporpriate _LIBS variable
>> -    to the appropriate _LDFLAGS variable in Makefile.am
>> -    
>> -    This also moves pixman-1 to Requires.private, so CPPFLAGS is set right to
>> -    to satisfy include dependencies but avoid linking needlessly.
>> -    
>> -    Signed-off-by: Jeremy Huddleston <jeremyhu@apple.com>
>> -    Reviewed-by: Gaetan Nadon <memsize@videotron.ca>
>> -
>> -diff --git a/configure.ac b/configure.ac
>> -index 50beb01..4bfa82c 100644
>> ---- a/configure.ac
>> -+++ b/configure.ac
>> -@@ -780,11 +780,6 @@ VIDMODEPROTO="xf86vidmodeproto >= 2.2.99.1"
>> - WINDOWSWMPROTO="windowswmproto"
>> - APPLEWMPROTO="applewmproto >= 1.4"
>> - 
>> --dnl Core modules for most extensions, et al.
>> --SDK_REQUIRED_MODULES="[xproto >= 7.0.22] [randrproto >= 1.2.99.3] [renderproto >= 0.11] [xextproto >= 7.1.99] [inputproto >= 1.9.99.902] [kbproto >= 1.0.3] fontsproto"
>> --# Make SDK_REQUIRED_MODULES available for inclusion in xorg-server.pc
>> --AC_SUBST(SDK_REQUIRED_MODULES)
>> --
>> - dnl List of libraries that require a specific version
>> - LIBAPPLEWM="applewm >= 1.4"
>> - LIBDMX="dmx >= 1.0.99.1"
>> -@@ -806,6 +801,11 @@ dnl specific modules against it
>> - PKG_CHECK_MODULES(PIXMAN, $LIBPIXMAN)
>> - REQUIRED_LIBS="$REQUIRED_LIBS $LIBPIXMAN $LIBXFONT xau"
>> - 
>> -+dnl Core modules for most extensions, et al.
>> -+SDK_REQUIRED_MODULES="[xproto >= 7.0.22] [randrproto >= 1.2.99.3] [renderproto >= 0.11] [xextproto >= 7.1.99] [inputproto >= 1.99.99.902] [kbproto >= 1.0.3] fontsproto $LIBPIXMAN"
>> -+# Make SDK_REQUIRED_MODULES available for inclusion in xorg-server.pc
>> -+AC_SUBST(SDK_REQUIRED_MODULES)
>> -+
>> - REQUIRED_MODULES="[fixesproto >= 5.0] [damageproto >= 1.1] [xcmiscproto >= 1.2.0] [xtrans >= 1.2.2] [bigreqsproto >= 1.1.0] $SDK_REQUIRED_MODULES"
>> - 
>> - if test "x$CONFIG_UDEV" = xyes &&
>> -@@ -1583,6 +1583,7 @@ if test "x$XORG" = xyes; then
>> - 	if test "x$PCI" = xyes; then
>> - 
>> - 	PKG_CHECK_MODULES([PCIACCESS], $LIBPCIACCESS)
>> -+	SDK_REQUIRED_MODULES="$SDK_REQUIRED_MODULES $LIBPCIACCESS"
>> -	SAVE_LIBS=$LIBS
>> -	SAVE_CFLAGS=$CFLAGS
>> -	CFLAGS=$PCIACCESS_CFLAGS
>> -diff --git a/xorg-server.pc.in b/xorg-server.pc.in
>> -index fb238b5..a98eca8 100644
>> ---- a/xorg-server.pc.in
>> -+++ b/xorg-server.pc.in
>> -@@ -15,7 +15,6 @@ abi_extension=@abi_extension@
>> - Name: xorg-server
>> - Description: Modular X.Org X Server
>> - Version: @PACKAGE_VERSION@
>> --Requires: pixman-1 pciaccess
>> - Requires.private: @SDK_REQUIRED_MODULES@
>> - Cflags: -I${sdkdir} @symbol_visibility@
>> - Libs: -L${libdir}
>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/crosscompile.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/crosscompile.patch
>> similarity index 100%
>> rename from meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/crosscompile.patch
>> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/crosscompile.patch
>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/fix_open_max_preprocessor_error.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/fix_open_max_preprocessor_error.patch
>> similarity index 100%
>> rename from meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/fix_open_max_preprocessor_error.patch
>> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/fix_open_max_preprocessor_error.patch
>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/macro_tweak.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/macro_tweak.patch
>> similarity index 100%
>> rename from meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/macro_tweak.patch
>> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/macro_tweak.patch
>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/mips64-compiler.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/mips64-compiler.patch
>> similarity index 42%
>> rename from meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/mips64-compiler.patch
>> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/mips64-compiler.patch
>> index e6bc95b..168368e 100644
>> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/mips64-compiler.patch
>> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/mips64-compiler.patch
>> @@ -6,24 +6,24 @@ This patch choses the right values for mips64
>>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>  
>>  Upstream-Status: Pending
>> -Index: xorg-server-1.11.2/hw/xfree86/common/compiler.h
>> +Index: xorg-server-1.13.0/hw/xfree86/common/compiler.h
>>  ===================================================================
>> ---- xorg-server-1.11.2.orig/hw/xfree86/common/compiler.h	2012-05-10 12:19:59.485599046 -0700
>> -+++ xorg-server-1.11.2/hw/xfree86/common/compiler.h	2012-05-10 12:20:53.109602488 -0700
>> -@@ -104,6 +104,7 @@
>> - 
>> - #  if !defined(__arm__)
>> - #   if !defined(__sparc__) && !defined(__sparc) && !defined(__arm32__) && !defined(__nds32__) \
>> +--- xorg-server-1.13.0-orig/hw/xfree86/common/compiler.h	2012-06-14 23:04:29.000000000 +0300
>> ++++ xorg-server-1.13.0/hw/xfree86/common/compiler.h	2012-11-08 10:06:50.865831783 +0200
>> +@@ -101,6 +101,7 @@
>> + #if defined(NO_INLINE) || defined(DO_PROTOTYPES)
>> + #if !defined(__arm__)
>> + #if !defined(__sparc__) && !defined(__sparc) && !defined(__arm32__) && !defined(__nds32__) \
>>  +      && !defined(__mips64) \
>>         && !(defined(__alpha__) && defined(linux)) \
>>         && !(defined(__ia64__) && defined(linux)) \
>>   
>> -@@ -708,7 +709,7 @@
>> +@@ -721,7 +722,7 @@
>>   }
>>   
>> - #   elif defined(__mips__) || (defined(__arm32__) && !defined(__linux__))
>> --#    ifdef __arm32__
>> -+#    if defined (__arm32__) || defined (__mips64)
>> - #     define PORT_SIZE long
>> - #    else
>> - #     define PORT_SIZE short
>> + #elif defined(__mips__) || (defined(__arm32__) && !defined(__linux__))
>> +-#ifdef __arm32__
>> ++#if defined (__arm32__) || defined (__mips64)
>> + #define PORT_SIZE long
>> + #else
>> + #define PORT_SIZE short
>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
>> index 33564eb..9d5e1c2 100644
>> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
>> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
>> @@ -2,7 +2,7 @@ DESCRIPTION = "The X.Org X server"
>>  HOMEPAGE = "http://www.x.org"
>>  SECTION = "x11/base"
>>  LICENSE = "MIT-X"
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=bc098b9774ed096943f6c37b5beeef13"
>>  
>>  # xf86-*-* packages depend on an X server built with the xfree86 DDX
>>  # so we have a virtual to represent that:
>> @@ -13,7 +13,7 @@ PROVIDES = "virtual/xserver-xf86"
>>  PROVIDES += "virtual/xserver"
>>  
>>  PE = "2"
>> -INC_PR = "r3"
>> +INC_PR = "r5"
>>  
>>  XORG_PN = "xorg-server"
>>  SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2"
>> @@ -48,12 +48,7 @@ PACKAGES =+ "${PN}-security-policy \
>>               ${PN}-utils \
>>               ${PN}-xephyr \
>>               ${PN}-multimedia-modules \
>> -             ${PN}-extension-dri \
>> -             ${PN}-extension-dri2 \
>>               ${PN}-extension-glx \
>> -             ${PN}-extension-record \
>> -             ${PN}-extension-extmod \
>> -             ${PN}-extension-dbe \
>>               ${PN}-module-libint10 \
>>               ${PN}-module-libafb \
>>               ${PN}-module-libwfb  \
>> @@ -82,12 +77,7 @@ FILES_${PN}-xvfb = "${bindir}/Xvfb"
>>  FILES_${PN}-utils = "${bindir}/scanpci ${bindir}/pcitweak ${bindir}/ioport ${bindir}/in[bwl] ${bindir}/out[bwl] ${bindir}/mmap[rw] ${bindir}/gtf ${bindir}/getconfig ${bindir}/getconfig.pl"
>>  FILES_${PN}-xephyr = "${bindir}/Xephyr"
>>  FILES_${PN}-multimedia-modules = "${libdir}/xorg/modules/multimedia/*drv*"
>> -FILES_${PN}-extension-dri = "${libdir}/xorg/modules/extensions/libdri.so"
>> -FILES_${PN}-extension-dri2 = "${libdir}/xorg/modules/extensions/libdri2.so"
>>  FILES_${PN}-extension-glx = "${libdir}/xorg/modules/extensions/libglx.so"
>> -FILES_${PN}-extension-record = "${libdir}/xorg/modules/extensions/librecord.so"
>> -FILES_${PN}-extension-extmod = "${libdir}/xorg/modules/extensions/libextmod.so"
>> -FILES_${PN}-extension-dbe = "${libdir}/xorg/modules/extensions/libdbe.so"
>>  FILES_${PN}-module-libint10 = "${libdir}/xorg/modules/libint10.so"
>>  FILES_${PN}-module-libafb = "${libdir}/xorg/modules/libafb.so"
>>  FILES_${PN}-module-libwfb = "${libdir}/xorg/modules/libwfb.so"
>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.4.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.0.bb
>> similarity index 56%
>> rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.4.bb
>> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.0.bb
>> index 4739ee2..8ad87b8 100644
>> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.4.bb
>> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.0.bb
>> @@ -4,10 +4,9 @@ require xserver-xorg.inc
>>  SRC_URI += "file://crosscompile.patch \
>>              file://fix_open_max_preprocessor_error.patch \
>>              file://mips64-compiler.patch \
>> -            file://pkgconfig-deps.patch \
>>             "
>>  
>> -SRC_URI[md5sum] = "256325e9b17dff479d92bed97f6b0adb"
>> -SRC_URI[sha256sum] = "3e2935bc400612df58d5b5e6840829e2c63af02c2e7d2893092500358a4366fc"
>> +SRC_URI[md5sum] = "bde3d178b756597d2ec2a19ef60d2e1f"
>> +SRC_URI[sha256sum] = "548b91cb01087ad4f892428e7ac4955251cf12393e86c70420436b33848ef28a"
>>  
>>  PR = "${INC_PR}.0"
>> diff --git a/scripts/lib/bsp/substrate/target/arch/powerpc/conf/machine/{{=machine}}.conf b/scripts/lib/bsp/substrate/target/arch/powerpc/conf/machine/{{=machine}}.conf
>> index cbf3c32..1d6143a 100644
>> --- a/scripts/lib/bsp/substrate/target/arch/powerpc/conf/machine/{{=machine}}.conf
>> +++ b/scripts/lib/bsp/substrate/target/arch/powerpc/conf/machine/{{=machine}}.conf
>> @@ -43,7 +43,6 @@ PREFERRED_VERSION_{{=preferred_kernel}} ?= "{{=preferred_kernel_version}}%"
>>  {{ if xserver == "y": }}
>>  PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
>>  XSERVER = "xserver-xorg \
>> -           xserver-xorg-extension-extmod \
>>             xf86-input-evdev \
>>             xf86-video-fbdev"
>>  
>> -- 
>> 1.7.9.5
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 


