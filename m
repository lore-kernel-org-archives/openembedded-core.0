Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B59B57849D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 16:00:03 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v81G02d5029681
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 1 Sep 2017 17:00:03 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dnoMU-0002LB-Tj; Fri, 01 Sep 2017 17:00:02 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Sep 2017 17:00:01 +0100
Message-Id: <1504281601-8951-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1504281601-8951-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1504281601-8951-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 01 Sep 2017 17:00:04 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 2/2] package_manager: Clean up horrible 'None' return values
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
X-List-Received-Date: Fri, 01 Sep 2017 16:00:05 -0000

If this fails the exception will now be raised. Lets use that and drop
all this 'None' return value ugliness.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/package_manager.py | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 5efb286..994e462 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -17,18 +17,11 @@ from oe.gpg_sign import get_signer
 def create_index(arg):
     index_cmd = arg
 
-    try:
-        bb.note("Executing '%s' ..." % index_cmd)
-        result = subprocess.check_output(index_cmd, stderr=subprocess.STDOUT, shell=True).decode("utf-8")
-    except subprocess.CalledProcessError as e:
-        return("Index creation command '%s' failed with return code %d:\n%s" %
-               (e.cmd, e.returncode, e.output.decode("utf-8")))
-
+    bb.note("Executing '%s' ..." % index_cmd)
+    result = subprocess.check_output(index_cmd, stderr=subprocess.STDOUT, shell=True).decode("utf-8")
     if result:
         bb.note(result)
 
-    return None
-
 """
 This method parse the output from the package managerand return
 a dictionary with the information of the packages. This is used
@@ -164,9 +157,7 @@ class OpkgIndexer(Indexer):
             bb.note("There are no packages in %s!" % self.deploy_dir)
             return
 
-        result = oe.utils.multiprocess_exec(index_cmds, create_index)
-        if result:
-            bb.fatal('%s' % ('\n'.join(result)))
+        oe.utils.multiprocess_exec(index_cmds, create_index)
 
         if signer:
             feed_sig_type = self.d.getVar('PACKAGE_FEED_GPG_SIGNATURE_TYPE')
@@ -247,9 +238,7 @@ class DpkgIndexer(Indexer):
             bb.note("There are no packages in %s" % self.deploy_dir)
             return
 
-        result = oe.utils.multiprocess_exec(index_cmds, create_index)
-        if result:
-            bb.fatal('%s' % ('\n'.join(result)))
+        oe.utils.multiprocess_exec(index_cmds, create_index)
         if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
             raise NotImplementedError('Package feed signing not implementd for dpkg')
 
-- 
2.7.4


