Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8E0F5796C5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 16:31:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w86GVBwg003701
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Sep 2018 09:31:11 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 6 Sep 2018 09:31:10 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 6 Sep 2018 23:52:30 +0800
Message-ID: <327f5c2b7be515d0490914bb90ca39b513e63f92.1536248856.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1536248856.git.kai.kang@windriver.com>
References: <cover.1536248856.git.kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] target-sdk-provides-dummy: skip package_qa_multilib check
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
X-List-Received-Date: Thu, 06 Sep 2018 16:31:10 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The rprovides of target-sdk-provides-dummy don't be updated with
multilib, so it fails package_qa_multilib check. Because
target-sdk-provides-dummy doesn't install any file to sysroot, it is
safe to skip package_qa_multilib check for target-sdk-provides-dummy.

Remove ${MLPREFIX}target-sdk-provides-dummy from TOOLCHAIN_TARGET_TASK
at same time in populate_sdk_base.bbclass.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/multilib.bbclass          | 4 ++++
 meta/classes/populate_sdk_base.bbclass | 3 +--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 7b4d6472b0..e7b717eee1 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -146,6 +146,10 @@ python do_package_qa_multilib() {
     if not ml:
         return
 
+    # exception for ${MLPREFIX}target-sdk-provides-dummy
+    if 'target-sdk-provides-dummy' in d.getVar('PN'):
+        return
+
     packages = d.getVar('PACKAGES')
     for pkg in packages.split():
         check_mlprefix(pkg, 'RDEPENDS', ml)
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index bbf1ff1cd2..e07ad0cc6b 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -40,8 +40,7 @@ SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${REAL_MULTIMACH_TARGET_SYS}"
 
 TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-sdk-host packagegroup-cross-canadian-${MACHINE}"
 TOOLCHAIN_HOST_TASK_ATTEMPTONLY ?= ""
-TOOLCHAIN_TARGET_TASK ?= "${@multilib_pkg_extend(d, 'packagegroup-core-standalone-sdk-target')} \
-                          ${@multilib_pkg_extend(d, 'target-sdk-provides-dummy')}"
+TOOLCHAIN_TARGET_TASK ?= "${@multilib_pkg_extend(d, 'packagegroup-core-standalone-sdk-target')} target-sdk-provides-dummy"
 TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
 TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
 
-- 
2.18.0


