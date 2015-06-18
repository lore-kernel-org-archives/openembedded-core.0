Return-Path: <dbaryshkov@gmail.com>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 95831601DF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 13:13:25 +0000 (UTC)
Received: by labbc20 with SMTP id bc20so54099835lab.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 06:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=YVc/rtxGqt8sQ13O6lwSMrjYysSsFyS/YhZO7D//cYw=;
	b=fdmhu80BdylffsI/kmdjH08dkkaDw9hTzOkPY0PRdBtOvaLtf+pqh1MWH5edPqOBox
	UyUNy0FvhhkL82sN6m/xy6llqhsIq8HFRHqgk2cBrt4uWekMNOE6Jh8PaeT8EPKPGZDD
	vlV0rIlDRv6PBROeV5Z9mGeAeqEGqh0S1HMWWIob4dyF0TeDPF398UdACcmqMLQwDgqt
	C+zJ/OVNfh119lp6ScZcZX9ywfeE/fAgXB71y24BGNDyTdlfLVVMWEebM0l9fcTqYk4o
	JYQ1vf2EMVWUd1UwJozm+wq89R1mIwtcQ9E+I/hluTr3N8Y8agRX6cht7C/ERLG1jNCN
	z5Ig==
X-Received: by 10.112.185.100 with SMTP id fb4mr12973320lbc.79.1434633206487; 
	Thu, 18 Jun 2015 06:13:26 -0700 (PDT)
Received: from anuminas.rup.mentorg.com
	(ppp89-110-12-206.pppoe.avangarddsl.ru. [89.110.12.206])
	by mx.google.com with ESMTPSA id ja1sm1770636lbc.38.2015.06.18.06.13.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 Jun 2015 06:13:24 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jun 2015 16:13:06 +0300
Message-Id: <1434633188-3434-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/3] arch-mips.inc: don't override TRANSLATED_TARGET_ARCH
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
X-List-Received-Date: Thu, 18 Jun 2015 13:13:27 -0000

Currently MIPS64 N32 is broken. There is internal disagreement
between TARGET_ARCH (which doesn't contain ABIEXTENSION) and
TRANSLATED_TARGET_ARCH (which contains ABIEXTENSION). ABI is already
encoded into the TARGET_OS. ARM tunes in the same situation override
neither the TARGET_ARCH nor the TRANSLATED_TARGET_ARCH. So let's drop
this override.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/conf/machine/include/mips/arch-mips.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
index c41fa5e..02626d3 100644
--- a/meta/conf/machine/include/mips/arch-mips.inc
+++ b/meta/conf/machine/include/mips/arch-mips.inc
@@ -100,7 +100,3 @@ TUNE_FEATURES_tune-mips64el-nf = "n64"
 BASE_LIB_tune-mips64el-nf = "lib64"
 MIPSPKGSFX_VARIANT_tune-mips64el-nf = "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS_tune-mips64el-nf = "mips64el-nf"
-
-# On mips we need to redefine this to include the ABIEXTENSION
-# we can avoid the python bit as there are no _ or - to translate
-TRANSLATED_TARGET_ARCH = "${TARGET_ARCH}${ABIEXTENSION}"
-- 
2.1.4


