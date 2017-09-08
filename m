Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 445E078207
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 14:46:24 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id o77so1648848qke.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 07:46:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=qMbETIuNREH5eTzvD4QUBMLAEv4KCtphFgRmqSmOj/o=;
	b=tboWb+by26Mno31P0zaU6m2+GASvTiTzQXc3cq7jl4SsPYwu+1UgAEBovE2YgNqIph
	MBj9BMNx0M3h0uq+cRZ7CYK7dq1d/yDAeG5YcKjrCfCIronDoQKjQH/yj/HO2JkXdm8b
	Sr8jLlSVGgtNXuRL0imFN01Rt+FltyoO/740OLXmXiHGil/1/MdMM6Wa7zFD8g91hDom
	K5wsrMbuK9Mr/xKv24RiiKQHV8b96nRiC0vTRDXZyKugwg1IfBB+RVNqUerwvWtIa1kM
	TVsTK6AfMNZcVvSY6kS3tW2+Jy0wBNvekAr8J1AL3bhQJ4WvL+VYg7P5+fyf7CAfFZ9W
	KMlg==
X-Gm-Message-State: AHPjjUh+y6LpuwAc3c+2WaZ+g3UyJT7f7fU8+QpPyj+GAkizZlorNyTi
	FYsI/pKMmMq9T0G/
X-Google-Smtp-Source: AOwi7QBvBcvI4Wqy1KegWdFr1WIA6+ggoHyArOlCYBTGTpS9x5SAuhdb83yjhqq83w4dDg/yNe33Tw==
X-Received: by 10.55.17.15 with SMTP id b15mr4240288qkh.136.1504881986052;
	Fri, 08 Sep 2017 07:46:26 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id w23sm1446229qtj.0.2017.09.08.07.46.21
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 07:46:25 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 11:46:18 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 11:44:52 -0300
Message-Id: <20170908144454.14308-11-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908144454.14308-1-otavio@ossystems.com.br>
References: <20170908144454.14308-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v4 10/12] go.bbclass: Use an auxiliary variable to add the build dependencies
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
X-List-Received-Date: Fri, 08 Sep 2017 14:46:25 -0000

This is going to easy the addition of nativesdk and virtual providers
in the future.

This change is based on the meta-golang[1] layer. Thanks to Matt
Madison <matt@madison.systems> for his work on this.

1. https://github.com/madisongh/meta-golang

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v4: None
Changes in v3: None
Changes in v2: None

 meta/classes/go.bbclass | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 6df73bf377..82b5f83aa0 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -24,6 +24,11 @@ GOROOT = "${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
 GOBIN_FINAL_class-native = "${GOROOT_FINAL}/bin"
 GOBIN_FINAL = "${GOROOT_FINAL}/${GO_BUILD_BINDIR}"
 
+DEPENDS_GOLANG_class-target = "go-cross-${TARGET_ARCH}"
+DEPENDS_GOLANG_class-native = "go-native"
+
+DEPENDS_append = " ${DEPENDS_GOLANG}"
+
 export GOBUILDFLAGS ?= "-v"
 GOBUILDFLAGS_prepend_task-compile = "${GO_PARALLEL_BUILD} "
 
@@ -43,9 +48,6 @@ export CGO_CPPFLAGS = "${TARGET_CPPFLAGS}"
 export CGO_CXXFLAGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS} ${TARGET_CXXFLAGS}"
 export CGO_LDFLAGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS} ${TARGET_LDFLAGS}"
 
-DEPENDS += "go-cross-${TARGET_ARCH}"
-DEPENDS_class-native += "go-native"
-
 FILES_${PN}-staticdev += "${GOSRC_FINAL}/${GO_IMPORT}"
 FILES_${PN}-staticdev += "${GOPKG_FINAL}/${GO_IMPORT}*"
 
-- 
2.14.1


