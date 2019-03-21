Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
	[209.85.222.172])
	by mail.openembedded.org (Postfix) with ESMTP id 20CAD6D147
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 18:35:45 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id k130so16952685qke.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 11:35:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=1/5HlXeRnzj5BdD5Au6KVlE6f/NtBZNBo6+EnEjPz4s=;
	b=AJuoiTDwEfJKehu/BgwVVHBVyfMjAcnxWB9lJ9meNnIMo8eomgksMzS/0rhxME3VtL
	kTXYS6epNRU5jTsnJUPUmx1KThIiYxXpiN5OhbrRehx7gNandEa1eprNwRAcsWoG0J05
	hpyxolezD2cwLsD0u+adjIE0w//HXwG9WrHsNdl3Hcx3m5iyhBCSU1gPArtsdDd+CwYu
	nGJA/8JjTLlc2Bec1pOBNwpWfX+auJ+/74OFa+/J63n+7rajJnW0rUkM6t0m0ymkAX7+
	qvFoM1evaOeenOKbuwSNJLFVBG9VraMA/8ekGwxj88fQzu8swZVvSt2a47UPA3Utro9R
	mbhw==
X-Gm-Message-State: APjAAAUK9GcEt7DDYYIiFNBwtAVQN82FkwjCbDsdX2X0JIpyGjjuf+Cj
	yLywfr03z+fEtUT1VPTW23vapbxM
X-Google-Smtp-Source: APXvYqyiJIZqjWjhR+Mjf0lki4xy22tYeHp3Q8V7zyyshp1v4Qex4GOF32kjgQGahvtM222tCMxZQA==
X-Received: by 2002:a37:a557:: with SMTP id o84mr4005783qke.277.1553193346672; 
	Thu, 21 Mar 2019 11:35:46 -0700 (PDT)
Received: from localhost.localdomain ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id
	d21sm1328250qtc.91.2019.03.21.11.35.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 21 Mar 2019 11:35:45 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 21 Mar 2019 15:35:40 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Mar 2019 15:35:39 -0300
Message-Id: <20190321183539.18863-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] llvm: Enable RTTI support in preparation for new mesa
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
X-List-Received-Date: Thu, 21 Mar 2019 18:35:46 -0000
Content-Transfer-Encoding: 8bit

The mesa 19.0.0 release requires RTTI to allow the build of Nouveau
driver, which is enabled by default when building for x86 and x86-64
target.

This commit enables RTTI support so it prepares the toolchain for the
upcoming change.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-devtools/llvm/llvm_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index c68512cc63..d2ea927651 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -70,6 +70,7 @@ EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DLLVM_BINDINGS_LIST='' \
                   -DLLVM_LINK_LLVM_DYLIB=ON \
                   -DLLVM_ENABLE_FFI=ON \
+                  -DLLVM_ENABLE_RTTI=ON \
                   -DFFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi) \
                   -DLLVM_OPTIMIZED_TABLEGEN=ON \
                   -DLLVM_TARGETS_TO_BUILD='${LLVM_TARGETS}' \
-- 
2.21.0


