Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8703D601A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 09:31:25 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id z129so31643617wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 02:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=0X6Hn/v2LPuJasu9cyn7EREgstc56tp1cCLWhaLV/Gk=;
	b=uw6vcjzFuI+4XfRgHih7QVVT74UsoEad97wi+8gA6DrZiU4RMX3jauazDTy4EiQSN+
	A7uIMESKSvkSMRvKOcb7u5IdskBWcTWeX0VjRnVhfTwe0w7iZ8DWcdwBdLSZ/z1rRYoq
	ugi0KPiZvVMDDD+FQco0MuH7Z8qAK/liYvkV2zPcSWI2TRycrh46jS47pZ7MSaEF6EQX
	oPmV1PO0cEruzd58jY0KUEJeazz/dK4oYzwtT1q73dVYax6GL/j2kjAcglZVJK3yzqze
	T6TitazIlU+k8Lu3ZNFvhZQ7fEB3hGkI7jNsvn/uZprjM36DPVia2yQcprZJnUtCn4lv
	IAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0X6Hn/v2LPuJasu9cyn7EREgstc56tp1cCLWhaLV/Gk=;
	b=qkv0391KpPrMwoBsgbCtirr5MzqONl8gZwUPR0vvKu1+6NkURAlDlGVwZyMqqaOw6p
	w0e0wJri4MF1s+gUBJLsjXWGwPH1x75H8YrEc1MNesASrDZjCu4zo5QH3hZOKIYWhdUc
	984VpU7sCv1EuuNzR1rFYXdzS/Nfo9LH52FrJc+/hbr4Jc8YA7Rvqwn9QlAOtRZhQsIM
	B/0ydF7deyLezdtXq8m7VTbUvj/HhCokIjji6DZmcfmoY6wZ4A1iL6aMXHKIudEg1+aK
	79h/w0916K1JpTFaBcckh4+ZeUY3BI0qqnpumiZhv3hvNENs+A+tKwedlGl2Ioi/4RS2
	wVJw==
X-Gm-Message-State: AN3rC/54Iku7JrthhN4YDdatOfYUJDpwZI6KjB5H74HmkU5BRO7efeUa
	dKKsnGnELGa7UA==
X-Received: by 10.28.54.7 with SMTP id d7mr4650248wma.114.1493199086239;
	Wed, 26 Apr 2017 02:31:26 -0700 (PDT)
Received: from crde-port-20.cahors.local ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	y190sm5709969wmy.15.2017.04.26.02.31.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Apr 2017 02:31:25 -0700 (PDT)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Apr 2017 11:30:39 +0200
Message-Id: <20170426093039.16450-1-freesilicon@gmail.com>
X-Mailer: git-send-email 2.12.2
Subject: [PATCH] image.bbclass: Set ROOTFS_RO_UNNEEDED correctly
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
X-List-Received-Date: Wed, 26 Apr 2017 09:31:26 -0000

Use a weak assignment for ROOTFS_RO_UNNEEDED to let users define their
own list overriding defaults.

Signed-off-by: David Vincent <freesilicon@gmail.com>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 405fd73c04..58cd608d14 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -33,7 +33,7 @@ ROOTFS_BOOTSTRAP_INSTALL = "run-postinsts"
 
 # These packages will be removed from a read-only rootfs after all other
 # packages have been installed
-ROOTFS_RO_UNNEEDED = "update-rc.d base-passwd shadow ${VIRTUAL-RUNTIME_update-alternatives} ${ROOTFS_BOOTSTRAP_INSTALL}"
+ROOTFS_RO_UNNEEDED ??= "update-rc.d base-passwd shadow ${VIRTUAL-RUNTIME_update-alternatives} ${ROOTFS_BOOTSTRAP_INSTALL}"
 
 # packages to install from features
 FEATURE_INSTALL = "${@' '.join(oe.packagegroup.required_packages(oe.data.typed_value('IMAGE_FEATURES', d), d))}"
-- 
2.12.2


