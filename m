Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6DE64700F3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 14:15:30 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id e4so3919844pfg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 06:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=L/exrWU1U1u9AbaCs1vCP8RO7QgWAd5nPHPmtM/YEPI=;
	b=OcUhoX9BMyggc7nXPCPMm3cVVjTSCVEJW1JpDNP4QNZj45U83XSfYSBt7PGzbOzEeL
	/avUqF00laxGG7dQ6b2a0JIYiFn4coEf9B/+Kp2c3aiLxmvId4VMRX7NXvRhLxfnb8mo
	E/gOmxOPDFxWLlHztjnoczWPQq+muvohUyV3mfXcWXHW5Jbk9djsznXrO+ixEKP/ZeYg
	QcugQAtROcD9b97PlouTB08SGL0fYJvpV6cQYXpgymKc5lwJvbHHuEGoUODG0NsRx6/5
	9fhTcO8DK5T+5ewpu6l2M8O5qAuyklQUJGgQ+KCojnZ7XRcT1w47I+tjfhlZa8AsrD4T
	3X7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=L/exrWU1U1u9AbaCs1vCP8RO7QgWAd5nPHPmtM/YEPI=;
	b=DlbszOTJMbXx1JpknBHbTEAbgV2nXPV+rrzey52yRUaJhgouJ0gXUkzdJm3JMZonae
	9TPC3QfJqgfJAGY/NsPWkAXQn9oUhwrnQaAXbz/egkAT5pPnJjdx0IqIRB7RIGJGlb5y
	9hyVNBIcaJAYIk7hSLOn3DJJzZzf6SD3IQ0tHNYdRZRlOfVkw6A12tJ6qrENx3Jl01Hw
	Iooa/vUbGPq/yYpsqG4We3UxYEeZVgEtt/zsF2zxu/lxYzMunSiyMt01xxiAfxA9CP+J
	4eYwkIgyusi54j/CmD2498VO6DGmWeY+cx/TCfRuQOFWHWWaK7oLzbSxCJIxy6USFZVj
	w85w==
X-Gm-Message-State: AIkVDXK4GMz3MxHYXKleztkL48jO13nQm7o1izNYtGgT1RLmERpaSwdZpiPqZJZ82LoStw==
X-Received: by 10.99.123.3 with SMTP id w3mr40105505pgc.155.1484576130337;
	Mon, 16 Jan 2017 06:15:30 -0800 (PST)
Received: from [127.0.1.1] (CPE-58-165-45-185.lns1.lon.bigpond.net.au.
	[58.165.45.185]) by smtp.gmail.com with ESMTPSA id
	b67sm16580221pfj.81.2017.01.16.06.15.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jan 2017 06:15:29 -0800 (PST)
Date: Tue, 17 Jan 2017 00:15:10 +1000
Message-Id: <20170116141510.3321-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 0/30] Adding support for building QEMU for Windows (with meta-mingw)
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
X-List-Received-Date: Mon, 16 Jan 2017 14:15:30 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

This series is paired with a series that is sent for the meta-mingw
layer. That series depends on changes in this series and vice-versa.

The following series is a number of patches to improve mingw32 support
both in oe-core itself as well as for individual recipes. The goal is to
enable the building of QEMU for Windows such that the oe-core QEMU
targets (qemu* machines) will execute on Windows with and without
graphics (SDL/VNC and nographic). The series includes the following
major changes:

 * Support for detecting DLL runtime dependencies (aka shared objects)
   in both DLLs and EXEs
 * Extending of FILES_* defaults for cleaner packaging of mingw32 built
   components
 * Disabling of update-alternatives for mingw32 (not supported on
   Windows, and not all versions of Windows have symlink support)
 * Addition of PACKAGECONFIG options for a number of packages to handle
   Windows only features and or ability to disable features that do not
   support mingw32/Windows
 * Changes to recipes for proper packaging of DLLs (convention is to
   ship DLLs in the bindir), EXEs and other files
 * Changes to the QEMU include, to clean up configuration and move
   version specific patches changes into the versioned QEMU recipe

The intended build execution is to allow for 'buildtools-tarball' (or
any populate_sdk target with 'nativesdk-qemu' in TOOLCHAIN_HOST_TASK) to
create an output that includes all dependent nativesdk binaries as well
as a nativesdk QEMU binaries. This series does not however address
fixing the environment setup script or self-extracting installer shell
script that is normally provided by buildtools-tarball.

This series has been tested on the following Windows targets, executing
QEMU 2.7.0 with all qemu* oe-core machines and all qemu machines in
meta-xilinx:

 * Windows 10 (64-bit)
 * Windows 8.1 (64-bit)
 * Windows 7 SP1 (64-bit)

Additionally this series has been build tested on the following Linux
build hosts:

 * Debian 8 (64-bit)
 * Ubuntu 16.04 (64-bit)
 * CentOS 7 (64-bit)

