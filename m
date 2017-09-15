Return-Path: <prvs=424ce9e2f=mnhu@prevas.dk>
X-Greylist: delayed 865 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 15 Sep 2017 18:36:25 UTC
Received: from mail02.prevas.se (mail02.prevas.se [62.95.78.10])
	by mail.openembedded.org (Postfix) with ESMTP id 680C878622
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 18:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=prevas.dk; i=@prevas.dk; l=13539; q=dns/txt;
	s=ironport2; t=1505500588; x=1537036588;
	h=from:subject:to:cc:references:message-id:date:
	mime-version:in-reply-to;
	bh=mO0nwNu4yoORjvMGpMzu25hSgJMz62ls6ejtawT79DA=;
	b=s1uaQLVtkDenySES6Lsl1x+12EjtaM/1sQGDZoDAB9ng+CbSryZXQN1e
	oJMcgldcPjvOIrYyv0i7agfvknMjU/KsJCR1OnsUPJ3FAwRyZMyyHh8Tp
	GBPBXWDuIynOv9tPLswVCC7XOb44gqUy8IP1NxflpvVzO1sWiCgXTRzCL A=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GCAAByGbxZ/+iTuFUNUBkBAQEBAgEBA?=
	=?us-ascii?q?QEIAQEBAYQ/gRWDdZsrMSt5lS6CEgqFPAKEahcBAgEBAQEBAQEDhikBAQEDI0g?=
	=?us-ascii?q?OEAsNAQQGGBICAkkOBg0GAgEBiiKqWBE4a4InIosMAQEBAQEBAQMBAQEBAQETD?=
	=?us-ascii?q?4MrhTUrC4I9NYRiQiKCRYJBHwWHP5lGhDmCIYRdg1iFRoIThWqDcYcKSIk4izS?=
	=?us-ascii?q?BOSEDgUEyKTFJhU6BUHSGVCqCFwEBAQ?=
X-IPAS-Result: =?us-ascii?q?A2GCAAByGbxZ/+iTuFUNUBkBAQEBAgEBAQEIAQEBAYQ/gRW?=
	=?us-ascii?q?DdZsrMSt5lS6CEgqFPAKEahcBAgEBAQEBAQEDhikBAQEDI0gOEAsNAQQGGBICA?=
	=?us-ascii?q?kkOBg0GAgEBiiKqWBE4a4InIosMAQEBAQEBAQMBAQEBAQETD4MrhTUrC4I9NYR?=
	=?us-ascii?q?iQiKCRYJBHwWHP5lGhDmCIYRdg1iFRoIThWqDcYcKSIk4izSBOSEDgUEyKTFJh?=
	=?us-ascii?q?U6BUHSGVCqCFwEBAQ?=
X-IronPort-AV: E=Sophos;i="5.42,398,1500933600"; 
	d="log'?conf'?scan'208";a="2487290"
Received: from unknown (HELO [10.0.0.232]) ([85.184.147.232])
	by mail02.prevas.se with ESMTP/TLS/DHE-RSA-AES128-SHA;
	15 Sep 2017 20:20:16 +0200
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <mnhu@prevas.dk>
To: Tom Rini <trini@konsulko.com>
References: <1501012689-2574-1-git-send-email-trini@konsulko.com>
	<01d79bbc-39d1-b610-f199-15dc2b63c10c@prevas.dk>
	<20170915121620.GR4560@bill-the-cat>
Message-ID: <48cfd456-5bb7-8446-2954-b055983e58cd@prevas.dk>
Date: Fri, 15 Sep 2017 20:20:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170915121620.GR4560@bill-the-cat>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image: Fix "metadata is not deterministic" when chaining 2+ CONVERSION_CMDs
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
X-List-Received-Date: Fri, 15 Sep 2017 18:36:27 -0000
X-Groupsio-MsgNum: 102990
Content-Type: multipart/mixed; boundary="------------F911007C9A63AAFD417562B0"
Content-Language: en-IE

--------------F911007C9A63AAFD417562B0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Tom,

