Return-Path: <dogukan.ergun@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6348371A0F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 11:56:27 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id z3so9008275wme.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 03:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=RymeSPPbkPSYiJvHG5oKzswahChw4dO05Me1Wk62BYg=;
	b=ZrpUdkqz/kPxUpiowZaVpe3pJoLSpGKTIrILRdLkOQmP4rQnW8qTaG21dGkqLRgcg+
	d7d7XbE1uJZ396HoGhBP/rWLoANRunrP5tXlT7qc/dwqAreI4h4x7+M7l+fKqgVfHwZV
	FyZ9xvnLrua6oXaoacUUr9/HdZHZW8xgYucGgnirn7B/Nvd839fQ9quAxN+9dkfm4lCh
	xHfm4tujwt650Pzm63yMA6h1Axyy8X/VklgIZE/Ict7RKdnJZM/n8PDaqMA4hIZ1GMul
	INcQTFmKFQ0ewxwd/Yq09bva29IlxjQQmlBXve4PdKJmM/r4aEUTHFrP+8ZmYxxvxI6/
	WpJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RymeSPPbkPSYiJvHG5oKzswahChw4dO05Me1Wk62BYg=;
	b=SGbBXTtZIbeBmzJ/7PvfA4GTkM2WMTSh+c+yC6b6BBue8sRfU/T993ts6bIlSW9jf9
	jexyUKrOalUSUGxY0eWD11qzYqEezrjRb/bBUJQU1ueAVk/6LOG+54JEMEsN4zyMbxnZ
	JGyQ2TCuBqNGi8pzKAgbsTKdgfLvd8Eo4Us2gqjYHGSKv0rLBBKR5LF6+gjz3cXs3PG5
	qxUCXfsxLUU+XsvaiH9QYuHfVERaK2Up6FXdYswxTuX0KohQc1RW609sFNpfV7m5DaU4
	Uuk6k1yxQYAh3MH9jQwyKR+jC+rU6Z4LFs/EtZ/pu4W16Eajsi4RDO47ElKIwp3ktSML
	DrbQ==
X-Gm-Message-State: AJaThX73cFXRs8v4kh5bXNc4CmYMfv1hk+AcnT71IEq/VhLD6HNX5tKS
	qx7IvWiSVAKStA5xMOXdItmN2ORp
X-Google-Smtp-Source: AGs4zMbDzHbcpEtvPsw9hg48h1e0TyoQKmGSVJ0SECXOBGfz4bEmAbwv5X/NPhgqgtpFG54TDMixGg==
X-Received: by 10.28.149.144 with SMTP id x138mr1261215wmd.49.1510833388033;
	Thu, 16 Nov 2017 03:56:28 -0800 (PST)
Received: from localhost.localdomain ([81.214.38.25])
	by smtp.gmail.com with ESMTPSA id 16sm854486wrt.81.2017.11.16.03.56.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Nov 2017 03:56:27 -0800 (PST)
From: Dogukan Ergun <dogukan.ergun@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Nov 2017 14:49:43 +0300
Message-Id: <1510832983-801-1-git-send-email-dogukan.ergun@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] wic: fallback to dd, if sparse_copy does not work
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
X-List-Received-Date: Thu, 16 Nov 2017 11:56:27 -0000

Docker's aufs filesystem doesn't support file ioctl operations like FIGETBSZ
or FIEMAP.
Sparse_copy operation will fail if those ioctls are not supported.
If sparse_copy fails while generating wic images, fallback to dd for copying
filesystems on final image.

Signed-off-by: Dogukan Ergun <dogukan.ergun@gmail.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index da1c061..70f93ee 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -577,8 +577,14 @@ class PartitionedImage():
         for part in self.partitions:
             source = part.source_file
             if source:
-                # install source_file contents into a partition
-                sparse_copy(source, self.path, seek=part.start * self.sector_size)
+                try:
+                    # install source_file contents into a partition
+                    sparse_copy(source, self.path, seek=part.start * self.sector_size)
+                except:
+                    # Sparse_copy failed, fallback to dd method
+                    dd_cmd = "dd if=%s of=%s bs=%d seek=%d count=%d conv=notrunc" % \
+                        (source, self.path, self.sector_size, part.start, part.size_sec)
+                    exec_cmd(dd_cmd)
 
                 logger.debug("Installed %s in partition %d, sectors %d-%d, "
                              "size %d sectors", source, part.num, part.start,
-- 
2.7.4


