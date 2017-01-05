Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id B58C871B2B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 19:46:50 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id 3so51662824oih.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2017 11:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zeWw1oyuNmPrnrLBZgLSWWjXxmYMAGEuF6J3pZ67D+k=;
	b=WE5U6E1ZRV6dOkm/cz/u2sJDs8QxYPJn4DK1fvE0+LQ2KOOATK5trBkiUTsPnR01J4
	VfKSAig4MggFmi1z5nH2yzH6y35UYkrHM025pcPAbrdmuLQQPXRIwm4Mx1QUULYySnVP
	Np5MZ8sY3bWwzv9vWABhDEV8KCU+MA8R/iOKaHg1eOIeKrMvlyAGk7byj9vqGOM0mRL4
	EnTFGmXp6VqxBv41r3ZjUmKLe3Qao12MaB9b3YsF6X39ohpyaQs5CiBKt8MLdMDlfm7b
	GC0ygKTxOHZMBDWMyzY9/mVyaLQPR1aNyVMwjSLe+u3cIC2rxSGET94PVtfrFUaTVEjL
	v7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zeWw1oyuNmPrnrLBZgLSWWjXxmYMAGEuF6J3pZ67D+k=;
	b=Vt8dT2FU88V3G7u8S2S5HpWJ3iWEClUjnIyEVzSaF1P8CKiKpzqtZSsY3oduVOOGsR
	MMI+qxLgkxo7C4/IzgdaFTHGGopxI+CEaBZjG2359GZ2Ns8W294q1PEdPjUUGS1vT9b/
	63oM4P8vZhZV1v9QsZP8lmMUoliJTMnMoirFo2rDx9+06ojRjzrWpwWCvnECg+uZAXeb
	hmbNXo3r1Sd3FUxDHPFaRCx8cJHA3O/aXjzz+lLBlOUBgWOS7ReQjxsTGT/vvrG/2/TQ
	mmOqMDo8QSGjKmd7CnN87Z8GSQFWymVINTtpZzvpnCanWF0rqi7cyV9cARLGtrGX4lsB
	IJlA==
X-Gm-Message-State: AIkVDXIKfPse+AACtoKeftUuwArKOjxscTTYRP2+WzReoQ/1cr16BcSZkule1KiyoaaO0w==
X-Received: by 10.157.43.55 with SMTP id o52mr1223263otb.206.1483645610679;
	Thu, 05 Jan 2017 11:46:50 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id d10sm153783otb.4.2017.01.05.11.46.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Jan 2017 11:46:49 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2017 12:46:25 -0700
Message-Id: <b5bfb6c132f84ec8070a224b735695efa7cb9a9a.1483645446.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1483645446.git.chris_larson@mentor.com>
References: <cover.1483645446.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 13/16] nss: fix for x32
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
X-List-Received-Date: Thu, 05 Jan 2017 19:46:51 -0000

From: Christopher Larson <chris_larson@mentor.com>

This was casting to a pointer, and the pointer sizes are 32-bit on X32, not
64-bit. Adjust as appropriate.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../nss/nss/Fix-compilation-for-X32.patch          | 31 ++++++++++++++++++++++
 meta/recipes-support/nss/nss_3.27.1.bb             |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-support/nss/nss/Fix-compilation-for-X32.patch

diff --git a/meta/recipes-support/nss/nss/Fix-compilation-for-X32.patch b/meta/recipes-support/nss/nss/Fix-compilation-for-X32.patch
new file mode 100644
index 0000000..f7f2c21
--- /dev/null
+++ b/meta/recipes-support/nss/nss/Fix-compilation-for-X32.patch
@@ -0,0 +1,31 @@
+From c8eadfcdfbc1d5a4799e9a264b0f859cb5954c05 Mon Sep 17 00:00:00 2001
+From: Christopher Larson <chris_larson@mentor.com>
+Date: Tue, 13 Dec 2016 11:40:47 -0700
+Subject: [PATCH 7/7] Fix compilation for X32
+
+X32 uses 32-bit pointers, not 64-bit.
+
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+---
+ nss/lib/freebl/poly1305-donna-x64-sse2-incremental-source.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/nss/lib/freebl/poly1305-donna-x64-sse2-incremental-source.c b/nss/lib/freebl/poly1305-donna-x64-sse2-incremental-source.c
+index 2a3301e..d4ade41 100644
+--- a/nss/lib/freebl/poly1305-donna-x64-sse2-incremental-source.c
++++ b/nss/lib/freebl/poly1305-donna-x64-sse2-incremental-source.c
+@@ -87,7 +87,11 @@ static poly1305_state_internal INLINE
+     *
+     poly1305_aligned_state(poly1305_state *state)
+ {
++#ifdef __ILP32__
++    return (poly1305_state_internal *)(((uint32_t)state + 63) & ~63);
++#else
+     return (poly1305_state_internal *)(((uint64_t)state + 63) & ~63);
++#endif
+ }
+ 
+ /* copy 0-63 bytes */
+-- 
+2.8.0
+
diff --git a/meta/recipes-support/nss/nss_3.27.1.bb b/meta/recipes-support/nss/nss_3.27.1.bb
index 0917938..0b4b5f9 100644
--- a/meta/recipes-support/nss/nss_3.27.1.bb
+++ b/meta/recipes-support/nss/nss_3.27.1.bb
@@ -22,6 +22,7 @@ SRC_URI = "\
     file://nss-fix-nsinstall-build.patch \
     file://disable-Wvarargs-with-clang.patch \
     file://pqg.c-ULL_addend.patch \
+    file://Fix-compilation-for-X32.patch \
     file://nss.pc.in \
     file://signlibs.sh \
 "
-- 
2.8.0


