Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 589BD7121B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 06:43:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7T6hn4S027686
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 23:43:49 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 28 Aug 2014 23:43:49 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>
Date: Fri, 29 Aug 2014 14:43:37 +0800
Message-ID: <cover.1409294050.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V4 0/2] sstate_readonly: only allowed sstate-cache objects to be built (read-only sstate-cache)
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
X-List-Received-Date: Fri, 29 Aug 2014 06:43:50 -0000
Content-Type: text/plain

Changed in V4:
- Enable read-only sstate-cache by inheriting the bbclass
  rather than by the SSTATECACHE_WHITELIST value is not null.
  There will be cases where customers don't want to build
  -anything- from source. In V3, So they would need to enter
  a dummy value to get that behavior, and that would not be
  intuitive. 

Changed in V3:
- remove bitbake patch, which was sent to bitbake-devel
- rebase 'bbclass/sstate' patch, which was conflicted with
  'sstate: Add extra intercept functions' patch in master-next

Changed in V2:

- add hook SSTATE_CHECK_FUNCTIONS for sstate checking, and
  add a new bbclass/sstate_readonly, rather than directly
  modify bbclass/sstate

- terminate build safely while RunQueueExecuteScenequeue
  init failed, the previous bb.msg.fatal is too hack.

Test Steps:

1) Prepare an existed sstate_cache with cache directory "Sstate_Cache_Dir"
   It contained db-native sstate_cache.

2) Enable read-only sstate-cache by inheriting, and assign SSTATE_DIR
   with Sstate_Cache_Dir, vim local.conf
...
INHERIT += 'sstate_readonly'
SSTATE_DIR = "Sstate_Cache_Dir"
...

3) bitbake db-native

4) tweak db's do_configure task by adding comments
--- a/meta/recipes-support/db/db_6.0.30.bb
+++ b/meta/recipes-support/db/db_6.0.30.bb
@@ -82,6 +82,7 @@ do_configure() {
        gnu-configize --force ${S}
        export STRIP="true"
        oe_runconf
+       echo "hello"
 }


5) build db-native and there is a build failure
$ bitbake db-native
...
ERROR: Read-only sstate-cache is enabled, the build of 
"db-native"
did not come from sstate-cache. Only the recipe listed in
SSTATECACHE_WHITELIST is allowed to build from source
ERROR: Hash validation failed in RunQueueExecuteScenequeue Function failed: sstate_readonly_check
...

6) clean db-native failed
$ bitbake db-native -ccleansstate
...
ERROR: Read-only sstate-cache is enabled, the clean of 
db-native is not allowed. Only the recipe listed in
SSTATECACHE_WHITELIST is allowed to clean sstate-cache
...

$ bitbake db-native -ccleanall
...
ERROR: Read-only sstate-cache is enabled, the clean of 
db-native is not allowed. Only the recipe listed in
SSTATECACHE_WHITELIST is allowed to clean sstate-cache
...

7) Add db-native to SSTATECACHE_WHITELIST
vim local.conf
...
SSTATECACHE_WHITELIST = 'db-native'
...

8) build/clean db-native succee
$ bitbake db-native
$ bitbake db-native -ccleansstate
$ bitbake db-native -ccleanall

//Hongxu

The following changes since commit 669c07d6022174d01fe5a95b7b0faa9ef86da1e2:

  bitbake: build/data: Write out more complete python run files (2014-08-28 15:12:45 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/readonly-sstatecache
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/readonly-sstatecache

Hongxu Jia (2):
  bbclass/sstate: add hook SSTATE_CHECK_FUNCTIONS for sstate checking
  bbclass/sstate_readonly: only allowed sstate-cache objects to be built
    (read-only sstate-cache)

 meta/classes/sstate.bbclass          | 26 ++++++++++++++++++
 meta/classes/sstate_readonly.bbclass | 53 ++++++++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 meta/classes/sstate_readonly.bbclass

-- 
1.9.1


