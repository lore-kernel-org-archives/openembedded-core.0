Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4EEC4601A8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 07:16:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s767GBxq005118
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 6 Aug 2014 00:16:11 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 6 Aug 2014 00:16:11 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>,
	<richard.purdie@linuxfoundation.org>
Date: Wed, 6 Aug 2014 15:15:58 +0800
Message-ID: <cover.1407306581.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 0/3][RFC] only allowed sstate-cache objects are allowed in a build (read-only sstate-cache?)
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
X-List-Received-Date: Wed, 06 Aug 2014 07:16:20 -0000
Content-Type: text/plain

Issue description:

The issue is that the developer who demand only the "new" software
they write is allowed to be compiled from source, they only want to
reuse binaries from an existed sstate-cache, if the developer makes
a change that triggers a rebuild, it should be an instant error. 

The purpose of this is for the sstate-cache to check if the item
exists or not. If it doesn't the item needs to be in a whitelist
or we need to fail.

I dig into three approaches to implement, and send them to oe-core
list to see if the community has a preference as to the approach,
and any additional comments.

In these approaches, I'm not sure we should protect the 'clean' or
not. Since it's ok to clean the sstate-cache, as long as a mirror
fetch will pull it back down. Any suggestion is welcomed.

If you have any better ideas, please don't hesitate to share with us.

Test steps:

1) For approach 1
   INHERIT += 'sstate_readonly'

   For approach 2
   INHERIT += 'sstate_readonly_2'

2) Create a sstate cache for testing
$ bitbake db

3) Add gzip to SSTATECACHE_WHITELIST, it enabled read-only sstate-cache,
vim local.conf
...
SSTATECACHE_WHITELIST = 'gzip'
...

4) Remove tmp dir and build db from sstate-cache succeed
$ mv tmp tmp-back && bitbake db

5) tweak db's do_configure task by adding comments
--- a/meta/recipes-support/db/db_6.0.30.bb
+++ b/meta/recipes-support/db/db_6.0.30.bb
@@ -27,6 +27,8 @@ LIC_FILES_CHKSUM = "file://../LICENSE;md5=1ec8b0b17cc31513fe35ab10716f8490"
@@ -82,6 +84,7 @@ do_configure() {
        gnu-configize --force ${S}
        export STRIP="true"
        oe_runconf
+       echo "hello"
 }

6) build db and there is a build failure
$ bitbake db

7) clean db and there is a clean failure
bitbake db -ccleansstate

8) Append the missing recipe's PN to SSTATECACHE_WHITELIST
vim local.conf
...
SSTATECACHE_WHITELIST = 'gzip db rpm-native gcc-runtime eglibc linux-libc-headers libgcc'
...

9) Build db and clean db succeed
$ bitbake db && bitbake db -ccleansstate

//Hongxu

The following changes since commit 870bb8d35547b8313b3a487d7e8b914ab9470e64:

  local.conf.sample.extended: fix example for EXTRA_USERS_PARAMS (2014-08-04 17:38:24 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/readonly-sstatecache
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/readonly-sstatecache

Hongxu Jia (3):
  bbclass/sstate_readonly approach 1: add prefuncs to SSTATETASKS
  bbclass/sstate_readonly_2 approach 2: add event handler at TaskStarted
    time
  bbclass/sstate approach 3: add checking in the return path of
    sstate_checkhashes

 meta/classes/sstate.bbclass            | 40 ++++++++++++++++++++++++++++++++++
 meta/classes/sstate_readonly.bbclass   | 38 ++++++++++++++++++++++++++++++++
 meta/classes/sstate_readonly_2.bbclass | 25 +++++++++++++++++++++
 3 files changed, 103 insertions(+)
 create mode 100644 meta/classes/sstate_readonly.bbclass
 create mode 100644 meta/classes/sstate_readonly_2.bbclass

-- 
1.9.1


