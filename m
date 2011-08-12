Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QrrGB-0003eK-Um for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 14:54:48 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7CCoFgk011958
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2011 13:50:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05703-10 for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2011 13:50:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7CCo4vw011947
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2011 13:50:08 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Aug 2011 13:49:24 +0100
Message-ID: <1313153364.14274.486.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] local.conf.sample: Cleanup and improve
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
X-List-Received-Date: Fri, 12 Aug 2011 12:54:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

local.conf is the first thing anyone new to the project sees. Over time it
has built up a ton cruft and isn't even accurate in places.
    
This patch:
  
* Moves things to local.conf.sample.extended if a new user is unlikely
  to need to immediately care about the options
* Reorders the file to be more intuitive to a new user
* Moves certain default values to default-distrovars.inc in cases where
  most users wouldn't want to change the value
* Adds large blocks of text to explain what an option does. There have
  been too many cases of a user not realising what some of these
  settings do and how they can use them to their advantage (like DL_DIR
  for example).
    
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 2ef25e4..c2fd77e 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -41,3 +41,9 @@ COMMERCIAL_QT ?= ""
 COMMON_LICENSE_DIR ??= "${COREBASE}/meta/files/common-licenses"
 
 BB_GENERATE_MIRROR_TARBALLS ??= "0"
+
+NO32LIBS ??= "1"
+
+# Default to emitting logfiles if a build fails.
+BBINCLUDELOGS ??= "yes"
+
diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 1e0c211..37943e7 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -1,200 +1,206 @@
-# CONF_VERSION is increased each time build/conf/ changes incompatibly
-CONF_VERSION = "1"
-
-# Uncomment and change to cache the files Poky downloads in an alternative
-# location, default is ${TOPDIR}/downloads
-#DL_DIR ?= "${TOPDIR}/downloads"
-# Uncomment and change to cache Poky's built staging output in an alternative
-# location, default is ${TOPDIR}/sstate-cache
-#SSTATE_DIR ?= "${TOPDIR}/sstate-cache"
+#
+# This file is your local configuration file and is where all local user settings
+# are placed. The comments in this file give some guide to the options a new user
+# to the system might want to change but pretty much any configuration option can
+# be set in this file. More adventurous users can look at local.conf.extended 
+# which contains other examples of configuration which can be placed in this file
+# but new users likely don't need any of them initially.
+#
+# Lines starting with the '#' character are commented out and in some cases the 
+# default values are provided as comments to show people example syntax. Enabling
+# the option is a question of removing the # character and making any change to the
+# variable as required.
 
-# Uncomment and set to allow bitbake to execute multiple tasks at once.
-# For a quadcore, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
-# be appropriate.
-# BB_NUMBER_THREADS = "4"
-# Also, make can be passed flags so it run parallel threads e.g.:
+#
+# Parallelism Options
+#
+# These two options control how much parallelism BitBake should use. The first 
+# option determines how many tasks bitbake should run in parallel:
+#
+#BB_NUMBER_THREADS = "4"
+# 
+# The second option controls how many processes make should run in parallel when
+# running compile tasks:
+#
 # PARALLEL_MAKE = "-j 4"
+#
+# For a quadcore, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
+# be appropriate for example.
 
-# Set a default machine to target unless a machine is selected from the 
-# lists below.
-MACHINE ??= "qemux86"
-
-# Supported emulation machines
+#
+# Machine Selection
+#
+# You need to select a specific machine to target the build with. There are a selection
+# emulated machines available which can boot and run in the QEMU emulator:
+#
 #MACHINE ?= "qemuarm"
 #MACHINE ?= "qemumips"
 #MACHINE ?= "qemuppc"
 #MACHINE ?= "qemux86"
 #MACHINE ?= "qemux86-64"
+#
+# This sets the default machine to be qemux86 if no other machine is selected:
+MACHINE ??= "qemux86"
 
