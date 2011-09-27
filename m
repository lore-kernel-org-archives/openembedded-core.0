Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1R8Obn-00060J-5Z
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 05:45:27 +0200
Received: by yxj17 with SMTP id 17so6024471yxj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 20:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=/z5y4OpOlTVZ/za243jUmHNFiZEgyTtgMVrdEWLuzoQ=;
	b=rt39wZ849GSzjmVp62RSvGbt6ztwPVWkaq89S9ZjCf50/ZIeqb30F0xnJ9jCba0LkT
	0bw2lwoDIVFYH5xYNjkAnvoQqV04bcEXuPKmyK3rcQ/w6jwva2JzVnp+bYG/gWwTjj4v
	luSh/PEKDSg6a/8NVlJJYbvazlSYgotxdFneQ=
Received: by 10.101.165.40 with SMTP id s40mr6705865ano.161.1317094800952;
	Mon, 26 Sep 2011 20:40:00 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id p14sm74873481anh.25.2011.09.26.20.39.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Sep 2011 20:40:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Sep 2011 20:39:44 -0700
Message-Id: <cover.1317094542.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/4] Upgrade eglibc 2.14 and gcc 4.6
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
X-List-Received-Date: Tue, 27 Sep 2011 03:45:27 -0000


This patch upgrades gcc to latest on FSF gcc-4_6-branch
Adds recipes for eglibc 2.14 and restores sunrpc support in eglibc
Add configure option to gcc 4.6 select hash style in gcc at configure time

The following changes since commit c7c0e60f59f625f13231d9829967255260b777b1:

  intltool: inherit gettext to add missing dependency on gettext (2011-09-26 20:29:27 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/hashstyle-eglibc-updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/hashstyle-eglibc-updates

Khem Raj (4):
  conf,recipes: Add new variable LINKER_HASH_STYLE
  gcc-4.6: Use --with-linker-hash-style configure option
  eglibc: Add recipes for 2.14
  gcc-4.6: Update to tip of FSF gcc-4_6-branch

 meta/conf/bitbake.conf                             |    3 +-
 meta/conf/distro/include/tcmode-default.inc        |    6 +-
 .../eglibc/cross-localedef-native_2.14.bb          |   44 ++
 .../eglibc/eglibc-2.14/IO-acquire-lock-fix.patch   |   17 +
 .../eglibc-2.14/armv4-eabi-compile-fix.patch       |   25 +
 .../eglibc-2.14/eglibc-rpc-export-again.patch      |   69 +++
 .../eglibc-svn-arm-lowlevellock-include-tls.patch  |   21 +
 .../eglibc/eglibc-2.14/generate-supported.mk       |   11 +
 .../eglibc/eglibc-2.14/ld-search-order.patch       |   56 ++
 .../eglibc/eglibc-2.14/mips-rld-map-check.patch    |   26 +
 .../eglibc/eglibc-2.14/multilib_readlib.patch      |   17 +
 .../recipes-core/eglibc/eglibc-2.14/ppc-sqrt.patch |  538 ++++++++++++++++++++
 .../eglibc-2.14/shorten-build-commands.patch       |   82 +++
 .../eglibc/eglibc-2.14/stack-protector-test.patch  |   35 ++
 meta/recipes-core/eglibc/eglibc-initial_2.14.bb    |    6 +
 meta/recipes-core/eglibc/eglibc-locale_2.14.bb     |    1 +
 meta/recipes-core/eglibc/eglibc_2.14.bb            |  219 ++++++++
 meta/recipes-core/uclibc/uclibc.inc                |    2 +-
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    8 +-
 .../gcc/gcc-4.6/gcc-with-linker-hash-style.patch   |  196 +++++++
 20 files changed, 1376 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/cross-localedef-native_2.14.bb
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/IO-acquire-lock-fix.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/armv4-eabi-compile-fix.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/eglibc-rpc-export-again.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/eglibc-svn-arm-lowlevellock-include-tls.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/etc/ld.so.conf
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/generate-supported.mk
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/ld-search-order.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/mips-rld-map-check.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/multilib_readlib.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/ppc-sqrt.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/shorten-build-commands.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/stack-protector-test.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-initial_2.14.bb
 create mode 100644 meta/recipes-core/eglibc/eglibc-locale_2.14.bb
 create mode 100644 meta/recipes-core/eglibc/eglibc_2.14.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/gcc-with-linker-hash-style.patch

-- 
1.7.5.4



