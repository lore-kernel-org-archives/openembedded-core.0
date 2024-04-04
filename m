Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 691ABCD1284
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 10:17:13 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.34684.1712225831764665026
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Apr 2024 03:17:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NSFIgNjx;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-33eee0258abso371214f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 03:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712225830; x=1712830630; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OIVqlhY/1Mz46MI/TRn16c+bcD61k3CE4CYpYmyx8ts=;
        b=NSFIgNjxSKVAgDf8wbeMOfHR5uHTFHafRhh6zZf35c68IiIPxNR0YNud3K3kxaVBnw
         6i+VwKAw5cot1w2BjJW/9YWBcdkBmLnUPwhXMNkobKRCtvi7VoJINO3bRyaKUYxCITb/
         oKWNYcihSZI7NMXPoWw/Zq20IEXppmEbA4nCO1Fm2nzs4uu2kByNyaF0inNE4mY8J0OO
         en6HLIcPoA4cFtHCUVoQjIcZn0X6YChcQvpaUTbrMp3ujvNzMSbfey7TKn41ladSBElM
         uyfESPXTTIqSlehW6jP2HiAGOT9JqbJJt36Jm8C2+9L+SvpEjS6THa3UjwLPn7IrAZrd
         TnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712225830; x=1712830630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OIVqlhY/1Mz46MI/TRn16c+bcD61k3CE4CYpYmyx8ts=;
        b=EZgPIESRV48reOv7BWiuL4vNMXRetualSKYBfsIId81vOx2G2Dv4WzyHGbMZG7lcSD
         6pjwrMtti9yZSX9ViOwtzgL85JQu2w9FA4TRWnRKVP8dXeMc5KnC33sLcn3J9BOZg80/
         Y/OtVSvT5kiOmJ1yRW+icEpo8PIqcrXzD68GCPGKZz/tCCxCBfLW8Qe2xNzM8Bi89RFD
         Zb/kbWTASON0Gl3FfW1/WuLWlWb0yBfccHvfBzOxCGCBU5+pAzF3OZdBRX2OPgSn+5t/
         /UrxqH1TS4/4LQav1f8Rc2Whdj0PfVuFCqq6yHstG+aiIft9X3IGmuZXYkOOhBMb03zS
         qY1g==
X-Gm-Message-State: AOJu0YxwSctLW8NOqVQkXkMHOAIP0QWIHHqtXIKLM64egMrqUjdEFcS4
	U0FRF86+dvkoCtNcu0oxDAJe96+ossJ+3MD+HZ4+HAA1xq21pTCKpjp6RyuY
X-Google-Smtp-Source: AGHT+IHmivdFQK7yLCxVfiBr2FdvcdpzH1WwJG/KkEBXhQadDaKTHrPtgjijuyXDYymJlzlPFRb/Xg==
X-Received: by 2002:adf:fd8e:0:b0:343:68d6:5636 with SMTP id d14-20020adffd8e000000b0034368d65636mr1468925wrr.43.1712225829634;
        Thu, 04 Apr 2024 03:17:09 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id v13-20020a5d4b0d000000b0034356c434d0sm4685463wrq.117.2024.04.04.03.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 03:17:09 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH 1/2] go: keep the patches in order
Date: Thu,  4 Apr 2024 11:16:57 +0100
Message-ID: <20240404101658.2444210-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 10:17:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197953

drop the old version no more used 0007-exec.go-do-not-write-linker-flags-into-buildids.patch
that was replaced by the 0001-exec.go-filter-out-build-specific-paths-from-linker-.patch
renamed now to 0007-exec.go-filter-out-build-specific-paths-from-linker-.patch

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-devtools/go/go-1.22.1.inc        |  2 +-
 ...not-write-linker-flags-into-buildids.patch | 43 -------------------
 ...t-build-specific-paths-from-linker-.patch} |  0
 3 files changed, 1 insertion(+), 44 deletions(-)
 delete mode 100644 meta/recipes-devtools/go/go/0007-exec.go-do-not-write-linker-flags-into-buildids.patch
 rename meta/recipes-devtools/go/go/{0001-exec.go-filter-out-build-specific-paths-from-linker-.patch => 0007-exec.go-filter-out-build-specific-paths-from-linker-.patch} (100%)

diff --git a/meta/recipes-devtools/go/go-1.22.1.inc b/meta/recipes-devtools/go/go-1.22.1.inc
index 4330853450..f1cf4beebb 100644
--- a/meta/recipes-devtools/go/go-1.22.1.inc
+++ b/meta/recipes-devtools/go/go-1.22.1.inc
@@ -11,8 +11,8 @@ SRC_URI += "\
     file://0004-make.bash-override-CC-when-building-dist-and-go_boot.patch \
     file://0005-cmd-dist-separate-host-and-target-builds.patch \
     file://0006-cmd-go-make-GOROOT-precious-by-default.patch \
+    file://0007-exec.go-filter-out-build-specific-paths-from-linker-.patch \
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
-    file://0001-exec.go-filter-out-build-specific-paths-from-linker-.patch \
 "
 SRC_URI[main.sha256sum] = "79c9b91d7f109515a25fc3ecdaad125d67e6bdb54f6d4d98580f46799caea321"
diff --git a/meta/recipes-devtools/go/go/0007-exec.go-do-not-write-linker-flags-into-buildids.patch b/meta/recipes-devtools/go/go/0007-exec.go-do-not-write-linker-flags-into-buildids.patch
deleted file mode 100644
index 35f3a98d80..0000000000
--- a/meta/recipes-devtools/go/go/0007-exec.go-do-not-write-linker-flags-into-buildids.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 619991feab04f331d081a91243434ccd859f611d Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 23 Nov 2020 19:22:04 +0000
-Subject: [PATCH 7/9] exec.go: do not write linker flags into buildids
-
-The flags can contain build-specific paths, breaking reproducibility.
-
-To make this acceptable to upstream, we probably need to trim the flags,
-removing those known to be buildhost-specific.
-
-Upstream-Status: Inappropriate [needs upstream discussion]
-
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
----
- src/cmd/go/internal/work/exec.go | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
-index 544df461a2..75df5a4aa8 100644
---- a/src/cmd/go/internal/work/exec.go
-+++ b/src/cmd/go/internal/work/exec.go
-@@ -1374,7 +1374,7 @@ func (b *Builder) linkActionID(a *Action) cache.ActionID {
- 	}
- 
- 	// Toolchain-dependent configuration, shared with b.linkSharedActionID.
--	b.printLinkerConfig(h, p)
-+	//b.printLinkerConfig(h, p)
- 
- 	// Input files.
- 	for _, a1 := range a.Deps {
-@@ -1720,7 +1720,7 @@ func (b *Builder) linkSharedActionID(a *Action) cache.ActionID {
- 	fmt.Fprintf(h, "goos %s goarch %s\n", cfg.Goos, cfg.Goarch)
- 
- 	// Toolchain-dependent configuration, shared with b.linkActionID.
--	b.printLinkerConfig(h, nil)
-+	//b.printLinkerConfig(h, nil)
- 
- 	// Input files.
- 	for _, a1 := range a.Deps {
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/go/go/0001-exec.go-filter-out-build-specific-paths-from-linker-.patch b/meta/recipes-devtools/go/go/0007-exec.go-filter-out-build-specific-paths-from-linker-.patch
similarity index 100%
rename from meta/recipes-devtools/go/go/0001-exec.go-filter-out-build-specific-paths-from-linker-.patch
rename to meta/recipes-devtools/go/go/0007-exec.go-filter-out-build-specific-paths-from-linker-.patch
-- 
2.44.0


