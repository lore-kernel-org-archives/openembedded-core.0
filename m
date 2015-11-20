Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 807FE60112
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 15:41:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 4D018601AC7
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Nov 2015 15:40:56 +0000
Message-Id: <cover.1448033942.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.4.3
MIME-Version: 1.0
Subject: [PATCH 00/20] Proposed changes for fido
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
X-List-Received-Date: Fri, 20 Nov 2015 15:41:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please consider the following fixes, available in the joshuagl/fido-next
branch of openembedded-core-contrib, for the fido branch.

Regards,

Joshua

The following changes since commit f0873b83d693af4a103999160d67fcf25c7eedc1:

  build-appliance-image: Update to fido head revision (2015-09-29 14:59:41 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/fido-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/fido-next

Adrian Calianu (1):
  Fix the big endian loader name

Andre McCurdy (5):
  uclibc: backport upstream fix for SH4
  libiconv_1.11.1: merge build and packaging fixes from libiconv_1.14
  libiconv_1.11.1: fix LICENSE declaration, LGPL -> LGPLv2.0
  gettext_0.16.1: remove obsolete uclibc specific patch
  gettext_0.16.1: add -lrt and -lpthread to LDFLAGS for uclibc builds

Aníbal Limón (1):
  bash: Disable custom memory allocator

Armin Kuster (3):
  libxslt: CVE-2015-7995
  tzcode: update to 2015g
  tzdata: update to 2015g

Haris Okanovic (1):
  openssh: Backport CVE-2015-5600 fix

Jonathan Liu (1):
  systemd: add PACKAGECONFIG for qrencode

Leonardo Sandoval (1):
  init-install-efi.sh: Avoid /mnt/mtab creation if already present

Martin Jansa (1):
  fontcache: allow to pass extra parameters and environment to fc-cache

Paul Eggleton (1):
  tzdata: reinstate changes reverted in 2014c upgrade

Reinette Chatre (1):
  systemd: fix tmpfiles location when multilib in use

Ross Burton (1):
  readline: actually apply readline63-003 (aka CVE-2014-2524)

Stefan Christ (1):
  systemd: fix networking setup when ipv6 modules are missing

Ting Liu (1):
  oprofile: update --with-kernel option to find perf_event.h

Tudor Florea (1):
  unzip: CVE-2015-7696, CVE-2015-7697

 meta/classes/fontcache.bbclass                     |  19 +-
 .../openssh/openssh/CVE-2015-5600.patch            |  50 +++++
 meta/recipes-connectivity/openssh/openssh_6.7p1.bb |   1 +
 .../gettext-error_print_progname.patch             |  19 --
 meta/recipes-core/gettext/gettext_0.16.1.bb        |   4 +-
 .../AArch64-Fix-the-big-endian-loader-name.patch   |  49 +++++
 meta/recipes-core/glibc/glibc_2.21.bb              |   1 +
 .../initrdscripts/files/init-install-efi.sh        |   6 +-
 .../{readline63-003 => readline63-003.patch}       |   0
 meta/recipes-core/readline/readline_6.3.bb         |   2 +-
 ...-fix-IFF_UP-when-ipv6-support-is-disabled.patch |  78 ++++++++
 meta/recipes-core/systemd/systemd_219.bb           |   6 +-
 meta/recipes-core/uclibc/uclibc-git.inc            |   1 +
 .../ldso-mark-_dl_exit-as-noreturn.patch           |  48 +++++
 meta/recipes-extended/bash/bash.inc                |   2 +-
 .../recipes-extended/tzcode/tzcode-native_2015d.bb |  11 --
 .../recipes-extended/tzcode/tzcode-native_2015g.bb |  25 +++
 meta/recipes-extended/tzdata/tzdata_2015g.bb       | 208 +++++++++++++++++++++
 .../unzip/unzip/CVE-2015-7696.patch                |  38 ++++
 .../unzip/unzip/CVE-2015-7697.patch                |  31 +++
 meta/recipes-extended/unzip/unzip_6.0.bb           |   2 +
 meta/recipes-kernel/oprofile/oprofile.inc          |   2 +-
 meta/recipes-support/libiconv/libiconv_1.11.1.bb   |  17 +-
 .../libxslt/libxslt/CVE-2015-7995.patch            |  33 ++++
 meta/recipes-support/libxslt/libxslt_1.1.28.bb     |   3 +-
 scripts/postinst-intercepts/update_font_cache      |   4 +-
 26 files changed, 612 insertions(+), 48 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2015-5600.patch
 delete mode 100644 meta/recipes-core/gettext/gettext-0.16.1/gettext-error_print_progname.patch
 create mode 100644 meta/recipes-core/glibc/glibc/AArch64-Fix-the-big-endian-loader-name.patch
 rename meta/recipes-core/readline/readline-6.3/{readline63-003 => readline63-003.patch} (100%)
 create mode 100644 meta/recipes-core/systemd/systemd/0016-networkd-fix-IFF_UP-when-ipv6-support-is-disabled.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/ldso-mark-_dl_exit-as-noreturn.patch
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2015d.bb
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2015g.bb
 create mode 100644 meta/recipes-extended/tzdata/tzdata_2015g.bb
 create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2015-7696.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2015-7697.patch
 create mode 100644 meta/recipes-support/libxslt/libxslt/CVE-2015-7995.patch

-- 
2.4.3