-# BBMASK is a regular expression that can be used to tell BitBake to ignore
-# certain recipes.
-#BBMASK = ""
-
-# EXTRA_IMAGE_FEATURES allows extra packages to be added to the generated images 
-# (Some of these are automatically added to certain image types)
-# "dbg-pkgs"     - add -dbg packages for all installed packages
-#                  (adds symbol information for debugging/profiling)
-# "dev-pkgs"     - add -dev packages for all installed packages
-#                  (useful if you want to develop against libs in the image)
-# "tools-sdk"      - add development tools (gcc, make, pkgconfig etc.)
-# "tools-debug"    - add debugging tools (gdb, strace)
-# "tools-profile"  - add profiling tools (oprofile, exmap, lttng valgrind (x86 only))
-# "tools-testapps" - add useful testing tools (ts_print, aplay, arecord etc.)
-# "debug-tweaks"   - make an image for suitable of development
-#                    e.g. ssh root access has a blank password
-# There are other application targets too, see meta/classes/core-image.bbclass 
-# and meta/recipes-core/tasks/task-core.bb for more details.
-# The -sdk image includes these features by default now.
-EXTRA_IMAGE_FEATURES = "debug-tweaks"
-
-# A list of packaging systems used in generated images
-# The first package type listed will be used for rootfs generation
-# include 'package_deb' for debs
-# include 'package_ipk' for ipks
-# include 'package_rpm' for rpms
-#PACKAGE_CLASSES ?= "package_rpm package_deb package_ipk"
-PACKAGE_CLASSES ?= "package_ipk"
-
-# mklibs library size optimization is more useful to smaller images,
-# and less useful for bigger images. Also mklibs library optimization
-# can break the ABI compatibility, so should not be applied to the
-# images which are to be extended or upgraded later.
-#This enabled mklibs library size optimization just for the specified image.
-#MKLIBS_OPTIMIZED_IMAGES ?= "core-image-minimal"
-#This enable mklibs library size optimization will be for all the images.
-#MKLIBS_OPTIMIZED_IMAGES ?= "all"
-
-# A list of additional classes to use when building the system
-# include 'image-mklibs' to reduce shared library files size for an image
-# include 'image-prelink' in order to prelink the filesystem image
-# include 'image-swab' to perform host system intrusion detection
-# NOTE: if listing mklibs & prelink both, then make sure mklibs is before prelink
-USER_CLASSES ?= "image-mklibs image-prelink"
-
-# Uncomment this to specify where BitBake should create its temporary files.
-# Note that a full build of everything in OpenEmbedded will take GigaBytes of hard
-# disk space, so make sure to free enough space. The default TMPDIR is
-# <build directory>/tmp
-#TMPDIR = "${COREBASE}/build/tmp"
+#
+# Where to place downloads
+#
+# During a first build the system will download many differernt source code tarballs
+# from various upstream projects. This can take a while, particularly if your network
+# connection is slow. These are all stored in DL_DIR. When wiping and rebuilding you
+# can preserve this directory to speed up this part of subsequent builds. This directory
+# is safe to share between multiple builds on the same machine too.
+#
+# The default is a downloads directory under TOPDIR which is the build directory.
+#
+#DL_DIR ?= "${TOPDIR}/downloads"
 
-# The following are used to control options related to debugging.
 #
-# Uncomment this to change the optimization to make debugging easer, at the 
-# possible cost of performance.
-# DEBUG_BUILD = "1"
+# Where to place shared-state files
+#
+# BitBake has the capability to accelerate builds based on previously built output.
+# This is done using "shared state" files which can be through of as cache objects
+# and this option determines where those files are placed.
 #
-# Uncomment this to disable the stripping of the installed binaries
-# INHIBIT_PACKAGE_STRIP = "1"
+# You can wipe out TMPDIR leaving this directory intact and the build would regenerate
+# from these files if no chages were made to the configuration. If changes were made
+# to the configuration, only shared state files where the state was still valid would
+# be used (done using checksums).
 #
-# Uncomment this to disable the split of the debug information into -dbg files
-# INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+# The default is a sstate-cache directory under TOPDIR.
 #
