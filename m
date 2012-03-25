Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SBqlQ-00036N-FZ
	for openembedded-core@lists.openembedded.org;
	Sun, 25 Mar 2012 18:57:56 +0200
Received: by pbcum15 with SMTP id um15so4206825pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Mar 2012 09:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=PlSx5ZQYsQYrw7WcsbOHVLzgicTjJfHJ+AeocaAWGY0=;
	b=MtPCAnTi1+SroBPZJ7MJIaOXu3vG2iqsrezV/1CjzUlFsutdbEoLMgZaL9SqRfedgg
	8Loh9qNVwpfoOoBd9LGdxuz/tElk79DqwcCRrjuGTK1fB5MvCx8vn6wO9k82tWO7Wzie
	MEE5vB/LIfCYLhRAwENak/SHnFUQ1niKpadcRZntYjvzv7xuotaDo5z53A4YnPisei66
	7MYKlKZYtLyWfbs4N5ClI+SXO2OnFGckq4Ji9yLMyWo/NtNnwoLc4kwyHuhAkILAnEF7
	+rHln4jX29tqa7xMvv7dxw+9oHxgg6Upoxa2WXGTasTCMytF26oyTj52Vqtio1greMjm
	CWbA==
Received: by 10.68.241.194 with SMTP id wk2mr27028392pbc.131.1332694136859;
	Sun, 25 Mar 2012 09:48:56 -0700 (PDT)
Received: from leto.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id w10sm10538807pbb.20.2012.03.25.09.48.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 25 Mar 2012 09:48:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Mar 2012 09:48:43 -0700
Message-Id: <1332694123-5078-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.1
Subject: [PATCH] tune/armv7: Add -mthumb to TUNE_CCARGS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 25 Mar 2012 16:57:56 -0000

armv7 is least common denominator of armv7-a
armv7-m and armv7-r and armv7-m does not support
ARM instructions but only thumb2 instruction set
which means armv7 when chosen will complain if
code is compiled in arm mode which is default
in OE if not specified other wise

Fixes errors like below

error: target CPU does not support ARM mode

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv7.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv7.inc b/meta/conf/machine/include/arm/arch-armv7.inc
index 33d9f0d..563a6b4 100644
--- a/meta/conf/machine/include/arm/arch-armv7.inc
+++ b/meta/conf/machine/include/arm/arch-armv7.inc
@@ -4,7 +4,7 @@ ARMPKGARCH ?= "armv7"
 
 TUNEVALID[armv7] = "Enable instructions for ARMv7"
 TUNE_CONFLICTS[armv7] = "armv4 armv5 armv6"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7", "-march=armv7", "", d)}"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7", "-march=armv7 -mthumb", "", d)}"
 MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "armv7", ":armv7", "" ,d)}"
 
 require conf/machine/include/arm/arch-armv6.inc
-- 
1.7.9.1



