Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id E449B60107
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 14:51:56 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id v188so130449486wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 07:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=MD2txui09HRMR5YnPqJFF9ilQixFWi9GsZ0VfBVZeDQ=;
	b=bCCoJzIZ+Z5oDiB5KJnZvOB3fYr9sSs9CQ+bj7spo46Qz8Bs5Ave58E0G4Z/NPghuC
	cR4DXbmPcCd6RIIIamSlKjSvMqxs+KskNABrH8vOfH+cyUW40rfCQGZ2WmGbbJpuNpmv
	dOq5xCaio7QIeY1WzMqqCMLSFFqyS2ORiMo0v1aXZj0j9X67nDV/ythY//SDYtSKxThb
	JtqvAZi5O0dLGPjBOptRxxONaoxujpwHYPB9MLwEfEzmcZXVDS/3qRAt3R9wEKAo6PO4
	QjNjrwdCnIwqlugQNGfjjlY2jBz21P8DrHC2SNu/WkrGDI5xheCGqe49gGIRxo4Ffh9x
	7Xtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=MD2txui09HRMR5YnPqJFF9ilQixFWi9GsZ0VfBVZeDQ=;
	b=Fsupyb9r1e7s/zIwdTbR7gbNl/MnuzrHfluYM2ING/Ou7mDNbLxqA9+sfOeR1CcFjJ
	VwsMAKX4tOkr5JI3OM/v1RGvS/FsYsyPtvAF/ux83nfQ9KNOsgFJhxB7pqf8NMCI4OjG
	r+gnKxS62JyZFJVgXxcvDYUBM6oGf+/CdcUv6WaVknU0RExToZ5zI/R0RMvyce47WeE+
	MmLJ/nOeqdGZBVTGN9Sl58gD1lJxinWMWfIIY8OfjyfE7HQrtbXNb4JZgT7BwcC0/PVh
	7PPiftSvKkrRSH5XwIvHoYOh5ahuXU/34wAAN2ImxW4nRqHjFbTCx/UtACEPmbF7m35w
	IyNA==
X-Gm-Message-State: AOPr4FUZwS+4mgk2Jq/ZuKtEaOVpEJWHc+T/0TmnAyMzb4rjbnLvC206Pif1MiC2sKshL/VB
X-Received: by 10.194.2.130 with SMTP id 2mr4106043wju.77.1460472717243;
	Tue, 12 Apr 2016 07:51:57 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id z6sm23192722wme.9.2016.04.12.07.51.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 12 Apr 2016 07:51:56 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Apr 2016 15:51:50 +0100
Message-Id: <1460472714-12605-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH 1/5] Revert "wic/utils/partitionedfs.py: assemble .wic images as sparse files"
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
X-List-Received-Date: Tue, 12 Apr 2016 14:51:58 -0000

It turns out that dd's conv=sparse doesn't look at the file extents, but simply
checks if a "block" is all zero.  If the block of zero was meaningful it gets
lost and if the image is subsequently written to media using a sparse-aware
writer then the block of zeros won't be written at all.

This reverts commit 5fd592fbae2e046bcb8c3a6c3ef4993fe0400676.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/lib/wic/utils/partitionedfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index 3e2b420..5a103bb 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -340,7 +340,7 @@ class Image(object):
             source = part['source_file']
             if source:
                 # install source_file contents into a partition
-                cmd = "dd if=%s of=%s bs=%d seek=%d count=%d conv=notrunc,sparse" % \
+                cmd = "dd if=%s of=%s bs=%d seek=%d count=%d conv=notrunc" % \
                       (source, image_file, self.sector_size,
                        part['start'], part['size'])
                 exec_cmd(cmd)
-- 
2.8.0.rc3


