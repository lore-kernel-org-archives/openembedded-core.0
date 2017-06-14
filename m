Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DBA3178380
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 13:42:39 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5EDgbYF004024
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 14 Jun 2017 14:42:38 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dL8ZB-000843-Ss; Wed, 14 Jun 2017 14:42:37 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jun 2017 14:42:37 +0100
Message-Id: <1497447757-30951-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1497447757-30951-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1497447757-30951-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Wed, 14 Jun 2017 14:42:39 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 3/3] package_ipk: Parallelise ipk creation
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
X-List-Received-Date: Wed, 14 Jun 2017 13:42:40 -0000

Allow the creation of ipks to happen in parallel, making best use of resources
on multiprocessor systems.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package_ipk.bbclass | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index d2ce3b3..282d212 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -17,6 +17,8 @@ OPKG_ARGS += "${@['', '--add-exclude ' + ' --add-exclude '.join((d.getVar('PACKA
 OPKGLIBDIR = "${localstatedir}/lib"
 
 python do_package_ipk () {
+    from multiprocessing import Process
+
     oldcwd = os.getcwd()
 
     workdir = d.getVar('WORKDIR')
@@ -37,11 +39,24 @@ python do_package_ipk () {
     if os.access(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN"), os.R_OK):
         os.unlink(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN"))
 
-    for pkg in packages.split():
-        ipk_write_pkg(pkg, d)
+    max_process = int(d.getVar("BB_NUMBER_THREADS") or os.cpu_count() or 1)
+    launched = []
+    pkgs = packages.split()
+    while pkgs:
+        if len(launched) < max_process:
+            p = Process(target=ipk_write_pkg, args=(pkgs.pop(), d))
+            p.start()
+            launched.append(p)
+        for q in launched:
+            # The finished processes are joined when calling is_alive()
+            if not q.is_alive():
+                launched.remove(q)
+    for p in launched:
+        p.join()
 
     os.chdir(oldcwd)
 }
+do_package_ipk[vardepsexclude] = "BB_NUMBER_THREADS"
 
 def ipk_write_pkg(pkg, d):
     import re, copy
-- 
2.7.4


