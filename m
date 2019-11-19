Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 82B2D7F879
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 03:15:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xAJ3FN20020472
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 19:15:23 -0800 (PST)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Mon, 18 Nov 2019 19:15:16 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Nov 2019 11:15:14 +0800
Message-ID: <20191119031514.10105-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] multilib.bbclass: fix qa warning of kernel-devicetree
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
X-List-Received-Date: Tue, 19 Nov 2019 03:15:22 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When kernel-devicetree is in RRECOMMENDS such as via variable
MACHINE_EXTRA_RRECOMMENDS for some bsp, it shows QA warning of multilib:

| WARNING: lib32-packagegroup-base-1.0-r83 do_package: QA Issue:
| lib32-packagegroup-base package lib32-packagegroup-machine-base
| - suspicious values 'kernel-devicetree' in RRECOMMENDS [multilib]

Add kernel-devicetree to exceptions to fix the QA issue. Because there
are already 3 kernel related criteria, simplify them by judging package
names whether start with 'kernel-'. And also refactor to remove
duplicate 'not'.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/multilib.bbclass | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 1a9295d36f..ee677da1e2 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -184,11 +184,12 @@ python do_package_qa_multilib() {
         for i in values:
             if i.startswith('virtual/'):
                 i = i[len('virtual/'):]
-            if (not i.startswith('kernel-module')) and (not i.startswith(mlprefix)) and \
-                (not 'cross-canadian' in i) and (not i.startswith("nativesdk-")) and \
-                (not i.startswith("rtld")) and (not i.startswith('kernel-vmlinux')) \
-                and (not i.startswith("kernel-image")) and (not i.startswith("/")):
+
+            if (not (i.startswith(mlprefix) or i.startswith("kernel-") \
+                    or ('cross-canadian' in i) or i.startswith("nativesdk-") \
+                    or i.startswith("rtld") or i.startswith("/"))):
                 candidates.append(i)
+
         if len(candidates) > 0:
             msg = "%s package %s - suspicious values '%s' in %s" \
                    % (d.getVar('PN'), pkg, ' '.join(candidates), var)
-- 
2.17.1


