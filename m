Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 61BF179C45
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 13:28:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9IDSjGG009954
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Oct 2018 06:28:45 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 18 Oct 2018 06:28:44 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>, <bruce.ashfield@windriver.com>
Date: Thu, 18 Oct 2018 06:28:44 -0700
Message-ID: <20181018132844.45217-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH] perf: fix do_compile failure with /tmp mounted with noexec
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
X-List-Received-Date: Thu, 18 Oct 2018 13:28:46 -0000
Content-Type: text/plain

On a builder which has /tmp mounted nexec, the ARM64 generation of
the sycall table will fail:
[snip]
|perf-1.0/tools/perf/arch/arm64/entry/syscalls//mksyscalltbl:
/tmp/create-table-6VGPSt: Permission denied
[snip]

To avoid the permission denied error, we must instruct the perf build
to place temporary files in an appropriate directory (versus always
using /tmp). To do this, we need both a kernel source change to perf,
and a recipe change to pass the temp directory in by a TMPDIR variable.

The linux-yocto has a reference kernel change: [perf arm64: Fix generate
system call table failed with /tmp mounted with noexec], that has also
been submitted upstream mailing list linux-perf-users@vger.kernel.org

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Reviewed-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 586422f..af09904 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -75,6 +75,7 @@ EXTRA_OEMAKE = '\
     perfexecdir=${libexecdir} \
     NO_GTK2=1 \
     ${PACKAGECONFIG_CONFARGS} \
+    TMPDIR="${B}" \
 '
 
 EXTRA_OEMAKE += "\
-- 
2.10.2


