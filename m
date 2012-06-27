Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SjlZt-0003EH-Ry
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 08:18:14 +0200
Received: by pbbrq2 with SMTP id rq2so1063766pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2012 23:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=lT9xKhuo37lRxo5y5YS74YJpgZye8OhYycLPsE4b/qU=;
	b=CV1mBIPSaLPPpBm31BBB4AMDwi3pVUd68vfn5058iTx8xXfiCpmhbuhC5RznWKHZ8U
	HiBdB4ivBpBvMJMJNCzYkh9ApLGtDFwa6V8s802ZgeCP84LNfgcHU0wNPnQCMtYdhE0G
	eTR4tqmp/DmmDFN3ZTP5XZTM+EUrSjBDk9jWoQ0jDzQDvr1uqATem6RfwV8dUPqBgvum
	jJScQQf7WKvhJeok3iH9MaF4Y1EpvU80DsE+/og9jkC2HsPU2oML6Bcz3UKH5Rh7OPA/
	3elV6hgPrudJ0R3HxSCiFErCZHkj3uJwQXvUXfpJ1dVdaesrtLx9KJJSLQLTeklBNi+Z
	5ALA==
Received: by 10.68.221.41 with SMTP id qb9mr14179078pbc.147.1340777239787;
	Tue, 26 Jun 2012 23:07:19 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id io2sm14163334pbc.24.2012.06.26.23.07.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Jun 2012 23:07:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jun 2012 23:07:04 -0700
Message-Id: <cover.1340777115.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/7] kconfig-frontends and uclibc updated for systemd
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
X-List-Received-Date: Wed, 27 Jun 2012 06:18:14 -0000

This patch consolidates the feedback on kconfig-frontends
Adds additional patches needed for systemd to work with uclibc
Fixes uclibc and other userspace recipes to work with gold linker

The following changes since commit f4b5afe46ff018570c1949653eb6995428827f6f:

  sanity.bbclass: Increase LAYER_CONF_VERSION to match bblayers change (2012-06-25 17:20:06 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/misc-updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc-updates

Khem Raj (7):
  kconfig-frontends: New recipe
  tclibc-eglibc.inc: Define USE_NLS
  uclibc: Separate the bits between uclibc and uclibc-initial
  uclibc-git: Update for building systemd
  uclibc-0.9.33: add posix_fallocate implementation
  bison: link in librt on uclibc
  glib-2.0: Add missing dependency on virtual/libiconv

 meta/conf/distro/include/tclibc-eglibc.inc         |    2 +
 meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb      |    2 +-
 meta/recipes-core/glib-2.0/glib.inc                |    2 +-
 meta/recipes-core/uclibc/uclibc-0.9.33.inc         |   22 ++
 .../uclibc/uclibc-0.9.33/posix_fallocate.patch     |  408 ++++++++++++++++++++
 meta/recipes-core/uclibc/uclibc-git.inc            |   29 ++
 ...1-atexit_old-Do-not-add-it-to-shared-libc.patch |   44 +++
 ...brt-Use-nodefaultlibs-instead-of-nostdlib.patch |   33 ++
 ...-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch |   31 ++
 ...rk-Hide-pthread_atfork-in-shared-versions.patch |   74 ++++
 .../uclibc-git/define-MSG_CMSG_CLOEXEC.patch       |   25 ++
 meta/recipes-core/uclibc/uclibc-git/dup3.patch     |   37 ++
 .../uclibc/uclibc-git/posix_fallocate.patch        |  408 ++++++++++++++++++++
 meta/recipes-core/uclibc/uclibc-initial_0.9.33.bb  |    3 +-
 meta/recipes-core/uclibc/uclibc-initial_git.bb     |    3 +-
 meta/recipes-core/uclibc/uclibc-package.inc        |   37 ++
 meta/recipes-core/uclibc/uclibc.inc                |   59 +--
 meta/recipes-core/uclibc/uclibc_0.9.33.bb          |   33 +-
 meta/recipes-core/uclibc/uclibc_git.bb             |   33 +-
 meta/recipes-devtools/bison/bison_2.5.bb           |    1 +
 .../kconfig-frontends/kconfig-frontends_3.4.bb     |   34 ++
 21 files changed, 1221 insertions(+), 99 deletions(-)
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33.inc
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/posix_fallocate.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git.inc
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-atexit_old-Do-not-add-it-to-shared-libc.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-librt-Use-nodefaultlibs-instead-of-nostdlib.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-nptl-arm-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/define-MSG_CMSG_CLOEXEC.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/dup3.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/posix_fallocate.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-package.inc
 create mode 100644 meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb

-- 
1.7.9.5



