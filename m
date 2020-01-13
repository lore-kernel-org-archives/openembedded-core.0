Return-Path: <liu.ming50@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id F3B097F491
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 21:21:38 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id w1so11803352ljh.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 13:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=N2zcdrlswN2S3r4GlhhRP8aXX0dPVtDfGP6W7bvVFTc=;
	b=vJkiizEJdSBhmfNpvpGLcGRhmIJKJ2R4/7iNBsAUlJ295kTWkb0B4HcYBwMeA6RR97
	Knp1/+r1nv1VPiO4ByOu3aSXHnQk5wnxfHUHzR2RqHja5IdsUiZo/EGJp1seNHgGydgq
	p+hnQJpDi/agPjAPOXlqz+yAMqCbCaTm/HhhWe28ss+GMZUFMhVDDLpvnXvhotIYcjSo
	q//4s5y7B8iuyi+l7E3U/NLLwGwYFvzfpgYYI9RdRQZDwM7VGFQ7deSmXUu/SlvhT02K
	NtIV+Z4W+h1sZx1IhQgLTxU7YfCYYlFE9tEAlfGH5+s/GU3BigRvM0ul0uKBqTf85UGw
	eChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=N2zcdrlswN2S3r4GlhhRP8aXX0dPVtDfGP6W7bvVFTc=;
	b=SKnonUg2kF8aCZV2RdIjvh4AXsWh/6N12bNjlpEhLYL0TpKtM8yYaMY+trO+uSJwg/
	iAUQG/Uesz/BkLVhXSnz/QmqyBbCbLqrAbxxpAJB/VvZYzjMEMUAngiv3qj00lgasxc+
	Bxx+mUfFkUIrTYEiybFz70ps7QCfMUudu3WQKvn1sOSJaL+sk0dccdx4IT7FGEhVkprd
	OCxC1IHmydKh8vQOCBFkW7mG/gvcThzNY0f59vF4152ciyXpnQgV/AAGcQLOjU+77jwC
	xnnemsXPdzlRvWSR6Wrvum0WtRIXT2RjYPJzRBR4yF+eiA0T2oekXJIvTRtmz6JUgLtE
	gxCw==
X-Gm-Message-State: APjAAAVnxBgRNaonL+zYeJ3T/kQ539Zy6AeBGIBxnfqzYSNn5bUF/n3x
	GJfuXX7Y69E7BrR8aROVg/Nd+/eLrH8=
X-Google-Smtp-Source: APXvYqyo2Ac7f3HkfWCTgB5Jig7z2VvatWrInyQGu4P8c1D6UvT5Vf/hR73ToJlhYxxZRyGrutplFQ==
X-Received: by 2002:a2e:808a:: with SMTP id i10mr12296058ljg.151.1578950499363;
	Mon, 13 Jan 2020 13:21:39 -0800 (PST)
Received: from peterliu-Precision-7530.lan
	(c-75fd72d5.022-417-73746f13.bbcust.telenor.se. [213.114.253.117])
	by smtp.gmail.com with ESMTPSA id
	g15sm6451338ljl.10.2020.01.13.13.21.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Jan 2020 13:21:38 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jan 2020 22:21:31 +0100
Message-Id: <1578950491-6819-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] kernel-fitimage: avoid duplicated items in KERNEL_IMAGETYPE_FOR_MAKE
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
X-List-Received-Date: Mon, 13 Jan 2020 21:21:39 -0000

From: Ming Liu <liu.ming50@gmail.com>

When replacementtype is already in KERNEL_IMAGETYPE_FOR_MAKE, we do not
have to replace fitImage with it again, that will lead to duplicated
items in KERNEL_IMAGETYPE_FOR_MAKE.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/kernel-fitimage.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index ec18a3d..acdd679 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -25,8 +25,12 @@ python __anonymous () {
         # to kernel.bbclass . We have to override it, since we pack zImage
         # (at least for now) into the fitImage .
         typeformake = d.getVar("KERNEL_IMAGETYPE_FOR_MAKE") or ""
-        if 'fitImage' in typeformake.split():
-            d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake.replace('fitImage', replacementtype))
+        typeformakelist = typeformake.split()
+        if 'fitImage' in typeformakelist:
+            if replacementtype in typeformakelist:
+                d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake.replace('fitImage', ''))
+            else:
+                d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake.replace('fitImage', replacementtype))
 
         image = d.getVar('INITRAMFS_IMAGE')
         if image:
-- 
2.7.4


