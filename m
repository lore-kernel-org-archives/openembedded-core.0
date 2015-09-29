Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4A8D376DF8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 17:15:39 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 29 Sep 2015 10:15:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,609,1437462000"; d="scan'208";a="570654281"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by FMSMGA003.fm.intel.com with ESMTP; 29 Sep 2015 10:15:39 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Sep 2015 09:05:56 +0000
Message-Id: <764c3c1649362c7376ac70baecb6da1c9ddb6a6e.1443517391.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1443517391.git.mariano.lopez@linux.intel.com>
References: <cover.1443517391.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] testimage: Added IO commands to dumps
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Sep 2015 17:15:40 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This change just add two more commands to
the host dumps to get more information
related to the IO.

[YOCTO #8412]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/testimage.bbclass | 2 ++
 meta/lib/oeqa/utils/dump.py    | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 2efab29..1f21c9e 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -80,11 +80,13 @@ testimage_dump_target () {
 
 testimage_dump_host () {
     top -bn1
+    iostat -x -z -N -d -p ALL 20 2
     ps -ef
     free
     df
     memstat
     dmesg
+    ip -s link
     netstat -an
 }
 
diff --git a/meta/lib/oeqa/utils/dump.py b/meta/lib/oeqa/utils/dump.py
index 3f31e20..63a591d 100644
--- a/meta/lib/oeqa/utils/dump.py
+++ b/meta/lib/oeqa/utils/dump.py
@@ -20,11 +20,13 @@ class BaseDumper(object):
         # to set some defaults.
         self.parent_dir = parent_dir or "/tmp/oe-saved-tests"
         dft_cmds = """  top -bn1
+                        iostat -x -z -N -d -p ALL 20 2
                         ps -ef
                         free
                         df
                         memstat
                         dmesg
+                        ip -s link
                         netstat -an"""
         if not cmds:
             cmds = dft_cmds
-- 
1.8.4.5


