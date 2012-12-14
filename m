Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tjf6R-0003ny-7l
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Dec 2012 00:55:47 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so2485906pad.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 15:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=IPmOeDI0wK1AYxS7L+WmdjGybfcIG44XTXqOCvO8G8k=;
	b=A9KFnarpVki8RTgoSldMJB0b/2baM+dM6M+xp/WNS12WBW1qUnYaoUyXGcPLmjdzOJ
	J46piRXBwIXLck1JckR58tGSV2auWd3QqBJ1Sj8fX2KpUkN6k69F2g6uwTvjug4Afu9q
	/m0jYIlcJyOwWFYHoRQ/wqO5oBb77NTZobMJRwgwjuAvNT5YBe58mPb+goyMvrsdCTmy
	liNMMDwn27C0tdxJnOzBxQCyfvB0TdiGoxhf5JsXmOS90HSHLojYjFBJlZkp8CCEhXNf
	rxx4TqmveJrc+NB2DIEdsGGPdNn9Qo3jbFoALQnphP2kpeoNbX+kexQKOHjOZ3Pwl7Z3
	ot8A==
Received: by 10.68.233.196 with SMTP id ty4mr20374415pbc.23.1355528461801;
	Fri, 14 Dec 2012 15:41:01 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id gv9sm3675238pbc.21.2012.12.14.15.40.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 15:41:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Dec 2012 00:40:43 +0100
Message-Id: <0c1b701becb70a8e3f784a39c86bb026fc5cecc6.1355475937.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355475937.git.Martin.Jansa@gmail.com>
References: <cover.1355475937.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355475937.git.Martin.Jansa@gmail.com>
References: <cover.1355475937.git.Martin.Jansa@gmail.com>
Subject: [PATCH 05/10] kernel.bbclass: include PE in KERNEL_IMAGE_BASE_NAME
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
X-List-Received-Date: Fri, 14 Dec 2012 23:55:49 -0000

* without this you it's harder to see which kernel is newer version
  e.g. after branch change LOCALCOUNT in SRCPV is reset to 0, so it needs PE bump for upgrade path
  but then it's clear why gitr1+HASH has newer DATETIME then gitrN+HASH, so include PE in name
* it will sort alphabetically wrong in deploy dir for a while until old images are removed

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 8e13662..ee59aaf 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -493,7 +493,7 @@ do_sizecheck() {
 
 addtask sizecheck before do_install after do_compile
 
-KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
+KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
 # Don't include the DATETIME variable in the sstate package signatures
 KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
 KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${MACHINE}"
-- 
1.8.0.2



