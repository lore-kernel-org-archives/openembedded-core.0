Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3D71370F06
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 06:16:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7S6G9SA029708
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 27 Aug 2014 23:16:09 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 27 Aug 2014 23:16:08 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>, <mark.hatle@windriver.com>
Date: Thu, 28 Aug 2014 14:15:57 +0800
Message-ID: <cover.1409206228.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V3 0/2] bbclass/sstate: only allowed sstate-cache objects are allowed in a build (read-only sstate-cache)
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
X-List-Received-Date: Thu, 28 Aug 2014 06:16:15 -0000
Content-Type: text/plain

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

Test steps:

1) vim local.conf
INHERIT += 'sstate_readonly'

2) Create a sstate cache for testing
$ bitbake db-native

3) Remove tmp dir and build db-native from sstate-cache
$ mv tmp tmp-back && bitbake db-native

4) Add gzip to SSTATECACHE_WHITELIST, it enabled read-only sstate-cache,
vim local.conf
...
SSTATECACHE_WHITELIST = 'gzip'
...

5) Remove tmp dir and build db-native from sstate-cache
$ mv tmp tmp-back && bitbake db-native

6) tweak db's do_configure task by adding comments
--- a/meta/recipes-support/db/db_6.0.30.bb
+++ b/meta/recipes-support/db/db_6.0.30.bb
@@ -82,6 +82,7 @@ do_configure() {
        gnu-configize --force ${S}
        export STRIP="true"
        oe_runconf
+       echo "hello"
 }


7) build db-native and there is a build failure
$ bitbake db-native
...
NOTE: Preparing runqueue
ERROR: Read-only sstate-cache is enabled, the build of 
"db-native"
did not come from sstate-cache. Only the recipe listed in
SSTATECACHE_WHITELIST is allowed to build from source
...

8) clean db-native failed
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

9) Add db-native to SSTATECACHE_WHITELIST
vim local.conf
...
SSTATECACHE_WHITELIST = 'gzip db-native'
...

10) build/clean db-native succee
$ bitbake db-native
$ bitbake db-native -ccleansstate
$ bitbake db-native -ccleanall

//Hongxu

The following changes since commit c16795477ea7e2159b5d3808268912b572887e2d:

  qemu: add PACKAGECONFIG for numa (2014-08-27 12:13:38 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/readonly-sstatecache
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/readonly-sstatecache

Hongxu Jia (2):
  bbclass/sstate: add hook SSTATE_CHECK_FUNCTIONS for sstate checking
  bbclass/sstate_readonly: only allowed sstate-cache objects are allowed
    in a build (read-only sstate-cache)

 meta/classes/sstate.bbclass          | 26 ++++++++++++++++++
 meta/classes/sstate_readonly.bbclass | 51 ++++++++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)
 create mode 100644 meta/classes/sstate_readonly.bbclass

-- 
1.9.1


