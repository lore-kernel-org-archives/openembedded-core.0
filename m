Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1347FC36005
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 18:04:07 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.145.1742580238762726334
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 11:03:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TtBp7pIT;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ff64550991so3183058a91.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 11:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742580238; x=1743185038; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XAwFIlp+JeNzR/vBVhkbpZqQljXl2yepHLlvG7YcC3I=;
        b=TtBp7pITBnpjp1CDgAPIIpRZO3UOr8DL3RoGxadlKZTJBIqsYpP1lE9r0PTbIM16/u
         iz0g3Fl2cvH8hZ9M2A4iLKyuhKN67RJuIYTZNl3AN+Hxnjw2HdvhcnPfz3moK5TiGZ6e
         DH7K2zEwlYJCuJJNMtPKzSN3aeUxIfoOyI2n8KTRTGtV2yCq6k+qorSIimhwNAlR1YGQ
         5DGXq+hnQ+pi919pTAlMgJeOHv6AMnDqtUThjH2qyVMpKTBcK8AnBrH0/xtuOK6JhWNT
         7CS0fBonstxjp1d+qeXIZCnxajE8Fds8HLC+rW9Dy9Rlgb/PalFtz7+ZXHwPa0IifUwD
         KuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742580238; x=1743185038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XAwFIlp+JeNzR/vBVhkbpZqQljXl2yepHLlvG7YcC3I=;
        b=hXs2FKYuwsCxtAiJb0pwVpoQSueEZHTdP+4rT2z79NnZrIMrtXW49bCJWTW3f92isj
         +EBjBS2hNL3P8XTzvIzRF1gsuKoWD905twsd6kPAUNSHEm+/4V2gUVO6m7Fwa3MLJ8Z8
         EcMn9sz1dRV4E836S195cUec2nwj9kxmbZRNxz16SGg/B0WfAV0dXRc2CNuYboPORRSh
         /Np3oyy43L8KhNTgsUXcNZCpIZa5HSmr64sQuFfy3DjvpLSlIesu+vGT1owCxirZ7zgS
         bPrYUJyoHvEf2IqoAkYLTG3vMLbp5TEi37zBNR0lJarbePZoWwZ+k1oVeXtNYWTeFwkc
         gztA==
X-Gm-Message-State: AOJu0YxQLjaC/mGLlIiYVa8OUSoFws0LmDJZ7MDt7sZ5kUBta1H92y/8
	xSQaPQSahbdUnUOr5yuCg8FuxTd9ILC9t6d08GzdFD2q9gyrJ5yhuWwRTHT1
X-Gm-Gg: ASbGncsaN0TY7WKdczuJ4AGIQVxT8AQGj6Yj/+kta7o5mnkDW3/ppgTvkUHg2qI5epY
	neI/3ZRv+07LnDgaJTIv1YlIGV4Vr++Y5n6ic8rL9ysM9D8EspnqHZTwh1XY/IyBYcuWo2ZKu6J
	5KPuG4x74O0cEWlyPeZ1eQIZP1jZ+UK4iZz+a7TFZXwZ4LGkgyL+DvZeL0vcuf1g7sH1qc/p3KD
	IqavwdrJDxKwGlxzI1vI6ul0WObJHYB+b7QqGAEgihKP0Oc4BcBahws38pkOTIeVP1dKyQzreRk
	6zdBYkQfijQF2ohptx1FAVRn5AmqC/rDtOx3
X-Google-Smtp-Source: AGHT+IG0W+EI70HYtfjyWcqbXOO7dnIslPh6hS0mLnm7wyC1LtYMcjT+SYG3He6Pl6c0BdZ1P2emxA==
X-Received: by 2002:a17:90b:51c1:b0:2ee:d63f:d8f with SMTP id 98e67ed59e1d1-3030fe9538fmr6871938a91.13.1742580237727;
        Fri, 21 Mar 2025 11:03:57 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3030f80707fsm2342905a91.48.2025.03.21.11.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 11:03:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] babeltrace2: Fix build with clang on 32bit hosts
Date: Fri, 21 Mar 2025 11:03:54 -0700
Message-ID: <20250321180355.1072128-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 18:04:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213485

clang-20 unveils more build issues

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ob_get_length-return-size_t-instead-.patch | 37 +++++++++++++++++++
 .../recipes-kernel/lttng/babeltrace2_2.1.0.bb |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch

diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch
new file mode 100644
index 00000000000..d923437a2ab
--- /dev/null
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch
@@ -0,0 +1,37 @@
+From 1b514ab2e878216426acc493eeab96088576faf9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 20 Mar 2025 18:10:08 -0700
+Subject: [PATCH] Make bt_field_blob_get_length return size_t instead of
+ uint64_t
+
+Fixes errors e.g.
+| ../../git/src/cpp-common/bt2/field.hpp:1139:82: error: non-constant-expression cannot be narrowed from type 'std::uint64_t' (aka 'unsigned long long') to 'size_type' (aka 'unsigned int') in initializer list [-Wc++11-narrowing]
+|  1139 |         return {internal::CommonBlobFieldSpec<LibObjT>::data(this->libObjPtr()), this->length()};
+|       |                                                                                  ^~~~~~~~~~~~~~
+| ../../git/src/plugins/ctf/common/src/msg-iter.cpp:744:56: note: in instantiation of member function 'bt2::CommonBlobField<bt_field>::data' requested here
+|   744 |     std::memcpy(&this->_stackTopCurSubField().asBlob().data()[_mCurBlobFieldDataOffset],
+|       |                                                        ^
+| ../../git/src/cpp-common/bt2/field.hpp:1139:82: note: insert an explicit cast to silence this issue
+|  1139 |         return {internal::CommonBlobFieldSpec<LibObjT>::data(this->libObjPtr()), this->length()};
+|       |                                                                                  ^~~~~~~~~~~~~~
+|       |                                                                                  static_cast<size_type>( )
+
+Upstream-Status: Submitted [https://github.com/efficios/babeltrace/pull/120]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/cpp-common/bt2/field.hpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/cpp-common/bt2/field.hpp b/src/cpp-common/bt2/field.hpp
+index 8b291f7a1..cbfff84f0 100644
+--- a/src/cpp-common/bt2/field.hpp
++++ b/src/cpp-common/bt2/field.hpp
+@@ -1139,7 +1139,7 @@ public:
+         return {internal::CommonBlobFieldSpec<LibObjT>::data(this->libObjPtr()), this->length()};
+     }
+ 
+-    std::uint64_t length() const noexcept
++    std::size_t length() const noexcept
+     {
+         return bt_field_blob_get_length(this->libObjPtr());
+     }
diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb b/meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
index bf9df2a32dd..a9a3a9961be 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.1;protocol=http
            file://0001-Make-manpages-multilib-identical.patch \
            file://0001-tests-fix-test-applications-in-cpp-common.patch \
            file://0001-tests-set-the-correct-plugin-directory.patch \
+           file://0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch \
            "
 SRCREV = "e61d41ff3c3ac6a123930d4e60cf710ff9ea18e0"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"

