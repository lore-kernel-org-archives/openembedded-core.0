Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 183E1D33A2E
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:45:55 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.27952.1730832348254045806
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:45:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TlF4xkR9;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20ce65c8e13so66569645ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 10:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730832347; x=1731437147; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2qGTRFUFDs+AvEXikQBPPlrnyJGjQjyghHsHqG6lzKM=;
        b=TlF4xkR9ysxgQS2saJHmkDqHOJqc1wnKBqGKlATRosVozVnQ+acHCMsvfeMEYVWX1O
         ufiLRg42mM3wPKHBD7zB/lpaf3rCkC4epz8ab6KA83KVx0diqtJbX3IuGvsgZDoGrd+m
         gMEY2DjzwFbYihqRUxuB93AwuuZlrQF23BD9dAdUDhJZGiHq4ZZUSQ6ntYBb/ZR3Tleq
         XuD6CIRHqsbBDthC9v57q2WhCus4sH9tw0m3f1tHZmH5LfN3/vRE82b0GXRFciWqXU9+
         duhXp4TxovyFnDewJE2h+AT31PSpAX8gH1Hljuc1Eo59KY78VAU3JmKaaXIOK5Km7zKp
         /qZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730832347; x=1731437147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2qGTRFUFDs+AvEXikQBPPlrnyJGjQjyghHsHqG6lzKM=;
        b=Q1TEBHh75uLFFUqHM2gLHpw4XOUdj51hUAvX6rp3B9JLkdbVF1ox18pM5ROBFHlWRR
         i/fanYa81Kyeo9lENBuTjUtdnspU9CdW6v2PdU5MqE0pB+7wVXYY18aL0Wm6RePlL57P
         PXFL3bQnKlEsBPPhOJ4UbQ5/XORKc9XeLuAO8dAjNrqD/VG/svX9PNgaqxEfl9jfKtZT
         eT6swDsWVy40kggCYaQWnT0ayqNlJ2ydKhROsXXorpqTU9pbVgCDbxvuJBxct2H5QH6g
         dl+aVab5xT+6LdF+Rdrrv4Wv3pTamKSDdWtrRIKmaRo5EO8cTtbWD8Qxz1E8dHIZlHfU
         Dt7w==
X-Gm-Message-State: AOJu0YyY8/9GmRf1YRYIwaKLghNCbmAG7UtLfGuE2RgVpiVr4aTbEuqZ
	uKndGyRKflfhcTv2w5CCbsbN6Hb7u58XVlLoswR/JeIuY0XkG2haIghxNA==
X-Google-Smtp-Source: AGHT+IH3ZlD46B6qduPfFHPGxsyqcAms0rB01n+W+5LIQlrV/y3pW5QhPMrkt40aCzZECD0uYiNKGA==
X-Received: by 2002:a17:902:d2cc:b0:20c:b700:6e10 with SMTP id d9443c01a7336-21103b20489mr277007845ad.34.1730832347431;
        Tue, 05 Nov 2024 10:45:47 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::ba3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fa0ed5esm12526670a91.2.2024.11.05.10.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:45:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 05/19] clang-native.bbclass: Abstraction to enable clang as native compiler
Date: Tue,  5 Nov 2024 10:45:24 -0800
Message-ID: <20241105184540.3450302-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105184540.3450302-1-raj.khem@gmail.com>
References: <20241105184540.3450302-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 18:45:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206733

Some packages demand clang all the way, including for native pieces e.g.
chromium, this helps to get that going

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes-recipe/clang-native.bbclass | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta/classes-recipe/clang-native.bbclass

diff --git a/meta/classes-recipe/clang-native.bbclass b/meta/classes-recipe/clang-native.bbclass
new file mode 100644
index 00000000000..a136deeee38
--- /dev/null
+++ b/meta/classes-recipe/clang-native.bbclass
@@ -0,0 +1,24 @@
+# inherit this class if you would like to use clang to compile the native
+# version of your recipes instead of system compiler ( which is normally gcc )
+# on build machines
+# to use it add
+#
+# inherit clang-native
+#
+# to the concerned recipe via a bbappend or directly to recipe file
+#
+DEPENDS:append:runtime-llvm = " compiler-rt-native libcxx-native"
+# Use libcxx headers for native parts
+CXXFLAGS:append:runtime-llvm = " -stdlib=libc++"
+BUILD_CXXFLAGS:append:runtime-llvm = " -isysroot=${STAGING_DIR_NATIVE} -stdlib=libc++"
+# Use libgcc for native parts
+LDFLAGS:append:runtime-llvm = " -stdlib=libc++ -rtlib=libgcc -unwindlib=libgcc"
+BUILD_LDFLAGS:append:runtime-llvm = " -stdlib=libc++ -rtlib=libgcc -unwindlib=libgcc"
+DEPENDS:append = " clang-native"
+BUILD_CC  = "${CCACHE}clang -isysroot=${STAGING_DIR_NATIVE}"
+BUILD_CXX = "${CCACHE}clang++ -isysroot=${STAGING_DIR_NATIVE}"
+BUILD_CPP = "${CCACHE}clang -isysroot=${STAGING_DIR_NATIVE} -E"
+BUILD_CCLD = "${CCACHE}clang"
+BUILD_RANLIB = "llvm-ranlib"
+BUILD_AR = "llvm-ar"
+BUILD_NM = "llvm-nm"

