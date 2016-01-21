Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 600986072C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 07:57:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0L7vWRP015399
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 23:57:32 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 20 Jan 2016 23:57:31 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Jan 2016 23:57:30 -0800
Message-ID: <117469737dcfe825742e15b41b95d4fee859db70.1453363017.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1453363017.git.liezhi.yang@windriver.com>
References: <cover.1453363017.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] insane.bbclass: print more info for build-deps and file-rdeps
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
X-List-Received-Date: Thu, 21 Jan 2016 07:57:32 -0000
Content-Type: text/plain

This is useful for oe newbie:
* build-deps: print recipe name, and suggest fixing from DEPENDS or
  PACKAGECONFIG, for example:
  WARNING: QA Issue: patch rdepends on libattr, but it isn't a build dependency, missing attr in DEPENDS or PACKAGECONFIG? [build-deps]

* file-rdeps: print RDEPENDS_pkg rather than RDEPENDS, for example:
  WARNING: QA Issue: /sbin/osd_login contained in package nfs-utils requires /bin/bash, but no providers found in RDEPENDS_nfs-utils? [file-rdeps]

Fix a bug in file-rdeps, there was "@underscore@" in file-rdeps:
WARNING: QA Issue: /sbin/osd@underscore@login_nfs-utils contained in [snip]

[YOCTO #8922]
[YOCTO #8847]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/insane.bbclass |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index f7781ce..129e9dd 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -821,7 +821,10 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
                                 break
                     if rdep_data and 'PN' in rdep_data and rdep_data['PN'] in taskdeps:
                         continue
-                    error_msg = "%s rdepends on %s, but it isn't a build dependency?" % (pkg, rdepend)
+                    if rdep_data and 'PN' in rdep_data:
+                        error_msg = "%s rdepends on %s, but it isn't a build dependency, missing %s in DEPENDS or PACKAGECONFIG?" % (pkg, rdepend, rdep_data['PN'])
+                    else:
+                        error_msg = "%s rdepends on %s, but it isn't a build dependency?" % (pkg, rdepend)
                     package_qa_handle_error("build-deps", error_msg, d)
 
         if "file-rdeps" not in skip:
@@ -887,8 +890,8 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
                         break
             if filerdepends:
                 for key in filerdepends:
-                    error_msg = "%s contained in package %s requires %s, but no providers found in its RDEPENDS" % \
-                            (filerdepends[key],pkg, key)
+                    error_msg = "%s contained in package %s requires %s, but no providers found in RDEPENDS_%s?" % \
+                            (filerdepends[key].replace("_%s" % pkg, "").replace("@underscore@", "_"), pkg, key, pkg)
                 package_qa_handle_error("file-rdeps", error_msg, d)
 
 def package_qa_check_deps(pkg, pkgdest, skip, d):
-- 
1.7.9.5


