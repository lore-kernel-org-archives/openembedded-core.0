Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 47EF1713C1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 08:08:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8H88kiW018083
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 17 Sep 2014 01:08:46 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 17 Sep 2014 01:08:45 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>,
	<richard.purdie@linuxfoundation.org>
Date: Wed, 17 Sep 2014 16:08:28 +0800
Message-ID: <cover.1410939794.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/5] improve locked down sstate
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
X-List-Received-Date: Wed, 17 Sep 2014 08:08:53 -0000
Content-Type: text/plain

Changed in V2:
- Set SIGGEN_LOCKEDSIGS_CHECK_LEVEL default to error

- Move dump sig file event handler to a separate class

- Fix typo

- Fix overrides behaviour to remove SIGGEN_LOCKEDSIGS_i586

- Support incremental dump lockedsigs without complicate
  the structure of the lockedsigs variable.

Test Steps:

1. Prepare a locked sstat-cache by dumping lockedsigs file
1) vim local.conf
...
USER_CLASSES += "sstate_lockedsig"
SIGGEN_LOCKEDSIGS_CONFIG = "/path/to/locked-sigs.inc"
SSTATE_DIR ?= "/path/to/sstate-cache"
...

2) Build db-native from a clean environment
$ bitbake db-native

3) Back up lockedsigs file
$ mv /path/to/locked-sigs.inc  /path/to/locked-sigs.inc-back

4) Incremental build ldconfig-native
$ vim local.conf
...
require ${SIGGEN_LOCKEDSIGS_CONFIG}
...
$ bitbake ldconfig-native

5) Compare the two sig files, and check whether it is incremental dump or not
$ vimdiff /path/to/locked-sigs.inc-back /path/to/locked-sigs.inc

2. Create a new build which uses previous locked sstat-cache
1) vim local.conf
...
SSTATE_DIR ?= "/path/to/sstate-cache"
SIGGEN_LOCKEDSIGS_CONFIG = "/path/to/locked-sigs.inc"
require ${SIGGEN_LOCKEDSIGS_CONFIG}
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

The following changes since commit 7d80f8e9468253496a7097685aac8f468940a9c5:

  bitbake: data_smart: Clarify what 'computed' means in the data store history context (2014-09-16 22:15:24 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/locked-sstate
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/locked-sstate

Hongxu Jia (5):
  sstate: set SIGGEN_LOCKEDSIGS_CHECK_LEVEL default to error
  sstate_lockedsig.bbclass: add event handler to dump lockedsigs at
    recipe building time
  sstatesig.py: fix typo of locke sstate
  sstatesig: fix overrides behaviour to remove SIGGEN_LOCKEDSIGS_i586
  sstatesig: incremental dump lockedsigs

git@opal.openembedded.org (4):
  Richard Purdie : sstatesig/sstate: Add support for locked down sstate
    cache usage
  Richard Purdie : sstatesig: Improve to handle locking of multiple
    machines
  Randy Witt : sstatesig.py: Replace '_'s with '-' s in
    SSTATE_LOCKEDSIGS* names.
  Hongxu Jia : sstatesig: Improve the support for locked down sstate
    cache usage

 meta/classes/sstate.bbclass           |   5 ++
 meta/classes/sstate_lockedsig.bbclass |  12 ++++
 meta/lib/oe/sstatesig.py              | 106 ++++++++++++++++++++++++++++++++++
 scripts/gen-lockedsig-cache           |  40 +++++++++++++
 4 files changed, 163 insertions(+)
 create mode 100644 meta/classes/sstate_lockedsig.bbclass
 create mode 100755 scripts/gen-lockedsig-cache

-- 
1.9.1


