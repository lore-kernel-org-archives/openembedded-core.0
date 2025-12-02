Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4951DCFD376
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 07:58:58 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3030.1764662327796869335
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Dec 2025 23:58:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JdpRnv40;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42e2cf93f7dso1711246f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 23:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764662326; x=1765267126; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mzFyZym3bB8hLFCTitpf3DkpUai5DDeGGQKwVI569Q0=;
        b=JdpRnv404NUuMb66G4TwzQQs/M1S2tOxIDNNglvxkrTtjrg6OV5NCQ9WeB+o/k66ar
         9rzixggHGx9h+JZw5GIypKod5XX6KnzHK2szWqsua/6pS/W8T1YDxbcnO7gbVhEVla4U
         igxMDufFUXadLsI21il8AEdPby2IHfvEMOASzOkOWdcTnNmJSrJahHSredzyNZUw2c9k
         e+NzZpeqhTm3ByDlJ3g4isoqyK1VsG/2taCRCy6F+Qn7t8HIc6wTNafYfDtX0+sQK6Mx
         0zoRO85LyJap0R8dzCYzF856ErtZu9korgHMfDrUHnTNARj4QXLb5QGbU977+XpE03qU
         qEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764662326; x=1765267126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzFyZym3bB8hLFCTitpf3DkpUai5DDeGGQKwVI569Q0=;
        b=SG/FzcIdE0t3C7KMUKLqW+Jn1AvhZ1UdVyHuaeM9VNdSGyuS2xACl8q/LAq9zsOsEU
         iGHsQ8iarmlf60b40Og8hiaiK2WNVgxeyQ2UGPVCNEJgHATpybE3emEzEh/OiS/suiuX
         9hgc+xPsXAkJCZEK/Y7AT1zNJKlaPOn0TqJOydAQ+LmUX51+j/PwitGYsKhTECIWfp+2
         NcpiKhYs7DNoVXswlpwSih3SyCnJzu/9ASzDWLCXCzwmiGqUIi2npLpxHsRLZMct2jhf
         EqtvGgaCLhr/BuMzMZxYChaZElHcqNtdf8Mg5xhhsnU/sOgSNmNcJm1dBJnaC5UZQ5Im
         ynWg==
X-Gm-Message-State: AOJu0YyfVGDBabTctG9YALcK6IIWXkieje60oQJppiQHfeKI7QOuCx7j
	QSxKbzitjRvtX6otXhAAVFl3q7SsxTuKRTgS/OJetPc13YB+zGYRGfTeTRNlIg==
X-Gm-Gg: ASbGncv0v/re9HTVK5i6Eca4cFcGNy9syA2hwJMbAIkr0qJ4a+yaAF6zopEjy0Qr+mZ
	PjlfpL2gaZ1m5a0nLstWPkMUj1+glz6gNjc9qKUePmdET4gy7sR9wgjTZ60ZMoG0pofrTdGuGFr
	3kqy5whHPf1IYZamBN1oQOmGfamKSX6x5WKNBQ6cbm2PCFcX9xY+8E6PgB4ahsq4Ci1qSUd8O8y
	6GGhSX7mQJEStkyzDK+b0zB7gVk6EkzKfENCEXz7OfedCq4au2l7LQqyvbCBO7VMUjH5CLc3yi4
	9M7KzSJLB5HIiOtvyEfgqjoC/qsmwADKSjk6TiqaPrcyuCz4sDxMjlhDLfmG9AVxzK1o0A+wsVy
	EcESy2kG4dXXzTkhlb9GlgPaE1cvhAfl6W72uDE4qezuuKY7XYgObOvl1Hr+sJCIipU3Bnp90iw
	xOBhVM2W15pR3nx5UokKI=
X-Google-Smtp-Source: AGHT+IGbP1JBoeWhrWcEEVPZToORHVRDGWO7qY4yCnaqRSlF1gGLslMn86RxjbcDd9xZNKxpnklWFA==
X-Received: by 2002:a05:6000:184a:b0:427:526:16aa with SMTP id ffacd0b85a97d-42cc1d23e6fmr46299762f8f.58.1764662325948;
        Mon, 01 Dec 2025 23:58:45 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d6133sm33497689f8f.16.2025.12.01.23.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 23:58:45 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mingli Yu <mingli.yu@windriver.com>
Subject: [PATCH] gcc.bbclass: set -fcanon-prefix-map for class-target only
Date: Tue,  2 Dec 2025 08:58:44 +0100
Message-ID: <20251202075844.3270075-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 07:58:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227149

-fcanon-prefix-map is not supported by all host gcc version that is supported
by the Yocto project, which causes build failures when building recipes
for the host machine.

This flag was supposed to be set for class-target anyway when gcc is the toolchain,
but even when a native target is compiled with gcc, both gcc and gcc-native classes
are loaded, and gcc.bbclass overwrites the DEBUG_PREFIX_MAP_EXTRA value.

To avoid this, set this variable for only for class-target, explicitly.

Reported-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/classes/toolchain/gcc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/toolchain/gcc.bbclass b/meta/classes/toolchain/gcc.bbclass
index 0ed49ba892..5ec98bf7c5 100644
--- a/meta/classes/toolchain/gcc.bbclass
+++ b/meta/classes/toolchain/gcc.bbclass
@@ -30,6 +30,6 @@ PREFERRED_PROVIDER_virtual/nativesdk-cross-cc:class-cross-canadian = "gcc-crosss
 PREFERRED_PROVIDER_virtual/nativesdk-cross-c++:class-cross-canadian = "gcc-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs:class-cross-canadian = "nativesdk-gcc-runtime"
 
-DEBUG_PREFIX_MAP_EXTRA = "-fcanon-prefix-map"
+DEBUG_PREFIX_MAP_EXTRA:class-target = "-fcanon-prefix-map"
 
 TCOVERRIDE = "toolchain-gcc"

