Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 053F975082
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 20:24:25 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id a22so12081704pfn.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 13:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=/QfBBneGn71npxKpBC8dFk7/MldPV31lAoDx1mt9gxQ=;
	b=pVHY4B4ZIZSgzY77au83PCeq78AYMIudL7D96PjgtBe7zRPx+kVpBrC3fy5+lv74dV
	Y5Y4so1PVdW2lxkrBUKIDA9GKo4K2/y0vErd0H1iGA6VNpFw7XuiBGQIZOgWq40RywIW
	hpDxrDIUJ2p//m9bc6nrgYHS9dlTV2gYyerPSXUrf6ak9NWMeB4dpqsm0VATFw3GK57E
	y6kAtvaag662Qh6H/7cyZ6EayYyDiAx+j1Xp5tjDXCedVtz4HtTWbizt0m9Jjm4MEjov
	FL01aie491dqZ4fe7VKFdpvtVBbu6AbDfQu/QC97S7L3SzTmiKqqVDQk+91U66Tf0iT1
	VOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/QfBBneGn71npxKpBC8dFk7/MldPV31lAoDx1mt9gxQ=;
	b=XWi2zArFdLkn6uJ9iHuWGtWr1ayTH87S+E0DMnb11jvCPmBXduO68uRy70IlfFcZ6/
	KQ6fJw3yihe02v8SUiC0XgsdncUtC6inCbWhJUWSraKsJZkBFMVuJ8jGhjrxEePSlK6c
	Z+fmu2nOy5ad26IDYwMNRhi89FBK8CWNw8eD0ui5BCUF0qKzMbOZK1sQVOG7BnlfQvDy
	CGiX3ETOzJ8zyn+MWWQBDlTjau557Y1T/nco5BI7wOXXQhcxkQCwkBnYdkzCr22PfvLX
	BDZpTYoVeDzx1lQkVphM8HOBcwuWd6t6HOc/xBSxFcj6gCOEmdSi6w82Q+lM9aX5Tsd2
	+vpQ==
X-Gm-Message-State: ALQs6tCUEGiQOKbMY0St4r0DsMoGq/cNu46TWXZQ2hdK585q+xHvyvWF
	R6BRnzQ9/Edmb3mmBF87h/auhg==
X-Google-Smtp-Source: AB8JxZpfgFQ3ldAjvSsmT/8/CjcZpb8bZ4Gdst+kDfu6w6ncSANW7c9Lquv5lYg1JtdikAWNbcInQw==
X-Received: by 2002:a63:3688:: with SMTP id
	d130-v6mr36788680pga.228.1525897466513; 
	Wed, 09 May 2018 13:24:26 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	x124sm2142222pfx.72.2018.05.09.13.24.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 May 2018 13:24:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2018 13:24:14 -0700
Message-Id: <20180509202422.22501-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH 1/9] pbzip2: Fix C++11 warnings found with clang
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
X-List-Received-Date: Wed, 09 May 2018 20:24:26 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...valid-suffix-on-literal-C-11-warning.patch | 73 +++++++++++++++++++
 meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb |  4 +-
 2 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/pbzip2/pbzip2/0001-pbzip2-Fix-invalid-suffix-on-literal-C-11-warning.patch

