Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 26601799B4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 09:28:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8T9SB5W019348
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 02:28:21 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Sat, 29 Sep 2018 02:27:59 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2018 17:27:51 +0800
Message-ID: <1538213271-19076-2-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1538213271-19076-1-git-send-email-changqing.li@windriver.com>
References: <1538213271-19076-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] multilib.bbclass: fix do_package_qa_multilib error
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
X-List-Received-Date: Sat, 29 Sep 2018 09:28:30 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

lib32-packagegroup-anaconda-support have RDEPENDS to kernel-image,
but kernel-image don't have lib32, so skip it.

ERROR: QA Issue: lib32-packagegroup-anaconda-support package
lib32-packagegroup-anaconda-support - suspicious values 'kernel-image'
in RDEPENDS [multilib]

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/classes/multilib.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index e7b717e..db39e02 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -135,7 +135,8 @@ python do_package_qa_multilib() {
                 i = i[len('virtual/'):]
             if (not i.startswith('kernel-module')) and (not i.startswith(mlprefix)) and \
                 (not 'cross-canadian' in i) and (not i.startswith("nativesdk-")) and \
-                (not i.startswith("rtld")) and (not i.startswith('kernel-vmlinux')):
+                (not i.startswith("rtld")) and (not i.startswith('kernel-vmlinux')) \
+                and (not i.startswith("kernel-image")):
                 candidates.append(i)
         if len(candidates) > 0:
             msg = "%s package %s - suspicious values '%s' in %s" \
-- 
2.7.4


