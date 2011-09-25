Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1R7rDp-0002oW-JT
	for openembedded-core@lists.openembedded.org;
	Sun, 25 Sep 2011 18:06:29 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8PG3VZN016373 for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2011 17:03:32 +0100
X-Quarantine-ID: <JTSh0HOgqROb>
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER, Duplicate header field: "In-Reply-To"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JTSh0HOgqROb
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2011 17:03:31 +0100 (BST)
Received: from ted (tim [93.97.173.237])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8PG3Q1A016315
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2011 17:03:27 +0100
Received: from richard by ted with local (Exim 4.76)
	(envelope-from <richard@dan.rpsys.net>) id 1R7r4h-0005XC-5p
	for openembedded-core@lists.openembedded.org;
	Sun, 25 Sep 2011 16:57:03 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Sep 2011 16:57:01 +0100
Message-Id: <dd8c27421bb7c3691b232d04667c2e14eefb70dc.1316963134.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <8ad24306d8bc9c2fd73f4b814eb1a64c04707da5.1316963134.git.richard.purdie@linuxfoundation.org>
References: <8ad24306d8bc9c2fd73f4b814eb1a64c04707da5.1316963134.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1316963134.git.richard.purdie@linuxfoundation.org>
References: <cover.1316963134.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 9/9] sstate: No need to spew out a debug message per file, summarise instead
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
X-List-Received-Date: Sun, 25 Sep 2011 16:06:29 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 91f209a..eee04ab 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -114,15 +114,16 @@ def sstate_install(ss, d):
     for state in ss['dirs']:
         oe.path.copytree(state[1], state[2])
         for walkroot, dirs, files in os.walk(state[1]):
+            bb.debug(2, "Staging files from %s to %s" % (state[1], state[2]))
             for file in files:
                 srcpath = os.path.join(walkroot, file)
                 dstpath = srcpath.replace(state[1], state[2])
-                bb.debug(2, "Staging %s to %s" % (srcpath, dstpath))
+                #bb.debug(2, "Staging %s to %s" % (srcpath, dstpath))
                 sharedfiles.append(dstpath)
             for dir in dirs:
                 srcdir = os.path.join(walkroot, dir)
                 dstdir = srcdir.replace(state[1], state[2])
-                bb.debug(2, "Staging %s to %s" % (srcdir, dstdir))
+                #bb.debug(2, "Staging %s to %s" % (srcdir, dstdir))
                 if not dstdir.endswith("/"):
                     dstdir = dstdir + "/"
                 shareddirs.append(dstdir)
@@ -355,12 +356,12 @@ def sstate_package(ss, d):
             for file in files:
                 srcpath = os.path.join(walkroot, file)
                 dstpath = srcpath.replace(state[1], sstatebuild + state[0])
-                bb.debug(2, "Preparing %s for packaging at %s" % (srcpath, dstpath))
                 make_relative_symlink(srcpath, dstpath, d)
             for dir in dirs:
                 srcpath = os.path.join(walkroot, dir)
                 dstpath = srcpath.replace(state[1], sstatebuild + state[0])
                 make_relative_symlink(srcpath, dstpath, d)
+        bb.debug(2, "Preparing tree %s for packaging at %s" % (state[1], sstatebuild + state[0]))
         oe.path.copytree(state[1], sstatebuild + state[0])
 
     workdir = bb.data.getVar('WORKDIR', d, True)
-- 
1.7.5.4



