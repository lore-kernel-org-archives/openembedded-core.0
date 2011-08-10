Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpurdie@rpsys.net>) id 1QrDoL-0004TK-V4
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 20:47:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7AIgut0024091
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 19:42:56 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22941-06 for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 19:42:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7AIgm6f024085
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 19:42:49 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Aug 2011 19:42:12 +0100
Message-ID: <1313001732.14274.389.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] sstate: Add level 2 debug so its possible to see what sstate is doing
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
X-List-Received-Date: Wed, 10 Aug 2011 18:47:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently its hard to figure out if/when sstate is checking for possible
packages to speed up builds. This patch adds level 2 debug output which
better indicates what files are being searched for an why.

[YOCTO #1259]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index c057cc7..d7631ca 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -477,10 +477,12 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
     for task in range(len(sq_fn)):
         sstatefile = bb.data.expand("${SSTATE_DIR}/" + sq_hashfn[task] + "_" + mapping[sq_task[task]] + ".tgz", d)
         sstatefile = sstatefile.replace("${BB_TASKHASH}", sq_hash[task])
-        #print("Checking for %s" % sstatefile)
         if os.path.exists(sstatefile):
+            bb.debug(2, "SState: Found valid sstate file %s" % sstatefile)
             ret.append(task)
             continue
+        else:
+            bb.debug(2, "SState: Looked for but didn't find file %s" % sstatefile)
 
     mirrors = bb.data.getVar("SSTATE_MIRRORS", d, True)
     if mirrors:
@@ -492,6 +494,8 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
         bb.data.setVar('DL_DIR', dldir, localdata)
         bb.data.setVar('PREMIRRORS', mirrors, localdata)
 
+        bb.debug(2, "SState using premirror of: %s" % mirrors)
+
         for task in range(len(sq_fn)):
             if task in ret:
                 continue
@@ -501,13 +505,15 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
 
             srcuri = "file://" + os.path.basename(sstatefile)
             bb.data.setVar('SRC_URI', srcuri, localdata)
-            #bb.note(str(srcuri))
+            bb.debug(2, "SState: Attempting to fetch %s" % srcuri)
 
             try:
                 fetcher = bb.fetch2.Fetch(srcuri.split(), localdata)
                 fetcher.checkstatus()
+                bb.debug(2, "SState: Successful fetch test for %s" % srcuri)
                 ret.append(task)
             except:
+                bb.debug(2, "SState: Unsuccessful fetch test for %s" % srcuri)
                 pass     
 
     return ret




