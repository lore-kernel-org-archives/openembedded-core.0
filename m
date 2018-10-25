Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 56DD171E4C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 07:59:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9P7xLU0015848
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 00:59:21 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 25 Oct 2018 00:59:20 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Oct 2018 15:17:17 +0800
Message-ID: <036553c4f9e1be02b3da5d325dfc306997502a83.1540451811.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1540451811.git.kai.kang@windriver.com>
References: <cover.1540451811.git.kai.kang@windriver.com>
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 25 Oct 2018 07:59:20 -0000
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
${PKGDATA_DIR} which should not and it conflicts with
lib32-target-sdk-provides-dummy too.

So make do_package always be executed to fix the issue. Because it is a
dummy package, it won't cost too much build time.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/meta/target-sdk-provides-dummy.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
index 714d15d8ba..0eac23599b 100644
--- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
@@ -8,4 +8,6 @@ DUMMYPROVIDES = "\
     pkgconfig \
 "
 
+do_package[nostamp] = "1"
+
 require dummy-sdk-package.inc
-- 
2.18.0