-# When splitting debug information, the following controls the results of the
-# file splitting.
+#SSTATE_DIR ?= "${TOPDIR}/sstate-cache"
+
 #
-#  .debug (default):
-#    When splitting the debug information will be placed into
-#    a .debug directory in the same dirname of the binary produced:
-#      /bin/foo -> /bin/.debug/foo
+# Where to place the build output
 #
-#  debug-file-directory:
-#    When splitting the debug information will be placed into
-#    a central debug-file-directory, /usr/lib/debug:
-#      /bin/foo -> /usr/lib/debug/bin/foo.debug
+# This option specifies where the bulk of the building work should be done and
+# where BitBake should place its temporary files and output. Keep in mind that
+# this includes the extraction and complation of many applications and the toolchain
+# which can use Gigabytes of hard disk space.
 #
-#    Any source code referenced in the debug symbols will be copied
-#    and made available within the /usr/src/debug directory
+# The default is a tmp directory under TOPDIR.
 #
-PACKAGE_DEBUG_SPLIT_STYLE = '.debug'
-# PACKAGE_DEBUG_SPLIT_STYLE = 'debug-file-directory'
+#TMPDIR = "${TOPDIR}/tmp"
 
-# Uncomment these to build a package such that you can use gprof to profile it.
-# NOTE: This will only work with 'linux' targets, not
-# 'linux-uclibc', as uClibc doesn't provide the necessary
-# object files.  Also, don't build glibc itself with these
-# flags, or it'll fail to build.
-#
-# PROFILE_OPTIMIZATION = "-pg"
-# SELECTED_OPTIMIZATION = "${PROFILE_OPTIMIZATION}"
-# LDFLAGS =+ "-pg"
 
-# Uncomment this if you want BitBake to emit the log if a build fails.
-BBINCLUDELOGS = "yes"
+#
+# Package Management configuration
+#
+# This variable lists which packaging formats to enable. Multiple package backends 
+# can be enabled at once and the first item listed in the variable will be used 
+# to generate the root filesystems.
+# Options are:
+#  - 'package_deb' for debian style deb files
+#  - 'package_ipk' for ipk files are used by opkg (a debian style embedded package manager)
+#  - 'package_rpm' for rpm style packages
+# E.g.: PACKAGE_CLASSES ?= "package_rpm package_deb package_ipk"
+# We default to rpm:
+PACKAGE_CLASSES ?= "package_rpm"
 
-# The architecture to build SDK items for, by setting this you can build SDK
-# packages for architectures other than the host i.e. building i686 packages
-# on an x86_64 host.
+#
+# SDK/ADT target architecture
+#
+# This variable specified the architecture to build SDK/ADT items for and means
+# you can build the SDK packages for architectures other than the machine you are 
+# running the build on (i.e. building i686 packages on an x86_64 host._
 # Supported values are i686 and x86_64
 #SDKMACHINE ?= "i686"
 
-# We can try and fetch shared state packages from a http, https or ftp
-# mirror. Set this variable to the root of a pstage directory on a server.
-#SSTATE_MIRRORS ?= "\
-#file://.* http://someserver.tld/share/sstate/ \n \
-#file://.* file:///some/local/dir/sstate/"
+#
+# Extra image configuration defaults
+#
+# The EXTRA_IMAGE_FEATURES variable allows extra packages to be added to the generated 
+# images. Some of these options are added to certain image types automatically. The
+# variable can contain the following options:
+#  "dbg-pkgs"       - add -dbg packages for all installed packages
+#                     (adds symbol information for debugging/profiling)
+#  "dev-pkgs"       - add -dev packages for all installed packages
+#                     (useful if you want to develop against libs in the image)
+#  "tools-sdk"      - add development tools (gcc, make, pkgconfig etc.)
+#  "tools-debug"    - add debugging tools (gdb, strace)
+#  "tools-profile"  - add profiling tools (oprofile, exmap, lttng valgrind (x86 only))
+#  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord etc.)
+#  "debug-tweaks"   - make an image for suitable of development
+#                     e.g. ssh root access has a blank password
+# There are other application targets that can be uses here too, see 
+# meta/classes/core-image.bbclass and meta/recipes-core/tasks/task-core.bb for more details.
+# We default to enabling the debugging tweaks.
+EXTRA_IMAGE_FEATURES = "debug-tweaks"
 
