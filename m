Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4358378381
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 08:42:33 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5G8gV2g022965
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 16 Jun 2017 09:42:32 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dLmpr-0000Pc-Mt; Fri, 16 Jun 2017 09:42:31 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 09:42:30 +0100
Message-Id: <1497602550-1491-4-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1497602550-1491-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1497602550-1491-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 16 Jun 2017 09:42:32 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 4/4] package_ipk: Remove Source entry from ipk packages
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
X-List-Received-Date: Fri, 16 Jun 2017 08:42:34 -0000

There is the potential for sensitive information to leak through the urls
there and removing it brings this into the behavior of the other package
backends since filtering it is likely error prone.

Since ipks don't appear to be generated at all if we set this, set
the field to the recipe name used (basename only, no paths).

Reported-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package_ipk.bbclass | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 282d212..d58b824 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -56,6 +56,7 @@ python do_package_ipk () {
 
     os.chdir(oldcwd)
 }
+do_package_ipk[vardeps] += "ipk_write_pkg"
 do_package_ipk[vardepsexclude] = "BB_NUMBER_THREADS"
 
 def ipk_write_pkg(pkg, d):
@@ -72,6 +73,7 @@ def ipk_write_pkg(pkg, d):
 
     outdir = d.getVar('PKGWRITEDIRIPK')
     pkgdest = d.getVar('PKGDEST')
+    recipesource = os.path.basename(d.getVar('FILE'))
 
     localdata = bb.data.createCopy(d)
     root = "%s/%s" % (pkgdest, pkg)
@@ -220,10 +222,7 @@ def ipk_write_pkg(pkg, d):
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


