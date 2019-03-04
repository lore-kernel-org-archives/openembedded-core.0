Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4B0D67C82B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 21:59:05 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id x10so637991wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 13:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Uy37c3z/xKLz9toUhD+gQqfLjzC4GF8XEsSZzV0vDoU=;
	b=mOSRmbMODKi52z2s+TwDEBmFkaLj0qZbqeEI4Y0EyBOuNAl+ey5kAo4d8eH8pf/o1C
	dOYSXvBEEVzt7uMlDyrfUsd9uT7VYq51lEn8be9pESUI7bJFqmWjsJdoUarPNwNfKjf0
	UvpE+rPaXy8UTT2MDvK0EFrTFPi1SR3uBt7I3G52CjE9Om/LoOfaxMT8uXIkII6UMmv+
	sHl/YmfOsToi3DgbV5Jgax6AwMrg8o/8dEQLwEtbi2AG/gSpINmihXs53rNsJ+tBkjXc
	yblyRZp3McROchqYF11LpRFGA017p4CRUCZKQclnFzSjwSPIIOthXMEmqytsa4Q/UeKP
	Mn+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Uy37c3z/xKLz9toUhD+gQqfLjzC4GF8XEsSZzV0vDoU=;
	b=PATdOrEjO+5hJGmHFXiPeJrGhzEr3E0SB7Mrj+KpCqkOia+qmdZ18SqwqawVyIa1uu
	krO1K3tziOwhBsw+Uq242FAF9KUau/adpOoUz8o3cuxsEfhZoyobbB1hY5ge1mGI6lii
	tMnMwI0Tt3vaoGk2oF01NwJOYztB3mKgMu1/hWh7shtq6CJWQH3qG4nmPcRJQAirKiAk
	qZbiLzKTeDCgnio7QinfeJbOL47MFk/MkuQURez4+5C2NSC0Jo8Relqt+PyasOJzllG4
	BOPwZIqxD9l2cao1ia2TDYp0jYjYxfxWvz2uWExvNOSbCYoFUrEAZe4vFPBFAoa+pCcS
	UngA==
X-Gm-Message-State: APjAAAUhiQhTw6pnk/7lvRxonO9yRk8XB/rzSBfQrKL7fT64CpadtZp+
	clpXNeYXmNSLt79KdScXhEVwTH9pRLY=
X-Google-Smtp-Source: APXvYqyKZGZl1WPBL9yFLGlX81J4UfMj4+nQzNLiUHveJ0Fok/6iLjjF1/hM4qBj9IJz9i5ijpv7Jw==
X-Received: by 2002:a05:600c:224c:: with SMTP id
	a12mr676882wmm.103.1551736745260; 
	Mon, 04 Mar 2019 13:59:05 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	a82sm20479406wmf.11.2019.03.04.13.59.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Mar 2019 13:59:04 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2019 21:58:59 +0000
Message-Id: <20190304215900.21796-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] btrfs-tools: remove redundant cross-compilation patch
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
X-List-Received-Date: Mon, 04 Mar 2019 21:59:05 -0000

This patch was to use BUILD_CC instead of CC when building mktables, a binary
used to generate tables.c.

However due to cross-compilation problems such as this, upstream since 4.12.1
(f929b62 specifically) avoids the entire issue and ships tables.c in the
repository, updating it as required.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...-Makefile-build-mktables-using-native-gcc.patch | 27 ----------------------
 .../btrfs-tools/btrfs-tools_4.20.1.bb              |  1 -
 2 files changed, 28 deletions(-)
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Makefile-build-mktables-using-native-gcc.patch

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Makefile-build-mktables-using-native-gcc.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Makefile-build-mktables-using-native-gcc.patch
deleted file mode 100644
index 467de327515..00000000000
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Makefile-build-mktables-using-native-gcc.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From e58369f6d36bc51eb59d6afa34c1cae3ff0810ef Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 7 Aug 2017 14:10:38 +0300
-Subject: [PATCH] Makefile: build mktables using native gcc
-
-It's a throwaway helper binary used during build, and so it needs to
-be native.
-
-Upstream-Status: Inappropriate [oe specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: git/Makefile
-===================================================================
---- git.orig/Makefile
-+++ git/Makefile
-@@ -343,7 +343,7 @@ version.h: version.sh version.h.in confi
- 
- mktables: kernel-lib/mktables.c
- 	@echo "    [CC]     $@"
--	$(Q)$(CC) $(CFLAGS) $< -o $@
-+	$(Q)$(BUILD_CC) $(BUILD_CFLAGS) $< -o $@
- 
- # the target can be regenerated manually using mktables, but a local copy is
- # kept so the build process is simpler
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb
index 1b4f515cb62..a6ca71d8689 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb
@@ -16,7 +16,6 @@ RDEPENDS_${PN} = "libgcc"
 
 SRCREV = "6c33832b8c7bf2d7b64d6aed023c0bda43a03311"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
-           file://0001-Makefile-build-mktables-using-native-gcc.patch \
            file://0001-Add-LDFLAGS-when-building-libbtrfsutil.so.patch \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-- 
2.11.0


