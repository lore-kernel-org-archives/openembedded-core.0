Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id C121A76099
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 04:23:31 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id v16-v6so3601898wmh.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 21:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=2PLQlgIkCYiNh1DI5ke2u1pr5b9mDs75GkZcJvtbqIk=;
	b=qCdYpXImf7JkeNxKQ9fRCGYNC8sWgA6V0sGgYURaSrGSXaNpSfDn0HU9qrK4HbEBD7
	1pG75jhCFArITwcBoif5m1JijvRchcV/cuM22JgmSzCFC6hC/CdMikIXsNk25waC/Gnf
	av4DHrFC36byDgXr852ACfcW2lU9ML0ruD0xwEZEafVomKH0V3rt/+CJHPsFo12YTEtg
	sITevdKuZEdYP7PCDsYbFN4i7c41mv8L9yOZOXiSd/VAc/Av9UEordEIy8/FHnYg0eKF
	tWbnwGDSCCdnYKzagnrKSlz5Y9UDhnH+4Qo5bpyzcCpypoRHSfS6EYLuF246q9+cwWIP
	EeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2PLQlgIkCYiNh1DI5ke2u1pr5b9mDs75GkZcJvtbqIk=;
	b=ASQoDyx+wWylMfPjsS/Ki3pLrLab2KzUolWFg3LI+hB547DO8EGHPOBssDjlm1Ufcm
	vaYv6Jw4ayg5o2E4uriaOcDGIpXT3oGRkIHvnYEBl3KJD98DZ5NCbupTaBeQrPfxQnra
	KaObqf4HEzWdQ2Q1pJia6TGDaPF+LbtrvNFYW79hI63Jn2dxmspcHLFonbWXzBoxa2dA
	mgVSesehmIjdoDn4s+cKPUqZxl+xLiLcFNxn3jG4/QsQSbwcxIWFOFd3UiPM09ykNGNj
	T77uaykOFJYOAXtaNeN+i+PCGi4ibyL3sNZ/e5t0xy/gJNPnOgYFunqOcVPDKDIWCksC
	R49A==
X-Gm-Message-State: APt69E3UfhMyTXb7WCZMcINy9SNjDe8r12lX+jqSwJoohFbl1ezMJUCY
	LchD4qKJ76jDmnz/vqUtriIe/rUv
X-Google-Smtp-Source: ADUXVKLc8oLC4wj1mPZQEpmAFvdyGG+nbrZrOmFHlJ5Giqc75PvqhfnmIm3fCeSL1nhQbXmDrgCI7g==
X-Received: by 2002:a1c:ec0a:: with SMTP id k10-v6mr296440wmh.4.1529468612301; 
	Tue, 19 Jun 2018 21:23:32 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	n21-v6sm1008955wmc.42.2018.06.19.21.23.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Jun 2018 21:23:31 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2018 04:23:19 +0000
Message-Id: <1529468599-21530-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] kernel-fitimage: Make DTB key insertion optional
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
X-List-Received-Date: Wed, 20 Jun 2018 04:23:32 -0000

If UBOOT_DTB_BINARY is empty, then don't try inserting the U-Boot
signing keys into the DTB. In this configuration the keys are expected
to be already present in U-Boot's DTB.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/classes/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index f84be44..db79e96 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -459,7 +459,7 @@ fitimage_assemble() {
 		uboot-mkimage \
 			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
 			-F -k "${UBOOT_SIGN_KEYDIR}" \
-			-K "${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_BINARY}" \
+			${@'-K "${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_BINARY}"' if len('${UBOOT_DTB_BINARY}') else ''} \
 			-r arch/${ARCH}/boot/${2}
 	fi
 }
-- 
2.7.4