-# Set IMAGETEST to qemu if you want to build testcases and start 
-# testing in qemu after do_rootfs.
-#IMAGETEST = "qemu"
+#
+# Additional image features
+#
+# The following is a list of additional classes to use when building images which
+# enable extra features. Some available options which can be included in this variable 
+# are:
+#   - 'image-mklibs' to reduce shared library files size for an image
+#   - 'image-prelink' in order to prelink the filesystem image
+#   - 'image-swab' to perform host system intrusion detection
+# NOTE: if listing mklibs & prelink both, then make sure mklibs is before prelink
+# NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
+USER_CLASSES ?= "image-mklibs image-prelink"
 
-# By default test cases in sanity suite will be ran. If you want to run other 
-# test suite or specific test case(e.g. bat or boot test case under sanity suite), 
-# list them like following.
+#
+# Runtime testing of images
+#
+# The build system can test booting virtual machine images under qemu (an emulator)
+# after any root filesystems are created and run tests against those images. To
+# enable this uncomment this line
+#IMAGETEST = "qemu"
+#
+# This variable controls which tests are run against virtual images if enabled
+# above. The following would enable bat, oot test case under sanity suite and 
+# toolchain tests
 #TEST_SCEN = "sanity bat sanity:boot toolchain"
-
-#Because of the QEMU booting slowness issue(see bug #646 and #618), autobuilder
-#may suffer a timeout issue when running sanity test. We introduce variable
-#TEST_SERIALIZE here to reduce the time on sanity test. It is by default set 
-#to 1. This will start image and run cases in the same image without reboot 
-#or kill. If it is set to 0, the image will be copied and tested for each 
-#case, which will take much time.
+#
+# Because of the QEMU booting slowness issue(see bug #646 and #618), autobuilder
+# may suffer a timeout issue when running sanity test. We introduce variable
+# TEST_SERIALIZE here to reduce the time on sanity test. It is by default set 
+# to 1. This will start image and run cases in the same image without reboot 
+# or kill. If it is set to 0, the image will be copied and tested for each 
+# case, which will take longer but be more precise.
 #TEST_SERIALIZE = "1"
 
-# ENABLE_BINARY_LOCALE_GENERATION controls the generation of binary locale
-# packages at build time using qemu-native. Disabling it (by setting it to 0)
-# will save some build time at the expense of breaking i18n on devices with
-# less than 128MB RAM.
-ENABLE_BINARY_LOCALE_GENERATION = "1"
-
-# Set GLIBC_GENERATE_LOCALES to the locales you wish to generate should you not
-# wish to perform the time-consuming step of generating all LIBC locales.
-# NOTE: If removing en_US.UTF-8 you will also need to uncomment, and set
-# appropriate values for IMAGE_LINGUAS and LIMIT_BUILT_LOCALES
-# WARNING: this may break localisation!
-#GLIBC_GENERATE_LOCALES = "en_GB.UTF-8 en_US.UTF-8"
-# See message above as to whether setting these is required
-#IMAGE_LINGUAS ?= "en-gb"
-#LIMIT_BUILT_LOCALES ?= "POSIX en_GB"
-
-# This value is currently used by pseudo to determine if the recipe should
-# build both the 32-bit and 64-bit wrapper libraries on a 64-bit build system.
-#
-# Pseudo will attempt to determine if a 32-bit wrapper is necessary, but
-# it doesn't always guess properly.  If you have 32-bit executables on 
-# your 64-bit build system, you likely want to set this to "0", 
-# otherwise you could end up with incorrect file attributes on the 
-# target filesystem.
-#
-# Default to not build 32 bit libs on 64 bit systems, comment this
-# out if that is desired
-NO32LIBS = "1"
-
+#
+# Interactive shell configuration
+#
+# Under certain circumstances the system may need input from you and to do this it 
+# can launch an interactive shell. It needs to do this since the build is 
+# multithreaded and needs to be able to handle the case where more than one parallel
+# process may require the user's attention. The default is to use xterm.
+#
+# Examples of the occasions this may happen are when resolving patches which cannot
+# be applied, to use the devshell or the kernel menuconfig
+#
 # If you do not use (or have installed) xterm you will need to
 # uncomment these variables and set them to the terminal you wish to use
