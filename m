Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1B1A3786DD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Feb 2018 16:30:44 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id e11so5272605pgq.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Feb 2018 08:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BQQ4CwSOkUFI+G6tBESV/kShIy5eTFhplt23J8/6njQ=;
	b=rD6INrtKZurJzu4QpdGI3bxhsjJ/0h9YHdAJblaYB6p5w+ziNbRPsczKyYbv4Z/RfN
	v/0zo28YEa1KKXVMhQEb+SKl0/8KCvcUe+K/Azsr6cnfj6He6biowjdaFMnmC3w7IGr7
	3tXkP7Fy6UJOPpkhEoekWTBK0i7CvmOp7M63o9xv6txjRPlqfJtkWPk/anS83C1pG/uK
	iJ53hG3zxJKXcdYj/gWvFBH3z5uXP3GEfYV64icUQnO81U7BcI6PxtYptzpD2IF80Q6W
	Bq56Mca0ok2hMbnBqp/mzh7Rob0rCZZRgY8FDjDr8wgCM1lszHkD0qj+DAGuKIewnEBW
	w0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BQQ4CwSOkUFI+G6tBESV/kShIy5eTFhplt23J8/6njQ=;
	b=E6lLmYbXcGCpZhlqiURS8aDa4NZGBBShUflf+60ohzBCW6sMptn8TqNpfDlsPdSN34
	MAWHQkyfUpbL43LCpRF+iqi/hAcxxWynT/YZFAAZgJUeDCYfT1EkH/EaFqt7o9xcerea
	FvMFO1aBoxPjNqbHv554BKe3ZIl22HDqqFL0KAE6/DUufrvA2Lv/yBr+0GKbphNy4iic
	1rOw8XSa0YgSKcW0qsi9P/O/ectMmS506wlsk3Pw1Uvp3I8huMIx0i1cf/oYNfttb3jc
	dTNJ7f8UMDhsBTWtQ3w1aiylEFQSJcFLT0otSyDCsAku4RLNnq02y47c2qP3EdUrg1Bi
	neew==
X-Gm-Message-State: APf1xPBas5/mjn5U2U6f3BWij6v7aqFqQLofh0Txh44kaHeN048uuNEO
	qdE0plj2Zmgw8SrJeoCdmArL5w==
X-Google-Smtp-Source: AH8x227XMFJg3Rj/jeopcmHpwBZ72DQOHSW1KFTi47Scrmt60899Xp19XytvdI9u8LF1pWq1fnV0Rg==
X-Received: by 10.101.73.141 with SMTP id r13mr6306054pgs.161.1519576246109;
	Sun, 25 Feb 2018 08:30:46 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	z25sm14448876pfe.0.2018.02.25.08.30.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 08:30:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 25 Feb 2018 08:30:44 -0800
Message-Id: <1519576244-7238-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [pyro][PATCH] ovmf-native: fix compile issue on new OS like FC27 and Ubuntu 17
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
X-List-Received-Date: Sun, 25 Feb 2018 16:30:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixed this error:
| VfrUtilityLib.cpp:3375:26: error: ISO C++ forbids comparison between
pointer and integer [-fpermissive]
|    if (mStringFileName == '\0' ) {
|                           ^~~~
| VfrUtilityLib.cpp:3398:9: warning: ignoring return value of ‘size_t
fread(void*, size_t, size_t, FILE*)’, declared with attribute
warn_unused_result [-Wunused-result]
|    fread ((char *)StringPtr, sizeof (UINT8), Length, pInFile);
|    ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../Makefiles/footer.makefile:30: recipe for target 'VfrUtilityLib.o'
failed

[Yocto #12530]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...fix-invalid-comparison-between-pointer-an.patch | 32 ++++++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb                 |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-VfrCompile-fix-invalid-comparison-between-pointer-an.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0001-VfrCompile-fix-invalid-comparison-between-pointer-an.patch b/meta/recipes-core/ovmf/ovmf/0001-VfrCompile-fix-invalid-comparison-between-pointer-an.patch
new file mode 100644
index 0000000..43bfce4
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0001-VfrCompile-fix-invalid-comparison-between-pointer-an.patch
@@ -0,0 +1,32 @@
+From d37fa01fbbe2cf0cd8b49069a71706a33cb4a53e Mon Sep 17 00:00:00 2001
+From: Paolo Bonzini <pbonzini@redhat.com>
+Date: Mon, 13 Feb 2017 20:54:00 +0800
+Subject: [PATCH] VfrCompile: fix invalid comparison between pointer and
+ integer
+
+This would be valid C but is not valid C++, so change the comparison to do what it has always been doing.
+
+Contributed-under: TianoCore Contribution Agreement 1.0
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+Reviewed-by: Yonghong Zhu <yonghong.zhu@intel.com>
+
+Upstream-Status: Backport
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
+---
+ BaseTools/Source/C/VfrCompile/VfrUtilityLib.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: git/BaseTools/Source/C/VfrCompile/VfrUtilityLib.cpp
+===================================================================
+--- git.orig/BaseTools/Source/C/VfrCompile/VfrUtilityLib.cpp
++++ git/BaseTools/Source/C/VfrCompile/VfrUtilityLib.cpp
+@@ -3372,7 +3372,7 @@ CVfrStringDB::GetVarStoreNameFormStringI
+   UINT8       BlockType;
+   EFI_HII_STRING_PACKAGE_HDR *PkgHeader;
+   
+-  if (mStringFileName == '\0' ) {
++  if (mStringFileName == NULL) {
+     return NULL;
+   }
+ 
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 9d988e9..4ddfb47 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/tianocore/edk2.git;branch=master \
 	file://0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch \
 	file://VfrCompile-increase-path-length-limit.patch \
         file://0001-MdeModulePkg-UefiHiiLib-Fix-incorrect-comparison-exp.patch \
+        file://0001-VfrCompile-fix-invalid-comparison-between-pointer-an.patch \
         "
 
 SRC_URI_append_class-target = " \
-- 
2.7.4


