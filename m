Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9E98E731EB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 08:34:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0K8YRvP017611
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 00:34:28 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 20 Jan 2016 00:34:27 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Jan 2016 00:34:24 -0800
Message-ID: <ad9275c62cbf5f3f95a43d3e208bc05874a4c3a3.1453278829.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1453278829.git.liezhi.yang@windriver.com>
References: <cover.1453278829.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] insane.bbclass: fix package_qa_walk()
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
X-List-Received-Date: Wed, 20 Jan 2016 08:34:27 -0000
Content-Type: text/plain

The parameter "path" would be redefined inside package_qa_walk() which
is useless,  so remove it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/insane.bbclass |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index ec17a48..c3dfa76 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -763,7 +763,7 @@ def package_qa_check_staged(path,d):
     return sane
 
 # Walk over all files in a directory and call func
-def package_qa_walk(path, warnfuncs, errorfuncs, skip, package, d):
+def package_qa_walk(warnfuncs, errorfuncs, skip, package, d):
     import oe.qa
 
     #if this will throw an exception, then fix the dict above
@@ -1088,7 +1088,7 @@ python do_package_qa () {
                     "%s doesn't match the [a-z0-9.+-]+ regex" % package, d)
 
         path = "%s/%s" % (pkgdest, package)
-        package_qa_walk(path, warnchecks, errorchecks, skip, package, d)
+        package_qa_walk(warnchecks, errorchecks, skip, package, d)
 
         package_qa_check_rdepends(package, pkgdest, skip, taskdeps, packages, d)
         package_qa_check_deps(package, pkgdest, skip, d)
-- 
1.7.9.5


