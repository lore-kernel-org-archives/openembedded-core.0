Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7684C78220
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 12:48:04 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id l25so2578059qtf.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 05:48:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=lbEr7vJIRGLxCiUqqHkjsOTt4oXJnTJYYzEPjuCXEoY=;
	b=ftuIKUS3XueivZ5yqfR4Wxx+NQ94pBNSbuv9wPoUXwTlKz8JjZkBjHyoFUAjieBtKQ
	zgSDHUbf47MlTcmPLbUfRbDYvX37H5i+t/xqac76TFckGgSp2r1/tgm0xWJHbKrA6iZx
	Zc3QkUZS0HLdGOgNaJwaNiaoyvU6o7TZKZOEFzMLmVSlPlRCHOztOi9KWNeDnVfQI7NP
	4B+XnXdaUvRCUfg91WkNpSG0WwDGTJaRurmsvbXVIbdbGIlgULPVC33zTLE1OypWLOQb
	w4j7juBt21xCt3V+hdtme/326Z9Lo0EP7Le+t69ztgh3oyYVq65po4HOTjy3HJnCAUSg
	mJ/g==
X-Gm-Message-State: AHPjjUiMOsz1ox8Zf3MHoUKAsTt9mtLEvvTtrwPrYviR0RW6uDNz6WKm
	6llCrbhce8RMn5nH
X-Google-Smtp-Source: AOwi7QCiYChyE76blSc2g6vxAQt3Sqx5RZfzKaEuALk5Xt6oplks0GsXvPJ/MPv61Ystw2eAQlgp7Q==
X-Received: by 10.200.45.73 with SMTP id o9mr15244155qta.292.1505134086083;
	Mon, 11 Sep 2017 05:48:06 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id x47sm6084986qtx.8.2017.09.11.05.48.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Sep 2017 05:48:05 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 11 Sep 2017 09:48:00 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Sep 2017 09:45:52 -0300
Message-Id: <20170911124558.2863-21-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170911124558.2863-1-otavio@ossystems.com.br>
References: <20170911124558.2863-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 20/26] go.bbclass: clean up CGO_xxx settings
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
X-List-Received-Date: Mon, 11 Sep 2017 12:48:05 -0000

From: Matt Madison <matt@madison.systems>

* use conditional assignment for  the CGO_xxx
  variables, so they can be overridden more easily
* remove the TOOLCHAIN_OPTIONS and TARGET_CC_ARCH
  references, since those are already present in
  CC and CXX
* remove the TARGET_ prefix so the values are
  appropriate for native, nativesdk, etc. builds
* move the GOROOT export away from the CGO settings
  and closer to its definition

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v6:
- new patch

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 meta/classes/go.bbclass | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index c0b117d155..8fb41e5c09 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -21,6 +21,7 @@ GO_PARALLEL_BUILD ?= "${@get_go_parallel_make(d)}"
 
 GOROOT_class-native = "${STAGING_LIBDIR_NATIVE}/go"
 GOROOT = "${STAGING_LIBDIR}/go"
+export GOROOT
 export GOROOT_FINAL = "${libdir}/go"
 
 DEPENDS_GOLANG_class-target = "virtual/${TARGET_PREFIX}go virtual/${TARGET_PREFIX}go-runtime"
@@ -35,12 +36,12 @@ export GO = "${HOST_PREFIX}go"
 GOTOOLDIR = "${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go/pkg/tool/${BUILD_GOTUPLE}"
 GOTOOLDIR_class-native = "${STAGING_LIBDIR_NATIVE}/go/pkg/tool/${BUILD_GOTUPLE}"
 export GOTOOLDIR
-export CGO_ENABLED = "1"
-export GOROOT
-export CGO_CFLAGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS} ${TARGET_CFLAGS}"
-export CGO_CPPFLAGS = "${TARGET_CPPFLAGS}"
-export CGO_CXXFLAGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS} ${TARGET_CXXFLAGS}"
-export CGO_LDFLAGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS} ${TARGET_LDFLAGS}"
+
+export CGO_ENABLED ?= "1"
+export CGO_CFLAGS ?= "${CFLAGS}"
+export CGO_CPPFLAGS ?= "${CPPFLAGS}"
+export CGO_CXXFLAGS ?= "${CXXFLAGS}"
+export CGO_LDFLAGS ?= "${LDFLAGS}"
 
 GO_INSTALL ?= "${GO_IMPORT}/..."
 GO_INSTALL_FILTEROUT ?= "${GO_IMPORT}/vendor/"
-- 
2.14.1


