Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id 18F317920E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Aug 2018 19:25:48 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id i26-v6so4887958pfo.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Aug 2018 12:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qZM+k1KU8s7xfQtdaD63yjEtMmugyH6RnXDLGMxs+5U=;
	b=V3Eqr6OUN0RG1tHfA8LfScGhKnNHeBuEmzwUyRqRmwSZaeDUqdmgBusncmliTwHdZE
	qTqMIOuefzHVuXWUh3/LOPQsQ0nUXQtdqreeevgTvNAQi3TAIDEtp7wWxcoGAnPFBYPY
	U+noijIyetk1eaxFd2S1v8B94nAOlGxUqWrAGWjTsXW4yiv3TQBH4KFSfCYrlzM6VrnO
	HFqB9tybCsNZMCd6sRpIHRi7wO87aHMN6KLs3iwuuVUFwJxGqqAGfgWFLgjOBnwli9Rp
	w8Qe6aqJhERYkpcI8D4mYb+Ltpn23X9Q/dW7QksMmR7GVxEW6f/p62Se2k64g19MgcYc
	s1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qZM+k1KU8s7xfQtdaD63yjEtMmugyH6RnXDLGMxs+5U=;
	b=JO6W8T35Gtguoqm95P5rvsLPFke2dqm/5DajTvFYP3HzWxjcd1arMnWa/i1NG4+3KF
	xPQl/GM7P9/CFjZ292GtDaxG1BWHW5JlRd4Untoy0RcdXNxGDOkuQHkv4vPru5BSYMFB
	/eOpIEkR395sLYDlxLLFjfNBZpSReiY4svRb+WIx6MKKEJ+awG3z8+U/N3qcSpAcsu6T
	zcjtBFsr5UNGrdMmm0HMxlESTpfU4K7+b7fRt1Jj3kW6xgteS2/1t9xa/8NVwrYw2TsR
	ZwbDnmFQHt6XuLFSCjy+ex2H4la0Rzn4dZrgOQNbGYn+fxjaZhJq7VjIyC8CBg6wIPb2
	WKJw==
X-Gm-Message-State: AOUpUlFMu5AleMrXXzIv+atNEWrRjBKnGFTd29cTfXMeWSKNruJ623LP
	gcmlq8EbsiLmsYFhOx+bgs7ksQGn
X-Google-Smtp-Source: AA+uWPx345aNuP3e+1lKfGde4l5uuzKyHtpYUltFMkX62oPjZ6ECVE1022USTYdXoTLt8XeP9chDjA==
X-Received: by 2002:a62:4b48:: with SMTP id
	y69-v6mr41598250pfa.93.1534620348815; 
	Sat, 18 Aug 2018 12:25:48 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	k64-v6sm6723068pgd.47.2018.08.18.12.25.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Aug 2018 12:25:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Aug 2018 12:25:35 -0700
Message-Id: <1b5dda703e10ab0f7286675cf5108b3909d2c6b8.1534620189.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1534620189.git.raj.khem@gmail.com>
References: <cover.1534620189.git.raj.khem@gmail.com>
Subject: [PATCH 3/6] llvm: Point llvm-config to one built with llvm-native
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
X-List-Received-Date: Sat, 18 Aug 2018 19:25:48 -0000

If not defined, llvm build system tries to build one
which then confuses the OE QA system since its building
native tool and target packages in same package build
moreover it is not required since we already have it via
llvm-native

Fixes
ERROR: llvm-6.0-r0 do_package_qa: QA Issue: llvm: The compile log indicates that host include and/or library paths were used.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index bb83012231..d853d4151d 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -64,17 +64,19 @@ EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DLLVM_ENABLE_FFI=ON \
                   -DFFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi) \
                   -DLLVM_OPTIMIZED_TABLEGEN=ON \
-                  -DLLVM_TARGETS_TO_BUILD="${LLVM_TARGETS}" \
+                  -DLLVM_TARGETS_TO_BUILD='${LLVM_TARGETS}' \
                   -G Ninja"
 
 EXTRA_OECMAKE_append_class-target = "\
                   -DCMAKE_CROSSCOMPILING:BOOL=ON \
                   -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen${PV} \
+                  -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
                  "
 
 EXTRA_OECMAKE_append_class-nativesdk = "\
                   -DCMAKE_CROSSCOMPILING:BOOL=ON \
                   -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen${PV} \
+                  -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
                  "
 
 do_configure_prepend() {
-- 
2.18.0