On 2017-09-15 14:16, Tom Rini wrote:
>> This commit has resulted in more or less persistent basehash issues
>> for my cpio.gz.u-boot image:
>>
>> ERROR: When reparsing /home/mnhu/projects/pil/yocto/meta-pil/recipes-filesystems/rescue-rootfs.bb.do_image_cpio,
>> the basehash value changed from ac9907bbb8ee2ee6d9ca90f7a7e265f5 to
>> 8c7b717add6b1d1ba6ff761ebfdedf01. The metadata is not deterministic
>> and this needs to be fixed.
>>
>> The error occurs repeatedly when doing `bitbake -c clean
>> rescue-rootfs && bitbake rescue-rootfs`. Reverting the commit makes
>> the error go away.
>>
>> Also, the issue only appears for cpio.gz.u-boot image types, but not
>> for cpio.gz
>>
>> I am far from an expert in bitbake signature handling, so please let
>> me know what to do, to debug this further.
> Can you let me know what layers and machine I need to reproduce this?
> I'll take a look, thanks!

I am able to reproduce with the following:

   - Ubuntu 16.04 based on the attached Dockerfile
   - A clean clone of poky (commit 072430b9b3)
   - meta, meta-poky, and meta-yocto-bsp (see build-config.log)
   - beaglebone machine and gpio.gz.u-boot image type (see local.conf)

// Martin


--------------F911007C9A63AAFD417562B0
Content-Type: text/plain; charset=UTF-8;
 name="Dockerfile"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename="Dockerfile"

FROM ubuntu:16.04
MAINTAINER Martin Hundebøll <mnhu@prevas.dk>

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y python python3 build-essential locales
RUN apt-get install -y chrpath cpio diffstat gawk git texinfo wget iputils-ping openssh-client
RUN apt-get install -y zsh vim less
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8

RUN groupadd admin; \
    useradd -m -p $(openssl passwd -crypt foobar) -s /bin/zsh -G admin mnhu;
USER mnhu
WORKDIR /home/mnhu
CMD ["/bin/zsh"]


--------------F911007C9A63AAFD417562B0
Content-Type: text/plain; charset=UTF-8;
 name="local.conf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="local.conf"

#
# This file is your local configuration file and is where all local user settings
# are placed. The comments in this file give some guide to the options a new user
# to the system might want to change but pretty much any configuration option can
# be set in this file. More adventurous users can look at local.conf.extended
# which contains other examples of configuration which can be placed in this file
# but new users likely won't need any of them initially.
#
# Lines starting with the '#' character are commented out and in some cases the
# default values are provided as comments to show people example syntax. Enabling
# the option is a question of removing the # character and making any change to the
# variable as required.

#
# Machine Selection
#
# You need to select a specific machine to target the build with. There are a selection
# of emulated machines available which can boot and run in the QEMU emulator:
#
#MACHINE ?= "qemuarm"
#MACHINE ?= "qemuarm64"
#MACHINE ?= "qemumips"
#MACHINE ?= "qemumips64"
#MACHINE ?= "qemuppc"
#MACHINE ?= "qemux86"
#MACHINE ?= "qemux86-64"
#
# There are also the following hardware board target machines included for 
# demonstration purposes:
#
#MACHINE ?= "beaglebone"
#MACHINE ?= "genericx86"
#MACHINE ?= "genericx86-64"
#MACHINE ?= "mpc8315e-rdb"
#MACHINE ?= "edgerouter"
#
# This sets the default machine to be qemux86 if no other machine is selected:
MACHINE ??= "beaglebone"

#
# Where to place downloads
#
# During a first build the system will download many different source code tarballs
# from various upstream projects. This can take a while, particularly if your network
# connection is slow. These are all stored in DL_DIR. When wiping and rebuilding you
# can preserve this directory to speed up this part of subsequent builds. This directory
# is safe to share between multiple builds on the same machine too.
#
# The default is a downloads directory under TOPDIR which is the build directory.
#
#DL_DIR ?= "${TOPDIR}/downloads"

