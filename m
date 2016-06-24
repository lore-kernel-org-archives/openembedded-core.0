Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 636CF65CBB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 10:58:32 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 187so4028497wmz.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 03:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hxDg9bgvT9cIxl7OTOyPW1jCt2VnI1B1NauS6YT/sVE=;
	b=U6wLmm+6p/8oNxTSRPGmJ28DVwk5npgApFIQ0nZDuLpK8BijNR6j9EF9Vt082rNxN7
	MEomtuWyl61SJIzqznEpAbw3pJl4Whl2Ni6yXU77wM88H0nGvVFQxB6opJBLvc1zU2ad
	Y9TA+65My1z1yF0B+DErMDhsTVMwiYMfA82p0HWHitcFiseA4chutu+rq8gkK+p9wTk0
	FELbdOT/Rvlz+xozDDOEcY9d+ZAPcnkp0kVc3WhKseK2Bk2cBfSZKoxL6bYwYQm1XeA2
	Ek4ajnGxztLOtWPBxkjp0vwa5AlTnEjyruprhNrI2KzHdNoP7B1SHcqhkIQ+wukVFgGh
	J6yg==
X-Gm-Message-State: ALyK8tIBoK8NNCtRkl4aJls7r6FRqd29SsoRcuFC4u+/h+wOI4Lrmb7Qy756yzl1XqLc4w==
X-Received: by 10.28.145.68 with SMTP id t65mr17444903wmd.31.1466765912498;
	Fri, 24 Jun 2016 03:58:32 -0700 (PDT)
Received: from tfsielt31850.TYCOFS.COM ([185.46.212.65])
	by smtp.gmail.com with ESMTPSA id q69sm2574157wmd.4.2016.06.24.03.58.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Jun 2016 03:58:31 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 11:58:27 +0100
Message-Id: <1466765910-22989-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 1/4] gmp: don't compile in mips16e mode
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
X-List-Received-Date: Fri, 24 Jun 2016 10:58:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

gmp contains hand-written assembly which is not compatible with
the MIPS16e mode.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/recipes-support/gmp/gmp_6.1.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/gmp/gmp_6.1.0.bb b/meta/recipes-support/gmp/gmp_6.1.0.bb
index de827f5..9acf5cf 100644
--- a/meta/recipes-support/gmp/gmp_6.1.0.bb
+++ b/meta/recipes-support/gmp/gmp_6.1.0.bb
@@ -30,4 +30,8 @@ do_install_append_class-target() {
 
 SSTATE_SCAN_FILES += "gmp.h"
 
+# Doesn't compile in MIPS16e mode due to use of hand-written
+# assembly
+MIPS_INSTRUCTION_SET = "mips"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.8.1