-# when resolving patches which cannot be applied
-# Supported shell prefixes for *_TERMCMD and *_TERMCMDRUN ARE:
+# 
+# Supported shell prefixes for *_TERMCMD and *_TERMCMDRUN are:
 # GNOME, SCREEN, XTERM and KONSOLE
 # Note: currently, Konsole support only works for KDE 3.x due to the way
 # newer Konsole versions behave
 #TERMCMD = "${XTERM_TERMCMD}"
 #TERMCMDRUN = "${XTERM_TERMCMDRUN}"
-# Alternatively, if you prefer you can disable patch resolution:
+# You can disable interactive patch resolution (tasks will just fail instead) with:
 #PATCHRESOLVE = "noop"
 
-# Uncomment this if your host distribution provides the help2man tool.
-#ASSUME_PROVIDED += "help2man-native"
+#
+# Shared-state files from other locations
+#
+# As mentioned above, shared state files are prebuilt cache data objects which can 
+# used to accelerate build time. This variable can be used to configure the system
+# to search other mirror locations for these objects before it builds the data itself.
+#
+# This can be a filesystem directory, or a remote url such as http or ftp. These
+# would contain the sstate-cache results from previous builds (possibly from other 
+# machines). This variable works like fetcher MIRRORS/PREMIRRORS and points to the 
+# cache locations to check for the shared objects.
+#SSTATE_MIRRORS ?= "\
+#file://.* http://someserver.tld/share/sstate/ \n \
+#file://.* file:///some/local/dir/sstate/"
 
