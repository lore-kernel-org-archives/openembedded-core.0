Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C407A7F1E3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 05:50:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8G5oK6i022976
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Sep 2019 22:50:40 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Sun, 15 Sep 2019 22:50:24 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Sep 2019 13:50:23 +0800
Message-ID: <1568613023-302707-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] classextend.py: don't extend file for file dependency
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
X-List-Received-Date: Mon, 16 Sep 2019 05:50:51 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Fix error like:
lib32-e2fsprogs-1.45.3-r0 do_package_qa: QA Issue: /usr/sbin/e2scrub_all
contained in package lib32-e2fsprogs-e2scrub requires /bin/bash,
but no providers found in RDEPENDS_lib32-e2fsprogs-e2scrub

For some lib32 packages(eg: lib32-bash, lib32-sed) which probvides files,
extend is not needed

Eg: RPROVIDES of lib32-bash expects to have /bin/bash, with original
extend, it will become lib32-/bin/bash, then will cause above error

Fix by don't extend file dependency, and skip multilib check for file dependency
in do_package_qa to avoid error like:
WARNING: lib32-bash-5.0-r0 do_package: QA Issue: lib32-bash package lib32-bash
 - suspicious values '/bin/bash /bin/sh' in RPROVIDES [multilib]

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/classes/multilib.bbclass | 2 +-
 meta/lib/oe/classextend.py    | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index d625bd5..1a9295d 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -187,7 +187,7 @@ python do_package_qa_multilib() {
             if (not i.startswith('kernel-module')) and (not i.startswith(mlprefix)) and \
                 (not 'cross-canadian' in i) and (not i.startswith("nativesdk-")) and \
                 (not i.startswith("rtld")) and (not i.startswith('kernel-vmlinux')) \
-                and (not i.startswith("kernel-image")):
+                and (not i.startswith("kernel-image")) and (not i.startswith("/")):
                 candidates.append(i)
         if len(candidates) > 0:
             msg = "%s package %s - suspicious values '%s' in %s" \
diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py
index e25122e..f02fbe9 100644
--- a/meta/lib/oe/classextend.py
+++ b/meta/lib/oe/classextend.py
@@ -24,6 +24,8 @@ class ClassExtender(object):
             if not subs.startswith(self.extname):
                 return "virtual/" + self.extname + "-" + subs
             return name
+        if name.startswith("/"):
+            return name
         if not name.startswith(self.extname):
             return self.extname + "-" + name
         return name
-- 
2.7.4


