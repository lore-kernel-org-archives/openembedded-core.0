Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id A786A61A52
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 20:38:06 +0000 (UTC)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr
	[193.250.66.88]) by koncepto.io (Postfix) with ESMTPSA id BEEBF6032E;
	Sat, 29 Feb 2020 21:38:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1583008685;
	bh=VS1VJo7bTGbXqxwZ2Lw9cb8AYwver82Isuu/7q83zw0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dugmTlC0tPQ7w+mnmkbyq/i7admia/TlcjsiBNLsVDFGjDdX8ZxkMDDftEvSA0br8
	X0Rkwe14p61D999A49FuAi5cJ+pf0UJ2W2SjBgghKL/5kDFgdnllGM9isAOhlme+vE
	nR1WjuJlLAdiXIJZq0pRVJkdifTrsVU0MHTrYGopKkdOFlcYmHgKeQE4RE6Ltyay9H
	ia1VUfJHes7OTWwW+54M5HMd4PyW/6ZH5OVH8oWbhb2OyTBQmPUmFVbHoc4ZZL6AFy
	4D+ahntG7iiDksiLg1BVILegdqshCnxMnnDJdr94oj6BW1U4WlJXjDaFzVabUsDd0v
	ngj2JcW4eY8pQ==
From: Pierre-Jean Texier <pjtexier@koncepto.io>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Feb 2020 21:38:02 +0100
Message-Id: <1583008682-4650-2-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583008682-4650-1-git-send-email-pjtexier@koncepto.io>
References: <1583008682-4650-1-git-send-email-pjtexier@koncepto.io>
Subject: [PATCH v4 2/2] wic/engine: dump the partition table in JSON format only
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
X-List-Received-Date: Sat, 29 Feb 2020 20:38:07 -0000

since commit 03154d2cf25c1d5ce908da9e72d324004b8d5722 ("sfdisk: add -J between mutually exclusive options")
in util-linux [1], the '-J' can't be used with the '-d' option anymore.

So, since we're using json format output, drop the '-d' option.

Fixes:

ERROR: _exec_cmd: <snip>/usr/sbin/sfdisk -dJ <snip>/core-image-minimal-qemux86-64.wic returned '1' instead of 0
output: sfdisk: mutually exclusive arguments: --list-free --json --dump

[1] - https://github.com/karelzak/util-linux/commit/03154d2cf25c1d5ce908da9e72d324004b8d5722#diff-31d5cc325380dbdafe64d0e019846f12

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
Changes v3 -> v4
 - NONE

Changes v2 -> v3
 - New

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


