Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RpkW9-0000FT-LH
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jan 2012 18:50:49 +0100
Received: by ggnp4 with SMTP id p4so1916430ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2012 09:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Q+On1mfDvWE3JoYh2cJDZyWpkZf6lqfIo1FL3hMUUgk=;
	b=GryAIq5lceCbcYyyMPVMI78sKsUsnDZ3JI93FeAkmIxDgeziGuYMBUl2ALKAeO550X
	N6N2vlurA6ovk+BDs2D9TT1KP27hINILzBOmj8unUFrSwbeYMJ7R1tLi3ZHUsWg0qyZp
	t4XBU9rxBkleS+EK34LQO/i52s5+Z4v0Z9moU=
Received: by 10.50.193.229 with SMTP id hr5mr15441269igc.15.1327426982940;
	Tue, 24 Jan 2012 09:43:02 -0800 (PST)
Received: from leto.gateway.2wire.net
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id kh9sm11234871igc.1.2012.01.24.09.43.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Jan 2012 09:43:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2012 09:42:49 -0800
Message-Id: <cover.1327426808.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.8.3
Subject: [PATCH 0/7] uclibc update and misc fixes.
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
X-List-Received-Date: Tue, 24 Jan 2012 17:50:49 -0000

Hi

Follwing patches have been tested on uclibc using all qemu
machines.

The following changes since commit a4a98b6d6273d4e716afbff0880d0ac2ff7be0a9:

  gcc-common.inc: Fix comment (2012-01-24 14:38:31 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/misc-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc-fixes

Khem Raj (7):
  ltp: Update recipe and fix building on uclibc
  gdb-common: Drop elfutils from DEPENDS
  task-core-tools: Divide it into 3 recipes
  uclibc: Dont package all .a in uclibc-dev
  eglibc-2.15: Add upstream status for x86_fenv.patch
  uclibc-git: Update to latest RC
  util-linux: Change SRC_URI to a fetchable location

 .../conf/distro/include/distro_tracking_fields.inc |   26 ++-
 meta/conf/multilib.conf                            |    4 +-
 .../recipes-core/eglibc/eglibc-2.15/x86_fenv.patch |    7 +
 meta/recipes-core/tasks/task-core-tools-debug.bb   |   26 +++
 ...sk-core-tools.bb => task-core-tools-profile.bb} |   81 +++------
 .../recipes-core/tasks/task-core-tools-testapps.bb |   46 +++++
 .../uclibc/uclibc-git/argp-headers.patch           |    2 +
 .../uclibc/uclibc-git/argp-support.patch           |    3 +
 .../uclibc-git/compile-arm-fork-with-O2.patch      |    2 +-
 .../uclibc/uclibc-git/cross_compile_check.patch    |   13 --
 .../recipes-core/uclibc/uclibc-git/fix_libdl.patch |   83 ---------
 .../uclibc/uclibc-git/orign_path.patch             |  185 ++++++++++++++++++++
 .../uclibc-git/remove_attribute_optimize_Os.patch  |   12 --
 .../uclibc/uclibc-git/uclibc-arm-ftruncate64.patch |   18 --
 meta/recipes-core/uclibc/uclibc.inc                |    3 +-
 meta/recipes-core/uclibc/uclibc_git.bb             |    8 +-
 meta/recipes-core/util-linux/util-linux.inc        |    2 +-
 meta/recipes-devtools/gdb/gdb-common.inc           |    6 +-
 .../ltp/ltp/uclibc-getcontext.patch                |   78 ++++++++
 .../ltp/{ltp_20110915.bb => ltp_20120104.bb}       |   10 +-
 20 files changed, 408 insertions(+), 207 deletions(-)
 create mode 100644 meta/recipes-core/tasks/task-core-tools-debug.bb
 rename meta/recipes-core/tasks/{task-core-tools.bb => task-core-tools-profile.bb} (48%)
 create mode 100644 meta/recipes-core/tasks/task-core-tools-testapps.bb
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/cross_compile_check.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/fix_libdl.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/orign_path.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/uclibc-arm-ftruncate64.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/uclibc-getcontext.patch
 rename meta/recipes-extended/ltp/{ltp_20110915.bb => ltp_20120104.bb} (93%)

-- 
1.7.8.3



