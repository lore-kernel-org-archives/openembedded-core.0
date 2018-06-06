Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 18C4678520
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 02:46:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w562kpdL013538
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jun 2018 19:46:51 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Tue, 5 Jun 2018 19:46:50 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jun 2018 10:54:43 +0800
Message-ID: <90a52678a30fa0d4cc459222cde84978428c59e8.1528252931.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1528252931.git.liezhi.yang@windriver.com>
References: <cover.1528252931.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 08/11] toolchain-scripts.bbclass: do not extend dependency if extended already
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
X-List-Received-Date: Wed, 06 Jun 2018 02:46:50 -0000
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
index 71da5e5..848bff4 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -170,7 +170,18 @@ python __anonymous () {
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


