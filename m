Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TsCfJ-000456-8X
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 14:23:07 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 07 Jan 2013 05:07:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,424,1355126400"; d="scan'208";a="268633800"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 07 Jan 2013 05:07:06 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 15:07:04 +0200
Message-Id: <1357564025-10485-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] relocate_sdk.py: new interpreter string was not '\0' terminated
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
X-List-Received-Date: Mon, 07 Jan 2013 13:23:08 -0000

The problem: SDK binaries were not properly relocated when the SDK
was installed into a path that had a length less than the default one.
Apparently, there were two problems here: the padding was done wrong
(the size of one program header table entry was used instead of the
program section size) and the new padded string was not used at all.

[YOCTO #3655]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 scripts/relocate_sdk.py |    4 ++--
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
1.7.9.5



