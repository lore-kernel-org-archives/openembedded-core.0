Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1CED46FD5D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jun 2014 16:59:09 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5IGx5ra025663 for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jun 2014 17:59:05 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id SHWu4EyUVuNp
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jun 2014 17:59:05 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5IGx2uM025660
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jun 2014 17:59:03 +0100
Message-ID: <1403110736.2104.79.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Jun 2014 17:58:56 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] sstatesig: Add try/except around the stat calls
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
X-List-Received-Date: Wed, 18 Jun 2014 16:59:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Its possible sstate symlinks to other sstate mirrors which then my get
removed/cleaned. If we find invalid symlinks, skip over them rather
than error with a backtrace.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index acff2a0..d58147f 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -125,7 +125,10 @@ def find_siginfo(pn, taskname, taskhashlist, d):
                         foundall = True
                         break
         else:
-            filedates[fullpath] = os.stat(fullpath).st_mtime
+            try:
+                filedates[fullpath] = os.stat(fullpath).st_mtime
+            except OSError:
+                continue
 
     if not taskhashlist or (len(filedates) < 2 and not foundall):
         # That didn't work, look in sstate-cache
@@ -156,7 +159,10 @@ def find_siginfo(pn, taskname, taskhashlist, d):
                         if taskhashlist:
                             hashfiles[hashval] = fullpath
                         else:
-                            filedates[fullpath] = os.stat(fullpath).st_mtime
+                            try:
+                                filedates[fullpath] = os.stat(fullpath).st_mtime
+                            except:
+                                continue
 
     if taskhashlist:
         return hashfiles



