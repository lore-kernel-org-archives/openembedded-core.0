Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RkLkS-0002x9-3C
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 21:23:16 +0100
Received: by iakh37 with SMTP id h37so7052792iak.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jan 2012 12:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=33NYCm75HE7d9miRhNhTr8zuH7h7b9uUBnRmNYROScg=;
	b=mdj3YqLo133Y67x9iRuLaxDQPooKcD/ydW8qiuwMoZ6VS9AAKWRIbiOSOXbCeq7vIL
	/6cVxjMLXwitn0DA5pVPlYwGahYIJdTANBoDWhf6Kps2pqgBhxyKOmq3+QzegGyVcP6h
	TizbX0JdvKqrNYXTAPSC3el178f6Yn8rW2HCo=
Received: by 10.42.157.133 with SMTP id d5mr19131836icx.46.1326140147380;
	Mon, 09 Jan 2012 12:15:47 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id z22sm254665834ibg.5.2012.01.09.12.15.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Jan 2012 12:15:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2012 12:15:24 -0800
Message-Id: <cover.1326140011.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] eglibc upgrade and uclibc fixes
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
X-List-Received-Date: Mon, 09 Jan 2012 20:23:16 -0000


These patches address the build failures found when using uclibc
It also has the already posted patch for eglibc-2.15 upgrade

The following changes since commit fff18970706913e7fd7f4a119d798dddb44b388a:

  base-files: filesystems: fix mount order (2012-01-06 14:41:19 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/misc-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc-fixes

Khem Raj (7):
  eglibc: Upgrade recipes 2.14 -> 2.15
  libiconv_1.14.bb: Fix build failure
  autotools.bbclass: Introduce CACHED_CONFIGUREVARS
  default-distrovars: Define DISTRO_FEATURES_LIBC for uclibc
  uclibc: Configure UCLIBC_HAS_WCHAR based on libc-posix-clang-wchar
    distro feature
  findutils: Use CACHED_CONFIGUREVARS to specify cached configure vars
  util-linux: Enable fallocate and use CACHED_CONFIGUREVARS

 meta/classes/autotools.bbclass                     |    2 +-
 meta/conf/distro/include/default-distrovars.inc    |    2 +
 ...tive_2.14.bb => cross-localedef-native_2.15.bb} |    0
 .../IO-acquire-lock-fix.patch                      |    0
 .../armv4-eabi-compile-fix.patch                   |    0
 .../eglibc-rpc-export-again.patch                  |    0
 .../eglibc-svn-arm-lowlevellock-include-tls.patch  |    0
 .../{eglibc-2.14 => eglibc-2.15}/etc/ld.so.conf    |    0
 .../generate-supported.mk                          |    0
 .../glibc-2.14-libdl-crash.patch                   |    0
 .../ld-search-order.patch                          |    0
 .../mips-rld-map-check.patch                       |    0
 .../multilib_readlib.patch                         |    0
 .../{eglibc-2.14 => eglibc-2.15}/ppc-sqrt.patch    |    0
 .../eglibc/eglibc-2.15/ppc-sqrt_finite.patch       |  112 +
 .../stack-protector-test.patch                     |    0
 .../use-sysroot-cxx-headers.patch                  |   30 +-
 .../recipes-core/eglibc/eglibc-2.15/x86_fenv.patch |   29 +
 ...libc-initial_2.14.bb => eglibc-initial_2.15.bb} |    0
 ...eglibc-locale_2.14.bb => eglibc-locale_2.15.bb} |    0
 .../eglibc/{eglibc_2.14.bb => eglibc_2.15.bb}      |   16 +-
 meta/recipes-core/uclibc/uclibc-config.inc         |    1 +
 meta/recipes-core/util-linux/util-linux_2.20.1.bb  |    6 +-
 meta/recipes-extended/findutils/findutils_4.4.2.bb |    4 +-
 .../libiconv-1.14/add-relocatable-module.patch     | 5008 ++++++++++++++++++++
 meta/recipes-support/libiconv/libiconv_1.14.bb     |    8 +-
 26 files changed, 5195 insertions(+), 23 deletions(-)
 rename meta/recipes-core/eglibc/{cross-localedef-native_2.14.bb => cross-localedef-native_2.15.bb} (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.14 => eglibc-2.15}/IO-acquire-lock-fix.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.14 => eglibc-2.15}/armv4-eabi-compile-fix.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.14 => eglibc-2.15}/eglibc-rpc-export-again.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.14 => eglibc-2.15}/eglibc-svn-arm-lowlevellock-include-tls.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.14 => eglibc-2.15}/etc/ld.so.conf (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.14 => eglibc-2.15}/generate-supported.mk (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.14 => eglibc-2.15}/glibc-2.14-libdl-crash.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.14 => eglibc-2.15}/ld-search-order.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.14 => eglibc-2.15}/mips-rld-map-check.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.14 => eglibc-2.15}/multilib_readlib.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.14 => eglibc-2.15}/ppc-sqrt.patch (100%)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/ppc-sqrt_finite.patch
 rename meta/recipes-core/eglibc/{eglibc-2.14 => eglibc-2.15}/stack-protector-test.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.14 => eglibc-2.15}/use-sysroot-cxx-headers.patch (51%)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/x86_fenv.patch
 rename meta/recipes-core/eglibc/{eglibc-initial_2.14.bb => eglibc-initial_2.15.bb} (100%)
 rename meta/recipes-core/eglibc/{eglibc-locale_2.14.bb => eglibc-locale_2.15.bb} (100%)
 rename meta/recipes-core/eglibc/{eglibc_2.14.bb => eglibc_2.15.bb} (95%)
 create mode 100644 meta/recipes-support/libiconv/libiconv-1.14/add-relocatable-module.patch

-- 
1.7.5.4



