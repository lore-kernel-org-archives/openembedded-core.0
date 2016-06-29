Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A2C83731AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2016 08:09:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5T89lTX024208
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2016 01:09:48 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 29 Jun 2016 01:09:47 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jun 2016 16:08:45 +0800
Message-ID: <1467187725-7761-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Subject: [PATCH] libpfm4: fix compile error
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
X-List-Received-Date: Wed, 29 Jun 2016 08:09:49 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It fails to compile libpfm4 with misleading-indentation error:

| syst_count.c:346:3: error: this 'for' clause does not guard...  [-Werror=misleading-indentation]
|   for(c=cmin ; c < cmax; c++)
|      ^~~

Add clauses to fix it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../files/fix-misleading-indentation-error.patch   | 38 ++++++++++++++++++++++
 meta/recipes-kernel/libpfm/libpfm4_4.6.0.bb        |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-kernel/libpfm/files/fix-misleading-indentation-error.patch

diff --git a/meta/recipes-kernel/libpfm/files/fix-misleading-indentation-error.patch b/meta/recipes-kernel/libpfm/files/fix-misleading-indentation-error.patch
new file mode 100644
index 0000000..25d47ef
--- /dev/null
+++ b/meta/recipes-kernel/libpfm/files/fix-misleading-indentation-error.patch
@@ -0,0 +1,38 @@
+Upstream-Status: Pending
+
+Fix compile error:
+
+| syst_count.c:346:3: error: this 'for' clause does not guard... [-Werror=misleading-indentation] 
+|    for(c=cmin ; c < cmax; c++) 
+|       ^~~ 
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+diff --git a/perf_examples/syst_count.c b/perf_examples/syst_count.c
+index 0d53078..2dfb9b9 100644
+--- a/perf_examples/syst_count.c
++++ b/perf_examples/syst_count.c
+@@ -343,8 +343,9 @@ measure(void)
+ 
+ 		for (delay = 1 ; delay <= options.delay; delay++) {
+ 
+-		for(c=cmin ; c < cmax; c++)
+-			start_cpu(c);
++			for(c=cmin ; c < cmax; c++) {
++				start_cpu(c);
++			}
+ 
+ 			if (0) {
+ 				tv.tv_sec = 0;
+@@ -353,8 +354,9 @@ measure(void)
+ 			} else
+ 				sleep(1);
+ 
+-		for(c=cmin ; c < cmax; c++)
+-			stop_cpu(c);
++			for(c=cmin ; c < cmax; c++) {
++				stop_cpu(c);
++			}
+ 
+ 			for(c = cmin; c < cmax; c++) {
+ 				printf("# %'ds -----\n", delay);
diff --git a/meta/recipes-kernel/libpfm/libpfm4_4.6.0.bb b/meta/recipes-kernel/libpfm/libpfm4_4.6.0.bb
index 0b024ad..4136eac 100644
--- a/meta/recipes-kernel/libpfm/libpfm4_4.6.0.bb
+++ b/meta/recipes-kernel/libpfm/libpfm4_4.6.0.bb
@@ -14,6 +14,7 @@ COMPATIBLE_HOST = "powerpc64"
 
 SRC_URI = "http://downloads.sourceforge.net/project/perfmon2/${BPN}/libpfm-${PV}.tar.gz \
            file://0001-Makefile-Add-LDFLAGS-variable-to-SLDFLAGS.patch \
+           file://fix-misleading-indentation-error.patch \
           "
 
 SRC_URI[md5sum] = "5077b9022440e4951d96f2d0e73bd487"
-- 
2.6.1


