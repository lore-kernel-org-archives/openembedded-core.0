Return-Path: <paul.betafive@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id F034272A85
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 17:31:39 +0000 (UTC)
Received: by wicmx19 with SMTP id mx19so106626659wic.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 May 2015 10:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=9BlczNR9oqx92aCE8Sk5sn0FPwGIEKAZ+K518+dfONQ=;
	b=PMSYh0OZHiGJ9pqGsgt0am0cMFQ4o/4r/iYBIVMzluUzohPqZambbMAAUAmSvG6lJD
	cGPOxud2lGRXN5qlUPaosmeT6jyc9D+55WxOoE4jThUPOX5fpm8ddAzQRLHeS2VAJ4hG
	pN0mlTn6DCJjC0xnCj3dOxEiQEnnk2mDbjyPNF5d/+8hQGYHmS2nPFKzQImwf/SDsNtR
	1TfzkHgZsFNq3jzFrzMuCk+z3HBbWfoodGO7zNjGwXq0lMtUApTBd6ccQqvy6EY2T6aG
	c1JRyFz/a+JGGUhbDJWv9rnIa3Z/Y1APfCdXCQ71iOpikzA4V5EkjgvGwjL/2YW6PQET
	0Qrw==
X-Received: by 10.180.37.73 with SMTP id w9mr185439wij.7.1430847100427;
	Tue, 05 May 2015 10:31:40 -0700 (PDT)
Received: from bang.betafive.co.uk
	(cpc19-shep11-2-0-cust55.8-3.cable.virginm.net. [81.111.243.56])
	by mx.google.com with ESMTPSA id
	fs9sm26575864wjc.34.2015.05.05.10.31.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 May 2015 10:31:39 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 May 2015 18:33:01 +0100
Message-Id: <1430847181-11913-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.9.1
Cc: Paul Barker <paul.barker@commagility.com>
Subject: [dylan][PATCH] kernel.bbclass: Complete fix for modules symlink
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
X-List-Received-Date: Tue, 05 May 2015 17:31:40 -0000

From: Paul Barker <paul.barker@commagility.com>

The fix backported in commit aa9fc551 of oe-core does not completely fix the
issue (Yocto #4595) as intended. The modules symlink is still created in the
working directory instead of in the deploy directory. To fix this, we just need
to use an absolute path to ${DEPLOYDIR} when creating the symlink.

Signed-off-by: Paul Barker <paul.barker@commagility.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 324e812..67b662a 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -372,7 +372,7 @@ kernel_do_deploy() {
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		mkdir -p ${D}/lib
 		tar -cvzf ${DEPLOYDIR}/${MODULE_TARBALL_BASE_NAME} -C ${D} lib
-		ln -sf ${MODULE_TARBALL_BASE_NAME} ${MODULE_TARBALL_SYMLINK_NAME}
+		ln -sf ${MODULE_TARBALL_BASE_NAME} ${DEPLOYDIR}/${MODULE_TARBALL_SYMLINK_NAME}
 	fi
 
 	cd ${DEPLOYDIR}
-- 
1.9.1


