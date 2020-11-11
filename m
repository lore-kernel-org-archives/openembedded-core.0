Received: from mailrelay4-2.pub.mailoutpod1-cph3.one.com (mailrelay4-2.pub.mailoutpod1-cph3.one.com [46.30.212.3])
 by mx.groups.io with SMTP id smtpd.web10.14233.1605132917512360006
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2020 14:15:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=20191106 header.b=AzQZHQdB;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.212.3, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=20191106;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=5NPPGTT9RpFqOAsBTDf0uODtH7KzGkdxocmJxfULQ8I=;
	b=AzQZHQdB/EcNmdkZC/Faw95CorDVGKpsLPiW0tkuT+shr+W8eDOMtWPK/uJ4naC6ocyIVWZq4fxsX
	 N8tHKapUOaVmN5oxku68okol4zgTHvIsb/nXQoH7zhJvrdTOEtxwQl8AhBhv5o8ubNiqBS79RBmu4O
	 sXZjMZg8L/FO9SJS6J9RXA601bkKkq8b851ZciIlVHWhrU/3QjJLw3i1PCz+hMZ4kDdaqkvVZGM9rt
	 ga+9J69X4vJWwnrlULB+92Q6naSSDKAZGTEtANvZ7Ajvn93HGFs9V8sRU7zGDRMdxm3K7YGTYTg8F0
	 qx5tRiYi3oOg+XbjNeDZCGGMKNqV1Dw==
X-HalOne-Cookie: 71b29820979d77d8bc45aeb752768fff3223d6c6
X-HalOne-ID: 60341b05-246b-11eb-bb81-d0431ea8bb10
Received: from localhost.localdomain (c188-151-59-206.bredband.comhem.se [188.151.59.206])
	by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 60341b05-246b-11eb-bb81-d0431ea8bb10;
	Wed, 11 Nov 2020 22:15:15 +0000 (UTC)
From: "Peter Bergin" <peter@berginkonsult.se>
To: openembedded-core@lists.openembedded.org
Cc: Peter Bergin <peter@berginkonsult.se>
Subject: [PATCH 2/2] Revert "rt-tests: Enable only for x86/ppc64 architectures"
Date: Wed, 11 Nov 2020 23:15:03 +0100
Message-Id: <20201111221503.2194455-3-peter@berginkonsult.se>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201111221503.2194455-1-peter@berginkonsult.se>
References: <20201111221503.2194455-1-peter@berginkonsult.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 44010756b0ae91e0ac7715b7840285d59f991141.

With the packported patch from rt-tests (67da9d8af7d8a0e1a0822e6ee99d68fa3d5a46d2)
that allows build for all archs this patch can be reverted. An error is dumped in
run-time is frc() is not present.

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
 meta/recipes-rt/images/core-image-rt-sdk.bb | 8 +-------
 meta/recipes-rt/rt-tests/rt-tests_1.9.bb    | 1 -
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/meta/recipes-rt/images/core-image-rt-sdk.bb b/meta/recipes-rt/images/core-image-rt-sdk.bb
index 4f2fdf12c5..624b7d9430 100644
--- a/meta/recipes-rt/images/core-image-rt-sdk.bb
+++ b/meta/recipes-rt/images/core-image-rt-sdk.bb
@@ -15,12 +15,6 @@ DEPENDS += "linux-yocto-rt"
 
 IMAGE_FEATURES += "dev-pkgs tools-sdk tools-debug eclipse-debug tools-profile tools-testapps debug-tweaks"
 
-IMAGE_INSTALL += "${RTTESTS} hwlatdetect kernel-dev"
-
-RTTESTS ?= ""
-RTTESTS_powerpc64 = "rt-tests"
-RTTESTS_powerpc64le = "rt-tests"
-RTTESTS_x86 = "rt-tests"
-RTTESTS_x86-64 = "rt-tests"
+IMAGE_INSTALL += "rt-tests hwlatdetect kernel-dev"
 
 LICENSE = "MIT"
diff --git a/meta/recipes-rt/rt-tests/rt-tests_1.9.bb b/meta/recipes-rt/rt-tests/rt-tests_1.9.bb
index 330b5090c6..b916a7fe60 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_1.9.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_1.9.bb
@@ -17,7 +17,6 @@ SRC_URI += " \
 
 # rt-tests needs PI mutex support in libc
 COMPATIBLE_HOST_libc-musl = 'null'
-COMPATIBLE_HOST = "(i.86.*|x86_64.*|powerpc64.*)-linux"
 
 # Do not install hwlatdetect
 EXTRA_OEMAKE += "PYLIB=''"
-- 
2.25.1

