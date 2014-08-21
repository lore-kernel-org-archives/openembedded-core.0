Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E77CA70EF2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 20:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7LKlStn021704 for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 21:47:52 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id wl_Y7dfQVI5A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 21:47:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7LKln4N021735
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 21:47:50 +0100
Message-ID: <1408654070.1669.119.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Aug 2014 21:47:50 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] package.bbclass: Fixup for using common function
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
X-List-Received-Date: Thu, 21 Aug 2014 20:47:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We may as well use the common function for this rather than
duplicating the code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 23832b1..0ff5370 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -931,13 +931,7 @@ python split_and_strip_files () {
         for f in kernmods:
             sfiles.append((f, 16, strip))
 
-
-        import multiprocessing
-        nproc = multiprocessing.cpu_count()
-        pool = bb.utils.multiprocessingpool(nproc)
-        processed = list(pool.imap(oe.package.runstrip, sfiles))
-        pool.close()
-        pool.join()
+        oe.utils.multiprocess_exec(sfiles, oe.package.runstrip)
 
     #
     # End of strip
@@ -1314,12 +1308,7 @@ python package_do_filedeps() {
         for files in chunks(pkgfiles[pkg], 100):
             pkglist.append((pkg, files, rpmdeps, pkgdest))
 
-    import multiprocessing
-    nproc = multiprocessing.cpu_count()
-    pool =  bb.utils.multiprocessingpool(nproc)
-    processed = list(pool.imap(oe.package.filedeprunner, pkglist))
-    pool.close()
-    pool.join()
+    processed = oe.utils.multiprocess_exec( pkglist, oe.package.filedeprunner)
 
     provides_files = {}
     requires_files = {}



