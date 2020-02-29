Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id D611B61A41
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 14:17:13 +0000 (UTC)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr
	[193.250.66.88]) by koncepto.io (Postfix) with ESMTPSA id 878B160323;
	Sat, 29 Feb 2020 15:17:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1582985834;
	bh=y+VMpLklxtuARF7EHuU4OYRz7Pd1TpeJ211W9Kbo734=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RyweJ4FNzVk/6YmFS2tBOCfvv6o/xcqjTQ5AeSqzY3ZdHO1Ar9GpRShEYhde6BQX3
	gO6pfybqFOV+azbqGjkI0fc43ipsfqKdxNUWCwMLWkDoIymtVOF/F43VKDx4VY8Wev
	XTU8BId32ILG+nvbYvkQUcVgGL5qBljp3aqqrOLnkMxJgp8HGyXZN5TZz8APBR5Y9Z
	5+xGKwJzSo8q1fArZ8yZ+1yTWP7/YZnMT3ka9/9RvB+1lQ+aE6WoCpW8sB956ZpMNR
	gjdGlLwRSjSoC5sZ4nWnbiVU3KLjIMkf/wywHagcz8jZbbB4qZfPMKWkvj7HqNrmsH
	w8pl7K+PC4UcA==
From: Pierre-Jean Texier <pjtexier@koncepto.io>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Feb 2020 15:16:43 +0100
Message-Id: <1582985803-21068-2-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582985803-21068-1-git-send-email-pjtexier@koncepto.io>
References: <1582985803-21068-1-git-send-email-pjtexier@koncepto.io>
Subject: [PATCH v3 2/2] wic/engine: dump the partition table in JSON format only
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
X-List-Received-Date: Sat, 29 Feb 2020 14:17:14 -0000

since commit 03154d2cf25c1d5ce908da9e72d324004b8d5722 ("sfdisk: add -J between mutually exclusive options")
in util-linux [1], the '-J' can't be used with the '-d' option anymore.

So, since we're using json format output, drop the '-d' option.

Fixes:

ERROR: _exec_cmd: <snip>/usr/sbin/sfdisk -dJ <snip>/core-image-minimal-qemux86-64.wic returned '1' instead of 0
output: sfdisk: mutually exclusive arguments: --list-free --json --dump

[1] - https://github.com/karelzak/util-linux/commit/03154d2cf25c1d5ce908da9e72d324004b8d5722#diff-31d5cc325380dbdafe64d0e019846f12

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
Changes v2 -> v3
 - NONE

 scripts/lib/wic/engine.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 2479751..83c42c9 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -439,7 +439,7 @@ class Disk:
             outf.flush()
 
         def read_ptable(path):
-            out = exec_cmd("{} -dJ {}".format(self.sfdisk, path))
+            out = exec_cmd("{} -J {}".format(self.sfdisk, path))
             return json.loads(out)
 
         def write_ptable(parts, target):
-- 
2.7.4


