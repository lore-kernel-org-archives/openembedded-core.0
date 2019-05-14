Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4683A7DF20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 04:54:19 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id z3so7940352pgp.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 21:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=mXus7KMAxucBCQTMlNdc+Upz/Rh7hnH8B+T77+X8ZX8=;
	b=SS0lRMt4FamBDhZgpKFolOm/ffM/YGLHiwFFBAhroS+9fJoyb6mm3tlvSFcGS3AtQ0
	zcp0l87m8TjYU7uWT6ofa8UpwsvI2fGO1TAO1HjFZJCK813GMv7++GCf0TDHssyAh4HJ
	DBfPxVd7fIu4PcGyUBpReMkeFPjzQQ7LOQNKySHzYgzmOdgpRAfF5wLCIRlBHlJPlHp6
	DB+8kXGIsyOp3qIbDuAc1I02knRpDbsM9C0PKFXdauhoFFtJDte55z560ea/pizsy/TM
	H0w1qf4FaW4a66aC6PqIxyzsi/Y1hEm266dhka4Kt9DfIzaE8hTzlVx6XLV02X/D6Vws
	A0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=mXus7KMAxucBCQTMlNdc+Upz/Rh7hnH8B+T77+X8ZX8=;
	b=btqYM/ZK3pCQm82Sb8cSfXRcSI4wFtn4UYkP4bf+aVTFUmCwaokMo+7njgnQyBrXJB
	Wu5dZnsEF6QPgH1cywQxe/zTFynssHHdqWIOLPKK6451yOoQxf/G7tlvaklrpTbylImN
	dGGzuozuyxczAdE/spw5eU2dG5+XCT0HEjj18RvBovT8OLt65B9B7I9hIf/D0t5OjWcK
	8ztJL4J2/S3R/hihQnKS5km5P/oerWOYeLbBJy0Sax1KyuZ9vAxAcDjhg/tuFDtrIcg3
	GjKVgmZYvoVMtPzeyOZEHSvBQWG2hC/LprcECodrK2bHd5S8PcjGBoXFNCiNT30eT5XY
	eUxw==
X-Gm-Message-State: APjAAAVCDThtx/f0zGpUe+q6xEVrFVX59LvY0xRL2/mTQXnvSeJ7OjoY
	wdUjYRuiFcJEm+3uXoHz1oaIkoa2
X-Google-Smtp-Source: APXvYqyyzIoXgRypjuQay7spwTp1Iv23VEKkcqHIELDaFTU8OxZ0kFsfRGn+d0oaBNVl+kyLkEzZGw==
X-Received: by 2002:a63:8342:: with SMTP id h63mr36773094pge.251.1557809660483;
	Mon, 13 May 2019 21:54:20 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:d909:eb3d:d2ab:fd1d])
	by smtp.gmail.com with ESMTPSA id
	q75sm5698451pfa.175.2019.05.13.21.54.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 May 2019 21:54:19 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2019 21:53:55 -0700
Message-Id: <5979289d5f306d37fe5c8ed994bb833f2492ef32.1557809500.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1557809500.git.akuster808@gmail.com>
References: <cover.1557809500.git.akuster808@gmail.com>
Subject: [PATCH 13/23] uboot-sign: Fix u-boot-nodtb symlinks
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
X-List-Received-Date: Tue, 14 May 2019 04:54:19 -0000

From: "Ying-Chun Liu (PaulLiu)" <paulliu@debian.org>

When using u-boot-nodtb, the symlink didn't install correctly to the
${DEPLOYDIR}. This commit fixes this bug.

Signed-off-by: Ying-Chun Liu (PaulLiu) <paulliu@debian.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/uboot-sign.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index 6385a06..8beafff 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -53,8 +53,8 @@ concat_dtb_helper() {
 
 	if [ -f "${UBOOT_NODTB_BINARY}" ]; then
 		install ${UBOOT_NODTB_BINARY} ${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}
-		ln -sf ${UBOOT_NODTB_IMAGE} ${UBOOT_NODTB_SYMLINK}
-		ln -sf ${UBOOT_NODTB_IMAGE} ${UBOOT_NODTB_BINARY}
+		ln -sf ${UBOOT_NODTB_IMAGE} ${DEPLOYDIR}/${UBOOT_NODTB_SYMLINK}
+		ln -sf ${UBOOT_NODTB_IMAGE} ${DEPLOYDIR}/${UBOOT_NODTB_BINARY}
 	fi
 
 	# Concatenate U-Boot w/o DTB & DTB with public key
-- 
2.7.4