#
# Where to place shared-state files
#
# BitBake has the capability to accelerate builds based on previously built output.
# This is done using "shared state" files which can be thought of as cache objects
# and this option determines where those files are placed.
#
# You can wipe out TMPDIR leaving this directory intact and the build would regenerate
# from these files if no changes were made to the configuration. If changes were made
# to the configuration, only shared state files where the state was still valid would
# be used (done using checksums).
#
# The default is a sstate-cache directory under TOPDIR.
#
#SSTATE_DIR ?= "${TOPDIR}/sstate-cache"

#
# Where to place the build output
#
# This option specifies where the bulk of the building work should be done and
# where BitBake should place its temporary files and output. Keep in mind that
# this includes the extraction and compilation of many applications and the toolchain
# which can use Gigabytes of hard disk space.
#
# The default is a tmp directory under TOPDIR.
#
#TMPDIR = "${TOPDIR}/tmp"

#
# Default policy config
#
# The distribution setting controls which policy settings are used as defaults.
# The default value is fine for general Yocto project use, at least initially.
# Ultimately when creating custom policy, people will likely end up subclassing 
# these defaults.
#
DISTRO ?= "poky"
# As an example of a subclass there is a "bleeding" edge policy configuration
# where many versions are set to the absolute latest code from the upstream 
# source control systems. This is just mentioned here as an example, its not
# useful to most new users.
# DISTRO ?= "poky-bleeding"

#
# Package Management configuration
#
# This variable lists which packaging formats to enable. Multiple package backends
# can be enabled at once and the first item listed in the variable will be used
# to generate the root filesystems.
# Options are:
#  - 'package_deb' for debian style deb files
#  - 'package_ipk' for ipk files are used by opkg (a debian style embedded package manager)
#  - 'package_rpm' for rpm style packages
# E.g.: PACKAGE_CLASSES ?= "package_rpm package_deb package_ipk"
# We default to rpm:
PACKAGE_CLASSES ?= "package_rpm"

#
# SDK target architecture
#
# This variable specifies the architecture to build SDK items for and means
# you can build the SDK packages for architectures other than the machine you are
# running the build on (i.e. building i686 packages on an x86_64 host).
# Supported values are i686 and x86_64
#SDKMACHINE ?= "i686"

#
# Extra image configuration defaults
#
# The EXTRA_IMAGE_FEATURES variable allows extra packages to be added to the generated
# images. Some of these options are added to certain image types automatically. The
# variable can contain the following options:
#  "dbg-pkgs"       - add -dbg packages for all installed packages
#                     (adds symbol information for debugging/profiling)
#  "dev-pkgs"       - add -dev packages for all installed packages
#                     (useful if you want to develop against libs in the image)
#  "ptest-pkgs"     - add -ptest packages for all ptest-enabled packages
#                     (useful if you want to run the package test suites)
#  "tools-sdk"      - add development tools (gcc, make, pkgconfig etc.)
#  "tools-debug"    - add debugging tools (gdb, strace)
#  "eclipse-debug"  - add Eclipse remote debugging support
#  "tools-profile"  - add profiling tools (oprofile, lttng, valgrind)
#  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord etc.)
#  "debug-tweaks"   - make an image suitable for development
#                     e.g. ssh root access has a blank password
# There are other application targets that can be used here too, see
# meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
# We default to enabling the debugging tweaks.
EXTRA_IMAGE_FEATURES ?= "debug-tweaks"

#
# Additional image features
#
# The following is a list of additional classes to use when building images which
# enable extra features. Some available options which can be included in this variable
# are:
#   - 'buildstats' collect build statistics
#   - 'image-mklibs' to reduce shared library files size for an image
#   - 'image-prelink' in order to prelink the filesystem image
# NOTE: if listing mklibs & prelink both, then make sure mklibs is before prelink
# NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
USER_CLASSES ?= "buildstats image-mklibs image-prelink"

