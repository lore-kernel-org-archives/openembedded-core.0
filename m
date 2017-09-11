Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id EE1FE7841E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 18:29:52 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id o77so5915028qke.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 11:29:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=nsD/DuImHPHnlZYJED18s3blPpithuL42ldgkXHh61M=;
	b=jrEbrLucT0fOrgV4mYmtinjYQJlgqJbYw85Vesf94IhI3LDBAI9F9MWQ77rX66I7gr
	PhFGdHDGSMcrPQ4TdV/AFAkn/wZ/tO0QKsjQNMqZNbFJR6p5gT0Z7gQFlpbgNTdxNLHd
	AUli53zrXY4lqquBZ1pa5zBlub46P5vI8FJaoC0nuzUyTq7HeWz3+k8KfUeGZDge6IpO
	stPg7+zCj0zBB7DcavB3gd2JseiBwXEZY7CYzgkOsu74dmcrkIki0twYBa5JBZ8hIge5
	x4scfwpic/LU8QFZ87AX/zu0eI1Fw/mKMFNtEvXfqflJiYmgrYZT/IVH8zSWw6aF4vu3
	ntRw==
X-Gm-Message-State: AHPjjUgjdpO3dSN9UyWfHnpD4j+l0gCDJwRps7jBZDd85QpNsjeTul/U
	WWXsHrwfZ9FRgVX6
X-Google-Smtp-Source: AOwi7QAQV6ktbLgAakO1ZEp7y90H7fEdHQiSQGeOHl78sEN5uHGXqTn8AEc7iwbUk4ThX5T7seYXKg==
X-Received: by 10.55.217.68 with SMTP id u65mr12621677qki.300.1505154593791;
	Mon, 11 Sep 2017 11:29:53 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	m31sm4400336qtf.55.2017.09.11.11.29.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Sep 2017 11:29:53 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 11 Sep 2017 15:29:46 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Sep 2017 15:28:47 -0300
Message-Id: <20170911182853.11076-7-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170911182853.11076-1-otavio@ossystems.com.br>
References: <20170911182853.11076-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v7 06/12] go.bbclass: clean up CGO_xxx settings
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
X-List-Received-Date: Mon, 11 Sep 2017 18:29:53 -0000

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

Changes in v7: None
Changes in v6:
- new patch

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


