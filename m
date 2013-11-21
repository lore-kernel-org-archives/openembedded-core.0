Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 348F56DBE6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 07:33:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAL7XQRX014500
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 23:33:26 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 20 Nov 2013 23:33:26 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 01:33:17 -0600
Message-ID: <1385019198-24458-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1385019198-24458-1-git-send-email-mark.hatle@windriver.com>
References: <1385019198-24458-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [master][dora][PATCH 1/2] perf: disallow debug optimization.
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
X-List-Received-Date: Thu, 21 Nov 2013 07:33:27 -0000
Content-Type: text/plain

From: Randy MacLeod <Randy.MacLeod@windriver.com>

perf fails to compile if someone tries to compile an entire image as -O0
so in this case, force to use -O2 and give a note about it.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 269069f..138595d 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -60,6 +60,17 @@ B = "${WORKDIR}/${BPN}-${PV}"
 SCRIPTING_DEFINES = "${@perf_feature_enabled('perf-scripting', '', 'NO_LIBPERL=1 NO_LIBPYTHON=1',d)}"
 TUI_DEFINES = "${@perf_feature_enabled('perf-tui', '', 'NO_NEWT=1',d)}"
 
+# perf can't be built without optimization, if someone tries to compile an
+# entire image as -O0, we override it with -O2 here and give a note about it.
+def get_optimization(d):
+    selected_optimization = d.getVar("SELECTED_OPTIMIZATION", True)
+    if base_contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) == "x":
+        bb.note("eglibc can't be built with -O0, -O2 will be used instead.")
+        return selected_optimization.replace("-O0", "-O2")
+    return selected_optimization
+
+SELECTED_OPTIMIZATION := "${@get_optimization(d)}"
+
 # The LDFLAGS is required or some old kernels fails due missing
 # symbols and this is preferred than requiring patches to every old
 # supported kernel.
-- 
1.8.1.2.545.g2f19ada


