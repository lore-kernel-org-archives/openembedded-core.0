Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1U29fK-0002by-15
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 01:12:08 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1401FUP020480; Mon, 4 Feb 2013 00:01:22 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8aF-IuXi7ArR; Mon,  4 Feb 2013 00:01:22 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1401D2u020461
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 4 Feb 2013 00:01:14 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1U29Pl-0000YG-F3; Sun, 03 Feb 2013 23:56:01 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Feb 2013 23:55:47 +0000
Message-Id: <ddb80101c75e7cfa49414bc3d1965391904329ca.1359935562.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <e3d21cd567d7d7bf3df4a349265e0400c583962d.1359935562.git.richard.purdie@linuxfoundation.org>
References: <e3d21cd567d7d7bf3df4a349265e0400c583962d.1359935562.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
References: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 17/22] package.bbclass: Simplify empty directory removal
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
X-List-Received-Date: Mon, 04 Feb 2013 00:12:41 -0000

Rather than an exec() per directory, we might as well exec one command and
be done with it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass |    6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 6d2dd89..c822c43 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -298,11 +298,7 @@ def copydebugsources(debugsrcdir, d):
         subprocess.call(processdebugsrc % (sourcefile, workbasedir, workparentdir, dvar, debugsrcdir), shell=True)
 
         # The copy by cpio may have resulted in some empty directories!  Remove these
-        for root, dirs, files in os.walk("%s%s" % (dvar, debugsrcdir)):
-            for d in dirs:
-                dir = os.path.join(root, d)
-                #bb.note("rmdir -p %s" % dir)
-                subprocess.call("rmdir -p %s 2>/dev/null" % dir, shell=True)
+        subprocess.call("find %s%s -empty -type d -delete" % (dvar, debugsrcdir), shell=True)
 
         # Also remove debugsrcdir if its empty
         for p in nosuchdir[::-1]:
-- 
1.7.10.4



