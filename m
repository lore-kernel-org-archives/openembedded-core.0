Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Tbzwz-00026n-Gp for openembedded-core@lists.openembedded.org;
	Fri, 23 Nov 2012 21:34:16 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qANKK47T013439
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2012 20:20:04 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04292-10 for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2012 20:19:58 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qANKJugL013410
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2012 20:19:57 GMT
Message-ID: <1353701996.7657.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Nov 2012 20:19:56 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] scripts/cleanup-workdir: Adpat to new workdir layout
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
X-List-Received-Date: Fri, 23 Nov 2012 20:34:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/scripts/cleanup-workdir b/scripts/cleanup-workdir
index 9d161c2..b2408fc 100755
--- a/scripts/cleanup-workdir
+++ b/scripts/cleanup-workdir
@@ -22,7 +22,7 @@ import re
 import subprocess
 import shutil
 
-pkg_cur_dirs = []
+pkg_cur_dirs = {}
 obsolete_dirs = []
 parser = None
 
@@ -101,7 +101,7 @@ will be deleted. Be CAUTIOUS.""")
             version = parse_version(elems[1])
         else:
             version = parse_version(elems[2])
-        pkg_cur_dirs.append(elems[0] + '-' + version)
+        pkg_cur_dirs[elems[0]] = version
 
     cmd = "bitbake -e"
     output = run_command(cmd)
@@ -156,6 +156,14 @@ will be deleted. Be CAUTIOUS.""")
                 for pkgdir in sorted(pkgdirs):
                     if pkgdir not in pkg_cur_dirs:
                         obsolete_dirs.append(os.path.join(pkgroot, pkgdir))
+                    else:
+                        for verroot, verdirs, verfiles in os.walk(os.path.join(pkgroot, pkgdir)):
+                            for f in verfiles:
+                                obsolete_dirs.append(os.path.join(pkgroot, f))
+                            for v in sorted(verdirs):
+                               if v not in pkg_cur_dirs[pkgdir]:
+                                   obsolete_dirs.append(os.path.join(pkgroot, pkgdir, v))
+                            break
 
                 # just process the top dir of every package under tmp/work/*/,
                 # then jump out of the above os.walk()




