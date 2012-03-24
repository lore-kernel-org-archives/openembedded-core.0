Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1SBOza-0002TE-ER
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 12:18:42 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 77F6D2232639;
	Sat, 24 Mar 2012 12:09:47 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id CF279223263A;
	Sat, 24 Mar 2012 12:09:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
Received: from rhein.familie-heinold.de (g225005117.adsl.alicedsl.de
	[92.225.5.117]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Sat, 24 Mar 2012 12:09:45 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 3C6C93C4BF; Sat, 24 Mar 2012 12:09:45 +0100 (CET)
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-core@lists.openembedded.org
Date: Sat, 24 Mar 2012 12:09:42 +0100
Message-Id: <1332587383-23633-2-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.9.1
In-Reply-To: <1332587383-23633-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1332587383-23633-1-git-send-email-heinold@inf.fu-berlin.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH] relocatable.bbclass: do not erease already existing ORIGIN paths and sanity resulting rpath
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
X-List-Received-Date: Sat, 24 Mar 2012 11:18:42 -0000

* let already exisiting ORIGIN path stay in the binary
  otherwise binaries will not find there libs in directories
  besides the standard defined directories
* remove all whitespaces from the resulting path

Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
---
 meta/classes/relocatable.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/classes/relocatable.bbclass b/meta/classes/relocatable.bbclass
index 072f533..dff12ed 100644
--- a/meta/classes/relocatable.bbclass
+++ b/meta/classes/relocatable.bbclass
@@ -6,6 +6,7 @@ PREPROCESS_RELOCATE_DIRS ?= ""
 def process_dir (directory, d):
     import subprocess as sub
     import stat
+    import re
 
     cmd = d.expand('${CHRPATH_BIN}')
     tmpdir = d.getVar('TMPDIR')
@@ -52,6 +53,7 @@ def process_dir (directory, d):
             for rpath in rpaths:
                 # If rpath is already dynamic continue
                 if rpath.find("$ORIGIN") != -1:
+                    new_rpaths.append(rpath)
                     continue
                 # If the rpath shares a root with base_prefix determine a new dynamic rpath from the
                 # base_prefix shared root
@@ -75,6 +77,7 @@ def process_dir (directory, d):
             # if we have modified some rpaths call chrpath to update the binary
             if len(new_rpaths):
                 args = ":".join(new_rpaths)
+		args = re.sub(r'\s', '', args)
                 #bb.note("Setting rpath for %s to %s" %(fpath, args))
                 sub.call([cmd, '-r', args, fpath])
 
-- 
1.7.9.1


