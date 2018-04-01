Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9BB3674725
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Apr 2018 07:19:58 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id u86so7802212pfd.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Apr 2018 00:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CbVboZGJaIYNJDuvuODFKSwy0L6VlF7UyAzlrcDcrtA=;
	b=vDYZRVCEggaeL9UMTX/F0KxOv19mYuVrOASu8ELnRWsyl+RDHeIcwbVRKd9hqbTQrI
	Q13XO0FH52qtiJQkNtCMc288P7OlwPbk4PvO+hiZh27uG2rDRC0nsv08sY79XYWPLfpW
	CLyDcWDvluC77EwLO8TECZbp51mxuak2DtaYrexFmlIWmX7vTrPVDA76nFud8EA+oXRT
	LSz2BQ7JWq4UodRxjZVU38z4IaPS/SEEOXEu7gVJ86EVR2OaWTTDGt866im3JCTWceka
	zg+UFUILE8boToNEm5LGfijSN5WQ8GOUg7XOMsoMm1qJRPjO+XTY5q9Wmxo/raAVZOoj
	FeGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CbVboZGJaIYNJDuvuODFKSwy0L6VlF7UyAzlrcDcrtA=;
	b=oqBQsY98uyYMT2wxS55w4hfKIthGSgm7KvMGsUu6D5Wx/a3ToPk0vJDZgz0gnuq429
	aXoYUq4q8U5hekzlPiitjVYRt2fLMV+RjXtJNcT8CBwlYlDfWxxGaABN1z3r2YvpH5aK
	g62hzBQ7B+ap3Jkio6f7VhW52JOqkgDzWGDGDhDsWQQmoDBjaE8kyfdl2AsvgAn2EKV4
	3Zi0irAODZW1N1JsyIqtaw9dv7eD3dvQFU8wKAx13q5jTJN55dmS/G9EjV09NhQ7gUGM
	ekJDKkyRRAdPOwGdCpYBEYao/pAslEsI/x7zkKS4LDXlam1NT4xMLLxzuao0pNI51AzP
	MluA==
X-Gm-Message-State: AElRT7GxLtDh5JtKsneUXWRHkYGGnFXo3YFYTo1liihJxH6TyWb9iGpS
	r4UhumiJm+4SJTqjWuAa7cD+XA==
X-Google-Smtp-Source: AIpwx49eXcr0GDJkf69TTk9phYcTfeuVQTwsbY729GyQIDyW4+RuGsK48J74fr9Fr81PjZJVL6ekkQ==
X-Received: by 10.99.37.71 with SMTP id l68mr3417459pgl.440.1522567199236;
	Sun, 01 Apr 2018 00:19:59 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	x128sm21481749pgb.31.2018.04.01.00.19.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 01 Apr 2018 00:19:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Apr 2018 00:19:44 -0700
Message-Id: <e0bc5dafb799c6ac5fdfc50f27431da35920fa69.1522567040.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.3
In-Reply-To: <cover.1522567040.git.raj.khem@gmail.com>
References: <cover.1522567040.git.raj.khem@gmail.com>
Subject: [PATCH 2/4] nasm: Fix pure function warnings
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
X-List-Received-Date: Sun, 01 Apr 2018 07:19:58 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...rop-pure-function-attribute-from-seg_init.patch | 27 ++++++++++++++++++++++
 meta/recipes-devtools/nasm/nasm_2.13.03.bb         |  4 +++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/nasm/nasm/0001-asmlib-Drop-pure-function-attribute-from-seg_init.patch

diff --git a/meta/recipes-devtools/nasm/nasm/0001-asmlib-Drop-pure-function-attribute-from-seg_init.patch b/meta/recipes-devtools/nasm/nasm/0001-asmlib-Drop-pure-function-attribute-from-seg_init.patch
new file mode 100644
index 0000000000..12ae3a94df
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/0001-asmlib-Drop-pure-function-attribute-from-seg_init.patch
@@ -0,0 +1,27 @@
+From 77c3a77210d8ca8b94e999c711156e984a8dc737 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 31 Mar 2018 11:05:33 -0700
+Subject: [PATCH] asmlib: Drop pure function attribute from seg_init
+
+seg_init returns void, so it is impure function
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ include/nasmlib.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/nasmlib.h b/include/nasmlib.h
+index 79e866b..b80b7e2 100644
+--- a/include/nasmlib.h
++++ b/include/nasmlib.h
+@@ -191,7 +191,7 @@ int64_t readstrnum(char *str, int length, bool *warn);
+  * seg_init: Initialise the segment-number allocator.
+  * seg_alloc: allocate a hitherto unused segment number.
+  */
+-void pure_func seg_init(void);
++void seg_init(void);
+ int32_t pure_func seg_alloc(void);
+ 
+ /*
diff --git a/meta/recipes-devtools/nasm/nasm_2.13.03.bb b/meta/recipes-devtools/nasm/nasm_2.13.03.bb
index 3a47fc9c88..236d7e5e36 100644
--- a/meta/recipes-devtools/nasm/nasm_2.13.03.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.13.03.bb
@@ -3,7 +3,9 @@ SECTION = "devel"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=90904486f8fbf1861cf42752e1a39efe"
 
-SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 "
+SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
+           file://0001-asmlib-Drop-pure-function-attribute-from-seg_init.patch \
+           "
 
 SRC_URI[md5sum] = "0c581d482f39d5111879ca9601938f74"
 SRC_URI[sha256sum] = "63ec86477ad3f0f6292325fd89e1d93aea2e2fd490070863f17d48f7cd387011"
-- 
2.16.3


