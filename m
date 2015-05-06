Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2AE9473EED
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 20:28:45 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 06 May 2015 13:28:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,380,1427785200"; d="scan'208";a="567370669"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 06 May 2015 13:28:47 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 9DFFD6A408F;
	Wed,  6 May 2015 13:28:17 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 May 2015 23:28:39 +0300
Message-Id: <1430944119-1825-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1430922461.8074.45.camel@linuxfoundation.org>
References: <1430922461.8074.45.camel@linuxfoundation.org>
Subject: [PATCH v.5] kernel.bbclass: Fix race condition
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
X-List-Received-Date: Wed, 06 May 2015 20:28:46 -0000

Race condition between do_compile_kernelmodules and do_shared_workdir
tasks occurs when do_compile_kernelmodules changes files in
include/generated/* while do_shared_workdir tries to copy them to
shared working directory.

Fixed race by moving do_shared_workdir after do_compile but before
do_compile_kernelmodules.

[YOCTO #7321]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 125ed88..74092e9 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -234,7 +234,7 @@ kernel_do_install() {
 }
 do_install[prefuncs] += "package_get_auto_pr"
 
-addtask shared_workdir after do_compile before do_install
+addtask shared_workdir after do_compile before do_compile_kernelmodules
 
 emit_depmod_pkgdata() {
 	# Stash data for depmod
-- 
2.1.4


