Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7423274622
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 03:12:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w3K3CHco020592
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 19 Apr 2018 20:12:17 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 19 Apr 2018 20:12:16 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <bruce.ashfield@windriver.com>
Date: Fri, 20 Apr 2018 11:19:47 +0800
Message-ID: <1524194387-10021-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] kernel-devsrc: fix cpio randomly hit insane file name
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
X-List-Received-Date: Fri, 20 Apr 2018 03:12:17 -0000
Content-Type: text/plain

Occasionally compile kernel-devsrc failed at world build.
...
|0 blocks
|cpio: ./tools/perf/arch/arm/util/sedr7ORqk: Cannot stat:
No such file or directory
|0 blocks
...
cpio tried to find a file at ${S}/tools/perf and failed
if the input list is not valid.

The reason is perf and kernel-devsrc have the same ${S},
Perf sed ${S}/tools/perf/* at do_configure, kernel-devsrc
cpio ${S} at do_install. The former task affects the latter
one, so let the latter depends the former to avoid the conflict.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 8bbfa23..5ebeabc 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -18,6 +18,9 @@ inherit module-base
 do_install[depends] += "virtual/kernel:do_shared_workdir"
 # Need the source, not just the output of populate_sysroot
 do_install[depends] += "virtual/kernel:do_install"
+# Perf `sed ${S}/tools/perf/*' at do_configure, make sure it is done
+# before kernel-devsrc `cpio ${S}' at do_install
+do_install[depends] += "virtual/perf:do_configure"
 
 # There's nothing to do here, except install the source where we can package it
 do_fetch[noexec] = "1"
-- 
2.7.4


