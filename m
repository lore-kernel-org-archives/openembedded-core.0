Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QgInD-0003WX-Ph for openembedded-core@lists.openembedded.org;
	Mon, 11 Jul 2011 17:53:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6BFnCWA012578
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2011 16:49:12 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10630-10 for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2011 16:49:08 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6BFn5jW012572
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2011 16:49:05 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Jul 2011 16:48:18 +0100
Message-ID: <1310399298.20015.969.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] sstate: Improve performance by moving files rather than using copy and delete
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
X-List-Received-Date: Mon, 11 Jul 2011 15:53:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass |   16 +++++++++++-----
 1 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 0daaf48..62c7c43 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -147,6 +147,13 @@ def sstate_install(ss, d):
 def sstate_installpkg(ss, d):
     import oe.path
 
+    def prepdir(dir):
+        # remove dir if it exists, ensure any parent directories do exist
+        if os.path.exists(dir):
+            oe.path.remove(dir)
+        bb.mkdirhier(dir)
+        oe.path.remove(dir)
+
     sstateinst = bb.data.expand("${WORKDIR}/sstate-install-%s/" % ss['name'], d)
     sstatepkg = bb.data.getVar('SSTATE_PKG', d, True) + '_' + ss['name'] + ".tgz"
 
@@ -178,9 +185,8 @@ def sstate_installpkg(ss, d):
             os.system("sed -i -e s:FIXMESTAGINGDIR:%s:g %s" % (staging, sstateinst + file))
 
     for state in ss['dirs']:
-        if os.path.exists(state[1]):
-            oe.path.remove(state[1])
-        oe.path.copytree(sstateinst + state[0], state[1])
+        prepdir(state[1])
+        os.rename(sstateinst + state[0], state[1])
     sstate_install(ss, d)
 
     for plain in ss['plaindirs']:
@@ -188,8 +194,8 @@ def sstate_installpkg(ss, d):
         src = sstateinst + "/" + plain.replace(workdir, '')
         dest = plain
         bb.mkdirhier(src)
-        bb.mkdirhier(dest)
-        oe.path.copytree(src, dest)
+        prepdir(dest)
+        os.rename(src, dest)
 
     return True
 
-- 
1.7.4.1




