Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 38CC36FF91
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 17:36:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0THaEtF012123
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 29 Jan 2016 09:36:14 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 29 Jan 2016 09:36:13 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<raj.khem@gmail.com>, <richard.purdie@linuxfoundation.org>
Date: Fri, 29 Jan 2016 12:35:58 -0500
Message-ID: <f1cc1779d3eccf110ed01923fd92264a16008a36.1454088695.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1454088695.git.hongxu.jia@windriver.com>
References: <cover.1454088695.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] systemtap_git.inc: do not immediate expand SELECTED_OPTIMIZATION
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
X-List-Received-Date: Fri, 29 Jan 2016 17:36:16 -0000
Content-Type: text/plain

We need to expand SELECTED_OPTIMIZATION later, so
do not immediate expansion, and do the work in
anonymous python function.

It is reasonable to give an error for -O0.

[YOCTO #7058]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.inc | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 7f9ae0b..656f15f 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -17,12 +17,8 @@ COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64).*-linux'
 S = "${WORKDIR}/git"
 
 # systemtap can't be built without optimization, if someone tries to compile an
-# entire image as -O0, we override it with -O2 here and give a note about it.
-def get_optimization(d):
-    selected_optimization = d.getVar("SELECTED_OPTIMIZATION", True)
+# entire image as -O0, break with fatal.
+python () {
     if bb.utils.contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) == "x":
-        bb.note("systemtap can't be built with -O0, -O2 will be used instead.")
-        return selected_optimization.replace("-O0", "-O2")
-    return selected_optimization
-
-SELECTED_OPTIMIZATION := "${@get_optimization(d)}"
+        bb.fatal("systemtap can't be built with -O0, using -O1 -Wno-error or -O1 instead.")
+}
-- 
1.9.1


