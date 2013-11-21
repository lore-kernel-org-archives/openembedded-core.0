Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 98B286D9AD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 06:54:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAL6s3Yg021810
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 22:54:03 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 20 Nov 2013 22:54:02 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 00:54:00 -0600
Message-ID: <1385016840-22027-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH] base.bbclass: Fix incorrect setting of multilib PREFERRED_PROVIDER_virtual_pkg
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
X-List-Received-Date: Thu, 21 Nov 2013 06:54:03 -0000
Content-Type: text/plain

From: Lei Liu <lei.liu2@windriver.com>

PREFERRED_PROVIDER_virtual_pkg has been incorrectly set with more
than one multilib prefixes.  For example, if we have two alternative
multilibs lib64 and lib32, PREFERRED_PROVIDER_virtual_pkg will be
set to lib32-lib64-pkg or lib64-lib32-pkg, depending on which
multilib shows up first in the list.

Signed-off-by: Lei Liu <lei.liu2@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/base.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index fc6abf9..dfd77b9 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -210,7 +210,7 @@ def preferred_ml_updates(d):
             virt = "virtual/"
         for p in prefixes:
             if pkg != "kernel":
-                val = p + "-" + val
+                newval = p + "-" + val
 
             # implement variable keys
             localdata = bb.data.createCopy(d)
@@ -219,12 +219,12 @@ def preferred_ml_updates(d):
             bb.data.update_data(localdata)
             newname = localdata.expand(prov)
             if newname != prov and not d.getVar(newname, False):
-                d.setVar(newname, localdata.expand(val))
+                d.setVar(newname, localdata.expand(newval))
 
             # implement alternative multilib name
             newname = localdata.expand("PREFERRED_PROVIDER_" + virt + p + "-" + pkg)
             if not d.getVar(newname, False):
-                d.setVar(newname, val)
+                d.setVar(newname, newval)
         # Avoid future variable key expansion
         provexp = d.expand(prov)
         if prov != provexp and d.getVar(prov, False):
-- 
1.8.1.2.545.g2f19ada


