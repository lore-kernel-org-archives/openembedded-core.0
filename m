Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DDB46601A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 02:37:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7L2awHE007079
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Aug 2014 19:36:58 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 20 Aug 2014 19:36:58 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Aug 2014 10:36:53 +0800
Message-ID: <cover.1408588282.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 0/1] bbclass/sstate: only allowed sstate-cache objects are allowed in a build (read-only sstate-cache)
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
X-List-Received-Date: Thu, 21 Aug 2014 02:37:03 -0000
Content-Type: text/plain

Test steps:

1) Create a sstate cache for testing
$ bitbake db

2) Add gzip to SSTATECACHE_WHITELIST, it enabled read-only sstate-cache,
vim local.conf
...
SSTATECACHE_WHITELIST = 'gzip'
...

3) Remove tmp dir and build db from sstate-cache succeed
$ mv tmp tmp-back && bitbake db

4) tweak db's do_configure task by adding comments
--- a/meta/recipes-support/db/db_6.0.30.bb
+++ b/meta/recipes-support/db/db_6.0.30.bb
@@ -27,6 +27,8 @@ LIC_FILES_CHKSUM = "file://../LICENSE;md5=1ec8b0b17cc31513fe35ab10716f8490"
@@ -82,6 +84,7 @@ do_configure() {
        gnu-configize --force ${S}
        export STRIP="true"
        oe_runconf
+       echo "hello"
 }

5) build db and there is a build failure
$ bitbake db

6) clean db and there is a clean failure
bitbake db -ccleansstate

7) Append the missing recipe's PN to SSTATECACHE_WHITELIST
vim local.conf
...
SSTATECACHE_WHITELIST = 'gzip db rpm-native gcc-runtime eglibc linux-libc-headers libgcc'
...

8) Build db and clean db succeed
$ bitbake db && bitbake db -ccleansstate

//Hongxu

The following changes since commit 34436672f3ef4915e7526770a0fa8dcff328f93d:

  bitbake: runqueue.py: Fix typoes/grammar in comments. (2014-08-19 20:41:26 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/readonly-sstatecache
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/readonly-sstatecache

Hongxu Jia (1):
  bbclass/sstate: only allowed sstate-cache objects are allowed in a
    build (read-only sstate-cache)

 meta/classes/sstate.bbclass | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

-- 
1.9.1


