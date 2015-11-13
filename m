Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 615B977283
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 09:34:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAD9YJFD021153
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 01:34:19 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Fri, 13 Nov 2015 01:34:18 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Nov 2015 17:24:05 +0800
Message-ID: <5885b8399573ccaa5fa45cec84d696ceaf999ee6.1447406020.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <cover.1447406020.git.kai.kang@windriver.com>
References: <cover.1447406020.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] toolchain-scripts.bbclass: do not expand vars which starts with multilib prefixes
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
X-List-Received-Date: Fri, 13 Nov 2015 09:34:21 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When set MULTILIBS with two or more items, such as

MULTILIBS = "multilib:lib32 multilib:lib64"

It expands depends once in mutlib.bbclass, and expand again in
toolchain-scripts.bbclass that causes error:

| ERROR: Nothing PROVIDES 'virtual/lib32-lib64-libc'.

Check before expand a var. If starts with a multilib prefix, ignore it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/toolchain-scripts.bbclass | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index d0b2b91..3878a42 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -146,7 +146,17 @@ python __anonymous () {
     deps = ""
     for dep in (d.getVar('TOOLCHAIN_NEED_CONFIGSITE_CACHE', True) or "").split():
         deps += " %s:do_populate_sysroot" % dep
-        for variant in (d.getVar('MULTILIB_VARIANTS', True) or "").split():
+
+        ml_variants = (d.getVar('MULTILIB_VARIANTS', True) or "").split()
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
2.6.1


