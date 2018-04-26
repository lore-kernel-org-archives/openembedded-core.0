Return-Path: <armccurdy@gmail.com>
Received: from mail-ot0-f194.google.com (mail-ot0-f194.google.com
	[74.125.82.194])
	by mail.openembedded.org (Postfix) with ESMTP id D17037456C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2018 17:57:32 +0000 (UTC)
Received: by mail-ot0-f194.google.com with SMTP id l12-v6so2493727oth.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2018 10:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Zi4H3gWyAnYyym/gCeNagDPW/K7h+q+DSjmihmc+8Z4=;
	b=bZpyOm4+vlUV2vKqMC6OCqPyYO3+s7cp9hR8r8ayxKSs45La9qzRw5N9UaGE9UIH1n
	5Ue61sC8qBvTgjPcmdxbh/BQ84KI7WnvMu2BYr5MVTAwKfre+1hB4qi/A2P16CJmu4oN
	2c23z/5CS5pYH/KgRfAJVWPMhkma0Lciy91aOZ/jUAtwIZEov7kSjuTqQaVeYFHmDPgk
	rZPvEs7Dl15s55uRfyYY5NaXxnrNRQ91VQpEkCsnQRhTHmOUJPQ4PCazddfBi5nXC7cd
	bbZ0F7hhAAQ5nkV4GR8GVfUX5+r3m27mDEYz6YiceDzHznMq7dBzLaUZv8hdwtzdfiE4
	Z4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Zi4H3gWyAnYyym/gCeNagDPW/K7h+q+DSjmihmc+8Z4=;
	b=O/gwjQU/3muPKqncThMYQNGtAOn6l9kHOakWMmn1iGAKpvIEeI2j0sutZqQJjYS8vp
	LJLgtD7NrxC0cfAR6yz0J0u+X7wI3dnDcb6qsqsps3izbJQFphr7Q/4d+4MoTf6Xv+77
	p9YGB2dsCWr3wmB3XVjearCWebcE2dwruBKE1R4hFms8yI8Ey+wOetiUnnogo2X0kxJy
	lPB8a1QDMKXs7rQjODdZM6KpxtN4JH528qUcnWl6EQ4LsU8WggRFOtji08TTuInJiPG6
	dRJfPObhC1i7ByPq398RgpzzcAuq3rq1CnwyUWoNPMznUv+IdwFIa9CEgPDrR7a373kC
	VxmA==
X-Gm-Message-State: ALQs6tCjR2JbXkxJBgZQjYxh+zTIZMvwits2ul3ub9wGieLxmwD8R9/2
	Oj1eYtt7sstTYdnJX/otUyWE7A==
X-Google-Smtp-Source: AB8JxZr8THQvQS3c5sMFa+u4iQISzlbYz4Bzgyo3ZTUAV9Odwb7gRP6V2tOW6X4adofLGSk/wqLQkQ==
X-Received: by 2002:a9d:1a68:: with SMTP id
	u37-v6mr7880501otu.233.1524765453313; 
	Thu, 26 Apr 2018 10:57:33 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	a29-v6sm9488813ota.44.2018.04.26.10.57.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 Apr 2018 10:57:32 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Apr 2018 10:57:27 -0700
Message-Id: <1524765447-2934-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] tune-corei7.inc: update TUNE_CCARGS -march CPU type corei7 -> nehalem
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
X-List-Received-Date: Thu, 26 Apr 2018 17:57:33 -0000

The gcc "corei7" CPU type was last documented in gcc 4.8.x and has
been undocumented from gcc 4.9.x onwards:

  https://gcc.gnu.org/onlinedocs/gcc-4.8.5/gcc/i386-and-x86-64-Options.html
  https://gcc.gnu.org/onlinedocs/gcc-4.9.4/gcc/i386-and-x86-64-Options.html

Although it still seems to be accepted by gcc 7.x, it's likely to be
deprecated and removed at some point. To preempt that, switch the
corei7 TUNE_CCARGS -march CPU type to "nehalem", which is the closest
replacement (and matches the CPU type already being passed to qemu).

Since the tune-corei7.inc include file is intended to cover a range
of CPUs from Nehalem onwards, switch the TUNE_CCARGS -mtune option
from "corei7" to "generic", which instructs gcc to produce code
optimized for the most common IA32/AMD64/EM64T processors.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/machine/include/tune-corei7.inc | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/conf/machine/include/tune-corei7.inc b/meta/conf/machine/include/tune-corei7.inc
index 6edfb68..9ce731c 100644
--- a/meta/conf/machine/include/tune-corei7.inc
+++ b/meta/conf/machine/include/tune-corei7.inc
@@ -1,7 +1,7 @@
-# Settings for the GCC(1) cpu-type "corei7":
+# Settings for the GCC(1) cpu-type "nehalem":
 #
-#     Intel Core i7 CPU with 64-bit extensions, MMX, SSE, SSE2, SSE3, SSSE3, SSE4.1
-#     and SSE4.2 instruction set support.
+#     Intel Nehalem CPU with 64-bit extensions, MMX, SSE, SSE2, SSE3, SSSE3, SSE4.1,
+#     SSE4.2 and POPCNT instruction set support.
 #
 # This tune is recommended for Intel Nehalem and Silvermont (e.g. Bay Trail) CPUs
 # (and beyond).
@@ -11,10 +11,9 @@ DEFAULTTUNE ?= "corei7-64"
 # Pull in the previous tune in to pull in PACKAGE_EXTRA_ARCHS
 require conf/machine/include/tune-core2.inc
 
-
 # Extra tune features
 TUNEVALID[corei7] = "Enable corei7 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'corei7', ' -march=corei7 -mtune=corei7 -mfpmath=sse -msse4.2', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'corei7', ' -march=nehalem -mtune=generic -mfpmath=sse -msse4.2', '', d)}"
 
 # Extra tune selections
 AVAILTUNES += "corei7-32"
-- 
1.9.1


