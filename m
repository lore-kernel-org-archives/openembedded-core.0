Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TjZAt-0004fY-BI for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 18:35:53 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qBEHLFlc013724
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 17:21:15 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12514-07 for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 17:21:11 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qBEHL5K1013718
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 17:21:06 GMT
Message-ID: <1355505665.32519.29.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Dec 2012 17:21:05 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] lib/oe/patch: Use force option when creating symlinks to patches
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
X-List-Received-Date: Fri, 14 Dec 2012 17:35:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Under the scenario where you have an existing source tree and you then
change one of the patches, maybe to be architecture or machine specific,
then rebuild, the build will fail since the symlink already exists
but should now point at a different file.

The easiest fix is to tell the system to remove and recreate the link
which is done with the force option.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index bc86bb5..7ab74fa 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -278,7 +278,7 @@ class QuiltTree(PatchSet):
         if not self.initialized:
             self.InitFromDir()
         PatchSet.Import(self, patch, force)
-        oe.path.symlink(patch["file"], self._quiltpatchpath(patch["file"]))
+        oe.path.symlink(patch["file"], self._quiltpatchpath(patch["file"]), force=True)
         f = open(os.path.join(self.dir, "patches","series"), "a");
         f.write(os.path.basename(patch["file"]) + " -p" + patch["strippath"]+"\n")
         f.close()




