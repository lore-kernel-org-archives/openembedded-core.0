Return-Path: <petter@technux.se>
Received: from vsp-authed-03-02.binero.net (unknown [195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id 3590160173
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 May 2014 08:06:13 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-03-02.binero.net (Halon Mail Gateway) with ESMTPS;
	Sat, 10 May 2014 10:06:26 +0200 (CEST)
Received: from eldbvzzwp1-7x.lan (81-229-90-163-no67.tbcn.telia.com
	[81.229.90.163]) (Authenticated sender: petter@technux.se)
	by smtp-09-01.atm.binero.net (Postfix) with ESMTPSA id 026643A11F;
	Sat, 10 May 2014 10:06:06 +0200 (CEST)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Sat, 10 May 2014 10:06:00 +0200
Message-Id: <cover.1399671290.git.petter@technux.se>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCHv2 00/13] Remove usage of FILESPATH
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
X-List-Received-Date: Sat, 10 May 2014 08:06:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v2 of the changeset.

Fixes [YOCTO #4497]

We extend the search path in a number of recipes by setting FILESPATH,
which is not really desirable since the manner in which we have done it
can make the recipe harder to bbappend (and we explicitly advise modifying
FILESPATH this in the manual).


The following changes since commit 646b089c38623cebe4a6b22c6798d21453fe5257:

  bitbake: toaster: modify SQL data type constraints (2014-05-08 16:18:12 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib petmab/bug/4497_v2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=petmab/bug/4497_v2

Petter Mabäcker (13):
  systemtap: remove usage of FILESPATH
  dbus: remove usage of FILESPATH
  gstreamer: remove unused FILESPATH
  trace-cmd: refactoring recipe
  xorg-lib: remove usage of FILESPATH
  mesa: remove usage of FILESPATH
  qemu: remove unused FILESPATH
  linuxdoc-tools: remove usage of FILESPATH
  gcc: remove usage of FILESPATH
  python: remove usage of FILESPATH
  u-boot: remove unused FILESPATH
  uclibc: remove usage of FILESPATH
  eglibc: remove usage of FILESPATH

 meta/recipes-bsp/u-boot/u-boot.inc                 |    1 -
 meta/recipes-core/dbus/dbus-test_1.6.18.bb         |    2 +-
 .../fix_for_centos_5.8.patch                       |    0
 .../eglibc/cross-localedef-native_2.19.bb          |    3 +--
 meta/recipes-core/eglibc/eglibc_2.19.bb            |    4 +---
 meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb |    2 +-
 meta/recipes-core/uclibc/uclibc-git.inc            |    4 ++--
 meta/recipes-devtools/gcc/gcc-4.8.inc              |    4 ++--
 meta/recipes-devtools/gcc/gcc-4.9.inc              |    4 ++--
 .../linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb |    3 ---
 .../disable_dvips_doc.patch                        |    0
 .../disable_sgml2rtf.patch                         |    0
 .../disable_tex_doc.patch                          |    0
 .../disable_txt_doc.patch                          |    0
 .../recipes-devtools/python/python-native_2.7.3.bb |    2 +-
 .../python/python-pygobject_2.28.3.bb              |    1 -
 .../qemu/nativesdk-qemu-helper_1.0.bb              |    1 -
 meta/recipes-graphics/mesa/mesa-gl_9.2.5.bb        |    2 +-
 meta/recipes-graphics/xorg-lib/libx11.inc          |    2 +-
 .../systemtap/systemtap-uprobes_git.bb             |    2 ++
 meta/recipes-kernel/systemtap/systemtap_git.inc    |    2 --
 .../kernelshark-fix-syntax-error-of-shell.patch    |    0
 meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb   |   18 ++++--------------
 meta/recipes-kernel/trace-cmd/trace-cmd.inc        |   14 ++++++++++++++
 meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb     |   16 ++++------------
 meta/recipes-multimedia/gstreamer/gst-plugins.inc  |    2 --
 .../gstreamer/gstreamer1.0-plugins.inc             |    2 --
 27 files changed, 37 insertions(+), 54 deletions(-)
 rename meta/recipes-core/eglibc/{eglibc-2.19 => cross-localedef-native-2.19}/fix_for_centos_5.8.patch (100%)
 rename meta/recipes-devtools/linuxdoc-tools/{linuxdoc-tools-native => linuxdoc-tools}/disable_dvips_doc.patch (100%)
 rename meta/recipes-devtools/linuxdoc-tools/{linuxdoc-tools-native => linuxdoc-tools}/disable_sgml2rtf.patch (100%)
 rename meta/recipes-devtools/linuxdoc-tools/{linuxdoc-tools-native => linuxdoc-tools}/disable_tex_doc.patch (100%)
 rename meta/recipes-devtools/linuxdoc-tools/{linuxdoc-tools-native => linuxdoc-tools}/disable_txt_doc.patch (100%)
 rename meta/recipes-kernel/trace-cmd/{trace-cmd => kernelshark}/kernelshark-fix-syntax-error-of-shell.patch (100%)
 create mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd.inc

-- 
1.7.9.5


