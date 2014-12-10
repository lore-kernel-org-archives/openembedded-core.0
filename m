Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 15CF6724CB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 11:54:45 +0000 (UTC)
Received: from localhost.localdomain (unknown [46.170.72.194])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 3FFBD1C9A69;
	Wed, 10 Dec 2014 12:46:28 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org,
	Tom Zanussi <tom.zanussi@linux.intel.com>>,
	Rifenbark Scott <scott.m.rifenbark@intel.com>
Date: Wed, 10 Dec 2014 12:45:56 +0100
Message-Id: <1418211958-27738-2-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1418211958-27738-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1418211958-27738-1-git-send-email-maciej.borzecki@open-rnd.pl>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH 1/3] wic: IMAGE_BOOT_FILES format checks in bootimg-partition source
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
X-List-Received-Date: Wed, 10 Dec 2014 11:54:45 -0000

Check for malformed entries in IMAGE_BOOT_FILES, fail early if such
entries were found.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
---
 scripts/lib/wic/plugins/source/bootimg-partition.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
index abf2494..564118a 100644
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
@@ -90,6 +90,8 @@ class BootimgPartitionPlugin(SourcePlugin):
         for src_entry in re.findall(r'[\w;\-\./]+', boot_files):
             if ';' in src_entry:
                 dst_entry = tuple(src_entry.split(';'))
+                if not dst_entry[0] or not dst_entry[1]:
+                    msger.error('Malformed boot file entry: %s' % (src_entry))
             else:
                 dst_entry = (src_entry, src_entry)
 
-- 
1.9.3


