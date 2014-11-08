Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DA09F7206B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Nov 2014 11:19:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sA8BJXj5025551
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 8 Nov 2014 03:19:33 -0800 (PST)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sat, 8 Nov 2014 03:19:33 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 8 Nov 2014 06:19:32 -0500
Message-ID: <1415445572-25489-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [PATCH] classextend: Do not extend for that already have multilib prefix
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
X-List-Received-Date: Sat, 08 Nov 2014 11:19:41 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

If a BSP supports two or more multilibs, for example:

    MULTILIBS = "multilib:lib32 multilib:lib64"

and a variable is already extended to include multilib variants,
for example in populate_sdk_base:

    commit 396371588c7fd2d691ca9c39cd02287e43cb665b
    Author: Richard Purdie <richard.purdie@linuxfoundation.org>
    Date: Thu Jul 24 22:09:09 2014 +0100

    populate_sdk_base: Extend TOOLCHAIN_TARGET_TASK to include multilib variants

    Most people expect the toolchain from a multilib build to contain multilib
    components. This change makes that happen and is easy for users to override
    should they want something different.

    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

The mapping clsextend.map_depends_variable("TOOLCHAIN_TARGET_TASK")
ends up with a wrong double extended package name like:

    lib32-lib64-packagegroup-core-standalone-sdk-target

This patch avoid such issues.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/lib/oe/classextend.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py
index 68efca3..5c993de 100644
--- a/meta/lib/oe/classextend.py
+++ b/meta/lib/oe/classextend.py
@@ -57,6 +57,13 @@ class ClassExtender(object):
         if dep.endswith(("-native", "-native-runtime")) or ('nativesdk-' in dep) or ('cross-canadian' in dep) or ('-crosssdk-' in dep):
             return dep
         else:
+            # Do not extend for that already have multilib prefix
+            var = self.d.getVar("MULTILIB_VARIANTS", True) or ""
+            if var:
+                var = var.split()
+                for v in var:
+                    if dep.startswith(v):
+                        return dep
             return self.extend_name(dep)
 
     def map_depends_variable(self, varname, suffix = ""):
-- 
2.0.0


