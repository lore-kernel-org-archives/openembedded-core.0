Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TMIDE-0006AO-E5 for openembedded-core@lists.openembedded.org;
	Thu, 11 Oct 2012 14:50:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9BCasO3006576
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2012 13:36:54 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06281-03 for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2012 13:36:50 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9BCam0Z006570
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2012 13:36:48 +0100
Message-ID: <1349959013.14368.13.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Oct 2012 13:36:53 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: scripts/cp-noerror: Try and use hardlinks if possible
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Oct 2012 12:50:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Since we generally have lots of copies of the directories created using this tool, use
hardlinks where possible. This should save a little disk space and improve performance
slightly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/scripts/cp-noerror b/scripts/cp-noerror
index f0cd243..cde1b54 100755
--- a/scripts/cp-noerror
+++ b/scripts/cp-noerror
@@ -21,7 +21,13 @@ def copytree(src, dst, symlinks=False, ignore=None):
         srcname = os.path.join(src, name)
         dstname = os.path.join(dst, name)
         try:
-            shutil.copy2(srcname, dstname)
+            d = dstname
+            if os.path.isdir(dstname):
+                d = os.path.join(dstname, os.path.basename(srcname))
+            try:
+                os.link(srcname, dstname)
+            except OSError:
+                shutil.copy2(srcname, dstname)
         # catch the Error from the recursive copytree so that we can
         # continue with other files
         except shutil.Error, err:




