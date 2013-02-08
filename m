Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1U3hRS-0002wS-2g
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 07:28:10 +0100
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MHV00MYVYGCYXQ7@vms173013.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 07 Feb 2013 23:12:13 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id A672C2008E; Fri,
	08 Feb 2013 00:12:12 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 08 Feb 2013 00:12:01 -0500
Message-id: <1360300321-4543-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH][for-danny] relocate_sdk.py: new interpreter string was not '\0' terminated
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
X-List-Received-Date: Fri, 08 Feb 2013 06:28:11 -0000

From: Laurentiu Palcu <laurentiu.palcu@intel.com>

The problem: SDK binaries were not properly relocated when the SDK
was installed into a path that had a length less than the default one.
Apparently, there were two problems here: the padding was done wrong
(the size of one program header table entry was used instead of the
program section size) and the new padded string was not used at all.

[YOCTO #3655]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/relocate_sdk.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
index 637ffe9..74bb7a5 100755
--- a/scripts/relocate_sdk.py
+++ b/scripts/relocate_sdk.py
@@ -89,8 +89,8 @@ def change_interpreter():
         if p_type == 3:
             # PT_INTERP section
             f.seek(p_offset)
-            dl_path = new_dl_path + "\0" * (e_phentsize - len(new_dl_path))
-            f.write(new_dl_path)
+            dl_path = new_dl_path + "\0" * (p_filesz - len(new_dl_path))
+            f.write(dl_path)
             break
 
 def change_dl_sysdirs():
-- 
1.8.1.2



