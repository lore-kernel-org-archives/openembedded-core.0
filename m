Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id A2DC6731C4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 04:40:34 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id b66so3851448pfb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 21:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=WrxIV03uEpl7Jo0rFIBu26SE2m6lizFNedBub88pXvE=;
	b=CjeZei/cdjujWH5E5JQgyc9ImDQ7oj/louw/7V+JtqSu1gAPrad7t9OlcWwcgpiZR7
	QN4AY77BnVViLKaF0DEE8uywTnIvdUUxSGpgEWYTp6d1WSL/Vf2foIQRxxyhU1mQ4prD
	bDJ2akcSd2EZhnnZPNi35sfUlXDOEt3PpcfwlUM8DXbob+FN/H8HLH5pAxJBnhTQ8m82
	wE1ptrrYLo/T886TkMGq5XCZgdxdisLhHVVgS1SuMktiVF1SYkXV4FQ784hLXlCJjQ2A
	tcPRofLixIe1xOt5OEEDOMZFPfoM8/zyzoWnVW10keNbk18AKNelVfA7M8H2XXCAxLWj
	ylWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=WrxIV03uEpl7Jo0rFIBu26SE2m6lizFNedBub88pXvE=;
	b=RrzMOt7VHawprxFQ9mo29E9mdkyEa/GumaUAaJgPvFT3vXAhw01ap4tLUtrR8v3lS9
	gUSklmU5DXAQHxjzcCkVWZ38CXEx1tIgM6EAqN08kwCR26WoFlJNahoP/Ys3OURBXURt
	jjOcJ9wCMh02dl+JZ05k5yeGCOV8yOHEsGWO2t8/CIAgi/e2bta/8+IKDdX3L1I6EqlC
	7NtJKqC4otclm/r+FdRlXrxSn7HLJMFhl7DxxflhpCPeW8qJBLiuDpPxwlhludIuYIRQ
	Hhr++m34ohx3BGlrqNeu7eCyf+h1ov7Yb52M57ckB93ngLsiAXSwShSTDA1P3KO6JGDg
	MlgA==
X-Gm-Message-State: AOPr4FUJUDK9PoOHd2xKYQ2kAV44MdJAg6xXtIuLPY7HuDOqHfFZM1kVRA3G7MFNTrKvig==
X-Received: by 10.98.79.213 with SMTP id f82mr7636711pfj.65.1463546435047;
	Tue, 17 May 2016 21:40:35 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id e2sm8324447pfd.20.2016.05.17.21.40.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 May 2016 21:40:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 May 2016 21:40:22 -0700
Message-Id: <864354e4fba47bd4a06ad4927a4f5b6c9dcae683.1463546289.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <c41bdd4ac5371d7c08318f7c7fc760b44ce59ba9.1463546289.git.raj.khem@gmail.com>
References: <c41bdd4ac5371d7c08318f7c7fc760b44ce59ba9.1463546289.git.raj.khem@gmail.com>
In-Reply-To: <cover.1463546289.git.raj.khem@gmail.com>
References: <cover.1463546289.git.raj.khem@gmail.com>
Subject: [PATCH 3/5] pixman: Fix build on arches not defining FE_INVALID exception
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
X-List-Received-Date: Wed, 18 May 2016 04:40:34 -0000

Nios2 e.g. only supports round to nearest in glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Check-for-FE_INVALID-definition-before-us.patch | 33 ++++++++++++++++++++++
 meta/recipes-graphics/xorg-lib/pixman_0.34.0.bb    |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-test-utils-Check-for-FE_INVALID-definition-before-us.patch

diff --git a/meta/recipes-graphics/xorg-lib/pixman/0001-test-utils-Check-for-FE_INVALID-definition-before-us.patch b/meta/recipes-graphics/xorg-lib/pixman/0001-test-utils-Check-for-FE_INVALID-definition-before-us.patch
new file mode 100644
index 0000000..782c1db
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/pixman/0001-test-utils-Check-for-FE_INVALID-definition-before-us.patch
@@ -0,0 +1,33 @@
+From 0ccd906b904d21536d5ab41c6196760e3e5d72cb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 17 May 2016 17:30:00 -0700
+Subject: [PATCH] test/utils: Check for FE_INVALID definition before use
+
+Some architectures e.g. nios2 do not support all exceptions
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ test/utils.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/test/utils.c b/test/utils.c
+index f8e42a5..fe32b1e 100644
+--- a/test/utils.c
++++ b/test/utils.c
+@@ -978,9 +978,11 @@ enable_invalid_exceptions (void)
+ {
+ #ifdef HAVE_FENV_H
+ #ifdef HAVE_FEENABLEEXCEPT
++#ifdef FE_INVALID
+     feenableexcept (FE_INVALID);
+ #endif
+ #endif
++#endif
+ }
+ 
+ void *
+-- 
+2.8.2
+
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.34.0.bb b/meta/recipes-graphics/xorg-lib/pixman_0.34.0.bb
index 87da5c2..c4ca621 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.34.0.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.34.0.bb
@@ -32,6 +32,7 @@ EXTRA_OECONF_class-nativesdk = "--disable-gtk"
 SRC_URI += "\
             file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
 	    file://asm_include.patch \
+	    file://0001-test-utils-Check-for-FE_INVALID-definition-before-us.patch \
 "
 
 SRC_URI[md5sum] = "002a4fcb644ddfcb4b0e4191576a0d59"
-- 
2.8.2


