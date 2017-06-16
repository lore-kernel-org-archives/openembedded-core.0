Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AC2CA78263
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 08:46:22 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5G8kLWe023541
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 16 Jun 2017 09:46:22 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dLmtZ-0000Sr-BB; Fri, 16 Jun 2017 09:46:21 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 09:46:20 +0100
Message-Id: <1497602780-1744-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 16 Jun 2017 09:46:22 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH] package_ipk: Clean up Source entry in ipk packages
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
X-List-Received-Date: Fri, 16 Jun 2017 08:46:23 -0000

There is the potential for sensitive information to leak through the urls
there and removing it brings this into the behavior of the other package
backends since filtering it is likely error prone.

Since ipks don't appear to be generated at all if we don't set this, set
the field to the recipe name used (basename only, no paths). This avoids
information leaking. We may want to drop the field if opkg can allow that
at a future point but the recipe name is a suitable identifier for now.

Reported-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package_ipk.bbclass | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index d2ce3b3..8e69b5d 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -57,6 +57,7 @@ def ipk_write_pkg(pkg, d):
 
     outdir = d.getVar('PKGWRITEDIRIPK')
     pkgdest = d.getVar('PKGDEST')
+    recipesource = os.path.basename(d.getVar('FILE'))
 
     localdata = bb.data.createCopy(d)
     root = "%s/%s" % (pkgdest, pkg)
@@ -205,10 +206,7 @@ def ipk_write_pkg(pkg, d):
             ctrlfile.write("Replaces: %s\n" % bb.utils.join_deps(rreplaces))
         if rconflicts:
             ctrlfile.write("Conflicts: %s\n" % bb.utils.join_deps(rconflicts))
-        src_uri = localdata.getVar("SRC_URI").strip() or "None"
-        if src_uri:
-            src_uri = re.sub("\s+", " ", src_uri)
-            ctrlfile.write("Source: %s\n" % " ".join(src_uri.split()))
+        ctrlfile.write("Source: %s\n" % recipesource)
         ctrlfile.close()
 
         for script in ["preinst", "postinst", "prerm", "postrm"]:
-- 
2.7.4


