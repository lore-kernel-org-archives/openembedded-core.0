Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7A5807DD41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 07:16:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3U7Fqr1013004
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 30 Apr 2019 00:16:18 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 30 Apr 2019 00:16:08 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 30 Apr 2019 03:15:39 -0400
Message-ID: <20190430071539.145427-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190430071539.145427-1-kai.kang@windriver.com>
References: <20190430071539.145427-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] target-sdk-provides-dummy: set nostamp for do_package
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
X-List-Received-Date: Tue, 30 Apr 2019 07:16:38 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

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
${PKGDATA_DIR} which should not and then conflicts with lib32-target-sdk-provides-dummy.

Make do_package always be executed to fix the issue. Because it is a dummy
package, it won't cost too much build time.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/meta/target-sdk-provides-dummy.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
index 85472a825c..e09a08bcd7 100644
--- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
@@ -52,3 +52,5 @@ DUMMYPROVIDES = "\
 "
 
 require dummy-sdk-package.inc
+
+do_package[nostamp] = "1"
-- 
2.20.0


