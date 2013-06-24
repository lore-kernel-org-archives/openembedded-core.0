Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 47D956AA78
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 14:34:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5OEYbOi002985
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 07:34:37 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 24 Jun 2013 07:34:37 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Jun 2013 09:44:56 -0500
Message-ID: <1372085096-30468-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH] systemtap: Systemtap can not be build w -O0 optimization
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
X-List-Received-Date: Mon, 24 Jun 2013 14:34:36 -0000
Content-Type: text/plain

Systemtap will fail with:

../usr/include/features.h:330:4: error: #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]
|  #  warning _FORTIFY_SOURCE requires compiling with optimization (-O)

Use the same technique that eglibc uses to catch and correct the optimization
level, changing to -O2.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.inc | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index edaab97..7be6c2b 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -19,3 +19,14 @@ COMPATIBLE_HOST = '(x86_64.*|i.86.*|powerpc.*|arm.*)-linux'
 
 S = "${WORKDIR}/git"
 
+# systemtap can't be built without optimization, if someone tries to compile an
+# entire image as -O0, we override it with -O2 here and give a note about it.
+def get_optimization(d):
+    selected_optimization = d.getVar("SELECTED_OPTIMIZATION", True)
+    if base_contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) == "x":
+        bb.note("systemtap can't be built with -O0, -O2 will be used instead.")
+        return selected_optimization.replace("-O0", "-O2")
+    return selected_optimization
+
+SELECTED_OPTIMIZATION := "${@get_optimization(d)}"
+
-- 
1.8.3.1


