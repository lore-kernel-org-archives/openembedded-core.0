Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 33B7B605BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 10:42:09 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id n124so10428577lfd.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 02:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=FSvrbvhieJmTN0ok4QtAWCtXsKiN0ZxqKdbLa1zONtA=;
	b=fPzNmSV5QLQ2rQgFE6qvL2+ioySeL+zV1QRu0/8P7oyq0x7QIpayJHYnXxtAngfRPx
	viyS42x2HM/duhk4R6mvGiMxvF63MvT2opHY1QoKgi0PKv4DwZLjZUhwio1Z/fam61ud
	on/OaJ8LNZf6VNUt3Z4bAtOi4GT5WALbo/sQiu9kHvmVxQmyrDISs/HEzv5iuznGc5Wn
	fpxeZzGUaD6cXDH7IgIK4ii6zdsx4C8pw/k9bKHU0kDQPJysphx8wslBgALt84PzfNOq
	ft5oQWmThM1jOEvsRcgrDRUPYqLHh5Ja74ykMG2mrRa50Eem0JUdeMGoF58vBAGodurj
	B4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FSvrbvhieJmTN0ok4QtAWCtXsKiN0ZxqKdbLa1zONtA=;
	b=B0ZQPil6c12Z1tkwpFQVZD1UxSXZODapX18SXNsxCCu8U9iU8/DdTjcblY5TFYsDkz
	deG/Gferlp4N09vG/YZGJ1K0m0stA8C+IGAx7kQtRry2NaO1utAYtaHQ/ZD0nuxqvvf1
	xyPMcei2Tfjom3uQj40Gv5MKulieT8uncMJajmOIyvJ3JZCfN7L+g3t21LNWuaPjTUY5
	blFHVZnfxxRfMt3+bMG8uTd3qgikJqSljvox9rTv7o4+vGxzWUZDK0WbSDLZBRH/OpH1
	XLgoAagZsCFW69CMhHcE1LowStKow0HwsshH9YYKDRy2+znJRLvZ2EPPnWSIwGwZ8yD+
	g1lQ==
X-Gm-Message-State: AIkVDXLdr0YCnyF7QPXuJGBsAlWN+pfdStdxhGaUjDCAAbkjcUDxoOOwwU4XAEmCsNCxLw==
X-Received: by 10.25.204.197 with SMTP id c188mr8783240lfg.107.1484563329577; 
	Mon, 16 Jan 2017 02:42:09 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id h13sm1656696ljh.5.2017.01.16.02.42.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jan 2017 02:42:08 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jan 2017 11:41:51 +0100
Message-Id: <79e1d1075a4308ca62440efef0ef0ba70a868aa5.1484563252.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.5
Cc: Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH] wic: partitionedfs: account for non-table partitions when checking if logical parititon is needed
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
X-List-Received-Date: Mon, 16 Jan 2017 10:42:10 -0000

Commit 8c1c43b7901a9fcd8b279eb4250b08157ad345b7 `wic: Create a logical partition
only when it is really mandatory` did not account for partitions that are not
present in partition table.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 scripts/lib/wic/utils/partitionedfs.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index 68301f0b476ed48edfcb4dcad0df903474d13b50..721d51432605fe71c02c59a8d81c833cba1d445f 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -201,7 +201,8 @@ class Image():
                 part['num'] = 0
 
             if disk['ptable_format'] == "msdos":
-                if len(self.partitions) > 4:
+                # only count the partitions that are in partition table
+                if len([p for p in self.partitions if not p['no_table']]) > 4:
                     if disk['realpart'] > 3:
                         part['type'] = 'logical'
                         part['num'] = disk['realpart'] + 1
-- 
2.5.5