#
# Runtime testing of images
#
# The build system can test booting virtual machine images under qemu (an emulator)
# after any root filesystems are created and run tests against those images. To
# enable this uncomment this line. See classes/testimage(-auto).bbclass for
# further details.
#TEST_IMAGE = "1"
#
# Interactive shell configuration
#
# Under certain circumstances the system may need input from you and to do this it
# can launch an interactive shell. It needs to do this since the build is
# multithreaded and needs to be able to handle the case where more than one parallel
# process may require the user's attention. The default is iterate over the available
# terminal types to find one that works.
#
# Examples of the occasions this may happen are when resolving patches which cannot
# be applied, to use the devshell or the kernel menuconfig
#
# Supported values are auto, gnome, xfce, rxvt, screen, konsole (KDE 3.x only), none
# Note: currently, Konsole support only works for KDE 3.x due to the way
# newer Konsole versions behave
#OE_TERMINAL = "auto"
# By default disable interactive patch resolution (tasks will just fail instead):
PATCHRESOLVE = "noop"

#
# Disk Space Monitoring during the build
#
# Monitor the disk space during the build. If there is less that 1GB of space or less
# than 100K inodes in any key build location (TMPDIR, DL_DIR, SSTATE_DIR), gracefully
# shutdown the build. If there is less that 100MB or 1K inodes, perform a hard abort
# of the build. The reason for this is that running completely out of space can corrupt
# files and damages the build in ways which may not be easily recoverable.
# It's necesary to monitor /tmp, if there is no space left the build will fail
# with very exotic errors.
BB_DISKMON_DIRS = "\
    STOPTASKS,${TMPDIR},1G,100K \
    STOPTASKS,${DL_DIR},1G,100K \
    STOPTASKS,${SSTATE_DIR},1G,100K \
    STOPTASKS,/tmp,100M,100K \
    ABORT,${TMPDIR},100M,1K \
    ABORT,${DL_DIR},100M,1K \
    ABORT,${SSTATE_DIR},100M,1K \
    ABORT,/tmp,10M,1K"

#
# Shared-state files from other locations
#
# As mentioned above, shared state files are prebuilt cache data objects which can
# used to accelerate build time. This variable can be used to configure the system
# to search other mirror locations for these objects before it builds the data itself.
#
# This can be a filesystem directory, or a remote url such as http or ftp. These
# would contain the sstate-cache results from previous builds (possibly from other
# machines). This variable works like fetcher MIRRORS/PREMIRRORS and points to the
# cache locations to check for the shared objects.
# NOTE: if the mirror uses the same structure as SSTATE_DIR, you need to add PATH
# at the end as shown in the examples below. This will be substituted with the
# correct path within the directory structure.
#SSTATE_MIRRORS ?= "\
#file://.* http://someserver.tld/share/sstate/PATH;downloadfilename=PATH \n \
#file://.* file:///some/local/dir/sstate/PATH"


#
# Qemu configuration
#
# By default qemu will build with a builtin VNC server where graphical output can be
# seen. The two lines below enable the SDL backend too. By default libsdl-native will
# be built, if you want to use your host's libSDL instead of the minimal libsdl built
# by libsdl-native then uncomment the ASSUME_PROVIDED line below.
PACKAGECONFIG_append_pn-qemu-native = " sdl"
PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl"
#ASSUME_PROVIDED += "libsdl-native"

# CONF_VERSION is increased each time build/conf/ changes incompatibly and is used to
# track the version of this file when it was generated. This can safely be ignored if
# this doesn't mean anything to you.
CONF_VERSION = "1"

IMAGE_FSTYPES = "tar cpio.gz cpio.gz.u-boot"


--------------F911007C9A63AAFD417562B0
Content-Type: text/x-log;
 name="build-config.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="build-config.log"

Build Configuration:
BB_VERSION        = "1.34.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "ubuntu-16.04"
TARGET_SYS        = "arm-poky-linux-gnueabi"
MACHINE           = "beaglebone"
DISTRO            = "poky"
DISTRO_VERSION    = "2.3.2"
TUNE_FEATURES     = "arm armv7a vfp neon callconvention-hard cortexa8"
TARGET_FPU        = "hard"
meta
meta-poky
meta-yocto-bsp    = "pyro:072430b9b3a78b318b66371c36e2986d2ed5cba4"


--------------F911007C9A63AAFD417562B0--
