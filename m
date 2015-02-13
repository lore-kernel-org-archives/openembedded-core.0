Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D61CD73429
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 08:15:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1D8FaFw020938
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 00:15:36 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 13 Feb 2015 00:15:36 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Feb 2015 00:15:24 -0800
Message-ID: <cover.1423808841.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 00/12] meta: fix and enable parallel build
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
X-List-Received-Date: Fri, 13 Feb 2015 08:15:37 -0000
Content-Type: text/plain

Hello,

I've used a for loop to build these recipe more than 500 times, and fix
the issues that I've found, there is no errors in recent 250 builds, I
think it's worth to enable the parallel build for them, we can disable
it if we find errors again.

I will go on the build until 1000 times.

The left ones in-core are:
gettext_0.16.1 # Lower version
subversion_1.8.10 # I have a fix for it, but seems not enough.
net-tools_1.60-25 # I have a fix for, but seems not enough.
groff_1.22.2 # I have a fix for, but seems not enough.
groff_1.18.1.4 # Lower version

// Robert

The following changes since commit 6bf5cbbcac80ee818cc932d69227e70e41ce02d3:

  libtool: Fix option parsing performance regression (2015-02-10 22:36:09 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/parallel
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/parallel

Robert Yang (12):
  bind: fix and enable parallel build
  tcp-wrappers: fix and enable parallel build
  slang: fix and enable parallel build
  at: fix and enable parallel build
  mtools: fix and enable parallel build
  pth: fix and enable parallel build
  openssl: fix and enable parallel build
  blktrace: fix and enable parallel build
  ghostscript: fix and enable parallel build
  pcmciautils: fix and enable parallel build
  vala.bbclass: enable PARALLEL_MAKE
  meta: enable parallel build for several recipes

 meta/classes/vala.bbclass                          |    3 -
 .../Makefile-fix-for-parallel-build.patch          |   35 ++++
 meta/recipes-bsp/pcmciautils/pcmciautils.inc       |    1 -
 meta/recipes-bsp/pcmciautils/pcmciautils_018.bb    |    4 +-
 .../bind/bind/bind-subdirs-run-serially.patch      |   35 ++++
 meta/recipes-connectivity/bind/bind_9.9.5.bb       |    2 +-
 .../nfs-utils/nfs-utils_1.3.1.bb                   |    2 -
 meta/recipes-connectivity/openssl/openssl.inc      |    3 +
 .../recipes-connectivity/openssl/openssl_1.0.1j.bb |    3 -
 meta/recipes-core/libcgroup/libcgroup_0.41.bb      |    3 -
 meta/recipes-devtools/autoconf/autoconf_2.69.bb    |    2 -
 meta/recipes-devtools/dpkg/dpkg.inc                |    2 -
 meta/recipes-devtools/json-c/json-c_0.12.bb        |    2 -
 meta/recipes-devtools/mtd/mtd-utils_git.bb         |    2 -
 meta/recipes-devtools/mtools/mtools_3.9.9.bb       |    8 +-
 meta/recipes-devtools/mtools/mtools_4.0.18.bb      |    8 +-
 .../python/python-pygobject_2.28.3.bb              |    2 -
 meta/recipes-devtools/valgrind/valgrind_3.10.1.bb  |    1 -
 .../at/at/makefile-fix-parallel.patch              |   35 ++++
 meta/recipes-extended/at/at_3.1.16.bb              |    5 +-
 meta/recipes-extended/bash/bash.inc                |    2 -
 .../ghostscript-9.15-parallel-make.patch           |   40 +++++
 .../ghostscript/ghostscript_9.15.bb                |    6 +-
 meta/recipes-extended/mailx/mailx_12.5.bb          |    1 -
 .../slang/slang/slang-makefile-fix-parallel.patch  |  177 ++++++++++++++++++++
 meta/recipes-extended/slang/slang_2.2.4.bb         |    2 +-
 .../tcp-wrappers-7.6/makefile-fix-parallel.patch   |   54 ++++++
 .../tcp-wrappers/tcp-wrappers_7.6.bb               |    6 +-
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |    2 -
 meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb     |    2 -
 .../xorg-lib/libpthread-stubs_0.3.bb               |    1 -
 meta/recipes-graphics/xorg-lib/xcb-util.inc        |    2 -
 .../blktrace/blktrace/makefile-fix-parallel.patch  |   41 +++++
 meta/recipes-kernel/blktrace/blktrace_git.bb       |    5 +-
 meta/recipes-kernel/perf/perf.bb                   |    1 -
 meta/recipes-multimedia/speex/speex_1.2rc1.bb      |    2 -
 meta/recipes-support/icu/icu.inc                   |    1 -
 meta/recipes-support/libpcre/libpcre_8.36.bb       |    2 -
 .../pth/files/pth-fix-parallel.patch               |   48 ++++++
 meta/recipes-support/pth/pth_2.0.7.bb              |    6 +-
 40 files changed, 498 insertions(+), 61 deletions(-)
 create mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils-018/Makefile-fix-for-parallel-build.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/bind-subdirs-run-serially.patch
 create mode 100644 meta/recipes-extended/at/at/makefile-fix-parallel.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.15-parallel-make.patch
 create mode 100644 meta/recipes-extended/slang/slang/slang-makefile-fix-parallel.patch
 create mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/makefile-fix-parallel.patch
 create mode 100644 meta/recipes-kernel/blktrace/blktrace/makefile-fix-parallel.patch
 create mode 100644 meta/recipes-support/pth/files/pth-fix-parallel.patch

-- 
1.7.9.5


