Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5C10760049
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 08:17:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v9I8HQPC015644
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 01:17:26 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 18 Oct 2017 01:17:25 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Oct 2017 16:02:05 +0800
Message-ID: <20171018080205.9834-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20171018080205.9834-1-kai.kang@windriver.com>
References: <20171018080205.9834-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] toolchain-scripts.bbclass: do not extend dependency if extended already
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
X-List-Received-Date: Wed, 18 Oct 2017 08:17:25 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When set MULTILIBS with two or more items, such as for mips64:

MULTILIBS ?= "multilib:lib32 multilib:libn32"

It extends dependency package name once in multilib.bbclass, and expand again
in toolchain-scripts.bbclass which causes error:

| ERROR: Nothing PROVIDES 'virtual/lib32-libn32-libc'. Close matches:
|   virtual/libn32-libc
|   virtual/lib32-libc
|   virtual/libn32-librpc
| ERROR: Required build target 'libn32-meta-ide-support' has no buildable providers.
| Missing or unbuildable dependency chain was: ['libn32-meta-ide-support', 'virtual/lib32-libn32-libc']

Don't extend package name if it has been extended already.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/toolchain-scripts.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 9bcfe708c7..4e4334abbb 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -150,11 +150,17 @@ toolchain_create_sdk_siteconfig () {
 toolchain_create_sdk_siteconfig[vardepsexclude] = "TOOLCHAIN_CONFIGSITE_SYSROOTCACHE"
 
 python __anonymous () {
+    import re
     import oe.classextend
     deps = ""
     for dep in (d.getVar('TOOLCHAIN_NEED_CONFIGSITE_CACHE') or "").split():
         deps += " %s:do_populate_sysroot" % dep
-        for variant in (d.getVar('MULTILIB_VARIANTS') or "").split():
+        ml_variants = (d.getVar('MULTILIB_VARIANTS') or "").split()
+        for variant in ml_variants:
+            # don't extend if dep has been extended already
+            if filter(lambda x: re.match('(virtual/)?' + x, dep), ml_variants):
+                continue
+
             clsextend = oe.classextend.ClassExtender(variant, d)
             newdep = clsextend.extend_name(dep)
             deps += " %s:do_populate_sysroot" % newdep
-- 
2.14.1


