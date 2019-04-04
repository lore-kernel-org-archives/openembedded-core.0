Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A0B567CFF8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 09:02:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3492d0l004147
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Apr 2019 02:02:50 -0700
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Thu, 4 Apr 2019 02:02:17 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 4 Apr 2019 17:02:33 +0800
Message-ID: <1554368553-1851-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] perf: workaround the error cased by maybe-uninitialized warning
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
X-List-Received-Date: Thu, 04 Apr 2019 09:02:59 -0000
Content-Type: text/plain

When enable DEBUG_BUILD, the perf build failed by the following error:
    libbpf.c:727:36: error: 'data' may be used uninitialized in this function [-Werror=maybe-uninitialized]
This is ok until Khem commit a patch in oe-core:
    16643b03227466e2c80a24c2d079fe36e89553c1
This commit import "-Og" option to "DEBUG_OPTIMIZATION", result in this error.

Actually, the warning was misinformation. We explore the code in libbpf.c:
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/lib/bpf/libbpf.c#n640
--------------------------------------------------------------------------
	if (scn)
		data = elf_getdata(scn, NULL);
	if (!scn || !data) {
		pr_warning("failed to get Elf_Data from map section %d\n",
			   obj->efile.maps_shndx);
		return -EINVAL;
	}
	......
	using data...
	......
--------------------------------------------------------------------------
If the 'scn' was not null, the data will be initialized. if the data was null,
the function will return -EINVAL, so the data must be not null, but compiler
can't see it in 'if' code block, so treat it as 'maybe-uninitialized'.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 5acdcfb..546076f 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -271,3 +271,4 @@ FILES_${PN}-perl = "${libexecdir}/perf-core/scripts/perl"
 
 
 INHIBIT_PACKAGE_DEBUG_SPLIT="1"
+DEBUG_OPTIMIZATION_append = " -Wno-error=maybe-uninitialized"
-- 
2.7.4


