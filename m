Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1EA4A787B5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2018 02:26:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6D2QPwB025489
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 19:26:25 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Thu, 12 Jul 2018 19:26:24 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Jul 2018 10:36:23 +0800
Message-ID: <b63af566e440719ccf8deb58dd684a1c2f3269ef.1531449293.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1531449293.git.liezhi.yang@windriver.com>
References: <cover.1531449293.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V4 3/4] toolchain-scripts.bbclass: do not extend dependency if extended already
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
X-List-Received-Date: Fri, 13 Jul 2018 02:26:24 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When set MULTILIBS with two or more items, such as for mips64:

MULTILIBS ?= "multilib:lib32 multilib:libn32"

It expands dependency once in mutlib.bbclass, and expand again in
toolchain-scripts.bbclass which causes error:

| ERROR: Nothing PROVIDES 'virtual/lib32-libn32-libc'. Close matches:
|   virtual/libn32-libc
|   virtual/lib32-libc
|   virtual/libn32-librpc
| ERROR: Required build target 'libn32-meta-ide-support' has no buildable providers.
| Missing or unbuildable dependency chain was: ['libn32-meta-ide-support', 'virtual/lib32-libn32-libc']

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/toolchain-scripts.bbclass | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 0ff5301..926be8b 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -190,7 +190,18 @@ python __anonymous () {
     deps = ""
     for dep in (d.getVar('TOOLCHAIN_NEED_CONFIGSITE_CACHE') or "").split():
         deps += " %s:do_populate_sysroot" % dep
-        for variant in (d.getVar('MULTILIB_VARIANTS') or "").split():
+        ml_variants = (d.getVar('MULTILIB_VARIANTS') or "").split()
+
+        # don't extend if dep has been extended already
+        extended = False
+        for variant in ml_variants:
+            if dep.startswith(variant) or dep.startswith('virtual/' + variant):
+                extended = True
+                break
+        if extended:
+            continue
+
+        for variant in ml_variants:
             clsextend = oe.classextend.ClassExtender(variant, d)
             newdep = clsextend.extend_name(dep)
             deps += " %s:do_populate_sysroot" % newdep
-- 
2.7.4


