Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TFPIu-0004yD-BZ
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 14:59:28 +0200
Received: by wgbdq11 with SMTP id dq11so2931233wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2012 05:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=D5QnVPGwS8AZJDOJTb9W3KNUa3UyqZRcsMsLyQBvw2o=;
	b=BRVLdmhPSSoD3nBOVjbpqc26cEAZTiC/TKFg+iviw7HLG7YC9DpmXVpy8ef0Xtrhle
	wHs3v5ljfqfWIigb2tMZ3kFUxdtpDOU64enuz9xRvd/lMHae3LVihq7FhhCySyJy3bcu
	oCUpfcAs3bcxGindhh+tF33NZ7F03Yr5OgmwzgrZVtpxi8YxcgX6LEXOp8EbgaKdayuj
	Ls1ECMz6p1WANPsB4sJ8NyFabU+4FCwzPYdZ6EHJs+JulV3MxHzKREMmhdjVDxXzqQej
	AVNLsfffxnRNkSUjM5TLjK2LcDsN1Odku8DCMvM8Kl3OSqo5Uvc2zvHcTDlkydBcEKCN
	n7Pw==
Received: by 10.216.209.87 with SMTP id r65mr4143402weo.42.1348318003163;
	Sat, 22 Sep 2012 05:46:43 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q4sm3394107wix.9.2012.09.22.05.46.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Sep 2012 05:46:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Sep 2012 14:46:41 +0200
Message-Id: <1348318001-18232-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
Subject: [PATCH] kernel.bbclass: include PE in KERNEL_IMAGE_BASE_NAME
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 22 Sep 2012 12:59:28 -0000

* without this you it's harder to see which kernel is newer version
  e.g. after branch change LOCALCOUNT in SRCPV is reset to 0, so it needs PE bump for upgrade path
  but then it's clear why gitr1+HASH has newer DATETIME then gitrN+HASH, so include PE in name
* using PE not EXTENDPE to sort it correctly even for PE == 1
* it will sort alphabetically wrong in deploy dir for a while until old 
  images are removed

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index fdef1be..e2e365f 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -490,7 +490,7 @@ do_sizecheck() {
 
 addtask sizecheck before do_install after do_compile
 
-KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
+KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
 # Don't include the DATETIME variable in the sstate package signatures
 KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
 KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${MACHINE}"
-- 
1.7.12



