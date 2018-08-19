Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 44A3579229
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 17:23:51 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id f1-v6so5643598pgq.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 10:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qZM+k1KU8s7xfQtdaD63yjEtMmugyH6RnXDLGMxs+5U=;
	b=Ka+KVNpITpo4cw6Lb3dbD+0eLxM30Cv5WJeYAg777uJmeeSZeHNTvBm5019Crl3GRz
	7pXzuY0wDLmyqqlQxcpF2iFpeZMM53BPeK+VgmbLgdr5Y9Te9hIIl+1Rg4rnh3BUZtEc
	knYHTQ0BnorVFuBxytJFMcEjUbIwfXjx879NkXKprQxiygCtIygOl1+VHXLKzqKnwTVf
	Ih25qlDHFp7iK+SBp4XdbN9BqISIB8aV1J72H1gt8jB8Gp8ilaK/EDQR1f0Epc1YeQ2+
	EmissN7W0V0SE3CGtQfFjgqS6JhqrgU0ZV2SpRtA6A7mU6l+dj0Sau3GviJcma1wwG16
	eyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qZM+k1KU8s7xfQtdaD63yjEtMmugyH6RnXDLGMxs+5U=;
	b=lALoox8yj+l2SGZ7WuzOFzkIfM+gV+Qsx8Hb6r4XOpyACrKuXoU8htMSe/bhyAlChp
	MruV8A4NhFZu0+fDAs1SsEh6Gys7jIzpbth/XUgRP87XxG7NjCUICNy8UuZdJ02+3/oa
	WQsGaVOmyZ7KaZqfJN/gyv52/sHX6ofs5ouX3jwlStIA7QCP32gixWfnBDpMcsD6IVmz
	6InML1bgeeRZvGupM4FXym758mqVGIEPPgWcn22WI3es21oIuQ1fWZdqe6qbnm+xKaKX
	Dxd5pcA2r7TCTOpz4QVfoUNuJ1rpAnKVqP2gpQz6JTs2MotMT7vU45whNQdMXX5IKnOz
	sW8w==
X-Gm-Message-State: AOUpUlGBv/oA0DYIpwOhuSfz8JO6kCL0MQZIKpBRkptZifOi6KKvhvbv
	s9P4BBFgkEFf1RYiJy/CKpZRHhJZ
X-Google-Smtp-Source: AA+uWPy+1MwdEuw+WXKydy7LzuL66cvZAZU8vg0/1kr7HO5V7Uouy7n3cb330NkVquyMyhRHaGnSNA==
X-Received: by 2002:a63:fa18:: with SMTP id
	y24-v6mr40290645pgh.362.1534699432034; 
	Sun, 19 Aug 2018 10:23:52 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	x1-v6sm8293466pgr.59.2018.08.19.10.23.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Aug 2018 10:23:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Aug 2018 10:23:35 -0700
Message-Id: <5917b02b97e854be114bc0641d5c5a7dc07eef94.1534699224.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1534699224.git.raj.khem@gmail.com>
References: <cover.1534699224.git.raj.khem@gmail.com>
Subject: [PATCH 3/9] llvm: Point llvm-config to one built with llvm-native
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
X-List-Received-Date: Sun, 19 Aug 2018 17:23:51 -0000

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