-# Uncomment the following lines to enable multilib builds
-#require conf/multilib.conf
-#MULTILIBS = "multilib:lib32"
-#DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
+# CONF_VERSION is increased each time build/conf/ changes incompatibly and is used to
+# track the version of this file when it was generated. This can safely be ignored if
+# this doesn't mean anything to you.
+CONF_VERSION = "1"
diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
new file mode 100644
index 0000000..a42774c
--- /dev/null
+++ b/meta/conf/local.conf.sample.extended
@@ -0,0 +1,116 @@
+# BBMASK is a regular expression that can be used to tell BitBake to ignore
+# certain recipes.
+#BBMASK = ""
+
+# eglibc configurability is used to reduce minimal images's size.
+# the all supported eglibc options are listed in DISTRO_FEATURES_LIBC
+# and disabled by default. Uncomment and copy the DISTRO_FEATURES_LIBC
+# and DISTRO_FEATURES definitions to local.conf to enable the options.
+#DISTRO_FEATURES_LIBC = "ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
+#               libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse \
+#               libc-getlogin libc-idn libc-inet libc-inet-anl libc-libm libc-libm-big libc-locales libc-locale-code \
+#               libc-memusage libc-nis libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams libc-sunrpc \
+#               libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc \
+#               libc-posix-wchar-io"
+
+#DISTRO_FEATURES = "alsa bluetooth ext2 irda pcmcia usbgadget usbhost wifi nfs zeroconf pci ${DISTRO_FEATURES_LIBC}"
+
+# ENABLE_BINARY_LOCALE_GENERATION controls the generation of binary locale
+# packages at build time using qemu-native. Disabling it (by setting it to 0)
+# will save some build time at the expense of breaking i18n on devices with
+# less than 128MB RAM.
+#ENABLE_BINARY_LOCALE_GENERATION = "1"
+
+# Set GLIBC_GENERATE_LOCALES to the locales you wish to generate should you not
+# wish to perform the time-consuming step of generating all LIBC locales.
+# NOTE: If removing en_US.UTF-8 you will also need to uncomment, and set
+# appropriate values for IMAGE_LINGUAS and LIMIT_BUILT_LOCALES
+# WARNING: this may break localisation!
+#GLIBC_GENERATE_LOCALES = "en_GB.UTF-8 en_US.UTF-8"
+# See message above as to whether setting these is required
+#IMAGE_LINGUAS ?= "en-gb"
+#LIMIT_BUILT_LOCALES ?= "POSIX en_GB"
+
+# The following are used to control options related to debugging.
+#
+# Uncomment this to change the optimization to make debugging easer, at the 
+# possible cost of performance.
+# DEBUG_BUILD = "1"
+#
+# Uncomment this to disable the stripping of the installed binaries
+# INHIBIT_PACKAGE_STRIP = "1"
+#
+# Uncomment this to disable the split of the debug information into -dbg files
+# INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+#
+# When splitting debug information, the following controls the results of the
+# file splitting.
+#
+#  .debug (default):
+#    When splitting the debug information will be placed into
+#    a .debug directory in the same dirname of the binary produced:
+#      /bin/foo -> /bin/.debug/foo
+#
+#  debug-file-directory:
+#    When splitting the debug information will be placed into
+#    a central debug-file-directory, /usr/lib/debug:
+#      /bin/foo -> /usr/lib/debug/bin/foo.debug
+#
+#    Any source code referenced in the debug symbols will be copied
+#    and made available within the /usr/src/debug directory
+#
+#PACKAGE_DEBUG_SPLIT_STYLE = '.debug'
+# PACKAGE_DEBUG_SPLIT_STYLE = 'debug-file-directory'
+
+# Uncomment these to build a package such that you can use gprof to profile it.
+# NOTE: This will only work with 'linux' targets, not
+# 'linux-uclibc', as uClibc doesn't provide the necessary
+# object files.  Also, don't build glibc itself with these
+# flags, or it'll fail to build.
+#
+# PROFILE_OPTIMIZATION = "-pg"
+# SELECTED_OPTIMIZATION = "${PROFILE_OPTIMIZATION}"
+# LDFLAGS =+ "-pg"
+
+# TCMODE controls the characteristics of the generated packages/images by
+# telling poky which toolchain 'profile' to use.
+#
+# The default is "default"
+# Use "external-MODE" to use the precompiled external toolchains where MODE
+# is the type of external toolchain to use e.g. eabi. You need to ensure 
+# the toolchain you want to use is included in an an appropriate layer
+# TCMODE = "external-eabi"
+
+# mklibs library size optimization is more useful to smaller images,
+# and less useful for bigger images. Also mklibs library optimization
+# can break the ABI compatibility, so should not be applied to the
+# images which are to be extended or upgraded later.
+#This enabled mklibs library size optimization just for the specified image.
+#MKLIBS_OPTIMIZED_IMAGES ?= "core-image-minimal"
+#This enable mklibs library size optimization will be for all the images.
+#MKLIBS_OPTIMIZED_IMAGES ?= "all"
+
+# Uncomment this if your host distribution provides the help2man tool.
+#ASSUME_PROVIDED += "help2man-native"
+
+# This value is currently used by pseudo to determine if the recipe should
+# build both the 32-bit and 64-bit wrapper libraries on a 64-bit build system.
+#
+# Pseudo will attempt to determine if a 32-bit wrapper is necessary, but
+# it doesn't always guess properly.  If you have 32-bit executables on 
+# your 64-bit build system, you likely want to set this to "0", 
+# otherwise you could end up with incorrect file attributes on the 
+# target filesystem.
+#
+# Default is to not build 32 bit libs on 64 bit systems, uncomment this
+# if you need the 32 bits libs
+#NO32LIBS = "0"
+
+# Uncomment the following lines to enable multilib builds
+#require conf/multilib.conf
+#MULTILIBS = "multilib:lib32"
+#DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
+
+# The network based PR service host and port
+#PRSERV_HOST = "localhost"
+#PRSERV_PORT = "8585"



