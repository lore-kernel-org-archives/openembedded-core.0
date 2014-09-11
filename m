Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 76D4E65CE7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Sep 2014 15:04:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8BF4YkM025863
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 11 Sep 2014 08:04:34 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 11 Sep 2014 08:04:33 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>,
	<richard.purdie@linuxfoundation.org>
Date: Thu, 11 Sep 2014 23:04:24 +0800
Message-ID: <cover.1410446513.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/5] Add support for locked down sstate
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
X-List-Received-Date: Thu, 11 Sep 2014 15:04:38 -0000
Content-Type: text/plain

Patches 4/5, 3/5 are mine, based on Richard's 1/5, 2/5, 3/5.

Test Steps:

1. Prepare a locked sstat-cache by dumping lockedsigs file
1) vim local.conf
...
SIGGEN_DUMP_LOCKEDSIGS = "1"
SIGGEN_LOCKEDSIGS_CONFIG = "/path/to/locked-sigs.inc"
SSTATE_DIR ?= "/path/to/sstate-cache"
...

2) Build db-native from a clean environment
$ bitbake db-native

3) Back up lockedsigs file
$ mv /path/to/locked-sigs.inc  /path/to/locked-sigs.inc-back

4) Incrementally build ldconfig-native
$ vim local.conf
...
require ${SIGGEN_LOCKEDSIGS_CONFIG}
...
$ bitbake ldconfig-native

5) Check incrementally dumping lockedsiged file also
$ vimdiff /path/to/locked-sigs.inc-back /path/to/locked-sigs.inc

2. Create a new build which uses previous locked sstat-cache
1) vim local.conf
...
SSTATE_DIR ?= "/path/to/sstate-cache"
SIGGEN_LOCKEDSIGS_CONFIG = "/path/to/locked-sigs.inc"
require ${SIGGEN_LOCKEDSIGS_CONFIG}
SIGGEN_LOCKEDSIGS_CHECK_LEVEL = "error"
...

2) Build db-native
$ bitbake db-native

3) Tweak db's do_configure task by adding comments
--- a/meta/recipes-support/db/db_6.0.30.bb
+++ b/meta/recipes-support/db/db_6.0.30.bb
@@ -82,6 +82,7 @@ do_configure() {
        gnu-configize --force ${S}
        export STRIP="true"
        oe_runconf
+       echo "hello"
 }

4) Build db-native and abort
$ bitbake db-native
...
ERROR: The db-native:do_configure sig (00546ab0e73b3afd50efc03f26e5f040) changed, use locked sig 9d8f2210506446e76d012d1ebd49a021 to instead
The db-native:do_compile sig (4442f979d97bdbed71a8fecbbbe41ed3) changed, use locked sig d29a7c568d10859176d733773433fe92 to instead
The db-native:do_install sig (562cb98d8eb25a7c79ded6a5359c56c1) changed, use locked sig 1e917d8d619c58987a1b2fe286e9288c to instead
The db-native:do_populate_sysroot sig (91627e36da9ac8fe489f36b67a87ed2e) changed, use locked sig f780d45dbf680e40a871820327c4c56c to instead
The db-native:do_build sig (ba289cba4a3bfda0c07aed9868fdcd5d) changed, use locked sig d9b84e5fb30011fd31bc0e7d7652fead to instead
...

5) Remove db-native sstate-cache
$ bitbake db-native -ccleansstate

6) Build db-native and abort
$ bitbake db-native
...
Locked sig is set for db-native:do_populate_sysroot (f780d45dbf680e40a871820327c4c56c) yet not in sstate cache?
...

7) Do not break the build
vim local.conf
...
SIGGEN_LOCKEDSIGS_CHECK_LEVEL = "warn"
...

8) Build db-native
$ bitbake db-native
...
WARNING Locked sig is set for db-native:do_populate_sysroot (f780d45dbf680e40a871820327c4c56c) yet not in sstate cache?
...

//Hongxu

The following changes since commit bd1a3ab8a63d6b2c109d595c67fcca99817e1daa:

  nspr: Upgrade to 4.10.7 (2014-09-10 15:38:57 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/locked-sstate
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/locked-sstate

Hongxu Jia (2):
  sstate/sstatesig: optimize the support for locked down sstate cache
    usage
  sstatesig: incremental dump lockedsigs

Richard Purdie (1):
  siggen/runqueue/bitbake-worker: Improve siggen data transfer interface

git@opal.openembedded.org (2):
  Richard Purdie : sstatesig/sstate: Add support for locked down sstate
    cache usage
  Richard Purdie : sstatesig: Improve to handle locking of multiple
    machines

 bitbake/bin/bitbake-worker  |   2 +-
 bitbake/lib/bb/runqueue.py  |   4 +-
 bitbake/lib/bb/siggen.py    |   9 ++--
 meta/classes/sstate.bbclass |  17 ++++++
 meta/lib/oe/sstatesig.py    | 123 ++++++++++++++++++++++++++++++++++++++++++++
 scripts/gen-lockedsig-cache |  40 ++++++++++++++
 6 files changed, 187 insertions(+), 8 deletions(-)
 create mode 100755 scripts/gen-lockedsig-cache

-- 
1.9.1


