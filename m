Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 0F5E577316
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 3CAFE2E3BD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:27:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id MJhhjxdGKmsN
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:26:59 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 8417E2E315
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:26:59 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 733B31E072
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:26:59 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 687CE1E070
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:26:59 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:26:59 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 5CB43233
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:26:59 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v2B5Qxtu018557
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 06:26:59 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v2B5Qxnq018556
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Mar 2017 06:26:59 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 11 Mar 2017 06:26:54 +0100
Message-Id: <20170311052654.18076-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH] toaster.bbclass: Correct parsing of installed-package-sizes.txt
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
X-List-Received-Date: Sat, 11 Mar 2017 05:26:59 -0000

The recent change in buildhistory.bbclass to use a tab in
installed-package-sizes.txt between "KiB" and the package name caused
toaster_buildhistory_dump() to fail since it parses the file and
expected a space there.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/toaster.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index a68557882c..4de380bce2 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -265,8 +265,7 @@ python toaster_buildhistory_dump() {
             with open("%s/installed-package-sizes.txt" % installed_img_path, "r") as fin:
                 for line in fin:
                     line = line.rstrip(";")
-                    psize, px = line.split("\t")
-                    punit, pname = px.split(" ")
+                    psize, punit, pname = line.split()
                     # this size is "installed-size" as it measures how much space it takes on disk
                     images[target][pname.strip()] = {'size':int(psize)*1024, 'depends' : []}
 
-- 
2.12.0


