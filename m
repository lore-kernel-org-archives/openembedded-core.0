Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id E943D78989
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 16:56:52 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id i9so849046pgq.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 09:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=GhQ2FQsJW8c9q83R2N5Z8pPu5FGGTgbZHRwjkYKQy8w=;
	b=QmnXJTTaR2f1qxc0M3PxQciBSR5Af2ifU5Lo2HIGeyJph0zw+oWg88Mto6vPAuZEa7
	0GRAChOUTFRky1Eh00jwMYzPybWg+1kEKdOojj59OTtMfvzc0z9LT8NNnz6PvphJGwoh
	ANZ89xh59s8pSD6p9plXvRGDPAbdTBdyPwNASZ6fCko0j61dIP1YnBeEqkf2gWNaVjmV
	EINXy9hXdaGtpOpWKOJ+OZoKASRUAznJuuOSlrCW+u1PRU8EKj7tk+l+H7b7UH4WLhim
	cPOHJeEkJ3SoyUhFVbF99xC1OfJEpxZLwkZSxv5TpGqvFrvHogADvkqTQ590YKqXLQuN
	OV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GhQ2FQsJW8c9q83R2N5Z8pPu5FGGTgbZHRwjkYKQy8w=;
	b=chrAI1Tf3Re5E99n37qYvYHeqEJ5CwuIbZxuVxyBf7dtAILEAcDS7JjyA1BFRTkobJ
	eThG/PHc2dPWyzr+2NcIgLHd+hsVqJqRSGig3WDVOO2WaOFMxxo8E8IHo+meIiSQAo5R
	By+ooUNlP4t6XOQgToXWovPl8g3v63tptJrn16sYBi5LsIfQCS5P/84Qmi/z8gmuQlx0
	SRUcDXBNbDGOcYT2s6iQ/jcfoBgaHRCW0xmLgU11ED3Vp14eJnIv5e3SRQpGjX9ZagTp
	thCwinLqN/sgAt13LRNCf0vV5SlHY6fXdeIB3zIZZ6T71YIx3SlxrsjRjGjENTxVGlRM
	Jawg==
X-Gm-Message-State: AElRT7FMMPyO/siC8s9nFQncH6Q6tLp9pOL6Z5uozVOXhMr7To9YuNpX
	HJELB5R0vzcagKRjYnwVGs8V4l07
X-Google-Smtp-Source: AG47ELujf3MrzyJaLTL0uKnHk5+KoM84lxONz/bKKSHBhnJ+I1ZM8F5K/+JGRt33xj893nbqcqwUGA==
X-Received: by 10.101.70.72 with SMTP id k8mr7780442pgr.402.1521565013764;
	Tue, 20 Mar 2018 09:56:53 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	q15sm4616130pfi.140.2018.03.20.09.56.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Mar 2018 09:56:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Mar 2018 09:56:40 -0700
Message-Id: <20180320165640.23753-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
Subject: [PATCH V3] site/risc-v: Cache common variables to build libIDL
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
X-List-Received-Date: Tue, 20 Mar 2018 16:56:53 -0000

These variables force runtime tests during configure
they are already cached for other architectures

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes from v1 -> v2:
- Drop libIDL specific setting since they need to be in meta-gnome

Change from v2 -> v3:
- Drop glib_cv_sizeof_* variable caching

 meta/site/riscv32-linux | 5 +++++
 meta/site/riscv64-linux | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/meta/site/riscv32-linux b/meta/site/riscv32-linux
index 138aeb0a11..97de628e22 100644
--- a/meta/site/riscv32-linux
+++ b/meta/site/riscv32-linux
@@ -1,3 +1,8 @@
+# general
+ac_cv_alignof_guint32=4
+ac_cv_alignof_guint64=8
+ac_cv_alignof_unsigned_long=4
+
 # glib-2.0
 glib_cv_stack_grows=${glib_cv_stack_grows=no}
 glib_cv_uscore=${glib_cv_uscore=no}
diff --git a/meta/site/riscv64-linux b/meta/site/riscv64-linux
index 138aeb0a11..38bc5f044d 100644
--- a/meta/site/riscv64-linux
+++ b/meta/site/riscv64-linux
@@ -1,3 +1,8 @@
+# general
+ac_cv_alignof_guint32=4
+ac_cv_alignof_guint64=8
+ac_cv_alignof_unsigned_long=8
+
 # glib-2.0
 glib_cv_stack_grows=${glib_cv_stack_grows=no}
 glib_cv_uscore=${glib_cv_uscore=no}
-- 
2.16.2


