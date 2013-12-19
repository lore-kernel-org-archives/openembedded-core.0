Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 9F38760DED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2013 09:39:18 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBJ9dEua006089 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2013 09:39:14 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id SSR6G4FI5Tiv
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2013 09:39:14 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBJ9d9vX006084
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2013 09:39:10 GMT
Message-ID: <1387445944.6402.63.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Dec 2013 09:39:04 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] sstatesig: Allow the BB_HASHFILENAME to be passed in for comparision purposes
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
X-List-Received-Date: Thu, 19 Dec 2013 09:39:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently the code can match too many things, for example, searching for
gcc-cross, we'd also get gcc-cross-initial.

If we have a bitbake cache available, we'd often have the BB_HASHFILENAME
data available from that cache. That can give us something to filter the
matches against.

The format of that field is metadata defined so it needs to be processed
in a metadata function (which find_siginfo is).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index b13d11c..836a148 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -85,7 +85,7 @@ bb.siggen.SignatureGeneratorOEBasic = SignatureGeneratorOEBasic
 bb.siggen.SignatureGeneratorOEBasicHash = SignatureGeneratorOEBasicHash
 
 
-def find_siginfo(pn, taskname, taskhashlist, d):
+def find_siginfo(pn, taskname, taskhashlist, d, hashfn = None):
     """ Find signature data files for comparison purposes """
 
     import fnmatch
@@ -94,6 +94,10 @@ def find_siginfo(pn, taskname, taskhashlist, d):
     if taskhashlist:
         hashfiles = {}
 
+    # This is based on BB_HASHFILENAME set for the recipe and provided from the cache
+    if hashfn:
+         hashfn = hashfn.split(" ")[1]
+
     if not taskname:
         # We have to derive pn and taskname
         key = pn
@@ -157,6 +161,8 @@ def find_siginfo(pn, taskname, taskhashlist, d):
                 for fn in files:
                     fullpath = os.path.join(root, fn)
                     if fnmatch.fnmatch(fullpath, filespec):
+                        if hashfn and not os.path.basename(fullpath).startswith(hashfn):
+                            continue
                         if taskhashlist:
                             hashfiles[hashval] = fullpath
                         else:



