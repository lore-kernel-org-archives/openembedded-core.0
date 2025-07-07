Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56112C83030
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 21:33:49 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.4052.1751924025139761079
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jul 2025 14:33:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZrQcrZSk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so18840755e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 14:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751924023; x=1752528823; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YBqpvRLgZ3rXGWqUnVLfQAYk94J1duc1Dg/5skc/O4Q=;
        b=ZrQcrZSkzhVwW+AV4+xDTdqMoK1+2hG1v+izdgmq7VwhWi29os2BhmJWWPR33lj6yi
         cGOn2guuYDM6D4PGc8+c7qT3o/8fWxwBYxrGggJj1+f+PUkgWWEpprQTVHERTYpWEJys
         vV758JLI3rvXo/u3NjHAdG/3cbU+IuH3S5Eqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751924023; x=1752528823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YBqpvRLgZ3rXGWqUnVLfQAYk94J1duc1Dg/5skc/O4Q=;
        b=JnXvKvQ9LZ99/im/0ZIhJNNORAqDU9lAGf1k/AgSN/DVeD3cPtPbFabxzZoWRT39EL
         9gbVOijQ55f8AFrAf7NGoJaFhy3YQGX28chT4iICqCSp+0uaDCAW7hoL0F+Z4qMNYwY/
         PT55VAKI6cCyxwjMPD6NueZtM/+MbEOG4T29f7S+wzVDctIQCk+1HGQf4oKcwIHoWXCb
         HjS8V3kOa98g9nCGeFi9wA2I7LiiNIwUSz+t5K26jpn8qcU76ZKOxPTzmMmBt+/7RwMR
         5TvNx/fQgIDMeS8F/WPUBNnUPmG9vCRKPgJbDpEycSjcRRR9Akj3FEflnq/Wp3xRha7y
         3Agg==
X-Gm-Message-State: AOJu0YyqCxRNAGzY8G70xj4w54pfgSBrhqYiU+2btedg+O+vY7td5gso
	XrNj5Vd38swgPhR7aHynN50HLBwObMq9nWZCE+CROqd9uJtql76faXfd0bi42CSt/E853hhu9wP
	IwP8Q
X-Gm-Gg: ASbGncsznOAoRrS9n16Kh5fH2jPKidmCX/FPV8bma+MLbBv6kyG/qrbm7IvM/s92sdC
	MsjrdnBvcCaY1rhC7bbmUshUg9wPxWZKiREhRlpEebPsk3Sds+f23ljufDZ1MLLrQMsKmClHWA9
	LPucjsnVO5yZozeDjTCE/MMQVQ3YI8rwy5768by6QsJNH/8qv0ZzNyg+CtrtpWluRAMh5FGeieQ
	xMbrdjRZwk36o4YrtlCGG5yDjVi2EIi3hxTgVEP2IPfCVNbEuL+qDCpBvJHEnyZhdpLiMFAQDpk
	wXO7QVqWmEzz/xcRWWkK2XgL9PNeC3KWe2VHYZqGy4rIMrlehy17wfmWV13lRkItSzJNj8QUbhP
	f5wZC2Isg1n4fl7M=
X-Google-Smtp-Source: AGHT+IFmLBteoVTjj6nxrOwiPh+4QTRDOmEDEXAbHakueQ23FqQMGMOnsCo+wEneDb4kt2vlOgigCA==
X-Received: by 2002:a05:600c:3b9b:b0:442:dc75:5625 with SMTP id 5b1f17b1804b1-454cd4b4a28mr2811235e9.5.1751924022707;
        Mon, 07 Jul 2025 14:33:42 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f30e:ae60:b271:f9d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454cd43c638sm3007175e9.8.2025.07.07.14.33.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 14:33:42 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] toolchain/clang-native: Work around native compiles for some gcc configs
Date: Mon,  7 Jul 2025 22:33:41 +0100
Message-ID: <20250707213341.4102515-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 21:33:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220002

Some systems can have mixed development headers, such as pieces of both gcc 13
and 14 which can cause build failures, particularly if libgcc and libstdc++ for
gcc 13 are present but only libgcc for gcc 14 and not libstdc++ when the gcc
version is gcc 13.

This patch forces clang to use the full toolchain rather than any partial incomplete
version. It is only necessary in the native case and should also be applicable to
compiler-rt in due source, hence making it an inc file.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/toolchain/clang-native.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/toolchain/clang-native.bbclass b/meta/classes/toolchain/clang-native.bbclass
index 4de491a1cb5..c8b20ff8c40 100644
--- a/meta/classes/toolchain/clang-native.bbclass
+++ b/meta/classes/toolchain/clang-native.bbclass
@@ -16,3 +16,10 @@ BUILD_READELF = "${BUILD_PREFIX}llvm-readelf"
 DEPENDS += "clang-native libcxx-native compiler-rt-native"
 
 LDFLAGS += " --rtlib=libgcc --unwindlib=libgcc"
+
+# Some systems can have mixed gcc development headers, such as pieces of both gcc 13
+# and 14 which can cause build failures, particularly if libgcc and libstdc++ for
+# gcc 13 are present but only libgcc for gcc 14 and not libstdc++ when the gcc
+# version is gcc 13. Force the gcc install that matches gcc itself
+BUILD_CFLAGS:append:class-native = " --gcc-install-dir=$(dirname $(gcc -print-libgcc-file-name))"
+BUILD_CXXFLAGS:append:class-native = " --gcc-install-dir=$(dirname $(gcc -print-libgcc-file-name))"

