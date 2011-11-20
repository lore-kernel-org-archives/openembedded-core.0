Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1RSF6u-0000ex-TN
	for openembedded-core@lists.openembedded.org;
	Sun, 20 Nov 2011 22:39:36 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 2821C110018B;
	Sun, 20 Nov 2011 22:33:10 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 81101110017F;
	Sun, 20 Nov 2011 22:33:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
Received: from rhein.familie-heinold.de (g229046045.adsl.alicedsl.de
	[92.229.46.45]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Sun, 20 Nov 2011 22:33:08 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 8A4533C49D; Sun, 20 Nov 2011 22:33:02 +0100 (CET)
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 Nov 2011 22:32:53 +0100
Message-Id: <1321824774-23819-1-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.7.3
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH] package.bbclass: fix path for relative links on elf files, when moved to debugdir
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
X-List-Received-Date: Sun, 20 Nov 2011 21:39:37 -0000

* relative links for elf files like ../foo.so ends up in the
  debugdir with ../.debug/foo.so, this causes infinite fileaccessloops
  fix it by adding an extra "../" to the link path

Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
---
 meta/classes/package.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 6775fda..c351f26 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -778,6 +778,8 @@ python split_and_strip_files () {
 				if lpath and lpath != ".":
 					ftarget += lpath + debugdir + "/"
 				ftarget += lbase + debugappend
+				if lpath.startswith(".."):
+					ftarget = os.path.join("..", ftarget)
 				bb.mkdirhier(os.path.dirname(fpath))
 				#bb.note("Symlink %s -> %s" % (fpath, ftarget))
 				os.symlink(ftarget, fpath)
-- 
1.7.7.3


