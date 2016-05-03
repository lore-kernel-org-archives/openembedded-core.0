Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id B67AA6012C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 20:20:43 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id w143so5670903wmw.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2016 13:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=+5YY08vQ4QRffR+stA7KCzyiw3u14dieSP7trRceggg=;
	b=LoECYi6EA59ZUZG1Z/5DOjk3wJfUugG0SK8/vUivWtZSlb2vVD1fGO42WXD1wfTm3z
	v9BMC7ZYl5LmS8xG/JI0SVOEmRYGPFsyDTZytWGP2mc/bNGu4Wqd9kuDhSxWjnRpVW5f
	KgplAq79WzDYIQMCQVx2EVKVBOqwM+YCSKgd1gRy4J5MXbH4rrGva2frs7Qv3sFkWw9/
	tAH8cscGw7wLQqKI0Ax13BJu+dV4lrRUYkxnnO6Jkit7qKceFffruPzlvE/mg1xYVuVC
	eA+1vqAt2Lvwb07Q8BoRYTncyBFOhM68MyvrUG4jcWOj9pQ48N3jD9CheGos/zB0+89J
	Zojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+5YY08vQ4QRffR+stA7KCzyiw3u14dieSP7trRceggg=;
	b=cAl9Y04xMo74yEN5FtqsWvnqjhP/RXKpQTLwf7dAeLsHA4rOQ0hA/X85UPmyt8vJqo
	ypLLUC0uKpZt0DEagxl1QmW2g8a6TzR/CFSkniggCVKdEC3/MmHZQBFGxhXnlIh6iBKA
	rw0uF/v9DZvYTMbdyskZGC4X8fIPuEUbeS5S1jYH325hnfsE7FoQj7hyUjzCf8EI5lfA
	Ll6qYRj8mzq/z7OPBF6a6qnFjXzoHCAimoGSURrsAAuhZPr5SOfKO9eUwz6M6cMOyhhq
	oppQIdkiEbtYRHgGlxTcBpIg/UJPvRmquQDbKa9/cPqnSn1J1xfjBSKTM6AFwcS85EK0
	lsMQ==
X-Gm-Message-State: AOPr4FVuJSW52NEsq7a1VfaKsMeaIpz2GI/HJFX3FL/vpvKl5qfgEKIxnzLtgLG1iM1w9Q==
X-Received: by 10.28.215.197 with SMTP id o188mr5563752wmg.14.1462306843772;
	Tue, 03 May 2016 13:20:43 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id w3sm208092wjt.0.2016.05.03.13.20.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 May 2016 13:20:41 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 May 2016 13:20:35 -0700
Message-Id: <1462306835-2864-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] image-live.bbclass: make the INITRD optional
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
X-List-Received-Date: Tue, 03 May 2016 20:20:48 -0000

From: Christopher Larson <chris_larson@mentor.com>

This aligns with image-vm, and makes sense for wic bootimg-efi images, which
don't actually want any of the live installer bits.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/image-live.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index c8a8610..ea6ced2 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -56,7 +56,7 @@ python() {
     if image_b == initrd_i:
         bb.error('INITRD_IMAGE_LIVE %s cannot use image live, hddimg or iso.' % initrd_i)
         bb.fatal('Check IMAGE_FSTYPES and INITRAMFS_FSTYPES settings.')
-    else:
+    elif initrd_i:
         d.appendVarFlag('do_bootimg', 'depends', ' %s:do_image_complete' % initrd_i)
 }
 
-- 
2.8.0


