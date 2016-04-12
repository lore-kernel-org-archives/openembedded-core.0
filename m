Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5CC7760745
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 12:06:21 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id u206so25127452wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 05:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=MD2txui09HRMR5YnPqJFF9ilQixFWi9GsZ0VfBVZeDQ=;
	b=uBlTbhMCOPzlum1jANPqUvaXlWufv0IqqwSacoSudsFLf41EviEZnTOXTs+EFM8AA5
	+PgkqcLBNbaJnTMyZKyGYdBB3ktjgwhTiJf8JRuQV8boH3pJ/9vzVnW5l5e5B8Rn/s1W
	Ppv71lwuoI5jUSeN3QpWG6cG/HyTrRIjoWOsIPqNgvp2aFX3POusl53NH/SNZrwOsfm3
	3WXVZum4TLO7jnGlEvdzZKAvbUgJtkQbVd46ts1lO4Reot7PzMxgnyjBCbtyR2nZkrh1
	9Udt7VqU7kpVujrS6P5+6qrpEK/wiwiLWDBKp+SMYFw/RFlu8imQd5Et+CwXU2DZ4aHw
	LNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=MD2txui09HRMR5YnPqJFF9ilQixFWi9GsZ0VfBVZeDQ=;
	b=INrBqLr/7pbXtlwyKONfN4MgK07Gof3ynO4msRFq2YDk+lX4vCooUF7BuU7fJoHLCt
	jkIRapJuM6FcJUSGv7gWVK+PS6PodeUFjTWFLBKFC1unN0cCgrBXdAKolxcfxzBhAMNq
	2ADvhIipSzT9wus/fL56T7DhbvaP48vUiWJSms1j1wNMzS0kOmZqgc6WfLJbgkOraJAk
	YEkjcBoaI/2ufwfZdFxds5mYwJH6PJwBA70/sJS2Ie7gmlu+koM2WQhTlrNuvUHct0LV
	a92Rnfu6v2cCNIbbSmpoKdfxwvRo4o2xivZ420jvscCVmvf5hRuUYSvWEoZ80vTxvY68
	1ZRA==
X-Gm-Message-State: AOPr4FV9eUeWxQzefZe4+tvfVmZjLtjkn2SXQI7OChzbM1SyI+nurcA+KZpD7QNMp7hzXxLY
X-Received: by 10.28.53.4 with SMTP id c4mr3951083wma.34.1460462781710;
	Tue, 12 Apr 2016 05:06:21 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	qb8sm33056335wjc.24.2016.04.12.05.06.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 12 Apr 2016 05:06:21 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Apr 2016 13:06:17 +0100
Message-Id: <1460462778-3910-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH 1/2] Revert "wic/utils/partitionedfs.py: assemble .wic images as sparse files"
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
X-List-Received-Date: Tue, 12 Apr 2016 12:06:24 -0000

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


