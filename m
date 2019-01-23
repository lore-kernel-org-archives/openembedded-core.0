Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1403E6E493
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 16:17:53 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t27so3153073wra.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 08:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nAqwycNJKV9rbL8nO7ShhzOcnorYrPvemPqYAN/Uf9k=;
	b=hC/HDZCDku9eAodrtsnTHFQOgJiFpZ4l6ySMM0EFjJG7CjqNXYakZK4mNY0mXa5LRz
	fTFKAucpzOvkXDQheMh8NlbljU6EDvFRw2lN9hLuSjc4DRkIJlMmomfDxbLMcRsvmvKN
	06saHdZnnjXSC98L747MYSq9vM2XrkklaP8gTxhc0wJwzv6VpDeLJD2Oxx5UObLGl2ek
	Csa+QdViGwwQ/TdHkWcgH6UosbCnJVubftQhfO+dK8Xc5lwBjQCeqPc+fqnN8xl+8FJr
	KscTo9rEzkUecPJkb0YNdSDn3Mz4O0lRTVlzpV8rdcNjOPxv0YlZzt5UKWfUKBLS9wjc
	TOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nAqwycNJKV9rbL8nO7ShhzOcnorYrPvemPqYAN/Uf9k=;
	b=rTVc0oJn6gG29XYV9il5ShDhUPpzhtgQplwLg477lmIzGewoUkzn5H8ZbPBA179Lf3
	zjZfGhIOAnFhMUA1VEtJ+l7hR4cmrf8dF2A/DuaXdR1lIEQYk13/QvcrrbLO8Ni1vMKz
	VlbVNhFkYz3xXqTI52Yon3dz+h8B0SSmrzZDu+UDv24HJYvIlTL7in8osFirU1zIQEZh
	sCKsPZDCEtdGcPxCx3HJIVRgpSyZGKBFpjwhYFQ0iZPU3uYIEmkxZijrY/IHkAEFe3uZ
	MxjEUHhTuSWHdqKL6rGyOhbUTTrXay7NKJPCjsfFpjIOiZAFS2JCEp6uhzignnz74Xpe
	z1/w==
X-Gm-Message-State: AJcUukeSQRWC8MHJdKHF3lVKXiXtTdF9JJotlvtPdNnERzC5me3MHBKY
	mgmrYkhbw2k+swdvCIFt5G0uQv45
X-Google-Smtp-Source: ALg8bN5WhL0mJhjxWHuMANda/uGRUN/SX+7vpimCk+LofrLB61mE9NOgMTs0j9cf934VlLh7CDUSVA==
X-Received: by 2002:a5d:4fcb:: with SMTP id h11mr3498732wrw.139.1548260274412; 
	Wed, 23 Jan 2019 08:17:54 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j33sm161192189wre.91.2019.01.23.08.17.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jan 2019 08:17:53 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Jan 2019 17:17:37 +0100
Message-Id: <20190123161744.45763-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190123161744.45763-1-alex.kanavin@gmail.com>
References: <20190123161744.45763-1-alex.kanavin@gmail.com>
Subject: [PATCH 03/10] qemuwrapper-cross: check qemu usermode only when building a target package
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
X-List-Received-Date: Wed, 23 Jan 2019 16:17:54 -0000

When building nativesdk- package, MACHINE_FEATURES do not apply as they are
specified only for target machines, not ones hosting the sdk.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
index 06f15617df5..a0448a18039 100644
--- a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
@@ -20,7 +20,7 @@ do_install () {
 #!/bin/sh
 set -x
 
-if [ ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'True', 'False', d)} = False ]; then
+if [ ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'True', 'False', d)} = False -a "${PN}" != "nativesdk-qemuwrapper-cross" ]; then
 	echo "qemuwrapper: qemu usermode is not supported"
 	exit 1
 fi
-- 
2.17.1