diff --git a/meta/recipes-extended/pbzip2/pbzip2/0001-pbzip2-Fix-invalid-suffix-on-literal-C-11-warning.patch b/meta/recipes-extended/pbzip2/pbzip2/0001-pbzip2-Fix-invalid-suffix-on-literal-C-11-warning.patch
new file mode 100644
index 0000000000..8fc377c31b
--- /dev/null
+++ b/meta/recipes-extended/pbzip2/pbzip2/0001-pbzip2-Fix-invalid-suffix-on-literal-C-11-warning.patch
@@ -0,0 +1,73 @@
+From de4a948d356c9befb88c796168e97eb05b9a3385 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 23 Apr 2018 22:54:42 -0700
+Subject: [PATCH] pbzip2: Fix invalid suffix on literal C++11 warning
+
+Fixes -Wreserved-user-defined-literal] errors.
+Also reported in launchpad here https://bugs.launchpad.net/pbzip2/+bug/1746369
+
+Upstream-Status: Submitted [https://launchpadlibrarian.net/355230152/pbzip2.patch]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pbzip2.cpp | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/pbzip2.cpp b/pbzip2.cpp
+index 66ca978..4287ea7 100644
+--- a/pbzip2.cpp
++++ b/pbzip2.cpp
+@@ -1220,7 +1220,7 @@ int producer_decompress(int hInfile, OFF_T fileSize, queue *fifo)
+ 			// give warning to user if block is larger than 250 million bytes
+ 			if (fileData->bufSize > 250000000)
+ 			{
+-				fprintf(stderr, "pbzip2:  *WARNING: Compressed block size is large [%"PRIuMAX" bytes].\n",
++				fprintf(stderr, "pbzip2:  *WARNING: Compressed block size is large [%" PRIuMAX " bytes].\n",
+ 						(uintmax_t) fileData->bufSize);
+ 				fprintf(stderr, "          If program aborts, use regular BZIP2 to decompress.\n");
+ 			}
+@@ -1829,7 +1829,7 @@ void *fileWriter(void *outname)
+ 	
+ 	if (QuietMode != 1)
+ 	{
+-		fprintf(stderr, "    Output Size: %"PRIuMAX" bytes\n", (uintmax_t)CompressedSize);
++		fprintf(stderr, "    Output Size: %" PRIuMAX " bytes\n", (uintmax_t)CompressedSize);
+ 	}
+ 
+ 	#ifdef PBZIP_DEBUG
+@@ -2072,7 +2072,7 @@ int directcompress(int hInfile, OFF_T fileSize, int blockSize, const char *OutFi
+ 		close(hOutfile);
+ 	if (QuietMode != 1)
+ 	{
+-		fprintf(stderr, "    Output Size: %"PRIuMAX" bytes\n", (uintmax_t)CompressedSize);
++		fprintf(stderr, "    Output Size: %" PRIuMAX " bytes\n", (uintmax_t)CompressedSize);
+ 	}
+ 
+ 	syncSetProducerDone(1); // Not really needed for direct version
+@@ -2794,7 +2794,7 @@ void outputBufferInit(size_t size)
+ 	// unlikely to get here since more likely exception will be thrown
+ 	if (OutputBuffer.size() != size)
+ 	{
+-		fprintf(stderr, "pbzip2: *ERROR: Could not initialize (OutputBuffer); size=%"PRIuMAX"!  Aborting...\n", (uintmax_t)size);
++		fprintf(stderr, "pbzip2: *ERROR: Could not initialize (OutputBuffer); size=%" PRIuMAX "!  Aborting...\n", (uintmax_t)size);
+ 		safe_mutex_unlock(OutMutex);
+ 		exit(1);
+ 	}
+@@ -4102,7 +4102,7 @@ int main(int argc, char* argv[])
+ 			if (decompress == 1)
+ 				fprintf(stderr, " BWT Block Size: %c00k\n", BWTblockSizeChar);
+ 			if (hasInFile)
+-				fprintf(stderr, "     Input Size: %"PRIuMAX" bytes\n", (uintmax_t)InFileSize);
++				fprintf(stderr, "     Input Size: %" PRIuMAX " bytes\n", (uintmax_t)InFileSize);
+ 		}
+ 
+ 		if (decompress == 1)
+@@ -4224,7 +4224,7 @@ int main(int argc, char* argv[])
+ 			{
+ 				NumBufferedBlocksMax = numCPU;
+ 				if (QuietMode != 1)
+-					fprintf(stderr, "*Warning* Max memory limit increased to %"PRIuMAX" MB to support %d CPUs\n", (uintmax_t)((NumBufferedBlocksMax + (numCPU * 2)) * blockSize)/1000000, numCPU);
++					fprintf(stderr, "*Warning* Max memory limit increased to %" PRIuMAX " MB to support %d CPUs\n", (uintmax_t)((NumBufferedBlocksMax + (numCPU * 2)) * blockSize)/1000000, numCPU);
+ 			}
+ 			else
+ 			{
diff --git a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
index 06d37adc36..4e96de2ed3 100644
--- a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
+++ b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
@@ -11,7 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=398b8832c6f840cfebd20ab2be6a3743"
 DEPENDS = "bzip2"
 DEPENDS_append_class-native = " bzip2-replacement-native"
 
-SRC_URI = "https://launchpad.net/${BPN}/1.1/${PV}/+download/${BP}.tar.gz"
+SRC_URI = "https://launchpad.net/${BPN}/1.1/${PV}/+download/${BP}.tar.gz \
+           file://0001-pbzip2-Fix-invalid-suffix-on-literal-C-11-warning.patch \
+           "
 
 SRC_URI[md5sum] = "4cb87da2dba05540afce162f34b3a9a6"
 SRC_URI[sha256sum] = "8fd13eaaa266f7ee91f85c1ea97c86d9c9cc985969db9059cdebcb1e1b7bdbe6"
-- 
2.17.0


