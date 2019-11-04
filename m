Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 75FE37F4F4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 06:51:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xA46p25N027795
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 3 Nov 2019 22:51:02 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Sun, 3 Nov 2019 22:51:01 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Nov 2019 14:51:00 +0800
Message-ID: <1572850260-75346-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] target-sdk-provides-dummy: set nostamp for do_package
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
X-List-Received-Date: Mon, 04 Nov 2019 06:51:01 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

It exists a situation that there is a common config file includes
multilib.conf but variable MULTILIBS is not set by default:

  require conf/multilib.conf
  MULTILIBS ?= ""

When build target-sdk-provides-dummy in the same build project with
following steps, it fails.

1 $ echo 'MACHINE = "qemux86"' >>conf/local.conf
  $ bitbake target-sdk-provides-dummy
2 $ cat <<EOF >>conf/local.conf
    MACHINE = "qemux86-64"
    MULTILIBS = "multilib:lib32"
    DEFAULTTUNE_virtclass-multilib-lib32 = "i586"
    EOF
  $ bitbake target-sdk-provides-dummy
  $ bitbake lib32-target-sdk-provides-dummy

It fails to build lib32-target-sdk-provides-dummy with error messages:

| ERROR: target-sdk-provides-dummy-1.0-r0 do_packagedata: The recipe target-sdk-provides-dummy
|  is trying to install files into a shared area when those files already exist. Those files
|  and their manifest location are:
|   .../tmp/pkgdata/qemux86-64/lib32-target-sdk-provides-dummy
|     (matched in manifest-qemux86_64-lib32-target-sdk-provides-dummy.packagedata)
|   .../tmp/pkgdata/qemux86-64/runtime/lib32-target-sdk-provides-dummy
|     (matched in manifest-qemux86_64-lib32-target-sdk-provides-dummy.packagedata)
|   ... snip ...
| Please verify which recipe should provide the above files.

Because target-sdk-provides-dummy is a virtual package, its sstate
caches are same for both qemux86 and qemux86_64. So when build
target-sdk-provides-dummy for qemux86_64, it re-uses the sstate cache
from qemux86 and then create file lib32-target-sdk-provides-dummy under
${PKGDATA_DIR} which should not and it conflicts with
lib32-target-sdk-provides-dummy too.

So make do_package always be executed to fix the issue. Because it is a
dummy package, it won't cost too much build time.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-core/meta/target-sdk-provides-dummy.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
index 87b8bfa..ab78cb9 100644
--- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
@@ -59,4 +59,6 @@ DUMMYPROVIDES = "\
 
 require dummy-sdk-package.inc
 
+do_package[nostamp] = "1"
+
 SSTATE_DUPWHITELIST += "${PKGDATA_DIR}/${PN} ${PKGDATA_DIR}/runtime/${PN}"
-- 
2.7.4


