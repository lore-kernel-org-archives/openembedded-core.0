Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 173726FA88
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 11:41:14 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2QBf2lv012550; Wed, 26 Mar 2014 11:41:03 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id PACBsc9W_61d; Wed, 26 Mar 2014 11:41:02 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2QBevJs012535
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 26 Mar 2014 11:40:58 GMT
Message-ID: <1395834050.24890.87.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Mar 2014 11:40:50 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] package_manager: Fix apt-ftparchive index creation problems
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
X-List-Received-Date: Wed, 26 Mar 2014 11:41:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

a) There were missing parameters to the release and package commands (".")

b) The commands need to be executed as one block since they build upon each other

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 692528d..824af00 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -192,17 +192,16 @@ class DpkgIndexer(Indexer):
             if not os.path.isdir(arch_dir):
                 continue
 
-            index_cmds.append("cd %s; PSEUDO_UNLOAD=1 %s packages > Packages" %
-                              (arch_dir, apt_ftparchive))
+            cmd = "cd %s; PSEUDO_UNLOAD=1 %s packages . > Packages;" % (arch_dir, apt_ftparchive)
 
-            index_cmds.append("cd %s; %s Packages -c > Packages.gz" %
-                              (arch_dir, gzip))
+            cmd += "%s -fc Packages > Packages.gz;" % gzip
 
             with open(os.path.join(arch_dir, "Release"), "w+") as release:
-                release.write("Label: %s" % arch)
+                release.write("Label: %s\n" % arch)
 
-            index_cmds.append("cd %s; PSEUDO_UNLOAD=1 %s release >> Release" %
-                              (arch_dir, apt_ftparchive))
+            cmd += "PSEUDO_UNLOAD=1 %s release . >> Release" % apt_ftparchive
+            
+            index_cmds.append(cmd)
 
             deb_dirs_found = True
 



