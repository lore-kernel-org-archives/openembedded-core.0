Return-Path: <andrej.valek@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 09844781E2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 13:44:13 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v5FDiDbu003686
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:44:13 +0200
Received: from dev.sbt.siemens.com ([163.242.56.100])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id v5FDiDn5016527;
	Thu, 15 Jun 2017 15:44:13 +0200
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id 2FD8F42EB;
	Thu, 15 Jun 2017 15:44:13 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jun 2017 15:43:44 +0200
Message-Id: <1497534224-21937-1-git-send-email-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [yocto-security][PATCH] package_ipk: Remove Source entry from ipk packages
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
X-List-Received-Date: Thu, 15 Jun 2017 13:44:14 -0000

There is the potential for sensitive information to leak through the urls
there and removing it brings this into the behavior of the other package
backends since filtering it is likely error prone.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/classes/package_ipk.bbclass | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index d2ce3b3..2a291b0 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -205,10 +205,6 @@ def ipk_write_pkg(pkg, d):
             ctrlfile.write("Replaces: %s\n" % bb.utils.join_deps(rreplaces))
         if rconflicts:
             ctrlfile.write("Conflicts: %s\n" % bb.utils.join_deps(rconflicts))
-        src_uri = localdata.getVar("SRC_URI").strip() or "None"
-        if src_uri:
-            src_uri = re.sub("\s+", " ", src_uri)
-            ctrlfile.write("Source: %s\n" % " ".join(src_uri.split()))
         ctrlfile.close()
 
         for script in ["preinst", "postinst", "prerm", "postrm"]:
-- 
2.1.4


