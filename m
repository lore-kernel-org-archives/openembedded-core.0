Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 573287142E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 15:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8CFdnxc024655 for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 16:39:49 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uE-BWynzUMnA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 16:39:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8CFdlal024641
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 16:39:48 +0100
Message-ID: <1410536389.14624.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Sep 2014 16:39:49 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] license: Improve disk usage
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
X-List-Received-Date: Fri, 12 Sep 2014 15:39:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently copies of the license files are made which wastes disk space
and adversely affects performance. We can link these instead in most
cases for small performance gains.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 601f561..a34ea39 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -145,7 +145,14 @@ def copy_license_files(lic_files_paths, destdir):
     bb.utils.mkdirhier(destdir)
     for (basename, path) in lic_files_paths:
         try:
-            ret = shutil.copyfile(path, os.path.join(destdir, basename))
+            src = path
+            dst = os.path.join(destdir, basename)
+            if os.path.exists(dst):
+                os.remove(dst)
+            if (os.stat(src).st_dev == os.stat(destdir).st_dev):
+                os.link(src, dst)
+            else:
+                shutil.copyfile(src, dst)
         except Exception as e:
             bb.warn("Could not copy license file %s: %s" % (basename, e))
 



