Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1R4Nng-0002O7-01
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 04:05:08 +0200
Received: by iadx2 with SMTP id x2so1971809iad.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2011 18:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=evJ9e5ZNQaoLkgN7vDedbWgJ84IxzZmFqiWt+yIH/KA=;
	b=Y5aad0G29Y3aC1Vmts+pDGhDpEndFJnEDwG+NUm49k+UzEXeHli2MCzF3UvuC7rArb
	RcZpBs+U3GZJlL5ERtQNA/sgy05iSNEj26dLGxH0wv/+aIZkbCSp2OlUUR04cvx9dR5b
	E9Zi6/EHCmC3Ods/c0LPK59DPSWRFupj7eQYM=
Received: by 10.42.246.69 with SMTP id lx5mr1724441icb.183.1316138394948;
	Thu, 15 Sep 2011 18:59:54 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id o5sm7172680ibu.12.2011.09.15.18.59.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Sep 2011 18:59:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Sep 2011 18:59:46 -0700
Message-Id: <cover.1316138063.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/4] Add eglibc 2.14 recipes and redo linker hashstyle patch
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
X-List-Received-Date: Fri, 16 Sep 2011 02:05:08 -0000

Redo linker hash style patch to include RPs concerns
Add sunrpc back into eglibc 2.14

The following changes since commit f5c436fa476e6131d55089955ba042c83ff770af:

  eglibc: Add recipes for 2.14 (2011-09-15 18:38:02 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/hashstyle-eglibc-updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/hashstyle-eglibc-updates

Khem Raj (4):
  conf,recipes: Add new variable LINKER_HASH_STYLE
  gcc-4.6: Use --with-linker-hash-style configure option
  eglibc-2.13: Replace oewarn with bbwarn
  eglibc: Add recipes for 2.14

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
 meta/recipes-core/eglibc/eglibc_2.13.bb            |    2 +-
 meta/recipes-core/eglibc/eglibc_2.14.bb            |  219 ++++++++
 meta/recipes-core/uclibc/uclibc.inc                |    2 +-
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    4 +-
 .../gcc/gcc-4.6/gcc-with-linker-hash-style.patch   |  196 +++++++
 21 files changed, 1375 insertions(+), 5 deletions(-)
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



