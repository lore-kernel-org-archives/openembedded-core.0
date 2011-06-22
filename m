Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZRqh-00019L-T1
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 20:08:24 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MI4mF8002981
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 11:04:48 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 22 Jun 2011 11:04:48 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jun 2011 13:16:24 -0500
Message-ID: <cover.1308766480.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 00/40] Various Recipe Fixes (v2)
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
X-List-Received-Date: Wed, 22 Jun 2011 18:08:24 -0000
Content-Type: text/plain

V2 only includes a change to patch 13, to resolve the issues mentioned
by Koen.

--- original comments below ---

While working on the permissions and umask code, I found a number of 
random issues with various packages in the system.  Most of these
problems revolve around:

* directory and file permissions, and ownership
* -dbg package not being produced correctly
* stripped binaries
* packages that couldn't rebuild due to dependency or other issues

Note, this doesn't solve the permissions and ownership issues that will come
in a future patch set devoted to umask and fixing up of the permissions.

The following changes since commit 17d5422460bf9074223475b15d128171d12b170a:

  qt4-tools-nativesdk: fix compile failure in src/dbus (2011-06-22 17:41:39 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/recipe-fixup
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/recipe-fixup

Mark Hatle (40):
  resolveconf: Fix file owners
  base-passwd: Fix owners/groups
  gcc: Fix owners/groups
  ghostscript: Fix owner/group of /etc/cups
  libtirpc: Fix owner/group of /etc/netconfig
  tzdata: Ensure all files are owned by root:root
  gnome-doc-utils: Fix the owner/group on select files
  perf: Fix linux-tools to ensure perf is installed under "fakeroot"
  kernel.bbclass: Add support for perf-dbg package
  sysfsutils: Fall back to default -dbg package
  classes/package_rpm.bbclass: Enhance diagnostic messages
  classes/package_rpm.bbclass: Change the way the PV is transformed
  python: Switch to using the default -dbg package
  python-pyobject: Remove unnecessary -dbg setting
  libxml-parser-perl: Fix debug package
  texinfo: Change to use the standard -dbg file
  psmisc: Remove custom -dbg packages, use default
  modutils: Add in missing -dbg package
  liba52: Remove custom -dbg, fall back to default
  python-gst: Add missing files to the -dbg package
  mc: Add missing debug files to -dbg
  gamin: Add missing debug files to -dbg
  gthumb: Add missing debug files
  systemtamp: Add missing debug files
  trace-cmd: Add missing debug files
  gstreamer: Add missing debug files.
  gtk-sato-engine: Add missing debug files
  libproxy: Add missing debug files
  wireless-tools: Avoid stripping binaries
  busybox: Avoid stripping binaries
  tinylogin: Avoid stripped binaries
  quote: Avoid stripping binaries
  sysstat: Avoid stripping binaries
  db: Avoid stripping binaries
  db: Fix file ownership
  unzip: Avoid stripping binaries
  dropbear: Don't patch in configure
  nasm: Fix aclocal
  python: Add python to the dependencies of python modules
  boost: Move the do_configure_prepend to a seperate task

 meta/classes/kernel.bbclass                        |    3 +-
 meta/classes/package_rpm.bbclass                   |   16 +++++--
 .../resolvconf/resolvconf_1.48.bb                  |    3 +-
 .../wireless-tools/avoid_strip.patch               |   21 +++++++++
 .../wireless-tools/wireless-tools_29.bb            |    5 +-
 .../recipes-core/base-passwd/base-passwd_3.5.22.bb |   10 ++--
 meta/recipes-core/busybox/busybox_1.18.4.bb        |    4 +-
 meta/recipes-core/dropbear/dropbear.inc            |    4 +-
 meta/recipes-core/dropbear/dropbear_0.52.bb        |    2 +-
 meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb   |    6 +--
 .../tinylogin/tinylogin-1.4/avoid_static.patch     |   33 +++++++++++++
 meta/recipes-core/tinylogin/tinylogin_1.4.bb       |    7 ++-
 meta/recipes-devtools/gcc/gcc-4.6.0.inc            |    2 +-
 meta/recipes-devtools/gcc/gcc_4.5.1.bb             |    7 +++-
 meta/recipes-devtools/gcc/gcc_4.6.0.bb             |    5 ++
 meta/recipes-devtools/gcc/libgcc_4.5.1.bb          |    3 +-
 meta/recipes-devtools/gcc/libgcc_4.6.0.bb          |    3 +-
 meta/recipes-devtools/nasm/nasm_2.07.bb            |    6 ++-
 .../perl/libxml-parser-perl_2.40.bb                |    4 +-
 .../python/python-2.6-manifest.inc                 |    8 +---
 meta/recipes-devtools/python/python-gst_0.10.21.bb |    6 +-
 .../python/python-pygobject_2.27.91.bb             |    5 +-
 meta/recipes-devtools/python/python.inc            |    2 +-
 meta/recipes-devtools/python/python_2.6.6.bb       |    4 +-
 meta/recipes-extended/gamin/gamin_0.1.10.bb        |    7 +--
 .../ghostscript/ghostscript_9.02.bb                |    7 +++-
 meta/recipes-extended/libtirpc/libtirpc_0.2.1.bb   |    6 ++-
 meta/recipes-extended/mc/mc_4.7.5.2.bb             |    4 +-
 meta/recipes-extended/psmisc/psmisc.inc            |    8 +---
 meta/recipes-extended/psmisc/psmisc_22.13.bb       |    2 +-
 meta/recipes-extended/quota/quota_4.00-pre1.bb     |    4 +-
 meta/recipes-extended/sysstat/sysstat.inc          |    5 ++-
 meta/recipes-extended/sysstat/sysstat_10.0.0.bb    |    2 +-
 meta/recipes-extended/texinfo/texinfo_4.13a.bb     |    7 +--
 meta/recipes-extended/tzdata/tzdata_2011g.bb       |    4 +-
 .../recipes-extended/unzip/unzip/avoid-strip.patch |   48 ++++++++++++++++++++
 meta/recipes-extended/unzip/unzip_6.0.bb           |    7 ++-
 meta/recipes-gnome/gnome/gnome-doc-utils.inc       |    4 ++
 meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb |    2 +-
 meta/recipes-gnome/gthumb/gthumb_2.12.3.bb         |    6 +-
 meta/recipes-kernel/linux/linux-tools.inc          |    4 +-
 meta/recipes-kernel/linux/linux-yocto_2.6.34.bb    |    2 +-
 meta/recipes-kernel/linux/linux-yocto_2.6.37.bb    |    2 +-
 meta/recipes-kernel/modutils/modutils_2.4.27.bb    |    4 +-
 meta/recipes-kernel/systemtap/systemtap_git.bb     |    4 +-
 meta/recipes-kernel/trace-cmd/trace-cmd_git.bb     |    4 +-
 .../gstreamer/gstreamer_0.10.32.bb                 |    4 +-
 meta/recipes-multimedia/liba52/liba52_0.7.4.bb     |    6 +--
 meta/recipes-sato/gtk-engines/gtk-sato-engine.inc  |    2 +-
 .../gtk-engines/gtk-sato-engine_svn.bb             |    2 +-
 meta/recipes-support/boost/boost-36.inc            |    6 ++-
 meta/recipes-support/db/db_5.1.19.bb               |    9 +++-
 meta/recipes-support/libproxy/libproxy_0.4.6.bb    |    4 +-
 scripts/contrib/python/generate-manifest-2.6.py    |   16 ++++---
 54 files changed, 255 insertions(+), 106 deletions(-)
 create mode 100644 meta/recipes-connectivity/wireless-tools/wireless-tools/avoid_strip.patch
 create mode 100644 meta/recipes-core/tinylogin/tinylogin-1.4/avoid_static.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/avoid-strip.patch

-- 
1.7.3.4



