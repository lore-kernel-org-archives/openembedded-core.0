Return-Path: <anuj.mittal@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 38F1A75447
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 02:05:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jul 2018 19:05:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,341,1526367600"; d="scan'208";a="64061315"
Received: from anmitta2-mobl1.png.intel.com ([10.221.20.148])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Jul 2018 19:05:28 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jul 2018 10:05:24 +0800
Message-Id: <20180712020525.11952-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] wic/engine: fix errors when expanding partitions
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
X-List-Received-Date: Thu, 12 Jul 2018 02:05:28 -0000

The UEFI spec implies that GPT partitions should be assumed to be on a 2048
sector boundary (for a 512 byte sector) and the current logic just
divides the free sectors available by the number of partitions that need
re-sizing, which may or may not align and the final result might
overshoot the limits imposed after alignment.

Since we are expanding already aligned partitions, just divide up the
free space in multiples of 2048. Also use the exec_cmd wrapper instead
of the subprocess call directly.

Fixes [YOCTO #12840]

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/wic/engine.py | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 94992365df..fe036f60e9 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -391,11 +391,8 @@ class Disk:
         def write_ptable(parts, target):
             with tempfile.NamedTemporaryFile(prefix="wic-sfdisk-", mode='w') as outf:
                 write_sfdisk_script(outf, parts)
-                cmd = "{} --no-reread {} < {} 2>/dev/null".format(self.sfdisk, target, outf.name)
-                try:
-                    subprocess.check_output(cmd, shell=True)
-                except subprocess.CalledProcessError as err:
-                    raise WicError("Can't run '{}' command: {}".format(cmd, err))
+                cmd = "{} --no-reread {} < {} ".format(self.sfdisk, target, outf.name)
+                exec_cmd(cmd, as_shell=True)
 
         if expand is None:
             sparse_copy(self.imagepath, target)
@@ -412,6 +409,8 @@ class Disk:
             for line in exec_cmd("{} -F {}".format(self.sfdisk, target)).splitlines():
                 if line.startswith("Unpartitioned space ") and line.endswith("sectors"):
                     free = int(line.split()[-2])
+                    # Align free space to a 2048 sector boundary. YOCTO #12840.
+                    free = free - (free % 2048)
             if free is None:
                 raise WicError("Can't get size of unpartitioned space")
 
-- 
2.17.1


