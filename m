Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 467A07830F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 21:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id A684E1844C;
	Tue, 29 Aug 2017 23:21:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id b9iljbVwNOk2; Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id B391D1843C;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 98BA41E099;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D3C71E094;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 8172F2144;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v7TLLfDS030204;
	Tue, 29 Aug 2017 23:21:41 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v7TLLfLd030203;
	Tue, 29 Aug 2017 23:21:41 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 29 Aug 2017 23:21:02 +0200
Message-Id: <b8ed706d7079bfda3b9dcc5849ea67016204bc73.1504041417.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1504041416.git.pkj@axis.com>
References: <cover.1504041416.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [pyro][PATCH 06/25] insane.bbclass: Improve the handling of runtime file dependencies
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
X-List-Received-Date: Tue, 29 Aug 2017 21:21:44 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

This makes the file-rdeps test support:
* versioned dependencies, e.g., "perl (>= 5.000)", and
* package dependencies among the file dependencies, e.g., "perl".

It also ignores all "perl(...)" dependencies since it is expected that
these are generated and handled by rpm itself and there is no reason
to second guess what it is doing.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/insane.bbclass | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 258856266e..fa932ef576 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -912,8 +912,9 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
             rdep_data = oe.packagedata.read_subpkgdata(pkg, d)
             for key in rdep_data:
                 if key.startswith("FILERDEPENDS_"):
-                    for subkey in rdep_data[key].split():
-                        if subkey not in ignored_file_rdeps:
+                    for subkey in bb.utils.explode_deps(rdep_data[key]):
+                        if subkey not in ignored_file_rdeps and \
+                                not subkey.startswith('perl('):
                             # We already know it starts with FILERDEPENDS_
                             filerdepends[subkey] = key[13:]
 
@@ -928,11 +929,10 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
                         sub_rdeps = rdep_data.get("RDEPENDS_" + rdep)
                         if not sub_rdeps:
                             continue
-                        for sub_rdep in sub_rdeps.split():
+                        for sub_rdep in bb.utils.explode_deps(sub_rdeps):
                             if sub_rdep in done:
                                 continue
-                            if not sub_rdep.startswith('(') and \
-                                    oe.packagedata.has_subpkgdata(sub_rdep, d):
+                            if oe.packagedata.has_subpkgdata(sub_rdep, d):
                                 # It's a new rdep
                                 done.append(sub_rdep)
                                 new.append(sub_rdep)
@@ -950,11 +950,15 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
                         filerdepends.pop("/usr/bin/python",None)
                         done.remove(py)
                 for rdep in done:
+                    # The file dependencies may contain package names, e.g.,
+                    # perl
+                    filerdepends.pop(rdep,None)
+
                     # For Saving the FILERPROVIDES, RPROVIDES and FILES_INFO
                     rdep_data = oe.packagedata.read_subpkgdata(rdep, d)
                     for key in rdep_data:
                         if key.startswith("FILERPROVIDES_") or key.startswith("RPROVIDES_"):
-                            for subkey in rdep_data[key].split():
+                            for subkey in bb.utils.explode_deps(rdep_data[key]):
                                 filerdepends.pop(subkey,None)
                         # Add the files list to the rprovides
                         if key == "FILES_INFO":
-- 
2.12.0


