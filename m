Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QjYHE-00012k-Ur
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 17:01:33 +0200
Received: by wyg30 with SMTP id 30so249197wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 07:57:26 -0700 (PDT)
Received: by 10.216.164.200 with SMTP id c50mr2918244wel.107.1311173846468;
	Wed, 20 Jul 2011 07:57:26 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id m46sm227912weq.5.2011.07.20.07.57.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jul 2011 07:57:25 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 16:57:18 +0200
Message-Id: <1311173838-12349-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Phil Blundell <philb@gnu.org>, Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] insane: improve diagnostic for redundant rpath
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jul 2011 15:01:33 -0000

From: Phil Blundell <philb@gnu.org>

Make it more obvious which file, and which recipe, are at issue.

Signed-off-by: Phil Blundell <philb@gnu.org>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/insane.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index c45f2cb..65eda9e 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -142,7 +142,7 @@ def package_qa_check_rpath(file,name, d, elf, messages):
                 messages.append("package %s contains bad RPATH %s in file %s" % (name, line, file))
 
 QAPATHTEST[useless-rpaths] = "package_qa_check_useless_rpaths"
-def package_qa_check_useless_rpaths(file,name, d, elf, messages):
+def package_qa_check_useless_rpaths(file, name, d, elf, messages):
     """
     Check for RPATHs that are useless but not dangerous
     """
@@ -164,7 +164,7 @@ def package_qa_check_useless_rpaths(file,name, d, elf, messages):
 	   if rpath == libdir or rpath == base_libdir:
 	      # The dynamic linker searches both these places anyway.  There is no point in
 	      # looking there again.
-	      messages.append("dynamic section contains probably-redundant RPATH %s" % rpath)
+	      messages.append("%s: %s contains probably-redundant RPATH %s" % (name, package_qa_clean_path(file, d), rpath))
 
 QAPATHTEST[dev-so] = "package_qa_check_dev"
 def package_qa_check_dev(path, name, d, elf, messages):
-- 
1.6.6.1



