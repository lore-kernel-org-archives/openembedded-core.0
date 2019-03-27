Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id D47716C376
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 23:07:14 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id z11so1667674wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 16:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=UJcIxH16Y5VYKi4mR67I6FD62BzkynTwGkSlKHGEjms=;
	b=csolycW/K+qDx1L6jycne7aDZAl/a938DYgbVMzUucLzb37fzb5IqqG9gAdSHgbBIo
	/O0/2MtQag/oEQB+tbO9zVlVmPspR3HNvnHXx3bNxwI/sfbNfTWYAKpzyNyy1Mztxznn
	02x/KtT593h2uqpf+QdJMYFYo+F9ZxSDBQEUB3+kkOAIriwM0ur68FCIrmcAuI/zUERt
	CfG/uJWRe63wMQgZMNXj8DMLwPGFowZSm6WxQW5A8He9giqIOJQPRUSnXsHkB/RoM4WQ
	HWqZ8crFLlXeZmgd31D8X9ZFFpNNUkAVBd09oTBZj0JRRXsiIM8wd0k5WVbI8zrP06Z/
	U91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=UJcIxH16Y5VYKi4mR67I6FD62BzkynTwGkSlKHGEjms=;
	b=BpJS+ePlTkUvTZKE52FXQH1D5yGYz8ijussTCtIKLSITeNsWsLvnO6pdQTf5lnKw5g
	b+P+7+m8km4rpeGpHT5fJ8YSXwS9B4YfRkB/PfE4OJckil7K8azQXXIcEk1rhHd7egJJ
	LLGZaXJ9lQAk6h0k/uZxSclZkgUfuicPE24xw8UMv01UoKsgvS9QT0ohCFkgJ6lRzrvo
	Z+1JqJq73YMD3TbaEbv+vSq4tBJqMMccLm6/gDUCE/yGtLz2HkSOnBca0J/oeLlpabAH
	JfbkCx78fgRt5htD7WU5/iXaaUZcbGYx7NRpECXuR1YkrZSRNbiTf9tZcqfQvdCYZXtL
	BKmA==
X-Gm-Message-State: APjAAAWuqUyCgR8MpujNJO8fR5ouNOayldw9ZeV1IwPnlHtU5LmUbm6Z
	UcFTcXWt6plr5j9UykODweHQ8wK4kPw=
X-Google-Smtp-Source: APXvYqxkN8a9nNrAN/MdbNypCLwuhmZ6/EnT9uHrcxZJvY1JE/sHjYy45L21ox88DL3f4HjsY5UQWw==
X-Received: by 2002:a1c:9609:: with SMTP id y9mr11322016wmd.27.1553728035283; 
	Wed, 27 Mar 2019 16:07:15 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	t24sm1263617wmi.10.2019.03.27.16.07.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Mar 2019 16:07:14 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Mar 2019 23:07:11 +0000
Message-Id: <20190327230712.4930-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] llvm: doesn't actually need pythonnative
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
X-List-Received-Date: Wed, 27 Mar 2019 23:07:15 -0000

LLVM doesn't actually need pythonnative, the host Python2 is sufficient but
cmake's executable searching currently isn't reliable in cross-compilations.

Convince cmake by setting PYTHON_EXECUTABLE to point at python2 in the HOSTTOOLS
directory.  Note that currently LLVM *needs* python2 currently:

https://github.com/llvm-mirror/llvm/blob/master/CMakeLists.txt#L670

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index d2ea927651d..31abadcace5 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -12,7 +12,7 @@ DEPENDS = "libffi libxml2 zlib ninja-native llvm-native"
 
 RDEPENDS_${PN}_append_class-target = " ncurses-terminfo"
 
-inherit perlnative pythonnative cmake pkgconfig
+inherit perlnative cmake pkgconfig
 
 PROVIDES += "llvm${PV}"
 
@@ -74,6 +74,7 @@ EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DFFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi) \
                   -DLLVM_OPTIMIZED_TABLEGEN=ON \
                   -DLLVM_TARGETS_TO_BUILD='${LLVM_TARGETS}' \
+                  -DPYTHON_EXECUTABLE=${HOSTTOOLS_DIR}/python2 \
                   -G Ninja"
 
 EXTRA_OECMAKE_append_class-target = "\
-- 
2.11.0