There are a number of patches in this series which could be applied in
oe-core/meta or meta-mingw. Depending the patch it may be desired for
the change to be in meta-mingw instead of oe-core. If this is a case I
can modify and make the changes for meta-mingw. This is the reason
behind the segmentation of changes as small individual patches.

This work is contracted by Xilinx, and it intended to allow for the
building of the Xilinx QEMU fork for Windows (recipe is in the
meta-xilinx layer ->
http://git.yoctoproject.org/cgit/cgit.cgi/meta-xilinx/tree/recipes-devtools/qemu/qemu-xilinx_2016.4.bb).
The desired configuration for this QEMU fork is to have libgcrypt
support in addition to what is needed for the default oe-core QEMU
configuration, this is the reason for the inclusion of libgpg-error and
libgcrypt changes.

For convenience this series is also available in the git repository:

  https://github.com/nathanrossi/openembedded-core nrossi/mingw-qemu-v1


Nathan Rossi (30):
  gcc-configure-common.inc: Change 'initfini-array' to PACKAGECONFIG
  update-alternatives.bbclass: Disable for mingw32 targets
  package.bbclass: Add SHLIB detection support for mingw targets
  bitbake.conf: Add '${libdir}/*.def' to FILES_${PN}-dev defaults
  bitbake.conf: Override FILES_${PN}-bin for mingw32
  libpcre_8.39.bb: Handle shipping .exe and .dll files for mingw32
  gettext_0.19.8.1.bb: Fix shared building of gettext for mingw32
  gettext_0.19.8.1.bb: Handle packaging .dll's for mingw32
  gettext_0.19.8.1.bb: Add 'gettext-libintl' package
  libsdl_1.2.16.bb: Disable x11 for nativesdk mingw32
  libsdl_1.2.15.bb: Add 'directx' PACKAGECONFIG
  libsdl_1.2.15.bb: Add 'stdio-redirect' PACKAGECONFIG
  glib-2.0/glib.inc: Disable libmount support for mingw32 targets
  glib-2.0/glib.inc: Only apply MLPREFIX renaming to class-target
  glib-2.0/glib.inc: If 'charset.alias' exists drop it
  glib-2.0/glib.inc: Handle packaging .dll and .exe files for mingw32
  libgpg-error_1.25.bb: Enable nativesdk
  libgpg-error_1.25.bb: Add patch to resolve configure bug for mingw32
  libgpg-error_1.25.bb: Don't replace the syscfg header for mingw32
  libgpg-error_1.25.bb: Handle packaging .exe files
  libgcrypt.inc: Enable nativesdk
  libgcrypt.inc: Add PACKAGECONFIG for 'capabilities' and 'asm'
  libgcrypt.inc: Disable 'capabilities' for mingw32
  libgcrypt.inc: Add patch to resolve configure bug for mingw32
  libgcrypt.inc: Enable use of binconfig
  libgcrypt.inc: Handle packaging of .exe files
  qemu: Improve and add PACKAGECONFIG options
  qemu: Consolidate EXTRA_OECONF
  qemu: Convert KVMOPTS to PACKAGECONFIG
  qemu: Move recipe version specific patches and features to recipe

 meta/classes/package.bbclass                       | 21 ++++++
 meta/classes/update-alternatives.bbclass           |  4 +
 meta/conf/bitbake.conf                             |  5 +-
 .../fix-gl_cv_prog_as_underscore-test.patch        | 67 +++++++++++++++++
 meta/recipes-core/gettext/gettext_0.19.8.1.bb      | 17 +++--
 meta/recipes-core/glib-2.0/glib.inc                | 23 ++++--
 meta/recipes-devtools/gcc/gcc-configure-common.inc |  8 +-
 meta/recipes-devtools/qemu/qemu.inc                | 85 +++++++++-------------
 meta/recipes-devtools/qemu/qemu_2.7.0.bb           | 34 ++++++++-
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |  3 +
 ...c-Set-mym4_revision-to-0-if-not-a-git-rep.patch | 46 ++++++++++++
 meta/recipes-support/libgcrypt/libgcrypt.inc       | 17 +++--
 ...c-Set-mym4_revision-to-0-if-not-a-git-rep.patch | 46 ++++++++++++
 .../libgpg-error/libgpg-error_1.25.bb              | 17 +++--
 meta/recipes-support/libpcre/libpcre_8.39.bb       |  8 +-
 15 files changed, 313 insertions(+), 88 deletions(-)
 create mode 100644 meta/recipes-core/gettext/gettext-0.19.8.1/fix-gl_cv_prog_as_underscore-test.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/configure.ac-Set-mym4_revision-to-0-if-not-a-git-rep.patch
 create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/configure.ac-Set-mym4_revision-to-0-if-not-a-git-rep.patch

-- 
2.11.0

